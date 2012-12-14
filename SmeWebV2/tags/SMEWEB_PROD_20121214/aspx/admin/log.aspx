<%@ Page Title="Log" Language="VB" MasterPageFile="~/MasterPage.master" AutoEventWireup="false" CodeFile="log.aspx.vb" Inherits="aspx.admin.Log" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ScriptPlaceHolder" Runat="Server">
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
</asp:Content>

<asp:Content ID="Content4" ContentPlaceHolderID="ContentPlaceHolder2" Runat="Server">
    <div>
        
        <asp:Label ID="Label1" runat="server" Text="LOG_TYPE : "></asp:Label>
        <asp:DropDownList ID="DropDownList1" runat="server" AutoPostBack="True" 
            DataSourceID="SqlDataSource2" DataTextField="DESCRIPTION" 
            DataValueField="LOG_TYPE_ID">
        </asp:DropDownList>
        <asp:SqlDataSource ID="SqlDataSource2" runat="server" 
            ConnectionString="<%$ ConnectionStrings:BAY01ConnectionString %>" 
            SelectCommand="SELECT [LOG_TYPE_ID], [DESCRIPTION] FROM [LOG_TYPE] ORDER BY [PRIORITY]">
        </asp:SqlDataSource>
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" 
            CellPadding="4" DataSourceID="SqlDataSource1" ForeColor="#333333" 
            GridLines="None" AllowPaging="True">
            <PagerSettings Mode="NumericFirstLast" />
            <RowStyle BackColor="#EFF3FB" />
            <Columns>
                <asp:BoundField DataField="IP_ADDRESS" HeaderText="IP_ADDRESS" 
                    SortExpression="IP_ADDRESS" />
                <asp:BoundField DataField="DESCRIPTION" HeaderText="DESCRIPTION" 
                    SortExpression="DESCRIPTION" />
                <asp:BoundField DataField="Expr1" HeaderText="Expr1" SortExpression="Expr1" />
                <asp:BoundField DataField="EMP_ID" HeaderText="EMP_ID" 
                    SortExpression="EMP_ID" />
                <asp:BoundField DataField="URL" HeaderText="URL" SortExpression="URL" />
                <asp:BoundField DataField="DETAIL" HeaderText="DETAIL" 
                    SortExpression="DETAIL" />
                <asp:BoundField DataField="CREATE_DATE" HeaderText="CREATE_DATE" 
                    SortExpression="CREATE_DATE" />
            </Columns>
            <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
            <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
            <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
            <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
            <EditRowStyle BackColor="#2461BF" />
            <AlternatingRowStyle BackColor="White" />
        </asp:GridView>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
            ConnectionString="<%$ ConnectionStrings:BAY01ConnectionString %>" 
            
            SelectCommand="SELECT LOG_TABLE.IP_ADDRESS, LOG_TYPE.DESCRIPTION, LOG_LEVEL.DESCRIPTION AS Expr1, LOG_TABLE.EMP_ID, LOG_TABLE.URL, LOG_TABLE.DETAIL, LOG_TABLE.CREATE_DATE FROM LOG_TABLE INNER JOIN LOG_TYPE ON LOG_TABLE.LOG_TYPE_ID = LOG_TYPE.LOG_TYPE_ID INNER JOIN LOG_LEVEL ON LOG_TABLE.LOG_LEVEL_ID = LOG_LEVEL.LOG_LEVEL_ID WHERE (LOG_TABLE.LOG_TYPE_ID = @LOG_TYPE_ID) ORDER BY LOG_TABLE.CREATE_DATE DESC">
            <SelectParameters>
                <asp:ControlParameter ControlID="DropDownList1" Name="LOG_TYPE_ID" 
                    PropertyName="SelectedValue" />
            </SelectParameters>
        </asp:SqlDataSource>
    
    </div>
</asp:Content>
