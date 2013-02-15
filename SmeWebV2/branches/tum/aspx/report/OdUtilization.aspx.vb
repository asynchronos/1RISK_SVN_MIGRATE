Option Strict On
Option Explicit On

Imports System.Globalization

Namespace aspx.report
    Partial Class OdUtilization
        Inherits aspx.MyPageClass

        'Declare Series
        Dim debitSeries As Dundas.Charting.WebControl.Series = Nothing
        Dim creditSeries As Dundas.Charting.WebControl.Series = Nothing
        Dim limitSeries As Dundas.Charting.WebControl.Series = Nothing

        Dim limitSeries2 As Dundas.Charting.WebControl.Series = Nothing
        Dim utilizationSeries As Dundas.Charting.WebControl.Series = Nothing
        Dim utilizePercentSeries As Dundas.Charting.WebControl.Series = Nothing

        Dim limitSeries3 As Dundas.Charting.WebControl.Series = Nothing
        Dim maximumSeries As Dundas.Charting.WebControl.Series = Nothing
        Dim minimumSeries As Dundas.Charting.WebControl.Series = Nothing

        'Other Declare
        Dim dataDate As DateTime = Nothing
        Dim currentCulture As CultureInfo = Nothing

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

        Protected Sub accnoList_DataBound(ByVal sender As Object, ByVal e As System.EventArgs)
            Dim accnoList As DropDownList = DirectCast(sender, DropDownList)

        End Sub

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
            chequeGridView.DataBind()
            riskTableGridView.DataBind()
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

#End Region '"Event"

        Protected Sub Page_Init(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Init
            Try
                'currentCulture = DirectCast(Application.Get(ApplicationKeyConst.App_Culture), CultureInfo)
                currentCulture = New CultureInfo("en-US")
            Catch ex As Exception
                'currentCulture = New CultureInfo("th-TH")
                currentCulture = New CultureInfo("en-US")
            End Try
        End Sub

        Protected Sub odSummaryGridView_Init(ByVal sender As Object, ByVal e As System.EventArgs) Handles odSummaryGridView.Init
            'Init Series
            limitSeries = odSummaryChart.Series.Item("Limit")
            debitSeries = odSummaryChart.Series.Item("Debit")
            creditSeries = odSummaryChart.Series.Item("Credit")

            limitSeries2 = odSummaryChart.Series.Item("Limit2")
            utilizationSeries = odSummaryChart.Series.Item("Utilization")
            utilizePercentSeries = odSummaryChart.Series.Item("%Utilization")

            limitSeries3 = odSummaryChart.Series.Item("Limit3")
            maximumSeries = odSummaryChart.Series.Item("Maximum")
            minimumSeries = odSummaryChart.Series.Item("Minimum")

            debitSeries.LegendText = "Withdraw"
            creditSeries.LegendText = "Deposit"
            maximumSeries.LegendText = "Maximum Debt Bal"
            minimumSeries.LegendText = "Minimum Debt Bal"

            debitSeries.MarkerSize = 10
            creditSeries.MarkerSize = 10
            utilizationSeries.MarkerSize = 10
            utilizePercentSeries.MarkerSize = 10
            maximumSeries.MarkerSize = 10
            minimumSeries.MarkerSize = 10
        End Sub

        Protected Sub SummaryGridView_PreRender(ByVal sender As Object, ByVal e As System.EventArgs) Handles odSummaryGridView.PreRender
            If Me.isDateAssigned(dataDate) Then
                Dim grid As GridView = DirectCast(sender, GridView)

                Dim headerRow As GridViewRow = grid.HeaderRow
                For i As Integer = 1 To monthDisplay
                    'เอาวันที่มาเป็นหัว column
                    headerRow.Cells(i - 1).Text = DateAdd(DateInterval.Month, i - 13, dataDate).ToString("MMM yy", currentCulture)
                Next

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
            End If
        End Sub

        Protected Sub SummaryGridView_RowCreated(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewRowEventArgs) Handles odSummaryGridView.RowCreated
            Dim dRowView As Data.DataRowView = DirectCast(e.Row.DataItem, Data.DataRowView)

            If Not IsNothing(dRowView) Then
                'เช็คว่า datadate ว่ามีการ assign ค่าหรือยัง
                If Not Me.isDateAssigned(dataDate) Then
                    'เอาวันที่ของข้อมูลมาเก็บเพื่อใช้วนหาค่าเดือนของแต่ละฟิลด์
                    dataDate = DirectCast(dRowView.Item("run_date"), DateTime)
                End If
            End If

            Select Case e.Row.RowType

                Case DataControlRowType.DataRow
                    If Not IsNothing(dRowView) Then
                        'เอา Data จาก Grid ไปใส่กราฟ
                        If dRowView.Item("SUMMARY").Equals("DEBIT") Then
                            'เปลี่ยนค่ารายการใน grid
                            dRowView.Item(0) = "Withdraw"

                            For i As Integer = 1 To monthDisplay
                                debitSeries.Points.AddXY(DateAdd(DateInterval.Month, i - 13, dataDate).ToString("MMM yy", currentCulture), CDbl(dRowView.Item(i)))
                            Next
                        ElseIf dRowView.Item("SUMMARY").Equals("CREDIT") Then
                            dRowView.Item(0) = "Deposit"

                            For i As Integer = 1 To monthDisplay
                                creditSeries.Points.AddXY(DateAdd(DateInterval.Month, i - 13, dataDate).ToString("MMM yy", currentCulture), CDbl(dRowView.Item(i)))
                            Next
                        ElseIf dRowView.Item("SUMMARY").Equals("LIMIT") Then
                            For i As Integer = 1 To monthDisplay
                                limitSeries.Points.AddXY(DateAdd(DateInterval.Month, i - 13, dataDate).ToString("MMM yy", currentCulture), CDbl(dRowView.Item(i)))
                                limitSeries2.Points.AddXY(DateAdd(DateInterval.Month, i - 13, dataDate).ToString("MMM yy", currentCulture), CDbl(dRowView.Item(i)))
                                limitSeries3.Points.AddXY(DateAdd(DateInterval.Month, i - 13, dataDate).ToString("MMM yy", currentCulture), CDbl(dRowView.Item(i)))
                            Next
                        ElseIf dRowView.Item("SUMMARY").Equals("UTILIZATION") Then
                            For i As Integer = 1 To monthDisplay
                                utilizationSeries.Points.AddXY(DateAdd(DateInterval.Month, i - 13, dataDate).ToString("MMM yy", currentCulture), CDbl(dRowView.Item(i)))
                            Next
                        ElseIf dRowView.Item("SUMMARY").Equals("%UTILIZATION") Then
                            For i As Integer = 1 To monthDisplay
                                utilizePercentSeries.Points.AddXY(DateAdd(DateInterval.Month, i - 13, dataDate).ToString("MMM yy", currentCulture), CDbl(dRowView.Item(i)))
                            Next
                        ElseIf dRowView.Item("SUMMARY").Equals("MAX_BALANCE") Then
                            dRowView.Item(0) = "Minimum Debt Bal"

                            'คูณ -1 กลับ max เป็น min
                            For i As Integer = 1 To monthDisplay + 1
                                dRowView.Item(i) = (-1) * CDbl(dRowView.Item(i))

                                'ฟิลด์สุดท้ายเป็นค่าเฉลี่ยซึ่งไม่ต้องเอาไปแสดงในกราฟ
                                If i < monthDisplay + 1 Then
                                    minimumSeries.Points.AddXY(DateAdd(DateInterval.Month, i - 13, dataDate).ToString("MMM yy", currentCulture), CDbl(dRowView.Item(i)))
                                End If
                            Next
                        ElseIf dRowView.Item("SUMMARY").Equals("MIN_BALANCE") Then
                            dRowView.Item(0) = "Maximum Debt Bal"

                            'คูณ -1 กลับ min เป็น max
                            For i As Integer = 1 To monthDisplay + 1
                                dRowView.Item(i) = (-1) * CDbl(dRowView.Item(i))

                                'ฟิลด์สุดท้ายเป็นค่าเฉลี่ยซึ่งไม่ต้องเอาไปแสดงในกราฟ
                                If i < monthDisplay + 1 Then
                                    maximumSeries.Points.AddXY(DateAdd(DateInterval.Month, i - 13, dataDate).ToString("MMM yy", currentCulture), CDbl(dRowView.Item(i)))
                                End If
                            Next
                        End If
                    End If 'End If Not IsNothing(dRowView) Then
                    'End Case DataControlRowType.DataRow
                Case DataControlRowType.Header
                    Dim grid As GridView = DirectCast(sender, GridView)

                    Dim dupHeaderRow As New GridViewRow(0, 0, DataControlRowType.Header, DataControlRowState.Insert)

                    Dim oTableCell As TableCell = Nothing

                    oTableCell = New TableCell()
                    oTableCell.Text = Resources.OdUtilization.odSummaryGridView_Header1
                    oTableCell.RowSpan = 2
                    dupHeaderRow.Cells.Add(oTableCell)

                    oTableCell = New TableCell()
                    oTableCell.Text = Resources.OdUtilization.odSummaryGridView_Header2
                    oTableCell.ColumnSpan = 13
                    dupHeaderRow.Cells.Add(oTableCell)

                    grid.Controls(0).Controls.Add(dupHeaderRow)

                    'remove Header Cell แรก(Cell Summary)
                    e.Row.Cells.RemoveAt(0)
                Case Else
                    'do nothing
            End Select

        End Sub

        Protected Sub SummaryGridView_Unload(ByVal sender As Object, ByVal e As System.EventArgs) Handles odSummaryGridView.Unload
            'Clear Series Points
            If limitSeries.Points.Count > 0 Then
                limitSeries.Points.Clear()
            End If
            If debitSeries.Points.Count > 0 Then
                debitSeries.Points.Clear()
            End If
            If creditSeries.Points.Count > 0 Then
                creditSeries.Points.Clear()
            End If

            If limitSeries2.Points.Count > 0 Then
                limitSeries2.Points.Clear()
            End If
            If utilizationSeries.Points.Count > 0 Then
                utilizationSeries.Points.Clear()
            End If
            If utilizePercentSeries.Points.Count > 0 Then
                utilizePercentSeries.Points.Clear()
            End If

            If limitSeries3.Points.Count > 0 Then
                limitSeries2.Points.Clear()
            End If
            If maximumSeries.Points.Count > 0 Then
                maximumSeries.Points.Clear()
            End If
            If minimumSeries.Points.Count > 0 Then
                minimumSeries.Points.Clear()
            End If
        End Sub

        Protected Sub chequeGridView_RowCreated(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewRowEventArgs) Handles chequeGridView.RowCreated
            Select Case e.Row.RowType
                Case DataControlRowType.Header
                    Dim grid As GridView = DirectCast(sender, GridView)

                    Dim dupHeaderRow As New GridViewRow(0, 0, DataControlRowType.Header, DataControlRowState.Insert)

                    Dim oTableCell As TableCell = Nothing

                    oTableCell = New TableCell()
                    oTableCell.Text = "Detail"
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

        Protected Sub riskTableGridView_RowCreated(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewRowEventArgs) Handles riskTableGridView.RowCreated
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

        Protected Sub odSummaryChart_PreRender(ByVal sender As Object, ByVal e As System.EventArgs) Handles odSummaryChart.PreRender
            Dim dundasChart As Dundas.Charting.WebControl.Chart = DirectCast(sender, Dundas.Charting.WebControl.Chart)

            Dim accno As Double = Nothing

            Try
                accno = CDbl(accnoHiddenField.Value)
            Catch ex As Exception
                accno = 0
            End Try

            dundasChart.Titles.Item("movementTitle").Text = "CIF:" + cifHiddenField.Value + " " + cusNameHiddenField.Value + " ACCNO:" + accno.ToString("000-0-00000-0") + vbCrLf + dundasChart.Titles.Item("movementTitle").Text
            DirectCast(dundasChart.Annotations(0), Dundas.Charting.WebControl.CalloutAnnotation).Text = "*** Debt<0 (-) = Deposit ***"
        End Sub

        Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
            'ถ้าเป็น browser IE Version ที่ต่ำกว่า 6 ต้องลดขนาดเพื่อให้ print ไม่เกินหน้ากระดาษ
            If Request.Browser.Browser.Equals("IE") Then
                Dim ver As Integer = Nothing
                Try
                    ver = CInt(Request.Browser.Version)
                Catch ex As Exception
                    ver = 0
                End Try

                If ver < 7 Then
                    Dim printStyle As HtmlGenericControl = DirectCast(Page.Master.FindControl("head").FindControl("printStyle"), HtmlGenericControl)
                    printStyle.InnerText = "#tableDiv1 {zoom:63%;} #tableDiv2 {zoom:63%;} "
                End If
            End If
        End Sub
    End Class
End Namespace
