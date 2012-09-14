<%@ Page Language="VB" AutoEventWireup="false" CodeFile="TestBusinessType.aspx.vb" Inherits="test_TestBusinessType" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Untitled Page</title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    
        <asp:GridView ID="GridView1" runat="server" AllowPaging="True" 
            AutoGenerateColumns="False" CellPadding="4" DataKeyNames="BUSI_TYPE" 
            DataSourceID="SqlDataSource1" ForeColor="#333333" GridLines="None" PageSize="5">
            <FooterStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
            <RowStyle BackColor="#FFFBD6" ForeColor="#333333" />
            <Columns>
                <asp:BoundField DataField="BUSI_TYPE" HeaderText="BUSI_TYPE" ReadOnly="True" 
                    SortExpression="BUSI_TYPE" />
                <asp:BoundField DataField="DESCRIPTION" HeaderText="DESCRIPTION" 
                    SortExpression="DESCRIPTION" />
                <asp:BoundField DataField="FLAG" HeaderText="FLAG" SortExpression="FLAG" />
            </Columns>
            <PagerStyle BackColor="#FFCC66" ForeColor="#333333" HorizontalAlign="Center" />
            <SelectedRowStyle BackColor="#FFCC66" Font-Bold="True" ForeColor="Navy" />
            <HeaderStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
            <AlternatingRowStyle BackColor="White" />
        </asp:GridView>
        <asp:DropDownList ID="DropDownList1" runat="server" AutoPostBack="True" 
            DataSourceID="SqlDataSource1" DataTextField="DESCRIPTION" 
            DataValueField="BUSI_TYPE">
        </asp:DropDownList>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
            ConnectionString="<%$ ConnectionStrings:BAY01ConnectionString %>" 
            SelectCommand="SELECT BUSI_TYPE, DESCRIPTION, FLAG FROM TBMM031_197 WHERE (BUSI_TYPE LIKE '%000000')">
        </asp:SqlDataSource>
        
        <br />---------------------------------------------------------------------------------------------<br />
        
        <asp:GridView ID="GridView2" runat="server" AllowPaging="True" 
            AutoGenerateColumns="False" CellPadding="4" DataKeyNames="BUSI_TYPE" 
            DataSourceID="SqlDataSource2" ForeColor="#333333" GridLines="None" 
            PageSize="5">
            <FooterStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
            <RowStyle BackColor="#FFFBD6" ForeColor="#333333" />
            <Columns>
                <asp:BoundField DataField="BUSI_TYPE" HeaderText="BUSI_TYPE" ReadOnly="True" 
                    SortExpression="BUSI_TYPE" />
                <asp:BoundField DataField="DESCRIPTION" HeaderText="DESCRIPTION" 
                    SortExpression="DESCRIPTION" />
                <asp:BoundField DataField="FLAG" HeaderText="FLAG" SortExpression="FLAG" />
            </Columns>
            <PagerStyle BackColor="#FFCC66" ForeColor="#333333" HorizontalAlign="Center" />
            <SelectedRowStyle BackColor="#FFCC66" Font-Bold="True" ForeColor="Navy" />
            <HeaderStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
            <AlternatingRowStyle BackColor="White" />
        </asp:GridView>
        <asp:DropDownList ID="DropDownList2" runat="server" AutoPostBack="True" 
            DataSourceID="SqlDataSource2" DataTextField="DESCRIPTION" 
            DataValueField="BUSI_TYPE">
        </asp:DropDownList>
        <asp:DropDownList ID="DropDownList8" runat="server" AutoPostBack="True" 
            DataSourceID="SqlDataSource8" DataTextField="DESCRIPTION" 
            DataValueField="BUSI_TYPE">
        </asp:DropDownList>
        <asp:SqlDataSource ID="SqlDataSource2" runat="server" 
            ConnectionString="<%$ ConnectionStrings:BAY01ConnectionString %>" 
            SelectCommand="SELECT BUSI_TYPE, DESCRIPTION, FLAG FROM TBMM031_197 WHERE (BUSI_TYPE LIKE LEFT (@BUSI_TYPE, 2) + '%00000') AND (BUSI_TYPE &lt;&gt; @BUSI_TYPE)">
            <SelectParameters>
                <asp:ControlParameter ControlID="DropDownList1" Name="BUSI_TYPE" 
                    PropertyName="SelectedValue" />
            </SelectParameters>
        </asp:SqlDataSource>
        
        <asp:SqlDataSource ID="SqlDataSource8" runat="server" 
            ConnectionString="<%$ ConnectionStrings:BAY01ConnectionString %>" 
            SelectCommand="SELECT BUSI_TYPE, DESCRIPTION, FLAG FROM TBMM031_197 WHERE (BUSI_TYPE LIKE LEFT (@BUSI_TYPE, 2) + '%000') AND (BUSI_TYPE &lt;&gt; @BUSI_TYPE)">
            <SelectParameters>
                <asp:ControlParameter ControlID="DropDownList1" Name="BUSI_TYPE" 
                    PropertyName="SelectedValue" />
            </SelectParameters>
        </asp:SqlDataSource>
        
        <br />---------------------------------------------------------------------------------------------<br />
        
        <asp:GridView ID="GridView3" runat="server" AllowPaging="True" 
            AutoGenerateColumns="False" CellPadding="4" DataKeyNames="BUSI_TYPE" 
            DataSourceID="SqlDataSource3" ForeColor="#333333" GridLines="None" PageSize="5">
            <FooterStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
            <RowStyle BackColor="#FFFBD6" ForeColor="#333333" />
            <Columns>
                <asp:BoundField DataField="BUSI_TYPE" HeaderText="BUSI_TYPE" ReadOnly="True" 
                    SortExpression="BUSI_TYPE" />
                <asp:BoundField DataField="DESCRIPTION" HeaderText="DESCRIPTION" 
                    SortExpression="DESCRIPTION" />
                <asp:BoundField DataField="FLAG" HeaderText="FLAG" SortExpression="FLAG" />
            </Columns>
            <PagerStyle BackColor="#FFCC66" ForeColor="#333333" HorizontalAlign="Center" />
            <SelectedRowStyle BackColor="#FFCC66" Font-Bold="True" ForeColor="Navy" />
            <HeaderStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
            <AlternatingRowStyle BackColor="White" />
        </asp:GridView>
        <asp:DropDownList ID="DropDownList3" runat="server" AutoPostBack="True" 
            DataSourceID="SqlDataSource3" DataTextField="DESCRIPTION" 
            DataValueField="BUSI_TYPE">
        </asp:DropDownList>
        <asp:DropDownList ID="DropDownList6" runat="server" AutoPostBack="True" 
            DataSourceID="SqlDataSource6" DataTextField="DESCRIPTION" 
            DataValueField="BUSI_TYPE">
        </asp:DropDownList>
        <asp:DropDownList ID="DropDownList9" runat="server" 
            DataSourceID="SqlDataSource9" DataTextField="DESCRIPTION" 
            DataValueField="BUSI_TYPE">
        </asp:DropDownList>
        <asp:SqlDataSource ID="SqlDataSource3" runat="server" 
            ConnectionString="<%$ ConnectionStrings:BAY01ConnectionString %>" 
            SelectCommand="SELECT BUSI_TYPE, DESCRIPTION, FLAG FROM TBMM031_197 WHERE (BUSI_TYPE LIKE LEFT (@BUSI_TYPE, 3) + '%0000') AND (BUSI_TYPE &lt;&gt; @BUSI_TYPE)">
            <SelectParameters>
                <asp:ControlParameter ControlID="DropDownList2" Name="BUSI_TYPE" 
                    PropertyName="SelectedValue" />
            </SelectParameters>
        </asp:SqlDataSource>
        
        <asp:SqlDataSource ID="SqlDataSource6" runat="server" 
            ConnectionString="<%$ ConnectionStrings:BAY01ConnectionString %>" 
            SelectCommand="SELECT BUSI_TYPE, DESCRIPTION, FLAG FROM TBMM031_197 WHERE (BUSI_TYPE LIKE LEFT (@BUSI_TYPE, 3) + '%000') AND (BUSI_TYPE &lt;&gt; @BUSI_TYPE)">
            <SelectParameters>
                <asp:ControlParameter ControlID="DropDownList2" Name="BUSI_TYPE" 
                    PropertyName="SelectedValue" />
            </SelectParameters>
        </asp:SqlDataSource>
        <asp:SqlDataSource ID="SqlDataSource9" runat="server" 
            ConnectionString="<%$ ConnectionStrings:BAY01ConnectionString %>" 
            SelectCommand="SELECT BUSI_TYPE, DESCRIPTION, FLAG FROM TBMM031_197 WHERE (BUSI_TYPE LIKE LEFT (@BUSI_TYPE, 5) + '%') AND (BUSI_TYPE &lt;&gt; @BUSI_TYPE)">
            <SelectParameters>
                <asp:ControlParameter ControlID="DropDownList8" Name="BUSI_TYPE" 
                    PropertyName="SelectedValue" />
            </SelectParameters>
        </asp:SqlDataSource>
        
        <br />---------------------------------------------------------------------------------------------<br />
        
        <asp:GridView ID="GridView4" runat="server" AllowPaging="True" 
            AutoGenerateColumns="False" CellPadding="4" DataKeyNames="BUSI_TYPE" 
            DataSourceID="SqlDataSource4" ForeColor="#333333" GridLines="None" PageSize="5">
            <FooterStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
            <RowStyle BackColor="#FFFBD6" ForeColor="#333333" />
            <Columns>
                <asp:BoundField DataField="BUSI_TYPE" HeaderText="BUSI_TYPE" ReadOnly="True" 
                    SortExpression="BUSI_TYPE" />
                <asp:BoundField DataField="DESCRIPTION" HeaderText="DESCRIPTION" 
                    SortExpression="DESCRIPTION" />
                <asp:BoundField DataField="FLAG" HeaderText="FLAG" SortExpression="FLAG" />
            </Columns>
            <PagerStyle BackColor="#FFCC66" ForeColor="#333333" HorizontalAlign="Center" />
            <SelectedRowStyle BackColor="#FFCC66" Font-Bold="True" ForeColor="Navy" />
            <HeaderStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
            <AlternatingRowStyle BackColor="White" />
        </asp:GridView>
        <asp:DropDownList ID="DropDownList4" runat="server" AutoPostBack="True" 
            DataSourceID="SqlDataSource4" DataTextField="DESCRIPTION" 
            DataValueField="BUSI_TYPE">
        </asp:DropDownList>
        <asp:DropDownList ID="DropDownList7" runat="server" 
            DataSourceID="SqlDataSource7" DataTextField="DESCRIPTION" 
            DataValueField="BUSI_TYPE">
        </asp:DropDownList>
        <asp:SqlDataSource ID="SqlDataSource4" runat="server" 
            ConnectionString="<%$ ConnectionStrings:BAY01ConnectionString %>" 
            SelectCommand="SELECT BUSI_TYPE, DESCRIPTION, FLAG FROM TBMM031_197 WHERE (BUSI_TYPE LIKE LEFT (@BUSI_TYPE, 4) + '%000') AND (BUSI_TYPE &lt;&gt; @BUSI_TYPE)">
            <SelectParameters>
                <asp:ControlParameter ControlID="DropDownList3" Name="BUSI_TYPE" 
                    PropertyName="SelectedValue" />
            </SelectParameters>
        </asp:SqlDataSource>
        
        <asp:SqlDataSource ID="SqlDataSource7" runat="server" 
            ConnectionString="<%$ ConnectionStrings:BAY01ConnectionString %>" 
            SelectCommand="SELECT BUSI_TYPE, DESCRIPTION, FLAG FROM TBMM031_197 WHERE (BUSI_TYPE LIKE LEFT (@BUSI_TYPE, 5) + '%') AND (BUSI_TYPE &lt;&gt; @BUSI_TYPE)">
            <SelectParameters>
                <asp:ControlParameter ControlID="DropDownList6" Name="BUSI_TYPE" 
                    PropertyName="SelectedValue" />
            </SelectParameters>
        </asp:SqlDataSource>
        
        <br />---------------------------------------------------------------------------------------------<br />
        
        <asp:GridView ID="GridView5" runat="server" AllowPaging="True" 
            AutoGenerateColumns="False" CellPadding="4" DataKeyNames="BUSI_TYPE" 
            DataSourceID="SqlDataSource5" ForeColor="#333333" GridLines="None" PageSize="5">
            <FooterStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
            <RowStyle BackColor="#FFFBD6" ForeColor="#333333" />
            <Columns>
                <asp:BoundField DataField="BUSI_TYPE" HeaderText="BUSI_TYPE" ReadOnly="True" 
                    SortExpression="BUSI_TYPE" />
                <asp:BoundField DataField="DESCRIPTION" HeaderText="DESCRIPTION" 
                    SortExpression="DESCRIPTION" />
                <asp:BoundField DataField="FLAG" HeaderText="FLAG" SortExpression="FLAG" />
            </Columns>
            <PagerStyle BackColor="#FFCC66" ForeColor="#333333" HorizontalAlign="Center" />
            <SelectedRowStyle BackColor="#FFCC66" Font-Bold="True" ForeColor="Navy" />
            <HeaderStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
            <AlternatingRowStyle BackColor="White" />
        </asp:GridView>
        <asp:DropDownList ID="DropDownList5" runat="server" 
            DataSourceID="SqlDataSource5" DataTextField="DESCRIPTION" 
            DataValueField="BUSI_TYPE">
        </asp:DropDownList>
        <asp:SqlDataSource ID="SqlDataSource5" runat="server" 
            ConnectionString="<%$ ConnectionStrings:BAY01ConnectionString %>" 
            SelectCommand="SELECT BUSI_TYPE, DESCRIPTION, FLAG FROM TBMM031_197 WHERE (BUSI_TYPE LIKE LEFT (@BUSI_TYPE, 5) + '%') AND (BUSI_TYPE &lt;&gt; @BUSI_TYPE)">
            <SelectParameters>
                <asp:ControlParameter ControlID="DropDownList4" Name="BUSI_TYPE" 
                    PropertyName="SelectedValue" />
            </SelectParameters>
        </asp:SqlDataSource>
    
    </div>
    </form>
</body>
</html>
