<%@ Page Language="VB" AutoEventWireup="false" CodeFile="sm_history_back.aspx.vb" Inherits="aspx_stop_sm_history_back" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<title></title>
<style type="text/css">
        .outerPopup
        {
            background-color: Gray;
            padding: 1em 16px;
            border-style: solid;
            border-color:  Aqua;
            border-width: 1px;
        }
        .innerPopup
        {
            background-color: #fff;
        }
        .modalBackground1
        {
            background-color: #000;
            filter: alpha(opacity=70);
            opacity: 0.7;
        }
</style>
  
 <script src="../../js/jquery1.6.1.js" type="text/javascript"></script>
 <script src="../../js/common.js" type="text/javascript"></script>
 <script type="text/javascript">

        function refreshParent() {
            window.location = "sm_history.aspx";
        }

        function changeIframeSrcById(id, url, param) {
            var urlFull = "";
            var iframe = document.getElementById(id);
            if (param) {
                urlFull = url + "?" + param;
            } else {
                urlFull = url;
            }
            iframe.src = encodeURI(urlFull);
            //alert(iframe.src);
        }

        function concatParam(oldParam, addParamTag, addParamMyId, addParamKey) {
            var result = oldParam;
            var dom = null;

            if (addParamTag == "input") {
                dom = getEleByProperty(addParamTag, "myId", addParamMyId)
            } else if (addParamTag == "select") {

            }

            if (dom.value.length >= 1) {
                result = result + "&" + addParamKey + "=" + dom.value
            } else {
            }
            return result;
        }

        function updateHistory(IDEN, CIF) {
                try {
                            var popup = $find('mpeBehaviorEditProject');
                            //var popup = document.getElementById('mpeBehaviorEditProject');
                         
                            var myId = "IframeEditProject";
                            var url = "sm_update.aspx";

                            // Control ที่ส่งไปให้กับ Page ลูก เพื่อนำข้อมูลกลับมายังหน้าหลัก

                            var param = "PopupModal=mpeBehaviorEditProject";
                            // Parameter ที่ส่งไปให้กับ Page ลูก เพื่อนำข้อมูลกลับมายังหน้าหลัก 
                            //***********************************************************************************************
                            param = param + "&iden=" + IDEN;
                            param = param + "&cif=" + CIF;
           
                            changeIframeSrcById(myId
                                , url
                                , param
                            );
                            popup.show();
                       }
                 catch (ex) {
                            alert(ex.Message);
                }
        
        }

        function addHistory() {
            var myId = "IframeAddProject";
            var url = "sm_import.aspx";

            // Control ที่ส่งไปให้กับ Page ลูก เพื่อนำข้อมูลกลับมายังหน้าหลัก

            var param = "PopupModal=mpeBehaviorAddProject";

            param = param + "&Project_Code=" + '';
            changeIframeSrcById(myId
                , url
                , param
            );
        }

    </script>
</head>
<body>
    <form id="form1" runat="server">
    <asp:ScriptManager ID="ScriptManager1" runat="server" EnableScriptLocalization="true"
        EnableScriptGlobalization="true">
    </asp:ScriptManager>

    <div>
   
             <asp:SqlDataSource ID="SqlDataSourceDateIn" runat="server" 
            ConnectionString="<%$ ConnectionStrings:BAY01ConnectionString %>" 
             SelectCommand="SM.P_SM_HISTORY_SELECT_DATEIN"
             SelectCommandType="StoredProcedure">
             
             </asp:SqlDataSource>
                                            &nbsp;
                                            <asp:ImageButton ID="ImageButtonAddProject" runat="server" ImageUrl="../../images/qmv_bb_add.gif"
                                                Width="32" ToolTip="เพิ่มโครงการ" OnClientClick="addHistory(); return false;" />
        <br />
             <asp:Label ID="LabelDateIn" runat="server" Text="เลือกวันที่ข้อมูล"></asp:Label>
        &nbsp;<asp:DropDownList ID="DropDownListDateIn" runat="server"  AutoPostBack="true"
            DataSourceID="SqlDataSourceDateIn" 
            DataTextField="datein" 
            DataValueField="datein">
        </asp:DropDownList>
   
        <asp:SqlDataSource ID="SqlDataSourceHistory" runat="server" 
             ConnectionString="<%$ ConnectionStrings:BAY01ConnectionString %>" 
             SelectCommandType="StoredProcedure"
             SelectCommand="SM.P_SM_HISTORY_SELECT_BY_DATEIN">
        <SelectParameters>
            <asp:ControlParameter ControlID="DropDownListDateIn" Name="DateIn" 
                PropertyName="SelectedValue" Type="String" />
        </SelectParameters>
        </asp:SqlDataSource>
             <asp:ImageButton ID="ImageButtonReturnMainPage" runat="server" ImageUrl="../../images/refreash_icon.jpg"
                                                OnClientClick="refreshParent(); return false;" ToolTip="กลับไปหน้าก่อนนี้" Width="32" />
      <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" 
            BackColor="White" BorderColor="#DEDFDE" BorderStyle="None" BorderWidth="1px" 
            CellPadding="4" DataSourceID="SqlDataSourceHistory" EnableModelValidation="True" 
            ForeColor="Black" GridLines="Vertical" AllowPaging="True" 
            AllowSorting="True" DataKeyNames="IDEN" style="font-size: small">
            <AlternatingRowStyle BackColor="White" />
            <Columns>
                <asp:BoundField DataField="IDEN" HeaderText="IDEN" InsertVisible="False" 
                    ReadOnly="True" SortExpression="IDEN" />
                <asp:BoundField DataField="CIF" HeaderText="CIF" SortExpression="CIF" />
                <asp:BoundField DataField="CustomerSize" HeaderText="CustomerSize" 
                    SortExpression="CustomerSize" />
                <asp:BoundField DataField="DPD" HeaderText="DPD" SortExpression="DPD" />
                <asp:BoundField DataField="Prin" HeaderText="Prin" SortExpression="Prin" />
                <asp:BoundField DataField="MoveForm" HeaderText="MoveForm" 
                    SortExpression="MoveForm" />
                <asp:BoundField DataField="DateIn" HeaderText="DateIn" 
                    SortExpression="DateIn" />
                <asp:BoundField DataField="COMMENT" HeaderText="COMMENT" 
                    SortExpression="COMMENT" />
                <asp:TemplateField>
                    <ItemTemplate>
                       <asp:Button ID="ButtonEdit" runat="server" Text="Edit" OnClientClick='<%# "updateHistory(""" +Eval("IDEN").toString()+ """,""" +Eval("CIF").toString()+ """); return false;" %>' />
                   </ItemTemplate>
                </asp:TemplateField>

            </Columns>
            <FooterStyle BackColor="#CCCC99" />
            <HeaderStyle BackColor="#6B696B" Font-Bold="True" ForeColor="White" />
            <PagerStyle BackColor="#F7F7DE" ForeColor="Black" HorizontalAlign="Right" />
            <RowStyle BackColor="#F7F7DE" />
            <SelectedRowStyle BackColor="#CE5D5A" Font-Bold="True" ForeColor="White" />
        </asp:GridView>

                 <cc1:ModalPopupExtender ID="ModalPopupExtenderAddProject" runat="server" TargetControlID="ImageButtonAddProject"
                    CancelControlID="ImageButtonCloseAdd" RepositionMode="RepositionOnWindowResize"
                    PopupControlID="panelAddProject" BackgroundCssClass="modalBackground1" BehaviorID="mpeBehaviorAddProject">
                </cc1:ModalPopupExtender>
                <cc1:RoundedCornersExtender ID="RoundedCornersExtenderAddProject" runat="server"
                    TargetControlID="pnlInnerPopupAddProject" BorderColor="black" Radius="4">
                </cc1:RoundedCornersExtender>
                <asp:Panel ID="panelAddProject" runat="server" CssClass="outerPopup" Style="display: none;">  
                   <asp:ImageButton ID="ImageButtonCloseAdd" runat="server" ImageUrl="../../images/qmv_bb_delete.gif" 
                     ImageAlign="TextTop"/>
                    <asp:Panel ID="pnlInnerPopupAddProject" runat="server" Width="620px" CssClass="innerPopup">
                      
                        <iframe id="IframeAddProject" src="" width="620" height="200" frameborder="0" scrolling="auto">
                        </iframe>
                    </asp:Panel>
                </asp:Panel>

                             
                <cc1:ModalPopupExtender ID="ModalPopupExtenderEditProject" runat="server" TargetControlID="ImageButtonAddProject"
                    PopupControlID="panelEditProject" BackgroundCssClass="modalBackground1" BehaviorID="mpeBehaviorEditProject">
                </cc1:ModalPopupExtender>
                <cc1:RoundedCornersExtender ID="RoundedCornersExtenderEditProject" runat="server"
                    TargetControlID="pnlInnerPopupEditProject" BorderColor="black" Radius="4">
                </cc1:RoundedCornersExtender>
                <asp:Panel ID="panelEditProject" runat="server" CssClass="outerPopup" Style="display: none;">
                    <asp:Panel ID="pnlInnerPopupEditProject" runat="server" Width="620px" CssClass="innerPopup">
                        <iframe id="IframeEditProject" src="" width="620" height="200" frameborder="0"
                            scrolling="auto"></iframe>
                    </asp:Panel>
                    <div style="white-space: nowrap; text-align: center;">
                    </div>
                </asp:Panel>
           
    </div>
    </form>
</body>
</html>
