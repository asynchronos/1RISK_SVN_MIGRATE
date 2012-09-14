Option Strict On
Option Explicit On

Partial Class ODUtilization
    Inherits System.Web.UI.Page

    'Declare Series
    Dim debitSeries As Dundas.Charting.WebControl.Series = Nothing
    Dim creditSeries As Dundas.Charting.WebControl.Series = Nothing
    Dim limitSeries As Dundas.Charting.WebControl.Series = Nothing

    Dim utilizationSeries As Dundas.Charting.WebControl.Series = Nothing
    Dim utilizePercentSeries As Dundas.Charting.WebControl.Series = Nothing

    Dim maximumSeries As Dundas.Charting.WebControl.Series = Nothing
    Dim minimumSeries As Dundas.Charting.WebControl.Series = Nothing

    Dim dataDate As DateTime = Nothing
    Dim declareDate As DateTime = Nothing 'เนื่องจาก datetime ไม่มีทางเป็น nothing จึงต้องใช้ datetime อีกตัวมาช่วยเช็คว่ามีค่าแล้วหรือยัง

    Dim thaiCul As New System.Globalization.CultureInfo("th-TH")

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

    End Sub

    Protected Sub GridView1_Init(ByVal sender As Object, ByVal e As System.EventArgs) Handles GridView1.Init
        'Enable Y2 Axis
        utilizationChart.ChartAreas("Default").AxisY2.Enabled = Dundas.Charting.WebControl.AxisEnabled.True
        balanceChart.ChartAreas("Default").AxisY2.Enabled = Dundas.Charting.WebControl.AxisEnabled.True

        'Init Series
        debitSeries = odMovementChart.Series.Item("Debit")
        creditSeries = odMovementChart.Series.Item("Credit")
        limitSeries = odMovementChart.Series.Item("Limit")
        utilizationChart.Series.Item("Limit") = limitSeries
        utilizationSeries = utilizationChart.Series.Item("Utilization")
        utilizePercentSeries = utilizationChart.Series.Item("%Utilization")
        maximumSeries = balanceChart.Series.Item("Maximum")
        minimumSeries = balanceChart.Series.Item("Minimum")

        debitSeries.BorderWidth = 3
        creditSeries.BorderWidth = 3
        limitSeries.BorderWidth = 5
        utilizationSeries.BorderWidth = 3
        utilizePercentSeries.BorderWidth = 3
        maximumSeries.BorderWidth = 3
        minimumSeries.BorderWidth = 3

        utilizePercentSeries.YAxisType = Dundas.Charting.WebControl.AxisType.Secondary
        maximumSeries.YAxisType = Dundas.Charting.WebControl.AxisType.Secondary
        'minimumSeries.YAxisType = Dundas.Charting.WebControl.AxisType.Secondary

        'utilizationChart.ChartAreas("Default").AxisY2.Maximum = 100
    End Sub

    Protected Sub GridView1_PreRender(ByVal sender As Object, ByVal e As System.EventArgs) Handles GridView1.PreRender

        If dataDate.CompareTo(declareDate) <> 0 Then
            Dim gView As GridView = DirectCast(sender, GridView)

            For i As Integer = 1 To 12
                gView.Columns.Item(i).HeaderText = DateAdd(DateInterval.Month, i - 13, dataDate).ToString("yyyy/MM", thaiCul)
            Next
        End If

    End Sub

    Protected Sub GridView1_RowCreated(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewRowEventArgs) Handles GridView1.RowCreated
        'Add Data Series
        If e.Row.RowType = DataControlRowType.DataRow Then
            Dim dRowView As Data.DataRowView = DirectCast(e.Row.DataItem, Data.DataRowView)
            If Not IsNothing(dRowView) Then
                'เอาวันที่ของข้อมูลมาเก็บเพื่อใช้วนหาค่าเดือน
                If dataDate.CompareTo(declareDate) = 0 Then
                    dataDate = DirectCast(dRowView.Item(dRowView.DataView.Table.Columns.Count - 1), DateTime)
                End If

                If dRowView.Item("SUMMARY").Equals("DEBIT") Then
                    For i As Integer = 1 To dRowView.DataView.Table.Columns.Count - 2 '-2 เพราะฟิลด์สุดท้ายเป็นวันที่ ไม่เอามาใส่ในกราฟ
                        debitSeries.Points.AddXY(DateAdd(DateInterval.Month, i - 13, dataDate), CDbl(dRowView.Item(i)))
                    Next
                ElseIf dRowView.Item("SUMMARY").Equals("CREDIT") Then
                    For i As Integer = 1 To dRowView.DataView.Table.Columns.Count - 2
                        creditSeries.Points.AddXY(DateAdd(DateInterval.Month, i - 13, dataDate), CDbl(dRowView.Item(i)))
                    Next
                ElseIf dRowView.Item("SUMMARY").Equals("LIMIT") Then
                    For i As Integer = 1 To dRowView.DataView.Table.Columns.Count - 2
                        limitSeries.Points.AddXY(DateAdd(DateInterval.Month, i - 13, dataDate), CDbl(dRowView.Item(i)))
                    Next
                ElseIf dRowView.Item("SUMMARY").Equals("UTILIZATION") Then
                    For i As Integer = 1 To dRowView.DataView.Table.Columns.Count - 2
                        utilizationSeries.Points.AddXY(DateAdd(DateInterval.Month, i - 13, dataDate), CDbl(dRowView.Item(i)))
                    Next
                ElseIf dRowView.Item("SUMMARY").Equals("%UTILIZATION") Then
                    For i As Integer = 1 To dRowView.DataView.Table.Columns.Count - 2
                        utilizePercentSeries.Points.AddXY(DateAdd(DateInterval.Month, i - 13, dataDate), CDbl(dRowView.Item(i)))
                    Next
                ElseIf dRowView.Item("SUMMARY").Equals("MAX_BALANCE") Then
                    For i As Integer = 1 To dRowView.DataView.Table.Columns.Count - 2
                        maximumSeries.Points.AddXY(DateAdd(DateInterval.Month, i - 13, dataDate), CDbl(dRowView.Item(i)))
                    Next
                ElseIf dRowView.Item("SUMMARY").Equals("MIN_BALANCE") Then
                    For i As Integer = 1 To dRowView.DataView.Table.Columns.Count - 2
                        minimumSeries.Points.AddXY(DateAdd(DateInterval.Month, i - 13, dataDate), CDbl(dRowView.Item(i)))
                    Next
                End If
            End If
        End If

        'If e.Row.RowType = DataControlRowType.Header Then
        '    Dim dRowView As Data.DataRowView = DirectCast(e.Row.DataItem, Data.DataRowView)
        '    MsgBox(IsNothing(dRowView))
        '    If Not IsNothing(dRowView) Then
        '        'เอาวันที่ของข้อมูลมาเก็บเพื่อใช้วนหาค่าเดือน
        '        Dim dataDate As DateTime = DirectCast(dRowView.Item(dRowView.DataView.Table.Columns.Count - 1), DateTime)
        '        For i As Integer = 1 To dRowView.DataView.Table.Columns.Count - 2 '-2 เพราะฟิลด์สุดท้ายเป็นวันที่ ไม่เอามาใส่ในกราฟ
        '            'เอาวันที่มาเป็นหัว column
        '            'debitSeries.Points.AddXY(DateAdd(DateInterval.Month, 13 - i, dataDate), CDbl(dRowView.Item(i)))
        '            dRowView.DataView.Table.Columns(i).ColumnName = DateAdd(DateInterval.Month, 13 - i, dataDate).ToString("YYYY/MM")

        '            If i = 1 Then
        '                MsgBox(dRowView.DataView.Table.Columns(i).ColumnName)
        '            End If
        '        Next
        '    End If
        'End If
    End Sub

    Protected Sub GridView1_Unload(ByVal sender As Object, ByVal e As System.EventArgs) Handles GridView1.Unload
        'Clear Series Points
        debitSeries.Points.Clear()
        creditSeries.Points.Clear()
        limitSeries.Points.Clear()

        utilizationSeries.Points.Clear()
        utilizePercentSeries.Points.Clear()

        maximumSeries.Points.Clear()
        minimumSeries.Points.Clear()
    End Sub

    Protected Sub Button1_Click(ByVal sender As Object, ByVal e As System.EventArgs)
        Dim acc As String = DirectCast(DirectCast(sender, Button).Parent.FindControl("accnoTextbox"), TextBox).Text
        HiddenField1.Value = acc

        SqlDataSource1.SelectParameters.Item("accno").DefaultValue = acc
        SqlDataSource1.Select(DataSourceSelectArguments.Empty)
        GridView1.DataBind()
    End Sub
End Class
