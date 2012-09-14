<%@ Page Title="ภาระหนี้รายบัญชี" Language="VB" MasterPageFile="~/Popup.master" AutoEventWireup="false"
    CodeFile="CustomerDebtByAcc.aspx.vb" Inherits="aspx.customer.CustomerDebtByAcc" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ScriptPlaceHolder" runat="Server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="ContentPlaceHolder2" runat="Server">
    <table>
        <tr align="center">
            <td>
                <asp:FormView ID="ByAccountFormView" runat="server" CellPadding="4" DataSourceID="ByAccountDS"
                    ForeColor="#333333" Width="100%">
                    <FooterStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
                    <ItemTemplate>
                        <table width="100%">
                            <tr>
                                <td id="HeaderDetail">
                                    <table border="1" cellspacing="0" cellpadding="0" width="100%">
                                        <tr align="left">
                                            <td>
                                                <b>ACCNO:</b>
                                                <asp:Label ID="ACCNOLabel" runat="server" Text='<%# Eval("ACCNO") %>'></asp:Label>
                                            </td>
                                            <td>
                                                <b>CIF:</b>
                                                <asp:Label ID="CIFLabel" runat="server" Text='<%# Eval("CIF") & " - " & Eval("Name") %>'></asp:Label>
                                            </td>
                                            <td>
                                                <b>Branch:</b>
                                                <asp:Label ID="BranchLabel" runat="server" Text='<%# Eval("Branch") %>'></asp:Label>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td colspan="3" align="left">
                                                <b>AccGL:</b>
                                                <asp:Label ID="AccGLLabel" runat="server" Text='<%# Eval("AccGL") %>'></asp:Label>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td colspan="3" align="left">
                                                <b>DECB_RD:</b>
                                                <asp:Label ID="DECB_RDLabel" runat="server" Text='<%# Eval("DECB_RD") %>'></asp:Label>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td colspan="3" align="left">
                                                <b>Limit:</b>
                                                <asp:Label ID="LimitLabel" runat="server" Text='<%# ConvertUtil.setObjectFormat(Eval("Limit")) %>'></asp:Label>
                                                <b>Bath</b>
                                            </td>
                                        </tr>
                                    </table>
                                </td>
                            </tr>
                        </table>
                    </ItemTemplate>
                    <HeaderStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
                    <HeaderTemplate>
                        ข้อมูลรายบัญชี
                    </HeaderTemplate>
                    <RowStyle BackColor="#FFFBD6" ForeColor="#333333" />
                    <PagerStyle BackColor="#FFCC66" ForeColor="#333333" HorizontalAlign="Center" />
                </asp:FormView>
                <asp:SqlDataSource ID="ByAccountDS" runat="server" SelectCommandType="StoredProcedure">
                    <SelectParameters>
                        <asp:QueryStringParameter Name="CIF" QueryStringField="cif" />
                        <asp:QueryStringParameter Name="ACCNO" QueryStringField="accno" />
                    </SelectParameters>
                </asp:SqlDataSource>
            </td>
        </tr>
        <tr>
            <td>
                <asp:GridView ID="ByAccountGridView" runat="server" DataSourceID="ByAccountDS" ForeColor="Black"
                    CellPadding="2" AutoGenerateColumns="False" BackColor="LightGoldenrodYellow"
                    BorderColor="Tan" BorderWidth="1px" AllowPaging="True" DataKeyNames="CIF,ACCNO,CONTNO,SEQNO,Principal">
                    <FooterStyle BackColor="Tan"></FooterStyle>
                    <Columns>
                        <asp:CommandField ShowSelectButton="True" />
                        <asp:BoundField DataField="CONTNO" SortExpression="CONTNO" HeaderText="CONTNO"></asp:BoundField>
                        <asp:BoundField DataField="SEQNO" SortExpression="SEQNO" HeaderText="SEQNO"></asp:BoundField>
                        <asp:BoundField DataField="AGING" SortExpression="AGING" HeaderText="AGING"></asp:BoundField>
                        <asp:BoundField DataField="Principal" SortExpression="Principal" HeaderText="Principal"
                            DataFormatString="{0:#,##0.00}" HtmlEncode="False"></asp:BoundField>
                        <asp:BoundField DataField="Accru" SortExpression="Accru" HeaderText="Accru" DataFormatString="{0:#,##0.00}"
                            HtmlEncode="False"></asp:BoundField>
                        <asp:BoundField DataField="Susp" SortExpression="Susp" HeaderText="Susp" DataFormatString="{0:#,##0.00}"
                            HtmlEncode="False"></asp:BoundField>
                        <asp:BoundField DataField="PAY_PRIN" SortExpression="PAY_PRIN" HeaderText="PAY_PRIN"
                            DataFormatString="{0:#,##0.00}" HtmlEncode="False"></asp:BoundField>
                        <asp:BoundField DataField="PAY_INT" SortExpression="PAY_INT" HeaderText="PAY_INT"
                            DataFormatString="{0:#,##0.00}" HtmlEncode="False"></asp:BoundField>
                        <asp:BoundField DataField="PAY_SUSP" SortExpression="PAY_SUSP" HeaderText="PAY_SUSP"
                            DataFormatString="{0:#,##0.00}" HtmlEncode="False"></asp:BoundField>
                        <asp:BoundField DataField="LPAY_DATE" SortExpression="LPAY_DATE" HeaderText="LPAY_DATE">
                        </asp:BoundField>
                        <asp:BoundField DataField="CIF" HeaderText="CIF" SortExpression="CIF" Visible="False" />
                        <asp:BoundField DataField="ACCNO" HeaderText="ACCNO" SortExpression="ACCNO" Visible="False" />
                    </Columns>
                    <SelectedRowStyle BackColor="DarkSlateBlue" ForeColor="GhostWhite"></SelectedRowStyle>
                    <PagerStyle BackColor="PaleGoldenrod" ForeColor="DarkSlateBlue" HorizontalAlign="Center">
                    </PagerStyle>
                    <HeaderStyle BackColor="Tan" Font-Bold="True"></HeaderStyle>
                    <AlternatingRowStyle BackColor="PaleGoldenrod"></AlternatingRowStyle>
                </asp:GridView>
                <asp:HiddenField ID="CONTNOHiddenField" runat="server" />
                <asp:HiddenField ID="SEQNOHiddenField" runat="server" />
                <asp:HiddenField ID="PRINCIPALHiddenField" runat="server" />
            </td>
        </tr>
        <tr>
            <td>
                <asp:FormView ID="ByAccountSelectedFormView" runat="server" CellPadding="4" DataSourceID="ByAccountSelectedDS"
                    ForeColor="#333333" Width="100%">
                    <FooterStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
                    <RowStyle BackColor="#FFFBD6" ForeColor="#333333" />
                    <PagerStyle BackColor="#FFCC66" ForeColor="#333333" HorizontalAlign="Center" />
                    <ItemTemplate>
                        <table width="100%">
                            <tr>
                                <td colspan="3">
                                    <b>APP_ID:</b>
                                    <asp:Label ID="APP_IDLabel" runat="server" Text='<%# Eval("APP_ID") %>'></asp:Label>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <b>CONTNO:</b>
                                    <asp:Label ID="CONTNOLabel" runat="server" Text='<%# Eval("CONTNO") %>'></asp:Label>
                                </td>
                                <td colspan="2">
                                    <b>SEQNO:</b>
                                    <asp:Label ID="SEQNOLabel" runat="server" Text='<%# Eval("SEQNO") %>'></asp:Label>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <b>ISSU_DATE:</b>
                                    <asp:Label ID="ISSU_DATELabel" runat="server" Text='<%# Eval("ISSU_DATE") %>'></asp:Label>
                                </td>
                                <td colspan="2">
                                    <b>DUE_DATE:</b>
                                    <asp:Label ID="DUE_DATELabel" runat="server" Text='<%# Eval("DUE_DATE") %>'></asp:Label>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <b>RATE_TYPE:</b>
                                    <asp:Label ID="RATE_TYPELabel" runat="server" Text='<%# ConvertUtil.setObjectFormat(Eval("RATE_TYPE")) %>'></asp:Label>
                                </td>
                                <td>
                                    <b>RATE_LOAD:</b>
                                    <asp:Label ID="RATE_LOADLabel" runat="server" Text='<%# ConvertUtil.setObjectFormat(Eval("RATE_LOAD")) %>'></asp:Label>
                                </td>
                                <td>
                                    <b>INT_RATE:</b>
                                    <asp:Label ID="INT_RATELabel" runat="server" Text='<%# ConvertUtil.setObjectFormat(Eval("INT_RATE")) %>'></asp:Label>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <b>Update Date:</b>
                                    <asp:Label ID="DATEASOFLabel" runat="server" />
                                </td>
                                <td colspan="2">
                                    <b>LPAY_DATE:</b>
                                    <asp:Label ID="LPAY_DATELabel" runat="server" Text='<%# Eval("LPAY_DATE") %>'></asp:Label>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <b>PAY_PRIN:</b>
                                    <asp:Label ID="PAY_PRINLabel" runat="server" Text='<%# ConvertUtil.setObjectFormat(Eval("PAY_PRIN")) %>'></asp:Label>
                                </td>
                                <td>
                                    <b>PAY_INT:</b>
                                    <asp:Label ID="PAY_INTLabel" runat="server" Text='<%# ConvertUtil.setObjectFormat(Eval("PAY_INT")) %>'></asp:Label>
                                </td>
                                <td>
                                    <b>PAY_SUSP:</b>
                                    <asp:Label ID="PAY_SUSPLabel" runat="server" Text='<%# ConvertUtil.setObjectFormat(Eval("PAY_SUSP")) %>'></asp:Label>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <b>Principal:</b>
                                    <asp:Label ID="PrincipalLabel" runat="server" Text='<%# ConvertUtil.setObjectFormat(Eval("Principal")) %>'></asp:Label>
                                </td>
                                <td>
                                    <b>Accru:</b>
                                    <asp:Label ID="AccruLabel" runat="server" Text='<%# ConvertUtil.setObjectFormat(Eval("Accru")) %>'></asp:Label>
                                </td>
                                <td>
                                    <b>Susp:</b>
                                    <asp:Label ID="SuspLabel" runat="server" Text='<%# ConvertUtil.setObjectFormat(Eval("Susp")) %>'></asp:Label>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <b>UNEARNINT:</b>
                                    <asp:Label ID="UNEARNINTLabel" runat="server" Text='<%# ConvertUtil.setObjectFormat(Eval("UNEARNINT")) %>'></asp:Label>
                                </td>
                                <td>
                                    <b>UNEARNPRIN:</b>
                                    <asp:Label ID="UNEARNPRINLabel" runat="server" Text='<%# ConvertUtil.setObjectFormat(Eval("UNEARNPRIN")) %>'></asp:Label>
                                </td>
                                <td>
                                    <b>AGING:</b>
                                    <asp:Label ID="AGINGLabel" runat="server" Text='<%# Eval("AGING") %>'></asp:Label>
                                </td>
                            </tr>
                        </table>
                    </ItemTemplate>
                    <HeaderStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
                    <HeaderTemplate>
                        Detail
                    </HeaderTemplate>
                </asp:FormView>
                <asp:SqlDataSource ID="ByAccountSelectedDS" runat="server" SelectCommandType="StoredProcedure">
                    <SelectParameters>
                        <asp:QueryStringParameter Name="CIF" QueryStringField="cif" />
                        <asp:QueryStringParameter Name="ACCNO" QueryStringField="accno" />
                        <asp:ControlParameter ControlID="CONTNOHiddenField" Name="CONTNO" PropertyName="Value" />
                        <asp:ControlParameter ControlID="SEQNOHiddenField" Name="SEQNO" PropertyName="Value" />
                        <asp:ControlParameter ControlID="PRINCIPALHiddenField" Name="PRINCIPAL" PropertyName="Value" />
                    </SelectParameters>
                </asp:SqlDataSource>
            </td>
        </tr>
    </table>
</asp:Content>
