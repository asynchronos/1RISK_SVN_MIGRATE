<%@ Page Language="VB" AutoEventWireup="false" CodeFile="Department.aspx.vb" Inherits="aspx_employee_Department" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Department</title>
    <script type="text/javascript" id="commonJs" src="../../js/common.js"></script>
    <script type="text/javascript" id="defaultJs">
        function returnTarget(returnValue){
            var openerObj = window.opener;
            
            if(openerObj==undefined){
                return false;
            }
            
            var targetId = getValueFromQueryString("return_target_id");
            setDomValue(e(targetId,openerObj),returnValue);
            
            return true;
        }
    </script>
</head>
<body>
    <form id="departmentForm" runat="server">
    <div style="text-align: center">
        <asp:Label ID="FilterLabel" runat="server" Text="รหัส/ชื่อฝ่าย :"></asp:Label>
        <asp:TextBox ID="FilterValueTextBox" runat="server"></asp:TextBox>
        <asp:Button ID="FilterBt" runat="server" Text="Filter" />
        <asp:GridView ID="DepartmentGridView" runat="server" AllowPaging="True" 
            AutoGenerateColumns="False" CellPadding="4" DataKeyNames="Id_Depart" 
            DataSourceID="DepartmentSqlDataSource" ForeColor="#333333" GridLines="None">
            <FooterStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
            <RowStyle BackColor="#FFFBD6" ForeColor="#333333" />
            <Columns>
                <asp:TemplateField ShowHeader="False">
                    <ItemTemplate>
                        <asp:LinkButton ID="SelectLinkButton" runat="server" CausesValidation="False" 
                            CommandName="Select" Text="Select"></asp:LinkButton>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Id_Depart" SortExpression="Id_Depart">
                    <ItemTemplate>
                        <asp:Label ID="Label1" runat="server" Text='<%# Bind("Id_Depart") %>'></asp:Label>
                    </ItemTemplate>
                    <EditItemTemplate>
                        <asp:Label ID="Label1" runat="server" Text='<%# Eval("Id_Depart") %>'></asp:Label>
                    </EditItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Depart_T" SortExpression="Depart_T">
                    <ItemTemplate>
                        <asp:Label ID="Label2" runat="server" Text='<%# Bind("Depart_T") %>'></asp:Label>
                    </ItemTemplate>
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("Depart_T") %>'></asp:TextBox>
                    </EditItemTemplate>
                </asp:TemplateField>
            </Columns>
            <PagerStyle BackColor="#FFCC66" ForeColor="#333333" HorizontalAlign="Center" />
            <SelectedRowStyle BackColor="#FFCC66" Font-Bold="True" ForeColor="Navy" />
            <HeaderStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
            <AlternatingRowStyle BackColor="White" />
        </asp:GridView>
        <asp:SqlDataSource ID="DepartmentSqlDataSource" runat="server" 
            ConnectionString="<%$ ConnectionStrings:NEW_DEPConnectionString %>" 
            SelectCommand="SELECT Id_Depart, Depart_T FROM Id_Department WHERE (CONVERT (nvarchar(7), Id_Depart) + Depart_T LIKE '%' + @Value + '%')">
            <SelectParameters>
                <asp:ControlParameter ControlID="FilterValueTextBox" Name="Value" 
                    PropertyName="Text" />
            </SelectParameters>
        </asp:SqlDataSource>
    </div>
    </form>
</body>
</html>
