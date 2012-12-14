<%@ Page Title="" Language="VB" MasterPageFile="~/MasterPage.master" AutoEventWireup="false"
    CodeFile="RatingNotification.aspx.vb" Inherits="aspx_report_RatingNotification" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ScriptPlaceHolder" runat="Server">
    <asp:ScriptManager ID="ScriptManager1" runat="server" EnableScriptGlobalization="True"
        EnableScriptLocalization="True">
    </asp:ScriptManager>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="ContentPlaceHolder2" runat="Server">
    <br />
    <asp:UpdateProgress ID="UpdateProgress1" runat="server" AssociatedUpdatePanelID="UpdatePanel1"
        DisplayAfter="0">
        <ProgressTemplate>
            <div class="loadingStyle" style="width: 199px; height: 64px; top: 25%; left: 43%;
                background-image: url(../../images/progress/rectangle/3MA_loadingcontent.gif);">
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
                            DataTextField="CM_CATEGORY_DESC" DataValueField="CM_CATEGORY_KEY">
                        </asp:DropDownList>
                        <asp:SqlDataSource ID="DS_CATEGORY_GROUPING" runat="server" ConnectionString="<%$ ConnectionStrings:BAY01ConnectionString %>"
                            SelectCommand="CUSTOMER.P_RATING_EXPIRED_REPORT_LEVEL_DROPDOWN" SelectCommandType="StoredProcedure">
                            <SelectParameters>
                                <asp:SessionParameter Name="EMP_ID" SessionField="EMP_ID" Type="String" />
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
                        <asp:GridView ID="GV_RATING_EXPIRED_REPORT" runat="server" AllowPaging="True" AllowSorting="True"
                            AutoGenerateColumns="False" CellPadding="4" DataSourceID="DS_RATING_EXPIRED_REPORT"
                            ForeColor="#333333" Width="100%" Font-Size="Medium" DataKeyNames="Cif">
                            <RowStyle BackColor="#EFF3FB" />
                            <Columns>
                                <asp:BoundField DataField="Cif" HeaderText="Cif" ReadOnly="True" SortExpression="Cif">
                                    <ItemStyle HorizontalAlign="Right" />
                                </asp:BoundField>
                                <asp:BoundField DataField="Name" HeaderText="Name" SortExpression="Name">
                                    <ItemStyle Wrap="False" />
                                </asp:BoundField>
                                <asp:BoundField DataField="BaySize" HeaderText="BaySize" 
                                    SortExpression="BaySize" >
                                    <ItemStyle HorizontalAlign="Center" />
                                </asp:BoundField>
                                <asp:BoundField DataField="BizTypeE" HeaderText="BizTypeE" SortExpression="BizTypeE" >
                                </asp:BoundField>
                                <asp:BoundField DataField="Class" HeaderText="Class" SortExpression="Class" >
                                    <ItemStyle HorizontalAlign="Center" />
                                </asp:BoundField>
                                <asp:BoundField DataField="ClassE" HeaderText="ClassE" SortExpression="ClassE" 
                                    Visible="False" />
                                <asp:BoundField DataField="CM_Dep" HeaderText="CM_Dep" SortExpression="CM_Dep" >
                                    <ItemStyle HorizontalAlign="Center" />
                                </asp:BoundField>
                                <asp:BoundField DataField="CM_Flag" HeaderText="CM_Flag" 
                                    SortExpression="CM_Flag" Visible="False" />
                                <asp:BoundField DataField="CM_Group" HeaderText="CM_Group" SortExpression="CM_Group"
                                    ReadOnly="True" Visible="False" />
                                <asp:BoundField DataField="CM_Temp" HeaderText="CM_Temp" SortExpression="CM_Temp"
                                    ReadOnly="True" Visible="False" />
                                <asp:BoundField DataField="CM_Id_Ao" HeaderText="CM_Id_Ao" SortExpression="CM_Id_Ao"
                                    ReadOnly="True" Visible="False" />
                                <asp:BoundField DataField="CM_TITLE" HeaderText="CM_TITLE" SortExpression="CM_TITLE" Visible="False" />
                                <asp:TemplateField HeaderText="CM_AO" SortExpression="CM_Ao">
                                    <ItemTemplate>
                                        <asp:Label ID="Label1" runat="server" Text='<%# Eval("CM_TITLE") + Eval("CM_Ao") + " " + Eval("CM_SURNAME") %>'
                                            ToolTip='<%# Eval("CM_Id_Ao", "CM CODE : {0}") %>'></asp:Label>
                                    </ItemTemplate>
                                    <EditItemTemplate>
                                        <asp:Label ID="Label1" runat="server" Text='<%# Eval("CM_TITLE") + Eval("CM_Ao") + " " + Eval("CM_SURNAME") %>'
                                            ToolTip='<%# Eval("CM_Id_Ao", "CM CODE : {0}") %>'></asp:Label>
                                    </EditItemTemplate>
                                    <ItemStyle Wrap="False" />
                                </asp:TemplateField>
                                <asp:BoundField DataField="CM_SURNAME" HeaderText="CM_SURNAME" SortExpression="CM_SURNAME" Visible="False" />
                                <asp:BoundField DataField="CM_CATEGORY_KEY" HeaderText="CM_CATEGORY_KEY" SortExpression="CM_CATEGORY_KEY" Visible="False" />
                                <asp:BoundField DataField="CM_CATEGORY_DESC" HeaderText="CM_CATEGORY_DESC" SortExpression="CM_CATEGORY_DESC" Visible="False" />
                                <asp:BoundField DataField="CM_PARENT_CATEGORY_KEY" HeaderText="CM_PARENT_CATEGORY_KEY"
                                    SortExpression="CM_PARENT_CATEGORY_KEY" Visible="False" />
                                <asp:BoundField DataField="CM_AoTel" HeaderText="CM_AoTel" SortExpression="CM_AoTel" >
                                    <ItemStyle HorizontalAlign="Center" />
                                </asp:BoundField>
                                <asp:BoundField DataField="SugarOnly" HeaderText="SugarOnly" SortExpression="SugarOnly" Visible="False" />
                                <asp:BoundField DataField="sing_lim" HeaderText="sing_lim" SortExpression="sing_lim" Visible="False" >
                                </asp:BoundField>
                                <asp:BoundField DataField="BAYRATING" HeaderText="BAYRATING" SortExpression="BAYRATING" Visible="False" >
                                </asp:BoundField>
                                <asp:BoundField DataField="Rating" HeaderText="Rating" SortExpression="Rating" >
                                    <ItemStyle HorizontalAlign="Center" ForeColor="Red" />
                                </asp:BoundField>
                                <asp:BoundField DataField="BAYDATE" HeaderText="BAYDATE" SortExpression="BAYDATE" DataFormatString="{0:dd/MM/yyyy}" >
                                    <ItemStyle HorizontalAlign="Center" ForeColor="Red" />
                                </asp:BoundField>
                                <asp:BoundField DataField="EXPIRED" HeaderText="EXPIRED" SortExpression="EXPIRED"
                                    ReadOnly="True" >
                                    <ItemStyle HorizontalAlign="Center" />
                                </asp:BoundField>
                                <asp:CheckBoxField DataField="IS_IN_PORT" HeaderText="IS_IN_PORT" ReadOnly="True"
                                    SortExpression="IS_IN_PORT" >
                                    <ItemStyle HorizontalAlign="Center" />
                                </asp:CheckBoxField>
                                <asp:BoundField DataField="CUSTOMER_AS_OF" HeaderText="CUSTOMER_AS_OF" SortExpression="CUSTOMER_AS_OF" DataFormatString="{0:dd/MM/yyyy}" >
                                    <ItemStyle HorizontalAlign="Center" />
                                </asp:BoundField>
                            </Columns>
                            <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                            <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
                            <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                            <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                            <EditRowStyle BackColor="#2461BF" />
                            <AlternatingRowStyle BackColor="White" />
                        </asp:GridView>
                        <asp:SqlDataSource ID="DS_RATING_EXPIRED_REPORT" runat="server" ConnectionString="<%$ ConnectionStrings:BAY01ConnectionString %>"
                            SelectCommand="CUSTOMER.P_RATING_EXPIRED_REPORT" SelectCommandType="StoredProcedure">
                            <SelectParameters>
                                <asp:SessionParameter Name="EMP_ID" SessionField="EMP_ID" Type="String" />
                                <asp:ControlParameter ControlID="DDL_CATEGORY" Name="CATEGORY_KEY" PropertyName="SelectedValue"
                                    Type="String" />
                                <asp:QueryStringParameter DefaultValue="no" Name="SINGLE" QueryStringField="single"
                                    Type="String" />
                            </SelectParameters>
                        </asp:SqlDataSource>
                    </td>
                </tr>
            </table>
        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>
