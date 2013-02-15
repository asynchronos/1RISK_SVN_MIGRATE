<%@ Page Title="ภาระหนี้ย้อนหลัง" Language="VB" MasterPageFile="~/Iframe.master" AutoEventWireup="false" CodeFile="CustomerDebtPrev.aspx.vb" Inherits="aspx.customer.CustomerDebtPrev" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ScriptPlaceHolder" Runat="Server">
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
</asp:Content>

<asp:Content ID="Content4" ContentPlaceHolderID="ContentPlaceHolder2" Runat="Server">
    <div>
        <table width="100%">
            <tr align="center">
                <td>
                    Select Year : 
                    <asp:DropDownList ID="YearDropDownList" runat="server">
                    </asp:DropDownList>
                    <asp:Button ID="SearchButton" runat="server" Text="Search" /></td>
            </tr>
            <tr align="center">
                <td>                    
                    <asp:Label ID="ErrorLabel" runat="server" Font-Bold="True" Font-Names="tahoma" ForeColor="Red"
                        Text=""></asp:Label>
                    <asp:Repeater ID="DebtPrevRepeater" runat="server" DataSourceID="DebtPrevDS">
                        <HeaderTemplate>
                            <table style="color:#333333">
                                <thead style="background-color:#990000;color:White;font-weight:bold;">
                                    <tr>
                                        <td rowspan="2">
                                            Year/Month
                                        </td>
                                        <td rowspan="2">
                                            Class
                                        </td>
                                        <td colspan="3" style="background-color:Tan;color:Black;">
                                            POST
                                        </td>
                                        <td colspan="3">
                                            PAY
                                        </td>
                                        <td colspan="3" style="background-color:Tan;color:Black;">
                                            BALANCE
                                        </td>
                                        <td rowspan="2">
                                            %Yield
                                        </td>
                                        <td rowspan="2">
                                            Detail
                                        </td>
                                    </tr>
                                    <tr>
                                        <td style="background-color:Tan;color:Black;">
                                            Prin
                                        </td>
                                        <td style="background-color:Tan;color:Black;">
                                            Int
                                        </td>
                                        <td style="background-color:Tan;color:Black;">
                                            Susp
                                        </td>
                                        <td>
                                            Prin
                                        </td>
                                        <td>
                                            Int
                                        </td>
                                        <td>
                                            Susp
                                        </td>
                                        <td style="background-color:Tan;color:Black;">
                                            Prin
                                        </td>
                                        <td style="background-color:Tan;color:Black;">
                                            Int
                                        </td>
                                        <td style="background-color:Tan;color:Black;">
                                            Susp
                                        </td>
                                    </tr>
                                </thead>
                        </HeaderTemplate>
                        <ItemTemplate>
                                <tr style="background-color:#FFFBD6;color:#333333;">
                                    <td>
                                        <asp:Label ID="YMLabel" runat="server" Text='<%# Eval("YM").ToString.Substring(0,4) + "/" + Eval("YM").ToString.Substring(4,2) %>'></asp:Label>
                                    </td>
                                    <td>
                                        <asp:Label ID="ClassLabel" runat="server" Text='<%# Eval("Class") %>'></asp:Label>
                                    </td>
                                    <td>
                                        <asp:Label ID="Post_PRINLabel" runat="server" Text='<%# Format(Eval("Post_PRIN"), "#,##0.00") %>'></asp:Label>
                                    </td>
                                    <td>
                                        <asp:Label ID="Post_INTLabel" runat="server" Text='<%# Format(Eval("Post_INT"), "#,##0.00") %>'></asp:Label>
                                    </td>
                                    <td>
                                        <asp:Label ID="Post_SUSPLabel" runat="server" Text='<%# Format(Eval("Post_SUSP"), "#,##0.00") %>'></asp:Label>
                                    </td>
                                    <td>
                                        <asp:Label ID="Pay_PRINLabel" runat="server" Text='<%# Format(Eval("Pay_PRIN"), "#,##0.00") %>'></asp:Label>
                                    </td>
                                    <td>
                                        <asp:Label ID="Pay_INTLabel" runat="server" Text='<%# Format(Eval("Pay_INT"), "#,##0.00") %>'></asp:Label>
                                    </td>
                                    <td>
                                        <asp:Label ID="Pay_SUSPLabel" runat="server" Text='<%# Format(Eval("Pay_SUSP"), "#,##0.00") %>'></asp:Label>
                                    </td>
                                    <td>
                                        <asp:Label ID="PrincipalLabel" runat="server" Text='<%# Format(Eval("Principal"), "#,##0.00") %>'></asp:Label>
                                    </td>
                                    <td>
                                        <asp:Label ID="AccruLabel" runat="server" Text='<%# Format(Eval("Accru"), "#,##0.00") %>'></asp:Label>
                                    </td>
                                    <td>
                                        <asp:Label ID="SuspLabel" runat="server" Text='<%# Format(Eval("Susp"), "#,##0.00") %>'></asp:Label>
                                    </td>
                                    <td>
                                        <asp:Label ID="YieldLabel" runat="server" Text='<%# Format(Eval("Yield"), "##0.00%") %>'></asp:Label>
                                    </td>
                                    <td>
                                        <asp:ImageButton ID="DetailImageButton" runat="server" ImageUrl="~/images/Magnifying Glass.gif" ToolTip="Detail" PostBackUrl='<%# "~/aspx/customer/CustomerDebtPrevByAcc.aspx?cif=" + getQueryString("cif") + "&year=" + Eval("YM").ToString.Substring(0,4) + "&month=" + Eval("YM").ToString.Substring(4,2) %>' />
                                    </td>
                                </tr>
                        </ItemTemplate>
                        <AlternatingItemTemplate>
                                <tr style="background-color:White;">
                                    <td>
                                        <asp:Label ID="YMLabel" runat="server" Text='<%# Eval("YM").ToString.Substring(0,4) + "/" + Eval("YM").ToString.Substring(4,2) %>'></asp:Label>
                                    </td>
                                    <td>
                                        <asp:Label ID="ClassLabel" runat="server" Text='<%# Eval("Class") %>'></asp:Label>
                                    </td>
                                    <td>
                                        <asp:Label ID="Post_PRINLabel" runat="server" Text='<%# Format(Eval("Post_PRIN"), "#,##0.00") %>'></asp:Label>
                                    </td>
                                    <td>
                                        <asp:Label ID="Post_INTLabel" runat="server" Text='<%# Format(Eval("Post_INT"), "#,##0.00") %>'></asp:Label>
                                    </td>
                                    <td>
                                        <asp:Label ID="Post_SUSPLabel" runat="server" Text='<%# Format(Eval("Post_SUSP"), "#,##0.00") %>'></asp:Label>
                                    </td>
                                    <td>
                                        <asp:Label ID="Pay_PRINLabel" runat="server" Text='<%# Format(Eval("Pay_PRIN"), "#,##0.00") %>'></asp:Label>
                                    </td>
                                    <td>
                                        <asp:Label ID="Pay_INTLabel" runat="server" Text='<%# Format(Eval("Pay_INT"), "#,##0.00") %>'></asp:Label>
                                    </td>
                                    <td>
                                        <asp:Label ID="Pay_SUSPLabel" runat="server" Text='<%# Format(Eval("Pay_SUSP"), "#,##0.00") %>'></asp:Label>
                                    </td>
                                    <td>
                                        <asp:Label ID="PrincipalLabel" runat="server" Text='<%# Format(Eval("Principal"), "#,##0.00") %>'></asp:Label>
                                    </td>
                                    <td>
                                        <asp:Label ID="AccruLabel" runat="server" Text='<%# Format(Eval("Accru"), "#,##0.00") %>'></asp:Label>
                                    </td>
                                    <td>
                                        <asp:Label ID="SuspLabel" runat="server" Text='<%# Format(Eval("Susp"), "#,##0.00") %>'></asp:Label>
                                    </td>
                                    <td>
                                        <asp:Label ID="YieldLabel" runat="server" Text='<%# Format(Eval("Yield"), "##0.00%") %>'></asp:Label>
                                    </td>
                                    <td>
                                        <asp:ImageButton ID="DetailImageButton" runat="server" ImageUrl="~/images/Magnifying Glass.gif" ToolTip="Detail" PostBackUrl='<%# "~/aspx/customer/CustomerDebtPrevByAcc.aspx?cif=" + getQueryString("cif") + "&year=" + Eval("YM").ToString.Substring(0,4) + "&month=" + Eval("YM").ToString.Substring(4,2) %>' />
                                    </td>
                                </tr>
                        </AlternatingItemTemplate>
                        <FooterTemplate>
                            </table>
                        </FooterTemplate>
                    </asp:Repeater>
                    
                    <asp:SqlDataSource ID="DebtPrevDS" runat="server" ConnectionString="<%$ ConnectionStrings:BAY01ConnectionString %>" SelectCommand="">
                        <SelectParameters>
                            <asp:QueryStringParameter Name="Cif" QueryStringField="cif" Type="Int32" />
                        </SelectParameters>
                    </asp:SqlDataSource>
                </td>
            </tr>
        </table>
    </div>
</asp:Content>
