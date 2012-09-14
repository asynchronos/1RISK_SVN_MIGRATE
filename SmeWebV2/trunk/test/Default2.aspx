<%@ Page Language="VB" AutoEventWireup="false" CodeFile="Default2.aspx.vb" Inherits="test_Default2" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Untitled Page</title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <table>
            <tr>
                <td colspan="5">
                    2-3-3<asp:SqlDataSource ID="SqlDataSource1" runat="server" 
                        ConnectionString="<%$ ConnectionStrings:BAY01ConnectionString %>" 
                        SelectCommand="SELECT BUSI_TYPE, BUSI_TYPE + ':' + DESCRIPTION + ':' + ISNULL(FLAG, ' ') AS DESCRIPTION, FLAG FROM TBMM031_197 WHERE (BUSI_TYPE LIKE '%000000')">
                    </asp:SqlDataSource>
                    <asp:SqlDataSource ID="SqlDataSource2" runat="server"
                        ConnectionString="<%$ ConnectionStrings:BAY01ConnectionString %>" 
                        SelectCommand="SELECT BUSI_TYPE, BUSI_TYPE + ':' + DESCRIPTION + ':' + ISNULL(FLAG, ' ') AS DESCRIPTION, FLAG FROM TBMM031_197 WHERE (BUSI_TYPE LIKE LEFT (@BUSI_TYPE, 2) + '%000') AND (BUSI_TYPE &lt;&gt; @BUSI_TYPE)">
                        <SelectParameters>
                            <asp:ControlParameter ControlID="DropDownList1" Name="BUSI_TYPE" 
                                PropertyName="SelectedValue" />
                        </SelectParameters>
                    </asp:SqlDataSource>
                    <asp:SqlDataSource ID="SqlDataSource3" runat="server" 
                        ConnectionString="<%$ ConnectionStrings:BAY01ConnectionString %>" 
                        SelectCommand="SELECT BUSI_TYPE, BUSI_TYPE + ':' + DESCRIPTION + ':' + ISNULL(FLAG, ' ') AS DESCRIPTION, FLAG FROM TBMM031_197 WHERE (BUSI_TYPE LIKE LEFT (@BUSI_TYPE, 5) + '%') AND (BUSI_TYPE &lt;&gt; @BUSI_TYPE)">
                        <SelectParameters>
                            <asp:ControlParameter ControlID="DropDownList2" Name="BUSI_TYPE" 
                                PropertyName="SelectedValue" />
                        </SelectParameters>
                    </asp:SqlDataSource>
                </td>
            </tr>
            <tr>
                <td>
                    <asp:DropDownList ID="DropDownList1" runat="server" 
                        DataSourceID="SqlDataSource1" DataTextField="DESCRIPTION" 
                        DataValueField="BUSI_TYPE" AutoPostBack="True">
                    </asp:DropDownList>
                </td>
                <td>
                    <asp:DropDownList ID="DropDownList2" runat="server" 
                        DataSourceID="SqlDataSource2" DataTextField="DESCRIPTION" 
                        DataValueField="BUSI_TYPE" AutoPostBack="True">
                    </asp:DropDownList>
                </td>
                <td>
                    <asp:DropDownList ID="DropDownList3" runat="server" 
                        DataSourceID="SqlDataSource3" DataTextField="DESCRIPTION" 
                        DataValueField="BUSI_TYPE">
                    </asp:DropDownList>
                </td>
                <td>
                
                </td>
                <td>
                
                </td>
            </tr>
            <tr>
                <td colspan="5">
                    2-1-1-4<asp:SqlDataSource ID="SqlDataSource5" runat="server" 
                        ConnectionString="<%$ ConnectionStrings:BAY01ConnectionString %>" 
                        SelectCommand="SELECT BUSI_TYPE, BUSI_TYPE + ':' + DESCRIPTION + ':' + ISNULL(FLAG, ' ') AS DESCRIPTION, FLAG FROM TBMM031_197 WHERE (BUSI_TYPE LIKE LEFT (@BUSI_TYPE, 2) + '%00000') AND (BUSI_TYPE &lt;&gt; @BUSI_TYPE)">
                        <SelectParameters>
                            <asp:ControlParameter ControlID="DropDownList4" Name="BUSI_TYPE" 
                                PropertyName="SelectedValue" />
                        </SelectParameters>
                    </asp:SqlDataSource>
                    <asp:SqlDataSource ID="SqlDataSource6" runat="server"
                        ConnectionString="<%$ ConnectionStrings:BAY01ConnectionString %>" 
                        SelectCommand="SELECT BUSI_TYPE, BUSI_TYPE + ':' + DESCRIPTION + ':' + ISNULL(FLAG, ' ') AS DESCRIPTION, FLAG FROM TBMM031_197 WHERE (BUSI_TYPE LIKE LEFT (@BUSI_TYPE, 3) + '%0000') AND (BUSI_TYPE &lt;&gt; @BUSI_TYPE)">
                        <SelectParameters>
                            <asp:ControlParameter ControlID="DropDownList5" Name="BUSI_TYPE" 
                                PropertyName="SelectedValue" />
                        </SelectParameters>
                    </asp:SqlDataSource>
                    <asp:SqlDataSource ID="SqlDataSource7" runat="server" 
                        ConnectionString="<%$ ConnectionStrings:BAY01ConnectionString %>" 
                        SelectCommand="SELECT BUSI_TYPE, BUSI_TYPE + ':' + DESCRIPTION + ':' + ISNULL(FLAG, ' ') AS DESCRIPTION, FLAG FROM TBMM031_197 WHERE (BUSI_TYPE LIKE LEFT (@BUSI_TYPE, 4) + '%') AND (BUSI_TYPE &lt;&gt; @BUSI_TYPE)">
                        <SelectParameters>
                            <asp:ControlParameter ControlID="DropDownList6" Name="BUSI_TYPE" 
                                PropertyName="SelectedValue" />
                        </SelectParameters>
                    </asp:SqlDataSource>
                </td>
            </tr>
            <tr>
                <td>
                    
                    <asp:DropDownList ID="DropDownList4" runat="server" AutoPostBack="True" 
                        DataSourceID="SqlDataSource1" DataTextField="DESCRIPTION" 
                        DataValueField="BUSI_TYPE">
                    </asp:DropDownList>
                    
                </td>
                <td>
                
                    <asp:DropDownList ID="DropDownList5" runat="server" AutoPostBack="True" 
                        DataSourceID="SqlDataSource5" DataTextField="DESCRIPTION" 
                        DataValueField="BUSI_TYPE">
                    </asp:DropDownList>
                
                </td>
                <td>
                
                    <asp:DropDownList ID="DropDownList6" runat="server" AutoPostBack="True" 
                        DataSourceID="SqlDataSource6" DataTextField="DESCRIPTION" 
                        DataValueField="BUSI_TYPE">
                    </asp:DropDownList>
                
                </td>
                <td>
                
                    <asp:DropDownList ID="DropDownList7" runat="server" 
                        DataSourceID="SqlDataSource7" DataTextField="DESCRIPTION" 
                        DataValueField="BUSI_TYPE">
                    </asp:DropDownList>
                </td>
                <td>
                
                </td>
            </tr>
            <tr>
                <td colspan="5">
                    2-1-2-3<asp:SqlDataSource ID="SqlDataSource9" runat="server" 
                        ConnectionString="<%$ ConnectionStrings:BAY01ConnectionString %>" 
                        SelectCommand="SELECT BUSI_TYPE, BUSI_TYPE + ':' + DESCRIPTION + ':' + ISNULL(FLAG, ' ') AS DESCRIPTION, FLAG FROM TBMM031_197 WHERE (BUSI_TYPE LIKE LEFT (@BUSI_TYPE, 2) + '%00000') AND (BUSI_TYPE &lt;&gt; @BUSI_TYPE)">
                        <SelectParameters>
                            <asp:ControlParameter ControlID="DropDownList8" Name="BUSI_TYPE" 
                                PropertyName="SelectedValue" />
                        </SelectParameters>
                    </asp:SqlDataSource>
                    <asp:SqlDataSource ID="SqlDataSource10" runat="server"
                        ConnectionString="<%$ ConnectionStrings:BAY01ConnectionString %>" 
                        SelectCommand="SELECT BUSI_TYPE, BUSI_TYPE + ':' + DESCRIPTION + ':' + ISNULL(FLAG, ' ') AS DESCRIPTION, FLAG FROM TBMM031_197 WHERE (BUSI_TYPE LIKE LEFT (@BUSI_TYPE, 3) + '%000') AND (BUSI_TYPE &lt;&gt; @BUSI_TYPE)">
                        <SelectParameters>
                            <asp:ControlParameter ControlID="DropDownList9" Name="BUSI_TYPE" 
                                PropertyName="SelectedValue" />
                        </SelectParameters>
                    </asp:SqlDataSource>
                    <asp:SqlDataSource ID="SqlDataSource11" runat="server" 
                        ConnectionString="<%$ ConnectionStrings:BAY01ConnectionString %>" 
                        SelectCommand="SELECT BUSI_TYPE, BUSI_TYPE + ':' + DESCRIPTION + ':' + ISNULL(FLAG, ' ') AS DESCRIPTION, FLAG FROM TBMM031_197 WHERE (BUSI_TYPE LIKE LEFT (@BUSI_TYPE, 5) + '%') AND (BUSI_TYPE &lt;&gt; @BUSI_TYPE)">
                        <SelectParameters>
                            <asp:ControlParameter ControlID="DropDownList10" Name="BUSI_TYPE" 
                                PropertyName="SelectedValue" />
                        </SelectParameters>
                    </asp:SqlDataSource>
                </td>
            </tr>
            <tr>
                <td>
                    
                    <asp:DropDownList ID="DropDownList8" runat="server" AutoPostBack="True" 
                        DataSourceID="SqlDataSource1" DataTextField="DESCRIPTION" 
                        DataValueField="BUSI_TYPE">
                    </asp:DropDownList>
                    
                </td>
                <td>
                
                    <asp:DropDownList ID="DropDownList9" runat="server" AutoPostBack="True" 
                        DataSourceID="SqlDataSource9" DataTextField="DESCRIPTION" 
                        DataValueField="BUSI_TYPE">
                    </asp:DropDownList>
                
                </td>
                <td>
                
                    <asp:DropDownList ID="DropDownList10" runat="server" AutoPostBack="True" 
                        DataSourceID="SqlDataSource10" DataTextField="DESCRIPTION" 
                        DataValueField="BUSI_TYPE">
                    </asp:DropDownList>
                
                </td>
                <td>
                
                    <asp:DropDownList ID="DropDownList11" runat="server" 
                        DataSourceID="SqlDataSource11" DataTextField="DESCRIPTION" 
                        DataValueField="BUSI_TYPE">
                    </asp:DropDownList>
                
                </td>
                <td>
                
                </td>
            </tr>
            <tr>
                <td colspan="5">
                    2-1-1-1-3<asp:SqlDataSource ID="SqlDataSource13" runat="server" 
                        ConnectionString="<%$ ConnectionStrings:BAY01ConnectionString %>" 
                        SelectCommand="SELECT BUSI_TYPE, BUSI_TYPE + ':' + DESCRIPTION + ':' + ISNULL(FLAG, ' ') AS DESCRIPTION, FLAG FROM TBMM031_197 WHERE (BUSI_TYPE LIKE LEFT (@BUSI_TYPE, 2) + '%00000') AND (BUSI_TYPE &lt;&gt; @BUSI_TYPE)">
                        <SelectParameters>
                            <asp:ControlParameter ControlID="DropDownList12" Name="BUSI_TYPE" 
                                PropertyName="SelectedValue" />
                        </SelectParameters>
                    </asp:SqlDataSource>
                    <asp:SqlDataSource ID="SqlDataSource14" runat="server"
                        ConnectionString="<%$ ConnectionStrings:BAY01ConnectionString %>" 
                        SelectCommand="SELECT BUSI_TYPE, BUSI_TYPE + ':' + DESCRIPTION + ':' + ISNULL(FLAG, ' ') AS DESCRIPTION, FLAG FROM TBMM031_197 WHERE (BUSI_TYPE LIKE LEFT (@BUSI_TYPE, 3) + '%0000') AND (BUSI_TYPE &lt;&gt; @BUSI_TYPE)">
                        <SelectParameters>
                            <asp:ControlParameter ControlID="DropDownList13" Name="BUSI_TYPE" 
                                PropertyName="SelectedValue" />
                        </SelectParameters>
                    </asp:SqlDataSource>
                    <asp:SqlDataSource ID="SqlDataSource15" runat="server" 
                        ConnectionString="<%$ ConnectionStrings:BAY01ConnectionString %>" 
                        SelectCommand="SELECT BUSI_TYPE, BUSI_TYPE + ':' + DESCRIPTION + ':' + ISNULL(FLAG, ' ') AS DESCRIPTION, FLAG FROM TBMM031_197 WHERE (BUSI_TYPE LIKE LEFT (@BUSI_TYPE, 4) + '%000') AND (BUSI_TYPE &lt;&gt; @BUSI_TYPE)">
                        <SelectParameters>
                            <asp:ControlParameter ControlID="DropDownList14" Name="BUSI_TYPE" 
                                PropertyName="SelectedValue" />
                        </SelectParameters>
                    </asp:SqlDataSource>
                    <asp:SqlDataSource ID="SqlDataSource16" runat="server" 
                        ConnectionString="<%$ ConnectionStrings:BAY01ConnectionString %>" 
                        SelectCommand="SELECT BUSI_TYPE, BUSI_TYPE + ':' + DESCRIPTION + ':' + ISNULL(FLAG, ' ') AS DESCRIPTION, FLAG FROM TBMM031_197 WHERE (BUSI_TYPE LIKE LEFT (@BUSI_TYPE, 5) + '%') AND (BUSI_TYPE &lt;&gt; @BUSI_TYPE)">
                        <SelectParameters>
                            <asp:ControlParameter ControlID="DropDownList15" Name="BUSI_TYPE" 
                                PropertyName="SelectedValue" />
                        </SelectParameters>
                    </asp:SqlDataSource>
                </td>
            </tr>
            <tr>
                <td>
                    
                    <asp:DropDownList ID="DropDownList12" runat="server" AutoPostBack="True" 
                        DataSourceID="SqlDataSource1" DataTextField="DESCRIPTION" 
                        DataValueField="BUSI_TYPE">
                    </asp:DropDownList>
                    
                </td>
                <td>
                
                    <asp:DropDownList ID="DropDownList13" runat="server" AutoPostBack="True" 
                        DataSourceID="SqlDataSource13" DataTextField="DESCRIPTION" 
                        DataValueField="BUSI_TYPE">
                    </asp:DropDownList>
                
                </td>
                <td>
                
                    <asp:DropDownList ID="DropDownList14" runat="server" AutoPostBack="True" 
                        DataSourceID="SqlDataSource14" DataTextField="DESCRIPTION" 
                        DataValueField="BUSI_TYPE">
                    </asp:DropDownList>
                
                </td>
                <td>
                
                    <asp:DropDownList ID="DropDownList15" runat="server" AutoPostBack="True" 
                        DataSourceID="SqlDataSource15" DataTextField="DESCRIPTION" 
                        DataValueField="BUSI_TYPE">
                    </asp:DropDownList>
                
                </td>
                <td>
                    <asp:DropDownList ID="DropDownList16" runat="server" 
                        DataSourceID="SqlDataSource16" DataTextField="DESCRIPTION" 
                        DataValueField="BUSI_TYPE">
                    </asp:DropDownList>
                </td>
            </tr>
        </table>
    </div>
    </form>
</body>
</html>
