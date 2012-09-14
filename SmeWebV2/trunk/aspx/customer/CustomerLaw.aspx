<%@ Page Title="สถานะขั้นตอนกฎหมายล่าสุด" Language="VB" MasterPageFile="~/Iframe.master"
    AutoEventWireup="false" CodeFile="CustomerLaw.aspx.vb" Inherits="aspx.customer.CustomerLaw" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ScriptPlaceHolder" runat="Server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="ContentPlaceHolder2" runat="Server">
    <table cellpadding="10">
        <tr>
            <td align="left">
                <asp:Label ID="lblCID" runat="server" BackColor="White" Font-Bold="True" ForeColor="Maroon"></asp:Label>
                <br />
                <asp:Label ID="lblHeader" runat="server" Text="กรณีมีหลายขั้นตอนกฏหมาย จะแสดงเฉพาะขั้นตอนกฏหมายสูงสุด"></asp:Label>
            </td>
        </tr>
        <tr>
            <td>
                <asp:FormView ID="dtsLawFormView" runat="server" CellPadding="4" DataSourceID="SqldtsLaw"
                    ForeColor="#333333">
                    <FooterStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
                    <RowStyle BackColor="#FFFBD6" ForeColor="#333333" />
                    <PagerStyle BackColor="#FFCC66" ForeColor="#333333" HorizontalAlign="Center" />
                    <HeaderStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
                    <HeaderTemplate>
                        ขั้นตอนกฎหมาย
                    </HeaderTemplate>
                    <ItemTemplate>
                        <table>
                            <tr>
                                <td align="left" colspan="2">
                                    <b>CIF : </b>
                                    <asp:Label ID="CifLabel" runat="server" Text='<%# Eval("CIF_NO") %>'></asp:Label>
                                </td>
                                <td align="left" colspan="2">
                                    <b>ชื่อลูกค้า : </b>
                                    <asp:Label ID="NameLabel" runat="server" Text='<%# Eval("Name") %>'></asp:Label>
                                </td>
                                <td align="left" colspan="2">
                                    <b>ขั้นตอนกฏหมาย : </b>
                                    <asp:Label ID="LawStepLabel" runat="server" Text='<%#Eval("Id_CLine") & " - " & Eval("CLineS")%>'></asp:Label>
                                </td>
                            </tr>
                            <tr>
                                <td align="left" colspan="2">
                                    <b>CASE NO : </b>
                                    <asp:Label ID="CaseNoLabel" runat="server" Text='<%#Eval("LOM")%>'></asp:Label>
                                </td>
                                <td align="left" colspan="2">
                                    <b>สาขา : </b>
                                    <asp:Label ID="BranchLabel" runat="server" Text='<%#Eval("Id_Branch") & "-" & Eval("Branch")%>'></asp:Label>
                                </td>
                                <td align="left" colspan="2">
                                    <%--                        
                                        <b>สาขาเดิม(ก่อนโอนAAMC) : </b>
                                        <%#Eval("OLD_BRANCH")%>
                                    --%>
                                </td>
                            </tr>
                            <tr>
                                <td align="left" colspan="2">
                                    <b>ประเภทหนี้ : </b>
                                    <asp:Label ID="ACLabel" runat="server" Text='<%#Eval("AC")%>'></asp:Label>
                                </td>
                                <td align="left" colspan="2">
                                    <b>เลขที่สัญญาเดิม : </b>
                                    <asp:Label ID="ACNOLabel" runat="server" Text='<%#Eval("ACNO")%>'></asp:Label>
                                </td>
                                <td align="left" colspan="2">
                                    <b>เลขที่บัญชี : </b>
                                    <asp:Label ID="ACCNOLabel" runat="server" Text='<%#Eval("ACCNO")%>'></asp:Label>
                                </td>
                            </tr>
                            <tr>
                                <td align="left" colspan="6">
                                    <b>ขั้นตอนศาล :</b>
                                    <asp:Label ID="CourtStepLabel" runat="server" Text='<%#Eval("Id_BR2") & " - " & Eval("BR2_Name")%>'></asp:Label>
                                </td>
                            </tr>
                            <tr align="left">
                                <td>
                                    <b>ดำเนินคดี </b>
                                </td>
                                <td>
                                    <b><i>วันฟ้อง : </i></b>
                                    <asp:Label ID="DateChargeLabel" runat="server" Text='<%#Eval("C3_New")%>'></asp:Label>
                                </td>
                                <td>
                                    <b><i>เลขคดีดำ : </i></b>
                                    <asp:Label ID="BlackNoLabel" runat="server" Text='<%#Eval("C33")%>'></asp:Label>
                                </td>
                                <td>
                                    <b><i>วันพิพากษา : </i></b>
                                    <asp:Label ID="DateJudgementLabel" runat="server" Text='<%#Eval("C4_New")%>'></asp:Label>
                                </td>
                                <td>
                                    <b><i>เลขคดีแดง : </i></b>
                                    <asp:Label ID="RedNoLabel" runat="server" Text='<%#Eval("C44")%>'></asp:Label>
                                </td>
                                <td>
                                    <b><i>ทุนทรัพย์ฟ้อง : </i></b>
                                    <asp:Label ID="CapitalChargeLabel" runat="server" Text='<%#Format(Eval("FUND"), "#,##0.00")%>'></asp:Label>
                                    บาท
                                </td>
                            </tr>
                            <tr align="left">
                                <td>
                                    <b>ล้มละลาย </b>
                                </td>
                                <td>
                                    <b><i>วันฟ้อง : </i></b>
                                    <asp:Label ID="DateChargeLabel2" runat="server" Text='<%#Eval("NOU")%>'></asp:Label>
                                </td>
                                <td>
                                    <b><i>เลขคดีดำ : </i></b>
                                    <asp:Label ID="BlackNoLabel2" runat="server" Text='<%#Eval("PHO")%>'></asp:Label>
                                </td>
                                <td>
                                    <b><i>วันพิพากษา : </i></b>
                                    <asp:Label ID="DateJudgementLabel2" runat="server" Text='<%#Eval("DARA")%>'></asp:Label>
                                </td>
                                <td>
                                    <b><i>เลขคดีแดง : </i></b>
                                    <asp:Label ID="RedNoLabel2" runat="server" Text='<%#Eval("RED2")%>'></asp:Label>
                                </td>
                                <td>
                                    <b><i>ทุนทรัพย์ฟ้อง : </i></b>
                                    <asp:Label ID="CapitalChargeLabel2" runat="server" Text='<%#Format(Eval("CHAR2"), "#,##0.00")%>'></asp:Label>
                                    บาท
                                </td>
                            </tr>
                            <tr align="left">
                                <td colspan="2">
                                    <b>ทนาย : </b>
                                    <asp:Label ID="LawyerNameLabel" runat="server" Text='<%#Eval("Tan_Name")%>'></asp:Label>
                                </td>
                                <td colspan="2">
                                    <b>โทร : </b>
                                    <asp:Label ID="LawyerTelLabel" runat="server" Text='<%#Eval("Tan_Tel")%>'></asp:Label>
                                </td>
                                <td colspan="2">
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
                </asp:FormView>
            </td>
        </tr>
    </table>
    <asp:SqlDataSource ID="SqldtsLaw" runat="server" ConnectionString="<%$ ConnectionStrings:BAY01ConnectionString %>"
        SelectCommand="Law_All_Select" SelectCommandType="StoredProcedure">
        <SelectParameters>
            <asp:QueryStringParameter Name="Cif_No" QueryStringField="cif" Type="Int32" />
        </SelectParameters>
    </asp:SqlDataSource>
</asp:Content>
