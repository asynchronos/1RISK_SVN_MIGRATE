Imports System.Globalization
Imports System.Web.UI.DataVisualization.Charting

Partial Class aspx_report_ODUtilization24
    Inherits System.Web.UI.Page

    'Declare Series
    Dim limitSeriesPrevious1Year As Series = Nothing
    Dim withdrawSeriesPrevious1Year As Series = Nothing
    Dim depositSeriesPrevious1Year As Series = Nothing
    Dim utilizeLimitSeriesPrevious1Year As Series = Nothing
    Dim utilizationSeriesPrevious1Year As Series = Nothing
    Dim percentUtilizationSeriesPrevious1Year As Series = Nothing
    Dim balLimitSeriesPrevious1Year As Series = Nothing
    Dim maxBalanceSeriesPrevious1Year As Series = Nothing
    Dim minBalanceSeriesPrevious1Year As Series = Nothing

    Dim limitSeriesPast2Years As Series = Nothing
    Dim withdrawSeriesPast2Years As Series = Nothing
    Dim depositSeriesPast2Years As Series = Nothing
    Dim utilizeLimitSeriesPast2Years As Series = Nothing
    Dim utilizationSeriesPast2Years As Series = Nothing
    Dim percentUtilizationSeriesPast2Years As Series = Nothing
    Dim balLimitSeriesPast2Years As Series = Nothing
    Dim maxBalanceSeriesPast2Years As Series = Nothing
    Dim minBalanceSeriesPast2Years As Series = Nothing


    'Other Declare
    'Dim dataDate As DateTime = Nothing
    Dim currentCulture As CultureInfo = Nothing
    Dim maxLimitPrevious1Year As Double = 0.0
    Dim maxLimitPast2Years As Double = 0.0

    Dim monthDisplay As Integer = 12

#Region "My Method"
    ''' <summary>
    ''' ไว้เช็คว่าวันที่ที่ส่งมามีการ assign ค่าหรือยัง
    ''' </summary>
    ''' <param name="d">datetime ที่ต้องการเช็ค</param>
    ''' <returns>boolean</returns>
    ''' <remarks>return true ถ้าวันที่ที่ส่งมามีการ assign ค่าแล้ว</remarks>
    Private Function isDateAssigned(ByVal d As DateTime) As Boolean
        Dim result As Boolean = True

        'เนื่องจาก datetime ไม่มีทางเป็น nothing จึงต้องใช้ datetime อีกตัวมาช่วยเช็คว่ามีค่าแล้วหรือยัง
        Dim declareDate As DateTime = Nothing

        If d.CompareTo(declareDate) = 0 Then
            result = False
        End If

        Return result
    End Function

#End Region '"My Method"

#Region "Event"
    Protected Sub cifTextBoxEmpty_PreRender(ByVal sender As Object, ByVal e As System.EventArgs)
        DirectCast(sender, TextBox).Text = cifHiddenField.Value
    End Sub

    Protected Sub searchCifButton_Click(ByVal sender As Object, ByVal e As System.EventArgs)
        Dim cif As String = DirectCast(DirectCast(sender, Button).Parent.FindControl("cifTextBox"), TextBox).Text
        cifHiddenField.Value = cif

        SummaryFormViewDS.SelectParameters.Item("cif").DefaultValue = cif
        SummaryFormViewDS.Select(DataSourceSelectArguments.Empty)
    End Sub

    Protected Sub nameLabel_PreRender(ByVal sender As Object, ByVal e As System.EventArgs)
        cusNameHiddenField.Value = DirectCast(sender, Label).Text
    End Sub

    'Protected Sub accnoList_DataBound(ByVal sender As Object, ByVal e As System.EventArgs)
    '    Dim accnoList As DropDownList = DirectCast(sender, DropDownList)
    'End Sub

    Protected Sub accnoList_PreRender(ByVal sender As Object, ByVal e As System.EventArgs)
        Dim accnoList As DropDownList = DirectCast(sender, DropDownList)

        For i As Integer = 0 To accnoList.Items.Count - 1
            Dim temp As Double = Nothing

            Try
                temp = CDbl(accnoList.Items(i).Value)
            Catch ex As Exception
                temp = 0
            End Try

            accnoList.Items(i).Text = temp.ToString("000-0-00000-0")
        Next

        Dim accno As String = accnoList.SelectedValue
        accnoHiddenField.Value = accno

        odSummaryGridView.DataBind()
        odSummaryGridView13.DataBind()
        chequeGridView.DataBind()
        chequeGridView13.DataBind()
        riskTableGridView.DataBind()
        riskTableGridView13.DataBind()
    End Sub

    Protected Sub CreditOdSummaryGridView_PreRender(ByVal sender As Object, ByVal e As System.EventArgs)
        Dim gv As GridView = DirectCast(sender, GridView)

        Dim limitSumInGrid As Double = 0
        Dim prinSumInGrid As Double = 0

        Dim limitTemp As Double = Nothing
        Dim prinTemp As Double = Nothing

        For i As Integer = 0 To gv.Rows.Count - 1
            If gv.Rows(i).RowType = DataControlRowType.DataRow Then
                Try
                    limitTemp = CDbl(DirectCast(gv.Rows(i).FindControl("LIMITLabel"), Label).Text)
                Catch ex As Exception
                    limitTemp = 0
                End Try

                Try
                    prinTemp = CDbl(DirectCast(gv.Rows(i).FindControl("PRINLabel"), Label).Text)
                Catch ex As Exception
                    prinTemp = 0
                End Try

                limitSumInGrid += limitTemp
                prinSumInGrid += prinTemp
            End If
        Next

        DirectCast(gv.FooterRow.FindControl("LIMITLabel"), Label).Text = limitSumInGrid.ToString("#,##0.00")
        DirectCast(gv.FooterRow.FindControl("PRINLabel"), Label).Text = prinSumInGrid.ToString("#,##0.00")

    End Sub

#End Region

    Protected Sub Page_Init(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Init
        Try
            'currentCulture = DirectCast(Application.Get(ApplicationKeyConst.App_Culture), CultureInfo)
            currentCulture = New CultureInfo("en-US")
            'ใช้แต่ eng
        Catch ex As Exception
            'currentCulture = New CultureInfo("th-TH")
            currentCulture = New CultureInfo("en-US")
        End Try
    End Sub

    Protected Sub riskTableGridView_RowCreated(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewRowEventArgs) Handles riskTableGridView.RowCreated, riskTableGridView13.RowCreated
        Select Case e.Row.RowType
            Case DataControlRowType.Header
                Dim grid As GridView = DirectCast(sender, GridView)

                Dim dupHeaderRow As New GridViewRow(0, 0, DataControlRowType.Header, DataControlRowState.Insert)

                Dim oTableCell As TableCell = Nothing

                For i As Integer = 0 To 6
                    oTableCell = New TableCell()
                    oTableCell.Text = e.Row.Cells(0).Text
                    oTableCell.RowSpan = 2
                    dupHeaderRow.Cells.Add(oTableCell)

                    e.Row.Cells.RemoveAt(0)
                Next

                oTableCell = New TableCell()
                oTableCell.Text = "Return Cheque"
                oTableCell.ColumnSpan = 2
                dupHeaderRow.Cells.Add(oTableCell)

                grid.Controls(0).Controls.Add(dupHeaderRow)

            Case Else
                'do nothing
        End Select
    End Sub

    Protected Sub SummaryGridView_Init(ByVal sender As Object, ByVal e As System.EventArgs) Handles odSummaryGridView.Init, odSummaryGridView13.Init
        'Init Series
        Dim grid As GridView = DirectCast(sender, GridView)

        If grid.ID.Equals("odSummaryGridView") Then
            limitSeriesPrevious1Year = ChartPrevious1Year.Series.Item("LimitSeriesPrevious1Year")
            withdrawSeriesPrevious1Year = ChartPrevious1Year.Series.Item("WithdrawSeriesPrevious1Year")
            depositSeriesPrevious1Year = ChartPrevious1Year.Series.Item("DepositSeriesPrevious1Year")

            utilizeLimitSeriesPrevious1Year = ChartPrevious1Year.Series.Item("UtilizeLimitSeriesPrevious1Year")
            utilizationSeriesPrevious1Year = ChartPrevious1Year.Series.Item("UtilizationSeriesPrevious1Year")
            percentUtilizationSeriesPrevious1Year = ChartPrevious1Year.Series.Item("PercentUtilizationSeriesPrevious1Year")

            balLimitSeriesPrevious1Year = ChartPrevious1Year.Series.Item("BalLimitSeriesPrevious1Year")
            maxBalanceSeriesPrevious1Year = ChartPrevious1Year.Series.Item("MaxBalanceSeriesPrevious1Year")
            minBalanceSeriesPrevious1Year = ChartPrevious1Year.Series.Item("MinBalanceSeriesPrevious1Year")
        ElseIf grid.ID.Equals("odSummaryGridView13") Then
            limitSeriesPast2Years = ChartPast2Years.Series.Item("LimitSeriesPast2Years")
            withdrawSeriesPast2Years = ChartPast2Years.Series.Item("WithdrawSeriesPast2Years")
            depositSeriesPast2Years = ChartPast2Years.Series.Item("DepositSeriesPast2Years")

            utilizeLimitSeriesPast2Years = ChartPast2Years.Series.Item("UtilizeLimitSeriesPast2Years")
            utilizationSeriesPast2Years = ChartPast2Years.Series.Item("UtilizationSeriesPast2Years")
            percentUtilizationSeriesPast2Years = ChartPast2Years.Series.Item("PercentUtilizationSeriesPast2Years")

            balLimitSeriesPast2Years = ChartPast2Years.Series.Item("BalLimitSeriesPast2Years")
            maxBalanceSeriesPast2Years = ChartPast2Years.Series.Item("MaxBalanceSeriesPast2Years")
            minBalanceSeriesPast2Years = ChartPast2Years.Series.Item("MinBalanceSeriesPast2Years")
        End If

    End Sub

    Protected Sub SummaryGridView_RowCreated(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewRowEventArgs) Handles odSummaryGridView.RowCreated, odSummaryGridView13.RowCreated
        Dim grid As GridView = DirectCast(sender, GridView)
        Dim dRowView As Data.DataRowView = DirectCast(e.Row.DataItem, Data.DataRowView)
        Dim dataDate As DateTime = Nothing

        'Try
        '    dataDate = DirectCast(dRowView.Item("run_date"), DateTime)
        'Catch ex As NullReferenceException
        '    'do nothing
        'End Try

        If Not IsNothing(dRowView) Then
            'เอาวันที่ของข้อมูลมาเก็บเพื่อใช้วนหาค่าเดือนของแต่ละฟิลด์
            dataDate = DirectCast(dRowView.Item("run_date"), DateTime)
        End If

        Select Case e.Row.RowType

            Case DataControlRowType.DataRow
                If Not IsNothing(dRowView) Then
                    'เอา Data จาก Grid ไปใส่กราฟ
                    If dRowView.Item("SUMMARY").Equals("DEBIT") Then
                        'เปลี่ยนค่ารายการใน grid
                        dRowView.Item(0) = "Withdraw"

                        For i As Integer = 1 To monthDisplay
                            Dim xValue As String = DateAdd(DateInterval.Month, i - 13, dataDate).ToString("MMM yy", currentCulture)
                            Dim yValue As Double = CDbl(dRowView.Item(i))

                            If grid.ID.Equals("odSummaryGridView") Then
                                withdrawSeriesPrevious1Year.Points.AddXY(xValue, yValue)
                            ElseIf grid.ID.Equals("odSummaryGridView13") Then
                                withdrawSeriesPast2Years.Points.AddXY(xValue, yValue)
                            End If

                            'debitSeries.Points.AddXY(xValue,yValue)
                        Next
                    ElseIf dRowView.Item("SUMMARY").Equals("CREDIT") Then
                        dRowView.Item(0) = "Deposit"

                        For i As Integer = 1 To monthDisplay
                            Dim xValue As String = DateAdd(DateInterval.Month, i - 13, dataDate).ToString("MMM yy", currentCulture)
                            Dim yValue As Double = CDbl(dRowView.Item(i))

                            If grid.ID.Equals("odSummaryGridView") Then
                                depositSeriesPrevious1Year.Points.AddXY(xValue, yValue)
                            ElseIf grid.ID.Equals("odSummaryGridView13") Then
                                depositSeriesPast2Years.Points.AddXY(xValue, yValue)
                            End If
                            'creditSeries.Points.AddXY(xValue,yValue)
                        Next
                    ElseIf dRowView.Item("SUMMARY").Equals("LIMIT") Then
                        For i As Integer = 1 To monthDisplay
                            Dim xValue As String = DateAdd(DateInterval.Month, i - 13, dataDate).ToString("MMM yy", currentCulture)
                            Dim yValue As Double = CDbl(dRowView.Item(i))

                            If grid.ID.Equals("odSummaryGridView") Then
                                'find max limit
                                If (maxLimitPrevious1Year < yValue) Then
                                    maxLimitPrevious1Year = yValue
                                End If

                                limitSeriesPrevious1Year.Points.AddXY(xValue, yValue)
                                utilizeLimitSeriesPrevious1Year.Points.AddXY(xValue, yValue)
                                balLimitSeriesPrevious1Year.Points.AddXY(xValue, yValue)
                            ElseIf grid.ID.Equals("odSummaryGridView13") Then
                                'find max limit
                                If (maxLimitPast2Years < yValue) Then
                                    maxLimitPast2Years = yValue
                                End If

                                limitSeriesPast2Years.Points.AddXY(xValue, yValue)
                                utilizeLimitSeriesPast2Years.Points.AddXY(xValue, yValue)
                                balLimitSeriesPast2Years.Points.AddXY(xValue, yValue)
                            End If
                            'limitSeries.Points.AddXY(xValue,yValue)
                            'limitSeries2.Points.AddXY(xValue,yValue)
                            'limitSeries3.Points.AddXY(xValue,yValue)
                        Next
                    ElseIf dRowView.Item("SUMMARY").Equals("UTILIZATION") Then
                        For i As Integer = 1 To monthDisplay
                            Dim xValue As String = DateAdd(DateInterval.Month, i - 13, dataDate).ToString("MMM yy", currentCulture)
                            Dim yValue As Double = CDbl(dRowView.Item(i))

                            If grid.ID.Equals("odSummaryGridView") Then
                                utilizationSeriesPrevious1Year.Points.AddXY(xValue, yValue)
                            ElseIf grid.ID.Equals("odSummaryGridView13") Then
                                utilizationSeriesPast2Years.Points.AddXY(xValue, yValue)
                            End If
                            'utilizationSeries.Points.AddXY(xValue,yValue)
                        Next
                    ElseIf dRowView.Item("SUMMARY").Equals("%UTILIZATION") Then
                        For i As Integer = 1 To monthDisplay
                            Dim xValue As String = DateAdd(DateInterval.Month, i - 13, dataDate).ToString("MMM yy", currentCulture)
                            Dim yValue As Double = CDbl(dRowView.Item(i))

                            If grid.ID.Equals("odSummaryGridView") Then
                                percentUtilizationSeriesPrevious1Year.Points.AddXY(xValue, yValue / 100)
                            ElseIf grid.ID.Equals("odSummaryGridView13") Then
                                percentUtilizationSeriesPast2Years.Points.AddXY(xValue, yValue / 100)
                            End If
                            'utilizePercentSeries.Points.AddXY(xValue,yValue)
                        Next
                    ElseIf dRowView.Item("SUMMARY").Equals("MAX_BALANCE") Then
                        dRowView.Item(0) = "Minimum Debt Bal"

                        'คูณ -1 กลับ max เป็น min
                        For i As Integer = 1 To monthDisplay + 1
                            dRowView.Item(i) = (-1) * CDbl(dRowView.Item(i))

                            Dim xValue As String = DateAdd(DateInterval.Month, i - 13, dataDate).ToString("MMM yy", currentCulture)
                            Dim yValue As Double = CDbl(dRowView.Item(i))

                            'ฟิลด์สุดท้ายเป็นค่าเฉลี่ยซึ่งไม่ต้องเอาไปแสดงในกราฟ
                            If i < monthDisplay + 1 Then
                                If grid.ID.Equals("odSummaryGridView") Then
                                    minBalanceSeriesPrevious1Year.Points.AddXY(xValue, yValue)
                                ElseIf grid.ID.Equals("odSummaryGridView13") Then
                                    minBalanceSeriesPast2Years.Points.AddXY(xValue, yValue)
                                End If
                                'minimumSeries.Points.AddXY(xValue, yValue)
                            End If
                        Next
                    ElseIf dRowView.Item("SUMMARY").Equals("MIN_BALANCE") Then
                        dRowView.Item(0) = "Maximum Debt Bal"

                        'คูณ -1 กลับ min เป็น max
                        For i As Integer = 1 To monthDisplay + 1
                            dRowView.Item(i) = (-1) * CDbl(dRowView.Item(i))

                            Dim xValue As String = DateAdd(DateInterval.Month, i - 13, dataDate).ToString("MMM yy", currentCulture)
                            Dim yValue As Double = CDbl(dRowView.Item(i))

                            'ฟิลด์สุดท้ายเป็นค่าเฉลี่ยซึ่งไม่ต้องเอาไปแสดงในกราฟ
                            If i < monthDisplay + 1 Then
                                If grid.ID.Equals("odSummaryGridView") Then
                                    maxBalanceSeriesPrevious1Year.Points.AddXY(xValue, yValue)
                                ElseIf grid.ID.Equals("odSummaryGridView13") Then
                                    maxBalanceSeriesPast2Years.Points.AddXY(xValue, yValue)
                                End If
                                'maximumSeries.Points.AddXY(xValue, yValue)
                            End If
                        Next
                    End If
                End If 'End If Not IsNothing(dRowView) Then
                'End Case DataControlRowType.DataRow
            Case DataControlRowType.Header

                Dim dupHeaderRow As New GridViewRow(0, 0, DataControlRowType.Header, DataControlRowState.Insert)

                Dim oTableCell As TableCell = Nothing

                oTableCell = New TableCell()
                oTableCell.Text = Resources.OdUtilization.odSummaryGridView_Header1
                oTableCell.RowSpan = 2
                dupHeaderRow.Cells.Add(oTableCell)

                oTableCell = New TableCell()
                If grid.ID.Equals("odSummaryGridView") Then
                    oTableCell.Text = Resources.OdUtilization.odSummaryGridView_Header2 + "(" + Resources.OdUtilization.odSummaryGridView_Unit + ")"
                ElseIf grid.ID.Equals("odSummaryGridView13") Then
                    oTableCell.Text = Resources.OdUtilization.odSummaryGridView13_Header2 + "(" + Resources.OdUtilization.odSummaryGridView_Unit + ")"
                End If

                oTableCell.ColumnSpan = 13
                dupHeaderRow.Cells.Add(oTableCell)

                grid.Controls(0).Controls.Add(dupHeaderRow)

                'remove Header Cell แรก(Cell Summary)
                e.Row.Cells.RemoveAt(0)

            Case Else
                'do nothing
        End Select

    End Sub

    Protected Sub SummaryGridView_PreRender(ByVal sender As Object, ByVal e As System.EventArgs) Handles odSummaryGridView.PreRender, odSummaryGridView13.PreRender
        Dim grid As GridView = DirectCast(sender, GridView)
        Dim dataDate As DateTime = Nothing

        If grid.Rows.Count > 0 Then
            dataDate = DateTime.ParseExact(DirectCast(grid.Rows(0).Cells(14).FindControl("LabelRunDate"), Label).Text, "dd/MM/yyyy", currentCulture)

            Dim headerRow As GridViewRow = grid.HeaderRow
            For i As Integer = 1 To monthDisplay
                'เอาวันที่มาเป็นหัว column
                headerRow.Cells(i - 1).Text = DateAdd(DateInterval.Month, i - 13, dataDate).ToString("MMM yy", currentCulture)
            Next
        End If

        'เพิ่ม % ต่อท้ายใน row ที่เป็น %UTILIZATION
        For i As Integer = 1 To monthDisplay + 1
            Dim percent As Integer = Nothing

            Try
                percent = CInt(grid.Rows(4).Cells(i).Text)
            Catch ex As Exception
                percent = 0
            End Try

            If percent > 0 Then
                grid.Rows(4).Cells(i).Text += "%"
            End If
        Next
    End Sub

    Protected Sub DepositAndWithDrawChart_PostPaint(ByVal sender As Object, ByVal e As System.Web.UI.DataVisualization.Charting.ChartPaintEventArgs) Handles ChartPrevious1Year.PostPaint
        'add watermark
    End Sub

    Protected Sub SummaryGridView_Unload(ByVal sender As Object, ByVal e As System.EventArgs) Handles odSummaryGridView13.Unload, odSummaryGridView.Unload
        Dim grid As GridView = DirectCast(sender, GridView)

        If grid.ID.Equals("odSummaryGridView") Then
            limitSeriesPrevious1Year.Points.Clear()
            withdrawSeriesPrevious1Year.Points.Clear()
            depositSeriesPrevious1Year.Points.Clear()
            utilizeLimitSeriesPrevious1Year.Points.Clear()
            utilizeLimitSeriesPrevious1Year.Points.Clear()
            percentUtilizationSeriesPrevious1Year.Points.Clear()
            balLimitSeriesPrevious1Year.Points.Clear()
            maxBalanceSeriesPrevious1Year.Points.Clear()
            minBalanceSeriesPrevious1Year.Points.Clear()
        ElseIf grid.ID.Equals("odSummaryGridView13") Then
            limitSeriesPast2Years.Points.Clear()
            withdrawSeriesPast2Years.Points.Clear()
            depositSeriesPast2Years.Points.Clear()
            utilizeLimitSeriesPast2Years.Points.Clear()
            utilizeLimitSeriesPast2Years.Points.Clear()
            percentUtilizationSeriesPast2Years.Points.Clear()
            balLimitSeriesPast2Years.Points.Clear()
            maxBalanceSeriesPast2Years.Points.Clear()
            minBalanceSeriesPast2Years.Points.Clear()
        End If

    End Sub

    Protected Sub ChartPrevious1Year_PreRender(ByVal sender As Object, ByVal e As System.EventArgs) Handles ChartPrevious1Year.PreRender
        Dim _chart As Chart = DirectCast(sender, Chart)

        Dim accno As Double = Nothing

        Try
            accno = CDbl(accnoHiddenField.Value)
        Catch ex As Exception
            accno = 0
        End Try

        _chart.Titles.Item("MovementTitle").Text = "CIF:" + cifHiddenField.Value + " " + cusNameHiddenField.Value + " ACCNO:" + accno.ToString("000-0-00000-0") + vbCrLf + _chart.Titles.Item("MovementTitle").Text

        _chart.ChartAreas("UtilizationPrevious1Year").AxisY.Maximum = maxLimitPrevious1Year * 1.2
        _chart.ChartAreas("UtilizationPrevious1Year").AxisY.Interval = maxLimitPrevious1Year * 0.1
    End Sub

    Protected Sub ChartPast2Years_PreRender(ByVal sender As Object, ByVal e As System.EventArgs) Handles ChartPast2Years.PreRender
        Dim _chart As Chart = DirectCast(sender, Chart)

        Dim accno As Double = Nothing

        Try
            accno = CDbl(accnoHiddenField.Value)
        Catch ex As Exception
            accno = 0
        End Try

        _chart.Titles.Item("MovementTitle").Text = "CIF:" + cifHiddenField.Value + " " + cusNameHiddenField.Value + " ACCNO:" + accno.ToString("000-0-00000-0") + vbCrLf + _chart.Titles.Item("MovementTitle").Text

        _chart.ChartAreas("UtilizationPast2Years").AxisY.Maximum = maxLimitPast2Years * 1.2
        _chart.ChartAreas("UtilizationPast2Years").AxisY.Interval = maxLimitPast2Years * 0.1

    End Sub

    Protected Sub chequeGridView_RowCreated(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewRowEventArgs) Handles chequeGridView.RowCreated
        Select Case e.Row.RowType
            Case DataControlRowType.Header
                Dim grid As GridView = DirectCast(sender, GridView)

                Dim dupHeaderRow As New GridViewRow(0, 0, DataControlRowType.Header, DataControlRowState.Insert)

                Dim oTableCell As TableCell = Nothing

                oTableCell = New TableCell()
                oTableCell.Text = e.Row.Cells(0).Text
                oTableCell.RowSpan = 2
                dupHeaderRow.Cells.Add(oTableCell)

                oTableCell = New TableCell()
                oTableCell.Text = "Draw Cheque Return Average"
                oTableCell.ColumnSpan = 2
                dupHeaderRow.Cells.Add(oTableCell)

                oTableCell = New TableCell()
                oTableCell.Text = "Draw Cheque Return Last Month"
                oTableCell.ColumnSpan = 2
                dupHeaderRow.Cells.Add(oTableCell)

                oTableCell = New TableCell()
                oTableCell.Text = "Deposit Cheque Return Average"
                oTableCell.ColumnSpan = 2
                dupHeaderRow.Cells.Add(oTableCell)

                oTableCell = New TableCell()
                oTableCell.Text = "Deposit Cheque Return Last Month"
                oTableCell.ColumnSpan = 2
                dupHeaderRow.Cells.Add(oTableCell)

                grid.Controls(0).Controls.Add(dupHeaderRow)

                'remove Header Cell แรก(Cell Summary)
                e.Row.Cells.RemoveAt(0)
            Case Else
                'do nothing
        End Select
    End Sub

    Protected Sub chequeGridView13_RowCreated(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewRowEventArgs) Handles chequeGridView13.RowCreated
        Select Case e.Row.RowType
            Case DataControlRowType.Header
                Dim grid As GridView = DirectCast(sender, GridView)

                Dim dupHeaderRow As New GridViewRow(0, 0, DataControlRowType.Header, DataControlRowState.Insert)

                Dim oTableCell As TableCell = Nothing

                oTableCell = New TableCell()
                oTableCell.Text = e.Row.Cells(0).Text
                oTableCell.RowSpan = 2
                dupHeaderRow.Cells.Add(oTableCell)

                oTableCell = New TableCell()
                oTableCell.Text = "Draw Cheque Return Average"
                oTableCell.ColumnSpan = 2
                dupHeaderRow.Cells.Add(oTableCell)

                oTableCell = New TableCell()
                oTableCell.Text = "Draw Cheque Return Last Month"
                oTableCell.ColumnSpan = 2
                dupHeaderRow.Cells.Add(oTableCell)

                oTableCell = New TableCell()
                oTableCell.Text = "Deposit Cheque Return Average"
                oTableCell.ColumnSpan = 2
                dupHeaderRow.Cells.Add(oTableCell)

                oTableCell = New TableCell()
                oTableCell.Text = "Deposit Cheque Return Last Month"
                oTableCell.ColumnSpan = 2
                dupHeaderRow.Cells.Add(oTableCell)

                grid.Controls(0).Controls.Add(dupHeaderRow)

                'remove Header Cell แรก(Cell Summary)
                e.Row.Cells.RemoveAt(0)
            Case Else
                'do nothing
        End Select
    End Sub
End Class