<%@ Page Title="Manage Role In Emp" Language="VB" MasterPageFile="~/Popup.master"
    AutoEventWireup="false" CodeFile="empManageRole.aspx.vb" Inherits="aspx.role.EmpManageRole" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">

    <script type="text/javascript">
        Ext.onReady(function() {
            if (Ext.fly('Table_Emp')) {
                Ext.fly('Table_Emp').select('tr:nth-child(2n)').addClass('alternativeTableRow');
            }
        });
    </script>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ScriptPlaceHolder" runat="Server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="ContentPlaceHolder2" runat="Server">
    <div>
        <table>
            <tr>
                <td>
                    EMP ID:
                    <asp:TextBox ID="TextBox_EmpId" runat="server"></asp:TextBox>
                    <asp:Button ID="Butt_Search" runat="server" Text="Search" />
                </td>
            </tr>
        </table>
        <asp:FormView ID="FV_RoleInEmp" runat="server" DataKeyNames="EMP_ID" DataSourceID="DS_EmpDetail"
            CellPadding="4" ForeColor="#333333">
            <FooterStyle BackColor="#990000" ForeColor="White" Font-Bold="True" />
            <RowStyle BackColor="#FFFBD6" ForeColor="#333333" />
            <EditItemTemplate>
                <table id="Table_Emp" width="100%" border="1">
                    <tr id="Table_Emp_R1">
                        <td id="Table_Emp_R1_C1" width="30%">
                            <asp:Label ID="Label_EmpId" runat="server" Text="EMP ID : " />
                        </td>
                        <td id="Table_Emp_R1_C2">
                            <asp:Label ID="Label_EmpIdValue" runat="server" Text='<%# Eval("EMP_ID") %>' />
                        </td>
                    </tr>
                    <tr id="Table_Emp_R2">
                        <td id="Table_Emp_R2_C1">
                            <asp:Label ID="Label_Name" runat="server" Text="Name : " />
                        </td>
                        <td id="Table_Emp_R2_C2">
                            <asp:Label ID="Label_NameValue" runat="server" Text='<%# Bind("Name") %>' />
                        </td>
                    </tr>
                </table>
                <table id="Table_Roles" runat="server" align="center">
                    <tr id="Table_Roles_R1">
                        <td id="Table_Roles_R1_C1" colspan="3" align="center">
                            <asp:Button ID="Butt_SaveRole" runat="server" Text="Save" OnClick="Butt_SaveRole_Click"
                                Visible="false" />
                            <asp:Button ID="Butt_CancelRole" runat="server" Text="Cancel" OnClick="Butt_CancelRole_Click"
                                Visible="false" />
                            <asp:Button ID="Butt_CancelEdit" runat="server" Text="Cancel Manage Role" CommandName="Cancel" />
                        </td>
                    </tr>
                    <tr id="Table_Roles_R2">
                        <td id="Table_Roles_R2_C1" colspan="3" align="center">
                            <asp:Label ID="Label_RoleCategory" runat="server" Text="Role Category : "></asp:Label>
                            <asp:DropDownList ID="DDL_RoleCategory" runat="server" AutoPostBack="True" DataSourceID="DS_RoleCategory"
                                DataTextField="ROLE_CATEGORY_NAME" DataValueField="ROLE_CATEGORY_ID">
                            </asp:DropDownList>
                            <asp:SqlDataSource ID="DS_RoleCategory" runat="server" ConnectionString="<%$ ConnectionStrings:BAY01ConnectionString %>"
                                SelectCommand="SP_Role_GetAll_RoleCategory" SelectCommandType="StoredProcedure">
                            </asp:SqlDataSource>
                        </td>
                    </tr>
                    <tr id="Table_Roles_R3">
                        <td id="Table_Roles_R3_C1">
                            Available Role<br />
                            <asp:ListBox ID="ListBox_AvailableRole" runat="server" DataSourceID="DS_AvailableRole"
                                DataTextField="ROLE_NAME" DataValueField="ROLE_ID" SelectionMode="Multiple" Height="300px"
                                ToolTip="Available Role"></asp:ListBox>
                            <asp:SqlDataSource ID="DS_AvailableRole" runat="server" ConnectionString="<%$ ConnectionStrings:BAY01ConnectionString %>"
                                SelectCommand="SP_Role_Get_AvailableRole_By_Emp" SelectCommandType="StoredProcedure">
                                <SelectParameters>
                                    <asp:ControlParameter ControlID="Label_EmpIdValue" Name="EMP_ID" PropertyName="Text"
                                        Type="String" />
                                    <asp:ControlParameter ControlID="DDL_RoleCategory" Name="CategoryId" PropertyName="SelectedValue"
                                        Type="Int32" />
                                </SelectParameters>
                            </asp:SqlDataSource>
                        </td>
                        <td id="Table_Roles_R3_C2">
                            <asp:Button ID="Butt_ToRight" runat="server" Text="&gt;" OnClick="Butt_ToRight_Click" />
                            <br />
                            <asp:Button ID="Butt_ToLeft" runat="server" Text="&lt;" OnClick="Butt_ToLeft_Click" />
                        </td>
                        <td id="Table_Roles_R3_C3">
                            Selected Role<br />
                            <asp:ListBox ID="ListBox_SelectedRole" runat="server" DataSourceID="DS_SelectedRole"
                                DataTextField="ROLE_NAME" DataValueField="ROLE_ID" SelectionMode="Multiple" Height="300px"
                                ToolTip="Selected Role"></asp:ListBox>
                            <asp:SqlDataSource ID="DS_SelectedRole" runat="server" ConnectionString="<%$ ConnectionStrings:BAY01ConnectionString %>"
                                SelectCommand="SP_Role_Get_SelectedRole_By_Emp" SelectCommandType="StoredProcedure"
                                UpdateCommand="SP_Role_Edit_EmpInRole" UpdateCommandType="StoredProcedure" OnUpdating="DS_SelectedRole_Updating">
                                <SelectParameters>
                                    <asp:ControlParameter ControlID="Label_EmpIdValue" Name="EMP_ID" PropertyName="Text"
                                        Type="String" />
                                    <asp:ControlParameter ControlID="DDL_RoleCategory" Name="CategoryId" PropertyName="SelectedValue"
                                        Type="Int32" />
                                </SelectParameters>
                                <UpdateParameters>
                                    <asp:Parameter Name="EMP_ID" Type="String" />
                                    <asp:Parameter Name="Roles" Type="String" />
                                    <asp:Parameter Name="CategoryId" Type="Int32" />
                                </UpdateParameters>
                            </asp:SqlDataSource>
                        </td>
                    </tr>
                </table>
            </EditItemTemplate>
            <ItemTemplate>
                <table id="Table_Emp" width="100%" border="1">
                    <tr id="Table_Emp_R1">
                        <td id="Table_Emp_R1_C1" width="30%">
                            <asp:Label ID="Label_EmpId" runat="server" Text="EMP ID: " />
                        </td>
                        <td id="Table_Emp_R1_C2">
                            <asp:Label ID="Label_EmpIdValue" runat="server" Text='<%# Eval("EMP_ID") %>' />
                        </td>
                    </tr>
                    <tr id="Table_Emp_R2">
                        <td id="Table_Emp_R2_C1">
                            <asp:Label ID="Label_Name" runat="server" Text="Name : " />
                        </td>
                        <td id="Table_Emp_R2_C2">
                            <asp:Label ID="Label_NameValue" runat="server" Text='<%# Bind("Name") %>' />
                        </td>
                    </tr>
                </table>
                <table id="Table_Roles" runat="server" align="center">
                    <tr id="Table_Roles_R1">
                        <td id="Table_Roles_R1_C1" align="center">
                            <asp:Button ID="Butt_EditRole" runat="server" Text="Manage Role" CommandName="Edit" />
                        </td>
                    </tr>
                    <tr id="Table_Roles_R2">
                        <td id="Table_Roles_R2_C1">
                            <asp:GridView ID="GV_RoleInEMP" runat="server" AllowPaging="True" AllowSorting="True"
                                AutoGenerateColumns="False" CellPadding="4" DataKeyNames="ID" DataSourceID="DS_RoleInEmp"
                                ForeColor="#333333">
                                <RowStyle BackColor="#EFF3FB" />
                                <Columns>
                                    <asp:BoundField DataField="ID" HeaderText="ID" InsertVisible="False" ReadOnly="True"
                                        SortExpression="ID" Visible="False" />
                                    <asp:TemplateField HeaderText="ROLE_ID" SortExpression="ROLE_ID" Visible="False">
                                        <ItemTemplate>
                                            <asp:Label ID="Label_RoleId" runat="server" Text='<%# Bind("ROLE_ID") %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="ROLE" SortExpression="ROLE_NAME">
                                        <ItemTemplate>
                                            <asp:Label ID="Label_RoleName" runat="server" Text='<%# Bind("ROLE_NAME") %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="ROLE_CATEGORY_ID" SortExpression="ROLE_CATEGORY_ID"
                                        Visible="False">
                                        <ItemTemplate>
                                            <asp:Label ID="Label_RoleCategoryId" runat="server" Text='<%# Bind("ROLE_CATEGORY_ID") %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:BoundField DataField="ROLE_CATEGORY_NAME" HeaderText="CATEGORY" SortExpression="ROLE_CATEGORY_ID" />
                                    <asp:TemplateField ShowHeader="False">
                                        <ItemTemplate>
                                            <asp:Button ID="Butt_Delete" runat="server" CausesValidation="False" CommandName="Delete"
                                                Text="Delete" OnClientClick='return confirm("ยืนยันการลบ Role ที่เลือกออกจากลูกค้ารายนี้");' />
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                </Columns>
                                <EmptyDataTemplate>
                                    <asp:Label ID="Label_GV_EmptyData" runat="server" ForeColor="Red" Text="ยังไม่มีRoleใดๆ"></asp:Label>
                                </EmptyDataTemplate>
                                <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                                <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
                                <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                                <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                                <EditRowStyle BackColor="#2461BF" />
                                <AlternatingRowStyle BackColor="White" />
                            </asp:GridView>
                            <asp:SqlDataSource ID="DS_RoleInEmp" runat="server" ConnectionString="<%$ ConnectionStrings:BAY01ConnectionString %>"
                                SelectCommand="SP_Role_Get_RoleInEmp_By_Emp" SelectCommandType="StoredProcedure"
                                DeleteCommand="SP_Role_Delete_EmpInRole" DeleteCommandType="StoredProcedure">
                                <SelectParameters>
                                    <asp:ControlParameter ControlID="Label_EmpIdValue" Name="EMP_ID" PropertyName="Text"
                                        Type="String" />
                                </SelectParameters>
                                <DeleteParameters>
                                    <asp:Parameter Name="Id" Type="Int32" />
                                </DeleteParameters>
                            </asp:SqlDataSource>
                        </td>
                    </tr>
                </table>
            </ItemTemplate>
            <PagerStyle ForeColor="#333333" HorizontalAlign="Center" BackColor="#FFCC66" />
            <HeaderStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
        </asp:FormView>
        <asp:SqlDataSource ID="DS_EmpDetail" runat="server" ConnectionString="<%$ ConnectionStrings:BAY01ConnectionString %>"
            SelectCommand="SP_Role_Get_EmpDetail_By_Emp" SelectCommandType="StoredProcedure">
            <SelectParameters>
                <asp:QueryStringParameter Name="EMP_ID" QueryStringField="empId" Type="String" />
            </SelectParameters>
        </asp:SqlDataSource>
    </div>
</asp:Content>
