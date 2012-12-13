Imports System.Data
Imports System.Data.SqlClient
Imports System.Globalization
Partial Class copy_smes_financial_checklist
    Inherits System.Web.UI.Page
    Shared Result_A As Integer
    Shared Result_R As Integer
    Shared Result_O As Integer
    Shared Result_E As Integer


    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Not Page.IsPostBack Then
            showCheckLIst()
        End If
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
        'Dim score As String = "<br>R=" & Result_R & "O=" & Result_O & "E=" & Result_E & "A=" & Result_A
        'ResultLabel.Text += score
    End Sub
    Sub showCheckLIst()
        ' ประกาศตัวแปร A,R,O,E
        Dim A As String
        Dim R As Boolean

        Dim conn As SqlConnection = Nothing
        'Try
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

            If IsDBNull(reader("INVEST_IN")) = False Then
                InvestInLabel.Text = reader("INVEST_IN")
            End If
            If IsDBNull(reader("INVEST_IN_RESULT")) = False Then
                InvestInResultLabel.Text = reader("INVEST_IN_RESULT")
                countResult(InvestInResultLabel.Text)
            End If

            If IsDBNull(reader("TENOR_LIST_NAME")) = False Then
                TenorLabel.Text = reader("TENOR_LIST_NAME")
            End If
            If IsDBNull(reader("TENOR_LIST_RESULT")) = False Then
                TenorResultLabel.Text = reader("TENOR_LIST_RESULT")
                countResult(TenorResultLabel.Text)
            End If


            If IsDBNull(reader("COLLATERAL_TYPE_LIST_NAME")) = False Then
                CollateralLabel.Text = reader("COLLATERAL_TYPE_LIST_NAME")
            End If
            If IsDBNull(reader("COLLATERAL_TYPE_LIST_RESULT")) = False Then
                CollateralResultLabel.Text = reader("COLLATERAL_TYPE_LIST_RESULT")
                countResult(CollateralResultLabel.Text)
            End If

            If IsDBNull(reader("INDUS_WATH_LIST_NAME")) = False Then
                IndusWathLabel.Text = reader("INDUS_WATH_LIST_NAME")
            End If

            If IsDBNull(reader("INDUS_WATH_LIST_RESULT")) = False Then
                IndusWathResultLabel.Text = reader("INDUS_WATH_LIST_RESULT")
                countResult(IndusWathResultLabel.Text)
            End If
            If IsDBNull(reader("NET_PROFIT_LIST_NAME")) = False Then
                NetProfitLabel.Text = reader("NET_PROFIT_LIST_NAME")
            End If
            If IsDBNull(reader("NET_PROFIT_LIST_RESULT")) = False Then
                NetProfitResultLabel.Text = reader("NET_PROFIT_LIST_RESULT")
                countResult(NetProfitResultLabel.Text)
            End If

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

            If IsDBNull(dt.Rows(i).Item("BIRTH_DATE_RESULT")) = False Then countResult(dt.Rows(i).Item("BIRTH_DATE_RESULT"))
            If IsDBNull(dt.Rows(i).Item("NATIONALITY_LIST_RESULT")) = False Then countResult(dt.Rows(i).Item("NATIONALITY_LIST_RESULT"))
            If IsDBNull(dt.Rows(i).Item("JURISTICT_LIST_RESULT")) = False Then countResult(dt.Rows(i).Item("JURISTICT_LIST_RESULT"))
            If IsDBNull(dt.Rows(i).Item("EXPERIENCE_RESULT")) = False Then countResult(dt.Rows(i).Item("EXPERIENCE_RESULT"))
            If IsDBNull(dt.Rows(i).Item("BLACKLIST_LIST_RESULT")) = False Then countResult(dt.Rows(i).Item("BLACKLIST_LIST_RESULT"))
            If IsDBNull(dt.Rows(i).Item("NCB_LIST_RESULT")) = False Then countResult(dt.Rows(i).Item("NCB_LIST_RESULT"))
            If IsDBNull(dt.Rows(i).Item("NCB_CODE_RESULT")) = False Then countResult(dt.Rows(i).Item("NCB_CODE_RESULT"))
            If IsDBNull(dt.Rows(i).Item("TDR_LIST_RESULT")) = False Then countResult(dt.Rows(i).Item("TDR_LIST_RESULT"))
            If IsDBNull(dt.Rows(i).Item("RATING_LIST_RESULT")) = False Then countResult(dt.Rows(i).Item("RATING_LIST_RESULT"))
            If IsDBNull(dt.Rows(i).Item("LEGAL_LIST_RESULT")) = False Then countResult(dt.Rows(i).Item("LEGAL_LIST_RESULT"))
            If IsDBNull(dt.Rows(i).Item("REGIS_DOC_LIST_RESULT")) = False Then countResult(dt.Rows(i).Item("REGIS_DOC_LIST_RESULT"))
            If IsDBNull(dt.Rows(i).Item("SHaREHOLDER_LIST_RESULT")) = False Then countResult(dt.Rows(i).Item("SHaREHOLDER_LIST_RESULT"))

        Next

        reader.Close()
        dt.Clear()
        conn.Close()

        showResult()
    End Sub

End Class
