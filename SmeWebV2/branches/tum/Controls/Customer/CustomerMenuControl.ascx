<%@ Control Language="VB" AutoEventWireup="false" CodeFile="CustomerMenuControl.ascx.vb"
    Inherits="aspx.userControl.CustomerMenuControl" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxToolkit" %>

<script type="text/javascript">
    //use Ext library
    //iframe ต้องมี property myid
    function changeIframeSrc(myid, url, param) {
        var urlFull = "";

        var iframe = Ext.select("iframe[myid=" + myid + "]");
        if (param) {
            urlFull = url + "?" + param;
        } else {
            urlFull = url;
        }
        iframe.item(0).dom.src = urlFull;
    }
</script>

<div style="text-align: left; position: absolute; right: 0">
    <asp:Panel ID="Panel_Container" runat="server">
        <asp:Panel ID="Panel_Header" runat="server" CssClass="collapsePanelHeader" Width="200px"
            Height="30px" TabIndex="3">
            <div style="padding: 5px; cursor: pointer; vertical-align: middle;">
                <div style="float: left;">
                    <asp:Label ID="Label_Menu" runat="server">Show Menu...</asp:Label>
                </div>
                <div style="float: right; vertical-align: middle;">
                    <asp:ImageButton ID="Image1" runat="server" ImageUrl="~/images/expand_blue.jpg" AlternateText="(Show Menu...)" />
                </div>
            </div>
        </asp:Panel>
        <asp:Panel ID="Panel_Detail" runat="server" CssClass="collapsePanel" Width="200px">
            <table>
                <tr align="left">
                    <td>
                        <asp:LinkButton ID="LinkButt_Menu1" runat="server" Text="Menu1" TabIndex="4" />
                    </td>
                </tr>
                <tr align="left">
                    <td>
                        <asp:LinkButton ID="LinkButt_Menu2" runat="server" Text="Menu2" TabIndex="5" />
                    </td>
                </tr>
                <tr align="left">
                    <td>
                        <asp:LinkButton ID="LinkButt_Menu3" runat="server" Text="Menu3" TabIndex="6" />
                    </td>
                </tr>
                <tr align="left">
                    <td>
                        <asp:LinkButton ID="LinkButt_Menu4" runat="server" Text="Menu4" TabIndex="7" />
                    </td>
                </tr>
                <tr align="left">
                    <td>
                        <asp:LinkButton ID="LinkButt_Menu5" runat="server" Text="Menu5" TabIndex="8" />
                    </td>
                </tr>
                <tr align="left">
                    <td>
                        <asp:LinkButton ID="LinkButt_Menu6" runat="server" Text="Menu6" TabIndex="9" />
                    </td>
                </tr>
                <tr align="left">
                    <td>
                        <asp:LinkButton ID="LinkButt_Menu7" runat="server" Text="Menu7" TabIndex="10" />
                    </td>
                </tr>
                <tr align="left">
                    <td>
                        <asp:LinkButton ID="LinkButt_Menu8" runat="server" Text="Menu8" TabIndex="11" />
                    </td>
                </tr>
            </table>
        </asp:Panel>
        <ajaxToolkit:CollapsiblePanelExtender ID="CollapsiblePanelExtender" runat="server"
            Enabled="True" TargetControlID="Panel_Detail" ExpandControlID="Panel_Header"
            CollapseControlID="Panel_Header" TextLabelID="Label_Menu" ImageControlID="Image1"
            ExpandedText="Hide Menu..." CollapsedText="Show Menu..." ExpandedImage="~/images/collapse_blue.jpg"
            CollapsedImage="~/images/expand_blue.jpg" SuppressPostBack="true">
        </ajaxToolkit:CollapsiblePanelExtender>
    </asp:Panel>
</div>
<div style="text-align: center;">
    <table border="1">
        <tr>
            <td>
                <br />
                CIF:<asp:TextBox ID="TextBox_Cif" runat="server" Style="text-align: right;"></asp:TextBox>
                <asp:Button ID="Butt_Search" runat="server" Text="Search" TabIndex="1" />
                <asp:FormView ID="FV_CustomerName" runat="server" DataKeyNames="CIF" DataSourceID="DS_CustomerName"
                    HorizontalAlign="Center">
                    <ItemTemplate>
                        <asp:Label ID="CIFLabel" runat="server" Text='<%# Eval("CIF") %>' />
                        -
                        <asp:Label ID="NAMELabel" runat="server" Text='<%# Bind("NAME") %>' />
                    </ItemTemplate>
                    <EmptyDataTemplate>
                        &nbsp;
                    </EmptyDataTemplate>
                </asp:FormView>
                <asp:SqlDataSource ID="DS_CustomerName" runat="server" ConnectionString="<%$ ConnectionStrings:BAY01ConnectionString %>"
                    SelectCommand="SELECT CIF, dbo.GetName(CUS_TITLE, CUS_FIRST, CUS_LAST) AS NAME FROM CUSTOMER WHERE (CIF = @cif)">
                    <SelectParameters>
                        <asp:ControlParameter ControlID="TextBox_Cif" Name="cif" PropertyName="Text" />
                    </SelectParameters>
                </asp:SqlDataSource>
            </td>
        </tr>
    </table>
</div>
