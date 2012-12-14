<%@ Page Title="Port Summary" Language="VB" MasterPageFile="~/MasterPage.master"
    AutoEventWireup="false" CodeFile="Summary.aspx.vb" Inherits="aspx.portfolio.Summary" %>

<%@ Register Src="../../Controls/ControllingTree/ControllingTree.ascx" TagName="ControllingTree"
    TagPrefix="uc1" %>
    
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ScriptPlaceHolder" runat="Server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="ContentPlaceHolder2" runat="Server">
    <table>
        <tr valign="top">
            <td align="left">
                <uc1:ControllingTree ID="ControllingTree1" runat="server" />
                <asp:HiddenField ID="Hidd_TreeSelectedValue" runat="server" />
                <asp:HiddenField ID="Hidd_TreeSelectedValueType" runat="server" />
                <asp:HiddenField ID="Hidd_TreeSelectedEmpIds" runat="server" />
            </td>
            <td>
                <asp:Label ID="TreeSelectedLabel" runat="server" Text="Label" Font-Bold="True" Font-Italic="False"
                    Font-Size="Larger" ForeColor="Red" Font-Underline="True"></asp:Label>
                <asp:Panel ID="FilterPanel" runat="server" HorizontalAlign="Center">
                    <table id="FilterTable" style="text-align: center">
                        <tr>
                            <td>
                                Group By
                            </td>
                            <td>
                                Order By
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <asp:DropDownList ID="FilterColumnDD1" runat="server">
                                </asp:DropDownList>
                            </td>
                            <td>
                                <asp:DropDownList ID="OrderColumnDD1" runat="server">
                                </asp:DropDownList>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <asp:DropDownList ID="FilterColumnDD2" runat="server">
                                </asp:DropDownList>
                            </td>
                            <td>
                                <asp:DropDownList ID="OrderColumnDD2" runat="server">
                                </asp:DropDownList>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <asp:DropDownList ID="FilterColumnDD3" runat="server">
                                </asp:DropDownList>
                            </td>
                            <td>
                                <asp:DropDownList ID="OrderColumnDD3" runat="server">
                                </asp:DropDownList>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <asp:DropDownList ID="FilterColumnDD4" runat="server">
                                </asp:DropDownList>
                            </td>
                            <td>
                                <asp:DropDownList ID="OrderColumnDD4" runat="server">
                                </asp:DropDownList>
                            </td>
                        </tr>
                    </table>
                    <asp:Button ID="SummaryBt" runat="server" Text="Summary" />
                </asp:Panel>
                <asp:Panel ID="SummaryPanel" runat="server" HorizontalAlign="Center">
                    <asp:GridView ID="SummaryGridView" runat="server" AutoGenerateColumns="False" CellPadding="4"
                        ForeColor="#333333" ShowFooter="True" HorizontalAlign="Center"
                        DataSourceID="ObjectDataSource1">
                        <FooterStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
                        <RowStyle BackColor="#FFFBD6" ForeColor="#333333" />
                        <SelectedRowStyle BackColor="#FFCC66" Font-Bold="True" ForeColor="Navy" />
                        <PagerStyle BackColor="#FFCC66" ForeColor="#333333" HorizontalAlign="Center" />
                        <HeaderStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
                        <AlternatingRowStyle BackColor="White" />
                        <Columns>
                            <asp:TemplateField>
                                <HeaderTemplate>
                                    <%#FilterColumnDD1.Items(FilterColumnDD1.SelectedIndex).Text%>
                                </HeaderTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="FilterLabel1" runat="server" Text='<%#Eval(FilterColumnDD1.SelectedValue)%>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField>
                                <HeaderTemplate>
                                    <%#FilterColumnDD2.Items(FilterColumnDD2.SelectedIndex).Text%>
                                </HeaderTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="FilterLabel2" runat="server" Text='<%#Eval(FilterColumnDD2.SelectedValue)%>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField>
                                <HeaderTemplate>
                                    <%#FilterColumnDD3.Items(FilterColumnDD3.SelectedIndex).Text%>
                                </HeaderTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="FilterLabel3" runat="server" Text='<%#Eval(FilterColumnDD3.SelectedValue)%>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField>
                                <HeaderTemplate>
                                    <%#FilterColumnDD4.Items(FilterColumnDD4.SelectedIndex).Text%>
                                </HeaderTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="FilterLabel4" runat="server" Text='<%#Eval(FilterColumnDD4.SelectedValue)%>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="CountCIF" SortExpression="CountCIF">
                                <ItemTemplate>
                                    <asp:Label ID="CountCIF" runat="server" Text='<%# Bind("CountCIF") %>'></asp:Label>
                                </ItemTemplate>
                                <FooterTemplate>
                                    <%#sumCountCIF%>
                                </FooterTemplate>
                                <ItemStyle HorizontalAlign="Right" />
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Principal" SortExpression="Principal">
                                <ItemTemplate>
                                    <asp:Label ID="Principal" runat="server" Text='<%# Format(Eval("Principal"), "#,###0.00") %>'></asp:Label>
                                </ItemTemplate>
                                <FooterTemplate>
                                    <%#Format(sumPrincipal, "#,###0.00")%>
                                </FooterTemplate>
                                <ItemStyle HorizontalAlign="Right" />
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Accru" SortExpression="Accru">
                                <ItemTemplate>
                                    <asp:Label ID="Accru" runat="server" Text='<%# Format(Eval("Accru"), "#,###0.00") %>'></asp:Label>
                                </ItemTemplate>
                                <FooterTemplate>
                                    <%#Format(sumAccru, "#,###0.00")%>
                                </FooterTemplate>
                                <ItemStyle HorizontalAlign="Right" />
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Susp" SortExpression="Susp">
                                <ItemTemplate>
                                    <asp:Label ID="Susp" runat="server" Text='<%# Format(Eval("Susp"), "#,###0.00") %>'></asp:Label>
                                </ItemTemplate>
                                <FooterTemplate>
                                    <%#Format(sumSusp, "#,###0.00")%>
                                </FooterTemplate>
                                <ItemStyle HorizontalAlign="Right" />
                            </asp:TemplateField>
                            <asp:TemplateField>
                                <ItemTemplate>
                                    <asp:ImageButton ID="DetailImageButton" runat="server" ImageUrl="~/images/Magnifying Glass.gif" />
                                </ItemTemplate>
                            </asp:TemplateField>
                        </Columns>
                    </asp:GridView>
                    <asp:ObjectDataSource ID="ObjectDataSource1" runat="server" SelectMethod="getCustomerInControllingSummary"
                        TypeName="RiskControllingBO" OldValuesParameterFormatString="original_{0}">
                        <SelectParameters>
                            <asp:ControlParameter ControlID="Hidd_TreeSelectedEmpIds" Name="EMP_IDs" PropertyName="Value" />
                            <asp:ControlParameter ControlID="FilterColumnDD1" Name="filter1" PropertyName="SelectedValue"
                                Type="String" />
                            <asp:ControlParameter ControlID="FilterColumnDD2" Name="filter2" PropertyName="SelectedValue"
                                Type="String" />
                            <asp:ControlParameter ControlID="FilterColumnDD3" Name="filter3" PropertyName="SelectedValue"
                                Type="String" />
                            <asp:ControlParameter ControlID="FilterColumnDD4" Name="filter4" PropertyName="SelectedValue"
                                Type="String" />
                            <asp:ControlParameter ControlID="OrderColumnDD1" Name="order1" PropertyName="SelectedValue"
                                Type="String" />
                            <asp:ControlParameter ControlID="OrderColumnDD2" Name="order2" PropertyName="SelectedValue"
                                Type="String" />
                            <asp:ControlParameter ControlID="OrderColumnDD3" Name="order3" PropertyName="SelectedValue"
                                Type="String" />
                            <asp:ControlParameter ControlID="OrderColumnDD4" Name="order4" PropertyName="SelectedValue"
                                Type="String" />
                        </SelectParameters>
                    </asp:ObjectDataSource>
                </asp:Panel>
            </td>
        </tr>
    </table>
</asp:Content>
