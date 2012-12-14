<%@ Page Title="Cif In Role" Language="VB" MasterPageFile="~/Popup.master" AutoEventWireup="false"
    CodeFile="cifInRole.aspx.vb" Inherits="aspx.role.CifInRole" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">

    <script type="text/javascript">
        //result - this contains any values returned from my method. In this case it will be the id of the item that was inserted.
        //userContext - this is an optional item that can be passed into the original call to the method and will just be passed on to the callback method. I am not using this parameter in this situation
        //methodName - this is the name of the method that was called which resulted in the OnSucceeded method being called. In my case, this will be the string "GetCustomersFullNameByCif"
        function onSuccess(result, userContext, methodName) {
            //getEleByProperty(tagName,propertyName,propertyValue)
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

        function cusIdChange(eleSrc, TargetClientSelector) {
            var cif = eleSrc.value;
            var eleTarget = getEleByProperty("input", "clientId", TargetClientSelector);

            if (isNaN(cif)) {
                alert("CIF ต้องเป็นตัวเลขเท่านั้น");

                //เช็คว่ามี Element target หรือไม่
                if (eleTarget) {
                    //เคลียร์ค่า
                    eleTarget.value = "";
                }

                eleSrc.focus();
            } else {
                eleTarget.value = "loading...";
                //GetCustomersFullNameByCif(cif,onSuccess,onFailed,userContext)
                leader1.CustomerWCFService.GetCustomerFullNameByCif(cif, onSuccess, onFailed, TargetClientSelector);
                //leader1.CustomerWCFService.GetCustomerByCif(cif,onSuccess,onFailed,TargetClientSelector);
            }
        }

    </script>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ScriptPlaceHolder" runat="Server">
    <asp:ScriptManager ID="ScriptManager1" runat="server" EnableScriptGlobalization="True"
        EnableScriptLocalization="True">
        <Services>
            <asp:ServiceReference Path="~/webservice/CustomerWCFService.svc" />
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
                <td colspan="2">
                    <asp:Button ID="Butt_AddCif" runat="server" Text="Add Cif" OnClick="Butt_AddCif_Click" />
                </td>
            </tr>
        </table>
        <table>
            <tr valign="top">
                <td id="CifInRole_GridView_TD">
                    <asp:GridView ID="GV_CifInRole" runat="server" CellPadding="4" DataSourceID="DS_CifInRole"
                        ForeColor="#333333" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False"
                        DataKeyNames="ID" OnDataBound="GV_CifInRole_DataBound">
                        <PagerSettings Mode="NumericFirstLast" />
                        <RowStyle BackColor="#EFF3FB" />
                        <Columns>
                            <asp:BoundField DataField="ID" HeaderText="ID" InsertVisible="False" SortExpression="ID"
                                Visible="False" />
                            <asp:TemplateField HeaderText="CIF" SortExpression="CIF">
                                <ItemTemplate>
                                    <asp:Label ID="Label_Cif" runat="server" Text='<%# Bind("CIF") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="NAME" SortExpression="NAME">
                                <ItemTemplate>
                                    <asp:LinkButton ID="LinkButt_Name" runat="server" Text='<%# Bind("NAME") %>' ToolTip="Manage Role"
                                        OnClientClick='<%# "openPopup(&#39;managePopup&#39;,&#39;" + Page.ResolveUrl("~/aspx/role/cifManageRole.aspx") + "&#39;,&#39;cif=" + (Eval("CIF")).ToString() + "&#39;);return false;" %>' />
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField ShowHeader="False">
                                <ItemTemplate>
                                    <asp:Button ID="Butt_Del" runat="server" CausesValidation="False" OnPreRender="Butt_Del_PreRender"
                                        CommandName="Delete" Text="Delete" OnClientClick='return confirm("ยืนยันการย้ายออกจาก Role");' />
                                </ItemTemplate>
                            </asp:TemplateField>
                        </Columns>
                        <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                        <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
                        <EmptyDataTemplate>
                            No customer in this role.
                        </EmptyDataTemplate>
                        <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                        <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                        <EditRowStyle BackColor="#2461BF" />
                        <AlternatingRowStyle BackColor="White" />
                    </asp:GridView>
                    <asp:SqlDataSource ID="DS_CifInRole" runat="server" ConnectionString="<%$ ConnectionStrings:BAY01ConnectionString %>"
                        SelectCommand="SP_Role_Get_CifInRole_By_RoleId" SelectCommandType="StoredProcedure"
                        DeleteCommand="SP_Role_Delete_CifInRole" DeleteCommandType="StoredProcedure">
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
                    <asp:FormView ID="FV_AddCifInRole" runat="server" CellPadding="4" DataKeyNames="ID"
                        DataSourceID="DS_AddCifInRole" ForeColor="#333333">
                        <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                        <RowStyle BackColor="#EFF3FB" />
                        <InsertItemTemplate>
                            <table>
                                <tr>
                                    <td>
                                        <asp:Label ID="Label_Cif" runat="server" Text="CIF : " ToolTip="รหัสลูกค้า"></asp:Label>
                                        <asp:TextBox ID="TextBoxCUSTOMER_ID" runat="server" Text='<%# Bind("CIF") %>' Wrap="False"
                                            CssClass="textBoxNormalAlignCen" Width="9ex" clientId="TextBoxCUSTOMER_ID" onChange="cusIdChange(this,'TextBoxCUSTOMER_NAME');" />
                                        <asp:ImageButton ID="CUSTOMER_PopupBt" runat="server" ImageUrl="~/images/Magnifying Glass.gif"
                                            OnLoad="CUSTOMER_PopupBt_Load" />
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="TextBoxCUSTOMER_ID"
                                            ErrorMessage="*" ValidationGroup="beforeInsert">
                                        </asp:RequiredFieldValidator>
                                    </td>
                                </tr>
                                <tr>
                                    <td style="white-space: nowrap">
                                        <asp:Label ID="Label_Name" runat="server" Text="Name : " ToolTip="ชื่อลูกค้า"></asp:Label>
                                        <asp:TextBox ID="TextBoxCUSTOMER_NAME" runat="server" Wrap="False" CssClass="textBoxReadOnly"
                                            onfocus="this.blur();" Width="50ex" clientId="TextBoxCUSTOMER_NAME" />
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
                    <asp:SqlDataSource ID="DS_AddCifInRole" runat="server" ConnectionString="<%$ ConnectionStrings:BAY01ConnectionString %>"
                        InsertCommand="SP_Role_Insert_CifInRole" InsertCommandType="StoredProcedure"
                        OnInserting="DS_AddCifInRole_Inserting" OnInserted="DS_AddCifInRole_Inserted"
                        SelectCommand="SP_Role_Get_CifInRole_By_RoleId" SelectCommandType="StoredProcedure">
                        <SelectParameters>
                            <asp:Parameter DefaultValue="0" Name="RoleId" Type="Int32" />
                        </SelectParameters>
                        <InsertParameters>
                            <asp:Parameter Name="CIF" Type="Int32" />
                            <asp:Parameter Name="ROLE_ID" Type="Int32" />
                        </InsertParameters>
                    </asp:SqlDataSource>
                </td>
            </tr>
        </table>
    </div>
</asp:Content>
