<%@ Page Language="VB" AutoEventWireup="false" CodeFile="BusinessTypeMaintain.aspx.vb" Inherits="BusinessTypeMaintain" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Untitled Page</title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    
        <asp:DropDownList ID="DropDownList1" runat="server" AutoPostBack="True" 
            DataSourceID="SqlDataSource1" DataTextField="TYPE1_DETAIL" 
            DataValueField="TYPE1_ID">
        </asp:DropDownList>
        <asp:GridView ID="GridView1" runat="server" AllowPaging="True" 
            AutoGenerateColumns="False" CellPadding="4" DataKeyNames="TYPE1_ID" 
            DataSourceID="SqlDataSource1" ForeColor="#333333" GridLines="None" PageSize="5">
            <FooterStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
            <RowStyle BackColor="#FFFBD6" ForeColor="#333333" />
            <Columns>
                <asp:BoundField DataField="TYPE1_ID" HeaderText="TYPE1_ID" 
                    InsertVisible="False" ReadOnly="True" SortExpression="TYPE1_ID">
                    <ItemStyle HorizontalAlign="Center" />
                </asp:BoundField>
                <asp:BoundField DataField="TYPE1_DETAIL" HeaderText="TYPE1_DETAIL" 
                    SortExpression="TYPE1_DETAIL">
                    <ItemStyle HorizontalAlign="Center" />
                </asp:BoundField>
                <asp:BoundField DataField="PRIORITY" HeaderText="PRIORITY" 
                    SortExpression="PRIORITY">
                    <ItemStyle HorizontalAlign="Center" />
                </asp:BoundField>
                <asp:BoundField DataField="UPDATE_BY" HeaderText="UPDATE_BY" 
                    SortExpression="UPDATE_BY">
                    <ItemStyle HorizontalAlign="Center" />
                </asp:BoundField>
            </Columns>
            <PagerStyle BackColor="#FFCC66" ForeColor="#333333" HorizontalAlign="Center" />
            <SelectedRowStyle BackColor="#FFCC66" Font-Bold="True" ForeColor="Navy" />
            <HeaderStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
            <AlternatingRowStyle BackColor="White" />
        </asp:GridView>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
            ConflictDetection="CompareAllValues" 
            ConnectionString="<%$ ConnectionStrings:BAY01ConnectionString %>" 
            DeleteCommand="DELETE FROM [BUSI_TYPE1] WHERE [TYPE1_ID] = @original_TYPE1_ID AND [TYPE1_DETAIL] = @original_TYPE1_DETAIL AND [PRIORITY] = @original_PRIORITY AND [UPDATE_BY] = @original_UPDATE_BY AND [UPDATE_DATE] = @original_UPDATE_DATE" 
            InsertCommand="INSERT INTO [BUSI_TYPE1] ([TYPE1_DETAIL], [PRIORITY], [UPDATE_BY], [UPDATE_DATE]) VALUES (@TYPE1_DETAIL, @PRIORITY, @UPDATE_BY, @UPDATE_DATE)" 
            OldValuesParameterFormatString="original_{0}" 
            SelectCommand="SELECT [TYPE1_ID], [TYPE1_DETAIL], [PRIORITY], [UPDATE_BY], [UPDATE_DATE] FROM [BUSI_TYPE1]" 
            UpdateCommand="UPDATE [BUSI_TYPE1] SET [TYPE1_DETAIL] = @TYPE1_DETAIL, [PRIORITY] = @PRIORITY, [UPDATE_BY] = @UPDATE_BY, [UPDATE_DATE] = @UPDATE_DATE WHERE [TYPE1_ID] = @original_TYPE1_ID AND [TYPE1_DETAIL] = @original_TYPE1_DETAIL AND [PRIORITY] = @original_PRIORITY AND [UPDATE_BY] = @original_UPDATE_BY AND [UPDATE_DATE] = @original_UPDATE_DATE">
            <DeleteParameters>
                <asp:Parameter Name="original_TYPE1_ID" Type="Int32" />
                <asp:Parameter Name="original_TYPE1_DETAIL" Type="String" />
                <asp:Parameter Name="original_PRIORITY" Type="Int32" />
                <asp:Parameter Name="original_UPDATE_BY" Type="String" />
                <asp:Parameter Name="original_UPDATE_DATE" Type="Object" />
            </DeleteParameters>
            <UpdateParameters>
                <asp:Parameter Name="TYPE1_DETAIL" Type="String" />
                <asp:Parameter Name="PRIORITY" Type="Int32" />
                <asp:Parameter Name="UPDATE_BY" Type="String" />
                <asp:Parameter Name="UPDATE_DATE" Type="Object" />
                <asp:Parameter Name="original_TYPE1_ID" Type="Int32" />
                <asp:Parameter Name="original_TYPE1_DETAIL" Type="String" />
                <asp:Parameter Name="original_PRIORITY" Type="Int32" />
                <asp:Parameter Name="original_UPDATE_BY" Type="String" />
                <asp:Parameter Name="original_UPDATE_DATE" Type="Object" />
            </UpdateParameters>
            <InsertParameters>
                <asp:Parameter Name="TYPE1_DETAIL" Type="String" />
                <asp:Parameter Name="PRIORITY" Type="Int32" />
                <asp:Parameter Name="UPDATE_BY" Type="String" />
                <asp:Parameter Name="UPDATE_DATE" Type="Object" />
            </InsertParameters>
        </asp:SqlDataSource>
        <asp:DropDownList ID="DropDownList2" runat="server" AutoPostBack="True" 
            DataSourceID="SqlDataSource2" DataTextField="TYPE2_DETAIL" 
            DataValueField="TYPE2_ID">
        </asp:DropDownList>
        <asp:GridView ID="GridView2" runat="server" AllowPaging="True" 
            AutoGenerateColumns="False" CellPadding="4" DataKeyNames="TYPE2_ID" 
            DataSourceID="SqlDataSource2" ForeColor="#333333" GridLines="None" PageSize="5">
            <FooterStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
            <RowStyle BackColor="#FFFBD6" ForeColor="#333333" />
            <Columns>
                <asp:BoundField DataField="TYPE2_ID" HeaderText="TYPE2_ID" 
                    InsertVisible="False" ReadOnly="True" SortExpression="TYPE2_ID">
                    <ItemStyle HorizontalAlign="Center" />
                </asp:BoundField>
                <asp:BoundField DataField="TYPE2_DETAIL" HeaderText="TYPE2_DETAIL" 
                    SortExpression="TYPE2_DETAIL">
                    <ItemStyle HorizontalAlign="Center" />
                </asp:BoundField>
                <asp:BoundField DataField="PRIORITY" HeaderText="PRIORITY" 
                    SortExpression="PRIORITY">
                    <ItemStyle HorizontalAlign="Center" />
                </asp:BoundField>
                <asp:BoundField DataField="TYPE1_ID" HeaderText="TYPE1_ID" 
                    SortExpression="TYPE1_ID">
                    <ItemStyle HorizontalAlign="Center" />
                </asp:BoundField>
                <asp:BoundField DataField="UPDATE_BY" HeaderText="UPDATE_BY" 
                    SortExpression="UPDATE_BY">
                    <ItemStyle HorizontalAlign="Center" />
                </asp:BoundField>
            </Columns>
            <PagerStyle BackColor="#FFCC66" ForeColor="#333333" HorizontalAlign="Center" />
            <SelectedRowStyle BackColor="#FFCC66" Font-Bold="True" ForeColor="Navy" />
            <HeaderStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
            <AlternatingRowStyle BackColor="White" />
        </asp:GridView>
        <asp:SqlDataSource ID="SqlDataSource2" runat="server" 
            ConflictDetection="CompareAllValues" 
            ConnectionString="<%$ ConnectionStrings:BAY01ConnectionString %>" 
            DeleteCommand="DELETE FROM [BUSI_TYPE2] WHERE [TYPE2_ID] = @original_TYPE2_ID AND [TYPE2_DETAIL] = @original_TYPE2_DETAIL AND [PRIORITY] = @original_PRIORITY AND [TYPE1_ID] = @original_TYPE1_ID AND [UPDATE_BY] = @original_UPDATE_BY AND [UPDATE_DATE] = @original_UPDATE_DATE" 
            InsertCommand="INSERT INTO [BUSI_TYPE2] ([TYPE2_DETAIL], [PRIORITY], [TYPE1_ID], [UPDATE_BY], [UPDATE_DATE]) VALUES (@TYPE2_DETAIL, @PRIORITY, @TYPE1_ID, @UPDATE_BY, @UPDATE_DATE)" 
            OldValuesParameterFormatString="original_{0}" 
            SelectCommand="SELECT [TYPE2_ID], [TYPE2_DETAIL], [PRIORITY], [TYPE1_ID], [UPDATE_BY], [UPDATE_DATE] FROM [BUSI_TYPE2] WHERE ([TYPE1_ID] = @TYPE1_ID)" 
            UpdateCommand="UPDATE [BUSI_TYPE2] SET [TYPE2_DETAIL] = @TYPE2_DETAIL, [PRIORITY] = @PRIORITY, [TYPE1_ID] = @TYPE1_ID, [UPDATE_BY] = @UPDATE_BY, [UPDATE_DATE] = @UPDATE_DATE WHERE [TYPE2_ID] = @original_TYPE2_ID AND [TYPE2_DETAIL] = @original_TYPE2_DETAIL AND [PRIORITY] = @original_PRIORITY AND [TYPE1_ID] = @original_TYPE1_ID AND [UPDATE_BY] = @original_UPDATE_BY AND [UPDATE_DATE] = @original_UPDATE_DATE">
            <SelectParameters>
                <asp:ControlParameter ControlID="DropDownList1" Name="TYPE1_ID" 
                    PropertyName="SelectedValue" Type="Int32" />
            </SelectParameters>
            <DeleteParameters>
                <asp:Parameter Name="original_TYPE2_ID" Type="Int32" />
                <asp:Parameter Name="original_TYPE2_DETAIL" Type="String" />
                <asp:Parameter Name="original_PRIORITY" Type="Int32" />
                <asp:Parameter Name="original_TYPE1_ID" Type="Int32" />
                <asp:Parameter Name="original_UPDATE_BY" Type="String" />
                <asp:Parameter Name="original_UPDATE_DATE" Type="Object" />
            </DeleteParameters>
            <UpdateParameters>
                <asp:Parameter Name="TYPE2_DETAIL" Type="String" />
                <asp:Parameter Name="PRIORITY" Type="Int32" />
                <asp:Parameter Name="TYPE1_ID" Type="Int32" />
                <asp:Parameter Name="UPDATE_BY" Type="String" />
                <asp:Parameter Name="UPDATE_DATE" Type="Object" />
                <asp:Parameter Name="original_TYPE2_ID" Type="Int32" />
                <asp:Parameter Name="original_TYPE2_DETAIL" Type="String" />
                <asp:Parameter Name="original_PRIORITY" Type="Int32" />
                <asp:Parameter Name="original_TYPE1_ID" Type="Int32" />
                <asp:Parameter Name="original_UPDATE_BY" Type="String" />
                <asp:Parameter Name="original_UPDATE_DATE" Type="Object" />
            </UpdateParameters>
            <InsertParameters>
                <asp:Parameter Name="TYPE2_DETAIL" Type="String" />
                <asp:Parameter Name="PRIORITY" Type="Int32" />
                <asp:Parameter Name="TYPE1_ID" Type="Int32" />
                <asp:Parameter Name="UPDATE_BY" Type="String" />
                <asp:Parameter Name="UPDATE_DATE" Type="Object" />
            </InsertParameters>
        </asp:SqlDataSource>
        <asp:DropDownList ID="DropDownList3" runat="server" 
            DataSourceID="SqlDataSource3" DataTextField="TYPE3_DETAIL" 
            DataValueField="TYPE3_ID">
        </asp:DropDownList>
        <asp:GridView ID="GridView3" runat="server" AllowPaging="True" 
            AutoGenerateColumns="False" CellPadding="4" DataKeyNames="TYPE3_ID" 
            DataSourceID="SqlDataSource3" ForeColor="#333333" GridLines="None" PageSize="5">
            <FooterStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
            <RowStyle BackColor="#FFFBD6" ForeColor="#333333" />
            <Columns>
                <asp:BoundField DataField="TYPE3_ID" HeaderText="TYPE3_ID" 
                    InsertVisible="False" ReadOnly="True" SortExpression="TYPE3_ID">
                    <ItemStyle HorizontalAlign="Center" />
                </asp:BoundField>
                <asp:BoundField DataField="TYPE3_DETAIL" HeaderText="TYPE3_DETAIL" 
                    SortExpression="TYPE3_DETAIL">
                    <ItemStyle HorizontalAlign="Center" />
                </asp:BoundField>
                <asp:BoundField DataField="PRIORITY" HeaderText="PRIORITY" 
                    SortExpression="PRIORITY">
                    <ItemStyle HorizontalAlign="Center" />
                </asp:BoundField>
                <asp:BoundField DataField="TYPE2_ID" HeaderText="TYPE2_ID" 
                    SortExpression="TYPE2_ID">
                    <ItemStyle HorizontalAlign="Center" />
                </asp:BoundField>
                <asp:BoundField DataField="CODE_BAY" HeaderText="CODE_BAY" 
                    SortExpression="CODE_BAY">
                    <ItemStyle HorizontalAlign="Center" />
                </asp:BoundField>
                <asp:BoundField DataField="CODE_RESEARCH" HeaderText="CODE_RESEARCH" 
                    SortExpression="CODE_RESEARCH">
                    <ItemStyle HorizontalAlign="Center" />
                </asp:BoundField>
                <asp:BoundField DataField="FLAG" HeaderText="FLAG" SortExpression="FLAG">
                    <ItemStyle HorizontalAlign="Center" />
                </asp:BoundField>
                <asp:BoundField DataField="UPDATE_BY" HeaderText="UPDATE_BY" 
                    SortExpression="UPDATE_BY">
                    <ItemStyle HorizontalAlign="Center" />
                </asp:BoundField>
            </Columns>
            <PagerStyle BackColor="#FFCC66" ForeColor="#333333" HorizontalAlign="Center" />
            <SelectedRowStyle BackColor="#FFCC66" Font-Bold="True" ForeColor="Navy" />
            <HeaderStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
            <AlternatingRowStyle BackColor="White" />
        </asp:GridView>
        <asp:SqlDataSource ID="SqlDataSource3" runat="server" 
            ConflictDetection="CompareAllValues" 
            ConnectionString="<%$ ConnectionStrings:BAY01ConnectionString %>" 
            DeleteCommand="DELETE FROM [BUSI_TYPE3] WHERE [TYPE3_ID] = @original_TYPE3_ID AND [TYPE3_DETAIL] = @original_TYPE3_DETAIL AND [PRIORITY] = @original_PRIORITY AND [TYPE2_ID] = @original_TYPE2_ID AND [CODE_BAY] = @original_CODE_BAY AND [CODE_RESEARCH] = @original_CODE_RESEARCH AND [FLAG] = @original_FLAG AND [UPDATE_BY] = @original_UPDATE_BY AND [UPDATE_DATE] = @original_UPDATE_DATE" 
            InsertCommand="INSERT INTO [BUSI_TYPE3] ([TYPE3_DETAIL], [PRIORITY], [TYPE2_ID], [CODE_BAY], [CODE_RESEARCH], [FLAG], [UPDATE_BY], [UPDATE_DATE]) VALUES (@TYPE3_DETAIL, @PRIORITY, @TYPE2_ID, @CODE_BAY, @CODE_RESEARCH, @FLAG, @UPDATE_BY, @UPDATE_DATE)" 
            OldValuesParameterFormatString="original_{0}" 
            SelectCommand="SELECT [TYPE3_ID], [TYPE3_DETAIL], [PRIORITY], [TYPE2_ID], [CODE_BAY], [CODE_RESEARCH], [FLAG], [UPDATE_BY], [UPDATE_DATE] FROM [BUSI_TYPE3] WHERE ([TYPE2_ID] = @TYPE2_ID)" 
            UpdateCommand="UPDATE [BUSI_TYPE3] SET [TYPE3_DETAIL] = @TYPE3_DETAIL, [PRIORITY] = @PRIORITY, [TYPE2_ID] = @TYPE2_ID, [CODE_BAY] = @CODE_BAY, [CODE_RESEARCH] = @CODE_RESEARCH, [FLAG] = @FLAG, [UPDATE_BY] = @UPDATE_BY, [UPDATE_DATE] = @UPDATE_DATE WHERE [TYPE3_ID] = @original_TYPE3_ID AND [TYPE3_DETAIL] = @original_TYPE3_DETAIL AND [PRIORITY] = @original_PRIORITY AND [TYPE2_ID] = @original_TYPE2_ID AND [CODE_BAY] = @original_CODE_BAY AND [CODE_RESEARCH] = @original_CODE_RESEARCH AND [FLAG] = @original_FLAG AND [UPDATE_BY] = @original_UPDATE_BY AND [UPDATE_DATE] = @original_UPDATE_DATE">
            <SelectParameters>
                <asp:ControlParameter ControlID="DropDownList2" Name="TYPE2_ID" 
                    PropertyName="SelectedValue" Type="Int32" />
            </SelectParameters>
            <DeleteParameters>
                <asp:Parameter Name="original_TYPE3_ID" Type="Int32" />
                <asp:Parameter Name="original_TYPE3_DETAIL" Type="String" />
                <asp:Parameter Name="original_PRIORITY" Type="Int32" />
                <asp:Parameter Name="original_TYPE2_ID" Type="Int32" />
                <asp:Parameter Name="original_CODE_BAY" Type="Int32" />
                <asp:Parameter Name="original_CODE_RESEARCH" Type="Int32" />
                <asp:Parameter Name="original_FLAG" Type="String" />
                <asp:Parameter Name="original_UPDATE_BY" Type="String" />
                <asp:Parameter Name="original_UPDATE_DATE" Type="Object" />
            </DeleteParameters>
            <UpdateParameters>
                <asp:Parameter Name="TYPE3_DETAIL" Type="String" />
                <asp:Parameter Name="PRIORITY" Type="Int32" />
                <asp:Parameter Name="TYPE2_ID" Type="Int32" />
                <asp:Parameter Name="CODE_BAY" Type="Int32" />
                <asp:Parameter Name="CODE_RESEARCH" Type="Int32" />
                <asp:Parameter Name="FLAG" Type="String" />
                <asp:Parameter Name="UPDATE_BY" Type="String" />
                <asp:Parameter Name="UPDATE_DATE" Type="Object" />
                <asp:Parameter Name="original_TYPE3_ID" Type="Int32" />
                <asp:Parameter Name="original_TYPE3_DETAIL" Type="String" />
                <asp:Parameter Name="original_PRIORITY" Type="Int32" />
                <asp:Parameter Name="original_TYPE2_ID" Type="Int32" />
                <asp:Parameter Name="original_CODE_BAY" Type="Int32" />
                <asp:Parameter Name="original_CODE_RESEARCH" Type="Int32" />
                <asp:Parameter Name="original_FLAG" Type="String" />
                <asp:Parameter Name="original_UPDATE_BY" Type="String" />
                <asp:Parameter Name="original_UPDATE_DATE" Type="Object" />
            </UpdateParameters>
            <InsertParameters>
                <asp:Parameter Name="TYPE3_DETAIL" Type="String" />
                <asp:Parameter Name="PRIORITY" Type="Int32" />
                <asp:Parameter Name="TYPE2_ID" Type="Int32" />
                <asp:Parameter Name="CODE_BAY" Type="Int32" />
                <asp:Parameter Name="CODE_RESEARCH" Type="Int32" />
                <asp:Parameter Name="FLAG" Type="String" />
                <asp:Parameter Name="UPDATE_BY" Type="String" />
                <asp:Parameter Name="UPDATE_DATE" Type="Object" />
            </InsertParameters>
        </asp:SqlDataSource>
    
    </div>
    </form>
</body>
</html>
