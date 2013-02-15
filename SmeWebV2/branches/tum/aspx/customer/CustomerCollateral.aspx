<%@ Page Title="หลักประกัน" Language="VB" MasterPageFile="~/Iframe.master" AutoEventWireup="false"
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
                                BorderWidth="1px" Caption="รหัสการประเมิน" CaptionAlign="Left" CellPadding="3"
                                CellSpacing="1" DataKeyNames="APPS_ID" DataSourceID="SqldtsCID" ForeColor="Black"
                                GridLines="None" HeaderStyle-BackColor="#E0E0E0" OnSelectedIndexChanged="dtgCID_SelectedIndexChanged"
                                PageSize="12" SelectedIndex="0" SelectedRowStyle-BackColor="#F0F0F0" ShowFooter="True"
                                Style="float: left" Width="100%">
                                <Columns>
                                    <asp:TemplateField HeaderText="รหัสประเมิน" SortExpression="APPS_ID">
                                        <ItemTemplate>
                                            <%#Eval("APPS_ID").ToString()%>
                                        </ItemTemplate>
                                        <FooterTemplate>
                                            รวม</FooterTemplate>
                                        <ItemStyle HorizontalAlign="Right" />
                                        <FooterStyle Font-Bold="True" ForeColor="Black" HorizontalAlign="Center" />
                                    </asp:TemplateField>
                                    <asp:BoundField DataField="APPS_ID" HeaderText="รหัสประเมิน" HtmlEncode="False" SortExpression="APPS_ID">
                                        <ItemStyle HorizontalAlign="Center" />
                                    </asp:BoundField>
                                    <asp:BoundField DataField="CollName" HeaderText="ประเภท" HtmlEncode="False" SortExpression="CollName">
                                        <ItemStyle HorizontalAlign="Center" />
                                    </asp:BoundField>
                                    <asp:TemplateField HeaderText="ราคาประเมิน" SortExpression="COLLVAL">
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
                                    <asp:TemplateField HeaderText="ราคาหลังdiscount" SortExpression="DISCVAL">
                                        <ItemTemplate>
                                            <asp:Label ID="DISCVALLabel" runat="server" Text='<%# Format(Eval("DISCVAL"), "#,###0.00") %>'></asp:Label>
                                        </ItemTemplate>
                                        <FooterTemplate>
                                            <asp:Label ID="SumDISCVALLabel" runat="server" Text='<%# Format(sumDISCVAL, "#,###0.00") %>'></asp:Label>
                                        </FooterTemplate>
                                        <ItemStyle HorizontalAlign="Right" />
                                        <FooterStyle Font-Bold="True" ForeColor="Black" HorizontalAlign="Right" />
                                    </asp:TemplateField>
                                    <asp:BoundField DataField="VALDATE" DataFormatString="{0:dd/MM/yyyy}" HeaderText="วันที่ประเมิน"
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
                                BackColor="LightGoldenrodYellow" BorderColor="Tan" BorderWidth="1px" Caption="รหัสการจำนอง"
                                CaptionAlign="Left" CellPadding="3" CellSpacing="1" DataSourceID="SqldtsPID"
                                ForeColor="Black" GridLines="None" PageSize="12" ShowFooter="True" Width="100%">
                                <FooterStyle BackColor="Tan" Font-Bold="True" ForeColor="Black" />
                                <Columns>
                                    <asp:TemplateField HeaderText="รหัสจำนอง" SortExpression="PLED_ID">
                                        <ItemTemplate>
                                            <asp:Label ID="PLED_IDLabel" runat="server" Text='<%#Eval("PLED_ID") %>'></asp:Label>
                                        </ItemTemplate>
                                        <FooterTemplate>
                                            รวม
                                        </FooterTemplate>
                                        <ItemStyle HorizontalAlign="Right" />
                                        <FooterStyle Font-Bold="True" ForeColor="Black" HorizontalAlign="Center" />
                                    </asp:TemplateField>
                                    <asp:BoundField DataField="PLED_SEQ" HeaderText="ลำดับ" HtmlEncode="False" SortExpression="PLED_SEQ">
                                        <ItemStyle HorizontalAlign="Center" />
                                    </asp:BoundField>
                                    <asp:TemplateField HeaderText="มูลจำนอง" SortExpression="GUAR_AMT">
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
                    BorderStyle="Ridge" BorderWidth="1px" Caption="ที่ดิน" CaptionAlign="Left" CellPadding="3"
                    CellSpacing="1" DataSourceID="SqlDtsDic05" ForeColor="Black" GridLines="None"
                    PageSize="30" Width="100%">
                    <FooterStyle BackColor="Tan" />
                    <Columns>
                        <asp:BoundField DataField="COLL_ID" HeaderText="รหัสชิ้นทรัพย์" SortExpression="COLL_ID" />
                        <asp:BoundField DataField="TYPE" HeaderText="ประเภทกรรมสิทธิ์" SortExpression="TYPE" />
                        <asp:BoundField DataField="CHANODE" HeaderText="เลขที่" SortExpression="CHANODE" />
                        <asp:BoundField DataField="LAND" HeaderText="เลขที่ดิน" SortExpression="LAND" />
                        <asp:BoundField DataField="SURVEY" HeaderText="หน้าสำรวจ" SortExpression="SURVEY" />
                        <asp:BoundField DataField="PAGE" HeaderText="หน้า" SortExpression="PAGE" />
                        <asp:BoundField DataField="BOOK" HeaderText="เล่ม" SortExpression="BOOK" />
                        <asp:BoundField DataField="BUILDNAME" HeaderText="ชื่อโครงการ" SortExpression="BUILDNAME" />
                        <asp:BoundField DataField="SOI" HeaderText="ซอย" SortExpression="SOI" />
                        <asp:BoundField DataField="ROAD" HeaderText="ถนน" SortExpression="ROAD" />
                        <asp:BoundField DataField="DISTRICT" HeaderText="ตำบล/แขวง" SortExpression="DISTRICT" />
                        <asp:BoundField DataField="AMPHUR" HeaderText="อำเภอ/เขต" SortExpression="AMPHUR" />
                        <asp:BoundField DataField="PROV" HeaderText="จังหวัด" SortExpression="PROV" />
                        <asp:BoundField DataField="AREA_RAI" DataFormatString="{0:N0}" HeaderText="ไร่" HtmlEncode="False"
                            SortExpression="AREA_RAI" />
                        <asp:BoundField DataField="AREA_NGAN" DataFormatString="{0:N0}" HeaderText="งาน"
                            HtmlEncode="False" SortExpression="AREA_NGAN" />
                        <asp:BoundField DataField="AREA_WAH" DataFormatString="{0:#,0.00}" HeaderText="วา"
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
                    BorderStyle="Ridge" BorderWidth="1px" Caption="สิ่งปลูกสร้าง" CaptionAlign="Left"
                    CellPadding="3" CellSpacing="1" DataSourceID="SqlDtsDic07" ForeColor="Black"
                    GridLines="None" PageSize="30" Width="100%">
                    <FooterStyle BackColor="Tan" />
                    <Columns>
                        <asp:BoundField DataField="COLL_ID" HeaderText="รหัสชิ้นทรัพย์" SortExpression="COLL_ID" />
                        <asp:BoundField DataField="BUIL_TYPE" HeaderText="สิ่งปลูกสร้าง" SortExpression="BUIL_TYPE" />
                        <asp:BoundField DataField="BUIL_FLOOR" HeaderText="จน.ชั้น" SortExpression="BUIL_FLOOR" />
                        <asp:BoundField DataField="BUILNAME" HeaderText="ชื่อโครงการ" SortExpression="BUILNAME" />
                        <asp:BoundField DataField="BUILD_ADDR" HeaderText="เลขที่" SortExpression="BUILD_ADDR" />
                        <asp:BoundField DataField="BUILD_ROAD" HeaderText="ถนน" SortExpression="BUILD_ROAD" />
                        <asp:BoundField DataField="BUILD_GROU" HeaderText="หมู่" SortExpression="BUILD_GROU" />
                        <asp:BoundField DataField="BUILD_SOI" HeaderText="ซอย" SortExpression="BUILD_SOI" />
                        <asp:BoundField DataField="DISTRICT" HeaderText="ตำบล/แขวง" SortExpression="DISTRICT" />
                        <asp:BoundField DataField="AMPHUR" HeaderText="อำเภอ/เขต" SortExpression="AMPHUR" />
                        <asp:BoundField DataField="PROV" HeaderText="จังหวัด" SortExpression="PROV" />
                        <asp:BoundField DataField="BUIL_AREA" DataFormatString="{0:#,#.00}" HeaderText="พื้นที่"
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
                    BorderWidth="1px" Caption="อาคารชุด" CaptionAlign="Left" CellPadding="2" DataSourceID="SqldtsDic18"
                    ForeColor="Black" GridLines="None" PageSize="30" Width="100%">
                    <FooterStyle BackColor="Tan" />
                    <Columns>
                        <asp:BoundField DataField="COLL_ID" HeaderText="รหัสชิ้นทรัพย์" SortExpression="COLL_ID" />
                        <asp:BoundField DataField="ROOM_NO" HeaderText="เลขที่ห้อง" SortExpression="ROOM_NO" />
                        <asp:BoundField DataField="FLOOR" HeaderText="ชั้นที่" SortExpression="FLOOR" />
                        <asp:BoundField DataField="ROOM_AREA" DataFormatString="{0:#,#.00}" HeaderText="ขนาดห้อง"
                            HtmlEncode="False" SortExpression="ROOM_AREA" />
                        <asp:BoundField DataField="BUILDNAME" HeaderText="ชื่อโครงการ" SortExpression="BUILDNAME" />
                        <asp:BoundField DataField="ADDR" HeaderText="เลขที่" SortExpression="ADDR" />
                        <asp:BoundField DataField="SOI" HeaderText="ซอย" SortExpression="SOI" />
                        <asp:BoundField DataField="ROAD" HeaderText="ถนน" SortExpression="ROAD" />
                        <asp:BoundField DataField="MOO" HeaderText="หมู่ที่" SortExpression="MOO" />
                        <asp:BoundField DataField="DISTRICT" HeaderText="ตำบล/แขวง" SortExpression="DISTRICT" />
                        <asp:BoundField DataField="AMPHUR" HeaderText="อำเภอ/เขต" SortExpression="AMPHUR" />
                        <asp:BoundField DataField="PROV" HeaderText="จังหวัด" SortExpression="PROV" />
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
                    BorderWidth="1px" Caption="สิทธิการเช่า" CaptionAlign="Left" CellPadding="2"
                    DataKeyNames="COLL_ID" DataSourceID="SqldtsDic08" ForeColor="Black" GridLines="None"
                    PageSize="30" Width="100%">
                    <FooterStyle BackColor="Tan" />
                    <Columns>
                        <asp:BoundField DataField="COLL_ID" HeaderText="รหัสชิ้นทรัพย์" ReadOnly="True" SortExpression="COLL_ID" />
                        <asp:BoundField DataField="RENTALTYPE" HeaderText="ประเภทการเช่า" SortExpression="RENTALTYPE" />
                        <asp:BoundField DataField="RENTALNAME" HeaderText="กรรมสิทธิ์ของ" SortExpression="RENTALNAME" />
                        <asp:BoundField DataField="REN_CNT_NO" HeaderText="สัญญาเลขที่" SortExpression="REN_CNT_NO" />
                        <asp:BoundField DataField="CNT_DATE" DataFormatString="{0:dd/MM/yyyy}" HeaderText="วันที่สัญญา"
                            HtmlEncode="False" SortExpression="CNT_DATE" />
                        <asp:BoundField DataField="CNT_DUE" DataFormatString="{0:dd/MM/yyyy}" HeaderText="วันครบกำหนด"
                            HtmlEncode="False" SortExpression="CNT_DUE" />
                        <asp:BoundField DataField="REN_OWNER" HeaderText="ผู้ให้เช่า" SortExpression="REN_OWNER" />
                        <asp:BoundField DataField="REN_REN_BY" HeaderText="ชื่อผู้เช่า" SortExpression="REN_REN_BY" />
                        <asp:BoundField DataField="BUILDNAME" HeaderText="ชื่อโครงการ" SortExpression="BUILDNAME" />
                        <asp:BoundField DataField="REN_ADDR" HeaderText="เลขที่" SortExpression="REN_ADDR" />
                        <asp:BoundField DataField="REN_ROAD" HeaderText="ถนน" SortExpression="REN_ROAD" />
                        <asp:BoundField DataField="DISTRICT" HeaderText="ตำบล" SortExpression="DISTRICT" />
                        <asp:BoundField DataField="AMPHUR" HeaderText="อำเภอ" SortExpression="AMPHUR" />
                        <asp:BoundField DataField="PROV" HeaderText="จังหวัด" SortExpression="PROV" />
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
                    BorderWidth="1px" Caption="เครื่องจักร" CaptionAlign="Left" CellPadding="2" DataKeyNames="COLL_ID"
                    DataSourceID="SqldtsDic09" ForeColor="Black" GridLines="None" PageSize="30" Width="100%">
                    <FooterStyle BackColor="Tan" />
                    <Columns>
                        <asp:BoundField DataField="COLL_ID" HeaderText="รหัสชิ้นทรัพย์" ReadOnly="True" SortExpression="COLL_ID" />
                        <asp:BoundField DataField="FLEDTYPE" HeaderText="ประเภท" SortExpression="FLEDTYPE" />
                        <asp:BoundField DataField="MACHTYPE" HeaderText="ประเภทเครื่องจักร" SortExpression="MACHTYPE" />
                        <asp:BoundField DataField="MACHNO" HeaderText="No." SortExpression="MACHNO" />
                        <asp:BoundField DataField="BUILDNAME" HeaderText="ชื่อบริษัท" SortExpression="BUILDNAME" />
                        <asp:BoundField DataField="ADDR" HeaderText="เลขที่" SortExpression="ADDR" />
                        <asp:BoundField DataField="ROAD" HeaderText="ถนน" SortExpression="ROAD" />
                        <asp:BoundField DataField="DISTRICT" HeaderText="ตำบล" SortExpression="DISTRICT" />
                        <asp:BoundField DataField="AMPHUR" HeaderText="อำเภอ" SortExpression="AMPHUR" />
                        <asp:BoundField DataField="PROV" HeaderText="จังหวัด" SortExpression="PROV" />
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
                    BorderWidth="1px" Caption="สินค้า" CaptionAlign="Left" CellPadding="2" DataKeyNames="COLL_ID"
                    DataSourceID="SqldtsDic10" ForeColor="Black" GridLines="None" PageSize="30" Width="100%">
                    <FooterStyle BackColor="Tan" />
                    <Columns>
                        <asp:BoundField DataField="COLL_ID" HeaderText="รหัสชิ้นทรัพย์" ReadOnly="True" SortExpression="COLL_ID" />
                        <asp:BoundField DataField="GOODTYPE" HeaderText="ประเภทสินค้า" SortExpression="GOODTYPE" />
                        <asp:BoundField DataField="GOODQTY" DataFormatString="{0:#,#.00}" HeaderText="ปริมาณ"
                            SortExpression="GOODQTY">
                            <ItemStyle HorizontalAlign="Right" />
                        </asp:BoundField>
                        <asp:BoundField DataField="GOODUNIT" HeaderText="หน่วย" HtmlEncode="False" SortExpression="GOODUNIT" />
                        <asp:BoundField DataField="BUILDNAME" HeaderText="ชื่อโครงการ" SortExpression="BUILDNAME" />
                        <asp:BoundField DataField="ADDR" HeaderText="เลขที่" SortExpression="ADDR" />
                        <asp:BoundField DataField="ROAD" HeaderText="ถนน" SortExpression="ROAD" />
                        <asp:BoundField DataField="DISTRICT" HeaderText="ตำบล/แขวง" SortExpression="DISTRICT" />
                        <asp:BoundField DataField="AMPHUR" HeaderText="อำเภอ/เขต" SortExpression="AMPHUR" />
                        <asp:BoundField DataField="PROV" HeaderText="จังหวัด" SortExpression="PROV" />
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
                    BorderWidth="1px" Caption="ใบหุ้น" CaptionAlign="Left" CellPadding="2" DataKeyNames="COLL_ID"
                    DataSourceID="SqldtsDic14" ForeColor="Black" GridLines="None" PageSize="30" Width="100%">
                    <FooterStyle BackColor="Tan" />
                    <Columns>
                        <asp:BoundField DataField="COLL_ID" HeaderText="รหัสชิ้นทรัพย์" ReadOnly="True" SortExpression="COLL_ID" />
                        <asp:BoundField DataField="Shr_Type" HeaderText="ประเภทหุ้น" SortExpression="Shr_Type" />
                        <asp:BoundField DataField="NAME" HeaderText="ชื่อ" SortExpression="NAME" />
                        <asp:BoundField DataField="LISTE_FLAG" HeaderText="บ.ในตลาดหลักทรัพย์" SortExpression="LISTE_FLAG" />
                        <asp:BoundField DataField="CODE" HeaderText="ชื่อย่อ" SortExpression="CODE" />
                        <asp:BoundField DataField="REGISTER" HeaderText="เลขทะเบียน" SortExpression="REGISTER" />
                        <asp:BoundField DataField="CERT_NO" HeaderText="เลขที่ใบหุ้น" SortExpression="CERT_NO" />
                        <asp:BoundField DataField="NOSHR" HeaderText="จน.หุ้น" SortExpression="NOSHR" />
                        <asp:BoundField DataField="NOFROM" HeaderText="จาก No. " SortExpression="NOFROM" />
                        <asp:BoundField DataField="NOTO" HeaderText="ถึง No. " SortExpression="NOTO" />
                        <asp:BoundField DataField="PAR_VALUE" HeaderText="มูลค่าหุ้น" SortExpression="PAR_VALUE" />
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
                    BorderWidth="1px" Caption="เรื่อ/เครื่องบิน" CaptionAlign="Left" CellPadding="2"
                    DataKeyNames="COLL_ID" DataSourceID="SqldtsDic15" ForeColor="Black" GridLines="None"
                    PageSize="30" Width="100%">
                    <FooterStyle BackColor="Tan" />
                    <Columns>
                        <asp:BoundField DataField="COLL_ID" HeaderText="รหัสชิ้นทรัพย์" ReadOnly="True" SortExpression="COLL_ID" />
                        <asp:BoundField DataField="NAME" HeaderText="ชื่อเรือ" SortExpression="NAME" />
                        <asp:BoundField DataField="SHIP_NO" HeaderText="เลขทะเบียน" SortExpression="SHIP_NO" />
                        <asp:BoundField DataField="REGIS_PORT" HeaderText="เมืองท่าขึ้นทะเบียน" SortExpression="REGIS_PORT" />
                        <asp:BoundField DataField="WEIGHT" HeaderText="ขนาด" SortExpression="WEIGHT" />
                        <asp:BoundField DataField="POWER" HeaderText="ความจุ" SortExpression="POWER" />
                        <asp:BoundField DataField="BUILDNAME" HeaderText="ชื่อโครงการ" SortExpression="BUILDNAME" />
                        <asp:BoundField DataField="ADDR" HeaderText="เลขที่" SortExpression="ADDR" />
                        <asp:BoundField DataField="ROAD" HeaderText="ถนน" SortExpression="ROAD" />
                        <asp:BoundField DataField="DISTRICT" HeaderText="ตำบล/แขวง" SortExpression="DISTRICT" />
                        <asp:BoundField DataField="AMPHUR" HeaderText="อำเภอ/เขต" SortExpression="AMPHUR" />
                        <asp:BoundField DataField="PROV" HeaderText="จังหวัด" SortExpression="PROV" />
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
                    BorderWidth="1px" Caption="อื่นๆ" CaptionAlign="Left" CellPadding="2" DataKeyNames="COLL_ID"
                    DataSourceID="SqldtsDic99" ForeColor="Black" GridLines="None" PageSize="30" Width="100%">
                    <FooterStyle BackColor="Tan" />
                    <Columns>
                        <asp:BoundField DataField="COLL_ID" HeaderText="รหัสชิ้นทรัพย์" ReadOnly="True" SortExpression="COLL_ID" />
                        <asp:BoundField DataField="COLLNAME" HeaderText="ชื่อหลักทรัพย์" ReadOnly="True"
                            SortExpression="COLLNAME" />
                        <asp:BoundField DataField="APPSFLAG" HeaderText="การประเมินราคา" SortExpression="APPSFLAG" />
                        <asp:BoundField DataField="BUILDNAME" HeaderText="ชื่อโครงการ" SortExpression="BUILDNAME" />
                        <asp:BoundField DataField="ADDR" HeaderText="เลขที่" SortExpression="ADDR" />
                        <asp:BoundField DataField="ROAD" HeaderText="ถนน" SortExpression="ROAD" />
                        <asp:BoundField DataField="DISTRICT" HeaderText="ตำบล/แขวง" SortExpression="DISTRICT" />
                        <asp:BoundField DataField="AMPHUR" HeaderText="อำเภอ/เขต" SortExpression="AMPHUR" />
                        <asp:BoundField DataField="PROV" HeaderText="จังหวัด" SortExpression="PROV" />
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
