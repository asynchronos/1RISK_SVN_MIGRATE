Option Strict On
Option Explicit On

Imports System.Web.UI.DataVisualization.Charting
Imports System.Drawing

Namespace aspx.report
    Partial Class NPLMovementChart
        Inherits aspx.MyPageClass

        Protected Const CHART_AREA_CLASS1 As String = "ChartArea_Class1"
        Protected Const CHART_AREA_CLASS2 As String = "ChartArea_Class2"

        Protected Const CHART_AREA_PRIN1 As String = "ChartArea_Prin1"
        Protected Const CHART_AREA_PRIN2 As String = "ChartArea_Prin2"

        Protected Const SERIES_CLASS1 As String = "Series_Class1"
        Protected Const SERIES_CLASS2 As String = "Series_Class2"
        Protected Const SERIES_CLASS3 As String = "Series_Class3"
        Protected Const SERIES_CLASS4 As String = "Series_Class4"
        Protected Const SERIES_CLASS5 As String = "Series_Class5"

        Protected Const SERIES_PRIN1 As String = "Series_Prin1"
        Protected Const SERIES_PRIN2 As String = "Series_Prin2"
        Protected Const SERIES_PRIN3 As String = "Series_Prin3"
        Protected Const SERIES_PRIN4 As String = "Series_Prin4"
        Protected Const SERIES_PRIN5 As String = "Series_Prin5"


        Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
            AddHandler Chart_TotalCustomerByRegion.Click, AddressOf MSChart_Click
            ' direct using of PostBackValue 
            For Each series As Series In Chart_TotalCustomerByRegion.Series
                series.PostBackValue = "series:" + series.Name + ",#LEGENDTEXT,#VALX,~/aspx/report/NPLMovementData.aspx"
            Next

            AddHandler Chart_SumPrincipalByRegion.Click, AddressOf MSChart_Click
            ' direct using of PostBackValue 
            For Each series As Series In Chart_SumPrincipalByRegion.Series
                series.PostBackValue = "series:" + series.Name + ",#LEGENDTEXT,#VALX,~/aspx/report/NPLMovementData.aspx"
            Next
        End Sub

#Region "My Chart Sub Module"
        Protected Sub Change_ChartArea(ByVal chart As Chart, ByVal DDL_Series As DropDownList)
            If DDL_Series.SelectedValue.Equals("None") Then
                chart.Series(DDL_Series.ID.Replace("DDL_", "")).Enabled = False
            Else
                chart.Series(DDL_Series.ID.Replace("DDL_", "")).Enabled = True
                chart.Series(DDL_Series.ID.Replace("DDL_", "")).ChartArea = DDL_Series.SelectedValue
            End If
        End Sub

        'for 2 chartArea only
        Protected Sub HideNotUseChartArea(ByVal chart As Chart, ByVal chartArea1Name As String, ByVal chartArea2Name As String)
            Dim chartArea1Count As Integer = 0
            Dim chartArea2Count As Integer = 0

            For Each Series In chart.Series
                If Series.ChartArea.Equals(chartArea1Name) And Series.Enabled Then
                    chartArea1Count = chartArea1Count + 1
                ElseIf Series.ChartArea.Equals(chartArea2Name) And Series.Enabled Then
                    chartArea2Count = chartArea2Count + 1
                Else
                    'do nothing
                End If
            Next

            If chartArea1Count = 0 Then
                chart.ChartAreas(chartArea1Name).Visible = False
            Else
                chart.ChartAreas(chartArea1Name).Visible = True
            End If

            If chartArea2Count = 0 Then
                chart.ChartAreas(chartArea2Name).Visible = False
            Else
                chart.ChartAreas(chartArea2Name).Visible = True
            End If
        End Sub
#End Region


        Protected Sub Chart_ClassByRegion_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Chart_TotalCustomerByRegion.Load
            'set chartArea for each series
            Change_ChartArea(Chart_TotalCustomerByRegion, DDL_Series_Class1)
            Change_ChartArea(Chart_TotalCustomerByRegion, DDL_Series_Class2)
            Change_ChartArea(Chart_TotalCustomerByRegion, DDL_Series_Class3)
            Change_ChartArea(Chart_TotalCustomerByRegion, DDL_Series_Class4)
            Change_ChartArea(Chart_TotalCustomerByRegion, DDL_Series_Class5)

            Change_ChartArea(Chart_SumPrincipalByRegion, DDL_Series_Prin1)
            Change_ChartArea(Chart_SumPrincipalByRegion, DDL_Series_Prin2)
            Change_ChartArea(Chart_SumPrincipalByRegion, DDL_Series_Prin3)
            Change_ChartArea(Chart_SumPrincipalByRegion, DDL_Series_Prin4)
            Change_ChartArea(Chart_SumPrincipalByRegion, DDL_Series_Prin5)

            'hide not use chartArea in Chart_ClassByRegion
            HideNotUseChartArea(Chart_TotalCustomerByRegion, CHART_AREA_CLASS1, CHART_AREA_CLASS2)

            'hide not use chartArea in Chart_PrinByRegion
            HideNotUseChartArea(Chart_SumPrincipalByRegion, CHART_AREA_PRIN1, CHART_AREA_PRIN2)

            'show by group 
            If checkBox_Class_Grouped.Checked Then
                Chart_TotalCustomerByRegion.Series(SERIES_CLASS1).CustomProperties = "StackedGroupName=NPL"
                Chart_TotalCustomerByRegion.Series(SERIES_CLASS2).CustomProperties = "StackedGroupName=NPL"
                Chart_TotalCustomerByRegion.Series(SERIES_CLASS3).CustomProperties = "StackedGroupName=NPL"
                Chart_TotalCustomerByRegion.Series(SERIES_CLASS4).CustomProperties = "StackedGroupName=SM"
                Chart_TotalCustomerByRegion.Series(SERIES_CLASS5).CustomProperties = "StackedGroupName=Normal"
            Else
                For Each series In Chart_TotalCustomerByRegion.Series
                    series.DeleteCustomProperty("StackedGroupName")
                Next
            End If

            If checkBox_Prin_Grouped.Checked Then
                Chart_SumPrincipalByRegion.Series(SERIES_PRIN1).CustomProperties = "StackedGroupName=NPL"
                Chart_SumPrincipalByRegion.Series(SERIES_PRIN1).CustomProperties = "StackedGroupName=NPL"
                Chart_SumPrincipalByRegion.Series(SERIES_PRIN1).CustomProperties = "StackedGroupName=NPL"
                Chart_SumPrincipalByRegion.Series(SERIES_PRIN1).CustomProperties = "StackedGroupName=SM"
                Chart_SumPrincipalByRegion.Series(SERIES_PRIN1).CustomProperties = "StackedGroupName=Normal"
            Else
                For Each series In Chart_SumPrincipalByRegion.Series
                    series.DeleteCustomProperty("StackedGroupName")
                Next
            End If

            'show in percentage
            If checkBox_Class_Percentage.Checked Then
                For Each series In Chart_TotalCustomerByRegion.Series
                    series.ChartType = SeriesChartType.StackedColumn100
                Next
            Else
                For Each series In Chart_TotalCustomerByRegion.Series
                    series.ChartType = SeriesChartType.StackedColumn
                Next
            End If

            If checkBox_Prin_Percentage.Checked Then
                For Each series In Chart_SumPrincipalByRegion.Series
                    series.ChartType = SeriesChartType.StackedColumn100
                Next
            Else
                For Each series In Chart_SumPrincipalByRegion.Series
                    series.ChartType = SeriesChartType.StackedColumn
                Next
            End If

            'show as 2D or 3D
            If checkBox_Class_Show3D.Checked Then
                For Each area In Chart_TotalCustomerByRegion.ChartAreas
                    area.Area3DStyle.Enable3D = True
                Next
            Else
                For Each area In Chart_TotalCustomerByRegion.ChartAreas
                    area.Area3DStyle.Enable3D = False
                Next
            End If

            If checkBox_Prin_Show3D.Checked Then
                For Each area In Chart_SumPrincipalByRegion.ChartAreas
                    area.Area3DStyle.Enable3D = True
                Next
            Else
                For Each area In Chart_SumPrincipalByRegion.ChartAreas
                    area.Area3DStyle.Enable3D = False
                Next
            End If

            'change title font size
            For Each area In Chart_TotalCustomerByRegion.ChartAreas
                area.AxisX.TitleFont = New Font("Microsoft Sans Serif", 12)
                area.AxisY.TitleFont = New Font("Microsoft Sans Serif", 12)
            Next
            For Each area In Chart_SumPrincipalByRegion.ChartAreas
                area.AxisX.TitleFont = New Font("Microsoft Sans Serif", 12)
                area.AxisY.TitleFont = New Font("Microsoft Sans Serif", 12)
            Next
        End Sub

        ''' <summary> 
        ''' Handles the Click event of the Chart1 control. 
        ''' </summary> 
        ''' <param name="sender">The source of the event.</param> 
        ''' <param name="e">The <see cref="System.Web.UI.WebControls.ImageMapEventArgs"/> instance containing the event data.</param> 
        Protected Sub MSChart_Click(ByVal sender As Object, ByVal e As ImageMapEventArgs)
            Dim input As String() = e.PostBackValue.Split(":"c)
            If input.Length = 2 Then
                Dim seriesData As String() = input(1).Split(","c)
                If input(0).Equals("series") Then
                    Response.Redirect(seriesData(3) + "?regionId=" + DDL_Region_Selection.SelectedValue + "&class=" + seriesData(1) + "&ym=" + Date.Parse(seriesData(2)).ToString("yyyyMM", New Globalization.CultureInfo("th-TH")))
                Else
                    'do nothing
                End If
            End If
        End Sub


        Protected Sub DDL_Region_Selection_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles DDL_Region_Selection.Load
            If Not Me.IsPostBack And hasQueryString("regionId") Then
                DDL_Region_Selection.SelectedValue = getQueryString("regionId")
            End If
        End Sub
    End Class
End Namespace
