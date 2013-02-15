<%@ Page Title="Manage Role In Cif" Language="VB" MasterPageFile="~/Popup.master"
    AutoEventWireup="false" CodeFile="cifManageRole.aspx.vb" Inherits="aspx.role.CifManageRole" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">

    <script type="text/javascript">
        Ext.onReady(function() {
            if (Ext.fly('Table_Cif')) {
                Ext.fly('Table_Cif').select('tr:nth-child(2n)').addClass('alternativeTableRow');
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
                    CIF:
                    <asp:TextBox ID="TextBox_Cif" runat="server"></asp:TextBox>
                    <asp:Button ID="Butt_Search" runat="server" Text="Search" />
                </td>
            </tr>
        </table>
        <asp:FormView ID="FV_RoleInCif" runat="server" DataKeyNames="CIF" DataSourceID="DS_CifDetail"
            CellPadding="4" ForeColor="#333333">
            <FooterStyle BackColor="#990000" ForeColor="White" Font-Bold="True" />
            <RowStyle BackColor="#FFFBD6" ForeColor="#333333" />
            <EditItemTemplate>
                <table id="Table_Cif" width="100%" border="1">
                    <tr id="Table_Cif_R1">
                        <td id="Table_Cif_R1_C1">
                            <asp:Label ID="Label_Cif" runat="server" Text="CIF : " />
                        </td>
                        <td id="Table_Cif_R1_C2">
                            <asp:Label ID="Label_CifValue" runat="server" Text='<%# Eval("CIF") %>' />
                        </td>
                        <td id="Table_Cif_R1_C3">
                            <asp:Label ID="Label_CifType" runat="server" Text="CifType : " />
                        </td>
                        <td id="Table_Cif_R1_C4">
                            <asp:Label ID="Label_CifTypeValue" runat="server" Text='<%# Bind("CifType") %>' />
                        </td>
                    </tr>
                    <tr id="Table_Cif_R2">
                        <td id="Table_Cif_R2_C1">
                            <asp:Label ID="Label_Name" runat="server" Text="Name0 : " />
                        </td>
                        <td id="Table_Cif_R2_C2">
                            <asp:Label ID="Label_NameValue" runat="server" Text='<%# Bind("Name") %>' />
                        </td>
                        <td id="Table_Cif_R2_C3">
                            <asp:Label ID="Label_Cif0" runat="server" Text="Cif0 : " />
                        </td>
                        <td id="Table_Cif_R2_C4">
                            <asp:Label ID="Label_Cif0Value" runat="server" Text='<%# Bind("Cif0","{0:#}") %>' />
                        </td>
                    </tr>
                    <tr id="Table_Cif_R3">
                        <td id="Table_Cif_R3_C1">
                            <asp:Label ID="Label_Name1" runat="server" Text="Name1 : " />
                        </td>
                        <td id="Table_Cif_R3_C2">
                            <asp:Label ID="Label_NameValue1" runat="server" Text='<%# Bind("Name1") %>' />
                        </td>
                        <td id="Table_Cif_R3_C3">
                            <asp:Label ID="Label_Cif1" runat="server" Text="Cif1 : " />
                        </td>
                        <td id="Table_Cif_R3_C4">
                            <asp:Label ID="Label_Cif1Value" runat="server" Text='<%# Bind("Cif1","{0:#}") %>' />
                        </td>
                    </tr>
                    <tr id="Table_Cif_R4">
                        <td id="Table_Cif_R4_C1">
                            <asp:Label ID="Label_Name2" runat="server" Text="Name2 : " />
                        </td>
                        <td id="Table_Cif_R4_C2">
                            <asp:Label ID="Label_NameValue2" runat="server" Text='<%# Bind("Name2") %>' />
                        </td>
                        <td id="Table_Cif_R4_C3">
                            <asp:Label ID="Label_Cif2" runat="server" Text="Cif2 : " />
                        </td>
                        <td id="Table_Cif_R4_C4">
                            <asp:Label ID="Label_Cif2Value" runat="server" Text='<%# Bind("Cif2","{0:#}") %>' />
                        </td>
                    </tr>
                    <tr id="Table_Cif_R5">
                        <td id="Table_Cif_R5_C1">
                            <asp:Label ID="Label_Name3" runat="server" Text="Name3 : " />
                        </td>
                        <td id="Table_Cif_R5_C2">
                            <asp:Label ID="Label_NameValue3" runat="server" Text='<%# Bind("Name3") %>' />
                        </td>
                        <td id="Table_Cif_R5_C3">
                            <asp:Label ID="Label_Cif3" runat="server" Text="Cif3 : " />
                        </td>
                        <td id="Table_Cif_R5_C4">
                            <asp:Label ID="Label_Cif3Value" runat="server" Text="ไม่มีข้อมูล" />
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
                            Role ที่มีให้เลือก<br />
                            <asp:ListBox ID="ListBox_AvailableRole" runat="server" DataSourceID="DS_AvailableRole"
                                DataTextField="ROLE_NAME" DataValueField="ROLE_ID" SelectionMode="Multiple" Height="300px"
                                ToolTip="Available Role" OnDataBinding="ListBox_AvailableRole_OnDataBinding"></asp:ListBox>
                            <asp:SqlDataSource ID="DS_AvailableRole" runat="server" ConnectionString="<%$ ConnectionStrings:BAY01ConnectionString %>"
                                SelectCommand="SP_Role_Get_AvailableRole_By_Cif" SelectCommandType="StoredProcedure">
                                <SelectParameters>
                                    <asp:ControlParameter ControlID="Label_CifValue" Name="Cif" PropertyName="Text" Type="Int32" />
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
                            Role ที่เลือกแล้ว<br />
                            <asp:ListBox ID="ListBox_SelectedRole" runat="server" DataSourceID="DS_SelectedRole"
                                DataTextField="ROLE_NAME" DataValueField="ROLE_ID" SelectionMode="Multiple" Height="300px"
                                ToolTip="Selected Role"></asp:ListBox>
                            <asp:SqlDataSource ID="DS_SelectedRole" runat="server" ConnectionString="<%$ ConnectionStrings:BAY01ConnectionString %>"
                                SelectCommand="SP_Role_Get_SelectedRole_By_Cif" SelectCommandType="StoredProcedure"
                                UpdateCommand="SP_Role_Edit_CifInRole" UpdateCommandType="StoredProcedure" OnUpdating="DS_SelectedRole_Updating">
                                <SelectParameters>
                                    <asp:ControlParameter ControlID="Label_CifValue" Name="Cif" PropertyName="Text" Type="Int32" />
                                    <asp:ControlParameter ControlID="DDL_RoleCategory" Name="CategoryId" PropertyName="SelectedValue"
                                        Type="Int32" />
                                </SelectParameters>
                                <UpdateParameters>
                                    <asp:Parameter Name="Cif" Type="Int32" />
                                    <asp:Parameter Name="Roles" Type="String" />
                                    <asp:Parameter Name="CategoryId" Type="Int32" />
                                </UpdateParameters>
                            </asp:SqlDataSource>
                        </td>
                    </tr>
                </table>
            </EditItemTemplate>
            <ItemTemplate>
                <table id="Table_Cif" width="100%" border="1">
                    <tr id="Table_Cif_R1">
                        <td id="Table_Cif_R1_C1">
                            <asp:Label ID="Label_Cif" runat="server" Text="CIF : " />
                        </td>
                        <td id="Table_Cif_R1_C2">
                            <asp:Label ID="Label_CifValue" runat="server" Text='<%# Eval("CIF") %>' />
                        </td>
                        <td id="Table_Cif_R1_C3">
                            <asp:Label ID="Label_CifType" runat="server" Text="CifType : " />
                        </td>
                        <td id="Table_Cif_R1_C4">
                            <asp:Label ID="Label_CifTypeValue" runat="server" Text='<%# Bind("CifType") %>' />
                        </td>
                    </tr>
                    <tr id="Table_Cif_R2">
                        <td id="Table_Cif_R2_C1">
                            <asp:Label ID="Label_Name" runat="server" Text="Name : " />
                        </td>
                        <td id="Table_Cif_R2_C2">
                            <asp:Label ID="Label_NameValue" runat="server" Text='<%# Bind("Name") %>' />
                        </td>
                        <td id="Table_Cif_R2_C3">
                            <asp:Label ID="Label_Cif0" runat="server" Text="Cif0 : " />
                        </td>
                        <td id="Table_Cif_R2_C4">
                            <asp:LinkButton ID="LinkButt_Cif0Value" runat="server" Text='<%# Bind("Cif0","{0:#}") %>'
                                OnClick="LinkButt_CifValue_Click" />
                        </td>
                    </tr>
                    <tr id="Table_Cif_R3">
                        <td id="Table_Cif_R3_C1">
                            <asp:Label ID="Label_Name1" runat="server" Text="Name1 : " />
                        </td>
                        <td id="Table_Cif_R3_C2">
                            <asp:Label ID="Label_NameValue1" runat="server" Text='<%# Bind("Name1") %>' />
                        </td>
                        <td id="Table_Cif_R3_C3">
                            <asp:Label ID="Label_Cif1" runat="server" Text="Cif1 : " />
                        </td>
                        <td id="Table_Cif_R3_C4">
                            <asp:LinkButton ID="LinkButt_Cif1Value" runat="server" Text='<%# Bind("Cif1","{0:#}") %>'
                                OnClick="LinkButt_CifValue_Click" />
                        </td>
                    </tr>
                    <tr id="Table_Cif_R4">
                        <td id="Table_Cif_R4_C1">
                            <asp:Label ID="Label_Name2" runat="server" Text="Name2 : " />
                        </td>
                        <td id="Table_Cif_R4_C2">
                            <asp:Label ID="Label_NameValue2" runat="server" Text='<%# Bind("Name2") %>' />
                        </td>
                        <td id="Table_Cif_R4_C3">
                            <asp:Label ID="Label_Cif2" runat="server" Text="Cif2 : " />
                        </td>
                        <td id="Table_Cif_R4_C4">
                            <asp:LinkButton ID="LinkButt_Cif2Value" runat="server" Text='<%# Bind("Cif2","{0:#}") %>'
                                OnClick="LinkButt_CifValue_Click" />
                        </td>
                    </tr>
                    <tr id="Table_Cif_R5">
                        <td id="Table_Cif_R5_C1">
                            <asp:Label ID="Label_Name3" runat="server" Text="Name3 : " />
                        </td>
                        <td id="Table_Cif_R5_C2">
                            <asp:Label ID="Label_NameValue3" runat="server" Text='<%# Bind("Name3") %>' />
                        </td>
                        <td id="Table_Cif_R5_C3">
                            <asp:Label ID="Label_Cif3" runat="server" Text="Cif3 : " />
                        </td>
                        <td id="Table_Cif_R5_C4">
                            <asp:Label ID="Label_Cif3Value" runat="server" Text="ไม่มีข้อมูล" />
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
                            <asp:GridView ID="GV_RoleInCIF" runat="server" AllowPaging="True" AllowSorting="True"
                                AutoGenerateColumns="False" CellPadding="4" DataKeyNames="ID" DataSourceID="DS_RoleInCIF"
                                ForeColor="#333333">
                                <RowStyle BackColor="#EFF3FB" Width="100%" />
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
                            <asp:SqlDataSource ID="DS_RoleInCIF" runat="server" ConnectionString="<%$ ConnectionStrings:BAY01ConnectionString %>"
                                SelectCommand="SP_Role_Get_RoleInCif_By_Cif" SelectCommandType="StoredProcedure"
                                DeleteCommand="SP_Role_Delete_CifInRole" DeleteCommandType="StoredProcedure">
                                <SelectParameters>
                                    <asp:ControlParameter ControlID="Label_CifValue" Name="Cif" PropertyName="Text" Type="Int32" />
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
        <asp:SqlDataSource ID="DS_CifDetail" runat="server" ConnectionString="<%$ ConnectionStrings:BAY01ConnectionString %>"
            SelectCommand="SP_Role_Get_CifDetail_By_Cif" SelectCommandType="StoredProcedure">
            <SelectParameters>
                <asp:QueryStringParameter Name="CIF" QueryStringField="cif" />
            </SelectParameters>
        </asp:SqlDataSource>
    </div>
</asp:Content>
