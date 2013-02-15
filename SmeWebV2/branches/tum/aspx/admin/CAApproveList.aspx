<%@ Page Title="CA Approve List" Language="VB" MasterPageFile="~/MasterPage.master"
    AutoEventWireup="false" CodeFile="CAApproveList.aspx.vb" Inherits="CAApproveList"
    EnableEventValidation="false" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<%@ Register Src="../../Controls/ExportControl/ExportControl.ascx" TagName="ExportControl"
    TagPrefix="uc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <link href="../../theme/MyStyleSheet.css" rel="stylesheet" type="text/css" />
    <style type="text/css">
        .mappingAll
        {
            color: #007700;
        }
    </style>
    <style type="text/css">
        /*Modal Popup*/
        .modalBackground
        {
            background-color: Gray;
            filter: alpha(opacity=70);
            opacity: 0.7;
        }

        .modalPopup
        {
            background-color: #ffffdd;
            border-width: 3px;
            border-style: solid;
            border-color: Gray;
            padding: 3px;
        }
    </style>
    <script type="text/javascript">
        //use Ext library
        //iframe ต้องมี property myid
        function changeIframeSrc(myid, url, param) {
            var iframe = Ext.select("iframe[myid=" + myid + "]");
            changeIframeSrcById(iframe.item(0).id, url, param);
        }

        function changeIframeSrcById(id, url, param) {
            var urlFull = "";

            var iframe = document.getElementById(id);

            if (param) {
                urlFull = url + "?" + param;
            } else {
                urlFull = url;
            }

            iframe.src = urlFull;
        }

        function changeIframe(leader1CAOldId) {
            //reset width height

            changeIframeSrcById('iframeCLSList', '/smeweb/IframeLoader.aspx?url=/smeweb/aspx/admin/CLSListByCA.aspx', 'leader1CAOldId=' + leader1CAOldId);
            //changeIframeSrcById('iframeCLSListDummy', '/smeweb/IframeLoader.aspx?url=/smeweb/aspx/admin/CLSListByCA.aspx', 'leader1CAOldId=1001252010');
            Ext.select("input[myId=ButtonModal]").item(0).dom.click();
        }

        function setBlankIframe() {
            //changeIframeSrcById('iframeCLSList', '');
            //changeIframeSrcById('iframeCLSListDummy', '');
        }
    </script>
    <script type="text/javascript">
        Ext.onReady(function () {

        });

        function showHideDetail(sender, target) {
            if (target.hasClass('showDetial')) {
                target.replaceClass('showDetial', 'hideDetial');
                sender.src = "../../images/plus.gif";
            } else {
                target.replaceClass('hideDetial', 'showDetial');
                sender.src = "../../images/minus.gif";
            }
        }
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ScriptPlaceHolder" runat="Server">
    <asp:ScriptManager ID="ScriptManager1" runat="server" EnableScriptGlobalization="True">
    </asp:ScriptManager>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="ContentPlaceHolder2" runat="Server">
    <div id="divApprove">
        เลือกวันที่ Approve :
        <asp:TextBox ID="txtBoxApproveDate" runat="server"></asp:TextBox>
        <cc1:CalendarExtender ID="txtBoxApproveDate_CalendarExtender" runat="server" TargetControlID="txtBoxApproveDate">
        </cc1:CalendarExtender>
        ถึงวันที่ :
        <asp:TextBox ID="txtBoxApproveDateEnd" runat="server"></asp:TextBox>
        <cc1:CalendarExtender ID="txtBoxApproveDateEnd_CalendarExtender" runat="server" TargetControlID="txtBoxApproveDateEnd">
        </cc1:CalendarExtender>
        <asp:Button ID="btnSearch" runat="server" Text="Search" />
        <uc1:ExportControl ID="ExportControl1" runat="server" ControlName="GridViewCAByApproveDate"
            AutoGenerateColumns="False" />
    </div>
    <asp:GridView ID="GridViewCAByApproveDate" runat="server" AutoGenerateColumns="False"
        CellPadding="4" DataSourceID="ODS_CAByApproveDate" ForeColor="#333333" AllowPaging="True"
        Width="100%" DataKeyNames="OLD_ID" GridLines="Vertical">
        <PagerSettings Mode="NumericFirstLast" />
        <RowStyle BackColor="#EFF3FB" />
        <Columns>
            <asp:TemplateField HeaderText="OLD_ID" SortExpression="OLD_ID" Visible="False">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBoxOLD_ID" runat="server" Text='<%# Bind("OLD_ID") %>'></asp:TextBox>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="LabelOLD_ID" runat="server" Text='<%# Bind("OLD_ID") %>'></asp:Label>
                </ItemTemplate>
                <ItemStyle HorizontalAlign="Center" />
            </asp:TemplateField>
            <asp:TemplateField HeaderText="CA NO ID" SortExpression="CA_NO_ID" ItemStyle-Width="12ex">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBoxCA_NO_ID" runat="server" Text='<%# Bind("CA_NO_ID") %>'></asp:TextBox>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="LabelCA_NO_ID" runat="server" Text='<%# Bind("CA_NO_ID") %>' Visible="false"></asp:Label>
                    <asp:LinkButton ID="LinkButtonCA_NO_IDShow" runat="server" OnClientClick='<%# "var creditPopup = window.open(""../annals/annalscredit.aspx?annals_id=" + Eval("OLD_ID") + """,""creditPopup"",""toolbar=No,resizable=yes,scrollbars=yes"");creditPopup.focus();return false;" %>'></asp:LinkButton>
                    <%--<img id="imgShowHideDetail<%# Eval("OLD_ID") %>" alt="showHideDetail<%# Eval("OLD_ID") %>"
                        src="../../images/plus.gif"
                        onclick="showHideDetail(this,Ext.get('tdDetail<%# Eval("OLD_ID")%>'));" />--%>
                </ItemTemplate>
                <ItemStyle HorizontalAlign="Right" Wrap="False" />
            </asp:TemplateField>
            <asp:BoundField DataField="REFERENCE" HeaderText="REFERENCE" SortExpression="REFERENCE">
                <ItemStyle HorizontalAlign="Left" />
            </asp:BoundField>
            <asp:BoundField DataField="OLD_VALUEs" DataFormatString="{0:#,###.##}" HeaderText="OLD VALUEs"
                SortExpression="OLD_VALUEs" Visible="False">
                <ItemStyle HorizontalAlign="Right" />
            </asp:BoundField>
            <asp:BoundField DataField="RM_VALUEs" DataFormatString="{0:#,###.##}" HeaderText="RM VALUEs"
                SortExpression="RM_VALUEs" Visible="False">
                <ItemStyle HorizontalAlign="Right" />
            </asp:BoundField>
            <asp:BoundField DataField="CM_VALUEs" DataFormatString="{0:#,###.##}" HeaderText="CM VALUEs"
                SortExpression="CM_VALUEs" Visible="False">
                <ItemStyle HorizontalAlign="Right" />
            </asp:BoundField>
            <asp:BoundField DataField="APPROVE_VALUEs" DataFormatString="{0:#,###.##}" HeaderText="APPROVE VALUEs"
                SortExpression="APPROVE_VALUEs">
                <ItemStyle HorizontalAlign="Right" />
            </asp:BoundField>
            <asp:TemplateField HeaderText="APPROVE DATE" SortExpression="APPROVE_DATE">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBoxAPPROVE_DATE" runat="server" Text='<%# Bind("APPROVE_DATE") %>'></asp:TextBox>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="LabelAPPROVE_DATE" runat="server" Text='<%# Bind("APPROVE_DATE", "{0:dd/MM/yyyy HH:mm:ss}") %>'></asp:Label>
                </ItemTemplate>
                <ItemStyle HorizontalAlign="Center" Wrap="False" />
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Not Mapping">
                <ItemTemplate>
                    <asp:LinkButton ID="LinkButtonCountNullMappingStatus" runat="server" Text='<%# Eval("CountNullMappingStatus") %>'
                        OnClientClick='<%# "changeIframe(" + Eval("OLD_ID") + ");return false;" %>'></asp:LinkButton>
                </ItemTemplate>
                <ItemStyle HorizontalAlign="Center" Wrap="False" />
            </asp:TemplateField>
        </Columns>
        <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
        <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
        <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
        <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" Wrap="False" />
        <EditRowStyle BackColor="#2461BF" />
        <AlternatingRowStyle BackColor="White" />
    </asp:GridView>
    <asp:ObjectDataSource ID="ODS_CAByApproveDate" runat="server" OldValuesParameterFormatString="original_{0}"
        SelectMethod="getCreditCAByApproveDate" TypeName="CheckDrawn.business.CheckDrawnBO">
        <SelectParameters>
            <asp:ControlParameter ControlID="txtBoxApproveDate" Name="approveDateNoTimeStart"
                PropertyName="Text" Type="String" />
            <asp:ControlParameter ControlID="txtBoxApproveDateEnd" Name="approveDateNoTimeEnd"
                PropertyName="Text" Type="String" />
        </SelectParameters>
    </asp:ObjectDataSource>
    <asp:Panel ID="PanelCLSList" runat="server" Style="display: none" CssClass="modalPopup">
        <iframe id="iframeCLSList" frameborder="0" width="1000px" height="300px" src="">
        </iframe>
        <div id="PanelButtons" style="display: block">
            <input id="btnOkay" type="button" value="Done" />
            <input id="btnCancel" type="button" value="Cancel" />
        </div>
    </asp:Panel>
    <asp:Button ID="ButtonReal" myId="ButtonModal" runat="server" Text="Button" Style="display: none;" />
    <cc1:ModalPopupExtender ID="PanelCLSList_ModalPopupExtender" runat="server" TargetControlID="ButtonReal"
        PopupControlID="PanelCLSList" BackgroundCssClass="modalBackground" OkControlID="btnOkay"
        CancelControlID="btnCancel" OnCancelScript="setBlankIframe()">
    </cc1:ModalPopupExtender>
</asp:Content>