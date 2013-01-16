Imports System.Data
Imports System.Data.SqlClient
Partial Class aspx_form_ShowTable
    Inherits System.Web.UI.Page

    Dim ConnString = ConfigurationManager.ConnectionStrings("Bay01ConnectionString").ToString
    Shared strTable As String
    Shared NumRecord As Integer
    Shared arrKey As ArrayList
    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Not Page.IsPostBack Then
            strTable = Request.QueryString("TABLE")
            showData()
        End If
    End Sub
    Protected Sub EditData(sender As Object, e As GridViewEditEventArgs)
        GridViewTable.EditIndex = e.NewEditIndex
        showData()
        ' Response.Write(GridViewTable.Rows(e.NewEditIndex).Cells(2).Text)

    End Sub

    Protected Sub CancelData()
        GridViewTable.EditIndex = -1
        showData()
    End Sub

    Sub BoundRow(ByVal sender As Object, ByVal e As GridViewRowEventArgs)

        If e.Row.RowType = DataControlRowType.DataRow Then
            'Dim cell = New TableCell
            'Dim hCtr As New HiddenField
            'hCtr.Value = e.Row.Cells(1).Text
            'cell.Controls.Add(hCtr)
            'e.Row.Cells.Add(cell)

            'Response.Write(e.Row.Cells(1).Text)
            'Response.Write(e.Row.RowIndex)

            Dim thisRecord As Integer = (GridViewTable.PageSize * (GridViewTable.PageIndex)) + (e.Row.RowIndex + 1)
            If thisRecord > NumRecord Then
                Dim BtnAdd As ImageButton = e.Row.FindControl("BtnAdd")
                If BtnAdd IsNot Nothing Then
                    BtnAdd.Visible = True
                End If
                Dim BtnEdit As ImageButton = e.Row.FindControl("BtnEdit")
                If BtnEdit IsNot Nothing Then
                    BtnEdit.Visible = False
                End If
                e.Row.BackColor = Drawing.Color.Aqua
                Dim hcell As New TableCell
                Dim tb As New TextBox
                tb.ID = "NEW"
                tb.Text = "Add"
                tb.Width = 0
                tb.ReadOnly = True
                hcell.Controls.Add(tb)
                e.Row.Cells.Add(hcell)
            End If

        End If

    End Sub
    Protected Sub UpdateData()
        'For i = 0 To Request.Form.Count - 1
        '    Response.Write(Request.Form.Item(i).)
        '    Response.Write(Request.Form(i).ToString() & "<br>")
        'Next
        ''  แสดง request ทั้งหมด
        'For Each key As String In Request.Form
        '    Response.Write(key & " = " + Request.Form(key) & "<br>")
        'Next

        'Exit Sub

        showData()
        'Response.Write("index=" & GridViewTable.EditIndex)

        ' กำหนดให้ + 2 เนื่องจาก control ใน grid เริ่มจาก 2
        Dim row = GridViewTable.EditIndex + 2
        Dim srow As String = "00" & row
        srow = Right(srow, 2)
        ' Response.Write(srow)
        Dim fcol As New ArrayList
        Dim fval As New ArrayList

        For i = 0 To GridViewTable.HeaderRow.Cells.Count - 1

            Dim si As String = "00" & i - 1
            si = Right(si, 2)
            Dim sCol As String = GridViewTable.HeaderRow.Cells(i).Text

            ' Response.Write("sCol=" & sCol & "</br>")
            ' แถวแรกของ header จะส่งค่า "&nbsp; ออกมา
            If sCol <> "&nbsp;" Then
                'Response.Write(sCol & "=")
                'Response.Write(Request.Form("GridViewTable$ctl" & srow & "$ctl" & si) & "<br>")
                Dim val = Request.Form("GridViewTable$ctl" & srow & "$ctl" & si)
                fcol.Add(sCol)
                If val = "" Then
                    val = " "
                ElseIf val = "on" Then
                    val = "1"
                End If
                fval.Add(val)
            End If
            'Response.Write(GridViewTable.HeaderRow.Cells(i).Text & "=" & Request.Form("GridViewTable$ctl0" & srow & "$ctl0" & si) & "<br>")
        Next
        ' รับค่า status  new จาก textbox สุดท้ายในตาราง สร้างขึ้นจาก record สุดท้ายที่กำหนดให้เป็นการเพิ่ม
        Dim StatusNew = Request.Form("GridViewTable$ctl" & srow & "$NEW")



        ' สร้าง sql โดยวนตามจำนวน field
        Dim sql As String
        ' ถ้าตาราง pi
        If StatusNew = "Add" Then

            Dim strCol As String = ""
            Dim strVal As String = ""
            For i = 0 To fcol.Count - 1
                If i <> fcol.Count - 1 Then
                    strCol += fcol.Item(i).ToString & ","
                    strVal += "'" & fval.Item(i) & "',"
                Else
                    strCol += fcol.Item(i).ToString
                    strVal += "'" & fval.Item(i) & "'"
                End If
            Next


            sql = "INSERT INTO " & strTable
            sql += "(" & strCol & ") VALUES (" & strVal & ")"
        Else ' statusNew = "" 

            Dim strUpdate As String = ""
            Dim strWhere As String = ""
            Dim nK As Integer    ' นับจำนวนว่ามี key เท่าไรแล้ว
            nK = 0
            For i = 0 To fcol.Count - 1
                ' สร้าง str updae ตามจำนวน column
                If i <> fcol.Count - 1 Then
                    strUpdate += fcol.Item(i).ToString & "='" & fval.Item(i).ToString & "',"
                Else
                    strUpdate += fcol.Item(i).ToString & "='" & fval.Item(i).ToString & "'"
                End If

                ' ตรวจสอบถ้า column ไหนเป็น key นำค่ามาเป็น where

                For k = 0 To arrKey.Count - 1
                    If fcol.Item(i).ToString = arrKey.Item(k).ToString Then
                        'Response.Write("nk=" & nK)
                        If nK = 0 Then
                            strWhere += fcol.Item(i).ToString & "='" & fval.Item(i).ToString & "'"
                            nK = 1
                        Else
                            strWhere += " AND " & fcol.Item(i).ToString & "='" & fval.Item(i).ToString & "'"
                        End If

                        'Response.Write(strWhere)

                    End If
                Next


            Next


            sql = "UPDATE " & strTable
            sql += " SET " & strUpdate
            sql += " WHERE " & strWhere
        End If

        TextBoxSQL.Text = sql



    End Sub
    Protected Sub DeleteData()
        'For i = 0 To Request.Form.Count - 1
        '    Response.Write(Request.Form.Item(i).)
        '    Response.Write(Request.Form(i).ToString() & "<br>")
        'Next
        '  แสดง request ทั้งหมด
        'For Each key As String In Request.Form
        '    Response.Write(key & " = " + Request.Form(key) & "<br>")
        'Next


        showData()
        'Response.Write("index=" & GridViewTable.EditIndex)

        ' กำหนดให้ + 2 เนื่องจาก control ใน grid เริ่มจาก 2
        Dim row = GridViewTable.EditIndex + 2
        Dim srow As String = "00" & row
        srow = Right(srow, 2)
        ' Response.Write(srow)
        Dim fcol As New ArrayList
        Dim fval As New ArrayList

        For i = 0 To GridViewTable.HeaderRow.Cells.Count - 1

            Dim si As String = "00" & i - 1
            si = Right(si, 2)
            Dim sCol As String = GridViewTable.HeaderRow.Cells(i).Text

            ' Response.Write("sCol=" & sCol & "</br>")
            ' แถวแรกของ header จะส่งค่า "&nbsp; ออกมา
            If sCol <> "&nbsp;" Then
                'Response.Write(sCol & "=")
                'Response.Write(Request.Form("GridViewTable$ctl" & srow & "$ctl" & si) & "<br>")
                Dim val = Request.Form("GridViewTable$ctl" & srow & "$ctl" & si)
                fcol.Add(sCol)
                fval.Add(val)
            End If
            'Response.Write(GridViewTable.HeaderRow.Cells(i).Text & "=" & Request.Form("GridViewTable$ctl0" & srow & "$ctl0" & si) & "<br>")
        Next
        ' รับค่า status  new จาก textbox สุดท้ายในตาราง สร้างขึ้นจาก record สุดท้ายที่กำหนดให้เป็นการเพิ่ม


        ' สร้าง sql โดยวนตามจำนวน field
        Dim sql As String
        ' ถ้าตาราง pi


        Dim strUpdate As String = ""
        Dim strWhere As String = ""
        Dim nK As Integer = 0  ' นับจำนวนว่ามี key เท่าไรแล้ว
        For i = 0 To fcol.Count - 1

            ' ตรวจสอบถ้า column ไหนเป็น key นำค่ามาเป็น where

            For k = 0 To arrKey.Count - 1
                If fcol.Item(i).ToString = arrKey.Item(k).ToString Then
                    'Response.Write("nk=" & nK)
                    If nK = 0 Then
                        strWhere += fcol.Item(i).ToString & "='" & fval.Item(i).ToString & "'"
                    Else
                        strWhere += " AND " & fcol.Item(i).ToString & "='" & fval.Item(i).ToString & "'"
                    End If
                    nK = 1
                    'Response.Write(strWhere)
                End If
            Next
        Next

        sql = "DELETE " & strTable
        sql += " WHERE " & strWhere

        TextBoxSQL.Text = sql
    End Sub
    Sub ChangeIndex(sender As Object, e As GridViewPageEventArgs)
        GridViewTable.PageIndex = e.NewPageIndex
        showData()
    End Sub
    Sub showData()


        If strTable = "" Then
            Exit Sub
        End If
        Dim stringForm = "Select * from " & strTable

        SqlDataSourceTable.ConnectionString = ConnString
        SqlDataSourceTable.SelectCommand = stringForm
        SqlDataSourceTable.SelectCommandType = SqlDataSourceCommandType.Text


        Dim DvData As New Data.DataView
        DvData = CType(SqlDataSourceTable.Select(DataSourceSelectArguments.Empty), Data.DataView)

        ' เพิ่ม record สำหรับ update
        NumRecord = DvData.Count
        DvData.AddNew()
        Dim DtData As System.Data.DataTable = DvData.Table

        'Response.Write("rows=" & DtData.Rows.Count)
        'Session("DvData") = DvData

        GridViewTable.DataSource = DvData
        GridViewTable.DataBind()

        TextBoxSQL.Text = ""

        ' ดึงข้อมูล key ของตารางใช้สำหรับ update
        Dim stringKey = " SELECT column_name "
        stringKey += " FROM  INFORMATION_SCHEMA.KEY_COLUMN_USAGE "
        stringKey += " WHERE OBJECTPROPERTY(OBJECT_ID(constraint_name), 'IsPrimaryKey') = 1"
        stringKey += " AND table_name = '" & strTable & "'"
        SqlDataSourceKey.ConnectionString = ConnString
        SqlDataSourceKey.SelectCommand = stringKey
        SqlDataSourceKey.SelectCommandType = SqlDataSourceCommandType.Text

        Dim keyView As New Data.DataView
        keyView = CType(SqlDataSourceKey.Select(DataSourceSelectArguments.Empty), Data.DataView)
        arrKey = New ArrayList
        For i = 0 To keyView.Count - 1
            arrKey.Add(keyView.Table.Rows(i).Item("column_name"))
            ' Response.Write(keyView.Table.Rows(i).Item("column_name"))

        Next

    End Sub


    Protected Sub BtnRun_Click(sender As Object, e As System.EventArgs) Handles BtnRun.Click
        Dim conn As SqlConnection = Nothing
        conn = ConnectionUtil.getSqlConnectionFromWebConfig()
        Dim Sql As String = TextBoxSQL.Text
        Dim sqlCmd As New SqlCommand(Sql, conn)
        sqlCmd.CommandType = CommandType.Text
        Try
            sqlCmd.ExecuteNonQuery()
        Catch ex As Exception
            Response.Write(ex.Message)
        Finally

            sqlCmd.Dispose()
            conn.Close()

            Response.Write("Complete")
            showData()
            GridViewTable.EditIndex = -1

        End Try

    End Sub

    Protected Sub ButtonRunSQLSelect_Click(sender As Object, e As System.EventArgs) Handles ButtonRunSQLSelect.Click
        If TextBoxSQLSelect.Text = "" Then Exit Sub
        strTable = " ( " & TextBoxSQLSelect.Text & " ) as E "
        showData()
    End Sub
End Class
