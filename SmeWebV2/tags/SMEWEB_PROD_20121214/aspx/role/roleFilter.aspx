<%@ Page Title="Role Filter" Language="VB" MasterPageFile="~/MasterPage.master" AutoEventWireup="false"
    CodeFile="roleFilter.aspx.vb" Inherits="aspx.role.RoleFilter" %>

<%@ Register Src="../../Controls/Role/RoleMenuControl.ascx" TagName="RoleMenuControl"
    TagPrefix="uc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ScriptPlaceHolder" runat="Server">
    <asp:ScriptManager ID="ScriptManager1" runat="server" EnableScriptGlobalization="True"
        EnableScriptLocalization="True">
    </asp:ScriptManager>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <uc1:RoleMenuControl ID="RoleMenuControl1" runat="server" />
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="ContentPlaceHolder2" runat="Server">
    <div>
        <asp:FormView ID="FV_RoleFilter" runat="server" DataSourceID="DS_RoleFilter">
            <ItemTemplate>
                <table>
                    <tr>
                        <td>
                            <asp:Label ID="Label_Category" runat="server" Text="Category : "></asp:Label>
                            <asp:DropDownList ID="DDL_RoleCategory" runat="server" DataSourceID="DS_RoleCategory"
                                DataTextField="ROLE_CATEGORY_NAME" DataValueField="ROLE_CATEGORY_ID" SelectedValue='<%# Bind("ROLE_CATEGORY_ID") %>'>
                            </asp:DropDownList>
                            <asp:SqlDataSource ID="DS_RoleCategory" runat="server" ConnectionString="<%$ ConnectionStrings:BAY01ConnectionString %>"
                                SelectCommand="SP_Role_GetAll_RoleCategory" SelectCommandType="StoredProcedure">
                            </asp:SqlDataSource>
                            <asp:Label ID="Label2" runat="server" Text="Filter : "></asp:Label>
                            <asp:TextBox ID="TextBox_RoleFilter" runat="server" OnInit="TextBox_RoleFilter_Load"></asp:TextBox>
                            <asp:HiddenField ID="Hidd_RoleFilter" runat="server" OnInit="Hidd_RoleFilter_Load" />
                            <asp:Button ID="Butt_Search" runat="server" Text="Search" OnClick="Butt_Search_Click" />
                        </td>
                    </tr>
                </table>
                <asp:Button ID="Butt_NewRole" runat="server" Text="New Role" OnClick="Butt_NewRole_Click" />
                <table>
                    <tr valign="top">
                        <td>
                            <asp:GridView ID="GV_Role" runat="server" AllowPaging="True" AllowSorting="True"
                                AutoGenerateColumns="False" CellPadding="4" DataKeyNames="ROLE_ID" DataSourceID="DS_Role"
                                ForeColor="#333333" OnDataBound="GV_Role_DataBound">
                                <PagerSettings Mode="NumericFirstLast" />
                                <RowStyle BackColor="#EFF3FB" HorizontalAlign="Center" />
                                <Columns>
                                    <asp:TemplateField HeaderText="ROLE_ID" SortExpression="ROLE_ID" Visible="False">
                                        <ItemTemplate>
                                            <asp:Label ID="Label_RoleId" runat="server" Text='<%# Bind("ROLE_ID") %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="ROLE_NAME" SortExpression="ROLE_NAME">
                                        <ItemTemplate>
                                            <asp:LinkButton ID="LinkButt_RoleName" runat="server" Text='<%# Bind("ROLE_NAME") %>'
                                                OnClick="LinkButt_RoleName_Click"></asp:LinkButton>
                                        </ItemTemplate>
                                        <ItemStyle HorizontalAlign="Left" />
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="PRIORITY" SortExpression="PRIORITY">
                                        <ItemTemplate>
                                            <asp:Label ID="Label1" runat="server" Text='<%# Eval("PRIORITY") %>'></asp:Label>
                                        </ItemTemplate>
                                        <ItemStyle HorizontalAlign="Right" />
                                    </asp:TemplateField>
                                    <asp:TemplateField ShowHeader="False">
                                        <ItemTemplate>
                                            <asp:Button ID="Butt_Del" runat="server" CommandName="Delete" Text="Delete" OnClientClick='return confirm("การลบ Role จะรวมถึงการลบ Relation ที่เกี่ยวข้องทั้งหมด\n\nคุณยังต้องการที่จะลบ Role หรือไม่?");' />
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField ShowHeader="False">
                                        <ItemTemplate>
                                            <asp:Button ID="Butt_RoleLink" runat="server" Text="Relation" CausesValidation="False"
                                                CommandName="Select" OnClick="Butt_RoleLink_Click" />
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                </Columns>
                                <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                                <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
                                <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                                <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                                <EditRowStyle BackColor="#2461BF" />
                                <AlternatingRowStyle BackColor="White" />
                            </asp:GridView>
                            <asp:SqlDataSource ID="DS_Role" runat="server" ConnectionString="<%$ ConnectionStrings:BAY01ConnectionString %>"
                                SelectCommand="SP_Role_Get_Role_RoleCategory_By_Filter" SelectCommandType="StoredProcedure"
                                DeleteCommand="SP_Role_Delete_Role" DeleteCommandType="StoredProcedure">
                                <SelectParameters>
                                    <asp:ControlParameter ControlID="DDL_RoleCategory" Name="CategoryId" PropertyName="SelectedValue"
                                        Type="Decimal" />
                                    <asp:ControlParameter ControlID="Hidd_RoleFilter" Name="Filter" PropertyName="Value"
                                        Type="String" />
                                </SelectParameters>
                            </asp:SqlDataSource>
                        </td>
                        <td>
                            &nbsp;
                        </td>
                        <td>
                            <asp:GridView ID="GV_RoleLink" runat="server" AutoGenerateColumns="False" CellPadding="4"
                                DataKeyNames="LINK_ID" ForeColor="#333333" GridLines="None" AllowPaging="True">
                                <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                                <PagerSettings Mode="NumericFirstLast" />
                                <RowStyle BackColor="#EFF3FB" />
                                <Columns>
                                    <asp:BoundField DataField="LINK_ID" HeaderText="LINK_ID" InsertVisible="False" ReadOnly="True"
                                        SortExpression="LINK_ID" Visible="False" />
                                    <asp:TemplateField HeaderText="Relation With" SortExpression="DESCRIPTION">
                                        <ItemTemplate>
                                            <asp:LinkButton ID="LinkButt_Desc" runat="server" Text='<%# Bind("DESCRIPTION") %>'
                                                ToolTip="Manage Relation In Role" OnClientClick='<%# "openPopup(&#39;" + Eval("DESCRIPTION") + "InRolePopup&#39;,&#39;" + Page.ResolveUrl("~/aspx/role/" + Eval("DESCRIPTION") + "InRole.aspx") + "&#39;,&#39;cateId=" + DDL_RoleCategory.SelectedValue.ToString() + "&roleId=" + GV_Role.SelectedValue.ToString() + "&#39;);return false;" %>'></asp:LinkButton>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="LINK" SortExpression="LINK" Visible="False">
                                        <ItemTemplate>
                                            <asp:Label ID="Label_Link" runat="server" Text='<%# Bind("LINK") %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:BoundField DataField="PRIORITY" HeaderText="PRIORITY" SortExpression="PRIORITY"
                                        Visible="False" />
                                </Columns>
                                <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
                                <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                                <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                                <EditRowStyle BackColor="#2461BF" />
                                <AlternatingRowStyle BackColor="White" />
                            </asp:GridView>
                            <asp:SqlDataSource ID="DS_RoleLink" runat="server" ConnectionString="<%$ ConnectionStrings:BAY01ConnectionString %>"
                                SelectCommand="SP_Role_GetAll_RoleLink" SelectCommandType="StoredProcedure">
                            </asp:SqlDataSource>
                        </td>
                    </tr>
                </table>
            </ItemTemplate>
            <EmptyDataTemplate>
                <table>
                    <tr>
                        <td>
                            <asp:Label ID="Label_Category" runat="server" Text="Category : "></asp:Label>
                            <asp:DropDownList ID="DDL_RoleCategory" runat="server" DataSourceID="DS_RoleCategory"
                                DataTextField="ROLE_CATEGORY_NAME" DataValueField="ROLE_CATEGORY_ID">
                            </asp:DropDownList>
                            <asp:SqlDataSource ID="DS_RoleCategory" runat="server" ConnectionString="<%$ ConnectionStrings:BAY01ConnectionString %>"
                                SelectCommand="SP_Role_GetAll_RoleCategory" SelectCommandType="StoredProcedure">
                            </asp:SqlDataSource>
                            <asp:Label ID="Label2" runat="server" Text="Filter : "></asp:Label>
                            <asp:TextBox ID="TextBox_RoleFilter" runat="server"></asp:TextBox>
                            <asp:HiddenField ID="Hidd_RoleFilter" runat="server" />
                            <asp:Button ID="Butt_Search" runat="server" Text="Search" OnClick="Butt_Search_Click" />
                        </td>
                    </tr>
                </table>
            </EmptyDataTemplate>
        </asp:FormView>
        <asp:SqlDataSource ID="DS_RoleFilter" runat="server" ConnectionString="<%$ ConnectionStrings:BAY01ConnectionString %>"
            SelectCommand="SP_Role_Get_RoleCategory_By_RoleCategoryId" SelectCommandType="StoredProcedure">
            <SelectParameters>
                <asp:QueryStringParameter Name="ROLE_CATEGORY_ID" QueryStringField="cateId" Type="Decimal" />
            </SelectParameters>
        </asp:SqlDataSource>
    </div>
</asp:Content>
