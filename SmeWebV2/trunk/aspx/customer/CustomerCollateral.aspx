<%@ Page Title="��ѡ��Сѹ" Language="VB" MasterPageFile="~/Iframe.master" AutoEventWireup="false"
    CodeFile="CustomerCollateral.aspx.vb" Inherits="aspx.customer.CustomerCollateral" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ScriptPlaceHolder" runat="Server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="ContentPlaceHolder2" runat="Server">
    <table width="100%">
        <tr>
            <td>
                <div>
                    <asp:Label ID="lblCID" runat="server" BackColor="White" Font-Bold="True" ForeColor="Maroon"></asp:Label>
                </div>
            </td>
        </tr>
        <tr>
            <td>
                <table width="100%">
                    <tr align="center" valign="top">
                        <td>
                            <asp:GridView ID="dtgCID" runat="Server" AllowPaging="True" AutoGenerateColumns="False"
                                AutoGenerateSelectButton="True" BackColor="LightGoldenrodYellow" BorderColor="Tan"
                                BorderWidth="1px" Caption="���ʡ�û����Թ" CaptionAlign="Left" CellPadding="3"
                                CellSpacing="1" DataKeyNames="APPS_ID" DataSourceID="SqldtsCID" ForeColor="Black"
                                GridLines="None" HeaderStyle-BackColor="#E0E0E0" OnSelectedIndexChanged="dtgCID_SelectedIndexChanged"
                                PageSize="12" SelectedIndex="0" SelectedRowStyle-BackColor="#F0F0F0" ShowFooter="True"
                                Style="float: left" Width="100%">
                                <Columns>
                                    <asp:TemplateField HeaderText="���ʻ����Թ" SortExpression="APPS_ID">
                                        <ItemTemplate>
                                            <%#Eval("APPS_ID").ToString()%>
                                        </ItemTemplate>
                                        <FooterTemplate>
                                            ���</FooterTemplate>
                                        <ItemStyle HorizontalAlign="Right" />
                                        <FooterStyle Font-Bold="True" ForeColor="Black" HorizontalAlign="Center" />
                                    </asp:TemplateField>
                                    <asp:BoundField DataField="APPS_ID" HeaderText="���ʻ����Թ" HtmlEncode="False" SortExpression="APPS_ID">
                                        <ItemStyle HorizontalAlign="Center" />
                                    </asp:BoundField>
                                    <asp:BoundField DataField="CollName" HeaderText="������" HtmlEncode="False" SortExpression="CollName">
                                        <ItemStyle HorizontalAlign="Center" />
                                    </asp:BoundField>
                                    <asp:TemplateField HeaderText="�Ҥһ����Թ" SortExpression="COLLVAL">
                                        <ItemTemplate>
                                            <asp:Label ID="COLLVALLabel" runat="server" Text='<%# Format(Eval("COLLVAL"), "#,###0.00") %>'></asp:Label>
                                        </ItemTemplate>
                                        <FooterTemplate>
                                            <asp:Label ID="SumCOLLVALLabel" runat="server" Text='<%# Format(sumCOLLVAL, "#,###0.00") %>'></asp:Label>
                                        </FooterTemplate>
                                        <ItemStyle HorizontalAlign="Right" />
                                        <FooterStyle Font-Bold="True" ForeColor="Black" HorizontalAlign="Right" />
                                    </asp:TemplateField>
                                    <asp:BoundField DataField="DISCPCT" DataFormatString="{0:#,#.00}" HeaderText="Discount(%)"
                                        HtmlEncode="False" SortExpression="DISCPCT">
                                        <ItemStyle HorizontalAlign="Right" />
                                    </asp:BoundField>
                                    <asp:TemplateField HeaderText="�Ҥ���ѧdiscount" SortExpression="DISCVAL">
                                        <ItemTemplate>
                                            <asp:Label ID="DISCVALLabel" runat="server" Text='<%# Format(Eval("DISCVAL"), "#,###0.00") %>'></asp:Label>
                                        </ItemTemplate>
                                        <FooterTemplate>
                                            <asp:Label ID="SumDISCVALLabel" runat="server" Text='<%# Format(sumDISCVAL, "#,###0.00") %>'></asp:Label>
                                        </FooterTemplate>
                                        <ItemStyle HorizontalAlign="Right" />
                                        <FooterStyle Font-Bold="True" ForeColor="Black" HorizontalAlign="Right" />
                                    </asp:TemplateField>
                                    <asp:BoundField DataField="VALDATE" DataFormatString="{0:dd/MM/yyyy}" HeaderText="�ѹ�������Թ"
                                        HtmlEncode="False" SortExpression="VALDATE" />
                                </Columns>
                                <FooterStyle BackColor="Tan" Font-Bold="True" ForeColor="Black" />
                                <SelectedRowStyle BackColor="PeachPuff" ForeColor="Maroon" />
                                <PagerStyle BackColor="PaleGoldenrod" ForeColor="DarkSlateBlue" HorizontalAlign="Center" />
                                <HeaderStyle BackColor="Tan" Font-Bold="True" />
                                <AlternatingRowStyle BackColor="PaleGoldenrod" />
                                <EmptyDataTemplate>
                                    <asp:Label ID="NoDataLabel" runat="server" Font-Bold="True" Font-Names="tahoma" ForeColor="Red"
                                        Text="No Data"></asp:Label>
                                </EmptyDataTemplate>
                            </asp:GridView>
                            <asp:SqlDataSource ID="SqldtsCID" runat="server" ConnectionString="<%$ ConnectionStrings:BAY01ConnectionString %>"
                                SelectCommand="CustomerCollWithAppId_Select" SelectCommandType="StoredProcedure">
                                <SelectParameters>
                                    <asp:QueryStringParameter Name="Cif" QueryStringField="cif" Type="Int32" />
                                </SelectParameters>
                            </asp:SqlDataSource>
                        </td>
                        <td>
                            <asp:GridView ID="dtgPID" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False"
                                BackColor="LightGoldenrodYellow" BorderColor="Tan" BorderWidth="1px" Caption="���ʡ�èӹͧ"
                                CaptionAlign="Left" CellPadding="3" CellSpacing="1" DataSourceID="SqldtsPID"
                                ForeColor="Black" GridLines="None" PageSize="12" ShowFooter="True" Width="100%">
                                <FooterStyle BackColor="Tan" Font-Bold="True" ForeColor="Black" />
                                <Columns>
                                    <asp:TemplateField HeaderText="���ʨӹͧ" SortExpression="PLED_ID">
                                        <ItemTemplate>
                                            <asp:Label ID="PLED_IDLabel" runat="server" Text='<%#Eval("PLED_ID") %>'></asp:Label>
                                        </ItemTemplate>
                                        <FooterTemplate>
                                            ���
                                        </FooterTemplate>
                                        <ItemStyle HorizontalAlign="Right" />
                                        <FooterStyle Font-Bold="True" ForeColor="Black" HorizontalAlign="Center" />
                                    </asp:TemplateField>
                                    <asp:BoundField DataField="PLED_SEQ" HeaderText="�ӴѺ" HtmlEncode="False" SortExpression="PLED_SEQ">
                                        <ItemStyle HorizontalAlign="Center" />
                                    </asp:BoundField>
                                    <asp:TemplateField HeaderText="��Ũӹͧ" SortExpression="GUAR_AMT">
                                        <ItemTemplate>
                                            <asp:Label ID="GUAR_AMTLabel" runat="server" Text='<%# Format(Eval("GUAR_AMT"), "#,###0.00") %>'></asp:Label>
                                        </ItemTemplate>
                                        <FooterTemplate>
                                            <asp:Label ID="SumGUAR_AMTLabel" runat="server" Text='<%#Format(sumGUAR_AMT, "#,###0.00")%>'></asp:Label>
                                        </FooterTemplate>
                                        <ItemStyle HorizontalAlign="Right" />
                                        <FooterStyle Font-Bold="True" ForeColor="Black" HorizontalAlign="Right" />
                                    </asp:TemplateField>
                                </Columns>
                                <SelectedRowStyle BackColor="DarkSlateBlue" ForeColor="GhostWhite" />
                                <PagerStyle BackColor="PaleGoldenrod" ForeColor="DarkSlateBlue" HorizontalAlign="Center" />
                                <HeaderStyle BackColor="Tan" Font-Bold="True" />
                                <AlternatingRowStyle BackColor="PaleGoldenrod" />
                                <EmptyDataTemplate>
                                    <asp:Label ID="NoDataLabel2" runat="server" Font-Bold="True" Font-Names="tahoma"
                                        ForeColor="Red" Text="No Data"></asp:Label>
                                </EmptyDataTemplate>
                            </asp:GridView>
                            <asp:SqlDataSource ID="SqldtsPID" runat="server" ConnectionString="<%$ ConnectionStrings:BAY01ConnectionString %>"
                                SelectCommand="CustomerCollWithPledId_Select" SelectCommandType="StoredProcedure">
                                <SelectParameters>
                                    <asp:QueryStringParameter Name="Cif" QueryStringField="cif" Type="Int32" />
                                </SelectParameters>
                            </asp:SqlDataSource>
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
        <tr align="center">
            <td>
                <asp:Label ID="lblAID" runat="server" Font-Bold="True" ForeColor="Black"></asp:Label>
                <asp:GridView ID="dtgDic05" runat="server" AllowPaging="True" AllowSorting="True"
                    AutoGenerateColumns="False" BackColor="LightGoldenrodYellow" BorderColor="Tan"
                    BorderStyle="Ridge" BorderWidth="1px" Caption="���Թ" CaptionAlign="Left" CellPadding="3"
                    CellSpacing="1" DataSourceID="SqlDtsDic05" ForeColor="Black" GridLines="None"
                    PageSize="30" Width="100%">
                    <FooterStyle BackColor="Tan" />
                    <Columns>
                        <asp:BoundField DataField="COLL_ID" HeaderText="���ʪ�鹷�Ѿ��" SortExpression="COLL_ID" />
                        <asp:BoundField DataField="TYPE" HeaderText="�����������Է���" SortExpression="TYPE" />
                        <asp:BoundField DataField="CHANODE" HeaderText="�Ţ���" SortExpression="CHANODE" />
                        <asp:BoundField DataField="LAND" HeaderText="�Ţ���Թ" SortExpression="LAND" />
                        <asp:BoundField DataField="SURVEY" HeaderText="˹�����Ǩ" SortExpression="SURVEY" />
                        <asp:BoundField DataField="PAGE" HeaderText="˹��" SortExpression="PAGE" />
                        <asp:BoundField DataField="BOOK" HeaderText="����" SortExpression="BOOK" />
                        <asp:BoundField DataField="BUILDNAME" HeaderText="�����ç���" SortExpression="BUILDNAME" />
                        <asp:BoundField DataField="SOI" HeaderText="���" SortExpression="SOI" />
                        <asp:BoundField DataField="ROAD" HeaderText="���" SortExpression="ROAD" />
                        <asp:BoundField DataField="DISTRICT" HeaderText="�Ӻ�/�ǧ" SortExpression="DISTRICT" />
                        <asp:BoundField DataField="AMPHUR" HeaderText="�����/ࢵ" SortExpression="AMPHUR" />
                        <asp:BoundField DataField="PROV" HeaderText="�ѧ��Ѵ" SortExpression="PROV" />
                        <asp:BoundField DataField="AREA_RAI" DataFormatString="{0:N0}" HeaderText="���" HtmlEncode="False"
                            SortExpression="AREA_RAI" />
                        <asp:BoundField DataField="AREA_NGAN" DataFormatString="{0:N0}" HeaderText="�ҹ"
                            HtmlEncode="False" SortExpression="AREA_NGAN" />
                        <asp:BoundField DataField="AREA_WAH" DataFormatString="{0:#,0.00}" HeaderText="��"
                            HtmlEncode="False" SortExpression="AREA_WAH" />
                    </Columns>
                    <SelectedRowStyle BackColor="DarkSlateBlue" ForeColor="GhostWhite" />
                    <PagerStyle BackColor="PaleGoldenrod" ForeColor="DarkSlateBlue" HorizontalAlign="Center" />
                    <HeaderStyle BackColor="Tan" Font-Bold="True" />
                    <AlternatingRowStyle BackColor="PaleGoldenrod" />
                </asp:GridView>
                <asp:SqlDataSource ID="SqlDtsDic05" runat="server" ConnectionString="<%$ ConnectionStrings:BAY01ConnectionString %>"
                    SelectCommand="UspDIC05SelProc2" SelectCommandType="StoredProcedure">
                    <SelectParameters>
                        <asp:ControlParameter ControlID="dtgCID" Name="APPS_ID" PropertyName="SelectedValue"
                            Type="Int32" />
                    </SelectParameters>
                </asp:SqlDataSource>
                <asp:GridView ID="dtgDic07" runat="server" AllowPaging="True" AllowSorting="True"
                    AutoGenerateColumns="False" BackColor="LightGoldenrodYellow" BorderColor="Tan"
                    BorderStyle="Ridge" BorderWidth="1px" Caption="��觻�١���ҧ" CaptionAlign="Left"
                    CellPadding="3" CellSpacing="1" DataSourceID="SqlDtsDic07" ForeColor="Black"
                    GridLines="None" PageSize="30" Width="100%">
                    <FooterStyle BackColor="Tan" />
                    <Columns>
                        <asp:BoundField DataField="COLL_ID" HeaderText="���ʪ�鹷�Ѿ��" SortExpression="COLL_ID" />
                        <asp:BoundField DataField="BUIL_TYPE" HeaderText="��觻�١���ҧ" SortExpression="BUIL_TYPE" />
                        <asp:BoundField DataField="BUIL_FLOOR" HeaderText="��.���" SortExpression="BUIL_FLOOR" />
                        <asp:BoundField DataField="BUILNAME" HeaderText="�����ç���" SortExpression="BUILNAME" />
                        <asp:BoundField DataField="BUILD_ADDR" HeaderText="�Ţ���" SortExpression="BUILD_ADDR" />
                        <asp:BoundField DataField="BUILD_ROAD" HeaderText="���" SortExpression="BUILD_ROAD" />
                        <asp:BoundField DataField="BUILD_GROU" HeaderText="����" SortExpression="BUILD_GROU" />
                        <asp:BoundField DataField="BUILD_SOI" HeaderText="���" SortExpression="BUILD_SOI" />
                        <asp:BoundField DataField="DISTRICT" HeaderText="�Ӻ�/�ǧ" SortExpression="DISTRICT" />
                        <asp:BoundField DataField="AMPHUR" HeaderText="�����/ࢵ" SortExpression="AMPHUR" />
                        <asp:BoundField DataField="PROV" HeaderText="�ѧ��Ѵ" SortExpression="PROV" />
                        <asp:BoundField DataField="BUIL_AREA" DataFormatString="{0:#,#.00}" HeaderText="��鹷��"
                            HtmlEncode="False" SortExpression="BUIL_AREA" />
                    </Columns>
                    <SelectedRowStyle BackColor="DarkSlateBlue" ForeColor="GhostWhite" />
                    <PagerStyle BackColor="PaleGoldenrod" ForeColor="DarkSlateBlue" HorizontalAlign="Center" />
                    <HeaderStyle BackColor="Tan" Font-Bold="True" />
                    <AlternatingRowStyle BackColor="PaleGoldenrod" />
                </asp:GridView>
                <asp:SqlDataSource ID="SqlDtsDic07" runat="server" ConnectionString="<%$ ConnectionStrings:BAY01ConnectionString %>"
                    SelectCommand="UspDIC07SelProc2" SelectCommandType="StoredProcedure">
                    <SelectParameters>
                        <asp:ControlParameter ControlID="dtgCID" DefaultValue="" Name="APPS_ID" PropertyName="SelectedValue"
                            Type="Int32" />
                    </SelectParameters>
                </asp:SqlDataSource>
                <asp:GridView ID="dtgDic18" runat="server" AllowPaging="True" AllowSorting="True"
                    AutoGenerateColumns="False" BackColor="LightGoldenrodYellow" BorderColor="Tan"
                    BorderWidth="1px" Caption="�Ҥ�êش" CaptionAlign="Left" CellPadding="2" DataSourceID="SqldtsDic18"
                    ForeColor="Black" GridLines="None" PageSize="30" Width="100%">
                    <FooterStyle BackColor="Tan" />
                    <Columns>
                        <asp:BoundField DataField="COLL_ID" HeaderText="���ʪ�鹷�Ѿ��" SortExpression="COLL_ID" />
                        <asp:BoundField DataField="ROOM_NO" HeaderText="�Ţ�����ͧ" SortExpression="ROOM_NO" />
                        <asp:BoundField DataField="FLOOR" HeaderText="��鹷��" SortExpression="FLOOR" />
                        <asp:BoundField DataField="ROOM_AREA" DataFormatString="{0:#,#.00}" HeaderText="��Ҵ��ͧ"
                            HtmlEncode="False" SortExpression="ROOM_AREA" />
                        <asp:BoundField DataField="BUILDNAME" HeaderText="�����ç���" SortExpression="BUILDNAME" />
                        <asp:BoundField DataField="ADDR" HeaderText="�Ţ���" SortExpression="ADDR" />
                        <asp:BoundField DataField="SOI" HeaderText="���" SortExpression="SOI" />
                        <asp:BoundField DataField="ROAD" HeaderText="���" SortExpression="ROAD" />
                        <asp:BoundField DataField="MOO" HeaderText="������" SortExpression="MOO" />
                        <asp:BoundField DataField="DISTRICT" HeaderText="�Ӻ�/�ǧ" SortExpression="DISTRICT" />
                        <asp:BoundField DataField="AMPHUR" HeaderText="�����/ࢵ" SortExpression="AMPHUR" />
                        <asp:BoundField DataField="PROV" HeaderText="�ѧ��Ѵ" SortExpression="PROV" />
                    </Columns>
                    <SelectedRowStyle BackColor="DarkSlateBlue" ForeColor="GhostWhite" />
                    <PagerStyle BackColor="PaleGoldenrod" ForeColor="DarkSlateBlue" HorizontalAlign="Center" />
                    <HeaderStyle BackColor="Tan" Font-Bold="True" />
                    <AlternatingRowStyle BackColor="PaleGoldenrod" />
                </asp:GridView>
                <asp:SqlDataSource ID="SqldtsDic18" runat="server" ConnectionString="<%$ ConnectionStrings:BAY01ConnectionString %>"
                    SelectCommand="UspDIC18SelProc2" SelectCommandType="StoredProcedure">
                    <SelectParameters>
                        <asp:ControlParameter ControlID="dtgCID" Name="APPS_ID" PropertyName="SelectedValue"
                            Type="Int32" />
                    </SelectParameters>
                </asp:SqlDataSource>
                <asp:GridView ID="dtgDic08" runat="server" AllowPaging="True" AllowSorting="True"
                    AutoGenerateColumns="False" BackColor="LightGoldenrodYellow" BorderColor="Tan"
                    BorderWidth="1px" Caption="�Է�ԡ�����" CaptionAlign="Left" CellPadding="2"
                    DataKeyNames="COLL_ID" DataSourceID="SqldtsDic08" ForeColor="Black" GridLines="None"
                    PageSize="30" Width="100%">
                    <FooterStyle BackColor="Tan" />
                    <Columns>
                        <asp:BoundField DataField="COLL_ID" HeaderText="���ʪ�鹷�Ѿ��" ReadOnly="True" SortExpression="COLL_ID" />
                        <asp:BoundField DataField="RENTALTYPE" HeaderText="������������" SortExpression="RENTALTYPE" />
                        <asp:BoundField DataField="RENTALNAME" HeaderText="�����Է���ͧ" SortExpression="RENTALNAME" />
                        <asp:BoundField DataField="REN_CNT_NO" HeaderText="�ѭ���Ţ���" SortExpression="REN_CNT_NO" />
                        <asp:BoundField DataField="CNT_DATE" DataFormatString="{0:dd/MM/yyyy}" HeaderText="�ѹ����ѭ��"
                            HtmlEncode="False" SortExpression="CNT_DATE" />
                        <asp:BoundField DataField="CNT_DUE" DataFormatString="{0:dd/MM/yyyy}" HeaderText="�ѹ�ú��˹�"
                            HtmlEncode="False" SortExpression="CNT_DUE" />
                        <asp:BoundField DataField="REN_OWNER" HeaderText="���������" SortExpression="REN_OWNER" />
                        <asp:BoundField DataField="REN_REN_BY" HeaderText="���ͼ�����" SortExpression="REN_REN_BY" />
                        <asp:BoundField DataField="BUILDNAME" HeaderText="�����ç���" SortExpression="BUILDNAME" />
                        <asp:BoundField DataField="REN_ADDR" HeaderText="�Ţ���" SortExpression="REN_ADDR" />
                        <asp:BoundField DataField="REN_ROAD" HeaderText="���" SortExpression="REN_ROAD" />
                        <asp:BoundField DataField="DISTRICT" HeaderText="�Ӻ�" SortExpression="DISTRICT" />
                        <asp:BoundField DataField="AMPHUR" HeaderText="�����" SortExpression="AMPHUR" />
                        <asp:BoundField DataField="PROV" HeaderText="�ѧ��Ѵ" SortExpression="PROV" />
                    </Columns>
                    <SelectedRowStyle BackColor="DarkSlateBlue" ForeColor="GhostWhite" />
                    <PagerStyle BackColor="PaleGoldenrod" ForeColor="DarkSlateBlue" HorizontalAlign="Center" />
                    <HeaderStyle BackColor="Tan" Font-Bold="True" />
                    <AlternatingRowStyle BackColor="PaleGoldenrod" />
                </asp:GridView>
                <asp:SqlDataSource ID="SqldtsDic08" runat="server" ConnectionString="<%$ ConnectionStrings:BAY01ConnectionString %>"
                    SelectCommand="UspDIC08SelProc" SelectCommandType="StoredProcedure">
                    <SelectParameters>
                        <asp:ControlParameter ControlID="dtgCID" Name="APPS_ID" PropertyName="SelectedValue"
                            Type="Int32" />
                    </SelectParameters>
                </asp:SqlDataSource>
                <asp:GridView ID="dtgDic09" runat="server" AllowPaging="True" AllowSorting="True"
                    AutoGenerateColumns="False" BackColor="LightGoldenrodYellow" BorderColor="Tan"
                    BorderWidth="1px" Caption="����ͧ�ѡ�" CaptionAlign="Left" CellPadding="2" DataKeyNames="COLL_ID"
                    DataSourceID="SqldtsDic09" ForeColor="Black" GridLines="None" PageSize="30" Width="100%">
                    <FooterStyle BackColor="Tan" />
                    <Columns>
                        <asp:BoundField DataField="COLL_ID" HeaderText="���ʪ�鹷�Ѿ��" ReadOnly="True" SortExpression="COLL_ID" />
                        <asp:BoundField DataField="FLEDTYPE" HeaderText="������" SortExpression="FLEDTYPE" />
                        <asp:BoundField DataField="MACHTYPE" HeaderText="����������ͧ�ѡ�" SortExpression="MACHTYPE" />
                        <asp:BoundField DataField="MACHNO" HeaderText="No." SortExpression="MACHNO" />
                        <asp:BoundField DataField="BUILDNAME" HeaderText="���ͺ���ѷ" SortExpression="BUILDNAME" />
                        <asp:BoundField DataField="ADDR" HeaderText="�Ţ���" SortExpression="ADDR" />
                        <asp:BoundField DataField="ROAD" HeaderText="���" SortExpression="ROAD" />
                        <asp:BoundField DataField="DISTRICT" HeaderText="�Ӻ�" SortExpression="DISTRICT" />
                        <asp:BoundField DataField="AMPHUR" HeaderText="�����" SortExpression="AMPHUR" />
                        <asp:BoundField DataField="PROV" HeaderText="�ѧ��Ѵ" SortExpression="PROV" />
                    </Columns>
                    <SelectedRowStyle BackColor="DarkSlateBlue" ForeColor="GhostWhite" />
                    <PagerStyle BackColor="PaleGoldenrod" ForeColor="DarkSlateBlue" HorizontalAlign="Center" />
                    <HeaderStyle BackColor="Tan" Font-Bold="True" />
                    <AlternatingRowStyle BackColor="PaleGoldenrod" />
                </asp:GridView>
                <asp:SqlDataSource ID="SqldtsDic09" runat="server" ConnectionString="<%$ ConnectionStrings:BAY01ConnectionString %>"
                    SelectCommand="UspDIC09SelProc" SelectCommandType="StoredProcedure">
                    <SelectParameters>
                        <asp:ControlParameter ControlID="dtgCID" Name="APPS_ID" PropertyName="SelectedValue"
                            Type="Int32" />
                    </SelectParameters>
                </asp:SqlDataSource>
                <asp:GridView ID="dtgDic10" runat="server" AllowPaging="True" AllowSorting="True"
                    AutoGenerateColumns="False" BackColor="LightGoldenrodYellow" BorderColor="Tan"
                    BorderWidth="1px" Caption="�Թ���" CaptionAlign="Left" CellPadding="2" DataKeyNames="COLL_ID"
                    DataSourceID="SqldtsDic10" ForeColor="Black" GridLines="None" PageSize="30" Width="100%">
                    <FooterStyle BackColor="Tan" />
                    <Columns>
                        <asp:BoundField DataField="COLL_ID" HeaderText="���ʪ�鹷�Ѿ��" ReadOnly="True" SortExpression="COLL_ID" />
                        <asp:BoundField DataField="GOODTYPE" HeaderText="�������Թ���" SortExpression="GOODTYPE" />
                        <asp:BoundField DataField="GOODQTY" DataFormatString="{0:#,#.00}" HeaderText="����ҳ"
                            SortExpression="GOODQTY">
                            <ItemStyle HorizontalAlign="Right" />
                        </asp:BoundField>
                        <asp:BoundField DataField="GOODUNIT" HeaderText="˹���" HtmlEncode="False" SortExpression="GOODUNIT" />
                        <asp:BoundField DataField="BUILDNAME" HeaderText="�����ç���" SortExpression="BUILDNAME" />
                        <asp:BoundField DataField="ADDR" HeaderText="�Ţ���" SortExpression="ADDR" />
                        <asp:BoundField DataField="ROAD" HeaderText="���" SortExpression="ROAD" />
                        <asp:BoundField DataField="DISTRICT" HeaderText="�Ӻ�/�ǧ" SortExpression="DISTRICT" />
                        <asp:BoundField DataField="AMPHUR" HeaderText="�����/ࢵ" SortExpression="AMPHUR" />
                        <asp:BoundField DataField="PROV" HeaderText="�ѧ��Ѵ" SortExpression="PROV" />
                    </Columns>
                    <SelectedRowStyle BackColor="DarkSlateBlue" ForeColor="GhostWhite" />
                    <PagerStyle BackColor="PaleGoldenrod" ForeColor="DarkSlateBlue" HorizontalAlign="Center" />
                    <HeaderStyle BackColor="Tan" Font-Bold="True" />
                    <AlternatingRowStyle BackColor="PaleGoldenrod" />
                </asp:GridView>
                <asp:SqlDataSource ID="SqldtsDic10" runat="server" ConnectionString="<%$ ConnectionStrings:BAY01ConnectionString %>"
                    SelectCommand="UspDIC10SelProc" SelectCommandType="StoredProcedure">
                    <SelectParameters>
                        <asp:ControlParameter ControlID="dtgCID" Name="APPS_ID" PropertyName="SelectedValue"
                            Type="Int32" />
                    </SelectParameters>
                </asp:SqlDataSource>
                <asp:GridView ID="dtgDic14" runat="server" AllowPaging="True" AllowSorting="True"
                    AutoGenerateColumns="False" BackColor="LightGoldenrodYellow" BorderColor="Tan"
                    BorderWidth="1px" Caption="����" CaptionAlign="Left" CellPadding="2" DataKeyNames="COLL_ID"
                    DataSourceID="SqldtsDic14" ForeColor="Black" GridLines="None" PageSize="30" Width="100%">
                    <FooterStyle BackColor="Tan" />
                    <Columns>
                        <asp:BoundField DataField="COLL_ID" HeaderText="���ʪ�鹷�Ѿ��" ReadOnly="True" SortExpression="COLL_ID" />
                        <asp:BoundField DataField="Shr_Type" HeaderText="���������" SortExpression="Shr_Type" />
                        <asp:BoundField DataField="NAME" HeaderText="����" SortExpression="NAME" />
                        <asp:BoundField DataField="LISTE_FLAG" HeaderText="�.㹵�Ҵ��ѡ��Ѿ��" SortExpression="LISTE_FLAG" />
                        <asp:BoundField DataField="CODE" HeaderText="�������" SortExpression="CODE" />
                        <asp:BoundField DataField="REGISTER" HeaderText="�Ţ����¹" SortExpression="REGISTER" />
                        <asp:BoundField DataField="CERT_NO" HeaderText="�Ţ�������" SortExpression="CERT_NO" />
                        <asp:BoundField DataField="NOSHR" HeaderText="��.���" SortExpression="NOSHR" />
                        <asp:BoundField DataField="NOFROM" HeaderText="�ҡ No. " SortExpression="NOFROM" />
                        <asp:BoundField DataField="NOTO" HeaderText="�֧ No. " SortExpression="NOTO" />
                        <asp:BoundField DataField="PAR_VALUE" HeaderText="��Ť�����" SortExpression="PAR_VALUE" />
                    </Columns>
                    <SelectedRowStyle BackColor="DarkSlateBlue" ForeColor="GhostWhite" />
                    <PagerStyle BackColor="PaleGoldenrod" ForeColor="DarkSlateBlue" HorizontalAlign="Center" />
                    <HeaderStyle BackColor="Tan" Font-Bold="True" />
                    <AlternatingRowStyle BackColor="PaleGoldenrod" />
                </asp:GridView>
                <asp:SqlDataSource ID="SqldtsDic14" runat="server" ConnectionString="<%$ ConnectionStrings:BAY01ConnectionString %>"
                    SelectCommand="UspDIC14SelProc" SelectCommandType="StoredProcedure">
                    <SelectParameters>
                        <asp:ControlParameter ControlID="dtgCID" Name="APPS_ID" PropertyName="SelectedValue"
                            Type="Int32" />
                    </SelectParameters>
                </asp:SqlDataSource>
                <asp:GridView ID="dtgDic15" runat="server" AllowPaging="True" AllowSorting="True"
                    AutoGenerateColumns="False" BackColor="LightGoldenrodYellow" BorderColor="Tan"
                    BorderWidth="1px" Caption="�����/����ͧ�Թ" CaptionAlign="Left" CellPadding="2"
                    DataKeyNames="COLL_ID" DataSourceID="SqldtsDic15" ForeColor="Black" GridLines="None"
                    PageSize="30" Width="100%">
                    <FooterStyle BackColor="Tan" />
                    <Columns>
                        <asp:BoundField DataField="COLL_ID" HeaderText="���ʪ�鹷�Ѿ��" ReadOnly="True" SortExpression="COLL_ID" />
                        <asp:BoundField DataField="NAME" HeaderText="��������" SortExpression="NAME" />
                        <asp:BoundField DataField="SHIP_NO" HeaderText="�Ţ����¹" SortExpression="SHIP_NO" />
                        <asp:BoundField DataField="REGIS_PORT" HeaderText="���ͧ��Ң�鹷���¹" SortExpression="REGIS_PORT" />
                        <asp:BoundField DataField="WEIGHT" HeaderText="��Ҵ" SortExpression="WEIGHT" />
                        <asp:BoundField DataField="POWER" HeaderText="������" SortExpression="POWER" />
                        <asp:BoundField DataField="BUILDNAME" HeaderText="�����ç���" SortExpression="BUILDNAME" />
                        <asp:BoundField DataField="ADDR" HeaderText="�Ţ���" SortExpression="ADDR" />
                        <asp:BoundField DataField="ROAD" HeaderText="���" SortExpression="ROAD" />
                        <asp:BoundField DataField="DISTRICT" HeaderText="�Ӻ�/�ǧ" SortExpression="DISTRICT" />
                        <asp:BoundField DataField="AMPHUR" HeaderText="�����/ࢵ" SortExpression="AMPHUR" />
                        <asp:BoundField DataField="PROV" HeaderText="�ѧ��Ѵ" SortExpression="PROV" />
                    </Columns>
                    <SelectedRowStyle BackColor="DarkSlateBlue" ForeColor="GhostWhite" />
                    <PagerStyle BackColor="PaleGoldenrod" ForeColor="DarkSlateBlue" HorizontalAlign="Center" />
                    <HeaderStyle BackColor="Tan" Font-Bold="True" />
                    <AlternatingRowStyle BackColor="PaleGoldenrod" />
                </asp:GridView>
                <asp:SqlDataSource ID="SqldtsDic15" runat="server" ConnectionString="<%$ ConnectionStrings:BAY01ConnectionString %>"
                    SelectCommand="UspDIC15SelProc" SelectCommandType="StoredProcedure">
                    <SelectParameters>
                        <asp:ControlParameter ControlID="dtgCID" Name="APPS_ID" PropertyName="SelectedValue"
                            Type="Int32" />
                    </SelectParameters>
                </asp:SqlDataSource>
                <asp:GridView ID="dtgDic99" runat="server" AllowPaging="True" AllowSorting="True"
                    AutoGenerateColumns="False" BackColor="LightGoldenrodYellow" BorderColor="Tan"
                    BorderWidth="1px" Caption="����" CaptionAlign="Left" CellPadding="2" DataKeyNames="COLL_ID"
                    DataSourceID="SqldtsDic99" ForeColor="Black" GridLines="None" PageSize="30" Width="100%">
                    <FooterStyle BackColor="Tan" />
                    <Columns>
                        <asp:BoundField DataField="COLL_ID" HeaderText="���ʪ�鹷�Ѿ��" ReadOnly="True" SortExpression="COLL_ID" />
                        <asp:BoundField DataField="COLLNAME" HeaderText="������ѡ��Ѿ��" ReadOnly="True"
                            SortExpression="COLLNAME" />
                        <asp:BoundField DataField="APPSFLAG" HeaderText="��û����Թ�Ҥ�" SortExpression="APPSFLAG" />
                        <asp:BoundField DataField="BUILDNAME" HeaderText="�����ç���" SortExpression="BUILDNAME" />
                        <asp:BoundField DataField="ADDR" HeaderText="�Ţ���" SortExpression="ADDR" />
                        <asp:BoundField DataField="ROAD" HeaderText="���" SortExpression="ROAD" />
                        <asp:BoundField DataField="DISTRICT" HeaderText="�Ӻ�/�ǧ" SortExpression="DISTRICT" />
                        <asp:BoundField DataField="AMPHUR" HeaderText="�����/ࢵ" SortExpression="AMPHUR" />
                        <asp:BoundField DataField="PROV" HeaderText="�ѧ��Ѵ" SortExpression="PROV" />
                    </Columns>
                    <SelectedRowStyle BackColor="DarkSlateBlue" ForeColor="GhostWhite" />
                    <PagerStyle BackColor="PaleGoldenrod" ForeColor="DarkSlateBlue" HorizontalAlign="Center" />
                    <HeaderStyle BackColor="Tan" Font-Bold="True" />
                    <AlternatingRowStyle BackColor="PaleGoldenrod" />
                </asp:GridView>
                <asp:SqlDataSource ID="SqldtsDic99" runat="server" ConnectionString="<%$ ConnectionStrings:BAY01ConnectionString %>"
                    SelectCommand="UspDIC99SelProc" SelectCommandType="StoredProcedure">
                    <SelectParameters>
                        <asp:ControlParameter ControlID="dtgCID" Name="APPS_ID" PropertyName="SelectedValue"
                            Type="Int32" />
                    </SelectParameters>
                </asp:SqlDataSource>
            </td>
        </tr>
    </table>
</asp:Content>
