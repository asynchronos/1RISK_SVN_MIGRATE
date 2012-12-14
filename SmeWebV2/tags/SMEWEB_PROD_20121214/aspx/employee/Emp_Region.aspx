<%@ Page Language="VB" AutoEventWireup="false" CodeFile="Emp_Region.aspx.vb" Inherits="aspx_employee_Emp_Region" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    
    </div>
    <asp:SqlDataSource ID="SqlDataSourceView" runat="server" 
        ConnectionString="<%$ ConnectionStrings:BAY01ConnectionString %>" 
        SelectCommand="SELECT * FROM [CONTROLLING_LINE_FULL_WITH_REGION]">
    </asp:SqlDataSource>
    <asp:Label ID="Label1" runat="server" Text="Select Employee"></asp:Label>
    &nbsp;<asp:DropDownList ID="DropDownList2" runat="server" 
        DataSourceID="SqlDataSourceEmp" DataTextField="EMPNAME" 
        DataValueField="EMP_ID" AutoPostBack="True">
    </asp:DropDownList>
    &nbsp;<asp:Label ID="Label2" runat="server" Text="Region"></asp:Label>
    &nbsp;<asp:DropDownList ID="DropDownList1" runat="server" 
        DataSourceID="SqlDataSourceRegion" DataTextField="Region_Name" 
        DataValueField="Id_Region">
    </asp:DropDownList>
    &nbsp;<asp:Button ID="Button1" runat="server" Text="Add Employee to Region" />
    &nbsp;<asp:SqlDataSource ID="SqlDataSourceEmp" runat="server" 
        ConnectionString="<%$ ConnectionStrings:BAY01ConnectionString %>" 
        SelectCommand="SELECT [EMP_ID],[EMP_ID] +':' +  [EMPNAME]+'  ' + [EMPSURNAME]  as 'EMPNAME' FROM [CONTROLLING_LINE_FULL] order by [EMP_ID]">
    </asp:SqlDataSource>
    <asp:SqlDataSource ID="SqlDataSourceRegion" runat="server" 
        ConnectionString="<%$ ConnectionStrings:BAY01ConnectionString %>" 
        SelectCommand="SELECT * FROM [Id_Region]"></asp:SqlDataSource>
    <br />
    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" 
        DataSourceID="SqlDataSourceView">
        <Columns>
             <asp:BoundField DataField="id" HeaderText="id" 
                SortExpression="id" />
        
              <asp:BoundField DataField="Id_Region" HeaderText="Id_Region" 
                SortExpression="Id_Region" />
            <asp:BoundField DataField="Region_Name" HeaderText="Region_Name" 
                SortExpression="Region_Name" />
            <asp:BoundField DataField="EMP_ID" HeaderText="EMP_ID" 
                SortExpression="EMP_ID" />
            <asp:BoundField DataField="TITLE_NAME" HeaderText="TITLE_NAME" 
                SortExpression="TITLE_NAME" />
            <asp:BoundField DataField="EMPNAME" HeaderText="EMPNAME" 
                SortExpression="EMPNAME" />
            <asp:BoundField DataField="EMPSURNAME" HeaderText="EMPSURNAME" 
                SortExpression="EMPSURNAME" />
        
        </Columns>
    </asp:GridView>
    </form>
</body>
</html>
