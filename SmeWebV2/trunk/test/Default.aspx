<%@ Page Language="VB" AutoEventWireup="false" CodeFile="Default.aspx.vb" Inherits="test_Default" %>

<%@ Register src="../Controls/ControllingTree/ControllingTree.ascx" tagname="ControllingTree" tagprefix="uc1" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Untitled Page</title>
</head>
<body style="background-image:url(http://localhost:2070/SMEWeb/test/Watermark.aspx?text=249888);background-repeat:repeat;">
    <form id="form1" runat="server" >
    <div>
    
    
    
        <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
        <asp:Label ID="Label1" runat="server" Text="Label"></asp:Label>
        <asp:Button ID="Button1" runat="server" Text="Button" />
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" 
            CellPadding="4" DataKeyNames="CIF" DataSourceID="SqlDataSource1" 
            ForeColor="#333333" GridLines="None" AllowPaging="True">
            <RowStyle BackColor="#FFFBD6" ForeColor="#333333" />
            <Columns>
                <asp:BoundField DataField="CIF" HeaderText="CIF" ReadOnly="True" 
                    SortExpression="CIF" />
                <asp:BoundField DataField="CUSTOMER_NAME" HeaderText="CUSTOMER_NAME" 
                    SortExpression="CUSTOMER_NAME" />
                <asp:BoundField DataField="BRANCH_NAME" HeaderText="BRANCH_NAME" 
                    SortExpression="BRANCH_NAME" />
                <asp:BoundField DataField="GROUP_SIZE_DETAIL" HeaderText="GROUP_SIZE_DETAIL" 
                    SortExpression="GROUP_SIZE_DETAIL" />
                <asp:BoundField DataField="CM_CODE" HeaderText="CM_CODE" 
                    SortExpression="CM_CODE" />
            </Columns>
            <FooterStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
            <PagerStyle BackColor="#FFCC66" ForeColor="#333333" HorizontalAlign="Center" />
            <SelectedRowStyle BackColor="#FFCC66" Font-Bold="True" ForeColor="Navy" />
            <HeaderStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
            <AlternatingRowStyle BackColor="White" />
        </asp:GridView>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
            ConnectionString="<%$ ConnectionStrings:BAY01ConnectionString %>" 
            SelectCommand="CUSTOMER_SME_SELECT_BY_CM" SelectCommandType="StoredProcedure">
            <SelectParameters>
                <asp:ControlParameter ControlID="TextBox1" Name="CM_CODE" PropertyName="Text" 
                    Type="String" />
            </SelectParameters>
        </asp:SqlDataSource>
    
    
    
        <uc1:ControllingTree ID="ControllingTree1" runat="server" />
        <br />
    
    
    
    </div>
    </form>
</body>
</html>
