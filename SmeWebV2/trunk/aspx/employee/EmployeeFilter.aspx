<%@ Page Language="VB" AutoEventWireup="false" CodeFile="EmployeeFilter.aspx.vb" Inherits="aspx_employee_EmployeeFilter" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Employee</title>
    <script type="text/javascript" src="../../js/jquery.js"></script>
    <script type="text/javascript" src="../../js/common.js"></script>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <table>
                <tr>
                    <td>
                        <asp:DropDownList ID="DDL_Filter" runat="server">
                            <asp:ListItem Value="EMP_ID">EMP ID</asp:ListItem>
                            <asp:ListItem Value="TITLE_NAME+EMPNAME+EMPSURNAME">NAME</asp:ListItem>
                        </asp:DropDownList>
                        <asp:TextBox ID="TextBox_FilterValue" runat="server"></asp:TextBox>
                        <asp:Button ID="Butt_Search" runat="server" Text="Search"
                            ValidationGroup="beforeSearch" />
                        <asp:CustomValidator ID="CustomValidator_ValidateFilter" runat="server" 
                            ErrorMessage="EMP ID ต้องเป็นตัวเลขเท่านั้น" OnServerValidate="ValidateFilter" 
                            ControlToValidate="TextBox_FilterValue" ValidateEmptyText="True" 
                            ValidationGroup="beforeSearch"></asp:CustomValidator>
                    </td>
                </tr>
            </table>
            
            <table>
                <tr>
                    <td>
                        <asp:GridView ID="GV_Employee" runat="server" AllowPaging="True" 
                            AutoGenerateColumns="False" CellPadding="4" DataKeyNames="EMP_ID" 
                            DataSourceID="DS_Employee" ForeColor="#333333" GridLines="None">
                            <PagerSettings Mode="NumericFirstLast" />
                            <RowStyle BackColor="#EFF3FB" />
                            <Columns>
                                <asp:TemplateField ShowHeader="False">
                                    <ItemTemplate>
                                        <asp:LinkButton ID="LinkButt_SelectEmpId" runat="server" CausesValidation="False" 
                                            CommandName="Select" Text="Select" OnLoad="LinkButt_SelectEmpId_Load"></asp:LinkButton>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="EMP ID" SortExpression="EMP_ID">
                                    <ItemTemplate>
                                        <asp:Label ID="Label_EmpId" runat="server" Text='<%# Bind("EMP_ID") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="NAME" SortExpression="NAME">
                                    <ItemTemplate>
                                        <asp:Label ID="Label_EmpName" runat="server" Text='<%# Bind("NAME") %>'></asp:Label>
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
                        <asp:SqlDataSource ID="DS_Employee" runat="server" 
                            ConnectionString="<%$ ConnectionStrings:BAY01ConnectionString %>" 
                            SelectCommand="SELECT EMP_ID, dbo.GetName(TITLE_NAME,EMPNAME,EMPSURNAME) AS NAME FROM EMPLOYEE01 WHERE EMP_ID = @EMP_ID">
                            <SelectParameters>
                                <asp:ControlParameter ControlID="TextBox_FilterValue" Name="EMP_ID" 
                                    PropertyName="Text" />
                            </SelectParameters>
                        </asp:SqlDataSource>
                        <asp:SqlDataSource ID="DS_Employee2" runat="server" 
                            ConnectionString="<%$ ConnectionStrings:BAY01ConnectionString %>" 
                            SelectCommand="SELECT EMP_ID, dbo.GetName(TITLE_NAME,EMPNAME,EMPSURNAME) AS NAME FROM EMPLOYEE01 WHERE TITLE_NAME+EMPNAME+EMPSURNAME LIKE @NAME">
                            <SelectParameters>
                                <asp:ControlParameter ControlID="TextBox_FilterValue" Name="NAME" 
                                    PropertyName="Text" />
                            </SelectParameters>
                        </asp:SqlDataSource>
                    </td>
                </tr>
            </table>
        </div>
    </form>
</body>
</html>
