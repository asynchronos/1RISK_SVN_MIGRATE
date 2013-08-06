<%@ Page Title="Classify/Ratting" Language="VB" MasterPageFile="~/Iframe.master"
    AutoEventWireup="false" CodeFile="CustomerClassDebt.aspx.vb" Inherits="aspx.customer.CustomerClassDebt" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ScriptPlaceHolder" runat="Server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="ContentPlaceHolder2" runat="Server">
    <div style="width: 100%; text-align: Left;">
        <asp:Label ID="lblHeader" runat="server" Text="Classify" Font-Bold="True" ForeColor="#C00000"></asp:Label>
        <asp:FormView ID="ClassDebtFormView" runat="server" CellPadding="4" DataKeyNames="Cif_No"
            DataSourceID="ClassDebtDS" ForeColor="#333333">
            <FooterStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
            <RowStyle BackColor="#FFFBD6" ForeColor="#333333" />
            <PagerStyle BackColor="#FFCC66" ForeColor="#333333" HorizontalAlign="Center" />
            <ItemTemplate>
                <table border="0" cellpadding="2" cellspacing="1" width="100%" style="background-color: Black">
                    <tr>
                        <td>
                            <table border="0" width="800px">
                                <tr style="background-color: #990000; font-weight: bold; color: White;" align="center">
                                    <td>
                                        <b>Year</b>
                                    </td>
                                    <td>
                                        <b>Jan</b>
                                    </td>
                                    <td>
                                        <b>Feb</b>
                                    </td>
                                    <td style="background-color: #DD0000;">
                                        <b>Mar</b>
                                    </td>
                                    <td>
                                        <b>Apr</b>
                                    </td>
                                    <td>
                                        <b>May</b>
                                    </td>
                                    <td style="background-color: #DD0000;">
                                        <b>Jun</b>
                                    </td>
                                    <td>
                                        <b>Jul</b>
                                    </td>
                                    <td>
                                        <b>Aug</b>
                                    </td>
                                    <td style="background-color: #DD0000;">
                                        <b>Sep</b>
                                    </td>
                                    <td>
                                        <b>Oct</b>
                                    </td>
                                    <td>
                                        <b>Nov</b>
                                    </td>
                                    <td style="background-color: #DD0000;">
                                        <b>Dec</b>
                                    </td>
                                </tr>
                                <tr style="background-color: #FFFBD6; color: #333333" align="center">
                                    <td style="font-style: oblique;">
                                        2548
                                    </td>
                                    <td>
                                        <%#MappingClassify(Eval("Class4801"))%>
                                    </td>
                                    <td>
                                        <%#MappingClassify(Eval("Class4802"))%>
                                    </td>
                                    <td style="background-color: #DD0000; color: White;">
                                        <%#MappingClassify(Eval("Class4803"))%>
                                    </td>
                                    <td>
                                        <%#MappingClassify(Eval("Class4804"))%>
                                    </td>
                                    <td>
                                        <%#MappingClassify(Eval("Class4805"))%>
                                    </td>
                                    <td style="background-color: #DD0000; color: White;">
                                        <%#MappingClassify(Eval("Class4806"))%>
                                    </td>
                                    <td>
                                        <%#MappingClassify(Eval("Class4807"))%>
                                    </td>
                                    <td>
                                        <%#MappingClassify(Eval("Class4808"))%>
                                    </td>
                                    <td style="background-color: #DD0000; color: White;">
                                        <%#MappingClassify(Eval("Class4809"))%>
                                    </td>
                                    <td>
                                        <%#MappingClassify(Eval("Class4810"))%>
                                    </td>
                                    <td>
                                        <%#MappingClassify(Eval("Class4811"))%>
                                    </td>
                                    <td style="background-color: #DD0000; color: White;">
                                        <%#MappingClassify(Eval("Class4812"))%>
                                    </td>
                                </tr>
                                <tr style="background-color: White; color: #333333" align="center">
                                    <td style="font-style: oblique;">
                                        2549
                                    </td>
                                    <td>
                                        <%#MappingClassify(Eval("Class4901"))%>
                                    </td>
                                    <td>
                                        <%#MappingClassify(Eval("Class4902"))%>
                                    </td>
                                    <td style="background-color: #DD0000; color: White;">
                                        <%#MappingClassify(Eval("Class4903"))%>
                                    </td>
                                    <td>
                                        <%#MappingClassify(Eval("Class4904"))%>
                                    </td>
                                    <td>
                                        <%#MappingClassify(Eval("Class4905"))%>
                                    </td>
                                    <td style="background-color: #DD0000; color: White;">
                                        <%#MappingClassify(Eval("Class4906"))%>
                                    </td>
                                    <td>
                                        <%#MappingClassify(Eval("Class4907"))%>
                                    </td>
                                    <td>
                                        <%#MappingClassify(Eval("Class4908"))%>
                                    </td>
                                    <td style="background-color: #DD0000; color: White;">
                                        <%#MappingClassify(Eval("Class4909"))%>
                                    </td>
                                    <td>
                                        <%#MappingClassify(Eval("Class4910"))%>
                                    </td>
                                    <td>
                                        <%#MappingClassify(Eval("Class4911"))%>
                                    </td>
                                    <td style="background-color: #DD0000; color: White;">
                                        <%#MappingClassify(Eval("Class4912"))%>
                                    </td>
                                </tr>
                                <tr style="background-color: #FFFBD6; color: #333333" align="center">
                                    <td style="font-style: oblique;">
                                        2550
                                    </td>
                                    <td>
                                        <%#MappingClassify(Eval("Class5001"))%>
                                    </td>
                                    <td>
                                        <%#MappingClassify(Eval("Class5002"))%>
                                    </td>
                                    <td style="background-color: #DD0000; color: White;">
                                        <%#MappingClassify(Eval("Class5003"))%>
                                    </td>
                                    <td>
                                        <%#MappingClassify(Eval("Class5004"))%>
                                    </td>
                                    <td>
                                        <%#MappingClassify(Eval("Class5005"))%>
                                    </td>
                                    <td style="background-color: #DD0000; color: White;">
                                        <%#MappingClassify(Eval("Class5006"))%>
                                    </td>
                                    <td>
                                        <%#MappingClassify(Eval("Class5007"))%>
                                    </td>
                                    <td>
                                        <%#MappingClassify(Eval("Class5008"))%>
                                    </td>
                                    <td style="background-color: #DD0000; color: White;">
                                        <%#MappingClassify(Eval("Class5009"))%>
                                    </td>
                                    <td>
                                        <%#MappingClassify(Eval("Class5010"))%>
                                    </td>
                                    <td>
                                        <%#MappingClassify(Eval("Class5011"))%>
                                    </td>
                                    <td style="background-color: #DD0000; color: White;">
                                        <%#MappingClassify(Eval("Class5012"))%>
                                    </td>
                                </tr>
                                <tr style="background-color: White; color: #333333" align="center">
                                    <td style="font-style: oblique;">
                                        2551
                                    </td>
                                    <td>
                                        <%#MappingClassify(Eval("Class5101"))%>
                                    </td>
                                    <td>
                                        <%#MappingClassify(Eval("Class5102"))%>
                                    </td>
                                    <td style="background-color: #DD0000; color: White;">
                                        <%#MappingClassify(Eval("Class5103"))%>
                                    </td>
                                    <td>
                                        <%#MappingClassify(Eval("Class5104"))%>
                                    </td>
                                    <td>
                                        <%#MappingClassify(Eval("Class5105"))%>
                                    </td>
                                    <td style="background-color: #DD0000; color: White;">
                                        <%#MappingClassify(Eval("Class5106"))%>
                                    </td>
                                    <td>
                                        <%#MappingClassify(Eval("Class5107"))%>
                                    </td>
                                    <td>
                                        <%#MappingClassify(Eval("Class5108"))%>
                                    </td>
                                    <td style="background-color: #DD0000; color: White;">
                                        <%#MappingClassify(Eval("Class5109"))%>
                                    </td>
                                    <td>
                                        <%#MappingClassify(Eval("Class5110"))%>
                                    </td>
                                    <td>
                                        <%#MappingClassify(Eval("Class5111"))%>
                                    </td>
                                    <td style="background-color: #DD0000; color: White;">
                                        <%#MappingClassify(Eval("Class5112"))%>
                                    </td>
                                </tr>
                                <tr style="background-color: #FFFBD6; color: #333333" align="center">
                                    <td style="font-style: oblique;">
                                        2552
                                    </td>
                                    <td>
                                        <%#MappingClassify(Eval("Class5201"))%>
                                    </td>
                                    <td>
                                        <%#MappingClassify(Eval("Class5202"))%>
                                    </td>
                                    <td style="background-color: #DD0000; color: White;">
                                        <%#MappingClassify(Eval("Class5203"))%>
                                    </td>
                                    <td>
                                        <%#MappingClassify(Eval("Class5204"))%>
                                    </td>
                                    <td>
                                        <%#MappingClassify(Eval("Class5205"))%>
                                    </td>
                                    <td style="background-color: #DD0000; color: White;">
                                        <%#MappingClassify(Eval("Class5206"))%>
                                    </td>
                                    <td>
                                        <%#MappingClassify(Eval("Class5207"))%>
                                    </td>
                                    <td>
                                        <%#MappingClassify(Eval("Class5208"))%>
                                    </td>
                                    <td style="background-color: #DD0000; color: White;">
                                        <%#MappingClassify(Eval("Class5209"))%>
                                    </td>
                                    <td>
                                        <%#MappingClassify(Eval("Class5210"))%>
                                    </td>
                                    <td>
                                        <%#MappingClassify(Eval("Class5211"))%>
                                    </td>
                                    <td style="background-color: #DD0000; color: White;">
                                        <%#MappingClassify(Eval("Class5212"))%>
                                    </td>
                                </tr>
                                <tr style="background-color: White; color: #333333" align="center">
                                    <td style="font-style: oblique;">
                                        2553
                                    </td>
                                    <td>
                                        <%#MappingClassify(Eval("Class5301"))%>
                                    </td>
                                    <td>
                                        <%#MappingClassify(Eval("Class5302"))%>
                                    </td>
                                    <td style="background-color: #DD0000; color: White;">
                                        <%#MappingClassify(Eval("Class5303"))%>
                                    </td>
                                    <td>
                                        <%#MappingClassify(Eval("Class5304"))%>
                                    </td>
                                    <td>
                                        <%#MappingClassify(Eval("Class5305"))%>
                                    </td>
                                    <td style="background-color: #DD0000; color: White;">
                                        <%#MappingClassify(Eval("Class5306"))%>
                                    </td>
                                    <td>
                                        <%#MappingClassify(Eval("Class5307"))%>
                                    </td>
                                    <td>
                                        <%#MappingClassify(Eval("Class5308"))%>
                                    </td>
                                    <td style="background-color: #DD0000; color: White;">
                                        <%#MappingClassify(Eval("Class5309"))%>
                                    </td>
                                    <td>
                                        <%#MappingClassify(Eval("Class5310"))%>
                                    </td>
                                    <td>
                                        <%#MappingClassify(Eval("Class5311"))%>
                                    </td>
                                    <td style="background-color: #DD0000; color: White;">
                                        <%#MappingClassify(Eval("Class5312"))%>
                                    </td>
                                </tr>
                                <tr style="background-color: #FFFBD6; color: #333333" align="center">
                                    <td style="font-style: oblique;">
                                        2554
                                    </td>
                                    <td>
                                        <%#MappingClassify(Eval("Class5401"))%>
                                    </td>
                                    <td>
                                        <%#MappingClassify(Eval("Class5402"))%>
                                    </td>
                                    <td style="background-color: #DD0000; color: White;">
                                        <%#MappingClassify(Eval("Class5403"))%>
                                    </td>
                                    <td>
                                        <%#MappingClassify(Eval("Class5404"))%>
                                    </td>
                                    <td>
                                        <%#MappingClassify(Eval("Class5405"))%>
                                    </td>
                                    <td style="background-color: #DD0000; color: White;">
                                        <%#MappingClassify(Eval("Class5406"))%>
                                    </td>
                                    <td>
                                        <%#MappingClassify(Eval("Class5407"))%>
                                    </td>
                                    <td>
                                        <%#MappingClassify(Eval("Class5408"))%>
                                    </td>
                                    <td style="background-color: #DD0000; color: White;">
                                        <%#MappingClassify(Eval("Class5409"))%>
                                    </td>
                                    <td>
                                        <%#MappingClassify(Eval("Class5410"))%>
                                    </td>
                                    <td>
                                        <%#MappingClassify(Eval("Class5411"))%>
                                    </td>
                                    <td style="background-color: #DD0000; color: White;">
                                        <%#MappingClassify(Eval("Class5412"))%>
                                    </td>
                                </tr>
                                <tr style="background-color: White; color: #333333" align="center">
                                    <td style="font-style: oblique;">
                                        2555
                                    </td>
                                    <td>
                                        <%#MappingClassify(Eval("Class5501"))%>
                                    </td>
                                    <td>
                                        <%#MappingClassify(Eval("Class5502"))%>
                                    </td>
                                    <td style="background-color: #DD0000; color: White;">
                                        <%#MappingClassify(Eval("Class5503"))%>
                                    </td>
                                    <td>
                                        <%#MappingClassify(Eval("Class5504"))%>
                                    </td>
                                    <td>
                                        <%#MappingClassify(Eval("Class5505"))%>
                                    </td>
                                    <td style="background-color: #DD0000; color: White;">
                                        <%#MappingClassify(Eval("Class5506"))%>
                                    </td>
                                    <td>
                                        <%#MappingClassify(Eval("Class5507"))%>
                                    </td>
                                    <td>
                                        <%#MappingClassify(Eval("Class5508"))%>
                                    </td>
                                    <td style="background-color: #DD0000; color: White;">
                                        <%#MappingClassify(Eval("Class5509"))%>
                                    </td>
                                    <td>
                                        <%#MappingClassify(Eval("Class5510"))%>
                                    </td>
                                    <td>
                                        <%#MappingClassify(Eval("Class5511"))%>
                                    </td>
                                    <td style="background-color: #DD0000; color: White;">
                                        <%#MappingClassify(Eval("Class5512"))%>
                                    </td>
                                </tr>
                                <tr style="background-color: #FFFBD6; color: #333333" align="center">
                                    <td style="font-style: oblique;">
                                        2556
                                    </td>
                                    <td>
                                        <%#MappingClassify(Eval("Class5601"))%>
                                    </td>
                                    <td>
                                        <%#MappingClassify(Eval("Class5602"))%>
                                    </td>
                                    <td style="background-color: #DD0000; color: White;">
                                        <%#MappingClassify(Eval("Class5603"))%>
                                    </td>
                                    <td>
                                        <%#MappingClassify(Eval("Class5604"))%>
                                    </td>
                                    <td>
                                        <%#MappingClassify(Eval("Class5605"))%>
                                    </td>
                                    <td style="background-color: #DD0000; color: White;">
                                        <%#MappingClassify(Eval("Class5606"))%>
                                    </td>
                                    <td>
                                        <%#MappingClassify(Eval("Class5607"))%>
                                    </td>
                                    <td>
                                        <%#MappingClassify(Eval("Class5608"))%>
                                    </td>
                                    <td style="background-color: #DD0000; color: White;">
                                        <%#MappingClassify(Eval("Class5609"))%>
                                    </td>
                                    <td>
                                        <%#MappingClassify(Eval("Class5610"))%>
                                    </td>
                                    <td>
                                        <%#MappingClassify(Eval("Class5611"))%>
                                    </td>
                                    <td style="background-color: #DD0000; color: White;">
                                        <%#MappingClassify(Eval("Class5612"))%>
                                    </td>
                                </tr>
                            </table>
                        </td>
                    </tr>
                </table>
            </ItemTemplate>
            <EmptyDataTemplate>
                <table>
                    <tr>
                        <td align="center">
                            <asp:Label ID="NoDataLabel" runat="server" Font-Bold="True" Font-Names="tahoma" ForeColor="Red"
                                Text="No Data"></asp:Label>
                        </td>
                    </tr>
                </table>
            </EmptyDataTemplate>
            <HeaderStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
        </asp:FormView>
        <asp:SqlDataSource ID="ClassDebtDS" runat="server" ConnectionString="<%$ ConnectionStrings:BAY01ConnectionString %>"
            SelectCommand="ClassDebt_ALL_Select" SelectCommandType="StoredProcedure">
            <SelectParameters>
                <asp:QueryStringParameter Name="Cif_No" QueryStringField="cif" Type="Int32" />
            </SelectParameters>
        </asp:SqlDataSource>
    </div>
</asp:Content>
