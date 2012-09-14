<%@ Page Title="Emp In Role" Language="VB" MasterPageFile="~/popup.master" AutoEventWireup="false"
    CodeFile="empInRole.aspx.vb" Inherits="aspx.role.EmpInRole" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">

    <script type="text/javascript">
        //result - this contains any values returned from my method. In this case it will be the id of the item that was inserted.
        //userContext - this is an optional item that can be passed into the original call to the method and will just be passed on to the callback method. I am not using this parameter in this situation
        //methodName - this is the name of the method that was called which resulted in the OnSucceeded method being called. In my case, this will be the string "GetCustomersFullNameByCif"
        function onSuccess(result, userContext, methodName) {
            var eleTarget = getEleByProperty("input", "clientId", userContext);
            //เช็คว่ามี Element นี้หรือไม่
            if (eleTarget) {//ถ้ามี Element นี้
                if (result.status == "success") {
                    //set result ใส่ element
                    eleTarget.value = result.detail;
                } else {
                    eleTarget.value = "failed:Please, contact administrator.";
                    alert(result.detail);
                }
            }
        }

        function onFailed(error, userContext, methodName) {
            //alert(error.constructor);
            if (error.get_statusCode() != 0)
                alert(methodName + " error:" + error.get_statusCode());
            //alert(error.get_message());
        }

        function empIdChange(eleSrc, targetClientIdValue) {
            var empId = eleSrc.value;
            var eleTarget = getEleByProperty("input", "clientId", targetClientIdValue);

            if (isNaN(empId) || empId.length != 6) {
                if (empId.length > 0 && empId != 0) {
                    alert("รหัสพนักงาน ต้องเป็นตัวเลข6หลักเท่านั้น");
                }

                //เช็คว่ามี Element target หรือไม่
                if (eleTarget) {
                    //เคลียร์ค่า
                    eleTarget.value = "";
                }

                eleSrc.focus();
            } else {
                eleTarget.value = "loading...";
                //GetCmFullNameByEmpId(empId,onSuccess,onFailed,userContext)
                leader1.EmployeeWCFService.GetEmpFullNameByEmpId(empId, onSuccess, onFailed, targetClientIdValue);
            }
        }
    </script>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ScriptPlaceHolder" runat="Server">
    <asp:ScriptManager ID="ScriptManager1" runat="server" EnableScriptGlobalization="True"
        EnableScriptLocalization="True">
        <Services>
            <asp:ServiceReference Path="~/webservice/EmployeeWCFService.svc" />
        </Services>
    </asp:ScriptManager>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="ContentPlaceHolder2" runat="Server">
    <div>
        <table>
            <tr>
                <td>
                    ROLE_CATEGORY:
                    <asp:DropDownList ID="DDL_RoleCategory" runat="server" DataSourceID="DS_RoleCategory"
                        DataTextField="ROLE_CATEGORY_NAME" DataValueField="ROLE_CATEGORY_ID" AutoPostBack="True"
                        OnSelectedIndexChanged="DDL_RoleCategory_SelectedIndexChanged">
                    </asp:DropDownList>
                    <asp:SqlDataSource ID="DS_RoleCategory" runat="server" ConnectionString="<%$ ConnectionStrings:BAY01ConnectionString %>"
                        SelectCommand="SP_Role_GetAll_RoleCategory" SelectCommandType="StoredProcedure">
                    </asp:SqlDataSource>
                </td>
            </tr>
            <tr>
                <td>
                    ROLE_NAME:
                    <asp:DropDownList ID="DDL_RoleName" runat="server" DataSourceID="DS_RoleName" DataTextField="ROLE_NAME"
                        DataValueField="ROLE_ID" AutoPostBack="True">
                    </asp:DropDownList>
                    <asp:Button ID="Butt_NewRole" runat="server" Text="New Role" />
                    <asp:SqlDataSource ID="DS_RoleName" runat="server" ConnectionString="<%$ ConnectionStrings:BAY01ConnectionString %>"
                        SelectCommand="SP_Role_Get_Role_By_RoleCategoryId" SelectCommandType="StoredProcedure">
                        <SelectParameters>
                            <asp:ControlParameter ControlID="DDL_RoleCategory" Name="CategoryId" PropertyName="SelectedValue"
                                Type="Int32" />
                        </SelectParameters>
                    </asp:SqlDataSource>
                </td>
            </tr>
            <tr>
                <td>
                    <asp:Button ID="Butt_AddEmp" runat="server" Text="Add Employee" OnClick="Butt_AddEmp_Click" />
                </td>
            </tr>
        </table>
        <table>
            <tr valign="top">
                <td id="CifInRole_GridView_TD">
                    <asp:GridView ID="GV_EmpInRole" runat="server" CellPadding="4" DataSourceID="DS_EmpInRole"
                        ForeColor="#333333" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False"
                        OnDataBound="GV_EmpInRole_DataBound" DataKeyNames="ID">
                        <PagerSettings Mode="NumericFirstLast" />
                        <RowStyle BackColor="#EFF3FB" />
                        <Columns>
                            <asp:BoundField DataField="ID" HeaderText="ID" InsertVisible="False" ReadOnly="True"
                                SortExpression="ID" Visible="False" />
                            <asp:TemplateField HeaderText="EMP_ID" SortExpression="EMP_ID">
                                <ItemTemplate>
                                    <asp:Label ID="Label_EmpId" runat="server" Text='<%# Bind("EMP_ID") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="EMPNAME" SortExpression="EMPNAME">
                                <ItemTemplate>
                                    <asp:LinkButton ID="LinkButt_EmpName" runat="server" Text='<%# Bind("EMPNAME") %>'
                                        ToolTip="Manage Role" OnClientClick='<%# "openPopup(&#39;managePopup&#39;,&#39;" + Page.ResolveUrl("~/aspx/role/empManageRole.aspx") + "&#39;,&#39;empId=" + (Eval("EMP_ID")).ToString() + "&#39;);return false;" %>' />
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField ShowHeader="False">
                                <ItemTemplate>
                                    <asp:Button ID="Butt_Del" runat="server" CausesValidation="False" CommandName="Delete"
                                        Text="Delete" OnClientClick='return confirm("ยืนยันการย้ายออกจาก Role");' />
                                </ItemTemplate>
                            </asp:TemplateField>
                        </Columns>
                        <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                        <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
                        <EmptyDataTemplate>
                            No employee in this role.
                        </EmptyDataTemplate>
                        <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                        <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                        <EditRowStyle BackColor="#2461BF" />
                        <AlternatingRowStyle BackColor="White" />
                    </asp:GridView>
                    <asp:SqlDataSource ID="DS_EmpInRole" runat="server" ConnectionString="<%$ ConnectionStrings:BAY01ConnectionString %>"
                        SelectCommand="SP_Role_Get_EmpInRole_By_RoleId" SelectCommandType="StoredProcedure"
                        InsertCommand="SP_Role_Insert_EmpInRole" InsertCommandType="StoredProcedure"
                        DeleteCommand="SP_Role_Delete_EmpInRole" DeleteCommandType="StoredProcedure">
                        <SelectParameters>
                            <asp:ControlParameter ControlID="DDL_RoleName" Name="RoleId" PropertyName="SelectedValue"
                                Type="Int32" />
                        </SelectParameters>
                        <DeleteParameters>
                            <asp:Parameter Name="Id" Type="Int32" />
                        </DeleteParameters>
                    </asp:SqlDataSource>
                    <asp:SqlDataSource ID="DS_TOP_ROLE_ID" runat="server" ConnectionString="<%$ ConnectionStrings:BAY01ConnectionString %>"
                        SelectCommand="SP_Role_Get_RoleId_By_RoleCategoryId" SelectCommandType="StoredProcedure"
                        DataSourceMode="DataReader">
                        <SelectParameters>
                            <asp:ControlParameter ControlID="DDL_RoleCategory" Name="CATE_ID" PropertyName="SelectedValue" />
                        </SelectParameters>
                    </asp:SqlDataSource>
                </td>
                <td>
                    <asp:Label ID="Label_dbException" runat="server" ForeColor="Red"></asp:Label>
                    <asp:FormView ID="FV_AddEmpInRole" runat="server" CellPadding="4" DataKeyNames="ID"
                        DataSourceID="DS_AddEmpInRole" ForeColor="#333333">
                        <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                        <RowStyle BackColor="#EFF3FB" />
                        <InsertItemTemplate>
                            <table>
                                <tr>
                                    <td>
                                        <asp:Label ID="Label_EmpId" runat="server" Text="EMP ID : " ToolTip="รหัสพนักงาน"></asp:Label>
                                        <asp:TextBox ID="TextBoxEMP_ID" runat="server" Text='<%# Bind("EMP_ID") %>' Wrap="False"
                                            CssClass="textBoxNormalAlignCen" Width="9ex" clientId="TextBoxEMP_ID" onChange="empIdChange(this,'TextBoxEMP_NAME');" />
                                        <asp:ImageButton ID="EMP_ID_PopupBt" runat="server" ImageUrl="~/images/Magnifying Glass.gif"
                                            OnLoad="EMP_ID_PopupBt_Load" />
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="TextBoxEMP_ID"
                                            ErrorMessage="*" ValidationGroup="beforeInsert">
                                        </asp:RequiredFieldValidator>
                                    </td>
                                </tr>
                                <tr>
                                    <td style="white-space: nowrap">
                                        <asp:Label ID="Label_Name" runat="server" Text="Name : " ToolTip="ชื่อพนักงาน"></asp:Label>
                                        <asp:TextBox ID="TextBoxEMP_NAME" runat="server" Wrap="False" CssClass="textBoxReadOnly"
                                            onfocus="this.blur();" Width="50ex" clientId="TextBoxEMP_NAME" />
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <asp:Button ID="Butt_Insert" runat="server" Text="Insert" CausesValidation="True"
                                            CommandName="Insert" ValidationGroup="beforeInsert" />
                                        <asp:Button ID="Butt_InsertCancel" runat="server" Text="Cancel" CausesValidation="False"
                                            CommandName="Cancel" />
                                    </td>
                                </tr>
                            </table>
                        </InsertItemTemplate>
                        <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
                        <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                        <EditRowStyle BackColor="#2461BF" />
                    </asp:FormView>
                    <asp:SqlDataSource ID="DS_AddEmpInRole" runat="server" ConnectionString="<%$ ConnectionStrings:BAY01ConnectionString %>"
                        InsertCommand="SP_Role_Insert_EmpInRole" InsertCommandType="StoredProcedure"
                        OnInserting="DS_AddEmpInRole_Inserting" OnInserted="DS_AddEmpInRole_Inserted"
                        SelectCommand="SP_Role_Get_EmpInRole_By_RoleId" SelectCommandType="StoredProcedure">
                        <SelectParameters>
                            <asp:Parameter DefaultValue="0" Name="RoleId" Type="Int32" />
                        </SelectParameters>
                        <InsertParameters>
                            <asp:Parameter Name="EMP_ID" Type="String" />
                            <asp:Parameter Name="ROLE_ID" Type="Int32" />
                        </InsertParameters>
                    </asp:SqlDataSource>
                </td>
            </tr>
        </table>
    </div>
</asp:Content>
