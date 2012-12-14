<%@ Page Title="" Language="VB" MasterPageFile="~/MasterPage.master" AutoEventWireup="false" CodeFile="CACovenantReport.aspx.vb" Inherits="aspx_report_CACovenantReport" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ScriptPlaceHolder" Runat="Server">
    <asp:ScriptManager ID="ScriptManager1" runat="server" EnableScriptGlobalization="True"
        EnableScriptLocalization="True">
    </asp:ScriptManager>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="ContentPlaceHolder2" Runat="Server">
    <br />
    <asp:UpdateProgress ID="UpdateProgress1" runat="server" AssociatedUpdatePanelID="UpdatePanel1"
            DisplayAfter="0">
            <ProgressTemplate>
                <div class="loadingStyle" style="width:199px;height:64px;top: 25%;left:43%;background-image: url(../../images/progress/rectangle/3MA_loadingcontent.gif);">
                </div>
            </ProgressTemplate>
        </asp:UpdateProgress>
    <asp:UpdatePanel ID="UpdatePanel1" runat="server" UpdateMode="Always">
        <ContentTemplate>
            <table width="100%">
                <tr>
                    <td align="center">
                        <asp:Label ID="Label_Header" runat="server" Text="กลุ่มงาน : "></asp:Label>
                        <asp:DropDownList ID="DDL_CATEGORY" runat="server" AutoPostBack="True" DataSourceID="DS_CATEGORY_GROUPING"
                            DataTextField="CATEGORY_DESC" 
                            DataValueField="CATEGORY_KEY">
                        </asp:DropDownList>
                        <asp:SqlDataSource ID="DS_CATEGORY_GROUPING" runat="server" ConnectionString="<%$ ConnectionStrings:BAY01ConnectionString %>"
                            SelectCommand="CA_REPORT.P_COVENANT_REPORT_LEVEL_DROPDOWN" 
                            SelectCommandType="StoredProcedure">
                            <SelectParameters>
                                <asp:SessionParameter Name="EMP_ID" SessionField="EMP_ID" Type="String" 
                                     />
                                <asp:QueryStringParameter DefaultValue="no" Name="SINGLE" QueryStringField="single"
                                    Type="String" />
                            </SelectParameters>
                        </asp:SqlDataSource>
                    </td>
                </tr>
                <tr>
                    <td>
                        &nbsp;
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:GridView ID="GV_COVENANT_REPORT" runat="server" AllowPaging="True" AllowSorting="True"
                            AutoGenerateColumns="False" CellPadding="4" 
                            DataSourceID="DS_COVENANT_REPORT" ForeColor="#333333"
                            Width="100%" Font-Size="Small" DataKeyNames="IDEN">
                            <RowStyle BackColor="#EFF3FB" />
                            <Columns>
                                <asp:BoundField DataField="IDEN" HeaderText="IDEN"
                                    ReadOnly="True" SortExpression="IDEN" Visible="False">
                                </asp:BoundField>
                                
                                <asp:TemplateField HeaderText="&nbsp;" SortExpression="REPORT_FLAG" Visible="False">
                                    <ItemTemplate>
                                        <asp:Label ID="Label2" runat="server" Text='<%# Bind("REPORT_FLAG") %>'></asp:Label>
                                    </ItemTemplate>
                                    <EditItemTemplate>
                                        <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("REPORT_FLAG") %>'></asp:TextBox>
                                    </EditItemTemplate>
                                </asp:TemplateField>
                                
                                <asp:TemplateField ShowHeader="False">
                                    <ItemTemplate>
                                        <asp:ImageButton ID="ImgBt_Select" runat="server" ImageUrl="~/images/word.gif" CausesValidation="false"
                                            AlternateText="Detail" OnClientClick='<%# "var covenantPopup = window.open(""" + Page.ResolveUrl("~/aspx/annals/AnnalsCovenant.aspx?id=") + Eval("ID").toString() + """,""covenantPopup"",""toolbar=No,resizable=yes,scrollbars=yes"");creditPopup.focus();return false;" %>' />
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="เลขที่หนังสือ" SortExpression="ID" >
                                    <ItemTemplate>
                                        <asp:Label ID="Label4" runat="server" Text='<%# Bind("ID","{0:######/####}") %>'></asp:Label>
                                    </ItemTemplate>
                                    <EditItemTemplate>
                                        <asp:TextBox ID="TextBox4" runat="server" Text='<%# Bind("ID","{0:######/####}") %>'></asp:TextBox>
                                    </EditItemTemplate>
                                </asp:TemplateField>
                                
                                <asp:BoundField DataField="CIF" HeaderText="CIF" SortExpression="CIF" Visible="False">
                                </asp:BoundField>
                                <asp:TemplateField HeaderText="CUSTOMER_NAME" SortExpression="CUSTOMER_NAME" ItemStyle-Wrap="False">
                                    <ItemTemplate>
                                        <asp:Label ID="Label3" runat="server" Text='<%# Bind("CUSTOMER_NAME") %>' ToolTip='<%# Eval("CIF", "CIF : {0}") %>'></asp:Label>
                                    </ItemTemplate>
                                    <EditItemTemplate>
                                        <asp:TextBox ID="TextBox3" runat="server" Text='<%# Bind("CUSTOMER_NAME") %>' ToolTip='<%# Eval("CIF", "CIF : {0}") %>'></asp:TextBox>
                                    </EditItemTemplate>
                                </asp:TemplateField>
                                
                                <asp:BoundField DataField="COVENANT_TYPE_ID" HeaderText="COVENANT_TYPE_ID" 
                                    SortExpression="COVENANT_TYPE_ID" Visible="False" />
                                
                                <asp:BoundField DataField="COVENANT_TYPE" HeaderText="Covenant" 
                                    SortExpression="COVENANT_TYPE" />
                                <asp:BoundField DataField="DETAIL" HeaderText="รายละเอียด" 
                                    SortExpression="DETAIL" />
                                <asp:BoundField DataField="REMARK" HeaderText="REMARK" 
                                    SortExpression="REMARK" Visible="false" />
                                <asp:BoundField DataField="COVENANT_ACTION_ID" HeaderText="COVENANT_ACTION_ID" 
                                    SortExpression="COVENANT_ACTION_ID" Visible="False" />
                                <asp:BoundField DataField="COVENANT_ACTION" HeaderText="การดำเนินการล่าสุด" 
                                    SortExpression="COVENANT_ACTION" />
                                <asp:BoundField DataField="NEXT_COVENANT_ACTION_ID" 
                                    HeaderText="NEXT_COVENANT_ACTION_ID" SortExpression="NEXT_COVENANT_ACTION_ID"
                                    Visible="False" />
                                <asp:BoundField DataField="NEXT_COVENANT_ACTION" 
                                    HeaderText="การดำเนินการครั้งต่อไป" SortExpression="NEXT_COVENANT_ACTION" />
                                <asp:BoundField DataField="NEXT_ACTION_DATE" HeaderText="ดำเนินการครั้งต่อไปวันที่" 
                                    SortExpression="NEXT_ACTION_DATE" DataFormatString="{0:dd/MM/yyyy}" />
                                <asp:BoundField DataField="DEADLINE_DATE" HeaderText="DEADLINE_DATE" 
                                    SortExpression="DEADLINE_DATE" Visible="False" />
                                    
                                <asp:BoundField DataField="CREATE_DATE" HeaderText="CREATE_DATE" 
                                    SortExpression="CREATE_DATE" Visible="False" />
                                
                                
                                <asp:BoundField DataField="ACTION_DATE" HeaderText="ACTION_DATE" 
                                    SortExpression="ACTION_DATE" Visible="False" />
                                <asp:BoundField DataField="USER_ID" HeaderText="USER_ID" 
                                    SortExpression="USER_ID" Visible="False" />
                                <asp:BoundField DataField="USER_UPDATE_DATE" HeaderText="COVENANT_UPDATE_DATE" 
                                    SortExpression="USER_UPDATE_DATE" Visible="False" />
                                
                                <asp:BoundField DataField="COVENANT_DETAIL_ID" HeaderText="COVENANT_DETAIL_ID" 
                                    SortExpression="COVENANT_DETAIL_ID" Visible="False" />
                                <asp:BoundField DataField="COVENANT_DETAIL" HeaderText="COVENANT_DETAIL" 
                                    SortExpression="COVENANT_DETAIL" Visible="False" />
                                
                                <asp:TemplateField HeaderText="CM" SortExpression="CM_CODE" ItemStyle-Wrap="False">
                                    <ItemTemplate>
                                        <asp:Label ID="Label1" runat="server" Text='<%# Eval("TITLE_NAME") + Eval("EMPNAME") + " " + Eval("EMPSURNAME") %>' 
                                        ToolTip='<%# Eval("CM_CODE", "CM CODE : {0}") %>'></asp:Label>
                                    </ItemTemplate>
                                    <EditItemTemplate>
                                        <asp:TextBox ID="TextBox1" runat="server" Text='<%# Eval("TITLE_NAME") + Eval("EMPNAME") + " " + Eval("EMPSURNAME") %>' 
                                        ToolTip='<%# Eval("CM_CODE", "CM CODE : {0}") %>'></asp:TextBox>
                                    </EditItemTemplate>
                                    <HeaderStyle Wrap="False" />
                                    <ItemStyle Wrap="False" />
                                </asp:TemplateField>
                                <asp:BoundField DataField="TITLE_NAME" HeaderText="TITLE_NAME"
                                    SortExpression="TITLE_NAME" Visible="False">
                                </asp:BoundField>
                                <asp:BoundField DataField="EMPNAME" HeaderText="EMPNAME"
                                    SortExpression="EMPNAME" Visible="False">
                                </asp:BoundField>
                                <asp:BoundField DataField="EMPSURNAME" HeaderText="EMPSURNAME" 
                                    SortExpression="EMPSURNAME" Visible="False" />
                                <asp:BoundField DataField="TITLE_NAME_E" HeaderText="TITLE_NAME_E" 
                                    SortExpression="TITLE_NAME_E" Visible="False" />
                                <asp:BoundField DataField="EMPNAME_E" HeaderText="EMPNAME_E" 
                                    SortExpression="EMPNAME_E" Visible="False" />
                                <asp:BoundField DataField="EMPSURNAME_E" HeaderText="EMPSURNAME_E" 
                                    SortExpression="EMPSURNAME_E" Visible="False" />
                                <asp:BoundField DataField="CATEGORY_KEY" HeaderText="CATEGORY_KEY" 
                                    SortExpression="CATEGORY_KEY" Visible="False" />
                                <asp:BoundField DataField="CATEGORY_DESC" HeaderText="CATEGORY_DESC" 
                                    SortExpression="CATEGORY_DESC" Visible="False" />
                                <asp:BoundField DataField="CATEGORY_TYPE_KEY" HeaderText="CATEGORY_TYPE_KEY" 
                                    SortExpression="CATEGORY_TYPE_KEY" Visible="False" />
                                <asp:BoundField DataField="CATEGORY_TYPE_DESC" HeaderText="CATEGORY_TYPE_DESC" 
                                    SortExpression="CATEGORY_TYPE_DESC" Visible="False" />
                                <asp:BoundField DataField="PARENT_CATEGORY_KEY" 
                                    HeaderText="PARENT_CATEGORY_KEY" SortExpression="PARENT_CATEGORY_KEY" Visible="False" />
                                <asp:BoundField DataField="PARENT_CATEGORY_DESC" 
                                    HeaderText="PARENT_CATEGORY_DESC" SortExpression="PARENT_CATEGORY_DESC" Visible="False" />
                                <asp:BoundField DataField="HEAD_EMP_ID" HeaderText="HEAD_EMP_ID" 
                                    SortExpression="HEAD_EMP_ID" Visible="False" />
                                <asp:BoundField DataField="MANAGER_EMP_ID" HeaderText="MANAGER_EMP_ID" 
                                    SortExpression="MANAGER_EMP_ID" Visible="False" />
                                <asp:BoundField DataField="HEAD_TITLE_NAME" HeaderText="HEAD_TITLE_NAME" 
                                    SortExpression="HEAD_TITLE_NAME" Visible="False" />
                                <asp:BoundField DataField="HEAD_EMPNAME" HeaderText="HEAD_EMPNAME" 
                                    SortExpression="HEAD_EMPNAME" Visible="False" />
                                <asp:BoundField DataField="HEAD_EMPSURNAME" HeaderText="HEAD_EMPSURNAME" 
                                    SortExpression="HEAD_EMPSURNAME" Visible="False" />
                                <asp:BoundField DataField="HEAD_TITLE_NAME_E" HeaderText="HEAD_TITLE_NAME_E" 
                                    SortExpression="HEAD_TITLE_NAME_E" Visible="False" />
                                <asp:BoundField DataField="HEAD_EMPNAME_E" HeaderText="HEAD_EMPNAME_E" 
                                    SortExpression="HEAD_EMPNAME_E" Visible="False" />
                                <asp:BoundField DataField="HEAD_EMPSURNAME_E" HeaderText="HEAD_EMPSURNAME_E" 
                                    SortExpression="HEAD_EMPSURNAME_E" Visible="False" />
                                <asp:BoundField DataField="HEAD_CATEGORY_KEY" HeaderText="HEAD_CATEGORY_KEY" 
                                    SortExpression="HEAD_CATEGORY_KEY" Visible="False" />
                                <asp:BoundField DataField="HEAD_CATEGORY_DESC" HeaderText="HEAD_CATEGORY_DESC" 
                                    SortExpression="HEAD_CATEGORY_DESC" Visible="False" />
                                <asp:BoundField DataField="MANAGER_TITLE_NAME" HeaderText="MANAGER_TITLE_NAME" 
                                    SortExpression="MANAGER_TITLE_NAME" Visible="False" />
                                <asp:BoundField DataField="MANAGER_EMPNAME" HeaderText="MANAGER_EMPNAME" 
                                    SortExpression="MANAGER_EMPNAME" Visible="False" />
                                <asp:BoundField DataField="MANAGER_EMPSURNAME" HeaderText="MANAGER_EMPSURNAME" 
                                    SortExpression="MANAGER_EMPSURNAME" Visible="False" />
                                <asp:BoundField DataField="MANAGER_TITLE_NAME_E" 
                                    HeaderText="MANAGER_TITLE_NAME_E" SortExpression="MANAGER_TITLE_NAME_E" Visible="False" />
                                <asp:BoundField DataField="MANAGER_EMPNAME_E" HeaderText="MANAGER_EMPNAME_E" 
                                    SortExpression="MANAGER_EMPNAME_E" Visible="False" />
                                <asp:BoundField DataField="MANAGER_EMPSURNAME_E" 
                                    HeaderText="MANAGER_EMPSURNAME_E" SortExpression="MANAGER_EMPSURNAME_E" Visible="False" />
                                <asp:BoundField DataField="MANAGER_CATEGORY_KEY" 
                                    HeaderText="MANAGER_CATEGORY_KEY" SortExpression="MANAGER_CATEGORY_KEY" Visible="False" />
                                <asp:BoundField DataField="MANAGER_CATEGORY_DESC" 
                                    HeaderText="MANAGER_CATEGORY_DESC" SortExpression="MANAGER_CATEGORY_DESC" Visible="False" />
                            </Columns>
                            <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                            <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
                            <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                            <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                            <EditRowStyle BackColor="#2461BF" />
                            <AlternatingRowStyle BackColor="White" />
                        </asp:GridView>
                        <asp:SqlDataSource ID="DS_COVENANT_REPORT" runat="server" ConnectionString="<%$ ConnectionStrings:BAY01ConnectionString %>"
                            SelectCommand="CA_REPORT.P_COVENANT_REPORT" SelectCommandType="StoredProcedure">
                            <SelectParameters>
                                <asp:SessionParameter Name="EMP_ID" SessionField="EMP_ID" Type="String" />
                                <asp:ControlParameter ControlID="DDL_CATEGORY" Name="CATEGORY_KEY" 
                                    PropertyName="SelectedValue" Type="String" />
                                <asp:QueryStringParameter DefaultValue="no" Name="SINGLE" 
                                    QueryStringField="single" Type="String" />
                            </SelectParameters>
                        </asp:SqlDataSource>
                    </td>
                </tr>
            </table>
        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>

