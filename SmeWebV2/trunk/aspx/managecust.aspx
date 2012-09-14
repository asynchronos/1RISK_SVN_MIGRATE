
<%@  Page Language="VB" 
     AutoEventWireup="false" 
     CodeFile="managecust.aspx.vb" 
     Inherits="managecust" 
     MaintainScrollPositionOnPostback="true" 
    
     Title="Untitled Page" 
%>
<%@ Register Src="~/HeaderControl/HeaderControl.ascx" TagName="HeaderControl" TagPrefix="uc1" %>
<%@ Register Src="~/HeaderControl/HeadTagControl.ascx" TagName="HeadTagControl"
    TagPrefix="uc2" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head id="Head1" runat="server">
    <title>Untitled Page</title>
    <uc2:HeadTagControl ID="HeadTagControl1" runat="server" />
</head>
<body>
    <form id="form1" runat="server">
    <div>

  <uc1:HeaderControl ID="HeaderControl1" runat="server" />
        <asp:Panel ID="Panel1" runat="server" Width="342px" >
            <asp:Label ID="Label1" runat="server" Height="3px" Text="Employee profile" Width="133px" Font-Bold="True" Font-Names="Tahoma" Font-Size="Small"></asp:Label>
            <table style="width: 756px">
                <tr>
                    <td>
                        <asp:Label ID="Label4" runat="server" Text="ID:" Width="20px" Font-Bold="True" Font-Names="Tahoma" Font-Size="Small" ForeColor="#0000C0"></asp:Label>
                        <asp:Label ID="EmpIDlbl" runat="server" Text="Label" Width="54px" Font-Bold="True" Font-Names="Tahoma" Font-Size="Small" ForeColor="#0000C0"></asp:Label>
                        <asp:Label ID="emprootlbl" runat="server" Text="Label" Width="597px" Font-Bold="True" Font-Names="Tahoma" Font-Size="Small" ForeColor="#0000C0"></asp:Label></td>
                </tr>
            </table>
        </asp:Panel><asp:Panel ID="Panel2" runat="server" Height="1px" Width="342px">
                <asp:Label ID="Root_namelbl" runat="server" Height="3px" Width="586px" Font-Bold="True" Font-Names="Tahoma" Font-Size="Small"></asp:Label><br />
            <asp:Label ID="nodatalbl" runat="server" ForeColor="#C00000" Width="587px" Font-Names="Tahoma" Font-Size="X-Small"></asp:Label><br />
            <asp:GridView ID="CustRootGrid" runat="server"  AutoGenerateColumns="False"
                CellPadding="4" DataKeyNames="CIF" ForeColor="#333333" GridLines="None" Height="1px"
                Width="802px" PageSize="5" CssClass="drag">
                    <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                    <Columns>
                        <asp:TemplateField HeaderText="Select">
                            <HeaderTemplate>
                                <input id="chkAll1" runat="server" 
                                style="border-top-style: none; border-right-style: none; border-left-style: none;
                                background-color: transparent; border-bottom-style: none" type="checkbox" />
                            </HeaderTemplate>
                            <ItemStyle Width="10px" />
                            <ItemTemplate>
                                <asp:CheckBox ID="chkSelect" runat="server" BorderWidth="0px" Height="5px" />
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:BoundField DataField="CIF" HeaderText="CIF" InsertVisible="False" ReadOnly="True"
                        SortExpression="PersonID" />
                        <asp:BoundField DataField="Name" HeaderText="Name" SortExpression="Name">
                            <ItemStyle Width="300px" />
                        </asp:BoundField>
                        <asp:BoundField DataField="ClassE" HeaderText="ClassE" />
                        <asp:BoundField DataField="Principal" HeaderText="Principal">
                            <ItemStyle HorizontalAlign="Right" VerticalAlign="Top" />
                            <HeaderStyle HorizontalAlign="Right" VerticalAlign="Top" />
                        </asp:BoundField>
                        <asp:BoundField DataField="Oname" HeaderText="Officer Name" />
                        <asp:BoundField DataField="DepTranT" HeaderText="Department" />
                    </Columns>
                    <RowStyle BackColor="#F7F6F3" Font-Size="Smaller" ForeColor="#333333" />
                    <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
                    <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
                    <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" Font-Size="XX-Small" Font-Underline="True"
                    ForeColor="White" HorizontalAlign="Left" VerticalAlign="Top" />
                <EditRowStyle BackColor="#999999" />
                <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                </asp:GridView>
                    <table style="width: 49%">
                        <tr>
                            <td align="right" style="width: 52%">
                                <asp:Label ID="Label3" runat="server" ForeColor="Black" Text="Go to page :" Width="75px"></asp:Label></td>
                            <td align="left" style="width: 50%">
                                <asp:DropDownList ID="DropDownList1" runat="server" AutoPostBack="True" OnSelectedIndexChanged="DropDownList1_SelectedIndexChanged"
                                    Width="78px">
                                </asp:DropDownList>
                            </td>
                        </tr>
                    </table>
            <asp:Button ID="SendBtn" runat="server" Text="Send" Width="67px" BackColor="#C0FFC0" /></asp:Panel>

        <asp:Panel ID="Panel3" runat="server" Height="1px" Width="341px">
            <br />
            <table style="width: 842px" border="1" bordercolor="lightgrey" bordercolordark="dimgray" bordercolorlight="ghostwhite" cellpadding="1" cellspacing="1">
                <tr>
                    <td align="left" valign="top" width="100" style="height: 118px">
                        <asp:Label ID="Label2" runat="server" Text="Select" Width="100px"></asp:Label><br />
                        <asp:Panel ID="Panel4" runat="server" Height="500px" ScrollBars="Vertical" Width="300px"   style="cursor:se-resize">
         <asp:TreeView ID="LevelTree" runat="server" 
         ImageSet="Simple" NodeIndent="10" ShowLines="True" ExpandDepth="1" Width="200px"
            >
         
            <ParentNodeStyle Font-Bold="False" />
            <HoverNodeStyle Font-Underline="True" ForeColor="#5555DD" />
            <SelectedNodeStyle Font-Underline="True" HorizontalPadding="0px" VerticalPadding="0px" ForeColor="#5555DD" />
            <NodeStyle Font-Names="Tahoma" Font-Size="10pt" ForeColor="Black" HorizontalPadding="0px"
                NodeSpacing="0px" VerticalPadding="0px" />
             <LeafNodeStyle NodeSpacing="0px" />
          </asp:TreeView>
                        </asp:Panel>
                    </td>
                    <td align="left" valign="top" style="height: 118px">
                        <br />
                        <asp:Label ID="emplbl" runat="server" Width="711px" Font-Bold="True" Font-Names="Tahoma" Font-Size="Small" ForeColor="Navy"></asp:Label><br />
                        <asp:Label ID="level_namelbl" runat="server" Font-Bold="True" Font-Names="Tahoma"
                            Font-Size="Small" ForeColor="Black" Width="710px"></asp:Label>
                        <br />
                        <asp:Label ID="nodatalbl2" runat="server" ForeColor="#C00000" Width="709px"></asp:Label><br />
            <asp:GridView ID="LevelCustGrid" runat="server" AutoGenerateColumns="False" 
                CellPadding="4" DataKeyNames="CIF" ForeColor="#333333" GridLines="None" Height="1px"
                Width="761px" PageSize="5">
                <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                <Columns>
                    <asp:TemplateField HeaderText="Select">
                        <HeaderTemplate>
                            <input id="chkAll1" runat="server" 
                                style="border-top-style: none; border-right-style: none; border-left-style: none;
                                background-color: transparent; border-bottom-style: none" type="checkbox" />
                        </HeaderTemplate>
                        <ItemStyle Width="10px" />
                        <ItemTemplate>
                            <asp:CheckBox ID="chkSelect" runat="server" BorderWidth="0px" Height="5px" />
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:BoundField DataField="CIF" HeaderText="CIF" InsertVisible="False" ReadOnly="True"
                        SortExpression="PersonID" />
                    <asp:BoundField DataField="Name" HeaderText="Name" SortExpression="Name">
                        <ItemStyle Width="280px" />
                    </asp:BoundField>
                    <asp:BoundField DataField="ClassE" HeaderText="ClassE" />
                    <asp:BoundField DataField="Principal" HeaderText="Principal">
                        <ItemStyle HorizontalAlign="Right" VerticalAlign="Top" />
                        <HeaderStyle HorizontalAlign="Right" VerticalAlign="Top" />
                    </asp:BoundField>
                    <asp:BoundField DataField="Oname" HeaderText="Officer Name" />
                    <asp:BoundField DataField="DepTranT" HeaderText="Department" />
                </Columns>
                <RowStyle BackColor="#F7F6F3" Font-Size="Smaller" ForeColor="#333333" />
                <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
                <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
                <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" Font-Size="XX-Small" Font-Underline="True"
                    ForeColor="White" HorizontalAlign="Left" VerticalAlign="Top" />
                <EditRowStyle BackColor="#999999" />
                <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
            </asp:GridView>
                    <table style="width: 10%">
                        <tr>
                            <td align="right" style="width: 50%">
                                <asp:Label ID="Label5" runat="server" ForeColor="Black" Text="Go to page :" Width="79px"></asp:Label></td>
                            <td align="left" style="width: 55%">
                                <asp:DropDownList ID="DropDownList2" runat="server" AutoPostBack="True" OnSelectedIndexChanged="DropDownList2_SelectedIndexChanged"
                                    Width="65px">
                                </asp:DropDownList>
                            </td>
                        </tr>
                    </table>
                        <br />
                        <asp:Button ID="RemoveBtn" runat="server" Text="Remove" Width="78px" BackColor="#FF8080" /></td>
                </tr>
            </table>
            </asp:Panel>
           
  </div>
    </form>
</body>
</html>
