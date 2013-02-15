<%@ Page Title="NPL Movement Chart" Language="VB" MasterPageFile="~/MasterPage.master"
    AutoEventWireup="false" CodeFile="NPLMovementChart.aspx.vb" Inherits="aspx.report.NPLMovementChart" %>

<%--<%@ Register Assembly="System.Web.DataVisualization, Version=3.5.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35"
    Namespace="System.Web.UI.DataVisualization.Charting" TagPrefix="asp" %>--%>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <style type="text/css">
        .rowAlternative
        {
            background-color: Silver;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ScriptPlaceHolder" runat="Server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="ContentPlaceHolder2" runat="Server">
    <table>
        <tr>
            <td>
                <table>
                    <tr>
                        <td class="label">
                            Choose Region:
                        </td>
                        <td>
                            <asp:DropDownList ID="DDL_Region_Selection" runat="server" AutoPostBack="True" DataSourceID="DS_Region"
                                DataTextField="Region_Name" DataValueField="Id_Region">
                            </asp:DropDownList>
                            <asp:SqlDataSource ID="DS_Region" runat="server" ConnectionString="<%$ ConnectionStrings:BAY01ConnectionString %>"
                                SelectCommand="SELECT Id_Region, Region_Name FROM Id_Region"></asp:SqlDataSource>
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
        <tr>
            <td>
                <fieldset>
                    <legend>จำนวนลูกค้า(ราย) </legend>
                    <table>
                        <tr>
                            <td>
                                <asp:Chart ID="Chart_TotalCustomerByRegion" runat="server" DataSourceID="DS_ClassByRegion"
                                    Width="800px" Height="600px" ImageLocation='<%# "~/images/npl_pl_chart/RegionId_" + DDL_Region_Selection.SelectedValue + "_ClassH.png" %>'
                                    ImageStorageMode="UseImageLocation">
                                    <Legends>
                                        <asp:Legend Name="Legend_Class1" Font="Microsoft Sans Serif, 12pt" IsTextAutoFit="False"
                                            Alignment="Center" Docking="Top" LegendItemOrder="ReversedSeriesOrder">
                                        </asp:Legend>
                                    </Legends>
                                    <Series>
                                        <asp:Series Name="Series_Class1" ChartType="StackedColumn" Legend="Legend_Class1"
                                            LegendText="ก" XValueMember="AS_OF" XValueType="Date" YValueMembers="ก" IsValueShownAsLabel="True">
                                        </asp:Series>
                                        <asp:Series Name="Series_Class2" ChartType="StackedColumn" Legend="Legend_Class1"
                                            LegendText="ข" XValueMember="AS_OF" XValueType="Date" YValueMembers="ข" IsValueShownAsLabel="True">
                                        </asp:Series>
                                        <asp:Series Name="Series_Class3" ChartType="StackedColumn" Legend="Legend_Class1"
                                            LegendText="ค" XValueMember="AS_OF" XValueType="Date" YValueMembers="ค" IsValueShownAsLabel="True">
                                        </asp:Series>
                                        <asp:Series Name="Series_Class4" ChartType="StackedColumn" Legend="Legend_Class1"
                                            LegendText="ง" XValueMember="AS_OF" XValueType="Date" YValueMembers="ง" IsValueShownAsLabel="True">
                                        </asp:Series>
                                        <asp:Series Name="Series_Class5" ChartType="StackedColumn" Legend="Legend_Class1"
                                            LegendText="จ" XValueMember="AS_OF" XValueType="Date" YValueMembers="จ" IsValueShownAsLabel="True">
                                        </asp:Series>
                                    </Series>
                                    <ChartAreas>
                                        <asp:ChartArea Name="ChartArea_Class1" BackColor="Gainsboro" BackGradientStyle="TopBottom"
                                            BackSecondaryColor="White">
                                            <AxisX>
                                                <MajorGrid Enabled="False" />
                                                <MajorTickMark Enabled="False" />
                                                <LabelStyle Angle="90" Format="MMM yyyy" Interval="1" IntervalType="Months" Font="Microsoft Sans Serif, 9.75pt" />
                                            </AxisX>
                                            <AxisY Title="จำนวนลูกค้า(ราย)">
                                                <ScaleBreakStyle Enabled="True" />
                                            </AxisY>
                                            <Position Height="41.0784645" Width="94" X="3" Y="11.8430719" />
                                        </asp:ChartArea>
                                        <asp:ChartArea Name="ChartArea_Class2" BackColor="Gainsboro" BackGradientStyle="TopBottom"
                                            BackSecondaryColor="White" AlignWithChartArea="ChartArea_Class1">
                                            <AxisX Title="Month">
                                                <MajorGrid Enabled="False" />
                                                <MajorTickMark Enabled="False" />
                                                <LabelStyle Angle="90" Format="MMM yyyy" Interval="1" IntervalType="Months" Font="Microsoft Sans Serif, 9.75pt" />
                                            </AxisX>
                                            <AxisY Title="จำนวนลูกค้า(ราย)">
                                                <ScaleBreakStyle Enabled="True" />
                                            </AxisY>
                                            <Position Height="41.0784645" Width="94" Y="55.9215355" />
                                        </asp:ChartArea>
                                    </ChartAreas>
                                </asp:Chart>
                                <asp:SqlDataSource ID="DS_ClassByRegion" runat="server" ConnectionString="<%$ ConnectionStrings:BAY01ConnectionString %>"
                                    SelectCommand="SELECT AS_OF,[ก] ,[ข] ,[ค] ,[ง] ,[จ] FROM (SELECT [CLASS] ,CONVERT (datetime, '01/' + SUBSTRING(CONVERT (varchar, YM), 5, 2) + '/' + CONVERT (varchar, YM / 100 - 543), 103) AS AS_OF ,COUNT(Cif) AS CIFs FROM V_SM_NPL_HISTORY WHERE ID_REGION = @ID_REGION GROUP BY [CLASS], YM) AS P PIVOT( SUM(CIFs) FOR CLASS IN( [ก] ,[ข] ,[ค] ,[ง] ,[จ] ) )AS PVT"
                                    DataSourceMode="DataReader">
                                    <SelectParameters>
                                        <asp:ControlParameter ControlID="DDL_Region_Selection" DefaultValue="" Name="ID_REGION"
                                            PropertyName="SelectedValue" />
                                    </SelectParameters>
                                </asp:SqlDataSource>
                            </td>
                            <td valign="top">
                                <table style="border-style: solid">
                                    <tr>
                                        <td class="label">
                                            Show ก:
                                        </td>
                                        <td>
                                            <asp:DropDownList ID="DDL_Series_Class1" runat="server" AutoPostBack="True">
                                                <asp:ListItem Value="None">None</asp:ListItem>
                                                <asp:ListItem Value="ChartArea_Class1" Selected="True">In Chart Area 1</asp:ListItem>
                                                <asp:ListItem Value="ChartArea_Class2">In Chart Area 2</asp:ListItem>
                                            </asp:DropDownList>
                                        </td>
                                    </tr>
                                    <tr class="rowAlternative">
                                        <td class="label">
                                            Show ข:
                                        </td>
                                        <td>
                                            <asp:DropDownList ID="DDL_Series_Class2" runat="server" AutoPostBack="True">
                                                <asp:ListItem Value="None">None</asp:ListItem>
                                                <asp:ListItem Value="ChartArea_Class1" Selected="True">In Chart Area 1</asp:ListItem>
                                                <asp:ListItem Value="ChartArea_Class2">In Chart Area 2</asp:ListItem>
                                            </asp:DropDownList>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="label">
                                            Show ค:
                                        </td>
                                        <td>
                                            <asp:DropDownList ID="DDL_Series_Class3" runat="server" AutoPostBack="True">
                                                <asp:ListItem Value="None">None</asp:ListItem>
                                                <asp:ListItem Value="ChartArea_Class1" Selected="True">In Chart Area 1</asp:ListItem>
                                                <asp:ListItem Value="ChartArea_Class2">In Chart Area 2</asp:ListItem>
                                            </asp:DropDownList>
                                        </td>
                                    </tr>
                                    <tr class="rowAlternative">
                                        <td class="label">
                                            Show ง:
                                        </td>
                                        <td>
                                            <asp:DropDownList ID="DDL_Series_Class4" runat="server" AutoPostBack="True">
                                                <asp:ListItem Value="None">None</asp:ListItem>
                                                <asp:ListItem Value="ChartArea_Class1">In Chart Area 1</asp:ListItem>
                                                <asp:ListItem Value="ChartArea_Class2" Selected="True">In Chart Area 2</asp:ListItem>
                                            </asp:DropDownList>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="label">
                                            Show จ:
                                        </td>
                                        <td>
                                            <asp:DropDownList ID="DDL_Series_Class5" runat="server" AutoPostBack="True">
                                                <asp:ListItem Value="None">None</asp:ListItem>
                                                <asp:ListItem Value="ChartArea_Class1">In Chart Area 1</asp:ListItem>
                                                <asp:ListItem Value="ChartArea_Class2" Selected="True">In Chart Area 2</asp:ListItem>
                                            </asp:DropDownList>
                                        </td>
                                    </tr>
                                    <tr class="rowAlternative">
                                        <td class="label">
                                            Compare NPL,SM,Normal:
                                            <br />
                                            (Should In Same Chart Area)
                                        </td>
                                        <td>
                                            <asp:CheckBox ID="checkBox_Class_Grouped" runat="server" AutoPostBack="True" Text="">
                                            </asp:CheckBox>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="label">
                                            Calculate Percentage:
                                            <br />
                                            (For Each Chart Area)
                                        </td>
                                        <td>
                                            <asp:CheckBox ID="checkBox_Class_Percentage" runat="server" AutoPostBack="True" Text="">
                                            </asp:CheckBox>
                                        </td>
                                    </tr>
                                    <tr class="rowAlternative">
                                        <td class="label">
                                            Show as 3D:
                                        </td>
                                        <td>
                                            <asp:CheckBox ID="checkBox_Class_Show3D" runat="server" AutoPostBack="True" Text=""
                                                Checked="true"></asp:CheckBox>
                                        </td>
                                    </tr>
                                </table>
                            </td>
                        </tr>
                    </table>
                </fieldset>
            </td>
        </tr>
        <tr>
            <td>
                <fieldset>
                    <legend>จำนวนเงินต้น(ล้านบาท) </legend>
                    <table>
                        <tr>
                            <td>
                                <asp:Chart ID="Chart_SumPrincipalByRegion" runat="server" DataSourceID="DS_PrinByRegion"
                                    Width="800px" Height="600px" ImageLocation='<%# "~/images/npl_pl_chart/RegionId_" + DDL_Region_Selection.SelectedValue + "_PrinH.png" %>'
                                    ImageStorageMode="UseImageLocation">
                                    <Legends>
                                        <asp:Legend Name="Legend_Prin1" Font="Microsoft Sans Serif, 12pt" IsTextAutoFit="False"
                                            Alignment="Center" Docking="Top" LegendItemOrder="ReversedSeriesOrder">
                                        </asp:Legend>
                                    </Legends>
                                    <Series>
                                        <asp:Series Name="Series_Prin1" ChartType="StackedColumn" Legend="Legend_Prin1" LegendText="ก"
                                            XValueMember="AS_OF" XValueType="Date" YValueMembers="ก" IsValueShownAsLabel="True"
                                            LabelFormat="#,##0,," Font="Microsoft Sans Serif, 9.75pt">
                                        </asp:Series>
                                        <asp:Series Name="Series_Prin2" ChartType="StackedColumn" Legend="Legend_Prin1" LegendText="ข"
                                            XValueMember="AS_OF" XValueType="Date" YValueMembers="ข" IsValueShownAsLabel="True"
                                            LabelFormat="#,##0,," Font="Microsoft Sans Serif, 9.75pt">
                                        </asp:Series>
                                        <asp:Series Name="Series_Prin3" ChartType="StackedColumn" Legend="Legend_Prin1" LegendText="ค"
                                            XValueMember="AS_OF" XValueType="Date" YValueMembers="ค" IsValueShownAsLabel="True"
                                            LabelFormat="#,##0,," Font="Microsoft Sans Serif, 9.75pt">
                                        </asp:Series>
                                        <asp:Series Name="Series_Prin4" ChartType="StackedColumn" Legend="Legend_Prin1" LegendText="ง"
                                            XValueMember="AS_OF" XValueType="Date" YValueMembers="ง" IsValueShownAsLabel="True"
                                            LabelFormat="#,##0,," Font="Microsoft Sans Serif, 9.75pt">
                                        </asp:Series>
                                        <asp:Series Name="Series_Prin5" ChartType="StackedColumn" Legend="Legend_Prin1" LegendText="จ"
                                            XValueMember="AS_OF" XValueType="Date" YValueMembers="จ" IsValueShownAsLabel="True"
                                            LabelFormat="#,##0,," Font="Microsoft Sans Serif, 9.75pt">
                                        </asp:Series>
                                    </Series>
                                    <ChartAreas>
                                        <asp:ChartArea Name="ChartArea_Prin1" BackColor="Gainsboro" BackGradientStyle="TopBottom"
                                            BackSecondaryColor="White">
                                            <AxisX>
                                                <MajorGrid Enabled="False" />
                                                <MajorTickMark Enabled="False" />
                                                <LabelStyle Angle="90" Format="MMM yyyy" Interval="1" IntervalType="Months" Font="Microsoft Sans Serif, 9.75pt" />
                                            </AxisX>
                                            <AxisY Title="จำนวนเงินต้น(ล้านบาท)" IsLabelAutoFit="False">
                                                <LabelStyle Format="#,##0,," Font="Microsoft Sans Serif, 12pt" />
                                                <ScaleBreakStyle Enabled="True" />
                                            </AxisY>
                                        </asp:ChartArea>
                                        <asp:ChartArea Name="ChartArea_Prin2" BackColor="Gainsboro" BackGradientStyle="TopBottom"
                                            BackSecondaryColor="White" AlignWithChartArea="ChartArea_Prin1">
                                            <AxisX Title="Month">
                                                <MajorGrid Enabled="False" />
                                                <MajorTickMark Enabled="False" />
                                                <LabelStyle Angle="90" Format="MMM yyyy" Interval="1" IntervalType="Months" Font="Microsoft Sans Serif, 9.75pt" />
                                            </AxisX>
                                            <AxisY Title="จำนวนเงินต้น(ล้านบาท)">
                                                <LabelStyle Format="#,##0,," />
                                                <ScaleBreakStyle Enabled="True" />
                                            </AxisY>
                                        </asp:ChartArea>
                                    </ChartAreas>
                                </asp:Chart>
                                <asp:SqlDataSource ID="DS_PrinByRegion" runat="server" ConnectionString="<%$ ConnectionStrings:BAY01ConnectionString %>"
                                    SelectCommand="SELECT AS_OF,[ก] ,[ข] ,[ค] ,[ง] ,[จ] FROM (SELECT [CLASS] ,CONVERT (datetime, '01/' + SUBSTRING(CONVERT (varchar, YM), 5, 2) + '/' + CONVERT (varchar, YM / 100 - 543), 103) AS AS_OF ,SUM(Principal) AS Principals FROM V_SM_NPL_HISTORY WHERE ID_REGION = @ID_REGION GROUP BY [CLASS], YM) AS P PIVOT( SUM(Principals) FOR [CLASS] IN( [ก] ,[ข] ,[ค] ,[ง] ,[จ] ) )AS PVT"
                                    DataSourceMode="DataReader">
                                    <SelectParameters>
                                        <asp:ControlParameter ControlID="DDL_Region_Selection" DefaultValue="" Name="ID_REGION"
                                            PropertyName="SelectedValue" />
                                    </SelectParameters>
                                </asp:SqlDataSource>
                            </td>
                            <td valign="top">
                                <table style="border-style: solid">
                                    <tr>
                                        <td class="label">
                                            Show ก:
                                        </td>
                                        <td>
                                            <asp:DropDownList ID="DDL_Series_Prin1" runat="server" AutoPostBack="True">
                                                <asp:ListItem Value="None">None</asp:ListItem>
                                                <asp:ListItem Value="ChartArea_Prin1" Selected="True">In Chart Area 1</asp:ListItem>
                                                <asp:ListItem Value="ChartArea_Prin2">In Chart Area 2</asp:ListItem>
                                            </asp:DropDownList>
                                        </td>
                                    </tr>
                                    <tr class="rowAlternative">
                                        <td class="label">
                                            Show ข:
                                        </td>
                                        <td>
                                            <asp:DropDownList ID="DDL_Series_Prin2" runat="server" AutoPostBack="True">
                                                <asp:ListItem Value="None">None</asp:ListItem>
                                                <asp:ListItem Value="ChartArea_Prin1" Selected="True">In Chart Area 1</asp:ListItem>
                                                <asp:ListItem Value="ChartArea_Prin2">In Chart Area 2</asp:ListItem>
                                            </asp:DropDownList>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="label">
                                            Show ค:
                                        </td>
                                        <td>
                                            <asp:DropDownList ID="DDL_Series_Prin3" runat="server" AutoPostBack="True">
                                                <asp:ListItem Value="None">None</asp:ListItem>
                                                <asp:ListItem Value="ChartArea_Prin1" Selected="True">In Chart Area 1</asp:ListItem>
                                                <asp:ListItem Value="ChartArea_Prin2">In Chart Area 2</asp:ListItem>
                                            </asp:DropDownList>
                                        </td>
                                    </tr>
                                    <tr class="rowAlternative">
                                        <td class="label">
                                            Show ง:
                                        </td>
                                        <td>
                                            <asp:DropDownList ID="DDL_Series_Prin4" runat="server" AutoPostBack="True">
                                                <asp:ListItem Value="None">None</asp:ListItem>
                                                <asp:ListItem Value="ChartArea_Prin1">In Chart Area 1</asp:ListItem>
                                                <asp:ListItem Value="ChartArea_Prin2" Selected="True">In Chart Area 2</asp:ListItem>
                                            </asp:DropDownList>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="label">
                                            Show จ:
                                        </td>
                                        <td>
                                            <asp:DropDownList ID="DDL_Series_Prin5" runat="server" AutoPostBack="True">
                                                <asp:ListItem Value="None">None</asp:ListItem>
                                                <asp:ListItem Value="ChartArea_Prin1">In Chart Area 1</asp:ListItem>
                                                <asp:ListItem Value="ChartArea_Prin2" Selected="True">In Chart Area 2</asp:ListItem>
                                            </asp:DropDownList>
                                        </td>
                                    </tr>
                                    <tr class="rowAlternative">
                                        <td class="label">
                                            Compare NPL,SM,Normal:
                                            <br />
                                            (Should In Same Chart Area)
                                        </td>
                                        <td>
                                            <asp:CheckBox ID="checkBox_Prin_Grouped" runat="server" AutoPostBack="True" Text="">
                                            </asp:CheckBox>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="label">
                                            Calculate Percentage:
                                            <br />
                                            (For Each Chart Area)
                                        </td>
                                        <td>
                                            <asp:CheckBox ID="checkBox_Prin_Percentage" runat="server" AutoPostBack="True" Text="">
                                            </asp:CheckBox>
                                        </td>
                                    </tr>
                                    <tr class="rowAlternative">
                                        <td class="label">
                                            Show as 3D:
                                        </td>
                                        <td>
                                            <asp:CheckBox ID="checkBox_Prin_Show3D" runat="server" AutoPostBack="True" Text=""
                                                Checked="true"></asp:CheckBox>
                                        </td>
                                    </tr>
                                </table>
                            </td>
                        </tr>
                    </table>
                </fieldset>
            </td>
        </tr>
    </table>
</asp:Content>