Imports System.Collections.Generic
Imports System.Globalization
Imports System.Data
Imports System.Data.SqlClient
Imports OpenFlashChartLibrary
Imports System.Drawing
Partial Class aspx_report_ReportPerfomance
    Inherits System.Web.UI.Page
    Protected cul As New CultureInfo("en-US") ' ปี eng

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Not Page.IsPostBack Then
            BindData()
            populateTree()
            bindDropDown()

        End If
    End Sub

    Private Sub BindData()
        'MsgBox(LevelTree.Nodes.Count)
        If IsNothing(Session("arrRoot")) = False Then Exit Sub ' if have node exit sub 
        '  get data
        Dim dal As New ControllingLevelDAL
        Dim arr As List(Of ControllingLevel)
        arr = dal.getListControllingLevelByLevel_Root("Root")
        Session("arrRoot") = arr

        Dim obj As New VLevelUserEmpDAL
        Dim arrUser As New List(Of VLevelUserEmp)
        arrUser = obj.getListALLVLevelUserEmp
        Session("arrUser") = arrUser

        Dim dalLevel As New ControllingLevelDAL
        Dim arrLevel As New List(Of ControllingLevel)
        arrLevel = dalLevel.getAllControllingLevel
        Session("arrLevel") = arrLevel

    End Sub
    Sub populateTree()
        ' create  root node
        Dim arr = Session("arrRoot")
        Dim Rootnode As New TreeNode
        Rootnode.Text = arr(0).LEVEL_NAME
        Rootnode.Value = arr(0).LEVEL_ID
        Dim root As TreeNode = AddNodeAndDescendents(Rootnode)
        'Add the root to the TreeView
        LevelTree.Nodes.Clear()
        LevelTree.Nodes.Add(root)

    End Sub

    Private Function AddNodeAndDescendents(ByVal parentNode As TreeNode) As TreeNode

        Dim level_id = parentNode.Value
        Dim node As New TreeNode
        node.Text = parentNode.Text
        node.Value = parentNode.Value
        Dim arrLevel As List(Of ControllingLevel) = Session("arrLevel")
        Dim arrUser As List(Of VLevelUserEmp) = Session("arrUser")
        ' Find  user in this level
        Dim Atext As String   '  text for search 
        For u As Integer = 0 To arrUser.Count - 1
            Atext = arrUser(u).EMP_ID & ":" & arrUser(u).TITLE_NAME & arrUser(u).EMPNAME & " " & arrUser(u).EMPSURNAME

            'MsgBox(InStr(Atext, SearchText))
            If arrUser(u).LEVEL_ID = node.Value Then
                Dim cnode As New TreeNode
                cnode.Value = arrUser(u).EMP_ID
                cnode.Text = Atext
                cnode.ImageUrl = "human.gif"
                node.ChildNodes.Add(cnode)
            End If
        Next
        ' Find  level  in  this  level
        Dim Ltext As String  '  text for search 
        For i As Integer = 0 To arrLevel.Count - 1
            Ltext = arrLevel(i).LEVEL_NAME
            If arrLevel(i).LEVEL_ROOT = node.Value Then
                Dim cnode As New TreeNode
                cnode.Value = arrLevel(i).LEVEL_ID
                cnode.Text = Ltext
                'node.Expand()
                Dim ccnode As TreeNode = AddNodeAndDescendents(cnode)
                node.ChildNodes.Add(ccnode)
            End If
        Next
        Return node     'Return the new TreeNode
    End Function
    Private Function AddNodeBySearchUser(ByVal parentNode As TreeNode, ByVal SearchText As String) As TreeNode
        'SearchText = tbSearch.Text
        parentNode.ChildNodes.Clear()
        Dim arrUser As List(Of VLevelUserEmp) = Session("arrUser")
        ' Find  user in this level
        Dim Atext As String   '  text for search 
        For u As Integer = 0 To arrUser.Count - 1
            Atext = arrUser(u).EMP_ID & ":" & arrUser(u).TITLE_NAME & arrUser(u).EMPNAME & " " & arrUser(u).EMPSURNAME
            'MsgBox(InStr(Atext, SearchText))
            If LCase(Atext).IndexOf(LCase(SearchText)) >= 0 Then
                Dim cnode As New TreeNode
                cnode.Value = arrUser(u).EMP_ID
                cnode.Text = Atext
                parentNode.ChildNodes.Add(cnode)
            End If
        Next
        ' Find  level  in  this  level
        Return parentNode     'Return the new TreeNode
    End Function

    Protected Sub LevelTree_SelectedNodeChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles LevelTree.SelectedNodeChanged
        Dim emp_id, emp_name As String
        Dim name = Split(LevelTree.SelectedNode.Text, ":")
        If UBound(name) > 0 Then  ' ถ้าเป็นการเลือกค้นให้ทำ
            emp_id = LevelTree.SelectedNode.Value
            emp_name = name(1)
            lblID.Text = emp_id
            lblName.Text = emp_name
        Else
            Try
                Dim obj As New ControllingLeadsinlevel
                Dim dal As New ControllingLeadsinlevelDAL
                Dim level_id As String = LevelTree.SelectedNode.Value
                obj = dal.getControllingLeadsinlevelByLEVEL_ID(level_id)
                lblID.Text = obj.EMP_ID
                lblName.Text = LevelTree.SelectedNode.Text
            Catch ex As Exception
                lblID.Text = "00"
                lblName.Text = "Don't have leader."
            End Try

        End If
        showPerform()
    End Sub
    Sub bindDropDown()

        '===========เริ่มสร้าง dropdownlist สำหรับเลือกวันที่สถานะ
        For d As Integer = 1 To 31
            Dim item As New ListItem
            item.Value = d.ToString
            item.Text = d.ToString
            DropDownListDay.Items.Add(item)
        Next
        Dim ditem As New ListItem
        ditem.Text = "all"
        ditem.Value = "0"
        DropDownListDay.Items.Insert(0, ditem)
        'DropDownListDay.SelectedIndex = Day(Now)
        DropDownListDay.SelectedIndex = 0

        For m As Integer = 1 To 12
            Dim item As New ListItem
            item.Value = m.ToString
            item.Text = MonthName(m)
            DropDownListMonth.Items.Add(item)

        Next
        'Dim mitem As New ListItem("all", "0")
        'DropDownListMonth.Items.Insert(0, mitem)
        DropDownListMonth.SelectedIndex = Month(Now) - 1

        For y As Integer = cul.Calendar.GetYear(Date.Now) To cul.Calendar.GetYear(Date.Now) - 5 Step -1
            Dim item As New ListItem
            item.Value = y.ToString
            item.Text = (y + 543).ToString
            DropDownListYear.Items.Add(item)
        Next



    End Sub

    Protected Sub Button1_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles Button1.Click
        showPerform()

    End Sub
    Sub showPerform()

        lblName.NavigateUrl = "aspx/report/ReportCreditByProduct.aspx?y=2008&m=7&d=3&g=D&r=0&e=000001&l=00001&f=False&yr=0&mr=0&dr=0"
        Dim strDay As String = DropDownListDay.Items(DropDownListDay.SelectedIndex).Value
        Dim strMonth As String = DropDownListMonth.Items(DropDownListMonth.SelectedIndex).Value
        Dim strYear As String = DropDownListYear.Items(DropDownListYear.SelectedIndex).Value
        Dim strLead As String = lblID.Text
        Dim TTNet1, TTNet2, TTNet3, TTNet4 As Double
        Dim TTCount1, TTCount2, TTCount3, TTCount4, tty, pat As Double

      
        Dim sqlCmd As SqlCommand
        Dim sqlConn As SqlConnection
        Dim sqlReader As SqlDataReader

        sqlConn = ConnectionUtil.getSqlConnectionFromWebConfig()
        sqlCmd = New SqlCommand("ReportPerformance1", sqlConn)
        sqlCmd.CommandType = CommandType.StoredProcedure

        With sqlCmd
            .Parameters.Add("@Day", SqlDbType.NVarChar, 2).Value = strDay
            .Parameters.Add("@Month", SqlDbType.NVarChar, 2).Value = strMonth
            .Parameters.Add("@Year", SqlDbType.NVarChar, 4).Value = strYear
            .Parameters.Add("@Lead_id", SqlDbType.NVarChar, 10).Value = strLead
        End With

        sqlReader = sqlCmd.ExecuteReader

        Chart3.ChartName = lblName.Text
        Chart3.SQL = "EXEC [ReportPerformance2]@Day=N'" & strDay & "',@Month=N'" & strMonth & "',@Year=N'" & strYear & "',@Lead_id=N'" & strLead & "'"

        Chart3.DataBind()

        'MsgBox(sqlReader.HasRows)

        clearData()

        While (sqlReader.Read)
            'MsgBox(UCase(Trim(sqlReader("Process_Group"))))
            Select Case LCase(Trim(sqlReader(0)))

                Case "register"  ' process

                    If sqlReader(3) <> 0 Then lblICount1.Text = Format(CInt(lblICount1.Text) + sqlReader(3), "#,###") ' credit
                    If sqlReader(5) <> 0 Then lblICount2.Text = Format(CInt(lblICount2.Text) + sqlReader(5), "#,###") ' REVIEW
                    If sqlReader(4) <> 0 Then lblICount3.Text = Format(CInt(lblICount3.Text) + sqlReader(4), "#,###") ' other
                    If sqlReader(1) <> 0 Then lblICount4.Text = Format(CInt(lblICount4.Text) + sqlReader(1), "#,###") ' total

                    If sqlReader(2) <> 0 Then lblINet1.Text = Format(CDbl(lblINet1.Text) + sqlReader(2), "#,###.00") ' net
                    lblINet2.Text = 0
                    lblINet3.Text = 0
                    If sqlReader(2) <> 0 Then lblINet4.Text = Format(CDbl(lblINet4.Text) + sqlReader(2), "#,###.00") ' net

                    TTNet4 += sqlReader(2)
                    TTCount4 += sqlReader(1)

                    Exit Select

                Case "in process"   ' process

                    If sqlReader(3) <> 0 Then lblICount1.Text = Format(CInt(lblICount1.Text) + sqlReader(3), "#,###") ' credit
                    If sqlReader(5) <> 0 Then lblICount2.Text = Format(CInt(lblICount2.Text) + sqlReader(5), "#,###") ' REVIEW
                    If sqlReader(4) <> 0 Then lblICount3.Text = Format(CInt(lblICount3.Text) + sqlReader(4), "#,###") ' other
                    If sqlReader(1) <> 0 Then lblICount4.Text = Format(CInt(lblICount4.Text) + sqlReader(1), "#,###") ' total

                    If sqlReader(2) <> 0 Then lblINet1.Text = Format(CDbl(lblINet1.Text) + sqlReader(2), "#,###.00") ' net
                    lblINet2.Text = 0
                    lblINet3.Text = 0
                    If sqlReader(2) <> 0 Then lblINet4.Text = Format(CDbl(lblINet4.Text) + sqlReader(2), "#,###.00") ' net

                    TTNet4 += sqlReader(2)
                    TTCount4 += sqlReader(1)

                    Exit Select

                Case "return" ' Return
                    If sqlReader(3) <> 0 Then lblTCount1.Text = Format(sqlReader(3), "#,###") ' credit
                    If sqlReader(5) <> 0 Then lblTCount2.Text = Format(sqlReader(5), "#,###") ' REVIEW
                    If sqlReader(4) <> 0 Then lblTCount3.Text = Format(sqlReader(4), "#,###") ' other
                    If sqlReader(1) <> 0 Then lblTCount4.Text = Format(sqlReader(1), "#,###") ' total

                    If sqlReader(2) <> 0 Then lblTNet1.Text = Format(sqlReader(2), "#,###.00") ' net
                    lblTNet2.Text = 0
                    lblTNet3.Text = 0
                    If sqlReader(2) <> 0 Then lblTNet4.Text = Format(sqlReader(2), "#,###.00") ' net
                    TTNet3 += 0
                    TTCount3 += sqlReader(4)
                    Exit Select

                Case "approve"  ' Approve
                    If sqlReader(3) <> 0 Then lblACount1.Text = Format(sqlReader(3), "#,###") ' credit
                    If sqlReader(5) <> 0 Then lblACount2.Text = Format(sqlReader(5), "#,###") ' REVIEW
                    If sqlReader(4) <> 0 Then lblACount3.Text = Format(sqlReader(4), "#,###") ' other
                    If sqlReader(1) <> 0 Then lblACount4.Text = Format(sqlReader(1), "#,###") ' total

                    If sqlReader(2) <> 0 Then lblANet1.Text = Format(sqlReader(2), "#,###.00") ' net
                    lblANet2.Text = 0
                    lblANet3.Text = 0
                    If sqlReader(2) <> 0 Then lblANet4.Text = Format(sqlReader(2), "#,###.00") ' net

                    TTNet1 += sqlReader(2)
                    TTCount1 += sqlReader(3)

                    Exit Select
                Case "reject" ' reject
                    If sqlReader(3) <> 0 Then lblJCount1.Text = Format(sqlReader(3), "#,###") ' credit
                    If sqlReader(5) <> 0 Then lblJCount2.Text = Format(sqlReader(5), "#,###") ' REVIEW
                    If sqlReader(4) <> 0 Then lblJCount3.Text = Format(sqlReader(4), "#,###") ' other
                    If sqlReader(1) <> 0 Then lblJCount4.Text = Format(sqlReader(1), "#,###") ' total

                    If sqlReader(2) <> 0 Then lblJNet1.Text = Format(sqlReader(2), "#,###.00") ' net
                    lblJNet2.Text = 0
                    lblJNet3.Text = 0
                    If sqlReader(2) <> 0 Then lblJNet4.Text = Format(sqlReader(2), "#,###.00") ' net
                    TTNet2 += 0
                    TTCount2 += sqlReader(5)
                    Exit Select
            End Select
            tty += sqlReader(6)
            pat += sqlReader(7)
        End While



        lblTTCount1.Text = lblACount4.Text
        lblTTCount2.Text = lblJCount4.Text
        lblTTCount3.Text = lblTCount4.Text
        lblTTCount4.Text = lblICount4.Text

        'If TTCount4 <> 0 Then lblTTY.Text = Format(tty / TTCount4, "#,###.00")
        'If TTCount4 <> 0 Then lblPat.Text = Format(pat / TTCount4, "#,###.00")

        lblTTNet1.Text = lblANet4.Text
        lblTTNet2.Text = lblJNet4.Text
        lblTTNet3.Text = lblTNet4.Text
        lblTTNet4.Text = lblINet4.Text

        lblTTCount5.Text = CInt(lblTTCount1.Text) + CInt(lblTTCount2.Text) + CInt(lblTTCount3.Text) + CInt(lblTTCount4.Text)
        lblTTNet5.Text = CDec(lblTTNet1.Text) + CDec(lblTTNet2.Text) + CDec(lblTTNet3.Text) + CDec(lblTTNet4.Text)
        If lblTTCount5.Text <> "" Then lblTTCount5.Text = Format(CDec(lblTTCount5.Text), "#,###")
        If lblTTNet5.Text <> "" Then lblTTNet5.Text = Format(CDec(lblTTNet5.Text), "#,###.00")


        sqlReader.Close()
        sqlCmd.ExecuteNonQuery()
        sqlConn.Close()



        'Dim ds As DataSet = New DataSet
        'Dim table As DataTable = ds.Tables.Add("My Table")
        'table.Columns.Add(New DataColumn("Process_Head"))
        'table.Columns.Add(New DataColumn("CREDIT"))
        'table.Columns.Add(New DataColumn("REVIEW"))
        'table.Columns.Add(New DataColumn("OTHER"))
        'table.Columns.Add(New DataColumn("TOTAL"))

        ''==== สร้างทีละ chart
        'Dim row As DataRow = table.NewRow
        'row(0) = "Approve"
        'row(1) = CDec(lblACount1.Text)
        'row(2) = CDec(lblACount2.Text)
        'row(3) = CDec(lblACount3.Text)
        'row(4) = CDec(lblACount4.Text)

        'table.Rows.Add(row)

        'Dim row2 As DataRow = table.NewRow
        'row2(0) = "Reject"
        'row2(1) = CDec(lblJCount1.Text)
        'row2(2) = CDec(lblJCount2.Text)
        'row2(3) = CDec(lblJCount3.Text)
        'row2(4) = CDec(lblJCount4.Text)

        'table.Rows.Add(row2)


        'Dim row4 As DataRow = table.NewRow
        'row4(0) = "In Proces"
        'row4(1) = CDec(lblICount1.Text)
        'row4(2) = CDec(lblICount2.Text)
        'row4(3) = CDec(lblICount3.Text)
        'row4(4) = CDec(lblICount4.Text)

        'table.Rows.Add(row4)


        'Dim row3 As DataRow = table.NewRow
        'row3(0) = "Return"
        'row3(1) = CDec(lblTCount1.Text)
        'row3(2) = CDec(lblTCount2.Text)
        'row3(3) = CDec(lblTCount3.Text)
        'row3(4) = CDec(lblTCount4.Text)

        'table.Rows.Add(row3)


        'Dim myGraph As New OpenFlashChartLibrary.Chart.(1000)
        'myGraph.title.Set(lblName.Text, "{font-size:12px; color:#000000}")
        'myGraph.pie.alpha = 80
        'myGraph.pie.color = "#9933CC"
        'myGraph.pie.textColor = "#000000"
        'myGraph.pie.isGradientFillEnabled = True
        'myGraph.pie.borderWidth = 0
        'Dim data As OpenFlashChartLibrary.SimpleChartData = myGraph.pie.data

        'For g = 1 To table.Columns.Count - 1
        '    myGraph.yMinMax.maxValue = 0
        '    Dim linkChart As New OpenFlashChartLibrary.Links

        '    Dim data As New OpenFlashChartLibrary.SimpleChartData(100)
        '    data = DirectCast(MyChart.values, OpenFlashChartLibrary.SimpleChartData)

        '    For i As Integer = 0 To table.Rows.Count - 1
        '        If g = 1 Then
        '            myGraph.xLabels.add(table.Rows(i).Item(0))

        '        End If
        '        data.add(CInt(table.Rows(i).Item(g)))
        '        '  linkChart.addLink("javascript:alert('" & table.Columns(g).ColumnName & "')")

        '    Next
        '    'MsgBox(data.maxValue + 1 & " - " & maxGvalue)
        '    If data.maxValue + 1 > maxGvalue Then
        '        maxGvalue = data.maxValue + 1
        '    End If
        'Next

        'Dim pieLB As New OpenFlashChartLibrary.GraphElemsnt.PieLabels()
        'For i As Integer = 0 To table.Rows.Count - 1
        '    data.add(CInt(table.Rows(i).Item("NET")))
        '    pieLB.add(table.Rows(i).Item("GROUP") & ":" & CInt(table.Rows(i).Item("NET")))
        '    Select Case ds.Tables("My Table").Rows(i).Item("GROUP")
        '        Case "Approve"
        '            myGraph.pieColors.addColor("#008080")
        '        Case "Reject"
        '            myGraph.pieColors.addColor("#FF6699")
        '        Case "Return"
        '            myGraph.pieColors.addColor("#66CCFF")
        '        Case "Inproces"
        '            myGraph.pieColors.addColor("#FFCC66")
        '    End Select
        'Next
        'myGraph.labels = pieLB
        ''MsgBox(myGraph.pie.data.StringValue)
        ''MsgBox(myGraph.labels.StringValue)
        ''Dim myGraph4 As OpenFlashChartLibrary.Graph = GetPieChart()
        '' เนืองจากมีโคดที่เจนออกมาผิดพลาดต้องทำการ replace
        'Dim strd As String = Nothing
        'strd = myGraph.StringValue.ToString
        'strd = strd.Replace("=&x_labels", "")
        'OpenFlashChartControl1.isDataSourceExternal = False
        'OpenFlashChartControl1.dataSource = strd
        'OpenFlashChartControl1.DataBind()
    End Sub
  
    Sub clearData()
        lblANet1.Text = 0
        lblANet2.Text = 0
        lblANet3.Text = 0
        lblANet4.Text = 0
        lblACount1.Text = 0
        lblACount2.Text = 0
        lblACount3.Text = 0
        lblACount4.Text = 0

        lblJNet1.Text = 0
        lblJNet2.Text = 0
        lblJNet3.Text = 0
        lblJNet4.Text = 0
        lblJCount1.Text = 0
        lblJCount2.Text = 0
        lblJCount3.Text = 0
        lblJCount4.Text = 0

        lblTNet1.Text = 0
        lblTNet2.Text = 0
        lblTNet3.Text = 0
        lblTNet4.Text = 0
        lblTCount1.Text = 0
        lblTCount2.Text = 0
        lblTCount3.Text = 0
        lblTCount4.Text = 0

        lblINet1.Text = 0
        lblINet2.Text = 0
        lblINet3.Text = 0
        lblINet4.Text = 0
        lblICount1.Text = 0
        lblICount2.Text = 0
        lblICount3.Text = 0
        lblICount4.Text = 0


        lblTTCount1.Text = 0
        lblTTCount2.Text = 0
        lblTTCount3.Text = 0
        lblTTCount4.Text = 0
        lblTTCount5.Text = 0
        'lblTTY.Text = 0
        'lblPat.Text = 0
        lblTTNet1.Text = 0
        lblTTNet2.Text = 0
        lblTTNet3.Text = 0
        lblTTNet4.Text = 0
        lblTTNet5.Text = 0
    End Sub
    'Sub CreateChart()
    '    Dim chart As PieChart = New PieChart
    '    chart.DataSource = GetDataSet.Tables(0).DefaultView
    '    chart.DataXValueField = "Title"
    '    chart.DataYValueField = "Price"
    '    chart.DataLabels.Visible = True
    '    chart.DataLabels.ForeColor = System.Drawing.Color.Blue
    '    chart.Shadow.Visible = True
    '    chart.DataBind()
    '    chart.Explosion = 10
    '    ChartControl1.Charts.Add(chart)
    '    chartControl1.RedrawChart()

    'End Sub

    'Function GetDataSet() As DataSet
    '    Dim ds As DataSet = New DataSet
    '    Dim table As DataTable = ds.Tables.Add("My Table")
    '    table.Columns.Add(New DataColumn("Title"))
    '    table.Columns.Add(New DataColumn("Price", GetType(System.Int32)))
    '    Dim rnd As Random = New Random
    '    Dim i As Integer = 0
    '    Do While (i < 10)
    '        Dim row As DataRow = table.NewRow
    '        row("Title") = ("Title:" + i.ToString)
    '        row("Price") = rnd.Next(1, 100)
    '        table.Rows.Add(row)
    '        i = (i + 1)
    '    Loop
    '    Return ds
    'End Function

End Class