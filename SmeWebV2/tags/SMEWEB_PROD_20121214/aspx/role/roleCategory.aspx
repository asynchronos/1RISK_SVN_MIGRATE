<%@ Page Title="Role Category" Language="VB" MasterPageFile="~/MasterPage.master"
    AutoEventWireup="false" CodeFile="roleCategory.aspx.vb" Inherits="aspx.role.RoleCategory" %>

<%@ Register Src="../../Controls/Role/RoleMenuControl.ascx" TagName="RoleMenuControl"
    TagPrefix="uc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">

    <script type="text/javascript">
        Ext.onReady(function() {
            if (Ext.fly('fvRoleCategoryTemplate')) {
                Ext.fly('fvRoleCategoryTemplate').select('tr:nth-child(2n)').addClass('alternativeTableRow');
            }
        });
    </script>

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
        <asp:FormView ID="FV_RoleCategory" runat="server" DataKeyNames="ROLE_CATEGORY_ID"
            DataSourceID="DS_RoleCategory" Width="100%">
            <EditItemTemplate>
                <table id="fvRoleCategoryTemplate" width="100%" border="1">
                    <tr>
                        <td>
                            ROLE_CATEGORY_NAME:
                        </td>
                        <td>
                            <asp:TextBox ID="TextBox_RoleCategoryName" runat="server" Text='<%# Bind("ROLE_CATEGORY_NAME") %>' />
                        </td>
                    </tr>
                    <tr>
                        <td>
                            PRIORITY:
                        </td>
                        <td>
                            <asp:TextBox ID="TextBox_Priority" runat="server" Text='<%# Bind("PRIORITY") %>' />
                        </td>
                    </tr>
                    <tr>
                        <td width="30%">
                            ROLE_CATEGORY_ID:
                        </td>
                        <td>
                            <asp:Label ID="Label_RoleCategoryId" runat="server" Text='<%# Eval("ROLE_CATEGORY_ID") %>' />
                        </td>
                    </tr>
                    <tr>
                        <td colspan="2" align="center">
                            <asp:Button ID="Butt_Update" runat="server" Text="Save" CommandName="Update" />
                            <asp:Button ID="Butt_UpdateCancel" runat="server" CommandName="Cancel" Text="Cancel" />
                        </td>
                    </tr>
                </table>
            </EditItemTemplate>
            <InsertItemTemplate>
                <table id="fvRoleCategoryTemplate" width="100%" border="1">
                    <tr>
                        <td>
                            ROLE_CATEGORY_NAME:
                        </td>
                        <td>
                            <asp:TextBox ID="TextBox_RoleCategoryName" runat="server" Text='<%# Bind("ROLE_CATEGORY_NAME") %>' />
                        </td>
                    </tr>
                    <tr>
                        <td>
                            PRIORITY:
                        </td>
                        <td>
                            <asp:TextBox ID="TextBox_Priority" runat="server" Text='<%# Bind("PRIORITY") %>' />
                        </td>
                    </tr>
                    <tr>
                        <td width="30%">
                            ROLE_CATEGORY_ID:
                        </td>
                        <td>
                            <asp:TextBox ID="TextBox_RoleId" runat="server" Text="Auto Generate" Enabled="false" />
                        </td>
                    </tr>
                    <tr>
                        <td colspan="2" align="center">
                            <asp:Button ID="Butt_Insert" runat="server" Text="Insert" CommandName="Insert" />
                            <asp:Button ID="Butt_InsertCancel" runat="server" CommandName="Cancel" Text="Cancel" />
                        </td>
                    </tr>
                </table>
            </InsertItemTemplate>
            <ItemTemplate>
                <table id="fvRoleCategoryTemplate" width="100%" border="1">
                    <tr>
                        <td>
                            ROLE_CATEGORY_NAME:
                        </td>
                        <td>
                            <asp:Label ID="Label_RoleCategoryName" runat="server" Text='<%# Bind("ROLE_CATEGORY_NAME") %>' />
                        </td>
                    </tr>
                    <tr>
                        <td>
                            PRIORITY:
                        </td>
                        <td>
                            <asp:Label ID="Label_Priority" runat="server" Text='<%# Bind("PRIORITY") %>' />
                        </td>
                    </tr>
                    <tr>
                        <td width="30%">
                            ROLE_CATEGORY_ID:
                        </td>
                        <td>
                            <asp:Label ID="Label_RoleCategoryId" runat="server" Text='<%# Eval("ROLE_CATEGORY_ID") %>' />
                        </td>
                    </tr>
                    <tr>
                        <td colspan="2" align="center">
                            <asp:Button ID="Butt_Edit" runat="server" Text="Edit" CommandName="Edit" />
                            <asp:Button ID="Butt_Del" runat="server" CommandName="Delete" Text="Delete" OnClientClick='return confirm("การลบ Role Category จะรวมถึงการลบ RoleและRelation ที่เกี่ยวข้องทั้งหมด\n\nคุณยังต้องการที่จะลบ Role Category หรือไม่?");' />
                        </td>
                    </tr>
                </table>
            </ItemTemplate>
        </asp:FormView>
        <asp:SqlDataSource ID="DS_RoleCategory" runat="server" ConnectionString="<%$ ConnectionStrings:BAY01ConnectionString %>"
            SelectCommand="SP_Role_Get_RoleCategory_By_RoleCategoryId" SelectCommandType="StoredProcedure"
            DeleteCommand="SP_SP_Role_Delete_RoleCategory" DeleteCommandType="StoredProcedure"
            InsertCommand="SP_SP_Role_Insert_RoleCategory" InsertCommandType="StoredProcedure"
            UpdateCommand="SP_SP_Role_Update_RoleCategory" UpdateCommandType="StoredProcedure">
            <SelectParameters>
                <asp:QueryStringParameter Name="ROLE_CATEGORY_ID" QueryStringField="cateId" Type="Decimal" />
            </SelectParameters>
            <DeleteParameters>
                <asp:Parameter Name="ROLE_CATEGORY_ID" Type="Decimal" />
            </DeleteParameters>
            <UpdateParameters>
                <asp:Parameter Name="ROLE_CATEGORY_ID" Type="Decimal" />
                <asp:Parameter Name="ROLE_CATEGORY_NAME" Type="String" />
                <asp:Parameter Name="PRIORITY" Type="Int32" />
            </UpdateParameters>
            <InsertParameters>
                <asp:Parameter Name="ROLE_CATEGORY_NAME" Type="String" />
                <asp:Parameter Name="PRIORITY" Type="Int32" />
                <asp:Parameter Direction="InputOutput" Name="ROLE_CATEGORY_ID" Type="Decimal" />
            </InsertParameters>
        </asp:SqlDataSource>
    </div>
</asp:Content>
