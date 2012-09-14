Option Explicit On
Option Strict On

Imports System.Data.OleDb
Imports System.Data
Imports System.Data.SqlClient
Imports System.Diagnostics
Imports System.Collections.Generic
Imports System.Globalization
Imports System.IO

Partial Class ss_import
    Inherits System.Web.UI.Page
    Dim table As New DataTable

    Protected Sub UploadBtn_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles UploadBtn.Click

        Dim myPath = Server.MapPath("file/")
        Dim myDirInfo = New DirectoryInfo(myPath)
        Dim arrFileInfo = myDirInfo.GetFiles("*.xls")

        Dim conn As SqlConnection = Nothing
        For Each s In arrFileInfo
            Try

                'Response.Write(s.FullName & "<br>")
                ''Response.Write(s.Extension)
                Dim DBconnection As OleDbConnection

                'If s.Extension = ".xls" Then
                '    DBconnection = New OleDbConnection( _
                '              "Provider=Microsoft.Jet.OLEDB.4.0;" & _
                '              "Data Source=" & s.FullName & ";" & _
                '               "Extended Properties=""Excel 8.0;HDR=NO;IMEX=1""")
                '    '  "Extended Properties=""Excel 8.0;HDR=Yes""")
                'ElseIf s.Extension = ".xlsx" Then
                DBconnection = New OleDbConnection( _
                   "Provider=Microsoft.ACE.OLEDB.12.0;" & _
                   "Data Source=" & s.FullName & ";" & _
                   "Extended Properties=""Excel 12.0;HDR=NO;IMEX=1""")
                'End If


                DBconnection.Open()
                Dim SQLString As String = "SELECT * FROM [คำนวณความสามารถก่อหนี้ RM$]"
                Dim DBCommand = New OleDbCommand(SQLString, DBconnection)
                Dim DBReader As IDataReader = DBCommand.ExecuteReader()


                Dim SQLString2 As String = "SELECT * FROM [คำนวณความสามารถก่อหนี้ CM$]"
                Dim DBCommand2 = New OleDbCommand(SQLString2, DBconnection)
                Dim DBReader2 As IDataReader = DBCommand2.ExecuteReader()


                Dim table As DataTable = New DataTable()
                table.Load(DBReader)


                Dim table2 As DataTable = New DataTable()
                table2.Load(DBReader2)




                ' '' ส่วนนี้เอา remark ออกเอาไว้ดูว่าแต่ละข้อมูลแถวที่เท่าไร
                'Response.Write("column=" & table.Columns.Count & "<br>")
                'For c = 0 To table.Columns.Count - 1
                '    Response.Write(table.Columns(c).ColumnName)
                'Next
                'Response.Write("<br>")
                'For i = 0 To table.Rows.Count - 1
                '    For j = 0 To table.Columns.Count - 1
                '        Response.Write("(" & i & "," & j & "):" & table.Rows(i).Item(j).ToString & "<br>")
                '    Next
                '    'Response.Write("rows:" & i & "=" & table.Rows(i).Item(0).ToString)
                '    'Response.Write("=" & table.Rows(i).Item(2).ToString)
                '    'Response.Write(":" & table.Rows(i).Item(5).ToString)
                '    'Response.Write("=" & table.Rows(i).Item(7).ToString & "<br>")
                'Next

                'For c = 0 To table2.Columns.Count - 1
                '    Response.Write(table2.Columns(c).ColumnName)
                'Next
                'Response.Write("table 2 <br>")
                'For i = 0 To table2.Rows.Count - 1
                '    For j = 0 To table2.Columns.Count - 1
                '        Response.Write("(" & i & "," & j & "):" & table2.Rows(i).Item(j).ToString & "<br>")
                '    Next
                '    'Response.Write("rows:" & i & "=" & table.Rows(i).Item(0).ToString)
                '    'Response.Write("=" & table.Rows(i).Item(2).ToString)
                '    'Response.Write(":" & table.Rows(i).Item(5).ToString)
                '    'Response.Write("=" & table.Rows(i).Item(7).ToString & "<br>")
                'Next
                'Exit Sub

                ' ตัวแปรที่ต้องการ
                ' ประเภทกลุ่มธุรกิจ

                Dim CIF As Integer
                Dim CIF_NAME As String = ""
                Dim BUS_Code As String = ""
                Dim BUS_GRP As String = ""

                Dim RM_I_GROSS_PROFIT As Double = 0
                Dim RM_C_EBIDA_PERCENT As Double = 0
                Dim RM_C_EBIDA As Double = 0
                Dim RM_C_WORKING_CAPITAL As Double = 0
                Dim RM_C_LOAN As Double = 0
                Dim RM_A_WORKING_CAPITAL As Double = 0
                Dim RM_A_LOAN As Double = 0
                Dim RM_I_WORKING_CAPITAL As Double = 0
                Dim RM_I_LOAN As Double = 0
                Dim RM_I_DSCR As Double = 0

                Dim CM_I_GROSS_PROFIT As Double = 0
                Dim CM_C_EBIDA_PERCENT As Double = 0
                Dim CM_C_EBIDA As Double = 0
                Dim CM_C_WORKING_CAPITAL As Double = 0
                Dim CM_C_LOAN As Double = 0
                Dim CM_A_WORKING_CAPITAL As Double = 0
                Dim CM_A_LOAN As Double = 0
                Dim CM_I_WORKING_CAPITAL As Double = 0
                Dim CM_I_LOAN As Double = 0
                Dim CM_I_DSCR As Double = 0



                ' กำหนดตัวแปรเพิ่ม row หรือ column กรณีที่แถวขยับ
                Dim RX As Integer  ' ตัวเพิ่ม Row
                Dim CX As Integer '  ตัวเพิ่ม Colomn 

                If table.Columns.Count < 25 Then
                    CX = -1
                Else
                    CX = 0
                End If


                If table.Rows(RX + 1).Item(CX + 1).ToString <> "" Then
                    CIF = CInt(table.Rows(RX + 1).Item(CX + 1).ToString())
                End If

                If table.Rows(RX + 1).Item(CX + 2).ToString <> "" Then
                    CIF_NAME = table.Rows(RX + 1).Item(CX + 2).ToString()
                End If
                If table.Rows(RX + 1).Item(CX + 4).ToString <> "" Then
                    BUS_Code = table.Rows(RX + 1).Item(CX + 4).ToString()

                End If
                If table.Rows(RX + 4).Item(CX + 2).ToString <> "" Then
                    BUS_GRP = table.Rows(RX + 4).Item(CX + 2).ToString()

                End If
                ' ดึงค่าจาก sheet rm
                If table.Rows(RX + 15).Item(CX + 3).ToString <> "" Then
                    RM_I_GROSS_PROFIT = CDbl(table.Rows(RX + 15).Item(CX + 3).ToString().Replace("%", ""))
                End If
                If table.Rows(RX + 23).Item(CX + 7).ToString <> "" Then
                    RM_C_EBIDA_PERCENT = CDbl(table.Rows(RX + 23).Item(CX + 7).ToString().Replace("%", ""))
                End If
                If table.Rows(RX + 23).Item(CX + 8).ToString <> "" Then
                    RM_C_EBIDA = CDbl(table.Rows(RX + 23).Item(CX + 8).ToString)
                End If
                If table.Rows(RX + 28).Item(CX + 8).ToString <> "" Then
                    RM_C_WORKING_CAPITAL = CDbl(table.Rows(RX + 28).Item(CX + 8).ToString())
                End If
                If table.Rows(RX + 29).Item(CX + 8).ToString <> "" Then
                    RM_C_LOAN = CDbl(table.Rows(RX + 29).Item(CX + 8).ToString())
                End If


                If table.Rows(RX + 28).Item(CX + 13).ToString <> "" Then
                    RM_A_WORKING_CAPITAL = CDbl(table.Rows(RX + 28).Item(CX + 13).ToString())
                End If
                If table.Rows(RX + 29).Item(CX + 13).ToString <> "" Then
                    RM_A_LOAN = CDbl(table.Rows(RX + 29).Item(CX + 13).ToString())
                End If

                If table.Rows(RX + 31).Item(CX + 8).ToString <> "" Then
                    RM_I_WORKING_CAPITAL = CDbl(table.Rows(RX + 31).Item(CX + 8).ToString())
                End If
                If table.Rows(RX + 32).Item(CX + 8).ToString <> "" Then
                    RM_I_LOAN = CDbl(table.Rows(RX + 32).Item(CX + 8).ToString())
                End If
                If table.Rows(RX + 33).Item(CX + 12).ToString <> "" Then
                    RM_I_DSCR = CDbl(table.Rows(RX + 33).Item(CX + 12).ToString())
                End If

                ' ดึงค่าจาก sheet  cm

                If table2.Rows(15).Item(CX + 3).ToString <> "" Then
                    CM_I_GROSS_PROFIT = CDbl(table2.Rows(15).Item(CX + 3).ToString().Replace("%", ""))
                End If
                If table2.Rows(23).Item(CX + 7).ToString <> "" Then
                    CM_C_EBIDA_PERCENT = CDbl(table2.Rows(23).Item(CX + 7).ToString().Replace("%", ""))
                End If
                If table2.Rows(23).Item(CX + 8).ToString <> "" Then
                    CM_C_EBIDA = CDbl(table2.Rows(23).Item(CX + 8).ToString)
                End If
                If table2.Rows(28).Item(CX + 8).ToString <> "" Then
                    CM_C_WORKING_CAPITAL = CDbl(table2.Rows(28).Item(CX + 8).ToString())
                End If
                If table2.Rows(29).Item(CX + 8).ToString <> "" Then
                    CM_C_LOAN = CDbl(table2.Rows(29).Item(CX + 8).ToString())
                End If
                If table2.Rows(28).Item(CX + 13).ToString <> "" Then
                    CM_A_WORKING_CAPITAL = CDbl(table2.Rows(28).Item(CX + 13).ToString())
                End If
                If table2.Rows(29).Item(CX + 13).ToString <> "" Then
                    CM_A_LOAN = CDbl(table2.Rows(29).Item(CX + 13).ToString())
                End If
                If table2.Rows(RX + 31).Item(CX + 8).ToString <> "" Then
                    CM_I_WORKING_CAPITAL = CDbl(table2.Rows(RX + 31).Item(CX + 8).ToString())
                End If
                If table2.Rows(RX + 32).Item(CX + 8).ToString <> "" Then
                    CM_I_LOAN = CDbl(table2.Rows(RX + 32).Item(CX + 8).ToString())
                End If

                If table2.Rows(RX + 33).Item(CX + 12).ToString <> "" Then
                    CM_I_DSCR = CDbl(table2.Rows(RX + 33).Item(CX + 12).ToString())
                End If



                Dim filename As String = s.Name
                If filename.Length > 255 Then
                    filename = filename.Substring(0, 255)
                End If

                'Response.Write("CIF=" & CIF)
                'Response.Write("CIF_NAME=" & CIF_NAME)
                'Response.Write("BUS_CODE=" & BUS_Code)
                'Response.Write("<br>")
                'Response.Write("BUS_GRP_ID=" & BUS_GRP & ":" & "I_GROSS_PROFIT" & I_GROSS_PROFIT & "<br>")
                'Response.Write("C_EBIDA_PERCENT=" & C_EBIDA_PERCENT & ":" & "C_EBIDA=" & C_EBIDA)
                'Response.Write("C_WORKING_CAPITAL_MAX=" & C_WORKING_CAPITAL & ":" & "C_LOAN_MAX=" & C_LOAN)
                'Response.Write("A_WORKING_CAPITAL=" & A_WORKING_CAPITAL & ":" & "A_LOAN=" & A_LOAN)


                'Response.Write(table.Rows(RX + 14).Item(CX + 1).ToString & table.Rows(RX + 14).Item(CX + 3).ToString) ' กำไรจากการดำเนินงาน
                'Response.Write("ยอดขาย=" & table.Rows(RX + 7).Item(CX + 2).ToString)
                'Response.Write("<br>")


                Dim sqlCmd As New SqlCommand()
                Dim sql As String = Nothing

                conn = ConnectionUtil.getSqlConnectionFromWebConfig()
                sqlCmd.Connection = conn
                sqlCmd.Transaction = sqlCmd.Connection.BeginTransaction()

                Try

                    sqlCmd.Parameters.Clear()
                    sqlCmd.CommandText = "SME_S.P_SS_FINANCIAL_DATA_EXCELL_INSERT"
                    sqlCmd.CommandType = CommandType.StoredProcedure
                    sqlCmd.Parameters.AddWithValue("@FILE_NAME", filename)
                    sqlCmd.Parameters.AddWithValue("@CIF", CIF)
                    sqlCmd.Parameters.AddWithValue("@CIF_NAME", CIF_NAME)
                    sqlCmd.Parameters.AddWithValue("@BUS_Code", BUS_Code)
                    sqlCmd.Parameters.AddWithValue("@BUS_GRP", BUS_GRP)
                    sqlCmd.Parameters.AddWithValue("@RM_I_GROSS_PROFIT", RM_I_GROSS_PROFIT)
                    sqlCmd.Parameters.AddWithValue("@CM_I_GROSS_PROFIT", CM_I_GROSS_PROFIT)
                    sqlCmd.Parameters.AddWithValue("@RM_C_EBIDA_PERCENT", RM_C_EBIDA_PERCENT)
                    sqlCmd.Parameters.AddWithValue("@CM_C_EBIDA_PERCENT", CM_C_EBIDA_PERCENT)
                    sqlCmd.Parameters.AddWithValue("@RM_C_EBIDA", RM_C_EBIDA)
                    sqlCmd.Parameters.AddWithValue("@CM_C_EBIDA", CM_C_EBIDA)
                    sqlCmd.Parameters.AddWithValue("@RM_I_WORKING_CAPITAL", RM_I_WORKING_CAPITAL)
                    sqlCmd.Parameters.AddWithValue("@CM_I_WORKING_CAPITAL", CM_I_WORKING_CAPITAL)
                    sqlCmd.Parameters.AddWithValue("@RM_I_LOAN", RM_I_LOAN)
                    sqlCmd.Parameters.AddWithValue("@CM_I_LOAN", CM_I_LOAN)
                    sqlCmd.Parameters.AddWithValue("@RM_C_WORKING_CAPITAL", RM_C_WORKING_CAPITAL)
                    sqlCmd.Parameters.AddWithValue("@CM_C_WORKING_CAPITAL", CM_C_WORKING_CAPITAL)
                    sqlCmd.Parameters.AddWithValue("@RM_C_LOAN", RM_C_LOAN)
                    sqlCmd.Parameters.AddWithValue("@CM_C_LOAN", CM_C_LOAN)
                    sqlCmd.Parameters.AddWithValue("@RM_A_WORKING_CAPITAL", RM_A_WORKING_CAPITAL)
                    sqlCmd.Parameters.AddWithValue("@CM_A_WORKING_CAPITAL", CM_A_WORKING_CAPITAL)
                    sqlCmd.Parameters.AddWithValue("@RM_A_LOAN", RM_A_LOAN)
                    sqlCmd.Parameters.AddWithValue("@CM_A_LOAN", CM_A_LOAN)
                    sqlCmd.Parameters.AddWithValue("@RM_I_DSCR", RM_I_DSCR)
                    sqlCmd.Parameters.AddWithValue("@CM_I_DSCR", CM_I_DSCR)

                    sqlCmd.ExecuteNonQuery()

                    sqlCmd.Transaction.Commit()
                    Response.Write(" Insert data complete " & s.FullName & "<br>")

                    '  s.MoveTo(myPath & "/complete/" & s.Name)
                Catch ex As Exception
                    sqlCmd.Transaction.Rollback()
                    Response.Write(" Error:" & ex.Message & s.FullName & "<br>")

                    ' s.MoveTo(myPath & "/dup/" & s.Name)     
                End Try

            Catch ex As Exception
                Response.Write(" Error:" & ex.Message & s.FullName & "<br>")

            End Try

        Next  ' for each

        If (conn.State = ConnectionState.Open) Then
            conn.Close()
        End If
        conn = Nothing




    End Sub


    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

    End Sub
End Class
