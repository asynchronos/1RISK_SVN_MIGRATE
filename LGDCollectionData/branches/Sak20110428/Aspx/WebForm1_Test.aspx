<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="WebForm1_Test.aspx.cs" Inherits="LGDCollectionData.Aspx.WebForm1_Test" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" 
            DataSourceID="SqlDataSource1" 
            EmptyDataText="There are no data records to display.">
            <Columns>
                <asp:BoundField DataField="CIF" HeaderText="CIF" SortExpression="CIF" />
                <asp:BoundField DataField="Group_CIF" HeaderText="Group_CIF" 
                    SortExpression="Group_CIF" />
            </Columns>
        </asp:GridView>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
            ConnectionString="<%$ ConnectionStrings:LGDConnectionString1 %>" 
            ProviderName="<%$ ConnectionStrings:LGDConnectionString1.ProviderName %>" 
            SelectCommand="SELECT [CIF], [Group_CIF] FROM [Group_CIF]">
        </asp:SqlDataSource>
    
    </div>
    </form>
</body>
</html>
