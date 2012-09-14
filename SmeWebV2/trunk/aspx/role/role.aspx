<%@ Page Title="Role" Language="VB" MasterPageFile="~/MasterPage.master" AutoEventWireup="false"
    CodeFile="role.aspx.vb" Inherits="aspx.role.Role" %>

<%@ Register Src="~/Controls/Role/RoleMenuControl.ascx" TagName="RoleMenuControl"
    TagPrefix="uc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">

    <script type="text/javascript" src="../../js/ext3.0/iframeComponent.js"></script>

    <script type="text/javascript">
        Ext.onReady(function() {
            if (Ext.fly('fvRoleTemplate')) {
                Ext.fly('fvRoleTemplate').select('tr:nth-child(2n)').addClass('alternativeTableRow');
            }

            var tabsRelation = new Ext.TabPanel({
                renderTo: 'divPanel',
                activeTab: 0,
                height: 500,
                plain: true,
                defaults: { autoScroll: true },
                items: [{
                    title: 'EMPLOYEE',
                    contentEl: 'empInRole'
                    //,listeners: { activate: handleActivate }
                }, {
                    title: 'CUSTOMER',
                    contentEl: 'cifInRole'
                    //,listeners: { activate: handleActivate }
                }
                ]
            });

            function handleActivate(tab) {
                alert(tab.title + ' was activated.');
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
        <asp:FormView ID="FV_Role" runat="server" DataKeyNames="ROLE_ID" DataSourceID="DS_Role"
            Width="100%">
            <EditItemTemplate>
                <table id="fvRoleTemplate" width="100%" border="1">
                    <tr>
                        <td width="30%">
                            ROLE CATEGORY:
                        </td>
                        <td>
                            <asp:DropDownList ID="DDL_RoleCategory" runat="server" AutoPostBack="True" DataSourceID="DS_RoleCategory"
                                DataTextField="ROLE_CATEGORY_NAME" DataValueField="ROLE_CATEGORY_ID" SelectedValue='<%# Bind("ROLE_CATEGORY_ID") %>'>
                            </asp:DropDownList>
                            <asp:SqlDataSource ID="DS_RoleCategory" runat="server" ConnectionString="<%$ ConnectionStrings:BAY01ConnectionString %>"
                                SelectCommand="SP_Role_GetAll_RoleCategory" SelectCommandType="StoredProcedure">
                            </asp:SqlDataSource>
                            <asp:Button ID="Butt_NewCategory" runat="server" Text="New Role Category" OnClick="Butt_NewCategory_Click" />
                        </td>
                    </tr>
                    <tr>
                        <td>
                            ROLE VALUE:
                        </td>
                        <td>
                            <asp:TextBox ID="TextBox_RoleValue" runat="server" Text='<%# Bind("ROLE_VALUE") %>' />
                        </td>
                    </tr>
                    <tr>
                        <td>
                            ROLE NAME:
                        </td>
                        <td>
                            <asp:TextBox ID="TextBox_RoleName" runat="server" Text='<%# Bind("ROLE_NAME") %>' />
                        </td>
                    </tr>
                    <tr>
                        <td>
                            ROLE PRIORITY:
                        </td>
                        <td>
                            <asp:TextBox ID="TextBox_RolePriority" runat="server" Text='<%# Bind("ROLE_PRIORITY") %>' />
                        </td>
                    </tr>
                    <tr>
                        <td>
                            ROLE ID:
                        </td>
                        <td>
                            <asp:Label ID="Label_RoleId" runat="server" Text='<%# Eval("ROLE_ID") %>' />
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
                <table id="fvRoleTemplate" width="100%" border="1">
                    <tr>
                        <td width="30%">
                            ROLE CATEGORY:
                        </td>
                        <td>
                            <asp:DropDownList ID="DDL_RoleCategory" runat="server" AutoPostBack="True" DataSourceID="DS_RoleCategory"
                                DataTextField="ROLE_CATEGORY_NAME" DataValueField="ROLE_CATEGORY_ID" SelectedValue='<%# Bind("ROLE_CATEGORY_ID") %>'>
                            </asp:DropDownList>
                            <asp:SqlDataSource ID="DS_RoleCategory" runat="server" ConnectionString="<%$ ConnectionStrings:BAY01ConnectionString %>"
                                SelectCommand="SP_Role_GetAll_RoleCategory" SelectCommandType="StoredProcedure">
                            </asp:SqlDataSource>
                            <asp:Button ID="Butt_NewCategory" runat="server" Text="New Role Category" OnClick="Butt_NewCategory_Click" />
                        </td>
                    </tr>
                    <tr>
                        <td>
                            ROLE VALUE:
                        </td>
                        <td>
                            <asp:TextBox ID="TextBox_RoleValue" runat="server" Text='<%# Bind("ROLE_VALUE") %>' />
                        </td>
                    </tr>
                    <tr>
                        <td>
                            ROLE NAME:
                        </td>
                        <td>
                            <asp:TextBox ID="TextBox_RoleName" runat="server" Text='<%# Bind("ROLE_NAME") %>' />
                        </td>
                    </tr>
                    <tr>
                        <td>
                            ROLE PRIORITY:
                        </td>
                        <td>
                            <asp:TextBox ID="TextBox_RolePriority" runat="server" Text='<%# Bind("ROLE_PRIORITY") %>' />
                        </td>
                    </tr>
                    <tr>
                        <td>
                            ROLE ID:
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
                <table id="fvRoleTemplate" width="100%" border="1">
                    <tr width="30%">
                        <td>
                            ROLE ID:
                        </td>
                        <td>
                            <asp:Label ID="Label_RoleId" runat="server" Text='<%# Eval("ROLE_ID") %>' />
                        </td>
                    </tr>
                    <tr>
                        <td>
                            ROLE NAME:
                        </td>
                        <td>
                            <asp:Label ID="Label_RoleName" runat="server" Text='<%# Eval("ROLE_NAME") %>' />
                        </td>
                    </tr>
                    <tr>
                        <td>
                            ROLE VALUE:
                        </td>
                        <td>
                            <asp:Label ID="Label_RoleValue" runat="server" Text='<%# Eval("ROLE_VALUE") %>' />
                        </td>
                    </tr>
                    <tr>
                        <td>
                            ROLE CATEGORY:
                        </td>
                        <td>
                            <asp:LinkButton ID="LinkButt_RoleCategoryName" runat="server" Text='<%# Eval("ROLE_CATEGORY_NAME") %>'
                                OnClick="LinkButt_RoleCategoryName_Click" />
                            <asp:HiddenField ID="Hidd_RoleCategoryId" runat="server" Value='<%# Eval("ROLE_CATEGORY_ID") %>' />
                        </td>
                    </tr>
                    <tr>
                        <td>
                            ROLE PRIORITY:
                        </td>
                        <td>
                            <asp:Label ID="Label_RolePriority" runat="server" Text='<%# Eval("ROLE_PRIORITY") %>' />
                        </td>
                    </tr>
                    <tr>
                        <td colspan="2" align="center">
                            <asp:Button ID="Butt_Edit" runat="server" Text="Edit" CommandName="Edit" />
                            <asp:Button ID="Butt_Del" runat="server" CommandName="Delete" Text="Delete" OnClientClick='return confirm("การลบ Role จะรวมถึงการลบ Relation ที่เกี่ยวข้องทั้งหมด\n\nคุณยังต้องการที่จะลบ Role หรือไม่?");' />
                        </td>
                    </tr>
                </table>
            </ItemTemplate>
        </asp:FormView>
        <asp:SqlDataSource ID="DS_Role" runat="server" ConnectionString="<%$ ConnectionStrings:BAY01ConnectionString %>"
            SelectCommand="SP_Role_Get_Role_By_RoleId" SelectCommandType="StoredProcedure"
            DeleteCommand="SP_Role_Delete_Role" DeleteCommandType="StoredProcedure" InsertCommand="SP_Role_Insert_Role"
            InsertCommandType="StoredProcedure" UpdateCommand="SP_Role_Update_Role" UpdateCommandType="StoredProcedure">
            <SelectParameters>
                <asp:QueryStringParameter Name="RoleId" QueryStringField="roleId" Type="Int32" />
            </SelectParameters>
            <DeleteParameters>
                <asp:Parameter Name="ROLE_ID" Type="Decimal" />
            </DeleteParameters>
            <UpdateParameters>
                <asp:Parameter Name="ROLE_ID" Type="Decimal" />
                <asp:Parameter Name="ROLE_NAME" Type="String" />
                <asp:Parameter Name="ROLE_VALUE" Type="String" />
                <asp:Parameter Name="ROLE_CATEGORY_ID" Type="Decimal" />
                <asp:Parameter Name="ROLE_PRIORITY" Type="Int32" />
            </UpdateParameters>
            <InsertParameters>
                <asp:Parameter Name="ROLE_NAME" Type="String" />
                <asp:Parameter Name="ROLE_VALUE" Type="String" />
                <asp:Parameter Name="ROLE_CATEGORY_ID" Type="Decimal" />
                <asp:Parameter Name="ROLE_PRIORITY" Type="Int32" />
                <asp:Parameter Direction="InputOutput" Name="ROLE_ID" Type="Decimal" />
            </InsertParameters>
        </asp:SqlDataSource>
        <asp:UpdateProgress ID="UpdateProgress1" runat="server" AssociatedUpdatePanelID="UpdatePanel1"
            DisplayAfter="0">
            <ProgressTemplate>
                <div class="loadingStyle">
                </div>
            </ProgressTemplate>
        </asp:UpdateProgress>
        <asp:UpdateProgress ID="UpdateProgress2" runat="server" AssociatedUpdatePanelID="UpdatePanel2"
            DisplayAfter="0">
            <ProgressTemplate>
                <div class="loadingStyle">
                </div>
            </ProgressTemplate>
        </asp:UpdateProgress>
        <fieldset>
            <legend>
                <asp:Label ID="Header_Label1" runat="server" Font-Bold="True" Text="Role Relation"></asp:Label>
            </legend>
            <div id="divPanel">
                <div id="empInRole" class="x-hide-display">
                    <asp:UpdatePanel ID="UpdatePanel1" runat="server" UpdateMode="Always">
                        <ContentTemplate>
                            <asp:GridView ID="GV_EMP_IN_ROLE" runat="server" AllowPaging="True" AutoGenerateColumns="False"
                                CellPadding="4" DataKeyNames="ID" DataSourceID="DS_EMP_IN_ROLE" ForeColor="#333333"
                                Width="100%">
                                <PagerSettings Mode="NumericFirstLast" />
                                <RowStyle BackColor="#EFF3FB" />
                                <Columns>
                                    <asp:TemplateField HeaderText="EMP_ID" SortExpression="EMP_ID">
                                        <ItemTemplate>
                                            <asp:Label ID="Label_EmpId" runat="server" Text='<%# Bind("EMP_ID") %>'></asp:Label>
                                        </ItemTemplate>
                                        <ItemStyle HorizontalAlign="Center" />
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="EMPNAME" SortExpression="EMPNAME">
                                        <ItemTemplate>
                                            <asp:LinkButton ID="LinkButt_EmpName" runat="server" Text='<%# Bind("EMPNAME") %>'
                                                ToolTip="Manage Role" OnClientClick='<%# "openPopup(&#39;managePopup&#39;,&#39;" + Page.ResolveUrl("~/aspx/role/empManageRole.aspx") + "&#39;,&#39;empId=" + (Eval("EMP_ID")).ToString() + "&#39;);return false;" %>' />
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
                            <asp:SqlDataSource ID="DS_EMP_IN_ROLE" runat="server" ConnectionString="<%$ ConnectionStrings:BAY01ConnectionString %>"
                                SelectCommand="SP_Role_Get_EmpInRole_By_RoleId" SelectCommandType="StoredProcedure">
                                <SelectParameters>
                                    <asp:QueryStringParameter Name="RoleId" QueryStringField="roleId" Type="Int32" />
                                </SelectParameters>
                            </asp:SqlDataSource>
                            <asp:Button ID="Butt_EmpInRolePopup" runat="server" Text="Manage Employee In Role"
                                ToolTip="Manage Employee In Role" />
                            <asp:ImageButton ID="ImageButt_Refresh1" runat="server" ImageUrl="~/images/refreash_icon.jpg"
                                ToolTip="Refresh Data" Width="22px" />
                        </ContentTemplate>
                    </asp:UpdatePanel>
                </div>
                <div id="cifInRole" class="x-hide-display">
                    <asp:UpdatePanel ID="UpdatePanel2" runat="server" UpdateMode="Always">
                        <ContentTemplate>
                            <asp:GridView ID="GV_CIF_IN_ROLE" runat="server" AllowPaging="True" AutoGenerateColumns="False"
                                CellPadding="4" DataSourceID="DS_CIF_IN_ROLE" ForeColor="#333333" Width="100%">
                                <PagerSettings Mode="NumericFirstLast" />
                                <RowStyle BackColor="#EFF3FB" />
                                <Columns>
                                    <asp:TemplateField HeaderText="CIF" SortExpression="CIF">
                                        <ItemTemplate>
                                            <asp:Label ID="Label_Cif" runat="server" Text='<%# Bind("CIF") %>'></asp:Label>
                                        </ItemTemplate>
                                        <ItemStyle HorizontalAlign="Right" />
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="NAME" SortExpression="NAME">
                                        <ItemTemplate>
                                            <asp:LinkButton ID="LinkButt_Name" runat="server" Text='<%# Bind("NAME") %>' ToolTip="Manage Role"
                                                OnClientClick='<%# "openPopup(&#39;managePopup&#39;,&#39;" + Page.ResolveUrl("~/aspx/role/cifManageRole.aspx") + "&#39;,&#39;cif=" + (Eval("CIF")).ToString() + "&#39;);return false;" %>' />
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
                            <asp:SqlDataSource ID="DS_CIF_IN_ROLE" runat="server" ConnectionString="<%$ ConnectionStrings:BAY01ConnectionString %>"
                                SelectCommand="SP_Role_Get_CifInRole_By_RoleId" SelectCommandType="StoredProcedure">
                                <SelectParameters>
                                    <asp:QueryStringParameter Name="RoleId" QueryStringField="roleId" Type="Int32" />
                                </SelectParameters>
                            </asp:SqlDataSource>
                            <asp:Button ID="Butt_CifInRolePopup" runat="server" Text="Manage Customer In Role"
                                ToolTip="Manage Customer In Role" />
                            <asp:ImageButton ID="ImageButt_Refresh2" runat="server" ImageUrl="~/images/refreash_icon.jpg"
                                ToolTip="Refresh Data" Width="22px" />
                        </ContentTemplate>
                    </asp:UpdatePanel>
                </div>
            </div>
        </fieldset>
    </div>
</asp:Content>
