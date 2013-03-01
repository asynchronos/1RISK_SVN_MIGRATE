Imports System.Data
Imports System.Data.SqlClient
Imports System.Globalization
Partial Class smes_financial_checklist
    Inherits System.Web.UI.Page
    Shared Result_A As Integer
    Shared Result_R As Integer
    Shared Result_O As Integer
    Shared Result_E As Integer


    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Not Page.IsPostBack Then
            showCheckLIst()
            showStauts()
        End If
    End Sub
    Sub showStauts()
        Dim conn As SqlConnection = Nothing
        conn = ConnectionUtil.getSqlConnectionFromWebConfig()
        Dim Sql As String = "SME_S.P_SS_FINANCIAL_MAIN_SELECT_STATUS"
        Dim sqlCmd As New SqlCommand(Sql, conn)
        sqlCmd.CommandType = CommandType.StoredProcedure
        sqlCmd.Prepare()
        sqlCmd.Parameters.AddWithValue("@SMES_ID", Request.QueryString("SMES_ID"))
        Dim reader As SqlDataReader = sqlCmd.ExecuteReader()
        While reader.Read()
            If IsDBNull(reader("SMES_STATUS")) = False Then
                If reader("SMES_STATUS") < 3 Then
                    ConfirmLabe.Visible = False
                    If ResultLabel.Text = "REJECT" Or ResultLabel.Text = "OUT OF SCOPE" Then
                        RejectButton.Visible = True
                        NextButton.Visible = False
                    End If
                    If ResultLabel.Text = "ESCALATE TO >=VP" Or ResultLabel.Text = "ACCEPTABLE" Then
                        RejectButton.Visible = False
                        NextButton.Visible = True
                    End If
                ElseIf reader("SMES_STATUS") = 3 Then
                    ConfirmLabe.Text = "Confirm reject (ไม่ผ่าน checklist)"
                    ConfirmLabe.Visible = True
                    RejectButton.Visible = False
                    NextButton.Visible = False
                ElseIf reader("SMES_STATUS") >= 4 Then
                    ConfirmLabe.Text = "Confirm pass check list (ผ่านการตรวจสอบ checklist)"
                    ConfirmLabe.Visible = True
                    RejectButton.Visible = False
                    NextButton.Visible = False
                End If
            End If
        End While


    End Sub
    Sub clearResult()
        Result_A = 0
        Result_R = 0
        Result_O = 0
        Result_E = 0
    End Sub
    Sub countResult(ByVal Result As String)
        If Result = "A" Then
            Result_A = Result_A + 1
        ElseIf Result = "R" Then
            Result_R = Result_R + 1
        ElseIf Result = "O" Then
            Result_O = Result_O + 1
        ElseIf Result = "E" Then
            Result_E = Result_E + 1
        End If
    End Sub
    Sub showResult()

        ' เรียงตามความสำคัญของการกรองข้อมูลออก

        If Result_R > 0 Then
            ResultLabel.Text = "REJECT"
        ElseIf Result_O > 0 Then
            ResultLabel.Text = "OUT OF SCOPE"
        ElseIf Result_E > 0 Then
            ResultLabel.Text = "ESCALATE TO >=VP"
        ElseIf Result_A > 0 Then
            ResultLabel.Text = "ACCEPTABLE"
        End If

        'กำหนดให้ทุกกรณ๊สามารถ key template ได้
        RejectButton.Visible = False
        NextButton.Visible = True



        'Dim score As String = "<br>R=" & Result_R & "O=" & Result_O & "E=" & Result_E & "A=" & Result_A
        'ResultLabel.Text += score
    End Sub
    Sub showCheckLIst()
        ' ประกาศตัวแปร A,R,O,E
        Dim A As String
        Dim R As Boolean

        Dim conn As SqlConnection = Nothing
        Try
            conn = ConnectionUtil.getSqlConnectionFromWebConfig()
            Dim Sql As String = "SME_S.P_SS_FINANCIAL_MAIN_SELECT_CHECKLIST"
            Dim sqlCmd As New SqlCommand(Sql, conn)
            sqlCmd.CommandType = CommandType.StoredProcedure
            sqlCmd.Prepare()
            Dim SMES_ID_PARM As SqlParameter = sqlCmd.Parameters.AddWithValue("@SMES_ID", Request.QueryString("SMES_ID"))

            Dim reader As SqlDataReader = sqlCmd.ExecuteReader()

            While reader.Read()
                '   Console.WriteLine(String.Format("{0}, {1}", reader(0), reader(1)))
                clearResult()

                If IsDBNull(reader("BUSINESS_NAME")) = False Then
                    BusinessLabel.Text = reader("BUSINESS_NAME")
                End If
                If IsDBNull(reader("BUSINESS_GROUP_NAME")) = False Then
                    IndustryLabel.Text = reader("BUSINESS_GROUP_NAME")
                End If

                If IsDBNull(reader("PURPOSE_LIST_NAME")) = False Then
                    PurposeLabel.Text = reader("PURPOSE_LIST_NAME")
                End If
                If IsDBNull(reader("PURPOSE_LIST_RESULT")) = False Then
                    PurposeResultLabel.Text = reader("PURPOSE_LIST_RESULT")
                    countResult(PurposeResultLabel.Text)
                End If

                'If IsDBNull(reader("INVEST_IN")) = False Then
                '    InvestInLabel.Text = reader("INVEST_IN")
                'End If
                'If IsDBNull(reader("INVEST_IN_RESULT")) = False Then
                '    InvestInResultLabel.Text = reader("INVEST_IN_RESULT")
                '    countResult(InvestInResultLabel.Text)
                'End If

                If IsDBNull(reader("TENOR")) = False Then
                    TenorLabel.Text = reader("TENOR")
                End If
                If IsDBNull(reader("TENOR_RESULT")) = False Then
                    TenorResultLabel.Text = reader("TENOR_RESULT")
                    countResult(TenorResultLabel.Text)
                End If

                ' ส่วนนี้คือ ส่วนที่เอาออกไปหลังจากเปลี่ยนไปดูตรง checklist

                'If IsDBNull(reader("COLLATERAL_TYPE_LIST_NAME")) = False Then
                '    CollateralLabel.Text = reader("COLLATERAL_TYPE_LIST_NAME")
                'End If
                'If IsDBNull(reader("COLLATERAL_TYPE_LIST_RESULT")) = False Then
                '    CollateralResultLabel.Text = reader("COLLATERAL_TYPE_LIST_RESULT")
                '    countResult(CollateralResultLabel.Text)
                'End If

                'If IsDBNull(reader("INDUS_WATH_LIST_NAME")) = False Then
                '    IndusWathLabel.Text = reader("INDUS_WATH_LIST_NAME")
                'End If

                'If IsDBNull(reader("INDUS_WATH_LIST_RESULT")) = False Then
                '    IndusWathResultLabel.Text = reader("INDUS_WATH_LIST_RESULT")
                '    countResult(IndusWathResultLabel.Text)
                'End If

                'If IsDBNull(reader("NET_PROFIT_LIST_NAME")) = False Then
                '    NetProfitLabel.Text = reader("NET_PROFIT_LIST_NAME")
                'End If
                'If IsDBNull(reader("NET_PROFIT_LIST_RESULT")) = False Then
                '    NetProfitResultLabel.Text = reader("NET_PROFIT_LIST_RESULT")
                '    countResult(NetProfitResultLabel.Text)
                'End If

                ' ยกไปคำนวณ ต่อที่หน้า สรุปรวม

                'If IsDBNull(reader("DEBT_EBITDA")) = False Then
                '    DebtEbidaLabel.Text = reader("DEBT_EBITDA")
                'End If
                'If IsDBNull(reader("DEBT_EBITDA_RESULT")) = False Then
                '    DebtEbidaResultLabel.Text = reader("DEBT_EBITDA_RESULT")
                '    countResult(DebtEbidaResultLabel.Text)
                'End If
                'If IsDBNull(reader("DEBT_EQUITY")) = False Then
                '    DebtEquityLabel.Text = reader("DEBT_EQUITY")
                'End If
                'If IsDBNull(reader("DEBT_EQUITY_RESULT")) = False Then
                '    DebtEquityResultLabel.Text = reader("DEBT_EQUITY_RESULT")
                '    countResult(DebtEquityResultLabel.Text)
                'End If
                'If IsDBNull(reader("DSCR")) = False Then
                '    DSCRLabel.Text = reader("DSCR")
                'End If
                'If IsDBNull(reader("DSCR_RESULT")) = False Then
                '    DSCRResultLabel.Text = reader("DSCR_RESULT")
                '    countResult(DSCRResultLabel.Text)
                'End If
                'If IsDBNull(reader("LTV_PERCENT_TEXT")) = False Then
                '    LTVLabel.Text = reader("LTV_PERCENT_TEXt")
                'End If
                'If IsDBNull(reader("LTV_RESULT")) = False Then
                '    LTVResultLabel.Text = reader("LTV_RESULT")
                '    countResult(LTVResultLabel.Text)
                'End If


            End While


            reader.Close()
            sqlCmd.Parameters.Clear()
            sqlCmd.CommandText = "SME_S.P_SS_FINANCIAL_CUSTOMER_SELECT_CIF_CHECKLIST"
            sqlCmd.CommandType = CommandType.StoredProcedure
            sqlCmd.Parameters.Add(SMES_ID_PARM)
            reader = sqlCmd.ExecuteReader()
            Dim dt As DataTable = New DataTable()
            dt.Load(reader)


            CustomersGridView.DataSource = dt
            CustomersGridView.DataBind()


            '' นับจำนวนผลลัพท์
            For i = 0 To dt.Rows.Count - 1

                If IsDBNull(dt.Rows(i).Item("AGE_RESULT")) = False Then countResult(dt.Rows(i).Item("AGE_RESULT"))
                If IsDBNull(dt.Rows(i).Item("NATIONALITY_LIST_RESULT")) = False Then countResult(dt.Rows(i).Item("NATIONALITY_LIST_RESULT"))
                If IsDBNull(dt.Rows(i).Item("JURISTICT_LIST_RESULT")) = False Then countResult(dt.Rows(i).Item("JURISTICT_LIST_RESULT"))
                If IsDBNull(dt.Rows(i).Item("EXPERIENCE_RESULT")) = False Then countResult(dt.Rows(i).Item("EXPERIENCE_RESULT"))
                ' If IsDBNull(dt.Rows(i).Item("BLACKLIST_LIST_RESULT")) = False Then countResult(dt.Rows(i).Item("BLACKLIST_LIST_RESULT"))
                If IsDBNull(dt.Rows(i).Item("NCB_LIST_RESULT")) = False Then countResult(dt.Rows(i).Item("NCB_LIST_RESULT"))
                If IsDBNull(dt.Rows(i).Item("NCB_CODE_RESULT")) = False Then countResult(dt.Rows(i).Item("NCB_CODE_RESULT"))
                '  If IsDBNull(dt.Rows(i).Item("TDR_LIST_RESULT")) = False Then countResult(dt.Rows(i).Item("TDR_LIST_RESULT"))
                '  If IsDBNull(dt.Rows(i).Item("RATING_LIST_RESULT")) = False Then countResult(dt.Rows(i).Item("RATING_LIST_RESULT"))
                '  If IsDBNull(dt.Rows(i).Item("LEGAL_LIST_RESULT")) = False Then countResult(dt.Rows(i).Item("LEGAL_LIST_RESULT"))
                ' เปลี่ยนไม่ใช้ crieteria นี้ 28/1/2556
                'If IsDBNull(dt.Rows(i).Item("REGIS_DOC_LIST_RESULT")) = False Then countResult(dt.Rows(i).Item("REGIS_DOC_LIST_RESULT"))
                'If IsDBNull(dt.Rows(i).Item("SHaREHOLDER_LIST_RESULT")) = False Then countResult(dt.Rows(i).Item("SHaREHOLDER_LIST_RESULT"))
                If IsDBNull(dt.Rows(i).Item("DPD_RESULT")) = False Then countResult(dt.Rows(i).Item("DPD_RESULT"))

            Next

            reader.Close()
            dt.Clear()
            conn.Close()

            showResult()

        Catch ex As Exception
            Response.Write(ex.Message)
        Finally
            If (conn.State = ConnectionState.Open) Then
                conn.Close()
            End If
            conn = Nothing
        End Try

    End Sub

    Protected Sub RejectButton_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles RejectButton.Click
        Dim jscript As String = ""
        If saveStatus(Request.QueryString("SMES_ID"), 3) = 1 Then
            jscript = jscript & "changeMenu(""" & Request.QueryString("SMES_ID") & """);"
            jscript = jscript & "showDialog('Document  Reject.');"
        Else
            jscript = jscript & "showDialog('System Error.');"
        End If
        runScirpt(jscript)
    End Sub

    Protected Sub NextButton_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles NextButton.Click
        Dim jscript As String = ""
        If saveStatus(Request.QueryString("SMES_ID"), 4) = 1 Then

            jscript = jscript & "changeMenu(""" & Request.QueryString("SMES_ID") & """);"
            jscript = jscript & "changeMainFrame(""" & Request.QueryString("SMES_ID") & """);"

        Else
            jscript = jscript & "showDialog('System Error.');"
        End If
        runScirpt(jscript)
    End Sub
    Function saveStatus(ByVal SMES_ID As Integer, ByVal STATUS_ID As Integer) As Integer
        Dim conn As SqlConnection = Nothing
        Try

            Dim sqlCmd As New SqlCommand()
            Dim sql As String = Nothing
            'Try
            conn = ConnectionUtil.getSqlConnectionFromWebConfig()

            sqlCmd.Connection = conn
            sqlCmd.Transaction = sqlCmd.Connection.BeginTransaction()
            sqlCmd.CommandText = "[SME_S].[P_SS_FINANCIAL_MAIN_UPDATE_STATUS]"
            sqlCmd.CommandType = CommandType.StoredProcedure
            sqlCmd.Parameters.AddWithValue("SMES_ID", SMES_ID)
            sqlCmd.Parameters.AddWithValue("STATUS_ID", STATUS_ID)
            sqlCmd.ExecuteNonQuery()
            sqlCmd.Transaction.Commit()
            conn.Close()
            Return 1
        Catch ex As Exception
            Return 0
        Finally
            If (conn.State = ConnectionState.Open) Then
                conn.Close()
            End If
            conn = Nothing
        End Try
    End Function
    Protected Sub runScirpt(ByVal str As String)
        str = " $(document).ready(function(){" & str & "});"
        Page.ClientScript.RegisterStartupScript(Me.GetType(), "", str, True)
    End Sub

End Class
