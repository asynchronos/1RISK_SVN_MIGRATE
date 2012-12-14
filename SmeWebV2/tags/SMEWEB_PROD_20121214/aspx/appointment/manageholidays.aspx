<%@ Page Language="VB" AutoEventWireup="false" CodeFile="manageholidays.aspx.vb" Inherits="aspx_appointment_manageholidays" %>

<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit" tagprefix="cc1" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Untitled Page</title>
    <style type="text/css">
        .style1
        {
            width: 412px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    
    </div>
    <table style="width:100%;">
        <tr>
            <td class="style1">
                <asp:Calendar ID="Calendar1" runat="server" Height="291px" Width="413px">
                </asp:Calendar>
            </td>
            <td>
                <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
                    ConflictDetection="CompareAllValues" 
                    ConnectionString="<%$ ConnectionStrings:BAY01ConnectionString %>" 
                    DeleteCommand="DELETE FROM [TB_Holiday] WHERE [Days] = @original_Days AND [Days_Name] = @original_Days_Name" 
                    InsertCommand="INSERT INTO [TB_Holiday] ([Days], [Days_Name]) VALUES (@Days, @Days_Name)" 
                    OldValuesParameterFormatString="original_{0}" 
                    SelectCommand="SELECT [Days], [Days_Name] FROM [TB_Holiday] WHERE ([Days] = @Days) ORDER BY [Days]" 
                    
                    UpdateCommand="UPDATE [TB_Holiday] SET [Days_Name] = @Days_Name WHERE [Days] = @original_Days">
                    <SelectParameters>
                        <asp:ControlParameter ControlID="Calendar1" Name="Days" 
                            PropertyName="SelectedDate" Type="DateTime" />
                    </SelectParameters>
                    <DeleteParameters>
                        <asp:Parameter Name="original_Days" Type="DateTime" />
                        <asp:Parameter Name="original_Days_Name" Type="String" />
                    </DeleteParameters>
                    <UpdateParameters>
                        <asp:Parameter Name="Days_Name" Type="String" />
                        <asp:Parameter Name="original_Days" Type="DateTime" />
                    </UpdateParameters>
                    <InsertParameters>
                        <asp:Parameter Name="Days" Type="DateTime" />
                        <asp:Parameter Name="Days_Name" Type="String" />
                    </InsertParameters>
                </asp:SqlDataSource>
                <asp:FormView ID="FormView1" runat="server" BackColor="#DEBA84" 
                    BorderColor="#DEBA84" BorderStyle="None" BorderWidth="1px" CellPadding="3" 
                    CellSpacing="2" DataKeyNames="Days" DataSourceID="SqlDataSource1" 
                    GridLines="Both" Height="112px" Width="300px">
                    <FooterStyle BackColor="#F7DFB5" ForeColor="#8C4510" />
                    <RowStyle BackColor="#FFF7E7" ForeColor="#8C4510" />
                    <EditItemTemplate>
                        Days:
                        <asp:Label ID="DaysLabel1" runat="server" Text='<%# Eval("Days") %>' />
                        <br />
                        Days_Name:
                        <asp:TextBox ID="Days_NameTextBox" runat="server" 
                            Text='<%# Bind("Days_Name") %>' />
                        <br />
                        <asp:LinkButton ID="UpdateButton" runat="server" CausesValidation="True" 
                            CommandName="Update" Text="Update" />
                        &nbsp;<asp:LinkButton ID="UpdateCancelButton" runat="server" 
                            CausesValidation="False" CommandName="Cancel" Text="Cancel" />
                    </EditItemTemplate>
                    <InsertItemTemplate>
                        Days:
                        <asp:Label ID="DaysLabel1" runat="server" Text='<%# Bind("Days") %>' />
                        <br />
                        Days_Name:
                        <asp:TextBox ID="Days_NameTextBox" runat="server" 
                            Text='<%# Bind("Days_Name") %>' />
                        <br />
                        <asp:LinkButton ID="InsertButton" runat="server" CausesValidation="True" 
                            CommandName="Insert" Text="Insert" />
                        &nbsp;<asp:LinkButton ID="InsertCancelButton" runat="server" 
                            CausesValidation="False" CommandName="Cancel" Text="Cancel" />
                    </InsertItemTemplate>
                    <ItemTemplate>
                        Days:
                        <asp:Label ID="DaysLabel1" runat="server" Text='<%# Eval("Days") %>' />
                        <br />
                        Days_Name:
                        <asp:Label ID="Days_NameLabel" runat="server" Text='<%# Bind("Days_Name") %>' />
                        <br />
                        <asp:LinkButton ID="EditButton" runat="server" CausesValidation="False" 
                            CommandName="Edit" Text="Edit" />
                        &nbsp;<asp:LinkButton ID="DeleteButton" runat="server" CausesValidation="False" 
                            CommandName="Delete" Text="Delete" />
                        &nbsp;<asp:LinkButton ID="NewButton" runat="server" CausesValidation="False" 
                            CommandName="New" Text="New" />
                    </ItemTemplate>
                    <PagerStyle ForeColor="#8C4510" HorizontalAlign="Center" />
                    <EmptyDataTemplate>
                        <asp:Button ID="Button1" runat="server" onclick="Button1_Click1" Text="Add" />
                    </EmptyDataTemplate>
                    <HeaderStyle BackColor="#A55129" Font-Bold="True" ForeColor="White" />
                    <EditRowStyle BackColor="#738A9C" Font-Bold="True" ForeColor="White" />
                </asp:FormView>
            </td>
        </tr>
    </table>
    </form>
</body>
</html>
