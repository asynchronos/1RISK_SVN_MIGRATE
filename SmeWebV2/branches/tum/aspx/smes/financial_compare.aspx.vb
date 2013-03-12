Imports System.Data
Imports System.Data.SqlClient
Imports System.Globalization
Partial Class smes_financial_compare
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Not Page.IsPostBack Then
            BindDropDown()
            ShowData()
            showCheckLIst()
        End If
    End Sub

    Sub ShowData()

        Dim smes_id As String = Request.QueryString("SMES_ID")

        Dim conn As SqlConnection = Nothing
        Try

            conn = ConnectionUtil.getSqlConnectionFromWebConfig()
            Dim Sql As String = "SME_S.P_SS_FINANCIAL_DATA_SELECT "
            Dim sqlCmd As New SqlCommand(Sql, conn)
            sqlCmd.CommandType = CommandType.StoredProcedure
            sqlCmd.Prepare()
            sqlCmd.Parameters.AddWithValue("@SMES_ID", smes_id)
            sqlCmd.Parameters.AddWithValue("@SMES_TYPE", 1)
            Dim reader As SqlDataReader = sqlCmd.ExecuteReader()


            While reader.Read()
                'MsgBox("data_id" & reader("SMES_DATA_ID"))
                '   Console.WriteLine(String.Format("{0}, {1}", reader(0), reader(1)))

                If IsDBNull(reader("SALES")) = False Then SALES_RMTextBox.Text = String.Format("{0:#,###.##}", reader("SALES"))
                If IsDBNull(reader("COST_OF_SALES")) = False Then COST_OF_SALES_RMTextBox.Text = String.Format("{0:n0}", reader("COST_OF_SALES"))
                If IsDBNull(reader("COST_OF_SALES_PERCENT")) = False Then COST_OF_SALES_PERCENT_RMTextBox.Text = String.Format("{0:n2}", reader("COST_OF_SALES_PERCENT"))

                If IsDBNull(reader("CREDIT_SALE")) = False Then CREDIT_SALE_RMTextBox.Text = String.Format("{0:n0}", reader("CREDIT_SALE"))
                If IsDBNull(reader("CREDIT_TERM")) = False Then CREDIT_TERM_RMTextBox.Text = String.Format("{0:n0}", reader("CREDIT_TERM"))
                If IsDBNull(reader("PURCHASE")) = False Then PURCHASE_RMTextBox.Text = String.Format("{0:n0}", reader("PURCHASE"))
                If IsDBNull(reader("CREDIT_PURCHASE")) = False Then CREDIT_PURCHASE_RMTextBox.Text = String.Format("{0:n0}", reader("CREDIT_PURCHASE"))
                If IsDBNull(reader("TERM_PURCHASE")) = False Then TERM_PURCHASE_RMTextBox.Text = String.Format("{0:n0}", reader("TERM_PURCHASE"))

                If IsDBNull(reader("OPERATING_EXPENSES")) = False Then OPERATING_EXPENSES_RMTextBox.Text = String.Format("{0:n0}", reader("OPERATING_EXPENSES"))
                If IsDBNull(reader("OPERATING_EXPENSES_PERCENT")) = False Then OPERATING_EXPENSES_PERCENT_RMTextBox.Text = String.Format("{0:n2}", reader("OPERATING_EXPENSES_PERCENT"))

                If IsDBNull(reader("DEFAULT_MARGIN")) = False Then DEFAULT_MARGIN_RMTextBox.Text = String.Format("{0:n2}", reader("DEFAULT_MARGIN"))
                If IsDBNull(reader("GROSS_PROFIT")) = False Then GROSS_PROFIT_RMTextBox.Text = String.Format("{0:n2}", reader("GROSS_PROFIT"))
                If IsDBNull(reader("TAX")) = False Then TAX_RMTextBox.Text = String.Format("{0:n0}", reader("TAX"))

                If IsDBNull(reader("INVENTORY_INTERVIEW")) = False Then INVENTORY_INTERVIEW_RMTextBox.Text = String.Format("{0:n0}", reader("INVENTORY_INTERVIEW"))
                If IsDBNull(reader("INVENTORY_VISIT")) = False Then INVENTORY_VISIT_RMTextBox.Text = String.Format("{0:n0}", reader("INVENTORY_VISIT"))
                If IsDBNull(reader("ACCOUNT_RECEIVABLE")) = False Then ACCOUNT_RECEIVABLE_RMTextBox.Text = String.Format("{0:n0}", reader("ACCOUNT_RECEIVABLE"))

                If IsDBNull(reader("CURRENT_ASSET_OTHER")) = False Then CURRENT_ASSET_OTHER_RMTextBox.Text = String.Format("{0:n0}", reader("CURRENT_ASSET_OTHER"))
                CURRENT_ASSET_OTHER_CAL_RMTextBox.Text = CURRENT_ASSET_OTHER_RMTextBox.Text

                If IsDBNull(reader("MACHINERY_EQUIPMENT")) = False Then MACHINERY_EQUIPMENT_RMTextBox.Text = String.Format("{0:n0}", reader("MACHINERY_EQUIPMENT"))
                If IsDBNull(reader("CORE_ASSETS")) = False Then CORE_ASSETS_RMTextBox.Text = String.Format("{0:n0}", reader("CORE_ASSETS"))
                If IsDBNull(reader("OTHER_FIXED_ASSETS_OTHER_BANK")) = False Then OTHER_FIXED_ASSETS_OTHER_BANK_RMTextBox.Text = String.Format("{0:n0}", reader("OTHER_FIXED_ASSETS_OTHER_BANK"))
                If IsDBNull(reader("OTHER_FIXED_ASSETS")) = False Then OTHER_FIXED_ASSETS_RMTextBox.Text = String.Format("{0:n0}", reader("OTHER_FIXED_ASSETS"))
                If IsDBNull(reader("CASH_BOND")) = False Then CASH_BOND_RMTextBox.Text = String.Format("{0:n0}", reader("CASH_BOND"))
                If IsDBNull(reader("CALCULATE_RATE")) = False Then CALCULATE_RATE_RMTextBox.Text = String.Format("{0:n2}", reader("CALCULATE_RATE"))
                If IsDBNull(reader("ACCOUNT_PAYABLE")) = False Then ACCOUNT_PAYABLE_RMTextBox.Text = String.Format("{0:n0}", reader("ACCOUNT_PAYABLE"))
                If IsDBNull(reader("CURRENT_LIABILITY_BAY")) = False Then CURRENT_LIABILITY_BAY_RMTextBox.Text = String.Format("{0:n0}", reader("CURRENT_LIABILITY_BAY"))
                If IsDBNull(reader("CURRENT_LIABILITY_OTHER_BANK")) = False Then CURRENT_LIABILITY_OTHER_BANK_RMTextBox.Text = String.Format("{0:n0}", reader("CURRENT_LIABILITY_OTHER_BANK"))
                If IsDBNull(reader("OTHER_CURRENT_LIABILITY")) = False Then OTHER_CURRENT_LIABILITY_RMTextBox.Text = String.Format("{0:n0}", reader("OTHER_CURRENT_LIABILITY"))
                If IsDBNull(reader("LONG_TERM_LIABILITY_BAY")) = False Then LONG_TERM_LIABILITY_BAY_RMTextBox.Text = String.Format("{0:n0}", reader("LONG_TERM_LIABILITY_BAY"))
                If IsDBNull(reader("LONG_TERM_LIABILITY_BAY_REPAYMENT")) = False Then LONG_TERM_LIABILITY_BAY_REPAYMENT_RMTextBox.Text = String.Format("{0:n0}", reader("LONG_TERM_LIABILITY_BAY_REPAYMENT"))
                If IsDBNull(reader("LONG_TERM_LIABILITY_OTHER_BANK")) = False Then LONG_TERM_LIABILITY_OTHER_BANK_RMTextBox.Text = String.Format("{0:n0}", reader("LONG_TERM_LIABILITY_OTHER_BANK"))
                If IsDBNull(reader("LONG_TERM_LIABILITY_OTHER_REPAYMENT")) = False Then LONG_TERM_LIABILITY_OTHER_REPAYMENT_RMTextBox.Text = String.Format("{0:n0}", reader("LONG_TERM_LIABILITY_OTHER_REPAYMENT"))
                If IsDBNull(reader("LONG_TERM_OTHER_LIABILITY")) = False Then LONG_TERM_OTHER_LIABILITY_RMTextBox.Text = String.Format("{0:n0}", reader("LONG_TERM_OTHER_LIABILITY"))
                If IsDBNull(reader("LONG_TERM_OTHER_REPAYMENT")) = False Then LONG_TERM_OTHER_REPAYMENT_RMTextBox.Text = String.Format("{0:n0}", reader("LONG_TERM_OTHER_REPAYMENT"))
                If IsDBNull(reader("LOANS_REL_CO_DIRECTORS")) = False Then LOANS_REL_CO_DIRECTORS_RMTextBox.Text = String.Format("{0:n0}", reader("LOANS_REL_CO_DIRECTORS"))
                If IsDBNull(reader("LG_AVAL_BAY")) = False Then LG_AVAL_BAY_RMTextBox.Text = String.Format("{0:n0}", reader("LG_AVAL_BAY"))
                If IsDBNull(reader("REFINANCE_WORKING_CAPITAL_OTHER")) = False Then REFINANCE_WORKING_CAPITAL_OTHER_RMTextBox.Text = String.Format("{0:n0}", reader("REFINANCE_WORKING_CAPITAL_OTHER"))
                If IsDBNull(reader("REFINANCE_WORKING_LOAN_OTHER")) = False Then REFINANCE_WORKING_LOAN_OTHER_RMTextBox.Text = String.Format("{0:n0}", reader("REFINANCE_WORKING_LOAN_OTHER"))
                If IsDBNull(reader("REFINANCE_REPAYMENT")) = False Then REFINANCE_REPAYMENT_RMTextBox.Text = String.Format("{0:n0}", reader("REFINANCE_REPAYMENT"))
                If IsDBNull(reader("WORKING_CAPITAL")) = False Then WORKING_CAPITAL_RMTextBox.Text = String.Format("{0:n0}", reader("WORKING_CAPITAL"))
                If IsDBNull(reader("LOAN")) = False Then LOAN_RMTextBox.Text = String.Format("{0:n0}", reader("LOAN"))
                If IsDBNull(reader("LG_AVAL")) = False Then LG_AVAL_RMTextBox.Text = String.Format("{0:n0}", reader("LG_AVAL"))
                If IsDBNull(reader("ASSETS_INCREASE_LOAN")) = False Then ASSETS_INCREASE_LOAN_RMTextBox.Text = String.Format("{0:n0}", reader("ASSETS_INCREASE_LOAN"))
                If IsDBNull(reader("BOND_DEPOSIT_PLEDGE_PERSON")) = False Then BOND_DEPOSIT_PLEDGE_PERSON_RMTextBox.Text = String.Format("{0:n0}", reader("BOND_DEPOSIT_PLEDGE_PERSON"))
                If IsDBNull(reader("APPRAISAL_VALUE_ZONE_A")) = False Then APPRAISAL_VALUE_ZONE_A_RMTextBox.Text = String.Format("{0:n0}", reader("APPRAISAL_VALUE_ZONE_A"))
                If IsDBNull(reader("APPRAISAL_VALUE_ZONE_B")) = False Then APPRAISAL_VALUE_ZONE_B_RMTextBox.Text = String.Format("{0:n0}", reader("APPRAISAL_VALUE_ZONE_B"))
                If IsDBNull(reader("APPRAISAL_VALUE_ZONE_C")) = False Then APPRAISAL_VALUE_ZONE_C_RMTextBox.Text = String.Format("{0:n0}", reader("APPRAISAL_VALUE_ZONE_C"))
                If IsDBNull(reader("APPRAISAL_VALUE_ZONE_D")) = False Then APPRAISAL_VALUE_ZONE_D_RMTextBox.Text = String.Format("{0:n0}", reader("APPRAISAL_VALUE_ZONE_D"))
                If IsDBNull(reader("APPRAISAL_VALUE_ZONE_E")) = False Then APPRAISAL_VALUE_ZONE_E_RMTextBox.Text = String.Format("{0:n0}", reader("APPRAISAL_VALUE_ZONE_E"))
                If IsDBNull(reader("APPRAISAL_VALUE_ZONE_F")) = False Then APPRAISAL_VALUE_ZONE_F_RMTextBox.Text = String.Format("{0:n0}", reader("APPRAISAL_VALUE_ZONE_F"))
                Dim totalAPPRAISAL_VALUE_ZONE As Decimal
                totalAPPRAISAL_VALUE_ZONE = ToDecimal(APPRAISAL_VALUE_ZONE_A_RMTextBox.Text) + ToDecimal(APPRAISAL_VALUE_ZONE_B_RMTextBox.Text) + ToDecimal(APPRAISAL_VALUE_ZONE_C_RMTextBox.Text) + ToDecimal(APPRAISAL_VALUE_ZONE_D_RMTextBox.Text) + ToDecimal(APPRAISAL_VALUE_ZONE_E_RMTextBox.Text) + ToDecimal(APPRAISAL_VALUE_ZONE_F_RMTextBox.Text)
                TOTAL_AMOUNT_OF_COLLATERAL_RMTextBox.Text = String.Format("{0:n0}", totalAPPRAISAL_VALUE_ZONE)
                If IsDBNull(reader("BOND_DEPOSIT_PLEDGE")) = False Then BOND_DEPOSIT_PLEDGE_RMTextBox.Text = String.Format("{0:n0}", reader("BOND_DEPOSIT_PLEDGE"))

                If IsDBNull(reader("CASH_BOND_CAL")) = False Then CASH_BOND_CAL_RMTextBox.Text = String.Format("{0:n0}", reader("CASH_BOND_CAL"))
                If IsDBNull(reader("ACCOUNT_RECEIVABLE_CAL")) = False Then ACCOUNT_RECEIVABLE_CAL_RMTextBox.Text = String.Format("{0:n0}", reader("ACCOUNT_RECEIVABLE_CAL"))
                If IsDBNull(reader("INVENTORY_CAL")) = False Then INVENTORY_CAL_RMTextBox.Text = String.Format("{0:n0}", reader("INVENTORY_CAL"))
                If IsDBNull(reader("TOTAL_CURRENT_ASSETS_CAL")) = False Then TOTAL_CURRENT_ASSETS_CAL_RMTextBox.Text = String.Format("{0:n0}", reader("TOTAL_CURRENT_ASSETS_CAL"))
                If IsDBNull(reader("MACHINERY_EQUIPMENT_CAL")) = False Then MACHINERY_EQUIPMENT_CAL_RMTextBox.Text = String.Format("{0:n0}", reader("MACHINERY_EQUIPMENT_CAL"))
                If IsDBNull(reader("PROPERTY_PLANT_BUILDING_CAL")) = False Then PROPERTY_PLANT_BUILDING_CAL_RMTextBox.Text = String.Format("{0:n0}", reader("PROPERTY_PLANT_BUILDING_CAL"))
                If IsDBNull(reader("OTHER_FIXED_ASSETS_CAL")) = False Then OTHER_FIXED_ASSETS_CAL_RMTextBox.Text = String.Format("{0:n0}", reader("OTHER_FIXED_ASSETS_CAL"))
                If IsDBNull(reader("OTHER_FIXED_ASSETS_OTHER_BANK_CAL")) = False Then OTHER_FIXED_ASSETS_OTHER_BANK_CAL_RMTextBox.Text = String.Format("{0:n0}", reader("OTHER_FIXED_ASSETS_OTHER_BANK_CAL"))
                If IsDBNull(reader("ASSETS_FROM_CREDIT_CAL")) = False Then ASSETS_FROM_CREDIT_CAL_RMTextBox.Text = String.Format("{0:n0}", reader("ASSETS_FROM_CREDIT_CAL"))
                If IsDBNull(reader("TOTAL_FIXED_ASSETS_CAL")) = False Then TOTAL_FIXED_ASSETS_CAL_RMTextBox.Text = String.Format("{0:n0}", reader("TOTAL_FIXED_ASSETS_CAL"))
                If IsDBNull(reader("TOTAL_ASSETS_CAL")) = False Then TOTAL_ASSETS_CAL_RMTextBox.Text = String.Format("{0:n0}", reader("TOTAL_ASSETS_CAL"))
                If IsDBNull(reader("ACCOUNT_PAYABLE_CAL")) = False Then ACCOUNT_PAYABLE_CAL_RMTextBox.Text = String.Format("{0:n0}", reader("ACCOUNT_PAYABLE_CAL"))
                If IsDBNull(reader("CURRENT_LIABILITY_BAY_CAL")) = False Then CURRENT_LIABILITY_BAY_CAL_RMTextBox.Text = String.Format("{0:n0}", reader("CURRENT_LIABILITY_BAY_CAL"))
                If IsDBNull(reader("OTHER_CURRENT_LIABILITY_CAL")) = False Then OTHER_CURRENT_LIABILITY_CAL_RMTextBox.Text = String.Format("{0:n0}", reader("OTHER_CURRENT_LIABILITY_CAL"))
                If IsDBNull(reader("TOTAL_CURRENT_LIABILITY_CAL")) = False Then TOTAL_CURRENT_LIABILITY_CAL_RMTextBox.Text = String.Format("{0:n0}", reader("TOTAL_CURRENT_LIABILITY_CAL"))
                If IsDBNull(reader("LONG_TERM_LIABILITY_BAY_CAL")) = False Then LONG_TERM_LIABILITY_BAY_CAL_RMTextBox.Text = String.Format("{0:n0}", reader("LONG_TERM_LIABILITY_BAY_CAL"))
                If IsDBNull(reader("OTHER_LONG_TERM_LIABILITY_CAL")) = False Then OTHER_LONG_TERM_LIABILITY_CAL_RMTextBox.Text = String.Format("{0:n0}", reader("OTHER_LONG_TERM_LIABILITY_CAL"))
                If IsDBNull(reader("TOTAL_LIABILITY_CAL")) = False Then TOTAL_LIABILITY_CAL_RMTextBox.Text = String.Format("{0:n0}", reader("TOTAL_LIABILITY_CAL"))
                If IsDBNull(reader("LOANS_REL_CO_DIRECTORS_CAL")) = False Then LOANS_REL_CO_DIRECTORS_CAL_RMTextBox.Text = String.Format("{0:n0}", reader("LOANS_REL_CO_DIRECTORS_CAL"))
                If IsDBNull(reader("EQUITY_CAL")) = False Then EQUITY_CAL_RMTextBox.Text = String.Format("{0:n0}", reader("EQUITY_CAL"))
                If IsDBNull(reader("LIABILITY_EQUITY_CAL")) = False Then LIABILITY_EQUITY_CAL_RMTextBox.Text = String.Format("{0:n0}", reader("LIABILITY_EQUITY_CAL"))



                If IsDBNull(reader("EBIDA_PERCENT_CAL")) = False Then EBIDA_PERCENT_CAL_RMTextBox.Text = String.Format("{0:n2}", reader("EBIDA_PERCENT_CAL"))
                If IsDBNull(reader("EBIDA_CAL")) = False Then EBIDA_CAL_RMTextBox.Text = String.Format("{0:n0}", reader("EBIDA_CAL"))
                If IsDBNull(reader("DE_BEFORE_LOAN_CAL")) = False Then DE_BEFORE_LOAN_CAL_RMTextBox.Text = String.Format("{0:n2}", reader("DE_BEFORE_LOAN_CAL"))
                If IsDBNull(reader("DSCR_BEFORE_LOAN_CAL")) = False Then DSCR_BEFORE_LOAN_CAL_RMTextBox.Text = String.Format("{0:n2}", reader("DSCR_BEFORE_LOAN_CAL"))
                If IsDBNull(reader("AR_DAY_CAL")) = False Then AR_DAY_CAL_RMTextBox.Text = String.Format("{0:n2}", reader("AR_DAY_CAL"))
                If IsDBNull(reader("INVENTORY_DAY_CAL")) = False Then INVENTORY_DAY_CAL_RMTextBox.Text = String.Format("{0:n2}", reader("INVENTORY_DAY_CAL"))
                If IsDBNull(reader("WORKING_CAPITAL_NEED_CAL")) = False Then WORKING_CAPITAL_NEED_CAL_RMTextBox.Text = String.Format("{0:n0}", reader("WORKING_CAPITAL_NEED_CAL"))
                If IsDBNull(reader("LOAN_NEED_CAL")) = False Then LOAN_NEED_CAL_RMTextBox.Text = String.Format("{0:n0}", reader("LOAN_NEED_CAL"))
                If IsDBNull(reader("OWNERS_EQUITY_PERCENT_CAL")) = False Then OWNERS_EQUITY_PERCENT_CAL_RMTextBox.Text = String.Format("{0:n2}", reader("OWNERS_EQUITY_PERCENT_CAL"))

                If IsDBNull(reader("OWNERS_EQUITY_CAL")) = False Then OWNERS_EQUITY_CAL_RMTextBox.Text = String.Format("{0:n0}", reader("OWNERS_EQUITY_CAL"))
                If IsDBNull(reader("FIXED_INTEREST_PERCENT_CAL")) = False Then FIXED_INTEREST_PERCENT_CAL_RMTextBox.Text = String.Format("{0:n2}", reader("FIXED_INTEREST_PERCENT_CAL"))
                If IsDBNull(reader("PAYMENT_PERIOD_CAL")) = False Then PAYMENT_PERIOD_CAL_RMTextBox.Text = String.Format("{0:n2}", reader("PAYMENT_PERIOD_CAL"))
                If IsDBNull(reader("AVERAGE_PAYMENT_PERIOD_CAL")) = False Then AVERAGE_PAYMENT_PERIOD_CAL_RMTextBox.Text = String.Format("{0:n2}", reader("AVERAGE_PAYMENT_PERIOD_CAL"))
                If IsDBNull(reader("WORKING_CAPITAL_APPROVE_CAL")) = False Then WORKING_CAPITAL_APPROVE_CAL_RMTextBox.Text = String.Format("{0:n0}", reader("WORKING_CAPITAL_APPROVE_CAL"))
                If IsDBNull(reader("LOAN_APPROVE_CAL")) = False Then LOAN_APPROVE_CAL_RMTextBox.Text = String.Format("{0:n0}", reader("LOAN_APPROVE_CAL"))
                If IsDBNull(reader("INTEREST_RATE_PERCENT")) = False Then INTEREST_RATE_PERCENT_RMTextBox.Text = String.Format("{0:n2}", reader("INTEREST_RATE_PERCENT"))
                If IsDBNull(reader("INTEREST_RATE_PERCENT_USED")) = False Then INTEREST_RATE_PERCENT_USED_RMTextBox.Text = String.Format("{0:n2}", reader("INTEREST_RATE_PERCENT_USED"))
                If IsDBNull(reader("CONTRACT_YEAR")) = False Then CONTRACT_YEAR_RMTextBox.Text = String.Format("{0:n0}", reader("CONTRACT_YEAR"))
                If IsDBNull(reader("DSCR_THIS_TIME")) = False Then DSCR_THIS_TIME_RMTextBox.Text = String.Format("{0:n2}", reader("DSCR_THIS_TIME"))
                ' If IsDBNull(reader("DSCR_THIS_TIME_PERCENT")) = False Then DSCR_THIS_TIME_PERCENT_RMTextBox.Text = String.Format("{0:n2}", reader("DSCR_THIS_TIME_PERCENT"))
                If IsDBNull(reader("DE_THIS_TIME")) = False Then DE_THIS_TIME_RMTextBox.Text = String.Format("{0:n2}", reader("DE_THIS_TIME"))
                If IsDBNull(reader("LTV_THIS_TIME")) = False Then LTV_THIS_TIME_RMTextBox.Text = String.Format("{0:n2}", reader("LTV_THIS_TIME"))
                ' If IsDBNull(reader("LTV_THIS_TIME_PERCENT")) = False Then LTV_THIS_TIME_PERCENT_RMTextBox.Text = String.Format("{0:n2}", reader("LTV_THIS_TIME_PERCENT"))
                If IsDBNull(reader("WORKING_CAPITAL_DEFAULT")) = False Then WORKING_CAPITAL_DEFAULT_RMTextBox.Text = String.Format("{0:n0}", reader("WORKING_CAPITAL_DEFAULT"))
                If IsDBNull(reader("LOAN_DEFAULT")) = False Then LOAN_DEFAULT_RMTextBox.Text = String.Format("{0:n0}", reader("LOAN_DEFAULT"))
                If IsDBNull(reader("WORKING_CAPITAL_DEFAULT_APPROVE")) = False Then WORKING_CAPITAL_DEFAULT_APPROVE_RMTextBox.Text = String.Format("{0:n0}", reader("WORKING_CAPITAL_DEFAULT_APPROVE"))
                If IsDBNull(reader("LOAN_DEFAULT_APPROVE")) = False Then LOAN_DEFAULT_APPROVE_RMTextBox.Text = String.Format("{0:n0}", reader("LOAN_DEFAULT_APPROVE"))

                If IsDBNull(reader("REFINANCE_WORKING_CAPITAL_BAY")) = False Then REFINANCE_WORKING_CAPITAL_BAY_RMTextBox.Text = String.Format("{0:n0}", reader("REFINANCE_WORKING_CAPITAL_BAY"))
                If IsDBNull(reader("REFINANCE_WORKING_LOAN_BAY")) = False Then REFINANCE_WORKING_LOAN_BAY_RMTextBox.Text = String.Format("{0:n0}", reader("REFINANCE_WORKING_LOAN_BAY"))
                If IsDBNull(reader("REFINANCE_REPAYMENT_BAY")) = False Then REFINANCE_REPAYMENT_BAY_RMTextBox.Text = String.Format("{0:n0}", reader("REFINANCE_REPAYMENT_BAY"))
                If IsDBNull(reader("NEW_WORKING_CAPITAL_CAL")) = False Then NEW_WORKING_CAPITAL_CAL_RMTextBox.Text = String.Format("{0:n0}", reader("NEW_WORKING_CAPITAL_CAL"))


            End While



            reader.Close()
            sqlCmd.Parameters.Clear()

            sqlCmd.CommandText = "SME_S.P_SS_FINANCIAL_DATA_SELECT"
            sqlCmd.Parameters.AddWithValue("@SMES_ID", smes_id)
            sqlCmd.Parameters.AddWithValue("@SMES_TYPE", 2)

            reader = sqlCmd.ExecuteReader()

            While reader.Read()

                If IsDBNull(reader("SALES")) = False Then SALES_CMTextBox.Text = String.Format("{0:n0}", reader("SALES"))
                If IsDBNull(reader("COST_OF_SALES")) = False Then COST_OF_SALES_CMTextBox.Text = String.Format("{0:n0}", reader("COST_OF_SALES"))
                If IsDBNull(reader("COST_OF_SALES_PERCENT")) = False Then COST_OF_SALES_PERCENT_CMTextBox.Text = String.Format("{0:n2}", reader("COST_OF_SALES_PERCENT"))

                If IsDBNull(reader("CREDIT_SALE")) = False Then CREDIT_SALE_CMTextBox.Text = String.Format("{0:n0}", reader("CREDIT_SALE"))
                If IsDBNull(reader("CREDIT_TERM")) = False Then CREDIT_TERM_CMTextBox.Text = String.Format("{0:n0}", reader("CREDIT_TERM"))
                If IsDBNull(reader("PURCHASE")) = False Then PURCHASE_CMTextBox.Text = String.Format("{0:n0}", reader("PURCHASE"))
                If IsDBNull(reader("CREDIT_PURCHASE")) = False Then CREDIT_PURCHASE_CMTextBox.Text = String.Format("{0:n0}", reader("CREDIT_PURCHASE"))
                If IsDBNull(reader("TERM_PURCHASE")) = False Then TERM_PURCHASE_CMTextBox.Text = String.Format("{0:n0}", reader("TERM_PURCHASE"))

                If IsDBNull(reader("OPERATING_EXPENSES")) = False Then OPERATING_EXPENSES_CMTextBox.Text = String.Format("{0:n0}", reader("OPERATING_EXPENSES"))
                If IsDBNull(reader("OPERATING_EXPENSES_PERCENT")) = False Then OPERATING_EXPENSES_PERCENT_CMTextBox.Text = String.Format("{0:n2}", reader("OPERATING_EXPENSES_PERCENT"))

                If IsDBNull(reader("DEFAULT_MARGIN")) = False Then DEFAULT_MARGIN_CMTextBox.Text = String.Format("{0:n2}", reader("DEFAULT_MARGIN"))
                If IsDBNull(reader("GROSS_PROFIT")) = False Then GROSS_PROFIT_CMTextBox.Text = String.Format("{0:n2}", reader("GROSS_PROFIT"))
                If IsDBNull(reader("TAX")) = False Then TAX_CMTextBox.Text = String.Format("{0:n0}", reader("TAX"))

                If IsDBNull(reader("INVENTORY_INTERVIEW")) = False Then INVENTORY_INTERVIEW_CMTextBox.Text = String.Format("{0:n0}", reader("INVENTORY_INTERVIEW"))
                If IsDBNull(reader("INVENTORY_VISIT")) = False Then INVENTORY_VISIT_CMTextBox.Text = String.Format("{0:n0}", reader("INVENTORY_VISIT"))
                If IsDBNull(reader("ACCOUNT_RECEIVABLE")) = False Then ACCOUNT_RECEIVABLE_CMTextBox.Text = String.Format("{0:n0}", reader("ACCOUNT_RECEIVABLE"))
                If IsDBNull(reader("CURRENT_ASSET_OTHER")) = False Then CURRENT_ASSET_OTHER_CMTextBox.Text = String.Format("{0:n0}", reader("CURRENT_ASSET_OTHER"))

                CURRENT_ASSET_OTHER_CAL_CMTextBox.Text = CURRENT_ASSET_OTHER_CMTextBox.Text

                If IsDBNull(reader("MACHINERY_EQUIPMENT")) = False Then MACHINERY_EQUIPMENT_CMTextBox.Text = String.Format("{0:n0}", reader("MACHINERY_EQUIPMENT"))
                If IsDBNull(reader("CORE_ASSETS")) = False Then CORE_ASSETS_CMTextBox.Text = String.Format("{0:n0}", reader("CORE_ASSETS"))

                If IsDBNull(reader("OTHER_FIXED_ASSETS_OTHER_BANK")) = False Then OTHER_FIXED_ASSETS_OTHER_BANK_CMTextBox.Text = String.Format("{0:n0}", reader("OTHER_FIXED_ASSETS_OTHER_BANK"))
                If IsDBNull(reader("OTHER_FIXED_ASSETS")) = False Then OTHER_FIXED_ASSETS_CMTextBox.Text = String.Format("{0:n0}", reader("OTHER_FIXED_ASSETS"))
                If IsDBNull(reader("CASH_BOND")) = False Then CASH_BOND_CMTextBox.Text = String.Format("{0:n0}", reader("CASH_BOND"))
                If IsDBNull(reader("CALCULATE_RATE")) = False Then CALCULATE_RATE_CMTextBox.Text = String.Format("{0:n2}", reader("CALCULATE_RATE"))
                If IsDBNull(reader("ACCOUNT_PAYABLE")) = False Then ACCOUNT_PAYABLE_CMTextBox.Text = String.Format("{0:n0}", reader("ACCOUNT_PAYABLE"))
                If IsDBNull(reader("CURRENT_LIABILITY_BAY")) = False Then CURRENT_LIABILITY_BAY_CMTextBox.Text = String.Format("{0:n0}", reader("CURRENT_LIABILITY_BAY"))
                If IsDBNull(reader("CURRENT_LIABILITY_OTHER_BANK")) = False Then CURRENT_LIABILITY_OTHER_BANK_CMTextBox.Text = String.Format("{0:n0}", reader("CURRENT_LIABILITY_OTHER_BANK"))
                If IsDBNull(reader("OTHER_CURRENT_LIABILITY")) = False Then OTHER_CURRENT_LIABILITY_CMTextBox.Text = String.Format("{0:n0}", reader("OTHER_CURRENT_LIABILITY"))
                If IsDBNull(reader("LONG_TERM_LIABILITY_BAY")) = False Then LONG_TERM_LIABILITY_BAY_CMTextBox.Text = String.Format("{0:n0}", reader("LONG_TERM_LIABILITY_BAY"))
                If IsDBNull(reader("LONG_TERM_LIABILITY_BAY_REPAYMENT")) = False Then LONG_TERM_LIABILITY_BAY_REPAYMENT_CMTextBox.Text = String.Format("{0:n0}", reader("LONG_TERM_LIABILITY_BAY_REPAYMENT"))
                If IsDBNull(reader("LONG_TERM_LIABILITY_OTHER_BANK")) = False Then LONG_TERM_LIABILITY_OTHER_BANK_CMTextBox.Text = String.Format("{0:n0}", reader("LONG_TERM_LIABILITY_OTHER_BANK"))
                If IsDBNull(reader("LONG_TERM_LIABILITY_OTHER_REPAYMENT")) = False Then LONG_TERM_LIABILITY_OTHER_REPAYMENT_CMTextBox.Text = String.Format("{0:n0}", reader("LONG_TERM_LIABILITY_OTHER_REPAYMENT"))
                If IsDBNull(reader("LONG_TERM_OTHER_LIABILITY")) = False Then LONG_TERM_OTHER_LIABILITY_CMTextBox.Text = String.Format("{0:n0}", reader("LONG_TERM_OTHER_LIABILITY"))
                If IsDBNull(reader("LONG_TERM_OTHER_REPAYMENT")) = False Then LONG_TERM_OTHER_REPAYMENT_CMTextBox.Text = String.Format("{0:n0}", reader("LONG_TERM_OTHER_REPAYMENT"))
                If IsDBNull(reader("LOANS_REL_CO_DIRECTORS")) = False Then LOANS_REL_CO_DIRECTORS_CMTextBox.Text = String.Format("{0:n0}", reader("LOANS_REL_CO_DIRECTORS"))
                If IsDBNull(reader("LG_AVAL_BAY")) = False Then LG_AVAL_BAY_CMTextBox.Text = String.Format("{0:n0}", reader("LG_AVAL_BAY"))
                If IsDBNull(reader("REFINANCE_WORKING_CAPITAL_OTHER")) = False Then REFINANCE_WORKING_CAPITAL_OTHER_CMTextBox.Text = String.Format("{0:n0}", reader("REFINANCE_WORKING_CAPITAL_OTHER"))
                If IsDBNull(reader("REFINANCE_WORKING_LOAN_OTHER")) = False Then REFINANCE_WORKING_LOAN_OTHER_CMTextBox.Text = String.Format("{0:n0}", reader("REFINANCE_WORKING_LOAN_OTHER"))
                If IsDBNull(reader("REFINANCE_REPAYMENT")) = False Then REFINANCE_REPAYMENT_CMTextBox.Text = String.Format("{0:n0}", reader("REFINANCE_REPAYMENT"))
                If IsDBNull(reader("WORKING_CAPITAL")) = False Then WORKING_CAPITAL_CMTextBox.Text = String.Format("{0:n0}", reader("WORKING_CAPITAL"))
                If IsDBNull(reader("LOAN")) = False Then LOAN_CMTextBox.Text = String.Format("{0:n0}", reader("LOAN"))
                If IsDBNull(reader("LG_AVAL")) = False Then LG_AVAL_CMTextBox.Text = String.Format("{0:n0}", reader("LG_AVAL"))
                If IsDBNull(reader("ASSETS_INCREASE_LOAN")) = False Then ASSETS_INCREASE_LOAN_CMTextBox.Text = String.Format("{0:n0}", reader("ASSETS_INCREASE_LOAN"))
                If IsDBNull(reader("BOND_DEPOSIT_PLEDGE_PERSON")) = False Then BOND_DEPOSIT_PLEDGE_PERSON_CMTextBox.Text = String.Format("{0:n0}", reader("BOND_DEPOSIT_PLEDGE_PERSON"))
                If IsDBNull(reader("APPRAISAL_VALUE_ZONE_A")) = False Then APPRAISAL_VALUE_ZONE_A_CMTextBox.Text = String.Format("{0:n0}", reader("APPRAISAL_VALUE_ZONE_A"))
                If IsDBNull(reader("APPRAISAL_VALUE_ZONE_B")) = False Then APPRAISAL_VALUE_ZONE_B_CMTextBox.Text = String.Format("{0:n0}", reader("APPRAISAL_VALUE_ZONE_B"))
                If IsDBNull(reader("APPRAISAL_VALUE_ZONE_C")) = False Then APPRAISAL_VALUE_ZONE_C_CMTextBox.Text = String.Format("{0:n0}", reader("APPRAISAL_VALUE_ZONE_C"))
                If IsDBNull(reader("APPRAISAL_VALUE_ZONE_D")) = False Then APPRAISAL_VALUE_ZONE_D_CMTextBox.Text = String.Format("{0:n0}", reader("APPRAISAL_VALUE_ZONE_D"))
                If IsDBNull(reader("APPRAISAL_VALUE_ZONE_E")) = False Then APPRAISAL_VALUE_ZONE_E_CMTextBox.Text = String.Format("{0:n0}", reader("APPRAISAL_VALUE_ZONE_E"))
                If IsDBNull(reader("APPRAISAL_VALUE_ZONE_F")) = False Then APPRAISAL_VALUE_ZONE_F_CMTextBox.Text = String.Format("{0:n0}", reader("APPRAISAL_VALUE_ZONE_F"))
                Dim totalAPPRAISAL_VALUE_ZONE As Decimal
                totalAPPRAISAL_VALUE_ZONE = ToDecimal(APPRAISAL_VALUE_ZONE_A_CMTextBox.Text) + ToDecimal(APPRAISAL_VALUE_ZONE_B_CMTextBox.Text) + ToDecimal(APPRAISAL_VALUE_ZONE_C_CMTextBox.Text) + ToDecimal(APPRAISAL_VALUE_ZONE_D_CMTextBox.Text) + ToDecimal(APPRAISAL_VALUE_ZONE_E_CMTextBox.Text) + ToDecimal(APPRAISAL_VALUE_ZONE_F_CMTextBox.Text)
                TOTAL_AMOUNT_OF_COLLATERAL_CMTextBox.Text = String.Format("{0:n0}", totalAPPRAISAL_VALUE_ZONE)
                If IsDBNull(reader("BOND_DEPOSIT_PLEDGE")) = False Then BOND_DEPOSIT_PLEDGE_CMTextBox.Text = String.Format("{0:n0}", reader("BOND_DEPOSIT_PLEDGE"))


                If IsDBNull(reader("CASH_BOND_CAL")) = False Then CASH_BOND_CAL_CMTextBox.Text = String.Format("{0:n0}", reader("CASH_BOND_CAL"))
                If IsDBNull(reader("ACCOUNT_RECEIVABLE_CAL")) = False Then ACCOUNT_RECEIVABLE_CAL_CMTextBox.Text = String.Format("{0:n0}", reader("ACCOUNT_RECEIVABLE_CAL"))
                If IsDBNull(reader("INVENTORY_CAL")) = False Then INVENTORY_CAL_CMTextBox.Text = String.Format("{0:n0}", reader("INVENTORY_CAL"))
                If IsDBNull(reader("TOTAL_CURRENT_ASSETS_CAL")) = False Then TOTAL_CURRENT_ASSETS_CAL_CMTextBox.Text = String.Format("{0:n0}", reader("TOTAL_CURRENT_ASSETS_CAL"))
                If IsDBNull(reader("MACHINERY_EQUIPMENT_CAL")) = False Then MACHINERY_EQUIPMENT_CAL_CMTextBox.Text = String.Format("{0:n0}", reader("MACHINERY_EQUIPMENT_CAL"))
                If IsDBNull(reader("PROPERTY_PLANT_BUILDING_CAL")) = False Then PROPERTY_PLANT_BUILDING_CAL_CMTextBox.Text = String.Format("{0:n0}", reader("PROPERTY_PLANT_BUILDING_CAL"))
                If IsDBNull(reader("OTHER_FIXED_ASSETS_CAL")) = False Then OTHER_FIXED_ASSETS_CAL_CMTextBox.Text = String.Format("{0:n0}", reader("OTHER_FIXED_ASSETS_CAL"))
                If IsDBNull(reader("OTHER_FIXED_ASSETS_OTHER_BANK_CAL")) = False Then OTHER_FIXED_ASSETS_OTHER_BANK_CAL_CMTextBox.Text = String.Format("{0:n0}", reader("OTHER_FIXED_ASSETS_OTHER_BANK_CAL"))
                If IsDBNull(reader("ASSETS_FROM_CREDIT_CAL")) = False Then ASSETS_FROM_CREDIT_CAL_CMTextBox.Text = String.Format("{0:n0}", reader("ASSETS_FROM_CREDIT_CAL"))
                If IsDBNull(reader("TOTAL_FIXED_ASSETS_CAL")) = False Then TOTAL_FIXED_ASSETS_CAL_CMTextBox.Text = String.Format("{0:n0}", reader("TOTAL_FIXED_ASSETS_CAL"))
                If IsDBNull(reader("TOTAL_ASSETS_CAL")) = False Then TOTAL_ASSETS_CAL_CMTextBox.Text = String.Format("{0:n0}", reader("TOTAL_ASSETS_CAL"))
                If IsDBNull(reader("ACCOUNT_PAYABLE_CAL")) = False Then ACCOUNT_PAYABLE_CAL_CMTextBox.Text = String.Format("{0:n0}", reader("ACCOUNT_PAYABLE_CAL"))
                If IsDBNull(reader("CURRENT_LIABILITY_BAY_CAL")) = False Then CURRENT_LIABILITY_BAY_CAL_CMTextBox.Text = String.Format("{0:n0}", reader("CURRENT_LIABILITY_BAY_CAL"))
                If IsDBNull(reader("OTHER_CURRENT_LIABILITY_CAL")) = False Then OTHER_CURRENT_LIABILITY_CAL_CMTextBox.Text = String.Format("{0:n0}", reader("OTHER_CURRENT_LIABILITY_CAL"))
                If IsDBNull(reader("TOTAL_CURRENT_LIABILITY_CAL")) = False Then TOTAL_CURRENT_LIABILITY_CAL_CMTextBox.Text = String.Format("{0:n0}", reader("TOTAL_CURRENT_LIABILITY_CAL"))
                If IsDBNull(reader("LONG_TERM_LIABILITY_BAY_CAL")) = False Then LONG_TERM_LIABILITY_BAY_CAL_CMTextBox.Text = String.Format("{0:n0}", reader("LONG_TERM_LIABILITY_BAY_CAL"))
                If IsDBNull(reader("OTHER_LONG_TERM_LIABILITY_CAL")) = False Then OTHER_LONG_TERM_LIABILITY_CAL_CMTextBox.Text = String.Format("{0:n0}", reader("OTHER_LONG_TERM_LIABILITY_CAL"))
                If IsDBNull(reader("TOTAL_LIABILITY_CAL")) = False Then TOTAL_LIABILITY_CAL_CMTextBox.Text = String.Format("{0:n0}", reader("TOTAL_LIABILITY_CAL"))
                If IsDBNull(reader("LOANS_REL_CO_DIRECTORS_CAL")) = False Then LOANS_REL_CO_DIRECTORS_CAL_CMTextBox.Text = String.Format("{0:n0}", reader("LOANS_REL_CO_DIRECTORS_CAL"))
                If IsDBNull(reader("EQUITY_CAL")) = False Then EQUITY_CAL_CMTextBox.Text = String.Format("{0:n0}", reader("EQUITY_CAL"))
                If IsDBNull(reader("LIABILITY_EQUITY_CAL")) = False Then LIABILITY_EQUITY_CAL_CMTextBox.Text = String.Format("{0:n0}", reader("LIABILITY_EQUITY_CAL"))


                If IsDBNull(reader("EBIDA_PERCENT_CAL")) = False Then EBIDA_PERCENT_CAL_CMTextBox.Text = String.Format("{0:n2}", reader("EBIDA_PERCENT_CAL"))
                If IsDBNull(reader("EBIDA_CAL")) = False Then EBIDA_CAL_CMTextBox.Text = String.Format("{0:n0}", reader("EBIDA_CAL"))
                If IsDBNull(reader("DE_BEFORE_LOAN_CAL")) = False Then DE_BEFORE_LOAN_CAL_CMTextBox.Text = String.Format("{0:n2}", reader("DE_BEFORE_LOAN_CAL"))
                If IsDBNull(reader("DSCR_BEFORE_LOAN_CAL")) = False Then DSCR_BEFORE_LOAN_CAL_CMTextBox.Text = String.Format("{0:n2}", reader("DSCR_BEFORE_LOAN_CAL"))
                If IsDBNull(reader("AR_DAY_CAL")) = False Then AR_DAY_CAL_CMTextBox.Text = String.Format("{0:n2}", reader("AR_DAY_CAL"))
                If IsDBNull(reader("INVENTORY_DAY_CAL")) = False Then INVENTORY_DAY_CAL_CMTextBox.Text = String.Format("{0:n2}", reader("INVENTORY_DAY_CAL"))
                If IsDBNull(reader("WORKING_CAPITAL_NEED_CAL")) = False Then WORKING_CAPITAL_NEED_CAL_CMTextBox.Text = String.Format("{0:n0}", reader("WORKING_CAPITAL_NEED_CAL"))
                If IsDBNull(reader("LOAN_NEED_CAL")) = False Then LOAN_NEED_CAL_CMTextBox.Text = String.Format("{0:n0}", reader("LOAN_NEED_CAL"))
                If IsDBNull(reader("OWNERS_EQUITY_PERCENT_CAL")) = False Then OWNERS_EQUITY_PERCENT_CAL_CMTextBox.Text = String.Format("{0:n2}", reader("OWNERS_EQUITY_PERCENT_CAL"))

                If IsDBNull(reader("OWNERS_EQUITY_CAL")) = False Then OWNERS_EQUITY_CAL_CMTextBox.Text = String.Format("{0:n0}", reader("OWNERS_EQUITY_CAL"))
                If IsDBNull(reader("FIXED_INTEREST_PERCENT_CAL")) = False Then FIXED_INTEREST_PERCENT_CAL_CMTextBox.Text = String.Format("{0:n2}", reader("FIXED_INTEREST_PERCENT_CAL"))
                If IsDBNull(reader("PAYMENT_PERIOD_CAL")) = False Then PAYMENT_PERIOD_CAL_CMTextBox.Text = String.Format("{0:n2}", reader("PAYMENT_PERIOD_CAL"))
                If IsDBNull(reader("AVERAGE_PAYMENT_PERIOD_CAL")) = False Then AVERAGE_PAYMENT_PERIOD_CAL_CMTextBox.Text = String.Format("{0:n2}", reader("AVERAGE_PAYMENT_PERIOD_CAL"))
                If IsDBNull(reader("WORKING_CAPITAL_APPROVE_CAL")) = False Then WORKING_CAPITAL_APPROVE_CAL_CMTextBox.Text = String.Format("{0:n0}", reader("WORKING_CAPITAL_APPROVE_CAL"))
                If IsDBNull(reader("LOAN_APPROVE_CAL")) = False Then LOAN_APPROVE_CAL_CMTextBox.Text = String.Format("{0:n0}", reader("LOAN_APPROVE_CAL"))
                If IsDBNull(reader("INTEREST_RATE_PERCENT")) = False Then INTEREST_RATE_PERCENT_CMTextBox.Text = String.Format("{0:n2}", reader("INTEREST_RATE_PERCENT"))
                If IsDBNull(reader("INTEREST_RATE_PERCENT_USED")) = False Then INTEREST_RATE_PERCENT_USED_CMTextBox.Text = String.Format("{0:n2}", reader("INTEREST_RATE_PERCENT_USED"))
                If IsDBNull(reader("CONTRACT_YEAR")) = False Then CONTRACT_YEAR_CMTextBox.Text = String.Format("{0:n2}", reader("CONTRACT_YEAR"))
                If IsDBNull(reader("DSCR_THIS_TIME")) = False Then DSCR_THIS_TIME_CMTextBox.Text = String.Format("{0:n2}", reader("DSCR_THIS_TIME"))
                'If IsDBNull(reader("DSCR_THIS_TIME_PERCENT")) = False Then DSCR_THIS_TIME_PERCENT_CMTextBox.Text = String.Format("{0:n2}", reader("DSCR_THIS_TIME_PERCENT"))
                If IsDBNull(reader("DE_THIS_TIME")) = False Then DE_THIS_TIME_CMTextBox.Text = String.Format("{0:n2}", reader("DE_THIS_TIME"))
                If IsDBNull(reader("LTV_THIS_TIME")) = False Then LTV_THIS_TIME_CMTextBox.Text = String.Format("{0:n2}", reader("LTV_THIS_TIME"))
                'If IsDBNull(reader("LTV_THIS_TIME_PERCENT")) = False Then LTV_THIS_TIME_PERCENT_CMTextBox.Text = String.Format("{0:n2}", reader("LTV_THIS_TIME_PERCENT"))
                If IsDBNull(reader("WORKING_CAPITAL_DEFAULT")) = False Then WORKING_CAPITAL_DEFAULT_CMTextBox.Text = String.Format("{0:n0}", reader("WORKING_CAPITAL_DEFAULT"))
                If IsDBNull(reader("LOAN_DEFAULT")) = False Then LOAN_DEFAULT_CMTextBox.Text = String.Format("{0:n0}", reader("LOAN_DEFAULT"))
                If IsDBNull(reader("WORKING_CAPITAL_DEFAULT_APPROVE")) = False Then WORKING_CAPITAL_DEFAULT_APPROVE_CMTextBox.Text = String.Format("{0:n0}", reader("WORKING_CAPITAL_DEFAULT_APPROVE"))
                If IsDBNull(reader("LOAN_DEFAULT_APPROVE")) = False Then LOAN_DEFAULT_APPROVE_CMTextBox.Text = String.Format("{0:n0}", reader("LOAN_DEFAULT_APPROVE"))
                If IsDBNull(reader("REFINANCE_WORKING_CAPITAL_BAY")) = False Then REFINANCE_WORKING_CAPITAL_BAY_CMTextBox.Text = String.Format("{0:n0}", reader("REFINANCE_WORKING_CAPITAL_BAY"))
                If IsDBNull(reader("REFINANCE_WORKING_LOAN_BAY")) = False Then REFINANCE_WORKING_LOAN_BAY_CMTextBox.Text = String.Format("{0:n0}", reader("REFINANCE_WORKING_LOAN_BAY"))
                If IsDBNull(reader("REFINANCE_REPAYMENT_BAY")) = False Then REFINANCE_REPAYMENT_BAY_CMTextBox.Text = String.Format("{0:n0}", reader("REFINANCE_REPAYMENT_BAY"))
                If IsDBNull(reader("NEW_WORKING_CAPITAL_CAL")) = False Then NEW_WORKING_CAPITAL_CAL_CMTextBox.Text = String.Format("{0:n0}", reader("NEW_WORKING_CAPITAL_CAL"))

            End While

            reader.Close()
            sqlCmd.Parameters.Clear()

            sqlCmd.CommandText = "SME_S.P_SS_FINANCIAL_MAIN_SELECT"
            sqlCmd.Parameters.AddWithValue("@SMES_ID", Request.QueryString("SMES_ID"))
            reader = sqlCmd.ExecuteReader()


            While reader.Read()
                If IsDBNull(reader("RESULT_PROCESS")) = False Then
                    ProcessDropDownList.SelectedIndex = ProcessDropDownList.Items.IndexOf(ProcessDropDownList.Items.FindByValue(reader("RESULT_PROCESS")))
                End If
                If IsDBNull(reader("RESULT_REMARK")) = False Then
                    RemarkTextBox.Text = reader("RESULT_REMARK")
                End If

                If IsDBNull(reader("BUSINESS_ID_TABLE")) = False Then BUSINESS_ID_TABLETextBox.Text = reader("BUSINESS_ID_TABLE").ToString()
                If IsDBNull(reader("MARGIN_TABLE")) = False Then MARGIN_TABLETextBox.Text = String.Format("{0:n2}", reader("MARGIN_TABLE"))
                If IsDBNull(reader("DSCR_TABLE")) = False Then DSCR_TABLETextBox.Text = String.Format("{0:n2}", reader("DSCR_TABLE"))
                If IsDBNull(reader("AP_TABLE")) = False Then AP_TABLETextBox.Text = String.Format("{0:n2}", reader("AP_TABLE"))
                If IsDBNull(reader("AR_TABLE")) = False Then AR_TABLETextBox.Text = String.Format("{0:n2}", reader("AR_TABLE"))
                If IsDBNull(reader("STOCK_TABLE")) = False Then STOCK_TABLETextBox.Text = String.Format("{0:n2}", reader("STOCK_TABLE"))
                If IsDBNull(reader("LTV_TABLE")) = False Then LTV_TABLETextBox.Text = String.Format("{0:n2}", reader("LTV_TABLE"))
                If IsDBNull(reader("WORKING_CAPITAL_TABLE")) = False Then WORKING_CAPITAL_TABLETextBox.Text = String.Format("{0:n2}", reader("WORKING_CAPITAL_TABLE"))
                If IsDBNull(reader("RATE_TABLE")) = False Then RATE_TABLETextBox.Text = String.Format("{0:n2}", reader("RATE_TABLE"))
                If IsDBNull(reader("CONTRACT_TABLE")) = False Then CONTRACT_TABLETextBox.Text = String.Format("{0:n2}", reader("CONTRACT_TABLE"))
                If IsDBNull(reader("BUSINESS_NAME")) = False Then BUSINESS_NAME_TABLETextBox.Text = reader("BUSINESS_NAME").ToString()
                If IsDBNull(reader("BUSINESS_GROUP_NAME")) = False Then BUSINESS_GROUP_TABLETextBox.Text = reader("BUSINESS_GROUP_NAME").ToString()

            End While



            reader.Close()


            sqlCmd.Parameters.Clear()
            sqlCmd.CommandText = "SME_S.P_SS_FINANCIAL_CUSTOMER_SELECT_CIF_CHECKLIST"
            sqlCmd.CommandType = CommandType.StoredProcedure
            sqlCmd.Parameters.AddWithValue("@SMES_ID", Request.QueryString("SMES_ID"))
            reader = sqlCmd.ExecuteReader()
            Dim dt As DataTable = New DataTable()
            dt.Load(reader)

            '' นับจำนวนผลลัพท์ grade จาก customer
            Dim Grade_A_plus As Integer = 0
            Dim Grade_A As Integer = 0
            Dim Grade_A_minus As Integer = 0
            Dim Grade_B As Integer = 0
            Dim Grade_C As Integer = 0
            Dim Grade_D As Integer = 0
            Dim Grade_None As Integer = 0
            Dim CustNew As Integer = 0
            Dim CustOld As Integer = 0
            For i = 0 To dt.Rows.Count - 1
                If IsDBNull(dt.Rows(i).Item("GRADE")) = False Then
                    If dt.Rows(i).Item("GRADE") = "A+" Then
                        Grade_A_plus = Grade_A_plus + 1
                    End If
                    If dt.Rows(i).Item("GRADE") = "A" Then
                        Grade_A = Grade_A + 1
                    End If
                    If dt.Rows(i).Item("GRADE") = "A-" Then
                        Grade_A_minus = Grade_A_minus + 1
                    End If
                    If dt.Rows(i).Item("GRADE") = "B" Then
                        Grade_B = Grade_B + 1
                    End If
                    If dt.Rows(i).Item("GRADE") = "C" Then
                        Grade_C = Grade_C + 1
                    End If
                    If dt.Rows(i).Item("GRADE") = "D" Then
                        Grade_D = Grade_D + 1
                    End If
                    If dt.Rows(i).Item("GRADE") = "" Then
                        Grade_None = Grade_None + 1
                    End If
                End If

                If IsDBNull(dt.Rows(i).Item("CUSTOMER_LIST_ID")) = False Then
                    If dt.Rows(i).Item("CUSTOMER_LIST_ID") = "CN01" Then
                        Grade_B = Grade_B + 1
                    End If
                End If
            Next
            If Grade_D > 0 Then
                CustomerGradeLabel.Text = "D"
            ElseIf Grade_C > 0 Then
                CustomerGradeLabel.Text = "C"
            ElseIf Grade_B > 0 Then
                CustomerGradeLabel.Text = "B"
            ElseIf Grade_A_minus > 0 Then
                CustomerGradeLabel.Text = "A-"
            ElseIf Grade_A > 0 Then
                CustomerGradeLabel.Text = "A"
            ElseIf Grade_A_plus > 0 Then
                CustomerGradeLabel.Text = "A+"
            Else
                CustomerGradeLabel.Text = "ไม่ได้ระบุ"
            End If

            reader.Close()
            dt.Clear()
            conn.Close()
        Catch ex As Exception
            Response.Write(ex.ToString)
        Finally
        End Try
    End Sub
    Private Function ToDecimal(ByVal Value As String) As Decimal

        If Value.Length = 0 Then
            Return 0
        ElseIf Value = "Nan" Then
            Return 0
        Else

            'Return [Decimal].Parse(Value.Replace(",", ""), NumberStyles.AllowThousands Or NumberStyles.AllowDecimalPoint Or NumberStyles.AllowCurrencySymbol)
            Return CDec(Value.Replace(",", ""))
        End If
    End Function
    Sub BindDropDown()
        Dim conn As SqlConnection = Nothing

        conn = ConnectionUtil.getSqlConnectionFromWebConfig()
        Dim Sql As String = "SME_S.P_SS_FINANCIAL_PROCESS_SELECT"
        Dim sqlCmd As New SqlCommand(Sql, conn)
        sqlCmd.CommandType = CommandType.StoredProcedure
        sqlCmd.Prepare()
        Dim reader As SqlDataReader = sqlCmd.ExecuteReader()



        ProcessDropDownList.DataSource = reader
        ProcessDropDownList.DataTextField = "PROCESS"
        ProcessDropDownList.DataValueField = "PROCESS_ID"
        ProcessDropDownList.DataBind()
        ProcessDropDownList.Items.Insert(0, New ListItem("...โปรดเลือก...", ""))


        conn.Close()

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
      
            ' ยกไปคำนวณ ต่อที่หน้า สรุปรวม

            If IsDBNull(reader("DEBT_EBITDA")) = False Then
                DebtEbidaLabel.Text = String.Format("{0:n2}", reader("DEBT_EBITDA"))
            End If
            If IsDBNull(reader("DEBT_EBITDA_RESULT")) = False Then
                DebtEbidaResultLabel.Text = reader("DEBT_EBITDA_RESULT")

            End If
            If IsDBNull(reader("DEBT_EQUITY")) = False Then
                DebtEquityLabel.Text = reader("DEBT_EQUITY")
            End If
            If IsDBNull(reader("DEBT_EQUITY_RESULT")) = False Then
                DebtEquityResultLabel.Text = String.Format("{0:n2}", reader("DEBT_EQUITY_RESULT"))

            End If
            If IsDBNull(reader("DSCR")) = False Then
                DSCRLabel.Text = reader("DSCR")
            End If
            If IsDBNull(reader("DSCR_RESULT")) = False Then
                DSCRResultLabel.Text = String.Format("{0:n2}", reader("DSCR_RESULT"))

            End If
            'If IsDBNull(reader("LTV_PERCENT_TEXT")) = False Then
            '    LTVLabel.Text = reader("LTV_PERCENT_TEXt")
            'End If
            'If IsDBNull(reader("LTV_RESULT")) = False Then
            '    LTVResultLabel.Text = reader("LTV_RESULT")

            'End If

        End While

        conn.Close()


    End Sub

    Protected Sub SaveButton_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles SaveButton.Click
        Dim jscript As String = ""
    

        Dim resultSystem As String = ""
        'MsgBox(ResultApproveTextBox.Text)
        If ResultApproveTextBox.Text <> "" Then
            If ResultApproveTextBox.Text = "อนุมัติ" Then
                resultSystem = "D"
            ElseIf ResultApproveTextBox.Text = "ไม่อนุมัติ" Then
                resultSystem = "E"
            Else
                resultSystem = ""
            End If
        End If
        If resultSystem = "" Then
            jscript = jscript & "showErrorDialog(' ไม่มีการขออนุมัติวงเงิน ');"
            runScirpt(jscript)
            Exit Sub
        End If

        If ProcessDropDownList.Items(ProcessDropDownList.SelectedIndex).Value = "" Then
            jscript = jscript & "showErrorDialog(' กรุณาระบุ ผลการอนุมัติ');"
            runScirpt(jscript)
            Exit Sub
        End If

        Dim conn As SqlConnection = Nothing
        Try

            Dim sqlCmd As New SqlCommand()
            Dim sql As String = Nothing
            'Try
            conn = ConnectionUtil.getSqlConnectionFromWebConfig()
            sqlCmd.Connection = conn
            sqlCmd.Transaction = sqlCmd.Connection.BeginTransaction()
            sqlCmd.CommandText = "[SME_S].[P_SS_FINANCIAL_MAIN_UPDATE_RESULT]"
            sqlCmd.CommandType = CommandType.StoredProcedure
            sqlCmd.Parameters.AddWithValue("SMES_ID", Request.QueryString("SMES_ID"))
            sqlCmd.Parameters.AddWithValue("UPDATE_USER", USERTextBox.Text)
            sqlCmd.Parameters.AddWithValue("RESULT_PROCESS", ProcessDropDownList.Items(ProcessDropDownList.SelectedIndex).Value)
            sqlCmd.Parameters.AddWithValue("RESULT_REMARK", RemarkTextBox.Text)
            sqlCmd.Parameters.AddWithValue("RESULT_SYSTEM", resultSystem)
            sqlCmd.Parameters.AddWithValue("RESULT_RM_VALUE", ToDecimal(RMrequestTextBox.Text))
            sqlCmd.Parameters.AddWithValue("RESULT_CM_VALUE", ToDecimal(CMApproveTextBox.Text))
            sqlCmd.Parameters.AddWithValue("RESULT_SYS_VALUE", ToDecimal(SystemApproveTextBox.Text))

            sqlCmd.ExecuteNonQuery()
            sqlCmd.Transaction.Commit()
            conn.Close()


            jscript = jscript & "showDialog(' Update Complete');"
            runScirpt(jscript)

        Catch ex As Exception
            jscript = jscript & "showErrorDialog(""" & ex.ToString.Replace("'", "").Substring(0, 80) & """);"
            runScirpt(jscript)
        Finally
            If (conn.State = ConnectionState.Open) Then
                conn.Close()
            End If
            conn = Nothing
        End Try
    End Sub
    Protected Sub runScirpt(ByVal str As String)
        str = " $(document).ready(function(){" & str & "});"
        Page.ClientScript.RegisterStartupScript(Me.GetType(), "", str, True)
    End Sub
End Class
