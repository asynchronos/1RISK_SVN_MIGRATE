<%@ Page Title="ภาระหนี้ย้อนหลังรายบัญชี" Language="VB" MasterPageFile="~/Iframe.master"
    AutoEventWireup="false" CodeFile="CustomerDebtPrevByAcc.aspx.vb" Inherits="aspx.customer.CustomerDebtPrevByAcc" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ScriptPlaceHolder" runat="Server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="ContentPlaceHolder2" runat="Server">
    <table width="100%">
        <tr align="center">
            <td style="height: 24px">
                Select Year :
                <asp:DropDownList ID="YearDropDownList" runat="server" AutoPostBack="True">
                </asp:DropDownList>
                Select Month :
                <asp:DropDownList ID="MonthDropDownList" runat="server" AutoPostBack="True">
                    <asp:ListItem Text="01"></asp:ListItem>
                    <asp:ListItem Text="02"></asp:ListItem>
                    <asp:ListItem Text="03"></asp:ListItem>
                    <asp:ListItem Text="04"></asp:ListItem>
                    <asp:ListItem Text="05"></asp:ListItem>
                    <asp:ListItem Text="06"></asp:ListItem>
                    <asp:ListItem Text="07"></asp:ListItem>
                    <asp:ListItem Text="08"></asp:ListItem>
                    <asp:ListItem Text="09"></asp:ListItem>
                    <asp:ListItem Text="10"></asp:ListItem>
                    <asp:ListItem Text="11"></asp:ListItem>
                    <asp:ListItem Text="12"></asp:ListItem>
                </asp:DropDownList>
                <%--Select AccNo. :
                <asp:DropDownList ID="AccNoDropDownList" runat="server" DataSourceID="AccNoDataSource"
                    DataTextField="ACCNO" DataValueField="ACCNO">
                </asp:DropDownList>--%>
                <asp:Button ID="SearchButton" runat="server" Text="Search" />
                <asp:HiddenField ID="YMHiddenField" runat="server" />
                <%--<asp:SqlDataSource ID="AccNoDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:BAY01ConnectionString %>"
                    SelectCommand="SELECT   ACCNO FROM  ByAccount_2550 where  CIF = @CIF AND  YM = @YM Group by ACCNO">
                    <SelectParameters>
                        <asp:QueryStringParameter Name="Cif" QueryStringField="cif" Type="Int32" />
                        <asp:ControlParameter ControlID="YMHiddenField" DefaultValue="255201" Name="YM" PropertyName="Value" />
                    </SelectParameters>
                </asp:SqlDataSource>--%>
            </td>
        </tr>
        <tr align="center">
            <td>
                <asp:Repeater ID="DebtPrevByAccRepeater" runat="server" DataSourceID="DebtPrevByAccDS">
                    <HeaderTemplate>
                        <table style="color: #333333">
                            <thead style="background-color: #990000; color: White; font-weight: bold;">
                                <tr>
                                    <td rowspan="2">
                                        ACCNO
                                    </td>
                                    <td rowspan="2">
                                        CONTNO
                                    </td>
                                    <td rowspan="2">
                                        ACCGL
                                    </td>
                                    <td rowspan="2">
                                        SEQNO
                                    </td>
                                    <td rowspan="2">
                                        Branch
                                    </td>
                                    <td rowspan="2">
                                        Class
                                    </td>
                                    <td colspan="3" style="background-color: Tan; color: Black;">
                                        POST
                                    </td>
                                    <td colspan="3">
                                        PAY
                                    </td>
                                    <td colspan="3" style="background-color: Tan; color: Black;">
                                        BALANCE
                                    </td>
                                    <td rowspan="2">
                                        REV_ACCRU
                                    </td>
                                    <td rowspan="2">
                                        %Yield
                                    </td>
                                    <td rowspan="2">
                                        &nbsp;
                                    </td>
                                </tr>
                                <tr>
                                    <td style="background-color: Tan; color: Black;">
                                        Prin
                                    </td>
                                    <td style="background-color: Tan; color: Black;">
                                        Int
                                    </td>
                                    <td style="background-color: Tan; color: Black;">
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
                                    <td style="background-color: Tan; color: Black;">
                                        Prin
                                    </td>
                                    <td style="background-color: Tan; color: Black;">
                                        Int
                                    </td>
                                    <td style="background-color: Tan; color: Black;">
                                        Susp
                                    </td>
                                </tr>
                            </thead>
                    </HeaderTemplate>
                    <ItemTemplate>
                        <tr style="background-color: #FFFBD6; color: #333333;">
                            <td>
                                <asp:Label ID="ACCNOLabel" runat="server" Text='<%# Eval("ACCNO") %>'></asp:Label>
                            </td>
                            <td>
                                <asp:Label ID="CONTNOLabel" runat="server" Text='<%# Eval("CONTNO") %>'></asp:Label>
                            </td>
                            <td>
                                <asp:Label ID="ACCGLLabel" runat="server" Text='<%# Eval("ACCGL") %>'></asp:Label>
                            </td>
                            <td>
                                <asp:Label ID="SEQNOLabel" runat="server" Text='<%# Eval("SEQNO") %>'></asp:Label>
                            </td>
                            <td>
                                <asp:Label ID="BranchLabel" runat="server" Text='<%# Eval("Branch") %>'></asp:Label>
                            </td>
                            <td>
                                <asp:Label ID="ClassLabel" runat="server" Text='<%# Eval("CLADJ") %>'></asp:Label>
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
                                <asp:Label ID="Rev_AccruLabel" runat="server" Text='<%# Format(Eval("Rev_Accru"), "#,##0.00") %>'></asp:Label>
                            </td>
                            <td>
                                <asp:Label ID="YieldLabel" runat="server" Text='<%# Format(Eval("Yield"), "##0.00%") %>'></asp:Label>
                            </td>
                            <td>
                                <asp:Label ID="APP_IDLabel" runat="server" Text='<%# Eval("APP_ID") %>'></asp:Label>
                            </td>
                        </tr>
                    </ItemTemplate>
                    <AlternatingItemTemplate>
                        <tr style="background-color: White;">
                            <td>
                                <asp:Label ID="ACCNOLabel" runat="server" Text='<%# Eval("ACCNO") %>'></asp:Label>
                            </td>
                            <td>
                                <asp:Label ID="CONTNOLabel" runat="server" Text='<%# Eval("CONTNO") %>'></asp:Label>
                            </td>
                            <td>
                                <asp:Label ID="ACCGLLabel" runat="server" Text='<%# Eval("ACCGL") %>'></asp:Label>
                            </td>
                            <td>
                                <asp:Label ID="SEQNOLabel" runat="server" Text='<%# Eval("SEQNO") %>'></asp:Label>
                            </td>
                            <td>
                                <asp:Label ID="BranchLabel" runat="server" Text='<%# Eval("Branch") %>'></asp:Label>
                            </td>
                            <td>
                                <asp:Label ID="ClassLabel" runat="server" Text='<%# Eval("CLADJ") %>'></asp:Label>
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
                                <asp:Label ID="Rev_AccruLabel" runat="server" Text='<%# Format(Eval("Rev_Accru"), "#,##0.00") %>'></asp:Label>
                            </td>
                            <td>
                                <asp:Label ID="YieldLabel" runat="server" Text='<%# Format(Eval("Yield"), "##0.00%") %>'></asp:Label>
                            </td>
                            <td>
                                <asp:Label ID="APP_IDLabel" runat="server" Text='<%# Eval("APP_ID") %>'></asp:Label>
                            </td>
                        </tr>
                    </AlternatingItemTemplate>
                    <FooterTemplate>
                        </table>
                    </FooterTemplate>
                </asp:Repeater>
                <asp:SqlDataSource ID="DebtPrevByAccDS" runat="server" ConnectionString="<%$ ConnectionStrings:BAY01ConnectionString %>"
                    SelectCommand="SELECT   YM, Branch, ACCGL, ACCNO, CONTNO, SEQNO, CLADJ, Principal, Accru, Susp, Pay_PRIN, Pay_INT, Pay_SUSP, Post_PRIN, Post_INT, Post_SUSP,  Yield, Rev_Accru,APP_ID FROM  ByAccount_2552 where  CIF = @CIF AND  YM = @YM">
                    <SelectParameters>
                        <asp:QueryStringParameter Name="Cif" QueryStringField="cif" Type="Int32" />
                        <asp:ControlParameter ControlID="YMHiddenField" DefaultValue="" Name="YM" PropertyName="Value" />
                        <%--<asp:ControlParameter ControlID="AccNoDropDownList" DefaultValue="" Name="ACCNO"
                            PropertyName="SelectedValue" />--%>
                    </SelectParameters>
                </asp:SqlDataSource>
            </td>
        </tr>
    </table>
</asp:Content>
