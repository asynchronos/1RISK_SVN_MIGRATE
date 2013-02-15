<%@ Page Title="ภาระหนี้" Language="VB" MasterPageFile="~/Iframe.master" AutoEventWireup="false"
    CodeFile="CustomerDebt.aspx.vb" Inherits="aspx.customer.CustomerDebt" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ScriptPlaceHolder" runat="Server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="ContentPlaceHolder2" runat="Server">
    <div>
        <table width="100%" style="color: #333333; background-color: #FFFBD6;">
            <tr style="color: White; background-color: #990000; font-weight: bold">
                <td>
                    <asp:Label ID="monthlyHeaderLabel" runat="server" Text=""></asp:Label>
                </td>
            </tr>
            <tr>
                <td>
                    &nbsp;
                </td>
            </tr>
            <tr>
                <td>
                    <asp:DataList ID="MonthlyDataList" runat="server" DataKeyField="Cif" DataSourceID="MonthlyByCus"
                        CellPadding="4" ForeColor="#333333" Width="100%">
                        <FooterStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
                        <AlternatingItemStyle BackColor="White" />
                        <ItemStyle BackColor="#FFFBD6" ForeColor="#333333" />
                        <SelectedItemStyle BackColor="#FFCC66" Font-Bold="True" ForeColor="Navy" />
                        <HeaderStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
                        <ItemTemplate>
                            <table width="100%">
                                <tr>
                                    <td>
                                        <b>Cif :</b>
                                        <asp:Label ID="CifLabel" runat="server" Text='<%# Eval("Cif") %>'></asp:Label>
                                    </td>
                                    <td>
                                        <b>ชื่อลูกค้า :</b>
                                        <asp:Label ID="NameLabel" runat="server" Text='<%# Eval("Name") %>'></asp:Label>
                                    </td>
                                    <td>
                                        <b>BOTID :</b>
                                        <asp:Label ID="BOTIDLabel" runat="server" Text='<%# Eval("BOTID") %>'></asp:Label>
                                    </td>
                                </tr>
                                <tr>
                                    <td colspan="3">
                                        <b>สาขา :</b>
                                        <asp:Label ID="BranchLabel" runat="server" Text='<%# Eval("Branch") & " - " & Eval("Branch_T") %>'></asp:Label>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <b>Tdr :</b>
                                        <asp:Label ID="TdrLabel" runat="server" Text='<%# Eval("Tdr") %>'></asp:Label>
                                    </td>
                                    <td>
                                        <b>ชั้นหนี้ :</b>
                                        <asp:Label ID="ClassLabel" runat="server" Text='<%# Eval("Class") %>'></asp:Label>
                                    </td>
                                    <td>
                                        <b>Aging :</b>
                                        <asp:Label ID="AgingLabel" runat="server" Text='<%# Format(Eval("Aging"), "#,##0.00") %>'></asp:Label>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <b>เงินต้น :</b>
                                        <asp:Label ID="PrincipalLabel" runat="server" Text='<%# Format(Eval("Principal"), "#,##0.00") %>'></asp:Label>
                                        บาท
                                    </td>
                                    <td>
                                        <b>ดอกเบี้ยค้าง :</b>
                                        <asp:Label ID="AccruLabel" runat="server" Text='<%# Format(Eval("Accru"), "#,##0.00") %>'></asp:Label>
                                        บาท
                                    </td>
                                    <td>
                                        <b>ดอกเบี้ยพัก :</b>
                                        <asp:Label ID="SuspLabel" runat="server" Text='<%# Format(Eval("Susp"), "#,##0.00") %>'></asp:Label>
                                        บาท
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <b>สำรองทั้งสิ้น :</b>
                                        <asp:Label ID="TotresvLabel" runat="server" Text='<%# Format(Eval("Totresv"), "#,##0.00") %>'></asp:Label>
                                        บาท
                                    </td>
                                    <td>
                                        <b>หลักประกันที่ใช้ได้ :</b>
                                        <asp:Label ID="UseValueLabel" runat="server" Text='<%# Format(Eval("UseValue"), "#,##0.00") %>'></asp:Label>
                                        บาท
                                    </td>
                                    <td>
                                    </td>
                                </tr>
                                <tr>
                                    <td colspan="3">
                                        <b>การจ่ายชำระ :</b>
                                        <asp:Label ID="StatusPAYLabel" runat="server" Text='<%# Eval("PAY") %>'></asp:Label>
                                    </td>
                                </tr>
                            </table>
                        </ItemTemplate>
                    </asp:DataList>
                    <asp:GridView ID="MonthlyGridView" runat="server" AutoGenerateColumns="False" DataSourceID="MonthlyByAccount"
                        BackColor="LightGoldenrodYellow" BorderColor="Tan" BorderWidth="1px" CellPadding="2"
                        ForeColor="Black" GridLines="Vertical" HorizontalAlign="Center" AllowPaging="True">
                        <Columns>
                            <asp:BoundField HtmlEncode="False" DataField="ACCNO" HeaderText="เลขที่บัญชี" SortExpression="ACCNO" />
                            <asp:BoundField HtmlEncode="False" DataField="BRANCH_T" HeaderText="สาขา" SortExpression="BRANCH_T" />
                            <asp:BoundField HtmlEncode="False" DataField="ACCGL" HeaderText="รหัส GL" SortExpression="ACCGL">
                                <ItemStyle HorizontalAlign="Center" />
                            </asp:BoundField>
                            <asp:BoundField HtmlEncode="False" DataField="DECB_RD" HeaderText="ตัวย่อ" SortExpression="DECB_RD">
                                <ItemStyle HorizontalAlign="Center" />
                            </asp:BoundField>
                            <asp:BoundField HtmlEncode="False" DataField="MINCLADJ" HeaderText="ชั้นหนี้" ReadOnly="True"
                                SortExpression="MINCLADJ">
                                <ItemStyle HorizontalAlign="Center" />
                            </asp:BoundField>
                            <asp:BoundField HtmlEncode="False" DataField="SUMLIMIT" HeaderText="วงเงิน" ReadOnly="True"
                                SortExpression="SUMLIMIT" DataFormatString="{0:#,0.00}">
                                <ItemStyle HorizontalAlign="Right" />
                            </asp:BoundField>
                            <asp:BoundField HtmlEncode="False" DataField="SUMPRIN" HeaderText="เงินต้น" ReadOnly="True"
                                SortExpression="SUMPRIN" DataFormatString="{0:#,0.00}">
                                <ItemStyle HorizontalAlign="Right" />
                            </asp:BoundField>
                            <asp:BoundField HtmlEncode="False" DataField="SUMACCRU" HeaderText="ดอกเบี้ยค้าง"
                                ReadOnly="True" SortExpression="SUMACCRU" DataFormatString="{0:#,0.00}">
                                <ItemStyle HorizontalAlign="Right" />
                            </asp:BoundField>
                            <asp:BoundField HtmlEncode="False" DataField="SUMSUSP" HeaderText="ดอกเบี้ยพัก" ReadOnly="True"
                                SortExpression="SUMSUSP" DataFormatString="{0:#,0.00}">
                                <ItemStyle HorizontalAlign="Right" />
                            </asp:BoundField>
                            <asp:BoundField HtmlEncode="False" DataField="MAXAGING" HeaderText="อายุหนี้" ReadOnly="True"
                                SortExpression="MAXAGING" DataFormatString="{0:#,0.00}">
                                <ItemStyle HorizontalAlign="Right" />
                            </asp:BoundField>
                            <asp:TemplateField>
                                <ItemTemplate>
                                    <asp:HyperLink ID="MonthlyDetailHyperLink" runat="server" ImageUrl="~/images/Magnifying Glass.gif"
                                        ToolTip="Detail" NavigateUrl='<%# "~/aspx/customer/CustomerDebtByAcc.aspx?accno=" + Eval("ACCNO") & "&cif=" & getQueryString("cif") & "&type=Monthly" %>'
                                        OnClick="openPopup('',this.href,'','width=750,height=650,scrollbars,resizable');return false;">
                                    </asp:HyperLink>
                                </ItemTemplate>
                            </asp:TemplateField>
                        </Columns>
                        <FooterStyle BackColor="Tan" />
                        <SelectedRowStyle BackColor="DarkSlateBlue" ForeColor="GhostWhite" />
                        <PagerStyle BackColor="PaleGoldenrod" ForeColor="DarkSlateBlue" HorizontalAlign="Center" />
                        <HeaderStyle BackColor="Tan" Font-Bold="True" />
                        <AlternatingRowStyle BackColor="PaleGoldenrod" />
                    </asp:GridView>
                </td>
            </tr>
        </table>
        <asp:SqlDataSource ID="MonthlyByCus" runat="server" ConnectionString="<%$ ConnectionStrings:BAY01ConnectionString %>"
            SelectCommand="UspByCustomerSelProc" SelectCommandType="StoredProcedure">
            <SelectParameters>
                <asp:QueryStringParameter Name="CIF" QueryStringField="cif" Type="Int32" />
            </SelectParameters>
        </asp:SqlDataSource>
        <asp:SqlDataSource ID="MonthlyByAccount" runat="server" ConnectionString="<%$ ConnectionStrings:BAY01ConnectionString %>"
            SelectCommand="UspACC_Sel" SelectCommandType="StoredProcedure">
            <SelectParameters>
                <asp:QueryStringParameter Name="CIF" QueryStringField="cif" Type="Int32" />
            </SelectParameters>
        </asp:SqlDataSource>
        <br />
        <br />
        <asp:FormView ID="DailyFormView" runat="server" DataSourceID="DailyByCus" Width="100%"
            CellPadding="4" ForeColor="#333333">
            <ItemTemplate>
                <br />
                <table width="100%">
                    <tr>
                        <td>
                            <b>Cif :</b>
                            <asp:Label ID="CifLabel" runat="server" Text='<%# Eval("Cif") %>'></asp:Label>
                        </td>
                        <td>
                            <b>ชื่อลูกค้า :</b>
                            <asp:Label ID="NameLabel" runat="server" Text='<%# Eval("Name") %>'></asp:Label>
                        </td>
                        <td>
                            <b>BOTID :</b>
                            <asp:Label ID="BOTIDLabel" runat="server" Text='<%# Eval("BOTID") %>'></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td colspan="3">
                            <b>สาขา :</b>
                            <asp:Label ID="BranchLabel" runat="server" Text='<%# Eval("Branch") & " - " & Eval("Branch_T") %>'></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <b>Tdr :</b>
                            <asp:Label ID="TdrLabel" runat="server" Text='<%# Eval("Tdr") %>'></asp:Label>
                        </td>
                        <td>
                            <b>ชั้นหนี้ :</b>
                            <asp:Label ID="ClassLabel" runat="server" Text='<%# Eval("Class") %>'></asp:Label>
                        </td>
                        <td>
                            <b>Aging :</b>
                            <asp:Label ID="AgingLabel" runat="server" Text='<%# Eval("AgingTxt") %>'></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <b>เงินต้น :</b>
                            <asp:Label ID="PrincipalLabel" runat="server" Text='<%# Format(Eval("Principal"), "#,##0.00") %>'></asp:Label>
                            บาท
                        </td>
                        <td>
                            <b>ดอกเบี้ยค้าง :</b>
                            <asp:Label ID="AccruLabel" runat="server" Text='<%# Format(Eval("Accru"), "#,##0.00") %>'></asp:Label>
                            บาท
                        </td>
                        <td>
                            <b>ดอกเบี้ยพัก :</b>
                            <asp:Label ID="SuspLabel" runat="server" Text='<%# Format(Eval("Susp"), "#,##0.00") %>'></asp:Label>
                            บาท
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <b>ชำระเงินต้น :</b>
                            <asp:Label ID="PayPrinLabel" runat="server" Text='<%#Format(Eval("PAY_PRIN"), "#,##0.00")%>'></asp:Label>
                            บาท
                        </td>
                        <td>
                            <b>ชำระดอกเบี้ยค้าง :</b>
                            <asp:Label ID="PayIntLabel" runat="server" Text='<%#Format(Eval("PAY_INT"), "#,##0.00")%>'></asp:Label>
                            บาท
                        </td>
                        <td>
                            <b>ชำระดอกเบี้ยพัก :</b>
                            <asp:Label ID="PaySuspLabel" runat="server" Text='<%#Format(Eval("PAY_SUSP"), "#,##0.00")%>'></asp:Label>
                            บาท
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <b>สายงาน :</b>
                            <asp:Label ID="GroupLabel" runat="server" Text='<%#Eval("Group")%>'></asp:Label>
                        </td>
                        <td>
                            <b>ภาค :</b>
                            <asp:Label ID="PartNameLabel" runat="server" Text='<%#Eval("Part_Name")%>'></asp:Label>
                        </td>
                        <td>
                            <b>เขต :</b>
                            <asp:Label ID="RegionNameLabel" runat="server" Text='<%#Eval("Region_Name")%>'></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <b>ฝ่ายงานที่ดูแล :</b>
                            <asp:Label ID="DepLabel" runat="server" Text='<%#Eval("Dep")%>'></asp:Label>
                        </td>
                        <td colspan="2">
                            <b>AO :</b>
                            <asp:Label ID="StatusPAYLabel" runat="server" Text='<%#Eval("OFFICR_ID") & "-" & Eval("Office")%>'></asp:Label>
                        </td>
                    </tr>
                </table>
                <br />
                <asp:GridView ID="DailyGridView" runat="server" AutoGenerateColumns="False" BackColor="LightGoldenrodYellow"
                    BorderColor="Tan" BorderWidth="1px" CellPadding="2" ForeColor="Black" GridLines="Vertical"
                    DataSourceID="DailyByAccount" HorizontalAlign="Center" AllowPaging="True">
                    <Columns>
                        <asp:BoundField HtmlEncode="False" DataField="ACCNO" HeaderText="เลขที่บัญชี" SortExpression="ACCNO" />
                        <asp:BoundField HtmlEncode="False" DataField="NBRTHAI" HeaderText="สาขา" SortExpression="NBRTHAI" />
                        <asp:BoundField HtmlEncode="False" DataField="ACCGL" HeaderText="รหัส GL" SortExpression="ACCGL">
                            <ItemStyle HorizontalAlign="Center" />
                        </asp:BoundField>
                        <asp:BoundField HtmlEncode="False" DataField="DECB_RD" HeaderText="ตัวย่อ" SortExpression="DECB_RD">
                            <ItemStyle HorizontalAlign="Center" />
                        </asp:BoundField>
                        <asp:BoundField HtmlEncode="False" DataField="SUMLIMIT" HeaderText="วงเงิน" ReadOnly="True"
                            SortExpression="SUMLIMIT" DataFormatString="{0:#,0.00}">
                            <ItemStyle HorizontalAlign="Right" />
                        </asp:BoundField>
                        <asp:BoundField HtmlEncode="False" DataField="SUMPRIN" HeaderText="เงินต้น" ReadOnly="True"
                            SortExpression="SUMPRIN" DataFormatString="{0:#,0.00}">
                            <ItemStyle HorizontalAlign="Right" />
                        </asp:BoundField>
                        <asp:BoundField HtmlEncode="False" DataField="SUMACCRU" HeaderText="ดอกเบี้ยค้าง"
                            ReadOnly="True" SortExpression="SUMACCRU" DataFormatString="{0:#,0.00}">
                            <ItemStyle HorizontalAlign="Right" />
                        </asp:BoundField>
                        <asp:BoundField HtmlEncode="False" DataField="SUMSUSP" HeaderText="ดอกเบี้ยพัก" ReadOnly="True"
                            SortExpression="SUMSUSP" DataFormatString="{0:#,0.00}">
                            <ItemStyle HorizontalAlign="Right" />
                        </asp:BoundField>
                        <asp:BoundField HtmlEncode="False" DataField="MAXAGING" HeaderText="อายุหนี้" ReadOnly="True"
                            SortExpression="MAXAGING" DataFormatString="{0:#,0.00}">
                            <ItemStyle HorizontalAlign="Right" />
                        </asp:BoundField>
                        <asp:BoundField HtmlEncode="False" DataField="SUMPAY_PRIN" HeaderText="ชำระต้น" ReadOnly="True"
                            SortExpression="SUMPAY_PRIN" DataFormatString="{0:#,0.00}">
                            <ItemStyle HorizontalAlign="Right" />
                        </asp:BoundField>
                        <asp:BoundField HtmlEncode="False" DataField="SUMPAY_INT" HeaderText="ชำระดอกค้าง"
                            ReadOnly="True" SortExpression="SUMPAY_INT" DataFormatString="{0:#,0.00}">
                            <ItemStyle HorizontalAlign="Right" />
                        </asp:BoundField>
                        <asp:BoundField HtmlEncode="False" DataField="SUMPAY_SUSP" HeaderText="ชำระดอกเบี้ยพัก"
                            ReadOnly="True" SortExpression="SUMPAY_SUSP" DataFormatString="{0:#,0.00}">
                            <ItemStyle HorizontalAlign="Right" />
                        </asp:BoundField>
                        <asp:TemplateField>
                            <ItemTemplate>
                                <asp:HyperLink ID="DailyDetailHyperLink" runat="server" ImageUrl="~/images/Magnifying Glass.gif"
                                    ToolTip="Detail" NavigateUrl='<%# "~/aspx/customer/CustomerDebtByAcc.aspx?accno=" + Eval("ACCNO") & "&cif=" & getQueryString("cif") & "&type=Daily" %>'
                                    OnClick="openPopup(null,this.href,null,'width=750,height=650,scrollbars,resizable');return false;">
                                </asp:HyperLink>
                            </ItemTemplate>
                        </asp:TemplateField>
                    </Columns>
                    <FooterStyle BackColor="Tan" />
                    <SelectedRowStyle BackColor="DarkSlateBlue" ForeColor="GhostWhite" />
                    <PagerStyle BackColor="PaleGoldenrod" ForeColor="DarkSlateBlue" HorizontalAlign="Center" />
                    <HeaderStyle BackColor="Tan" Font-Bold="True" />
                    <AlternatingRowStyle BackColor="PaleGoldenrod" />
                </asp:GridView>
            </ItemTemplate>
            <HeaderTemplate>
                <%#dailyHeaderLabel%>
            </HeaderTemplate>
            <FooterStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
            <RowStyle BackColor="#FFFBD6" ForeColor="#333333" />
            <PagerStyle BackColor="#FFCC66" ForeColor="#333333" HorizontalAlign="Center" />
            <HeaderStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
        </asp:FormView>
        <asp:SqlDataSource ID="DailyByCus" runat="server" ConnectionString="<%$ ConnectionStrings:BAY01ConnectionString %>"
            SelectCommand="USP_DetailByCus_SelProc" SelectCommandType="StoredProcedure">
            <SelectParameters>
                <asp:QueryStringParameter Name="CIF" QueryStringField="cif" Type="Int32" />
            </SelectParameters>
        </asp:SqlDataSource>
        <asp:SqlDataSource ID="DailyByAccount" runat="server" ConnectionString="<%$ ConnectionStrings:BAY01ConnectionString %>"
            SelectCommand="USP_DetailByAcc_SelProc" SelectCommandType="StoredProcedure">
            <SelectParameters>
                <asp:QueryStringParameter Name="CIF" QueryStringField="cif" Type="Int32" />
            </SelectParameters>
        </asp:SqlDataSource>
    </div>
</asp:Content>
