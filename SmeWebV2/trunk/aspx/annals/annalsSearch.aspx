<%@ Page Title="Annals Search" Language="VB" MasterPageFile="~/MasterPage.master" AutoEventWireup="false" CodeFile="annalsSearch.aspx.vb" Inherits="aspx.annals.AnnalsSearch" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <script type="text/javascript">
        //ใช้สำหรับเปลี่ยน src ของ iframe
        function changeIframeSrc(iframeId, detailURL) {
            if (ele(iframeId)) {//function อยู่ใน common.js
                ele(iframeId).src = detailURL;
            }
        }

        function showDetail(targetId) {
            if (ele(targetId)) {//function อยู่ใน common.js
                show(targetId); //function อยู่ใน common.js
                ele(targetId).style.zIndex = 11; // เซ็ตให้อยู่เหนือ dom อื่นๆ
            }
        }

        function hideDetail(targetId) {
            //alert(ExtGetElementByProp("div", "clientId", "DetailPanel"));
            var realId = Ext.select('div[clientId=DetailPanel]:first').first().dom.id;
            if (ele(realId)) {
                hide(realId);
                ele(realId).style.zIndex = -1;
            }
//            if (ele(targetId)) {//function อยู่ใน common.js
//                hide(targetId); //function อยู่ใน common.js
//                ele(targetId).style.zIndex = -1; // เซ็ตให้อยู่ใต้ dom อื่นๆ
//            }
        }
    </script>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ScriptPlaceHolder" Runat="Server">
    <asp:ScriptManager ID="ScriptManager1" runat="server" EnableScriptGlobalization="True" EnableScriptLocalization="True">
    </asp:ScriptManager>
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
</asp:Content>

<asp:Content ID="Content4" ContentPlaceHolderID="ContentPlaceHolder2" Runat="Server">
    <div style="width:100%;text-align:center;">
        
        <asp:UpdateProgress ID="UpdateProgress1" runat="server" AssociatedUpdatePanelID="UpdatePanel1"
            DisplayAfter="0">
            <ProgressTemplate>
                <div class="loadingStyle" style="top:45%;">
                </div>
            </ProgressTemplate>
        </asp:UpdateProgress>
        
        <div style="text-align:center">
            ประเภทหนังสือ:
            <asp:DropDownList ID="ANNALS_TYPEFilter" runat="server" DataSourceID="AnnalsTypeDS" DataTextField="ANNALS_DESC" DataValueField="ANNALS_TYPE">
            </asp:DropDownList>
            <asp:SqlDataSource ID="AnnalsTypeDS" runat="server" ConnectionString="<%$ ConnectionStrings:BAY01ConnectionString %>"
                EnableCaching="True" SelectCommand="AnnalsType_Select" SelectCommandType="StoredProcedure">
            </asp:SqlDataSource>
            
            <asp:UpdatePanel ID="UpdatePanel2" runat="server" UpdateMode="Conditional">
                <ContentTemplate>
                
                    <table>
                        <tr>
                            <td align="center">
                                Filter:
                                <asp:DropDownList ID="ColumnNameDropDownList" runat="server" DataSourceID="ColumnNameDS" DataTextField="COLUMN_NAME" DataValueField="COLUMN_NAME" AutoPostBack="True">
                                </asp:DropDownList>
                                <asp:TextBox ID="ColumnValueTextBox" runat="server"></asp:TextBox>
                                
                                <!-- &lt; = น้อยกว่า , &gt; = มากกว่า -->
                                <asp:DropDownList ID="TheOperatorDDL" runat="Server">
                                    <asp:ListItem Text="=" Value="="></asp:ListItem>
                                    <asp:ListItem Text="&lt;=" Value="&lt;="></asp:ListItem>
                                    <asp:ListItem Text="&gt;=" Value="&gt;="></asp:ListItem>
                                </asp:DropDownList>
                                <asp:TextBox ID="ColumnDateValueTextBox" runat="server"></asp:TextBox>
                                
                                <cc1:CalendarExtender ID="CalendarExtender1" runat="server" TargetControlID="ColumnDateValueTextBox" Format="dd/MM/yyyy">
                                </cc1:CalendarExtender>
                                <br />
                                <asp:Label ID="DetailLabel" runat="server" ForeColor="Red">ใส่เฉพาะเลขหนังสือโดยตัดเลข1ข้างหน้าออก 
                                เช่น 1<u>00040</u>/2551 ใส่ 00040</asp:Label>
                            </td>
                        </tr>
                    </table>    
            
                </ContentTemplate>
                <Triggers>
                    <asp:AsyncPostBackTrigger ControlID="ColumnNameDropDownList" EventName="SelectedIndexChanged" />
                </Triggers>
            </asp:UpdatePanel>
            
            <asp:SqlDataSource ID="ColumnNameDS" runat="server" ConnectionString="<%$ ConnectionStrings:BAY01ConnectionString %>" SelectCommand="GET_COLUMN_NAME" SelectCommandType="StoredProcedure" EnableCaching="True">
                <SelectParameters>
                    <asp:Parameter DefaultValue="ANNALS" Name="TABLE_NAME" Type="String" />
                </SelectParameters>
            </asp:SqlDataSource>
            &nbsp;
        </div>
        
        <asp:UpdatePanel ID="UpdatePanel1" runat="server" UpdateMode="Conditional">
            <ContentTemplate>
            
            <asp:Button ID="SearchButton" runat="server" Text="Search"/>
                
                <asp:HiddenField ID="FilterHiddenField" runat="server" />
                    
                <asp:GridView ID="AnnalsSearchGridView" runat="server" AutoGenerateColumns="False"
                    CellPadding="4" DataKeyNames="ANNALS_TYPE,ANNALS_SEQ_NO,ANNALS_YEAR" DataSourceID="AnnalsSearchDS"
                    ForeColor="#333333" GridLines="None" AllowPaging="True">
                    <PagerSettings Mode="NumericFirstLast" />
                    <FooterStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
                    <Columns>
                        <asp:TemplateField HeaderText="ANNALS_FULL_SEQ">
                            <ItemTemplate>
                                <asp:Label ID="ANNALS_FULL_SEQLabel" runat="server" Text='<%# Eval("ANNALS_TYPE") + Eval("ANNALS_SEQ_NO") + "/" + (CInt(Eval("ANNALS_YEAR"))+543).ToString() %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="SENDER" SortExpression="SENDER">
                            <EditItemTemplate>
                                <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("SENDER") %>' Font-Size="Medium" TextMode="MultiLine"></asp:TextBox>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="SenderLabel" runat="server" Text='<%# left(Eval("SENDER"),15) %>'></asp:Label>
                                <asp:Panel ID="SenderPanel" runat="server" HorizontalAlign="Center" BackColor="#C0FFC0" BorderColor="Black" Font-Bold="True" ForeColor="Navy" Wrap="False">
                                    <asp:Label ID="SenderLiteral" runat="server" Text='<%# Eval("SENDER") %>'></asp:Label>
                                </asp:Panel>
                                <cc1:PopupControlExtender ID="SenderPanelPopupControlExtender" runat="server" PopupControlID="SenderPanel"
                                    Position="Bottom" TargetControlID="SenderLabel" OffsetY="-10">
                                </cc1:PopupControlExtender>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="RECIVER" SortExpression="RECIVER">
                            <EditItemTemplate>
                                <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("RECIVER") %>' Font-Size="Medium" TextMode="MultiLine"></asp:TextBox>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="ReciverLabel" runat="server" Text='<%# left(Eval("RECIVER"),15) %>'></asp:Label>
                                <asp:Panel ID="ReciverPanel" runat="server" HorizontalAlign="Center" BackColor="#C0FFC0" BorderColor="Black" Font-Bold="True" ForeColor="Navy" Wrap="False">
                                    <asp:Literal ID="ReciverLiteral" runat="server" Text='<%# Eval("RECIVER") %>'></asp:Literal>
                                </asp:Panel>
                                <cc1:PopupControlExtender ID="ReciverPopupControlExtender" runat="server" PopupControlID="ReciverPanel"
                                    Position="Bottom" TargetControlID="ReciverLabel" OffsetY="-10">
                                </cc1:PopupControlExtender>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:BoundField DataField="HEADER" HeaderText="HEADER" SortExpression="HEADER" />
                        <asp:BoundField DataField="ANNALS_CREATE_DATE" HeaderText="ANNALS_CREATE_DATE" SortExpression="ANNALS_CREATE_DATE" />
                        <asp:TemplateField>
                            <ItemTemplate>
                                <asp:ImageButton ID="DetailImageButton" runat="server" 
                                OnClientClick='<%# "changeIframeSrc(""" + DetailIframe.ClientID + """,""annalsDetail.aspx?type=" + Eval("ANNALS_TYPE") + "&seq=" + Eval("ANNALS_SEQ_NO") + "&year=" + Eval("ANNALS_Year") + "&mode=divPopup"");showDetail(""" + DetailPanel.ClientID + """);" %>'
                                ImageUrl="~/images/Magnifying Glass.gif" 
                                CommandName="SELECT"/>
                            </ItemTemplate>
                            <HeaderTemplate>
                                Detail
                            </HeaderTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField Visible="False">
                            <HeaderTemplate>
                                Credit
                            </HeaderTemplate>
                            <ItemTemplate>
                                <asp:ImageButton ID="ImageButton1" runat="server" Visible='<%# Eval("ANNALS_TYPE").equals("1") %>' PostBackUrl='<%# "annalscredit.aspx?annals_id=" + Eval("ANNALS_TYPE") + Eval("ANNALS_SEQ_NO") + Eval("ANNALS_YEAR") %>' ImageUrl="~/images/word.gif" />
                            </ItemTemplate>
                        </asp:TemplateField>
                    </Columns>
                    <RowStyle BackColor="#FFFBD6" ForeColor="#333333" />
                    <SelectedRowStyle BackColor="#FFCC66" Font-Bold="True" ForeColor="Navy" />
                    <PagerStyle BackColor="#FFCC66" ForeColor="#333333" HorizontalAlign="Center" />
                    <HeaderStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
                    <AlternatingRowStyle BackColor="White" />
                </asp:GridView>
                
            </ContentTemplate>
        </asp:UpdatePanel>
        <!--OnClientClick='<%# "popup = window.open(""annalsDetail.aspx?type=" + Eval("ANNALS_TYPE") + "&seq=" + Eval("ANNALS_SEQ_NO") + "&year=" + Eval("ANNALS_Year") + """,""DetailPopup"",""toolbar=No"");popup.focus();" %>'-->
    
        <asp:SqlDataSource ID="AnnalsSearchDS" runat="server" ConnectionString="<%$ ConnectionStrings:BAY01ConnectionString %>"
            SelectCommand="Annals_Search_Filter" SelectCommandType="StoredProcedure">
            <SelectParameters>
                <asp:ControlParameter ControlID="ANNALS_TYPEFilter" Name="ANNALS_TYPE" PropertyName="SelectedValue" />
                <asp:SessionParameter Name="EMP_ID" SessionField="EMP_ID" Type="String" />
                <asp:ControlParameter ControlID="FilterHiddenField" DefaultValue=" " Name="FILTER"
                    PropertyName="Value" Type="String" />
            </SelectParameters>
        </asp:SqlDataSource>
        
        <cc1:DragPanelExtender ID="DragPanelExtender1" runat="server" TargetControlID="DetailPanel">
        </cc1:DragPanelExtender>
        
        <asp:Panel ID="DetailPanel" clientId="DetailPanel" runat="server" Visible="true" BackColor="#E0E0E0" BorderColor="Black" style="position:absolute;visibility:hidden;z-index:11;" HorizontalAlign="Center" Wrap="False">
            <table>
                <tr>
                    <td align="right">
                        <asp:ImageButton ID="CloseDetailImgBt" runat="server" ImageUrl="~/images/close_button.gif" OnClientClick='hideDetail("DetailPanel");return false;'/>
                    </td>
                </tr>
                <tr>
                    <td>
                        <iframe id="DetailIframe" frameborder="0" src="" width="450" height="500" scrolling="yes" runat="server"></iframe>        
                    </td>
                </tr>
            </table>
            <asp:Button ID="CloseDetailBt" runat="server" Text="Close" OnClientClick='hideDetail("DetailPanel");return false;' />
        </asp:Panel>
    </div>
</asp:Content>
