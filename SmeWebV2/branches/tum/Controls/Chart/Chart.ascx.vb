Imports System.Data
Imports System.Data.SqlClient

Partial Class Controls_Chart_Chart
    Inherits System.Web.UI.UserControl
    Public strChartType As String
    Public strChartName As String
    Public strChartColor As String
    Public strChartXLegend As String
    Public strChartYLegend As String
    Public intChartWidth As Int16
    Public intChartHeight As Int16
    Public strSQL As String

    Public Property ChartType() As String
        Get
            Return strChartType
        End Get
        Set(ByVal Value As String)
            strChartType = Value
        End Set
    End Property
    Public Property SQL() As String
        Get
            Return strSQL
        End Get
        Set(ByVal value As String)
            strSQL = value
        End Set
    End Property

    Public Property ChartName() As String
        Get
            Return strChartName
        End Get
        Set(ByVal Value As String)
            strChartName = Value
        End Set
    End Property
    Public Property ChartWidth() As Integer
        Get
            Return intChartWidth
        End Get
        Set(ByVal Value As Integer)
            intChartWidth = Value
        End Set
    End Property
    Public Property ChartHeight() As Integer
        Get
            Return intChartHeight
        End Get
        Set(ByVal Value As Integer)
            intChartHeight = Value
        End Set
    End Property
    Public Property ChartColor() As String
        Get
            Return strChartColor
        End Get
        Set(ByVal Value As String)
            strChartColor = Value
        End Set
    End Property
    Public Property ChartXLegend() As String
        Get
            Return strChartXLegend
        End Get
        Set(ByVal Value As String)
            strChartXLegend = Value
        End Set
    End Property
    Public Property ChartYLegend() As String
        Get
            Return strChartYLegend
        End Get
        Set(ByVal Value As String)
            strChartYLegend = Value
        End Set
    End Property

    Protected Sub Page_DataBinding(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.DataBinding
        getVariables()
        getData()
    End Sub

    Sub getVariables()
        If strSQL = "" Then
            strSQL = Session("sql")
            If strSQL = "" Then
                strSQL = "Select '1','1'"
            End If
        End If
    End Sub
    Sub getData()

        'Dim listChart As New ArrayList
        'listChart.Add("PieChart")
        'listChart.Add("LineDotChart")
        'listChart.Add("AreaHollow")
        'listChart.Add("Bar3D")
        'listChart.Add("BarArrow")
        'listChart.Add("BarFade")
        'listChart.Add("BarGlass")
        'listChart.Add("Candle")
        'listChart.Add("BarZebra")
        'listChart.Add("HLC")
        Dim objConn As SqlConnection = Nothing

        Dim arValues As Boolean = Nothing

        Dim table As DataTable = Nothing

        
        Try
            objConn = ConnectionUtil.getSqlConnectionFromWebConfig()

            Dim objCmd As SqlCommand = New SqlCommand(strSQL, objConn)
            objCmd.CommandType = Data.CommandType.Text

            Dim objRdr As SqlDataReader = objCmd.ExecuteReader()

            If objRdr.HasRows Then

                Dim ds As DataSet = New DataSet
                table = ds.Tables.Add("MyTable")

                'table.Columns.Add(New DataColumn("Label"))
                'table.Columns.Add(New DataColumn("Value"))

                For i = 0 To objRdr.FieldCount - 1
                    'MsgBox("i=" & i & ">" & objRdr.GetName(i))
                    table.Columns.Add(New DataColumn(objRdr.GetName(i)))
                Next

                Do While objRdr.Read
                    Dim row As DataRow = table.NewRow
                    For i = 0 To objRdr.FieldCount - 1
                        row(i) = objRdr(i)
                    Next

                    table.Rows.Add(row)
                Loop
                ds.AcceptChanges()

            End If

            objRdr.Close()
            objConn.Close()
        Catch ex As Exception
            Throw ex
        Finally
            ConnectionUtil.closeConnection(objConn)
        End Try

        '  Try


        Dim arrColor As New ArrayList
        'MsgBox(Now.Second)  
        arrColor.Add("#666666")
        Select Case Now.Second
            Case Is <= 9
                'MsgBox("1")
                arrColor.Add("#AABBCC")
                arrColor.Add("#D54C78")
                arrColor.Add("#3334AD")
            Case Is <= 19
                'MsgBox("2")
                arrColor.Add("#660000")
                arrColor.Add("#006600")
                arrColor.Add("#000066")
            Case Is <= 29
                'MsgBox("3")
                arrColor.Add("#aaaa00")
                arrColor.Add("#00aaaa")
                arrColor.Add("#aa00aa")
            Case Is <= 39
                'MsgBox("4")
                arrColor.Add("#00aa00")
                arrColor.Add("#0000aa")
                arrColor.Add("#aa0000")
            Case Is <= 49
                'MsgBox("5")
                arrColor.Add("#660000")
                arrColor.Add("#006600")
                arrColor.Add("#000066")
            Case Is <= 59
                'MsgBox("6")
                arrColor.Add("#6600FF")
                arrColor.Add("#FF6600")
                arrColor.Add("#00FF66")
        End Select

        arrColor.Add("#668844")
        arrColor.Add("#225566")
        arrColor.Add("#00FFFF")
        arrColor.Add("#660066")
        arrColor.Add("#FFFF00")

        Select Case strChartType

            ' AreaHollow, Bar, Bar3D, BarArrow, BarFade, BarFilled, BarGlass, BarZebra, Candle, HLC, Line, LineDot, LineHollow, ScatterCircle and Pie.

            Case "PieChart"

                Dim myGraph As New OpenFlashChartLibrary.PieGraph(1)
                myGraph.title.Set(strChartName, "{font-size:14px;color:#000000;border-color:#000000}")
                myGraph.pie.alpha = 100
                myGraph.pie.textColor = "#000000"
                myGraph.pie.isGradientFillEnabled = True
                myGraph.pie.borderWidth = 0

                Dim data As OpenFlashChartLibrary.SimpleChartData = myGraph.pie.data
                Dim pieLB As New OpenFlashChartLibrary.GraphElemsnt.PieLabels()
                Dim pieColor As New OpenFlashChartLibrary.PieColors()
                For i As Integer = 0 To table.Rows.Count - 1
                    myGraph.pie.data.add(CInt(table.Rows(i).Item(1)))
                    pieLB.add(table.Rows(i).Item(0) & ":" & CInt(table.Rows(i).Item(1)))
                    pieColor.addColor(arrColor(i + 1))

                Next
                myGraph.labels = pieLB
                myGraph.pieColors = pieColor

                Chart1.heightPx = intChartHeight
                Chart1.widthPx = intChartWidth

                'Dim myGraph4 As OpenFlashChartLibrary.Graph = GetPieChart()
                ' เนืองจากมีโคดที่เจนออกมาผิดพลาดต้องทำการ replace
                Dim strd As String = Nothing
                strd = myGraph.StringValue.ToString
                strd = strd.Replace("=&x_labels", "")
                'Response.Write(strd)
                Chart1.isDataSourceExternal = False
                Chart1.dataSource = strd
                Chart1.DataBind()
                Chart1.heightPx = intChartHeight
            Case Else

                'Dim outline As String = ""  '  dll ไม่มีส่วน outline มาให้ ต้องใส่เอง
                'Dim abrvChart As String = "" ' เอาไปเก็บคำย่อเพื่อนำไปต่อสตริง outline

                Dim myGraph As New OpenFlashChartLibrary.ChartGraph
                myGraph.title.Set(strChartName, "{font-size:16px; color: #FFFFFF; margin: 2px; background-color: #505050; padding:2px;padding-left: 10px; padding-right:10px;font-family:tahoma}")
                Dim maxGvalue As Double
                For g = 1 To table.Columns.Count - 1

                    Dim myChart As OpenFlashChartLibrary.Chart.ChartBase

                    Select Case strChartType
                        Case "LineDot"
                            'abrvChart = "line_dot"
                            myChart = myGraph.addChart_LineDot(2)

                            DirectCast(myChart, OpenFlashChartLibrary.Chart.LineDot).lineWidth = 2
                            DirectCast(myChart, OpenFlashChartLibrary.Chart.LineDot).circleSize = 4
                            DirectCast(myChart, OpenFlashChartLibrary.Chart.LineDot).color = arrColor(g)
                            DirectCast(myChart, OpenFlashChartLibrary.Chart.LineDot).legend = table.Columns(g).ColumnName
                            DirectCast(myChart, OpenFlashChartLibrary.Chart.LineDot).legendFontSize = 10

                        Case "AreaHollow"
                            myChart = myGraph.addChart_AreaHollow(2)
                            DirectCast(myChart, OpenFlashChartLibrary.Chart.AreaHollow).lineWidth = 2
                            DirectCast(myChart, OpenFlashChartLibrary.Chart.AreaHollow).circleSize = 4
                            DirectCast(myChart, OpenFlashChartLibrary.Chart.AreaHollow).color = arrColor(g)
                            DirectCast(myChart, OpenFlashChartLibrary.Chart.AreaHollow).legend = table.Columns(g).ColumnName
                            DirectCast(myChart, OpenFlashChartLibrary.Chart.AreaHollow).legendFontSize = 10


                        Case "Bar3D"
                            myChart = myGraph.addChart_Bar3D(0)
                            DirectCast(myChart, OpenFlashChartLibrary.Chart.Bar3D).color = arrColor(g)
                            DirectCast(myChart, OpenFlashChartLibrary.Chart.Bar3D).legend = table.Columns(g).ColumnName
                            DirectCast(myChart, OpenFlashChartLibrary.Chart.Bar3D).legendFontSize = 10
                            DirectCast(myChart, OpenFlashChartLibrary.Chart.Bar3D).alpha = 70

                            myGraph.xAxis.axis_3D_depthPx = 5
                            myGraph.xAxis.axisColor = "#AABBAA"
                        Case "Bar"
                            myChart = myGraph.addChart_Bar(10)
                            DirectCast(myChart, OpenFlashChartLibrary.Chart.Bar).color = arrColor(g)
                            DirectCast(myChart, OpenFlashChartLibrary.Chart.Bar).legend = table.Columns(g).ColumnName
                            DirectCast(myChart, OpenFlashChartLibrary.Chart.Bar).legendFontSize = 10
                        Case "BarFilled"
                            myChart = myGraph.addChart_BarFilled(10)
                            DirectCast(myChart, OpenFlashChartLibrary.Chart.BarFilled).color = arrColor(g)
                            DirectCast(myChart, OpenFlashChartLibrary.Chart.BarFilled).legend = table.Columns(g).ColumnName
                            DirectCast(myChart, OpenFlashChartLibrary.Chart.BarFilled).legendFontSize = 10

                        Case "BarArrow"
                            myChart = myGraph.addChart_BarArrow(1)
                        Case "BarFade"
                            myChart = myGraph.addChart_BarFade(10)
                        Case "BarGlass"
                            myChart = myGraph.addChart_BarGlass(1)
                            DirectCast(myChart, OpenFlashChartLibrary.Chart.BarGlass).color = arrColor(g)
                            DirectCast(myChart, OpenFlashChartLibrary.Chart.BarGlass).legend = table.Columns(g).ColumnName
                            DirectCast(myChart, OpenFlashChartLibrary.Chart.BarGlass).legendFontSize = 10

                        Case "Candle"
                            myChart = myGraph.addChart_Candle(1)
                        Case "BarZebra"
                            myChart = myGraph.addChart_BarZebra(1)
                        Case "HLC"
                            myChart = myGraph.addChart_HLC(1)
                    End Select


                    'myChart.color = "#00AAAA"
                    'myChart.legend = "Avg. wave height (cm)"
                    'myChart.legendFontSize = 10

                    If strChartType = "Candle" Then
                        'Dim Data As New OpenFlashChartLibrary.CandleChartData(4)
                        'Data = DirectCast(myChart, OpenFlashChartLibrary.Chart.Candle).data

                        'For i As Integer = 0 To table.Rows.Count - 1
                        '    Data.add(500, 500, 30, 30)
                        '    'data.add(CInt(Table.Rows(i).Item("Value")), CInt(Table.Rows(i).Item("Value")))
                        '    myGraph.xLabels.add(table.Rows(i).Item("Label"))

                        'Next
                        'myGraph.yMinMax.minValue = 0
                        'myGraph.yMinMax.maxValue = Data.maxValue + 1
                    ElseIf strChartType = "HLC" Then
                        'Dim Data As New OpenFlashChartLibrary.HLCChartData(1)
                        'Data = DirectCast(myChart, OpenFlashChartLibrary.Chart.HLC).data

                        'For i As Integer = 0 To table.Rows.Count - 1
                        '    Data.add(30 + i, 28 + i, 28 + i)
                        '    'data.add(CInt(Table.Rows(i).Item("Value")), CInt(Table.Rows(i).Item("Value")))
                        '    myGraph.xLabels.add(table.Rows(i).Item("Label"))
                        'Next
                        'myGraph.yMinMax.minValue = 0
                        'myGraph.yMinMax.maxValue = Data.maxValue + 1

                    Else
                        myGraph.yMinMax.maxValue = 0
                        Dim linkChart As New OpenFlashChartLibrary.Links

                        Dim data As New OpenFlashChartLibrary.SimpleChartData(100)
                        data = DirectCast(myChart.values, OpenFlashChartLibrary.SimpleChartData)

                        For i As Integer = 0 To table.Rows.Count - 1
                            If g = 1 Then
                                myGraph.xLabels.add(table.Rows(i).Item(0))

                            End If
                            data.add(CInt(table.Rows(i).Item(g)))
                            '  linkChart.addLink("javascript:alert('" & table.Columns(g).ColumnName & "')")

                        Next
                        'MsgBox(data.maxValue + 1 & " - " & maxGvalue)
                        If data.maxValue + 1 > maxGvalue Then
                            maxGvalue = data.maxValue + 1
                        End If
                    End If
                    'Response.Write(myChart.StringValue.ToString)

                    'If g = 1 Then
                    '    outline = outline & abrvChart & "=2," & arrColor(g) & ",Line,10,4&"
                    'Else
                    '    outline = outline & abrvChart & "_" & g + 1 & "=2," & arrColor(g) & ",Line,10,4&"
                    'End If
                Next



                myGraph.yMinMax.maxValue = maxGvalue

                'myGraph.yTicks.steps = 5
                myGraph.xLabelStyle.size = "12"
                myGraph.xLabelStyle.step = 1
                myGraph.xLabelStyle.altAxisColor = "#898898"

                myGraph.xLabelStyle.rotation = 2
                myGraph.xLegend.Set(strChartXLegend, 10, "#999999")
                myGraph.yLegend.Set(strChartYLegend, 10, "#999999")

                myGraph.isYRightVisible = True

                Chart1.heightPx = intChartHeight
                Chart1.widthPx = intChartWidth

                Chart1.isDataSourceExternal = False
                Dim strd As String = Nothing
                strd = myGraph.StringValue.ToString
                Chart1.dataSource = strd
                'Response.Write(strd)
                Chart1.DataBind()


        End Select
        '  Catch ex As Exception

        'End Try
    End Sub

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Not Me.IsPostBack Then
            Page.DataBind()
        End If
    End Sub
End Class
