Option Explicit On
Option Strict On

Imports System.Data.OleDb
Imports System.Data
Imports System.Data.SqlClient
Imports System.Diagnostics
Imports System.Collections.Generic
Imports System.Globalization
Imports System.IO

Partial Class ss_import2
    Inherits System.Web.UI.Page
    Dim table As New DataTable

    Protected Sub UploadBtn_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles UploadBtn.Click

        Dim myPath = Server.MapPath("file/")
        Dim myDirInfo = New DirectoryInfo(myPath)
        Dim arrFileInfo = myDirInfo.GetFiles("*.xls")

        Dim conn As SqlConnection = Nothing

        Dim AA = 0
        Dim BB = 1
        Dim CC = 2
        Dim DD = 3
        Dim EE = 4
        Dim FF = 5
        Dim GG = 6
        Dim HH = 7
        Dim II = 8
        Dim JJ = 9
        Dim KK = 10
        Dim LL = 11
        Dim MM = 12
        Dim NN = 13
        Dim OO = 14
        Dim PP = 15



        ' กำหนดตัวแปรเพิ่ม row หรือ column กรณีที่แถวขยับ
        Dim RX As Integer  ' ตัวเพิ่ม Row
        Dim CX As Integer '  ตัวเพิ่ม Colomn 

        ' ส่วนประกาศตัวแปรตาม column ใน db
        Dim FILE_NAME As String
        Dim CIF As Integer
        Dim CIF_NAME As String
        Dim BUS_Code As String
        Dim BUS_GRP As String

        Dim RM_DEFAULT_MARGIN As Double
        Dim RM_GROSS_PROFIT As Double
        Dim RM_WORKING_CAPITAL_NEED_CAL As Double
        Dim RM_LOAN_NEED_CAL As Double
        Dim RM_WORKING_CAPITAL As Double
        Dim RM_LOAN As Double
        Dim RM_LG_AVAL As Double
        Dim RM_CURRENT_LIABILITY_BAY As Double
        Dim RM_LONG_TERM_LIABILITY_BAY As Double
        Dim RM_WORKING_CAPITAL_APPROVE_CAL As Double
        Dim RM_LOAN_APPROVE_CAL As Double
        Dim RM_WORKING_CAPITAL_DEFAULT As Double
        Dim RM_LOAN_DEFAULT As Double
        Dim RM_WORKING_CAPITAL_DEFAULT_APPROVE As Double
        Dim RM_LOAN_DEFAULT_APPROVE As Double
        Dim RM_DSCR_THIS_TIME As Double
        Dim RM_LTV_THIS_TIME As Double
        Dim RM_EBIDA_CAL As Double

        Dim RMD_DEFAULT_MARGIN As Double
        Dim RMD_GROSS_PROFIT As Double
        Dim RMD_WORKING_CAPITAL_NEED_CAL As Double
        Dim RMD_LOAN_NEED_CAL As Double
        Dim RMD_WORKING_CAPITAL As Double
        Dim RMD_LOAN As Double
        Dim RMD_LG_AVAL As Double
        Dim RMD_CURRENT_LIABILITY_BAY As Double
        Dim RMD_LONG_TERM_LIABILITY_BAY As Double
        Dim RMD_WORKING_CAPITAL_APPROVE_CAL As Double
        Dim RMD_LOAN_APPROVE_CAL As Double
        Dim RMD_WORKING_CAPITAL_DEFAULT As Double
        Dim RMD_LOAN_DEFAULT As Double
        Dim RMD_WORKING_CAPITAL_DEFAULT_APPROVE As Double
        Dim RMD_LOAN_DEFAULT_APPROVE As Double
        Dim RMD_DSCR_THIS_TIME As Double
        Dim RMD_LTV_THIS_TIME As Double
        Dim RMD_EBIDA_CAL As Double

        Dim CM_DEFAULT_MARGIN As Double
        Dim CM_GROSS_PROFIT As Double
        Dim CM_WORKING_CAPITAL_NEED_CAL As Double
        Dim CM_LOAN_NEED_CAL As Double
        Dim CM_WORKING_CAPITAL As Double
        Dim CM_LOAN As Double
        Dim CM_LG_AVAL As Double
        Dim CM_CURRENT_LIABILITY_BAY As Double
        Dim CM_LONG_TERM_LIABILITY_BAY As Double
        Dim CM_WORKING_CAPITAL_APPROVE_CAL As Double
        Dim CM_LOAN_APPROVE_CAL As Double
        Dim CM_WORKING_CAPITAL_DEFAULT As Double
        Dim CM_LOAN_DEFAULT As Double
        Dim CM_WORKING_CAPITAL_DEFAULT_APPROVE As Double
        Dim CM_LOAN_DEFAULT_APPROVE As Double
        Dim CM_DSCR_THIS_TIME As Double
        Dim CM_LTV_THIS_TIME As Double
        Dim CM_EBIDA_CAL As Double

        Dim CMD_DEFAULT_MARGIN As Double
        Dim CMD_GROSS_PROFIT As Double
        Dim CMD_WORKING_CAPITAL_NEED_CAL As Double
        Dim CMD_LOAN_NEED_CAL As Double
        Dim CMD_WORKING_CAPITAL As Double
        Dim CMD_LOAN As Double
        Dim CMD_LG_AVAL As Double
        Dim CMD_CURRENT_LIABILITY_BAY As Double
        Dim CMD_LONG_TERM_LIABILITY_BAY As Double
        Dim CMD_WORKING_CAPITAL_APPROVE_CAL As Double
        Dim CMD_LOAN_APPROVE_CAL As Double
        Dim CMD_WORKING_CAPITAL_DEFAULT As Double
        Dim CMD_LOAN_DEFAULT As Double
        Dim CMD_WORKING_CAPITAL_DEFAULT_APPROVE As Double
        Dim CMD_LOAN_DEFAULT_APPROVE As Double
        Dim CMD_DSCR_THIS_TIME As Double
        Dim CMD_LTV_THIS_TIME As Double
        Dim CMD_EBIDA_CAL As Double
        
        For Each s In arrFileInfo
            Try
                Response.Write("<br>")
                Response.Write(s.FullName & "<br>")
                'Response.Write(s.Extension)
                Dim DBconnection As OleDbConnection

                ''If s.Extension = ".xls" Then
                ''    DBconnection = New OleDbConnection( _
                ''              "Provider=Microsoft.Jet.OLEDB.4.0;" & _
                ''              "Data Source=" & s.FullName & ";" & _
                ''               "Extended Properties=""Excel 8.0;HDR=NO;IMEX=1""")
                ''    '  "Extended Properties=""Excel 8.0;HDR=Yes""")
                ''ElseIf s.Extension = ".xlsx" Then
                DBconnection = New OleDbConnection( _
                   "Provider=Microsoft.ACE.OLEDB.12.0;" & _
                   "Data Source=" & s.FullName & ";" & _
                   "Extended Properties=""Excel 12.0;HDR=NO;IMEX=1""")
                'End If


                DBconnection.Open()
                Dim SQLString As String = "SELECT * FROM [1RM$]"
                Dim DBCommand = New OleDbCommand(SQLString, DBconnection)
                Dim DBReader As IDataReader = DBCommand.ExecuteReader()


                Dim SQLString2 As String = "SELECT * FROM [2RM default$]"
                Dim DBCommand2 = New OleDbCommand(SQLString2, DBconnection)
                Dim DBReader2 As IDataReader = DBCommand2.ExecuteReader()

                Dim SQLString3 As String = "SELECT * FROM [3CM Adjust$]"
                Dim DBCommand3 = New OleDbCommand(SQLString3, DBconnection)
                Dim DBReader3 As IDataReader = DBCommand3.ExecuteReader()

                Dim SQLString4 As String = "SELECT * FROM [4CM Default$]"
                Dim DBCommand4 = New OleDbCommand(SQLString4, DBconnection)
                Dim DBReader4 As IDataReader = DBCommand4.ExecuteReader()


                Dim table As DataTable = New DataTable()
                table.Load(DBReader)

                Dim table2 As DataTable = New DataTable()
                table2.Load(DBReader2)

                Dim table3 As DataTable = New DataTable()
                table3.Load(DBReader3)

                Dim table4 As DataTable = New DataTable()
                table4.Load(DBReader4)





                '' ส่วนนี้เอา remark ออกเอาไว้ดูว่าแต่ละข้อมูลแถวที่เท่าไร
                'Response.Write("column=" & table.Columns.Count & "<br>")


                'For col = 0 To table.Columns.Count - 1
                '    Response.Write(table.Columns(col).ColumnName)
                'Next
                'Response.Write("<br>")
                'For i = 0 To table.Rows.Count - 1
                '    For j = 0 To table.Columns.Count - 1
                '        Response.Write("(" & i & "," & j & "):" & table.Rows(i).Item(j).ToString & "<br>")
                '    Next
                '    Response.Write("rows:" & i & "=" & table.Rows(i).Item(0).ToString)
                '    Response.Write("=" & table.Rows(i).Item(2).ToString)
                '    Response.Write(":" & table.Rows(i).Item(5).ToString)
                '    Response.Write("=" & table.Rows(i).Item(7).ToString & "<br>")
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


                RX = -1
                CX = -1


                Response.Write("cx=" & CX)
                If table.Rows(RX + 2).Item(CX + BB).ToString <> "" Then
                    CIF = CInt(table.Rows(RX + 2).Item(CX + BB).ToString())
                End If
                If table.Rows(RX + 2).Item(CX + CC).ToString <> "" Then
                    CIF_NAME = table.Rows(RX + 2).Item(CX + CC).ToString()
                End If
                If table.Rows(RX + 2).Item(CX + EE).ToString <> "" Then
                    BUS_Code = table.Rows(RX + 2).Item(CX + EE).ToString()
                End If
                If table.Rows(RX + 6).Item(CX + CC).ToString <> "" Then
                    BUS_GRP = table.Rows(RX + 6).Item(CX + CC).ToString()
                End If

                RM_DEFAULT_MARGIN = CDbl(table.Rows(RX + 16).Item(CX + DD).ToString().Replace("%", ""))
                RM_GROSS_PROFIT = CDbl(table.Rows(RX + 17).Item(CX + DD).ToString().Replace("%", ""))
                RM_WORKING_CAPITAL_NEED_CAL = CDbl(table.Rows(RX + 30).Item(CX + II).ToString())
                RM_LOAN_NEED_CAL = CDbl(table.Rows(RX + 31).Item(CX + II).ToString())
                RM_WORKING_CAPITAL = CDbl(table.Rows(RX + 33).Item(CX + II).ToString())
                RM_LOAN = CDbl(table.Rows(RX + 34).Item(CX + II).ToString())
                RM_LG_AVAL = CDbl(table.Rows(RX + 35).Item(CX + II))
                RM_CURRENT_LIABILITY_BAY = CDbl(table.Rows(RX + 10).Item(CX + NN).ToString())
                RM_LONG_TERM_LIABILITY_BAY = CDbl(table.Rows(RX + 15).Item(CX + NN).ToString())
                RM_WORKING_CAPITAL_APPROVE_CAL = CDbl(table.Rows(RX + 30).Item(CX + NN).ToString())
                RM_LOAN_APPROVE_CAL = CDbl(table.Rows(RX + 31).Item(CX + NN).ToString())
                RM_WORKING_CAPITAL_DEFAULT = CDbl(table.Rows(RX + 40).Item(CX + NN).ToString())
                RM_LOAN_DEFAULT = CDbl(table.Rows(RX + 41).Item(CX + NN).ToString())
                RM_WORKING_CAPITAL_DEFAULT_APPROVE = CDbl(table.Rows(RX + 43).Item(CX + NN).ToString())
                RM_LOAN_DEFAULT_APPROVE = CDbl(table.Rows(RX + 44).Item(CX + NN).ToString())
                RM_DSCR_THIS_TIME = CDbl(table.Rows(RX + 35).Item(CX + MM).ToString().Replace("%", ""))
                RM_LTV_THIS_TIME = CDbl(table.Rows(RX + 37).Item(CX + MM).ToString().Replace("%", ""))
                RM_EBIDA_CAL = CDbl(table.Rows(RX + 25).Item(CX + II).ToString())

                RMD_DEFAULT_MARGIN = CDbl(table2.Rows(RX + 16).Item(CX + DD).ToString().Replace("%", ""))
                RMD_GROSS_PROFIT = CDbl(table2.Rows(RX + 17).Item(CX + DD).ToString().Replace("%", ""))
                RMD_WORKING_CAPITAL_NEED_CAL = CDbl(table2.Rows(RX + 30).Item(CX + II).ToString())
                RMD_LOAN_NEED_CAL = CDbl(table2.Rows(RX + 31).Item(CX + II).ToString())
                RMD_WORKING_CAPITAL = CDbl(table2.Rows(RX + 33).Item(CX + II).ToString())
                RMD_LOAN = CDbl(table2.Rows(RX + 34).Item(CX + II).ToString())
                RMD_LG_AVAL = CDbl(table2.Rows(RX + 35).Item(CX + II))
                RMD_CURRENT_LIABILITY_BAY = CDbl(table2.Rows(RX + 10).Item(CX + NN).ToString())
                RMD_LONG_TERM_LIABILITY_BAY = CDbl(table2.Rows(RX + 15).Item(CX + NN).ToString())
                RMD_WORKING_CAPITAL_APPROVE_CAL = CDbl(table2.Rows(RX + 30).Item(CX + NN).ToString())
                RMD_LOAN_APPROVE_CAL = CDbl(table2.Rows(RX + 31).Item(CX + NN).ToString())
                RMD_WORKING_CAPITAL_DEFAULT = CDbl(table2.Rows(RX + 40).Item(CX + NN).ToString())
                RMD_LOAN_DEFAULT = CDbl(table2.Rows(RX + 41).Item(CX + NN).ToString())
                RMD_WORKING_CAPITAL_DEFAULT_APPROVE = CDbl(table2.Rows(RX + 43).Item(CX + NN).ToString())
                RMD_LOAN_DEFAULT_APPROVE = CDbl(table2.Rows(RX + 44).Item(CX + NN).ToString())
                RMD_DSCR_THIS_TIME = CDbl(table2.Rows(RX + 35).Item(CX + MM).ToString().Replace("%", ""))
                RMD_LTV_THIS_TIME = CDbl(table2.Rows(RX + 37).Item(CX + MM).ToString().Replace("%", ""))
                RMD_EBIDA_CAL = CDbl(table.Rows(RX + 25).Item(CX + II).ToString())


                CM_DEFAULT_MARGIN = CDbl(table3.Rows(RX + 16).Item(CX + DD).ToString().Replace("%", ""))
                CM_GROSS_PROFIT = CDbl(table3.Rows(RX + 17).Item(CX + DD).ToString().Replace("%", ""))
                CM_WORKING_CAPITAL_NEED_CAL = CDbl(table3.Rows(RX + 30).Item(CX + II).ToString())
                CM_LOAN_NEED_CAL = CDbl(table3.Rows(RX + 31).Item(CX + II).ToString())
                CM_WORKING_CAPITAL = CDbl(table3.Rows(RX + 33).Item(CX + II).ToString())
                CM_LOAN = CDbl(table3.Rows(RX + 34).Item(CX + II).ToString())
                CM_LG_AVAL = CDbl(table3.Rows(RX + 35).Item(CX + II))
                CM_CURRENT_LIABILITY_BAY = CDbl(table3.Rows(RX + 10).Item(CX + NN).ToString())
                CM_LONG_TERM_LIABILITY_BAY = CDbl(table3.Rows(RX + 15).Item(CX + NN).ToString())
                CM_WORKING_CAPITAL_APPROVE_CAL = CDbl(table3.Rows(RX + 30).Item(CX + NN).ToString())
                CM_LOAN_APPROVE_CAL = CDbl(table3.Rows(RX + 31).Item(CX + NN).ToString())
                CM_WORKING_CAPITAL_DEFAULT = CDbl(table3.Rows(RX + 40).Item(CX + NN).ToString())
                CM_LOAN_DEFAULT = CDbl(table3.Rows(RX + 41).Item(CX + NN).ToString())
                CM_WORKING_CAPITAL_DEFAULT_APPROVE = CDbl(table3.Rows(RX + 43).Item(CX + NN).ToString())
                CM_LOAN_DEFAULT_APPROVE = CDbl(table3.Rows(RX + 44).Item(CX + NN).ToString())
                CM_DSCR_THIS_TIME = CDbl(table3.Rows(RX + 35).Item(CX + MM).ToString().Replace("%", ""))
                CM_LTV_THIS_TIME = CDbl(table3.Rows(RX + 37).Item(CX + MM).ToString().Replace("%", ""))
                CM_EBIDA_CAL = CDbl(table.Rows(RX + 25).Item(CX + II).ToString())


                CMD_DEFAULT_MARGIN = CDbl(table4.Rows(RX + 16).Item(CX + DD).ToString().Replace("%", ""))
                CMD_GROSS_PROFIT = CDbl(table4.Rows(RX + 17).Item(CX + DD).ToString().Replace("%", ""))
                CMD_WORKING_CAPITAL_NEED_CAL = CDbl(table4.Rows(RX + 30).Item(CX + II).ToString())
                CMD_LOAN_NEED_CAL = CDbl(table4.Rows(RX + 31).Item(CX + II).ToString())
                CMD_WORKING_CAPITAL = CDbl(table4.Rows(RX + 33).Item(CX + II).ToString())
                CMD_LOAN = CDbl(table4.Rows(RX + 34).Item(CX + II).ToString())
                CMD_LG_AVAL = CDbl(table4.Rows(RX + 35).Item(CX + II))
                CMD_CURRENT_LIABILITY_BAY = CDbl(table4.Rows(RX + 10).Item(CX + NN).ToString())
                CMD_LONG_TERM_LIABILITY_BAY = CDbl(table4.Rows(RX + 15).Item(CX + NN).ToString())
                CMD_WORKING_CAPITAL_APPROVE_CAL = CDbl(table4.Rows(RX + 30).Item(CX + NN).ToString())
                CMD_LOAN_APPROVE_CAL = CDbl(table4.Rows(RX + 31).Item(CX + NN).ToString())
                CMD_WORKING_CAPITAL_DEFAULT = CDbl(table4.Rows(RX + 40).Item(CX + NN).ToString())
                CMD_LOAN_DEFAULT = CDbl(table4.Rows(RX + 41).Item(CX + NN).ToString())
                CMD_WORKING_CAPITAL_DEFAULT_APPROVE = CDbl(table4.Rows(RX + 43).Item(CX + NN).ToString())
                CMD_LOAN_DEFAULT_APPROVE = CDbl(table4.Rows(RX + 44).Item(CX + NN).ToString())
                CMD_DSCR_THIS_TIME = CDbl(table4.Rows(RX + 35).Item(CX + MM).ToString().Replace("%", ""))
                CMD_LTV_THIS_TIME = CDbl(table4.Rows(RX + 37).Item(CX + MM).ToString().Replace("%", ""))
                CMD_EBIDA_CAL = CDbl(table.Rows(RX + 25).Item(CX + II).ToString())



                Dim filename As String = s.Name
                If filename.Length > 255 Then
                    FILE_NAME = filename.Substring(0, 255)
                End If

                ' Response.Write("I_GROSS_PROFIT" & I_GROSS_PROFIT & "<br>")
                'Response.Write("C_EBIDA_PERCENT=" & C_EBIDA_PERCENT & ":" & "C_EBIDA=" & C_EBIDA)
                'Response.Write("C_WORKING_CAPITAL_MAX=" & C_WORKING_CAPITAL & ":" & "C_LOAN_MAX=" & C_LOAN)
                'Response.Write("A_WORKING_CAPITAL=" & A_WORKING_CAPITAL & ":" & "A_LOAN=" & A_LOAN)


                'Response.Write(table.Rows(RX + 14).Item(CX + 1).ToString & table.Rows(RX + 14).Item(CX + 3).ToString) ' กำไรจากการดำเนินงาน
                'Response.Write("ยอดขาย=" & table.Rows(RX + 7).Item(CX + 2).ToString)
                Response.Write("<br>")


                '' begin  conect db 

                Dim sqlCmd As New SqlCommand()
                Dim sql As String = Nothing

                conn = ConnectionUtil.getSqlConnectionFromWebConfig()
                sqlCmd.Connection = conn
                sqlCmd.Transaction = sqlCmd.Connection.BeginTransaction()

                Try

                    sqlCmd.Parameters.Clear()
                    sqlCmd.CommandText = "SME_S.P_SS_FINANCIAL_DATA_EXCELL_A_INSERT"
                    sqlCmd.CommandType = CommandType.StoredProcedure
                    sqlCmd.Parameters.AddWithValue("@FILE_NAME", filename)
                    sqlCmd.Parameters.AddWithValue("@CIF", CIF)
                    sqlCmd.Parameters.AddWithValue("@CIF_NAME", CIF_NAME)
                    sqlCmd.Parameters.AddWithValue("@BUS_Code", BUS_Code)
                    sqlCmd.Parameters.AddWithValue("@BUS_GRP", BUS_GRP)

                    sqlCmd.Parameters.AddWithValue("@RM_DEFAULT_MARGIN", RM_DEFAULT_MARGIN)
                    sqlCmd.Parameters.AddWithValue("@RM_GROSS_PROFIT", RM_GROSS_PROFIT)
                    sqlCmd.Parameters.AddWithValue("@RM_WORKING_CAPITAL_NEED_CAL", RM_WORKING_CAPITAL_NEED_CAL)
                    sqlCmd.Parameters.AddWithValue("@RM_LOAN_NEED_CAL", RM_LOAN_NEED_CAL)
                    sqlCmd.Parameters.AddWithValue("@RM_WORKING_CAPITAL", RM_WORKING_CAPITAL)
                    sqlCmd.Parameters.AddWithValue("@RM_LOAN", RM_LOAN)
                    sqlCmd.Parameters.AddWithValue("@RM_LG_AVAL", RM_LG_AVAL)
                    sqlCmd.Parameters.AddWithValue("@RM_CURRENT_LIABILITY_BAY", RM_CURRENT_LIABILITY_BAY)
                    sqlCmd.Parameters.AddWithValue("@RM_LONG_TERM_LIABILITY_BAY", RM_LONG_TERM_LIABILITY_BAY)
                    sqlCmd.Parameters.AddWithValue("@RM_WORKING_CAPITAL_APPROVE_CAL", RM_WORKING_CAPITAL_APPROVE_CAL)
                    sqlCmd.Parameters.AddWithValue("@RM_LOAN_APPROVE_CAL", RM_LOAN_APPROVE_CAL)
                    sqlCmd.Parameters.AddWithValue("@RM_WORKING_CAPITAL_DEFAULT", RM_WORKING_CAPITAL_DEFAULT)
                    sqlCmd.Parameters.AddWithValue("@RM_LOAN_DEFAULT", RM_LOAN_DEFAULT)
                    sqlCmd.Parameters.AddWithValue("@RM_WORKING_CAPITAL_DEFAULT_APPROVE", RM_WORKING_CAPITAL_DEFAULT_APPROVE)
                    sqlCmd.Parameters.AddWithValue("@RM_LOAN_DEFAULT_APPROVE", RM_LOAN_DEFAULT_APPROVE)
                    sqlCmd.Parameters.AddWithValue("@RM_DSCR_THIS_TIME", RM_DSCR_THIS_TIME)
                    sqlCmd.Parameters.AddWithValue("@RM_LTV_THIS_TIME", RM_LTV_THIS_TIME)
                    sqlCmd.Parameters.AddWithValue("@RM_EBIDA_CAL", RM_EBIDA_CAL)

                    sqlCmd.Parameters.AddWithValue("@RMD_DEFAULT_MARGIN", RMD_DEFAULT_MARGIN)
                    sqlCmd.Parameters.AddWithValue("@RMD_GROSS_PROFIT", RMD_GROSS_PROFIT)
                    sqlCmd.Parameters.AddWithValue("@RMD_WORKING_CAPITAL_NEED_CAL", RMD_WORKING_CAPITAL_NEED_CAL)
                    sqlCmd.Parameters.AddWithValue("@RMD_LOAN_NEED_CAL", RMD_LOAN_NEED_CAL)
                    sqlCmd.Parameters.AddWithValue("@RMD_WORKING_CAPITAL", RMD_WORKING_CAPITAL)
                    sqlCmd.Parameters.AddWithValue("@RMD_LOAN", RMD_LOAN)
                    sqlCmd.Parameters.AddWithValue("@RMD_LG_AVAL", RMD_LG_AVAL)
                    sqlCmd.Parameters.AddWithValue("@RMD_CURRENT_LIABILITY_BAY", RMD_CURRENT_LIABILITY_BAY)
                    sqlCmd.Parameters.AddWithValue("@RMD_LONG_TERM_LIABILITY_BAY", RMD_LONG_TERM_LIABILITY_BAY)
                    sqlCmd.Parameters.AddWithValue("@RMD_WORKING_CAPITAL_APPROVE_CAL", RMD_WORKING_CAPITAL_APPROVE_CAL)
                    sqlCmd.Parameters.AddWithValue("@RMD_LOAN_APPROVE_CAL", RMD_LOAN_APPROVE_CAL)
                    sqlCmd.Parameters.AddWithValue("@RMD_WORKING_CAPITAL_DEFAULT", RMD_WORKING_CAPITAL_DEFAULT)
                    sqlCmd.Parameters.AddWithValue("@RMD_LOAN_DEFAULT", RMD_LOAN_DEFAULT)
                    sqlCmd.Parameters.AddWithValue("@RMD_WORKING_CAPITAL_DEFAULT_APPROVE", RMD_WORKING_CAPITAL_DEFAULT_APPROVE)
                    sqlCmd.Parameters.AddWithValue("@RMD_LOAN_DEFAULT_APPROVE", RMD_LOAN_DEFAULT_APPROVE)
                    sqlCmd.Parameters.AddWithValue("@RMD_DSCR_THIS_TIME", RMD_DSCR_THIS_TIME)
                    sqlCmd.Parameters.AddWithValue("@RMD_LTV_THIS_TIME", RMD_LTV_THIS_TIME)
                    sqlCmd.Parameters.AddWithValue("@RMD_EBIDA_CAL", RMD_EBIDA_CAL)

                    sqlCmd.Parameters.AddWithValue("@CM_DEFAULT_MARGIN", CM_DEFAULT_MARGIN)
                    sqlCmd.Parameters.AddWithValue("@CM_GROSS_PROFIT", CM_GROSS_PROFIT)
                    sqlCmd.Parameters.AddWithValue("@CM_WORKING_CAPITAL_NEED_CAL", CM_WORKING_CAPITAL_NEED_CAL)
                    sqlCmd.Parameters.AddWithValue("@CM_LOAN_NEED_CAL", CM_LOAN_NEED_CAL)
                    sqlCmd.Parameters.AddWithValue("@CM_WORKING_CAPITAL", CM_WORKING_CAPITAL)
                    sqlCmd.Parameters.AddWithValue("@CM_LOAN", CM_LOAN)
                    sqlCmd.Parameters.AddWithValue("@CM_LG_AVAL", CM_LG_AVAL)
                    sqlCmd.Parameters.AddWithValue("@CM_CURRENT_LIABILITY_BAY", CM_CURRENT_LIABILITY_BAY)
                    sqlCmd.Parameters.AddWithValue("@CM_LONG_TERM_LIABILITY_BAY", CM_LONG_TERM_LIABILITY_BAY)
                    sqlCmd.Parameters.AddWithValue("@CM_WORKING_CAPITAL_APPROVE_CAL", CM_WORKING_CAPITAL_APPROVE_CAL)
                    sqlCmd.Parameters.AddWithValue("@CM_LOAN_APPROVE_CAL", CM_LOAN_APPROVE_CAL)
                    sqlCmd.Parameters.AddWithValue("@CM_WORKING_CAPITAL_DEFAULT", CM_WORKING_CAPITAL_DEFAULT)
                    sqlCmd.Parameters.AddWithValue("@CM_LOAN_DEFAULT", CM_LOAN_DEFAULT)
                    sqlCmd.Parameters.AddWithValue("@CM_WORKING_CAPITAL_DEFAULT_APPROVE", CM_WORKING_CAPITAL_DEFAULT_APPROVE)
                    sqlCmd.Parameters.AddWithValue("@CM_LOAN_DEFAULT_APPROVE", CM_LOAN_DEFAULT_APPROVE)
                    sqlCmd.Parameters.AddWithValue("@CM_DSCR_THIS_TIME", CM_DSCR_THIS_TIME)
                    sqlCmd.Parameters.AddWithValue("@CM_LTV_THIS_TIME", CM_LTV_THIS_TIME)
                    sqlCmd.Parameters.AddWithValue("@CM_EBIDA_CAL", CM_EBIDA_CAL)

                    sqlCmd.Parameters.AddWithValue("@CMD_DEFAULT_MARGIN", CMD_DEFAULT_MARGIN)
                    sqlCmd.Parameters.AddWithValue("@CMD_GROSS_PROFIT", CMD_GROSS_PROFIT)
                    sqlCmd.Parameters.AddWithValue("@CMD_WORKING_CAPITAL_NEED_CAL", CMD_WORKING_CAPITAL_NEED_CAL)
                    sqlCmd.Parameters.AddWithValue("@CMD_LOAN_NEED_CAL", CMD_LOAN_NEED_CAL)
                    sqlCmd.Parameters.AddWithValue("@CMD_WORKING_CAPITAL", CMD_WORKING_CAPITAL)
                    sqlCmd.Parameters.AddWithValue("@CMD_LOAN", CMD_LOAN)
                    sqlCmd.Parameters.AddWithValue("@CMD_LG_AVAL", CMD_LG_AVAL)
                    sqlCmd.Parameters.AddWithValue("@CMD_CURRENT_LIABILITY_BAY", CMD_CURRENT_LIABILITY_BAY)
                    sqlCmd.Parameters.AddWithValue("@CMD_LONG_TERM_LIABILITY_BAY", CMD_LONG_TERM_LIABILITY_BAY)
                    sqlCmd.Parameters.AddWithValue("@CMD_WORKING_CAPITAL_APPROVE_CAL", CMD_WORKING_CAPITAL_APPROVE_CAL)
                    sqlCmd.Parameters.AddWithValue("@CMD_LOAN_APPROVE_CAL", CMD_LOAN_APPROVE_CAL)
                    sqlCmd.Parameters.AddWithValue("@CMD_WORKING_CAPITAL_DEFAULT", CMD_WORKING_CAPITAL_DEFAULT)
                    sqlCmd.Parameters.AddWithValue("@CMD_LOAN_DEFAULT", CMD_LOAN_DEFAULT)
                    sqlCmd.Parameters.AddWithValue("@CMD_WORKING_CAPITAL_DEFAULT_APPROVE", CMD_WORKING_CAPITAL_DEFAULT_APPROVE)
                    sqlCmd.Parameters.AddWithValue("@CMD_LOAN_DEFAULT_APPROVE", CMD_LOAN_DEFAULT_APPROVE)
                    sqlCmd.Parameters.AddWithValue("@CMD_DSCR_THIS_TIME", CMD_DSCR_THIS_TIME)
                    sqlCmd.Parameters.AddWithValue("@CMD_LTV_THIS_TIME", CMD_LTV_THIS_TIME)
                    sqlCmd.Parameters.AddWithValue("@CMD_EBIDA_CAL", CMD_EBIDA_CAL)

                    sqlCmd.ExecuteNonQuery()

                    sqlCmd.Transaction.Commit()
                    Response.Write(" Insert data complete " & s.FullName & "<br>")

                    '  s.MoveTo(myPath & "/complete/" & s.Name)
                Catch ex As Exception
                    sqlCmd.Transaction.Rollback()
                    Response.Write(" Error:" & ex.Message & s.FullName & "<br>")

                    ' s.MoveTo(myPath & "/dup/" & s.Name)     
                End Try


                ' end  begin  conect db 


            Catch ex As Exception
                Response.Write(" Error:" & ex.Message & s.FullName & "<br>")

            End Try

        Next  ' for each

        'If (conn.State = ConnectionState.Open) Then
        '    conn.Close()
        'End If
        'conn = Nothing




    End Sub


    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

    End Sub
End Class
