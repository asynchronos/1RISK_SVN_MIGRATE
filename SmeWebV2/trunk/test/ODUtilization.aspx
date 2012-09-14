<%@ Page Language="VB" AutoEventWireup="false" CodeFile="ODUtilization.aspx.vb" Inherits="ODUtilization" %>

<%@ Register assembly="DundasWebChart" namespace="Dundas.Charting.WebControl" tagprefix="DCWC" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <asp:FormView ID="FormView1" runat="server" DataKeyNames="accno" 
            DataSourceID="SqlDataSource1">
            <EditItemTemplate>
                accno:
                <asp:Label ID="accnoLabel1" runat="server" Text='<%# Eval("accno") %>' />
                <br />
                cif:
                <asp:TextBox ID="cifTextBox" runat="server" Text='<%# Bind("cif") %>' />
                <br />
                custname:
                <asp:TextBox ID="custnameTextBox" runat="server" 
                    Text='<%# Bind("custname") %>' />
                <br />
                busi_type:
                <asp:TextBox ID="busi_typeTextBox" runat="server" 
                    Text='<%# Bind("busi_type") %>' />
                <br />
                busi_desc:
                <asp:TextBox ID="busi_descTextBox" runat="server" 
                    Text='<%# Bind("busi_desc") %>' />
                <br />
                bay_rate:
                <asp:TextBox ID="bay_rateTextBox" runat="server" 
                    Text='<%# Bind("bay_rate") %>' />
                <br />
                bran:
                <asp:TextBox ID="branTextBox" runat="server" Text='<%# Bind("bran") %>' />
                <br />
                od_int:
                <asp:TextBox ID="od_intTextBox" runat="server" Text='<%# Bind("od_int") %>' />
                <br />
                od_date:
                <asp:TextBox ID="od_dateTextBox" runat="server" Text='<%# Bind("od_date") %>' />
                <br />
                class_h:
                <asp:TextBox ID="class_hTextBox" runat="server" Text='<%# Bind("class_h") %>' />
                <br />
                DATA_DATE:
                <asp:TextBox ID="DATA_DATETextBox" runat="server" 
                    Text='<%# Bind("DATA_DATE") %>' />
                <br />
                <asp:LinkButton ID="UpdateButton" runat="server" CausesValidation="True" 
                    CommandName="Update" Text="Update" />
                &nbsp;<asp:LinkButton ID="UpdateCancelButton" runat="server" 
                    CausesValidation="False" CommandName="Cancel" Text="Cancel" />
            </EditItemTemplate>
            <InsertItemTemplate>
                accno:
                <asp:TextBox ID="accnoTextBox" runat="server" Text='<%# Bind("accno") %>' />
                <br />
                cif:
                <asp:TextBox ID="cifTextBox" runat="server" Text='<%# Bind("cif") %>' />
                <br />
                custname:
                <asp:TextBox ID="custnameTextBox" runat="server" 
                    Text='<%# Bind("custname") %>' />
                <br />
                busi_type:
                <asp:TextBox ID="busi_typeTextBox" runat="server" 
                    Text='<%# Bind("busi_type") %>' />
                <br />
                busi_desc:
                <asp:TextBox ID="busi_descTextBox" runat="server" 
                    Text='<%# Bind("busi_desc") %>' />
                <br />
                bay_rate:
                <asp:TextBox ID="bay_rateTextBox" runat="server" 
                    Text='<%# Bind("bay_rate") %>' />
                <br />
                bran:
                <asp:TextBox ID="branTextBox" runat="server" Text='<%# Bind("bran") %>' />
                <br />
                od_int:
                <asp:TextBox ID="od_intTextBox" runat="server" Text='<%# Bind("od_int") %>' />
                <br />
                od_date:
                <asp:TextBox ID="od_dateTextBox" runat="server" Text='<%# Bind("od_date") %>' />
                <br />
                class_h:
                <asp:TextBox ID="class_hTextBox" runat="server" Text='<%# Bind("class_h") %>' />
                <br />
                DATA_DATE:
                <asp:TextBox ID="DATA_DATETextBox" runat="server" 
                    Text='<%# Bind("DATA_DATE") %>' />
                <br />
                <asp:LinkButton ID="InsertButton" runat="server" CausesValidation="True" 
                    CommandName="Insert" Text="Insert" />
                <asp:LinkButton ID="InsertCancelButton" runat="server" 
                    CausesValidation="False" CommandName="Cancel" Text="Cancel" />
            </InsertItemTemplate>
            <ItemTemplate>
                accno:
                <asp:TextBox ID="accnoTextbox" runat="server" Text='<%# Bind("accno") %>'></asp:TextBox>
                <asp:Button ID="Button1" runat="server" Text="Button" onclick="Button1_Click" />
                <br />
                cif:
                <asp:Label ID="cifLabel" runat="server" Text='<%# Bind("cif") %>' />
                <br />
                custname:
                <asp:Label ID="custnameLabel" runat="server" Text='<%# Bind("custname") %>' />
                <br />
                busi_type:
                <asp:Label ID="busi_typeLabel" runat="server" Text='<%# Bind("busi_type") %>' />
                <br />
                busi_desc:
                <asp:Label ID="busi_descLabel" runat="server" Text='<%# Bind("busi_desc") %>' />
                <br />
                bay_rate:
                <asp:Label ID="bay_rateLabel" runat="server" Text='<%# Bind("bay_rate") %>' />
                <br />
                bran:
                <asp:Label ID="branLabel" runat="server" Text='<%# Bind("bran") %>' />
                <br />
                od_int:
                <asp:Label ID="od_intLabel" runat="server" Text='<%# Bind("od_int") %>' />
                <br />
                od_date:
                <asp:Label ID="od_dateLabel" runat="server" Text='<%# Bind("od_date") %>' />
                <br />
                class_h:
                <asp:Label ID="class_hLabel" runat="server" Text='<%# Bind("class_h") %>' />
                <br />
                DATA_DATE:
                <asp:Label ID="DATA_DATELabel" runat="server" Text='<%# Bind("DATA_DATE") %>' />
                <br />
            </ItemTemplate>
            <EmptyDataTemplate>
                accno:
                <asp:TextBox ID="accnoTextbox" runat="server" Text='<%# Bind("accno") %>'></asp:TextBox>
                <asp:Button ID="Button1" runat="server" Text="Button" onclick="Button1_Click" />
                <br />
                cif:
                <asp:Label ID="cifLabel" runat="server" Text='<%# Bind("cif") %>' />
                <br />
                custname:
                <asp:Label ID="custnameLabel" runat="server" Text='<%# Bind("custname") %>' />
                <br />
                busi_type:
                <asp:Label ID="busi_typeLabel" runat="server" Text='<%# Bind("busi_type") %>' />
                <br />
                busi_desc:
                <asp:Label ID="busi_descLabel" runat="server" Text='<%# Bind("busi_desc") %>' />
                <br />
                bay_rate:
                <asp:Label ID="bay_rateLabel" runat="server" Text='<%# Bind("bay_rate") %>' />
                <br />
                bran:
                <asp:Label ID="branLabel" runat="server" Text='<%# Bind("bran") %>' />
                <br />
                od_int:
                <asp:Label ID="od_intLabel" runat="server" Text='<%# Bind("od_int") %>' />
                <br />
                od_date:
                <asp:Label ID="od_dateLabel" runat="server" Text='<%# Bind("od_date") %>' />
                <br />
                class_h:
                <asp:Label ID="class_hLabel" runat="server" Text='<%# Bind("class_h") %>' />
                <br />
                DATA_DATE:
                <asp:Label ID="DATA_DATELabel" runat="server" Text='<%# Bind("DATA_DATE") %>' />
                <br />
            </EmptyDataTemplate>
        </asp:FormView>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
            ConnectionString="<%$ ConnectionStrings:Bay01ConnectionString %>" 
            SelectCommand="SELECT RTRIM(accno) AS accno, cif, custname, busi_type, busi_desc, bay_rate, bran, od_int, od_date, class_h, DATA_DATE FROM REP_OD WHERE (accno = @accno)">
            <SelectParameters>
                <asp:Parameter Name="accno" />
            </SelectParameters>
        </asp:SqlDataSource>
        <asp:HiddenField ID="HiddenField1" runat="server" />
        <asp:GridView ID="GridView1" runat="server" 
            CellPadding="4" DataSourceID="SqlDataSource2" ForeColor="#333333" 
            GridLines="None" AutoGenerateColumns="False">
            <RowStyle BackColor="#EFF3FB" />
            <Columns>
                <asp:BoundField DataField="SUMMARY" HeaderText="SUMMARY" ReadOnly="True" 
                    SortExpression="SUMMARY" />
                <asp:BoundField DataField="mvmdam12" DataFormatString="{0:#,##0.00}" 
                    HeaderText="mvmdam12" ReadOnly="True" SortExpression="mvmdam12">
                <ItemStyle HorizontalAlign="Right" />
                </asp:BoundField>
                <asp:BoundField DataField="mvmdam11" DataFormatString="{0:#,##0.00}" 
                    HeaderText="mvmdam11" ReadOnly="True" SortExpression="mvmdam11">
                <ItemStyle HorizontalAlign="Right" />
                </asp:BoundField>
                <asp:BoundField DataField="mvmdam10" DataFormatString="{0:#,##0.00}" 
                    HeaderText="mvmdam10" ReadOnly="True" SortExpression="mvmdam10">
                <ItemStyle HorizontalAlign="Right" />
                </asp:BoundField>
                <asp:BoundField DataField="mvmdam09" DataFormatString="{0:#,##0.00}" 
                    HeaderText="mvmdam09" ReadOnly="True" SortExpression="mvmdam09">
                <ItemStyle HorizontalAlign="Right" />
                </asp:BoundField>
                <asp:BoundField DataField="mvmdam08" DataFormatString="{0:#,##0.00}" 
                    HeaderText="mvmdam08" ReadOnly="True" SortExpression="mvmdam08">
                <ItemStyle HorizontalAlign="Right" />
                </asp:BoundField>
                <asp:BoundField DataField="mvmdam07" DataFormatString="{0:#,##0.00}" 
                    HeaderText="mvmdam07" ReadOnly="True" SortExpression="mvmdam07">
                <ItemStyle HorizontalAlign="Right" />
                </asp:BoundField>
                <asp:BoundField DataField="mvmdam06" DataFormatString="{0:#,##0.00}" 
                    HeaderText="mvmdam06" ReadOnly="True" SortExpression="mvmdam06">
                <ItemStyle HorizontalAlign="Right" />
                </asp:BoundField>
                <asp:BoundField DataField="mvmdam05" DataFormatString="{0:#,##0.00}" 
                    HeaderText="mvmdam05" ReadOnly="True" SortExpression="mvmdam05">
                <ItemStyle HorizontalAlign="Right" />
                </asp:BoundField>
                <asp:BoundField DataField="mvmdam04" DataFormatString="{0:#,##0.00}" 
                    HeaderText="mvmdam04" ReadOnly="True" SortExpression="mvmdam04">
                <ItemStyle HorizontalAlign="Right" />
                </asp:BoundField>
                <asp:BoundField DataField="mvmdam03" DataFormatString="{0:#,##0.00}" 
                    HeaderText="mvmdam03" ReadOnly="True" SortExpression="mvmdam03">
                <ItemStyle HorizontalAlign="Right" />
                </asp:BoundField>
                <asp:BoundField DataField="mvmdam02" DataFormatString="{0:#,##0.00}" 
                    HeaderText="mvmdam02" ReadOnly="True" SortExpression="mvmdam02">
                <ItemStyle HorizontalAlign="Right" />
                </asp:BoundField>
                <asp:BoundField DataField="mvmdam01" DataFormatString="{0:#,##0.00}" 
                    HeaderText="mvmdam01" ReadOnly="True" SortExpression="mvmdam01">
                <ItemStyle HorizontalAlign="Right" />
                </asp:BoundField>
                <asp:BoundField DataField="DATA_DATE" HeaderText="DATA_DATE" ReadOnly="True" 
                    SortExpression="DATA_DATE" Visible="False" />
            </Columns>
            <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
            <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
            <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
            <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
            <EditRowStyle BackColor="#2461BF" />
            <AlternatingRowStyle BackColor="White" />
        </asp:GridView>
        <asp:SqlDataSource ID="SqlDataSource2" runat="server" 
            ConnectionString="<%$ ConnectionStrings:Bay01ConnectionString %>" 
            SelectCommand="OD_SUMMARY_CHART" SelectCommandType="StoredProcedure">
            <SelectParameters>
                <asp:ControlParameter ControlID="HiddenField1" DefaultValue="" Name="accno" 
                    PropertyName="Value" />
            </SelectParameters>
        </asp:SqlDataSource>
        <DCWC:Chart ID="odMovementChart" runat="server" Palette="Pastel" Width="800px" 
            BackColor="LightSteelBlue" BorderLineColor="LightSlateGray" Height="600px">
            <Legends>
                <DCWC:Legend Alignment="Center" BackColor="Lavender" BorderColor="Gray" 
                    Docking="Top" Name="Default" ShadowOffset="2">
                </DCWC:Legend>
            </Legends>
            <Titles>
                <DCWC:Title Font="Microsoft Sans Serif, 12pt" Name="Title1" 
                    Text="การเคลื่อนไหวบัญชีกระแสรายวัน">
                </DCWC:Title>
            </Titles>
            <Series>
                <DCWC:Series BorderColor="64, 64, 64" ChartType="Line" 
                    Name="Debit" ShadowOffset="2" ShowLabelAsValue="True" 
                    XValueType="DateTime">
                    <SmartLabels Enabled="True" />
                </DCWC:Series>
                <DCWC:Series BorderColor="64, 64, 64" ChartType="Line" 
                    Name="Credit" ShadowOffset="2" ShowLabelAsValue="True" 
                    XValueType="DateTime">
                    <SmartLabels Enabled="True" />
                </DCWC:Series>
                <DCWC:Series ChartType="Line" Name="Limit" BorderColor="64, 64, 64" 
                    ShadowOffset="2">
                    <SmartLabels Enabled="True" />
                </DCWC:Series>
            </Series>
            <ChartAreas>
                <DCWC:ChartArea Name="Default" BackColor="Lavender" BorderColor="" 
                    ShadowOffset="2">
                    <AxisY IntervalAutoMode="VariableCount">
                        <MajorGrid LineColor="LightSteelBlue" LineStyle="Dash" />
                        <LabelStyle Format="#,##0" />
                        <ScaleBreakStyle Enabled="True" />
                    </AxisY>
                    <AxisX Interlaced="True" LabelsAutoFit="False">
                        <MajorGrid LineColor="LightSteelBlue" LineStyle="Dash" Interval="1" 
                            Enabled="False" IntervalType="Months" />
                        <MajorTickMark Enabled="False" Interval="1" IntervalType="Months" />
                        <LabelStyle Interval="1" IntervalType="Months" FontAngle="90" Format="Y" />
                    </AxisX>
                </DCWC:ChartArea>
            </ChartAreas>
            <BorderSkin FrameBackColor="SteelBlue" FrameBackGradientEndColor="LightBlue" />
        </DCWC:Chart>
        
        <br />
        
        <DCWC:Chart ID="utilizationChart" runat="server" BackColor="#FAFAFA" 
            BackGradientEndColor="Lavender" BorderLineColor="Silver" 
            BorderLineStyle="Solid" BorderLineWidth="2" Height="600px" Palette="Tan" 
            Width="800px">
            <Legends>
                <DCWC:Legend Alignment="Center" BackColor="237, 244, 247" 
                    BorderColor="LightSlateGray" Docking="Top" Name="Default" ShadowOffset="1">
                </DCWC:Legend>
            </Legends>
            <UI>
                <Toolbar BorderColor="LightSlateGray">
                    <BorderSkin PageColor="Transparent" SkinStyle="Emboss" />
                </Toolbar>
            </UI>
            <Titles>
                <DCWC:Title Font="Microsoft Sans Serif, 12pt" Name="Title1" 
                    Text="กราฟแสดงการใช้วงเงิน">
                </DCWC:Title>
            </Titles>
            <Series>
                <DCWC:Series BorderColor="100, 0, 0, 0" ChartType="Line" 
                    CustomAttributes="DrawingStyle=LightToDark" Name="Utilization" 
                    ShowLabelAsValue="True" LabelFormat="#,##0.00">
                    <SmartLabels Enabled="True" />
                </DCWC:Series>
                <DCWC:Series BorderColor="100, 0, 0, 0" ChartType="Line" 
                    CustomAttributes="DrawingStyle=LightToDark" Name="%Utilization" 
                    ShowLabelAsValue="True" LabelFormat="P">
                    <SmartLabels Enabled="True" />
                </DCWC:Series>
                <DCWC:Series BorderColor="100, 0, 0, 0" ChartType="Line" 
                    CustomAttributes="DrawingStyle=LightToDark" Name="Limit" 
                    ShowLabelAsValue="True" LabelFormat="#,##0.00">
                    <SmartLabels Enabled="True" />
                </DCWC:Series>
            </Series>
            <ChartAreas>
                <DCWC:ChartArea BackColor="White" BackGradientEndColor="AntiqueWhite" 
                    BackGradientType="TopBottom" BorderColor="50, 255, 255, 255" 
                    BorderStyle="Solid" BorderWidth="0" Name="Default">
                    <AxisY IntervalAutoMode="VariableCount" LineColor="220, 0, 0, 0">
                        <MajorGrid LineColor="40, 0, 0, 0" LineWidth="2" />
                        <MinorGrid LineColor="70, 0, 0, 0" />
                        <MajorTickMark LineColor="100, 0, 0, 0" />
                        <MinorTickMark LineColor="100, 0, 0, 0" Size="2" />
                        <LabelStyle FontColor="220, 0, 0, 0" Format="#,##0" />
                        <ScaleBreakStyle Enabled="True" />
                    </AxisY>
                    <AxisX Interlaced="True" LineColor="220, 0, 0, 0" LabelsAutoFit="False">
                        <MajorGrid LineColor="40, 0, 0, 0" LineWidth="2" Interval="1" Enabled="False" />
                        <MinorGrid LineColor="70, 0, 0, 0" />
                        <MajorTickMark LineColor="100, 0, 0, 0" Interval="1" Enabled="False" />
                        <MinorTickMark LineColor="100, 0, 0, 0" Size="2" />
                        <LabelStyle FontColor="220, 0, 0, 0" FontAngle="90" Interval="1" Format="Y" 
                            IntervalType="Months" />
                    </AxisX>
                    <AxisX2 LineColor="White">
                        <MajorGrid LineColor="150, 255, 255, 255" />
                        <MinorGrid LineColor="100, 255, 255, 255" />
                        <MajorTickMark LineColor="White" />
                        <MinorTickMark LineColor="White" />
                        <LabelStyle FontColor="White" />
                    </AxisX2>
                    <AxisY2 Enabled="True" LineColor="White" LabelsAutoFit="False">
                        <MajorGrid Enabled="False" LineColor="150, 255, 255, 255" />
                        <MinorGrid LineColor="100, 255, 255, 255" />
                        <MajorTickMark LineColor="White" Enabled="False" />
                        <MinorTickMark LineColor="White" />
                        <LabelStyle FontColor="White" />
                    </AxisY2>
                </DCWC:ChartArea>
            </ChartAreas>
            <BorderSkin FrameBackColor="SteelBlue" FrameBackGradientEndColor="LightBlue" 
                FrameBorderColor="100, 0, 0, 0" FrameBorderWidth="2" PageColor="Transparent" />
        </DCWC:Chart>
        
        <br />
        
        <DCWC:Chart ID="balanceChart" runat="server" BackColor="#BEDCD7" 
            BackGradientEndColor="180, 210, 210" BackGradientType="TopBottom" 
            BackHatchStyle="Vertical" BorderLineColor="LightSlateGray" 
            BorderLineStyle="Solid" Palette="ArtDeco" Height="500px" Width="800px">
            <Legends>
                <DCWC:Legend Alignment="Center" BackColor="220, 230, 240, 255" 
                    BackGradientEndColor="180, 255, 255, 255" BorderColor="LightSlateGray" 
                    BorderStyle="Dash" BorderWidth="2" Docking="Top" Name="Default">
                </DCWC:Legend>
            </Legends>
            <UI>
                <Toolbar BorderColor="LightSlateGray">
                    <BorderSkin PageColor="Transparent" SkinStyle="Raised" />
                </Toolbar>
            </UI>
            <Titles>
                <DCWC:Title Font="Microsoft Sans Serif, 12pt" Name="Title1" 
                    Text="กราฟแสดงภาระหนี้สูงสุด-ต่ำสุด">
                </DCWC:Title>
            </Titles>
            <Series>
                <DCWC:Series BackGradientEndColor="120, 190, 220" 
                    BackHatchStyle="WideUpwardDiagonal" BorderColor="50, 0, 0, 0" 
                    BorderStyle="Dash" ChartType="Line" CustomAttributes="DrawingStyle=Cylinder" 
                    Name="Maximum" ShadowColor="64, 0, 0, 0" ShadowOffset="1" 
                    ShowLabelAsValue="True">
                    <SmartLabels Enabled="True" />
                </DCWC:Series>
                <DCWC:Series BackGradientEndColor="150, 190, 230" 
                    BackHatchStyle="WideUpwardDiagonal" BorderColor="50, 0, 0, 0" 
                    BorderStyle="Dash" ChartType="Line" CustomAttributes="DrawingStyle=Cylinder" 
                    Name="Minimum" ShadowColor="64, 0, 0, 0" ShadowOffset="1" 
                    ShowLabelAsValue="True">
                    <SmartLabels Enabled="True" />
                </DCWC:Series>
            </Series>
            <ChartAreas>
                <DCWC:ChartArea BackColor="220, 230, 240, 255" 
                    BackGradientEndColor="0, 230, 240, 255" BorderColor="LightSlateGray" 
                    BorderStyle="Dash" BorderWidth="2" Name="Default">
                    <AxisY Crossing="0" IntervalAutoMode="VariableCount">
                        <MajorGrid LineColor="30, 0, 0, 0" LineStyle="Dash" LineWidth="2" />
                        <MinorGrid LineColor="10, 0, 0, 0" LineWidth="2" />
                        <MajorTickMark LineColor="150, 0, 0, 0" LineWidth="2" />
                        <MinorTickMark LineColor="75, 0, 0, 0" Size="2" />
                        <LabelStyle FontColor="180, 0, 0, 0" Format="#,##0" />
                    </AxisY>
                    <AxisX Interlaced="True" LabelsAutoFit="False">
                        <MajorGrid Interval="1" LineColor="30, 0, 0, 0" LineStyle="Dash" 
                            LineWidth="2" Enabled="False" />
                        <MinorGrid LineColor="10, 0, 0, 0" LineWidth="2" />
                        <MajorTickMark Interval="1" LineColor="150, 0, 0, 0" LineWidth="2" 
                            Enabled="False" />
                        <MinorTickMark LineColor="75, 0, 0, 0" Size="2" />
                        <LabelStyle FontAngle="90" FontColor="180, 0, 0, 0" Interval="1" Format="Y" 
                            IntervalType="Months" TruncatedLabels="True" />
                    </AxisX>
                    <Area3DStyle WallWidth="0" />
                </DCWC:ChartArea>
            </ChartAreas>
            <BorderSkin FrameBackColor="SteelBlue" FrameBackGradientEndColor="LightBlue" 
                FrameBorderColor="100, 0, 0, 0" FrameBorderWidth="2" PageColor="AliceBlue" 
                SkinStyle="Raised" />
        </DCWC:Chart>
    </div>
    
    </form>
</body>
</html>
