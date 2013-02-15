Imports System.Data
Imports System.Data.SqlClient
Imports System.Globalization
Partial Class aspx_smes_FINANCIAL_DATA
    Inherits System.Web.UI.Page


    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

        If Not Page.IsPostBack Then
            Dim SMES_ID As String = Request.QueryString("SMES_ID")
            Dim SMES_TYPE As String = Request.QueryString("SMES_TYPE")
            If SMES_TYPE = 2 Then ' ถ้าเป็นหน้า cm ให้แสดงปุ่มดึงข้อมูลจาก rm ด้วย
                ImportRMButton.Visible = True
            Else
                ImportRMButton.Visible = False
            End If
            If SMES_ID <> "" And SMES_TYPE <> "" Then
                SMES_IDTextBox.Text = SMES_ID
                SMES_TYPETextBox.Text = SMES_TYPE
                ShowData(SMES_ID, SMES_TYPE, 1)

            End If


            If SMES_TYPE = "1" Then
                labelHead.Text = "RM Financial data (ข้อมูลสมมุติฐานทางการเงิน RM)"
            Else
                labelHead.Text = "CM Financial data (ข้อมูลสมมุติฐานทางการเงิน CM)"
                '****

            End If
        Else
            ' MsgBox("load")
        End If

    End Sub

    Sub ShowData(ByVal smes_id As String, ByVal smes_type As String, ByVal action As Integer)
        ' smes_id = id ของเรื่อง ss
        ' smes_type= ประเภท rm 1 หรือ cm 2
        ' action = 1 คือ เรียกข้อมูลตามปกติ , 2 คือ เรียกข้อมูลจาก rm โดยไม่แสดงทับ id



        ' ตรวจสอบว่ามี หน้านี้เป็นหน้า  RM ( รหัส 1) หรือ CM (รหัส 2)


        Dim conn As SqlConnection = Nothing
        'Try

        conn = ConnectionUtil.getSqlConnectionFromWebConfig()
        Dim Sql As String = "SME_S.P_SS_FINANCIAL_DATA_SELECT "
        Dim sqlCmd As New SqlCommand(Sql, conn)
        sqlCmd.CommandType = CommandType.StoredProcedure
        sqlCmd.Prepare()
        sqlCmd.Parameters.AddWithValue("@SMES_ID", smes_id)
        sqlCmd.Parameters.AddWithValue("@SMES_TYPE", smes_type)
        Dim reader As SqlDataReader = sqlCmd.ExecuteReader()


        'MsgBox("cm new" & newCM)
        If reader.HasRows Then   ' ถ้ามี row แสดงว่ามีการเพิ่มแล้ว


            While reader.Read()



                '   Console.WriteLine(String.Format("{0}, {1}", reader(0), reader(1)))
                If action = 1 Then
                    If IsDBNull(reader("SMES_DATA_ID")) = False Then SMES_DATA_IDTextBox.Text = reader("SMES_DATA_ID").ToString()
                End If



                If IsDBNull(reader("SALES")) = False Then SALESTextBox.Text = String.Format("{0:n0}", reader("SALES"))

                If IsDBNull(reader("COST_OF_SALES")) = False Then COST_OF_SALESTextBox.Text = String.Format("{0:n0}", reader("COST_OF_SALES"))
                If IsDBNull(reader("COST_OF_SALES_PERCENT")) = False Then COST_OF_SALES_PERCENTTextBox.Text = String.Format("{0:n2}", reader("COST_OF_SALES_PERCENT"))

                If IsDBNull(reader("CREDIT_SALE")) = False Then CREDIT_SALETextBox.Text = String.Format("{0:n0}", reader("CREDIT_SALE"))
                If IsDBNull(reader("CREDIT_TERM")) = False Then CREDIT_TERMTextBox.Text = String.Format("{0:n0}", reader("CREDIT_TERM"))
                If IsDBNull(reader("PURCHASE")) = False Then PURCHASETextBox.Text = String.Format("{0:n0}", reader("PURCHASE"))
                If IsDBNull(reader("CREDIT_PURCHASE")) = False Then CREDIT_PURCHASETextBox.Text = String.Format("{0:n0}", reader("CREDIT_PURCHASE"))
                If IsDBNull(reader("TERM_PURCHASE")) = False Then TERM_PURCHASETextBox.Text = String.Format("{0:n0}", reader("TERM_PURCHASE"))

                If IsDBNull(reader("OPERATING_EXPENSES")) = False Then OPERATING_EXPENSESTextBox.Text = String.Format("{0:n0}", reader("OPERATING_EXPENSES"))
                If IsDBNull(reader("OPERATING_EXPENSES_PERCENT")) = False Then OPERATING_EXPENSES_PERCENTTextBox.Text = String.Format("{0:n2}", reader("OPERATING_EXPENSES_PERCENT"))

                If IsDBNull(reader("DEFAULT_MARGIN")) = False Then DEFAULT_MARGINTextBox.Text = String.Format("{0:n0}", reader("DEFAULT_MARGIN"))
                If IsDBNull(reader("GROSS_PROFIT")) = False Then GROSS_PROFITTextBox.Text = String.Format("{0:n0}", reader("GROSS_PROFIT"))
                If IsDBNull(reader("TAX")) = False Then TAXTextBox.Text = String.Format("{0:n0}", reader("TAX"))

                If IsDBNull(reader("INVENTORY_INTERVIEW")) = False Then INVENTORY_INTERVIEWTextBox.Text = String.Format("{0:n0}", reader("INVENTORY_INTERVIEW"))
                If IsDBNull(reader("INVENTORY_VISIT")) = False Then INVENTORY_VISITTextBox.Text = String.Format("{0:n0}", reader("INVENTORY_VISIT"))
                If IsDBNull(reader("ACCOUNT_RECEIVABLE")) = False Then ACCOUNT_RECEIVABLETextBox.Text = String.Format("{0:n0}", reader("ACCOUNT_RECEIVABLE"))

                If IsDBNull(reader("CURRENT_ASSET_OTHER")) = False Then CURRENT_ASSET_OTHERTextBox.Text = String.Format("{0:n0}", reader("CURRENT_ASSET_OTHER"))
                If IsDBNull(reader("CURRENT_ASSET_OTHER")) = False Then CURRENT_ASSET_OTHER_CALTextBox.Text = String.Format("{0:n0}", reader("CURRENT_ASSET_OTHER"))


                If IsDBNull(reader("MACHINERY_EQUIPMENT")) = False Then MACHINERY_EQUIPMENTTextBox.Text = String.Format("{0:n0}", reader("MACHINERY_EQUIPMENT"))
                If IsDBNull(reader("CORE_ASSETS")) = False Then CORE_ASSETSTextBox.Text = String.Format("{0:n0}", reader("CORE_ASSETS"))

                If IsDBNull(reader("OTHER_FIXED_ASSETS_OTHER_BANK")) = False Then OTHER_FIXED_ASSETS_OTHER_BANKTextBox.Text = String.Format("{0:n0}", reader("OTHER_FIXED_ASSETS_OTHER_BANK"))
                If IsDBNull(reader("OTHER_FIXED_ASSETS")) = False Then OTHER_FIXED_ASSETSTextBox.Text = String.Format("{0:n0}", reader("OTHER_FIXED_ASSETS"))
                If IsDBNull(reader("CASH_BOND")) = False Then CASH_BONDTextBox.Text = String.Format("{0:n0}", reader("CASH_BOND"))
                If IsDBNull(reader("CALCULATE_RATE")) = False Then CALCULATE_RATETextBox.Text = String.Format("{0:n2}", reader("CALCULATE_RATE"))
                If IsDBNull(reader("ACCOUNT_PAYABLE")) = False Then ACCOUNT_PAYABLETextBox.Text = String.Format("{0:n0}", reader("ACCOUNT_PAYABLE"))
                If IsDBNull(reader("CURRENT_LIABILITY_BAY")) = False Then CURRENT_LIABILITY_BAYTextBox.Text = String.Format("{0:n0}", reader("CURRENT_LIABILITY_BAY"))
                If IsDBNull(reader("CURRENT_LIABILITY_OTHER_BANK")) = False Then CURRENT_LIABILITY_OTHER_BANKTextBox.Text = String.Format("{0:n0}", reader("CURRENT_LIABILITY_OTHER_BANK"))
                If IsDBNull(reader("OTHER_CURRENT_LIABILITY")) = False Then OTHER_CURRENT_LIABILITYTextBox.Text = String.Format("{0:n0}", reader("OTHER_CURRENT_LIABILITY"))
                If IsDBNull(reader("LONG_TERM_LIABILITY_BAY")) = False Then LONG_TERM_LIABILITY_BAYTextBox.Text = String.Format("{0:n0}", reader("LONG_TERM_LIABILITY_BAY"))
                If IsDBNull(reader("LONG_TERM_LIABILITY_BAY_REPAYMENT")) = False Then LONG_TERM_LIABILITY_BAY_REPAYMENTTextBox.Text = String.Format("{0:n0}", reader("LONG_TERM_LIABILITY_BAY_REPAYMENT"))
                If IsDBNull(reader("LONG_TERM_LIABILITY_OTHER_BANK")) = False Then LONG_TERM_LIABILITY_OTHER_BANKTextBox.Text = String.Format("{0:n0}", reader("LONG_TERM_LIABILITY_OTHER_BANK"))
                If IsDBNull(reader("LONG_TERM_LIABILITY_OTHER_REPAYMENT")) = False Then LONG_TERM_LIABILITY_OTHER_REPAYMENTTextBox.Text = String.Format("{0:n0}", reader("LONG_TERM_LIABILITY_OTHER_REPAYMENT"))
                If IsDBNull(reader("LONG_TERM_OTHER_LIABILITY")) = False Then LONG_TERM_OTHER_LIABILITYTextBox.Text = String.Format("{0:n0}", reader("LONG_TERM_OTHER_LIABILITY"))
                If IsDBNull(reader("LONG_TERM_OTHER_REPAYMENT")) = False Then LONG_TERM_OTHER_REPAYMENTTextBox.Text = String.Format("{0:n0}", reader("LONG_TERM_OTHER_REPAYMENT"))
                If IsDBNull(reader("LOANS_REL_CO_DIRECTORS")) = False Then LOANS_REL_CO_DIRECTORSTextBox.Text = String.Format("{0:n0}", reader("LOANS_REL_CO_DIRECTORS"))
                If IsDBNull(reader("LG_AVAL_BAY")) = False Then LG_AVAL_BAYTextBox.Text = String.Format("{0:n0}", reader("LG_AVAL_BAY"))
                If IsDBNull(reader("REFINANCE_WORKING_CAPITAL_OTHER")) = False Then REFINANCE_WORKING_CAPITAL_OTHERTextBox.Text = String.Format("{0:n0}", reader("REFINANCE_WORKING_CAPITAL_OTHER"))
                If IsDBNull(reader("REFINANCE_WORKING_LOAN_OTHER")) = False Then REFINANCE_WORKING_LOAN_OTHERTextBox.Text = String.Format("{0:n0}", reader("REFINANCE_WORKING_LOAN_OTHER"))
                If IsDBNull(reader("REFINANCE_REPAYMENT")) = False Then REFINANCE_REPAYMENTTextBox.Text = String.Format("{0:n0}", reader("REFINANCE_REPAYMENT"))
                If IsDBNull(reader("WORKING_CAPITAL")) = False Then WORKING_CAPITALTextBox.Text = String.Format("{0:n0}", reader("WORKING_CAPITAL"))
                If IsDBNull(reader("LOAN")) = False Then LOANTextBox.Text = String.Format("{0:n0}", reader("LOAN"))
                If IsDBNull(reader("LG_AVAL")) = False Then LG_AVALTextBox.Text = String.Format("{0:n0}", reader("LG_AVAL"))
                If IsDBNull(reader("ASSETS_INCREASE_LOAN")) = False Then ASSETS_INCREASE_LOANTextBox.Text = String.Format("{0:n0}", reader("ASSETS_INCREASE_LOAN"))
                If IsDBNull(reader("BOND_DEPOSIT_PLEDGE_PERSON")) = False Then BOND_DEPOSIT_PLEDGE_PERSONTextBox.Text = String.Format("{0:n0}", reader("BOND_DEPOSIT_PLEDGE_PERSON"))
                If IsDBNull(reader("APPRAISAL_VALUE_ZONE_A")) = False Then APPRAISAL_VALUE_ZONE_ATextBox.Text = String.Format("{0:n0}", reader("APPRAISAL_VALUE_ZONE_A"))
                If IsDBNull(reader("APPRAISAL_VALUE_ZONE_B")) = False Then APPRAISAL_VALUE_ZONE_BTextBox.Text = String.Format("{0:n0}", reader("APPRAISAL_VALUE_ZONE_B"))
                If IsDBNull(reader("APPRAISAL_VALUE_ZONE_C")) = False Then APPRAISAL_VALUE_ZONE_CTextBox.Text = String.Format("{0:n0}", reader("APPRAISAL_VALUE_ZONE_C"))
                If IsDBNull(reader("APPRAISAL_VALUE_ZONE_D")) = False Then APPRAISAL_VALUE_ZONE_DTextBox.Text = String.Format("{0:n0}", reader("APPRAISAL_VALUE_ZONE_D"))
                If IsDBNull(reader("APPRAISAL_VALUE_ZONE_E")) = False Then APPRAISAL_VALUE_ZONE_ETextBox.Text = String.Format("{0:n0}", reader("APPRAISAL_VALUE_ZONE_E"))
                If IsDBNull(reader("APPRAISAL_VALUE_ZONE_F")) = False Then APPRAISAL_VALUE_ZONE_FTextBox.Text = String.Format("{0:n0}", reader("APPRAISAL_VALUE_ZONE_F"))
                If IsDBNull(reader("APPRAISAL_VALUE_ZONE_G")) = False Then APPRAISAL_VALUE_ZONE_GTextBox.Text = String.Format("{0:n0}", reader("APPRAISAL_VALUE_ZONE_G"))
                If IsDBNull(reader("TCG_GUARANTEE")) = False Then TCG_GUARANTEETextBox.Text = String.Format("{0:n0}", reader("TCG_GUARANTEE"))
                Dim totalAPPRAISAL_VALUE_ZONE As Decimal
                totalAPPRAISAL_VALUE_ZONE = ToDecimal(APPRAISAL_VALUE_ZONE_ATextBox.Text) + ToDecimal(APPRAISAL_VALUE_ZONE_BTextBox.Text) + ToDecimal(APPRAISAL_VALUE_ZONE_CTextBox.Text) + ToDecimal(APPRAISAL_VALUE_ZONE_DTextBox.Text) + ToDecimal(APPRAISAL_VALUE_ZONE_ETextBox.Text) + ToDecimal(APPRAISAL_VALUE_ZONE_FTextBox.Text) + ToDecimal(APPRAISAL_VALUE_ZONE_GTextBox.Text)
                TOTAL_AMOUNT_OF_COLLATERALTextBox.Text = String.Format("{0:n0}", totalAPPRAISAL_VALUE_ZONE)
                If IsDBNull(reader("BOND_DEPOSIT_PLEDGE")) = False Then BOND_DEPOSIT_PLEDGETextBox.Text = String.Format("{0:n0}", reader("BOND_DEPOSIT_PLEDGE"))
                If IsDBNull(reader("CASH_BOND_CAL")) = False Then CASH_BOND_CALTextBox.Text = String.Format("{0:n0}", reader("CASH_BOND_CAL"))
                If IsDBNull(reader("ACCOUNT_RECEIVABLE_CAL")) = False Then ACCOUNT_RECEIVABLE_CALTextBox.Text = String.Format("{0:n0}", reader("ACCOUNT_RECEIVABLE_CAL"))
                If IsDBNull(reader("INVENTORY_CAL")) = False Then INVENTORY_CALTextBox.Text = String.Format("{0:n0}", reader("INVENTORY_CAL"))
                If IsDBNull(reader("TOTAL_CURRENT_ASSETS_CAL")) = False Then TOTAL_CURRENT_ASSETS_CALTextBox.Text = String.Format("{0:n0}", reader("TOTAL_CURRENT_ASSETS_CAL"))
                If IsDBNull(reader("MACHINERY_EQUIPMENT_CAL")) = False Then MACHINERY_EQUIPMENT_CALTextBox.Text = String.Format("{0:n0}", reader("MACHINERY_EQUIPMENT_CAL"))
                If IsDBNull(reader("PROPERTY_PLANT_BUILDING_CAL")) = False Then PROPERTY_PLANT_BUILDING_CALTextBox.Text = String.Format("{0:n0}", reader("PROPERTY_PLANT_BUILDING_CAL"))
                If IsDBNull(reader("OTHER_FIXED_ASSETS_CAL")) = False Then OTHER_FIXED_ASSETS_CALTextBox.Text = String.Format("{0:n0}", reader("OTHER_FIXED_ASSETS_CAL"))
                If IsDBNull(reader("OTHER_FIXED_ASSETS_OTHER_BANK_CAL")) = False Then OTHER_FIXED_ASSETS_OTHER_BANK_CALTextBox.Text = String.Format("{0:n0}", reader("OTHER_FIXED_ASSETS_OTHER_BANK_CAL"))
                If IsDBNull(reader("ASSETS_FROM_CREDIT_CAL")) = False Then ASSETS_FROM_CREDIT_CALTextBox.Text = String.Format("{0:n0}", reader("ASSETS_FROM_CREDIT_CAL"))
                If IsDBNull(reader("TOTAL_FIXED_ASSETS_CAL")) = False Then TOTAL_FIXED_ASSETS_CALTextBox.Text = String.Format("{0:n0}", reader("TOTAL_FIXED_ASSETS_CAL"))
                If IsDBNull(reader("TOTAL_ASSETS_CAL")) = False Then TOTAL_ASSETS_CALTextBox.Text = String.Format("{0:n0}", reader("TOTAL_ASSETS_CAL"))
                If IsDBNull(reader("ACCOUNT_PAYABLE_CAL")) = False Then ACCOUNT_PAYABLE_CALTextBox.Text = String.Format("{0:n0}", reader("ACCOUNT_PAYABLE_CAL"))
                If IsDBNull(reader("CURRENT_LIABILITY_BAY_CAL")) = False Then CURRENT_LIABILITY_BAY_CALTextBox.Text = String.Format("{0:n0}", reader("CURRENT_LIABILITY_BAY_CAL"))
                If IsDBNull(reader("OTHER_CURRENT_LIABILITY_CAL")) = False Then OTHER_CURRENT_LIABILITY_CALTextBox.Text = String.Format("{0:n0}", reader("OTHER_CURRENT_LIABILITY_CAL"))
                If IsDBNull(reader("TOTAL_CURRENT_LIABILITY_CAL")) = False Then TOTAL_CURRENT_LIABILITY_CALTextBox.Text = String.Format("{0:n0}", reader("TOTAL_CURRENT_LIABILITY_CAL"))
                If IsDBNull(reader("LONG_TERM_LIABILITY_BAY_CAL")) = False Then LONG_TERM_LIABILITY_BAY_CALTextBox.Text = String.Format("{0:n0}", reader("LONG_TERM_LIABILITY_BAY_CAL"))
                If IsDBNull(reader("OTHER_LONG_TERM_LIABILITY_CAL")) = False Then OTHER_LONG_TERM_LIABILITY_CALTextBox.Text = String.Format("{0:n0}", reader("OTHER_LONG_TERM_LIABILITY_CAL"))
                If IsDBNull(reader("TOTAL_LIABILITY_CAL")) = False Then TOTAL_LIABILITY_CALTextBox.Text = String.Format("{0:n0}", reader("TOTAL_LIABILITY_CAL"))
                If IsDBNull(reader("LOANS_REL_CO_DIRECTORS_CAL")) = False Then LOANS_REL_CO_DIRECTORS_CALTextBox.Text = String.Format("{0:n0}", reader("LOANS_REL_CO_DIRECTORS_CAL"))
                If IsDBNull(reader("EQUITY_CAL")) = False Then EQUITY_CALTextBox.Text = String.Format("{0:n0}", reader("EQUITY_CAL"))
                If IsDBNull(reader("LIABILITY_EQUITY_CAL")) = False Then LIABILITY_EQUITY_CALTextBox.Text = String.Format("{0:n0}", reader("LIABILITY_EQUITY_CAL"))
                If IsDBNull(reader("EBIDA_PERCENT_CAL")) = False Then EBIDA_PERCENT_CALTextBox.Text = String.Format("{0:n2}", reader("EBIDA_PERCENT_CAL"))
                If IsDBNull(reader("EBIDA_CAL")) = False Then EBIDA_CALTextBox.Text = String.Format("{0:n0}", reader("EBIDA_CAL"))
                If IsDBNull(reader("DE_BEFORE_LOAN_CAL")) = False Then DE_BEFORE_LOAN_CALTextBox.Text = String.Format("{0:n2}", reader("DE_BEFORE_LOAN_CAL"))
                If IsDBNull(reader("DSCR_BEFORE_LOAN_CAL")) = False Then DSCR_BEFORE_LOAN_CALTextBox.Text = String.Format("{0:n2}", reader("DSCR_BEFORE_LOAN_CAL"))
                If IsDBNull(reader("AR_DAY_CAL")) = False Then AR_DAY_CALTextBox.Text = String.Format("{0:n0}", reader("AR_DAY_CAL"))
                If IsDBNull(reader("INVENTORY_DAY_CAL")) = False Then INVENTORY_DAY_CALTextBox.Text = String.Format("{0:n0}", reader("INVENTORY_DAY_CAL"))
                If IsDBNull(reader("WORKING_CAPITAL_NEED_CAL")) = False Then WORKING_CAPITAL_NEED_CALTextBox.Text = String.Format("{0:n0}", reader("WORKING_CAPITAL_NEED_CAL"))
                If IsDBNull(reader("LOAN_NEED_CAL")) = False Then LOAN_NEED_CALTextBox.Text = String.Format("{0:n0}", reader("LOAN_NEED_CAL"))
                If IsDBNull(reader("OWNERS_EQUITY_PERCENT_CAL")) = False Then OWNERS_EQUITY_PERCENT_CALTextBox.Text = String.Format("{0:n2}", reader("OWNERS_EQUITY_PERCENT_CAL"))
                OWNERS_EQUITY_PERCENT_INPUTTextBox.Text = OWNERS_EQUITY_PERCENT_CALTextBox.Text
                If IsDBNull(reader("OWNERS_EQUITY_CAL")) = False Then OWNERS_EQUITY_CALTextBox.Text = String.Format("{0:n0}", reader("OWNERS_EQUITY_CAL"))
                If IsDBNull(reader("FIXED_INTEREST_PERCENT_CAL")) = False Then FIXED_INTEREST_PERCENT_CALTextBox.Text = String.Format("{0:n2}", reader("FIXED_INTEREST_PERCENT_CAL"))
                If IsDBNull(reader("PAYMENT_PERIOD_CAL")) = False Then PAYMENT_PERIOD_CALTextBox.Text = String.Format("{0:n0}", reader("PAYMENT_PERIOD_CAL"))
                If IsDBNull(reader("AVERAGE_PAYMENT_PERIOD_CAL")) = False Then AVERAGE_PAYMENT_PERIOD_CALTextBox.Text = String.Format("{0:n0}", reader("AVERAGE_PAYMENT_PERIOD_CAL"))
                If IsDBNull(reader("WORKING_CAPITAL_APPROVE_CAL")) = False Then WORKING_CAPITAL_APPROVE_CALTextBox.Text = String.Format("{0:n0}", reader("WORKING_CAPITAL_APPROVE_CAL"))
                If IsDBNull(reader("LOAN_APPROVE_CAL")) = False Then LOAN_APPROVE_CALTextBox.Text = String.Format("{0:n0}", reader("LOAN_APPROVE_CAL"))
                If IsDBNull(reader("INTEREST_RATE_PERCENT")) = False Then INTEREST_RATE_PERCENTTextBox.Text = String.Format("{0:n3}", reader("INTEREST_RATE_PERCENT"))
                If IsDBNull(reader("INTEREST_RATE_PERCENT_USED")) = False Then INTEREST_RATE_PERCENT_USEDTextBox.Text = String.Format("{0:n3}", reader("INTEREST_RATE_PERCENT_USED"))
                If IsDBNull(reader("CONTRACT_YEAR")) = False Then CONTRACT_YEARTextBox.Text = String.Format("{0:n0}", reader("CONTRACT_YEAR"))
                If IsDBNull(reader("DSCR_THIS_TIME")) = False Then DSCR_THIS_TIMETextBox.Text = String.Format("{0:n2}", reader("DSCR_THIS_TIME"))
                If IsDBNull(reader("DSCR_THIS_TIME_PERCENT")) = False Then DSCR_THIS_TIME_PERCENTTextBox.Text = String.Format("{0:n2}", reader("DSCR_THIS_TIME_PERCENT"))
                If IsDBNull(reader("DE_THIS_TIME")) = False Then DE_THIS_TIMETextBox.Text = String.Format("{0:n2}", reader("DE_THIS_TIME"))
                If IsDBNull(reader("LTV_THIS_TIME")) = False Then LTV_THIS_TIMETextBox.Text = String.Format("{0:n2}", reader("LTV_THIS_TIME"))
                If IsDBNull(reader("LTV_THIS_TIME_PERCENT")) = False Then LTV_THIS_TIME_PERCENTTextBox.Text = String.Format("{0:n2}", reader("LTV_THIS_TIME_PERCENT"))
                If IsDBNull(reader("WORKING_CAPITAL_DEFAULT")) = False Then WORKING_CAPITAL_DEFAULTTextBox.Text = String.Format("{0:n0}", reader("WORKING_CAPITAL_DEFAULT"))
                If IsDBNull(reader("LOAN_DEFAULT")) = False Then LOAN_DEFAULTTextBox.Text = String.Format("{0:n0}", reader("LOAN_DEFAULT"))
                If IsDBNull(reader("WORKING_CAPITAL_DEFAULT_APPROVE")) = False Then WORKING_CAPITAL_DEFAULT_APPROVETextBox.Text = String.Format("{0:n0}", reader("WORKING_CAPITAL_DEFAULT_APPROVE"))
                If IsDBNull(reader("LOAN_DEFAULT_APPROVE")) = False Then LOAN_DEFAULT_APPROVETextBox.Text = String.Format("{0:n0}", reader("LOAN_DEFAULT_APPROVE"))


            End While

            If action = 1 Then  ' กรณีที่เป็นดึงข้อมูลปกติให้ซ่อนหรือแสดงปุ่ม insert
                BtnInsert.Visible = False
                BtnUpdate.Visible = True
            End If


        Else  '  if reader has row ถ้ายังไม่มีข้อมูล
            If action = 1 Then  ' กรณีที่เป็นดึงข้อมูลปกติให้ซ่อนหรือแสดงปุ่ม insert
                BtnInsert.Visible = True
                BtnUpdate.Visible = False
            End If
        End If

        reader.Close()
        sqlCmd.Parameters.Clear()

        sqlCmd.Parameters.AddWithValue("@SMES_ID", Request.QueryString("SMES_ID"))

        If Request.QueryString("TEMPLATE_ID") = "1" Then
            Sql = "SME_S.P_SS_FINANCIAL_MAIN_SELECT"
        ElseIf Request.QueryString("TEMPLATE_ID") = "2" Then
            Sql = "SME_S.P_SS_FINANCIAL_MAIN_SELECT_FOR_FLOOD"
        Else
            Sql = "SME_S.P_SS_FINANCIAL_MAIN_SELECT"
        End If

        sqlCmd.CommandText = Sql
        sqlCmd.CommandType = CommandType.StoredProcedure
        reader = sqlCmd.ExecuteReader()

        While reader.Read()

            If IsDBNull(reader("BUSINESS_ID_TABLE")) = False Then
                BUSINESS_ID_TABLETextBox.Text = reader("BUSINESS_ID_TABLE").ToString()
            Else
                BUSINESS_ID_TABLETextBox.Text = 0
            End If
            If IsDBNull(reader("MARGIN_TABLE")) = False Then
                MARGIN_TABLETextBox.Text = String.Format("{0:n2}", reader("MARGIN_TABLE"))
            Else
                MARGIN_TABLETextBox.Text = 0
            End If
            If IsDBNull(reader("DSCR_TABLE")) = False Then
                DSCR_TABLETextBox.Text = String.Format("{0:n2}", reader("DSCR_TABLE"))
            Else
                DSCR_TABLETextBox.Text = 0
            End If
            If IsDBNull(reader("AP_TABLE")) = False Then
                AP_TABLETextBox.Text = String.Format("{0:n2}", reader("AP_TABLE"))
            Else
                AP_TABLETextBox.Text = 0
            End If
            If IsDBNull(reader("AR_TABLE")) = False Then
                AR_TABLETextBox.Text = String.Format("{0:n2}", reader("AR_TABLE"))
            Else
                AR_TABLETextBox.Text = 0
            End If
            If IsDBNull(reader("STOCK_TABLE")) = False Then
                STOCK_TABLETextBox.Text = String.Format("{0:n2}", reader("STOCK_TABLE"))
            Else
                STOCK_TABLETextBox.Text = 0
            End If
            If IsDBNull(reader("LTV_TABLE")) = False Then
                LTV_TABLETextBox.Text = String.Format("{0:n2}", reader("LTV_TABLE"))
            Else
                LTV_TABLETextBox.Text = 0
            End If
            If IsDBNull(reader("WORKING_CAPITAL_TABLE")) = False Then
                WORKING_CAPITAL_TABLETextBox.Text = String.Format("{0:n2}", reader("WORKING_CAPITAL_TABLE"))
            Else
                WORKING_CAPITAL_TABLETextBox.Text = 0
            End If
            If IsDBNull(reader("RATE_TABLE")) = False Then
                RATE_TABLETextBox.Text = String.Format("{0:n2}", reader("RATE_TABLE"))
            Else
                RATE_TABLETextBox.Text = 0
            End If
            If IsDBNull(reader("CONTRACT_TABLE")) = False Then
                CONTRACT_TABLETextBox.Text = String.Format("{0:n2}", reader("CONTRACT_TABLE"))
            Else
                CONTRACT_TABLETextBox.Text = 0
            End If
            If IsDBNull(reader("BUSINESS_NAME")) = False Then
                BUSINESS_NAME_TABLETextBox.Text = reader("BUSINESS_NAME").ToString()
            Else
                BUSINESS_NAME_TABLETextBox.Text = 0
            End If
            If IsDBNull(reader("BUSINESS_GROUP_NAME")) = False Then
                BUSINESS_GROUP_TABLETextBox.Text = reader("BUSINESS_GROUP_NAME").ToString()
            Else
                BUSINESS_GROUP_TABLETextBox.Text = 0
            End If
        End While


        reader.Close()
        sqlCmd.Parameters.Clear()
        conn.Close()
        'Catch ex As Exception
        '    alert(ex.ToString)
        'Finally
        'End Try
        'MsgBox(SALESTextBox.Text)

    End Sub
    Protected Sub BtnInsert_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles BtnInsert.Click
        SaveData("Insert")
    End Sub
    'Sub InsertData(ByVal action As String)

    '    'declare connection
    '    Dim conn As SqlConnection = Nothing
    '    Dim sqlCmd As New SqlCommand()
    '    Dim sql As String = Nothing
    '    'Dim SMES_ID As String
    '    'SMES_ID = SMES_IDTextBox.Text
    '    'If SMES_ID = "" Then
    '    '    runScript("alert('ไม่พบข้อมูลที่บันทึก');")
    '    '    Exit Sub
    '    'End If
    '    Try
    '        conn = ConnectionUtil.getSqlConnectionFromWebConfig()

    '        sqlCmd.Connection = conn
    '        sqlCmd.Transaction = sqlCmd.Connection.BeginTransaction()
    '        sqlCmd.CommandText = "[SME_S].[P_SS_FINANCIAL_DATA_INSERT]"
    '        sqlCmd.CommandType = CommandType.StoredProcedure

    '        If SMES_IDTextBox.Text = "" Then
    '            sqlCmd.Parameters.AddWithValue("SMES_ID", System.DBNull.Value)
    '        Else
    '            sqlCmd.Parameters.AddWithValue("SMES_ID", SMES_IDTextBox.Text)
    '        End If

    '        If SMES_TYPETextBox.Text = "" Then
    '            sqlCmd.Parameters.AddWithValue("SMES_TYPE", System.DBNull.Value)
    '        Else
    '            sqlCmd.Parameters.AddWithValue("SMES_TYPE", SMES_TYPETextBox.Text)
    '        End If

    '        If USERTextBox.Text = "" Then
    '            sqlCmd.Parameters.AddWithValue("CREATE_USER", System.DBNull.Value)
    '        Else
    '            sqlCmd.Parameters.AddWithValue("CREATE_USER", USERTextBox.Text)
    '        End If

    '        If SALESTextBox.Text = "" Then
    '            sqlCmd.Parameters.AddWithValue("SALES", System.DBNull.Value)
    '        Else
    '            sqlCmd.Parameters.AddWithValue("SALES", ToDecimal(SALESTextBox.Text))
    '        End If

    '        If COST_OF_SALESTextBox.Text = "" Then
    '            sqlCmd.Parameters.AddWithValue("COST_OF_SALES", System.DBNull.Value)
    '        Else
    '            sqlCmd.Parameters.AddWithValue("COST_OF_SALES", ToDecimal(COST_OF_SALESTextBox.Text))
    '        End If

    '        If COST_OF_SALES_PERCENTTextBox.Text = "" Then
    '            sqlCmd.Parameters.AddWithValue("COST_OF_SALES_PERCENT", System.DBNull.Value)
    '        Else
    '            sqlCmd.Parameters.AddWithValue("COST_OF_SALES_PERCENT", ToDecimal(COST_OF_SALES_PERCENTTextBox.Text))
    '        End If

    '        If CREDIT_SALETextBox.Text = "" Then
    '            sqlCmd.Parameters.AddWithValue("CREDIT_SALE", System.DBNull.Value)
    '        Else
    '            sqlCmd.Parameters.AddWithValue("CREDIT_SALE", ToDecimal(CREDIT_SALETextBox.Text))
    '        End If
    '        If CREDIT_TERMTextBox.Text = "" Then
    '            sqlCmd.Parameters.AddWithValue("CREDIT_TERM", System.DBNull.Value)
    '        Else
    '            sqlCmd.Parameters.AddWithValue("CREDIT_TERM", ToDecimal(CREDIT_TERMTextBox.Text))
    '        End If
    '        If PURCHASETextBox.Text = "" Then
    '            sqlCmd.Parameters.AddWithValue("PURCHASE", System.DBNull.Value)
    '        Else
    '            sqlCmd.Parameters.AddWithValue("PURCHASE", ToDecimal(PURCHASETextBox.Text))
    '        End If
    '        If CREDIT_PURCHASETextBox.Text = "" Then
    '            sqlCmd.Parameters.AddWithValue("CREDIT_PURCHASE", System.DBNull.Value)
    '        Else
    '            sqlCmd.Parameters.AddWithValue("CREDIT_PURCHASE", ToDecimal(CREDIT_PURCHASETextBox.Text))
    '        End If
    '        If TERM_PURCHASETextBox.Text = "" Then
    '            sqlCmd.Parameters.AddWithValue("TERM_PURCHASE", System.DBNull.Value)
    '        Else
    '            sqlCmd.Parameters.AddWithValue("TERM_PURCHASE", ToDecimal(TERM_PURCHASETextBox.Text))
    '        End If

    '        If OPERATING_EXPENSESTextBox.Text = "" Then
    '            sqlCmd.Parameters.AddWithValue("OPERATING_EXPENSES", System.DBNull.Value)
    '        Else
    '            sqlCmd.Parameters.AddWithValue("OPERATING_EXPENSES", ToDecimal(OPERATING_EXPENSESTextBox.Text))
    '        End If

    '        If OPERATING_EXPENSES_PERCENTTextBox.Text = "" Then
    '            sqlCmd.Parameters.AddWithValue("OPERATING_EXPENSES_PERCENT", System.DBNull.Value)
    '        Else
    '            sqlCmd.Parameters.AddWithValue("OPERATING_EXPENSES_PERCENT", ToDecimal(OPERATING_EXPENSES_PERCENTTextBox.Text))
    '        End If

    '        If DEFAULT_MARGINTextBox.Text = "" Then
    '            sqlCmd.Parameters.AddWithValue("DEFAULT_MARGIN", System.DBNull.Value)
    '        Else
    '            sqlCmd.Parameters.AddWithValue("DEFAULT_MARGIN", ToDecimal(DEFAULT_MARGINTextBox.Text))
    '        End If

    '        If GROSS_PROFITTextBox.Text = "" Then
    '            sqlCmd.Parameters.AddWithValue("GROSS_PROFIT", System.DBNull.Value)
    '        Else
    '            sqlCmd.Parameters.AddWithValue("GROSS_PROFIT", ToDecimal(GROSS_PROFITTextBox.Text))
    '        End If

    '        If TAXTextBox.Text = "" Then
    '            sqlCmd.Parameters.AddWithValue("TAX", System.DBNull.Value)
    '        Else
    '            sqlCmd.Parameters.AddWithValue("TAX", ToDecimal(TAXTextBox.Text))
    '        End If

    '        If INVENTORY_INTERVIEWTextBox.Text = "" Then
    '            sqlCmd.Parameters.AddWithValue("INVENTORY_INTERVIEW", System.DBNull.Value)
    '        Else
    '            sqlCmd.Parameters.AddWithValue("INVENTORY_INTERVIEW", ToDecimal(INVENTORY_INTERVIEWTextBox.Text))
    '        End If
    '        If INVENTORY_VISITTextBox.Text = "" Then
    '            sqlCmd.Parameters.AddWithValue("INVENTORY_VISIT", System.DBNull.Value)
    '        Else
    '            sqlCmd.Parameters.AddWithValue("INVENTORY_VISIT", ToDecimal(INVENTORY_VISITTextBox.Text))
    '        End If
    '        If ACCOUNT_RECEIVABLETextBox.Text = "" Then
    '            sqlCmd.Parameters.AddWithValue("ACCOUNT_RECEIVABLE", System.DBNull.Value)
    '        Else
    '            sqlCmd.Parameters.AddWithValue("ACCOUNT_RECEIVABLE", ToDecimal(ACCOUNT_RECEIVABLETextBox.Text))
    '        End If
    '        If MACHINERY_EQUIPMENTTextBox.Text = "" Then
    '            sqlCmd.Parameters.AddWithValue("MACHINERY_EQUIPMENT", System.DBNull.Value)
    '        Else
    '            sqlCmd.Parameters.AddWithValue("MACHINERY_EQUIPMENT", ToDecimal(MACHINERY_EQUIPMENTTextBox.Text))
    '        End If

    '        If CORE_ASSETSTextBox.Text = "" Then
    '            sqlCmd.Parameters.AddWithValue("CORE_ASSETS", System.DBNull.Value)
    '        Else
    '            sqlCmd.Parameters.AddWithValue("CORE_ASSETS", ToDecimal(CORE_ASSETSTextBox.Text))
    '        End If


    '        If OTHER_FIXED_ASSETS_OTHER_BANKTextBox.Text = "" Then
    '            sqlCmd.Parameters.AddWithValue("OTHER_FIXED_ASSETS_OTHER_BANK", System.DBNull.Value)
    '        Else
    '            sqlCmd.Parameters.AddWithValue("OTHER_FIXED_ASSETS_OTHER_BANK", ToDecimal(OTHER_FIXED_ASSETS_OTHER_BANKTextBox.Text))
    '        End If

    '        If OTHER_FIXED_ASSETSTextBox.Text = "" Then
    '            sqlCmd.Parameters.AddWithValue("OTHER_FIXED_ASSETS", System.DBNull.Value)
    '        Else
    '            sqlCmd.Parameters.AddWithValue("OTHER_FIXED_ASSETS", ToDecimal(OTHER_FIXED_ASSETSTextBox.Text))
    '        End If


    '        If CASH_BONDTextBox.Text = "" Then
    '            sqlCmd.Parameters.AddWithValue("CASH_BOND", System.DBNull.Value)
    '        Else
    '            sqlCmd.Parameters.AddWithValue("CASH_BOND", ToDecimal(CASH_BONDTextBox.Text))
    '        End If
    '        If CALCULATE_RATETextBox.Text = "" Then
    '            sqlCmd.Parameters.AddWithValue("CALCULATE_RATE", System.DBNull.Value)
    '        Else
    '            sqlCmd.Parameters.AddWithValue("CALCULATE_RATE", ToDecimal(CALCULATE_RATETextBox.Text))
    '        End If

    '        If ACCOUNT_PAYABLETextBox.Text = "" Then
    '            sqlCmd.Parameters.AddWithValue("ACCOUNT_PAYABLE", System.DBNull.Value)
    '        Else
    '            sqlCmd.Parameters.AddWithValue("ACCOUNT_PAYABLE", ToDecimal(ACCOUNT_PAYABLETextBox.Text))
    '        End If
    '        If CURRENT_LIABILITY_BAYTextBox.Text = "" Then
    '            sqlCmd.Parameters.AddWithValue("CURRENT_LIABILITY_BAY", System.DBNull.Value)
    '        Else
    '            sqlCmd.Parameters.AddWithValue("CURRENT_LIABILITY_BAY", ToDecimal(CURRENT_LIABILITY_BAYTextBox.Text))
    '        End If
    '        If CURRENT_LIABILITY_OTHER_BANKTextBox.Text = "" Then
    '            sqlCmd.Parameters.AddWithValue("CURRENT_LIABILITY_OTHER_BANK", System.DBNull.Value)
    '        Else
    '            sqlCmd.Parameters.AddWithValue("CURRENT_LIABILITY_OTHER_BANK", ToDecimal(CURRENT_LIABILITY_OTHER_BANKTextBox.Text))
    '        End If
    '        If OTHER_CURRENT_LIABILITYTextBox.Text = "" Then
    '            sqlCmd.Parameters.AddWithValue("OTHER_CURRENT_LIABILITY", System.DBNull.Value)
    '        Else
    '            sqlCmd.Parameters.AddWithValue("OTHER_CURRENT_LIABILITY", ToDecimal(OTHER_CURRENT_LIABILITYTextBox.Text))
    '        End If
    '        If LONG_TERM_LIABILITY_BAYTextBox.Text = "" Then
    '            sqlCmd.Parameters.AddWithValue("LONG_TERM_LIABILITY_BAY", System.DBNull.Value)
    '        Else
    '            sqlCmd.Parameters.AddWithValue("LONG_TERM_LIABILITY_BAY", ToDecimal(LONG_TERM_LIABILITY_BAYTextBox.Text))
    '        End If
    '        If LONG_TERM_LIABILITY_BAY_REPAYMENTTextBox.Text = "" Then
    '            sqlCmd.Parameters.AddWithValue("LONG_TERM_LIABILITY_BAY_REPAYMENT", System.DBNull.Value)
    '        Else
    '            sqlCmd.Parameters.AddWithValue("LONG_TERM_LIABILITY_BAY_REPAYMENT", ToDecimal(LONG_TERM_LIABILITY_BAY_REPAYMENTTextBox.Text))
    '        End If
    '        If LONG_TERM_LIABILITY_OTHER_BANKTextBox.Text = "" Then
    '            sqlCmd.Parameters.AddWithValue("LONG_TERM_LIABILITY_OTHER_BANK", System.DBNull.Value)
    '        Else
    '            sqlCmd.Parameters.AddWithValue("LONG_TERM_LIABILITY_OTHER_BANK", ToDecimal(LONG_TERM_LIABILITY_OTHER_BANKTextBox.Text))
    '        End If
    '        If LONG_TERM_LIABILITY_OTHER_REPAYMENTTextBox.Text = "" Then
    '            sqlCmd.Parameters.AddWithValue("LONG_TERM_LIABILITY_OTHER_REPAYMENT", System.DBNull.Value)
    '        Else
    '            sqlCmd.Parameters.AddWithValue("LONG_TERM_LIABILITY_OTHER_REPAYMENT", ToDecimal(LONG_TERM_LIABILITY_OTHER_REPAYMENTTextBox.Text))
    '        End If
    '        If LONG_TERM_OTHER_LIABILITYTextBox.Text = "" Then
    '            sqlCmd.Parameters.AddWithValue("LONG_TERM_OTHER_LIABILITY", System.DBNull.Value)
    '        Else
    '            sqlCmd.Parameters.AddWithValue("LONG_TERM_OTHER_LIABILITY", ToDecimal(LONG_TERM_OTHER_LIABILITYTextBox.Text))
    '        End If
    '        If LONG_TERM_OTHER_REPAYMENTTextBox.Text = "" Then
    '            sqlCmd.Parameters.AddWithValue("LONG_TERM_OTHER_REPAYMENT", System.DBNull.Value)
    '        Else
    '            sqlCmd.Parameters.AddWithValue("LONG_TERM_OTHER_REPAYMENT", ToDecimal(LONG_TERM_OTHER_REPAYMENTTextBox.Text))
    '        End If
    '        If LOANS_REL_CO_DIRECTORSTextBox.Text = "" Then
    '            sqlCmd.Parameters.AddWithValue("LOANS_REL_CO_DIRECTORS", System.DBNull.Value)
    '        Else
    '            sqlCmd.Parameters.AddWithValue("LOANS_REL_CO_DIRECTORS", ToDecimal(LOANS_REL_CO_DIRECTORSTextBox.Text))
    '        End If
    '        If LG_AVAL_BAYTextBox.Text = "" Then
    '            sqlCmd.Parameters.AddWithValue("LG_AVAL_BAY", System.DBNull.Value)
    '        Else
    '            sqlCmd.Parameters.AddWithValue("LG_AVAL_BAY", ToDecimal(LG_AVAL_BAYTextBox.Text))
    '        End If
    '        If REFINANCE_WORKING_CAPITAL_OTHERTextBox.Text = "" Then
    '            sqlCmd.Parameters.AddWithValue("REFINANCE_WORKING_CAPITAL_OTHER", System.DBNull.Value)
    '        Else
    '            sqlCmd.Parameters.AddWithValue("REFINANCE_WORKING_CAPITAL_OTHER", ToDecimal(REFINANCE_WORKING_CAPITAL_OTHERTextBox.Text))
    '        End If
    '        If REFINANCE_WORKING_LOAN_OTHERTextBox.Text = "" Then
    '            sqlCmd.Parameters.AddWithValue("REFINANCE_WORKING_LOAN_OTHER", System.DBNull.Value)
    '        Else
    '            sqlCmd.Parameters.AddWithValue("REFINANCE_WORKING_LOAN_OTHER", ToDecimal(REFINANCE_WORKING_LOAN_OTHERTextBox.Text))
    '        End If
    '        If REFINANCE_REPAYMENTTextBox.Text = "" Then
    '            sqlCmd.Parameters.AddWithValue("REFINANCE_REPAYMENT", System.DBNull.Value)
    '        Else
    '            sqlCmd.Parameters.AddWithValue("REFINANCE_REPAYMENT", ToDecimal(REFINANCE_REPAYMENTTextBox.Text))
    '        End If
    '        If WORKING_CAPITALTextBox.Text = "" Then
    '            sqlCmd.Parameters.AddWithValue("WORKING_CAPITAL", System.DBNull.Value)
    '        Else
    '            sqlCmd.Parameters.AddWithValue("WORKING_CAPITAL", ToDecimal(WORKING_CAPITALTextBox.Text))
    '        End If
    '        If LOANTextBox.Text = "" Then
    '            sqlCmd.Parameters.AddWithValue("LOAN", System.DBNull.Value)
    '        Else
    '            sqlCmd.Parameters.AddWithValue("LOAN", ToDecimal(LOANTextBox.Text))
    '        End If
    '        If LG_AVALTextBox.Text = "" Then
    '            sqlCmd.Parameters.AddWithValue("LG_AVAL", System.DBNull.Value)
    '        Else
    '            sqlCmd.Parameters.AddWithValue("LG_AVAL", ToDecimal(LG_AVALTextBox.Text))
    '        End If
    '        If ASSETS_INCREASE_LOANTextBox.Text = "" Then
    '            sqlCmd.Parameters.AddWithValue("ASSETS_INCREASE_LOAN", System.DBNull.Value)
    '        Else
    '            sqlCmd.Parameters.AddWithValue("ASSETS_INCREASE_LOAN", ToDecimal(ASSETS_INCREASE_LOANTextBox.Text))
    '        End If
    '        If BOND_DEPOSIT_PLEDGE_PERSONTextBox.Text = "" Then
    '            sqlCmd.Parameters.AddWithValue("BOND_DEPOSIT_PLEDGE_PERSON", System.DBNull.Value)
    '        Else
    '            sqlCmd.Parameters.AddWithValue("BOND_DEPOSIT_PLEDGE_PERSON", ToDecimal(BOND_DEPOSIT_PLEDGE_PERSONTextBox.Text))
    '        End If
    '        If APPRAISAL_VALUE_ZONE_ATextBox.Text = "" Then
    '            sqlCmd.Parameters.AddWithValue("APPRAISAL_VALUE_ZONE_A", System.DBNull.Value)
    '        Else
    '            sqlCmd.Parameters.AddWithValue("APPRAISAL_VALUE_ZONE_A", ToDecimal(APPRAISAL_VALUE_ZONE_ATextBox.Text))
    '        End If
    '        If APPRAISAL_VALUE_ZONE_BTextBox.Text = "" Then
    '            sqlCmd.Parameters.AddWithValue("APPRAISAL_VALUE_ZONE_B", System.DBNull.Value)
    '        Else
    '            sqlCmd.Parameters.AddWithValue("APPRAISAL_VALUE_ZONE_B", ToDecimal(APPRAISAL_VALUE_ZONE_BTextBox.Text))
    '        End If
    '        If APPRAISAL_VALUE_ZONE_CTextBox.Text = "" Then
    '            sqlCmd.Parameters.AddWithValue("APPRAISAL_VALUE_ZONE_C", System.DBNull.Value)
    '        Else
    '            sqlCmd.Parameters.AddWithValue("APPRAISAL_VALUE_ZONE_C", ToDecimal(APPRAISAL_VALUE_ZONE_CTextBox.Text))
    '        End If
    '        If APPRAISAL_VALUE_ZONE_DTextBox.Text = "" Then
    '            sqlCmd.Parameters.AddWithValue("APPRAISAL_VALUE_ZONE_D", System.DBNull.Value)
    '        Else
    '            sqlCmd.Parameters.AddWithValue("APPRAISAL_VALUE_ZONE_D", ToDecimal(APPRAISAL_VALUE_ZONE_DTextBox.Text))
    '        End If
    '        If APPRAISAL_VALUE_ZONE_ETextBox.Text = "" Then
    '            sqlCmd.Parameters.AddWithValue("APPRAISAL_VALUE_ZONE_E", System.DBNull.Value)
    '        Else
    '            sqlCmd.Parameters.AddWithValue("APPRAISAL_VALUE_ZONE_E", ToDecimal(APPRAISAL_VALUE_ZONE_ETextBox.Text))
    '        End If
    '        If BOND_DEPOSIT_PLEDGETextBox.Text = "" Then
    '            sqlCmd.Parameters.AddWithValue("BOND_DEPOSIT_PLEDGE", System.DBNull.Value)
    '        Else
    '            sqlCmd.Parameters.AddWithValue("BOND_DEPOSIT_PLEDGE", ToDecimal(BOND_DEPOSIT_PLEDGETextBox.Text))
    '        End If
    '        If CASH_BOND_CALTextBox.Text = "" Then
    '            sqlCmd.Parameters.AddWithValue("CASH_BOND_CAL", System.DBNull.Value)
    '        Else
    '            sqlCmd.Parameters.AddWithValue("CASH_BOND_CAL", ToDecimal(CASH_BOND_CALTextBox.Text))
    '        End If
    '        If ACCOUNT_RECEIVABLE_CALTextBox.Text = "" Then
    '            sqlCmd.Parameters.AddWithValue("ACCOUNT_RECEIVABLE_CAL", System.DBNull.Value)
    '        Else
    '            sqlCmd.Parameters.AddWithValue("ACCOUNT_RECEIVABLE_CAL", ToDecimal(ACCOUNT_RECEIVABLE_CALTextBox.Text))
    '        End If
    '        If INVENTORY_CALTextBox.Text = "" Then
    '            sqlCmd.Parameters.AddWithValue("INVENTORY_CAL", System.DBNull.Value)
    '        Else
    '            sqlCmd.Parameters.AddWithValue("INVENTORY_CAL", ToDecimal(INVENTORY_CALTextBox.Text))
    '        End If
    '        If TOTAL_CURRENT_ASSETS_CALTextBox.Text = "" Then
    '            sqlCmd.Parameters.AddWithValue("TOTAL_CURRENT_ASSETS_CAL", System.DBNull.Value)
    '        Else
    '            sqlCmd.Parameters.AddWithValue("TOTAL_CURRENT_ASSETS_CAL", ToDecimal(TOTAL_CURRENT_ASSETS_CALTextBox.Text))
    '        End If

    '        If MACHINERY_EQUIPMENT_CALTextBox.Text = "" Then
    '            sqlCmd.Parameters.AddWithValue("MACHINERY_EQUIPMENT_CAL", System.DBNull.Value)
    '        Else
    '            sqlCmd.Parameters.AddWithValue("MACHINERY_EQUIPMENT_CAL", ToDecimal(MACHINERY_EQUIPMENT_CALTextBox.Text))
    '        End If

    '        If PROPERTY_PLANT_BUILDING_CALTextBox.Text = "" Then
    '            sqlCmd.Parameters.AddWithValue("PROPERTY_PLANT_BUILDING_CAL", System.DBNull.Value)
    '        Else
    '            sqlCmd.Parameters.AddWithValue("PROPERTY_PLANT_BUILDING_CAL", ToDecimal(PROPERTY_PLANT_BUILDING_CALTextBox.Text))
    '        End If

    '        If OTHER_FIXED_ASSETS_OTHER_BANK_CALTextBox.Text = "" Then
    '            sqlCmd.Parameters.AddWithValue("OTHER_FIXED_ASSETS_OTHER_BANK_CAL", System.DBNull.Value)
    '        Else
    '            sqlCmd.Parameters.AddWithValue("OTHER_FIXED_ASSETS_OTHER_BANK_CAL", ToDecimal(OTHER_FIXED_ASSETS_OTHER_BANK_CALTextBox.Text))
    '        End If

    '        If OTHER_FIXED_ASSETS_CALTextBox.Text = "" Then
    '            sqlCmd.Parameters.AddWithValue("OTHER_FIXED_ASSETS_CAL", System.DBNull.Value)
    '        Else
    '            sqlCmd.Parameters.AddWithValue("OTHER_FIXED_ASSETS_CAL", ToDecimal(OTHER_FIXED_ASSETS_CALTextBox.Text))
    '        End If

    '        If ASSETS_FROM_CREDIT_CALTextBox.Text = "" Then
    '            sqlCmd.Parameters.AddWithValue("ASSETS_FROM_CREDIT_CAL", System.DBNull.Value)
    '        Else
    '            sqlCmd.Parameters.AddWithValue("ASSETS_FROM_CREDIT_CAL", ToDecimal(ASSETS_FROM_CREDIT_CALTextBox.Text))
    '        End If

    '        If TOTAL_FIXED_ASSETS_CALTextBox.Text = "" Then
    '            sqlCmd.Parameters.AddWithValue("TOTAL_FIXED_ASSETS_CAL", System.DBNull.Value)
    '        Else
    '            sqlCmd.Parameters.AddWithValue("TOTAL_FIXED_ASSETS_CAL", ToDecimal(TOTAL_FIXED_ASSETS_CALTextBox.Text))
    '        End If

    '        If TOTAL_FIXED_ASSETS_CALTextBox.Text = "" Then
    '            sqlCmd.Parameters.AddWithValue("TOTAL_ASSETS_CAL", System.DBNull.Value)
    '        Else
    '            sqlCmd.Parameters.AddWithValue("TOTAL_ASSETS_CAL", ToDecimal(TOTAL_ASSETS_CALTextBox.Text))
    '        End If

    '        If ACCOUNT_PAYABLE_CALTextBox.Text = "" Then
    '            sqlCmd.Parameters.AddWithValue("ACCOUNT_PAYABLE_CAL", System.DBNull.Value)
    '        Else
    '            sqlCmd.Parameters.AddWithValue("ACCOUNT_PAYABLE_CAL", ToDecimal(ACCOUNT_PAYABLE_CALTextBox.Text))
    '        End If

    '        If CURRENT_LIABILITY_BAY_CALTextBox.Text = "" Then
    '            sqlCmd.Parameters.AddWithValue("CURRENT_LIABILITY_BAY_CAL", System.DBNull.Value)
    '        Else
    '            sqlCmd.Parameters.AddWithValue("CURRENT_LIABILITY_BAY_CAL", ToDecimal(CURRENT_LIABILITY_BAY_CALTextBox.Text))
    '        End If

    '        If OTHER_CURRENT_LIABILITY_CALTextBox.Text = "" Then
    '            sqlCmd.Parameters.AddWithValue("OTHER_CURRENT_LIABILITY_CAL", System.DBNull.Value)
    '        Else
    '            sqlCmd.Parameters.AddWithValue("OTHER_CURRENT_LIABILITY_CAL", ToDecimal(OTHER_CURRENT_LIABILITY_CALTextBox.Text))
    '        End If

    '        If TOTAL_CURRENT_LIABILITY_CALTextBox.Text = "" Then
    '            sqlCmd.Parameters.AddWithValue("TOTAL_CURRENT_LIABILITY_CAL", System.DBNull.Value)
    '        Else
    '            sqlCmd.Parameters.AddWithValue("TOTAL_CURRENT_LIABILITY_CAL", ToDecimal(TOTAL_CURRENT_LIABILITY_CALTextBox.Text))
    '        End If

    '        If LONG_TERM_LIABILITY_BAY_CALTextBox.Text = "" Then
    '            sqlCmd.Parameters.AddWithValue("LONG_TERM_LIABILITY_BAY_CAL", System.DBNull.Value)
    '        Else
    '            sqlCmd.Parameters.AddWithValue("LONG_TERM_LIABILITY_BAY_CAL", ToDecimal(LONG_TERM_LIABILITY_BAY_CALTextBox.Text))
    '        End If

    '        If OTHER_LONG_TERM_LIABILITY_CALTextBox.Text = "" Then
    '            sqlCmd.Parameters.AddWithValue("OTHER_LONG_TERM_LIABILITY_CAL", System.DBNull.Value)
    '        Else
    '            sqlCmd.Parameters.AddWithValue("OTHER_LONG_TERM_LIABILITY_CAL", ToDecimal(OTHER_LONG_TERM_LIABILITY_CALTextBox.Text))
    '        End If

    '        If TOTAL_LIABILITY_CALTextBox.Text = "" Then
    '            sqlCmd.Parameters.AddWithValue("TOTAL_LIABILITY_CAL", System.DBNull.Value)
    '        Else
    '            sqlCmd.Parameters.AddWithValue("TOTAL_LIABILITY_CAL", ToDecimal(TOTAL_LIABILITY_CALTextBox.Text))
    '        End If

    '        If LOANS_REL_CO_DIRECTORS_CALTextBox.Text = "" Then
    '            sqlCmd.Parameters.AddWithValue("LOANS_REL_CO_DIRECTORS_CAL", System.DBNull.Value)
    '        Else
    '            sqlCmd.Parameters.AddWithValue("LOANS_REL_CO_DIRECTORS_CAL", ToDecimal(LOANS_REL_CO_DIRECTORS_CALTextBox.Text))
    '        End If

    '        If EQUITY_CALTextBox.Text = "" Then
    '            sqlCmd.Parameters.AddWithValue("EQUITY_CAL", System.DBNull.Value)
    '        Else
    '            sqlCmd.Parameters.AddWithValue("EQUITY_CAL", ToDecimal(EQUITY_CALTextBox.Text))
    '        End If

    '        If LIABILITY_EQUITY_CALTextBox.Text = "" Then
    '            sqlCmd.Parameters.AddWithValue("LIABILITY_EQUITY_CAL", System.DBNull.Value)
    '        Else
    '            sqlCmd.Parameters.AddWithValue("LIABILITY_EQUITY_CAL", ToDecimal(LIABILITY_EQUITY_CALTextBox.Text))
    '        End If

    '        If EBIDA_PERCENT_CALTextBox.Text = "" Then
    '            sqlCmd.Parameters.AddWithValue("EBIDA_PERCENT_CAL", System.DBNull.Value)
    '        Else
    '            sqlCmd.Parameters.AddWithValue("EBIDA_PERCENT_CAL", ToDecimal(EBIDA_PERCENT_CALTextBox.Text))
    '        End If

    '        If EBIDA_CALTextBox.Text = "" Then
    '            sqlCmd.Parameters.AddWithValue("EBIDA_CAL", System.DBNull.Value)
    '        Else
    '            sqlCmd.Parameters.AddWithValue("EBIDA_CAL", ToDecimal(EBIDA_CALTextBox.Text))
    '        End If

    '        If DE_BEFORE_LOAN_CALTextBox.Text = "" Then
    '            sqlCmd.Parameters.AddWithValue("DE_BEFORE_LOAN_CAL", System.DBNull.Value)
    '        Else
    '            sqlCmd.Parameters.AddWithValue("DE_BEFORE_LOAN_CAL", ToDecimal(DE_BEFORE_LOAN_CALTextBox.Text))
    '        End If

    '        If DSCR_BEFORE_LOAN_CALTextBox.Text = "" Then
    '            sqlCmd.Parameters.AddWithValue("DSCR_BEFORE_LOAN_CAL", System.DBNull.Value)
    '        Else
    '            sqlCmd.Parameters.AddWithValue("DSCR_BEFORE_LOAN_CAL", ToDecimal(DSCR_BEFORE_LOAN_CALTextBox.Text))
    '        End If

    '        If AR_DAY_CALTextBox.Text = "" Then
    '            sqlCmd.Parameters.AddWithValue("AR_DAY_CAL", System.DBNull.Value)
    '        Else
    '            sqlCmd.Parameters.AddWithValue("AR_DAY_CAL", ToDecimal(AR_DAY_CALTextBox.Text))
    '        End If

    '        If INVENTORY_DAY_CALTextBox.Text = "" Then
    '            sqlCmd.Parameters.AddWithValue("INVENTORY_DAY_CAL", System.DBNull.Value)
    '        Else
    '            sqlCmd.Parameters.AddWithValue("INVENTORY_DAY_CAL", ToDecimal(INVENTORY_DAY_CALTextBox.Text))
    '        End If

    '        If WORKING_CAPITAL_NEED_CALTextBox.Text = "" Then
    '            sqlCmd.Parameters.AddWithValue("WORKING_CAPITAL_NEED_CAL", System.DBNull.Value)
    '        Else
    '            sqlCmd.Parameters.AddWithValue("WORKING_CAPITAL_NEED_CAL", ToDecimal(WORKING_CAPITAL_NEED_CALTextBox.Text))
    '        End If

    '        If LOAN_NEED_CALTextBox.Text = "" Then
    '            sqlCmd.Parameters.AddWithValue("LOAN_NEED_CAL", System.DBNull.Value)
    '        Else
    '            sqlCmd.Parameters.AddWithValue("LOAN_NEED_CAL", ToDecimal(LOAN_NEED_CALTextBox.Text))
    '        End If

    '        If OWNERS_EQUITY_PERCENT_CALTextBox.Text = "" Then
    '            sqlCmd.Parameters.AddWithValue("OWNERS_EQUITY_PERCENT_CAL", System.DBNull.Value)
    '        Else
    '            sqlCmd.Parameters.AddWithValue("OWNERS_EQUITY_PERCENT_CAL", ToDecimal(OWNERS_EQUITY_PERCENT_CALTextBox.Text))
    '        End If

    '        If OWNERS_EQUITY_CALTextBox.Text = "" Then
    '            sqlCmd.Parameters.AddWithValue("OWNERS_EQUITY_CAL", System.DBNull.Value)
    '        Else
    '            sqlCmd.Parameters.AddWithValue("OWNERS_EQUITY_CAL", ToDecimal(OWNERS_EQUITY_CALTextBox.Text))
    '        End If

    '        If FIXED_INTEREST_PERCENT_CALTextBox.Text = "" Then
    '            sqlCmd.Parameters.AddWithValue("FIXED_INTEREST_PERCENT_CAL", System.DBNull.Value)
    '        Else
    '            sqlCmd.Parameters.AddWithValue("FIXED_INTEREST_PERCENT_CAL", ToDecimal(FIXED_INTEREST_PERCENT_CALTextBox.Text))
    '        End If

    '        If PAYMENT_PERIOD_CALTextBox.Text = "" Then
    '            sqlCmd.Parameters.AddWithValue("PAYMENT_PERIOD_CAL", System.DBNull.Value)
    '        Else
    '            sqlCmd.Parameters.AddWithValue("PAYMENT_PERIOD_CAL", ToDecimal(PAYMENT_PERIOD_CALTextBox.Text))
    '        End If

    '        If AVERAGE_PAYMENT_PERIOD_CALTextBox.Text = "" Then
    '            sqlCmd.Parameters.AddWithValue("AVERAGE_PAYMENT_PERIOD_CAL", System.DBNull.Value)
    '        Else
    '            sqlCmd.Parameters.AddWithValue("AVERAGE_PAYMENT_PERIOD_CAL", ToDecimal(AVERAGE_PAYMENT_PERIOD_CALTextBox.Text))
    '        End If

    '        If WORKING_CAPITAL_APPROVE_CALTextBox.Text = "" Then
    '            sqlCmd.Parameters.AddWithValue("WORKING_CAPITAL_APPROVE_CAL", System.DBNull.Value)
    '        Else
    '            sqlCmd.Parameters.AddWithValue("WORKING_CAPITAL_APPROVE_CAL", ToDecimal(WORKING_CAPITAL_APPROVE_CALTextBox.Text))
    '        End If

    '        If LOAN_APPROVE_CALTextBox.Text = "" Then
    '            sqlCmd.Parameters.AddWithValue("LOAN_APPROVE_CAL", System.DBNull.Value)
    '        Else
    '            sqlCmd.Parameters.AddWithValue("LOAN_APPROVE_CAL", ToDecimal(LOAN_APPROVE_CALTextBox.Text))
    '        End If

    '        If INTEREST_RATE_PERCENTTextBox.Text = "" Then
    '            sqlCmd.Parameters.AddWithValue("INTEREST_RATE_PERCENT", System.DBNull.Value)
    '        Else
    '            sqlCmd.Parameters.AddWithValue("INTEREST_RATE_PERCENT", ToDecimal(INTEREST_RATE_PERCENTTextBox.Text))
    '        End If

    '        If INTEREST_RATE_PERCENT_USEDTextBox.Text = "" Then
    '            sqlCmd.Parameters.AddWithValue("INTEREST_RATE_PERCENT_USED", System.DBNull.Value)
    '        Else
    '            sqlCmd.Parameters.AddWithValue("INTEREST_RATE_PERCENT_USED", ToDecimal(INTEREST_RATE_PERCENT_USEDTextBox.Text))
    '        End If

    '        If CONTRACT_YEARTextBox.Text = "" Then
    '            sqlCmd.Parameters.AddWithValue("CONTRACT_YEAR", System.DBNull.Value)
    '        Else
    '            sqlCmd.Parameters.AddWithValue("CONTRACT_YEAR", ToDecimal(CONTRACT_YEARTextBox.Text))
    '        End If

    '        If DSCR_THIS_TIMETextBox.Text = "" Then
    '            sqlCmd.Parameters.AddWithValue("DSCR_THIS_TIME", System.DBNull.Value)
    '        Else
    '            sqlCmd.Parameters.AddWithValue("DSCR_THIS_TIME", ToDecimal(DSCR_THIS_TIMETextBox.Text))
    '        End If

    '        If DSCR_THIS_TIME_PERCENTTextBox.Text = "" Then
    '            sqlCmd.Parameters.AddWithValue("DSCR_THIS_TIME_PERCENT", System.DBNull.Value)
    '        Else
    '            sqlCmd.Parameters.AddWithValue("DSCR_THIS_TIME_PERCENT", ToDecimal(DSCR_THIS_TIME_PERCENTTextBox.Text))
    '        End If

    '        If DE_THIS_TIMETextBox.Text = "" Then
    '            sqlCmd.Parameters.AddWithValue("DE_THIS_TIME", System.DBNull.Value)
    '        Else
    '            sqlCmd.Parameters.AddWithValue("DE_THIS_TIME", ToDecimal(DE_THIS_TIMETextBox.Text))
    '        End If

    '        If LTV_THIS_TIMETextBox.Text = "" Then
    '            sqlCmd.Parameters.AddWithValue("LTV_THIS_TIME", System.DBNull.Value)
    '        Else
    '            sqlCmd.Parameters.AddWithValue("LTV_THIS_TIME", ToDecimal(LTV_THIS_TIMETextBox.Text))
    '        End If

    '        If LTV_THIS_TIME_PERCENTTextBox.Text = "" Then
    '            sqlCmd.Parameters.AddWithValue("LTV_THIS_TIME_PERCENT", System.DBNull.Value)
    '        Else
    '            sqlCmd.Parameters.AddWithValue("LTV_THIS_TIME_PERCENT", ToDecimal(LTV_THIS_TIME_PERCENTTextBox.Text))
    '        End If

    '        If WORKING_CAPITAL_DEFAULTTextBox.Text = "" Then
    '            sqlCmd.Parameters.AddWithValue("WORKING_CAPITAL_DEFAULT", System.DBNull.Value)
    '        Else
    '            sqlCmd.Parameters.AddWithValue("WORKING_CAPITAL_DEFAULT", ToDecimal(WORKING_CAPITAL_DEFAULTTextBox.Text))
    '        End If

    '        If LOAN_DEFAULTTextBox.Text = "" Then
    '            sqlCmd.Parameters.AddWithValue("LOAN_DEFAULT", System.DBNull.Value)
    '        Else
    '            sqlCmd.Parameters.AddWithValue("LOAN_DEFAULT", ToDecimal(LOAN_DEFAULTTextBox.Text))
    '        End If

    '        If WORKING_CAPITAL_DEFAULT_APPROVETextBox.Text = "" Then
    '            sqlCmd.Parameters.AddWithValue("WORKING_CAPITAL_DEFAULT_APPROVE", System.DBNull.Value)
    '        Else
    '            sqlCmd.Parameters.AddWithValue("WORKING_CAPITAL_DEFAULT_APPROVE", ToDecimal(WORKING_CAPITAL_DEFAULT_APPROVETextBox.Text))
    '        End If

    '        If LOAN_DEFAULT_APPROVETextBox.Text = "" Then
    '            sqlCmd.Parameters.AddWithValue("LOAN_DEFAULT_APPROVE", System.DBNull.Value)
    '        Else
    '            sqlCmd.Parameters.AddWithValue("LOAN_DEFAULT_APPROVE", ToDecimal(LOAN_DEFAULT_APPROVETextBox.Text))
    '        End If

    '        sqlCmd.ExecuteNonQuery()

    '        sqlCmd.Transaction.Commit()
    '    Catch ex As Exception
    '        sqlCmd.Transaction.Rollback()
    '        runScirpt("alert('Cannot save data. \n " & ex.Message.Replace("'", "") & "');")
    '        Exit Sub
    '    Finally
    '        If (conn.State = ConnectionState.Open) Then
    '            conn.Close()
    '        End If
    '        conn = Nothing
    '        Dim jscript As String
    '        jscript = "changeMenu(""" & SMES_IDTextBox.Text & """);"
    '        jscript = jscript & "changePage(""" & SMES_IDTextBox.Text & """,""" & SMES_TYPETextBox.Text & """);"
    '        runScirpt(jscript)  ' เรียก javascript 
    '    End Try

    'End Sub

    Protected Sub BtnUpdate_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles BtnUpdate.Click
        SaveData("Update")
    End Sub
    Sub SaveData(ByVal action As String)

        'declare connection
        Dim conn As SqlConnection = Nothing
        Dim sqlCmd As New SqlCommand()
        Dim sql As String = Nothing
        'Dim SMES_ID As String
        'SMES_ID = SMES_IDTextBox.Text
        'If SMES_ID = "" Then
        '    runScript("alert('ไม่พบข้อมูลที่บันทึก');")
        '    Exit Sub
        'End If
        'Try
        conn = ConnectionUtil.getSqlConnectionFromWebConfig()

        sqlCmd.Connection = conn
        sqlCmd.Transaction = sqlCmd.Connection.BeginTransaction()

        If action = "Insert" Then
            sqlCmd.CommandText = "[SME_S].[P_SS_FINANCIAL_DATA_INSERT]"
        Else
            sqlCmd.CommandText = "[SME_S].[P_SS_FINANCIAL_DATA_UPDATE]"
        End If

        sqlCmd.CommandType = CommandType.StoredProcedure


        If action = "Insert" Then
            If USERTextBox.Text = "" Then
                sqlCmd.Parameters.AddWithValue("CREATE_USER", System.DBNull.Value)
            Else
                sqlCmd.Parameters.AddWithValue("CREATE_USER", USERTextBox.Text)
            End If
        Else
            If USERTextBox.Text = "" Then
                sqlCmd.Parameters.AddWithValue("UPDATE_USER", System.DBNull.Value)
            Else
                sqlCmd.Parameters.AddWithValue("UPDATE_USER", USERTextBox.Text)
            End If
            sqlCmd.Parameters.AddWithValue("SMES_DATA_ID", SMES_DATA_IDTextBox.Text)
        End If


        If SMES_IDTextBox.Text = "" Then
            sqlCmd.Parameters.AddWithValue("SMES_ID", System.DBNull.Value)
        Else
            sqlCmd.Parameters.AddWithValue("SMES_ID", SMES_IDTextBox.Text)
        End If

        If SMES_TYPETextBox.Text = "" Then
            sqlCmd.Parameters.AddWithValue("SMES_TYPE", 0)
        Else
            sqlCmd.Parameters.AddWithValue("SMES_TYPE", SMES_TYPETextBox.Text)
        End If



        If SALESTextBox.Text = "" Then
            sqlCmd.Parameters.AddWithValue("SALES", 0)
        Else
            sqlCmd.Parameters.AddWithValue("SALES", ToDecimal(SALESTextBox.Text))
        End If

        If COST_OF_SALESTextBox.Text = "" Then
            sqlCmd.Parameters.AddWithValue("COST_OF_SALES", 0)
        Else
            sqlCmd.Parameters.AddWithValue("COST_OF_SALES", ToDecimal(COST_OF_SALESTextBox.Text))
        End If

        If COST_OF_SALES_PERCENTTextBox.Text = "" Then
            sqlCmd.Parameters.AddWithValue("COST_OF_SALES_PERCENT", 0)
        Else
            sqlCmd.Parameters.AddWithValue("COST_OF_SALES_PERCENT", ToDecimal(COST_OF_SALES_PERCENTTextBox.Text))
        End If

        If CREDIT_SALETextBox.Text = "" Then
            sqlCmd.Parameters.AddWithValue("CREDIT_SALE", 0)
        Else
            sqlCmd.Parameters.AddWithValue("CREDIT_SALE", ToDecimal(CREDIT_SALETextBox.Text))
        End If
        If CREDIT_TERMTextBox.Text = "" Then
            sqlCmd.Parameters.AddWithValue("CREDIT_TERM", 0)
        Else
            sqlCmd.Parameters.AddWithValue("CREDIT_TERM", ToDecimal(CREDIT_TERMTextBox.Text))
        End If
        If PURCHASETextBox.Text = "" Then
            sqlCmd.Parameters.AddWithValue("PURCHASE", 0)
        Else
            sqlCmd.Parameters.AddWithValue("PURCHASE", ToDecimal(PURCHASETextBox.Text))
        End If
        If CREDIT_PURCHASETextBox.Text = "" Then
            sqlCmd.Parameters.AddWithValue("CREDIT_PURCHASE", 0)
        Else
            sqlCmd.Parameters.AddWithValue("CREDIT_PURCHASE", ToDecimal(CREDIT_PURCHASETextBox.Text))
        End If
        If TERM_PURCHASETextBox.Text = "" Then
            sqlCmd.Parameters.AddWithValue("TERM_PURCHASE", 0)
        Else
            sqlCmd.Parameters.AddWithValue("TERM_PURCHASE", ToDecimal(TERM_PURCHASETextBox.Text))
        End If

        If OPERATING_EXPENSESTextBox.Text = "" Then
            sqlCmd.Parameters.AddWithValue("OPERATING_EXPENSES", 0)
        Else
            sqlCmd.Parameters.AddWithValue("OPERATING_EXPENSES", ToDecimal(OPERATING_EXPENSESTextBox.Text))
        End If

        If OPERATING_EXPENSES_PERCENTTextBox.Text = "" Then
            sqlCmd.Parameters.AddWithValue("OPERATING_EXPENSES_PERCENT", 0)
        Else
            sqlCmd.Parameters.AddWithValue("OPERATING_EXPENSES_PERCENT", ToDecimal(OPERATING_EXPENSES_PERCENTTextBox.Text))
        End If

        If DEFAULT_MARGINTextBox.Text = "" Then
            sqlCmd.Parameters.AddWithValue("DEFAULT_MARGIN", 0)
        Else
            sqlCmd.Parameters.AddWithValue("DEFAULT_MARGIN", ToDecimal(DEFAULT_MARGINTextBox.Text))
        End If

        If GROSS_PROFITTextBox.Text = "" Then
            sqlCmd.Parameters.AddWithValue("GROSS_PROFIT", 0)
        Else
            sqlCmd.Parameters.AddWithValue("GROSS_PROFIT", ToDecimal(GROSS_PROFITTextBox.Text))
        End If

        If TAXTextBox.Text = "" Then
            sqlCmd.Parameters.AddWithValue("TAX", 0)
        Else
            sqlCmd.Parameters.AddWithValue("TAX", ToDecimal(TAXTextBox.Text))
        End If

        If INVENTORY_INTERVIEWTextBox.Text = "" Then
            sqlCmd.Parameters.AddWithValue("INVENTORY_INTERVIEW", 0)
        Else
            sqlCmd.Parameters.AddWithValue("INVENTORY_INTERVIEW", ToDecimal(INVENTORY_INTERVIEWTextBox.Text))
        End If
        If INVENTORY_VISITTextBox.Text = "" Then
            sqlCmd.Parameters.AddWithValue("INVENTORY_VISIT", 0)
        Else
            sqlCmd.Parameters.AddWithValue("INVENTORY_VISIT", ToDecimal(INVENTORY_VISITTextBox.Text))
        End If
        If ACCOUNT_RECEIVABLETextBox.Text = "" Then
            sqlCmd.Parameters.AddWithValue("ACCOUNT_RECEIVABLE", 0)
        Else
            sqlCmd.Parameters.AddWithValue("ACCOUNT_RECEIVABLE", ToDecimal(ACCOUNT_RECEIVABLETextBox.Text))
        End If
        If MACHINERY_EQUIPMENTTextBox.Text = "" Then
            sqlCmd.Parameters.AddWithValue("MACHINERY_EQUIPMENT", 0)
        Else
            sqlCmd.Parameters.AddWithValue("MACHINERY_EQUIPMENT", ToDecimal(MACHINERY_EQUIPMENTTextBox.Text))
        End If

        If CORE_ASSETSTextBox.Text = "" Then
            sqlCmd.Parameters.AddWithValue("CORE_ASSETS", 0)
        Else
            sqlCmd.Parameters.AddWithValue("CORE_ASSETS", ToDecimal(CORE_ASSETSTextBox.Text))
        End If


        If OTHER_FIXED_ASSETS_OTHER_BANKTextBox.Text = "" Then
            sqlCmd.Parameters.AddWithValue("OTHER_FIXED_ASSETS_OTHER_BANK", 0)
        Else
            sqlCmd.Parameters.AddWithValue("OTHER_FIXED_ASSETS_OTHER_BANK", ToDecimal(OTHER_FIXED_ASSETS_OTHER_BANKTextBox.Text))
        End If

        If OTHER_FIXED_ASSETSTextBox.Text = "" Then
            sqlCmd.Parameters.AddWithValue("OTHER_FIXED_ASSETS", 0)
        Else
            sqlCmd.Parameters.AddWithValue("OTHER_FIXED_ASSETS", ToDecimal(OTHER_FIXED_ASSETSTextBox.Text))
        End If


        If CASH_BONDTextBox.Text = "" Then
            sqlCmd.Parameters.AddWithValue("CASH_BOND", 0)
        Else
            sqlCmd.Parameters.AddWithValue("CASH_BOND", ToDecimal(CASH_BONDTextBox.Text))
        End If
        If CALCULATE_RATETextBox.Text = "" Then
            sqlCmd.Parameters.AddWithValue("CALCULATE_RATE", 0)
        Else
            sqlCmd.Parameters.AddWithValue("CALCULATE_RATE", ToDecimal(CALCULATE_RATETextBox.Text))
        End If

        If ACCOUNT_PAYABLETextBox.Text = "" Then
            sqlCmd.Parameters.AddWithValue("ACCOUNT_PAYABLE", 0)
        Else
            sqlCmd.Parameters.AddWithValue("ACCOUNT_PAYABLE", ToDecimal(ACCOUNT_PAYABLETextBox.Text))
        End If
        If CURRENT_LIABILITY_BAYTextBox.Text = "" Then
            sqlCmd.Parameters.AddWithValue("CURRENT_LIABILITY_BAY", 0)
        Else
            sqlCmd.Parameters.AddWithValue("CURRENT_LIABILITY_BAY", ToDecimal(CURRENT_LIABILITY_BAYTextBox.Text))
        End If
        If CURRENT_LIABILITY_OTHER_BANKTextBox.Text = "" Then
            sqlCmd.Parameters.AddWithValue("CURRENT_LIABILITY_OTHER_BANK", 0)
        Else
            sqlCmd.Parameters.AddWithValue("CURRENT_LIABILITY_OTHER_BANK", ToDecimal(CURRENT_LIABILITY_OTHER_BANKTextBox.Text))
        End If
        If OTHER_CURRENT_LIABILITYTextBox.Text = "" Then
            sqlCmd.Parameters.AddWithValue("OTHER_CURRENT_LIABILITY", 0)
        Else
            sqlCmd.Parameters.AddWithValue("OTHER_CURRENT_LIABILITY", ToDecimal(OTHER_CURRENT_LIABILITYTextBox.Text))
        End If
        If LONG_TERM_LIABILITY_BAYTextBox.Text = "" Then
            sqlCmd.Parameters.AddWithValue("LONG_TERM_LIABILITY_BAY", 0)
        Else
            sqlCmd.Parameters.AddWithValue("LONG_TERM_LIABILITY_BAY", ToDecimal(LONG_TERM_LIABILITY_BAYTextBox.Text))
        End If
        If LONG_TERM_LIABILITY_BAY_REPAYMENTTextBox.Text = "" Then
            sqlCmd.Parameters.AddWithValue("LONG_TERM_LIABILITY_BAY_REPAYMENT", 0)
        Else
            sqlCmd.Parameters.AddWithValue("LONG_TERM_LIABILITY_BAY_REPAYMENT", ToDecimal(LONG_TERM_LIABILITY_BAY_REPAYMENTTextBox.Text))
        End If
        If LONG_TERM_LIABILITY_OTHER_BANKTextBox.Text = "" Then
            sqlCmd.Parameters.AddWithValue("LONG_TERM_LIABILITY_OTHER_BANK", 0)
        Else
            sqlCmd.Parameters.AddWithValue("LONG_TERM_LIABILITY_OTHER_BANK", ToDecimal(LONG_TERM_LIABILITY_OTHER_BANKTextBox.Text))
        End If
        If LONG_TERM_LIABILITY_OTHER_REPAYMENTTextBox.Text = "" Then
            sqlCmd.Parameters.AddWithValue("LONG_TERM_LIABILITY_OTHER_REPAYMENT", 0)
        Else
            sqlCmd.Parameters.AddWithValue("LONG_TERM_LIABILITY_OTHER_REPAYMENT", ToDecimal(LONG_TERM_LIABILITY_OTHER_REPAYMENTTextBox.Text))
        End If
        If LONG_TERM_OTHER_LIABILITYTextBox.Text = "" Then
            sqlCmd.Parameters.AddWithValue("LONG_TERM_OTHER_LIABILITY", 0)
        Else
            sqlCmd.Parameters.AddWithValue("LONG_TERM_OTHER_LIABILITY", ToDecimal(LONG_TERM_OTHER_LIABILITYTextBox.Text))
        End If
        If LONG_TERM_OTHER_REPAYMENTTextBox.Text = "" Then
            sqlCmd.Parameters.AddWithValue("LONG_TERM_OTHER_REPAYMENT", 0)
        Else
            sqlCmd.Parameters.AddWithValue("LONG_TERM_OTHER_REPAYMENT", ToDecimal(LONG_TERM_OTHER_REPAYMENTTextBox.Text))
        End If
        If LOANS_REL_CO_DIRECTORSTextBox.Text = "" Then
            sqlCmd.Parameters.AddWithValue("LOANS_REL_CO_DIRECTORS", 0)
        Else
            sqlCmd.Parameters.AddWithValue("LOANS_REL_CO_DIRECTORS", ToDecimal(LOANS_REL_CO_DIRECTORSTextBox.Text))
        End If
        If LG_AVAL_BAYTextBox.Text = "" Then
            sqlCmd.Parameters.AddWithValue("LG_AVAL_BAY", 0)
        Else
            sqlCmd.Parameters.AddWithValue("LG_AVAL_BAY", ToDecimal(LG_AVAL_BAYTextBox.Text))
        End If
        If REFINANCE_WORKING_CAPITAL_OTHERTextBox.Text = "" Then
            sqlCmd.Parameters.AddWithValue("REFINANCE_WORKING_CAPITAL_OTHER", 0)
        Else
            sqlCmd.Parameters.AddWithValue("REFINANCE_WORKING_CAPITAL_OTHER", ToDecimal(REFINANCE_WORKING_CAPITAL_OTHERTextBox.Text))
        End If
        If REFINANCE_WORKING_LOAN_OTHERTextBox.Text = "" Then
            sqlCmd.Parameters.AddWithValue("REFINANCE_WORKING_LOAN_OTHER", 0)
        Else
            sqlCmd.Parameters.AddWithValue("REFINANCE_WORKING_LOAN_OTHER", ToDecimal(REFINANCE_WORKING_LOAN_OTHERTextBox.Text))
        End If
        If REFINANCE_REPAYMENTTextBox.Text = "" Then
            sqlCmd.Parameters.AddWithValue("REFINANCE_REPAYMENT", 0)
        Else
            sqlCmd.Parameters.AddWithValue("REFINANCE_REPAYMENT", ToDecimal(REFINANCE_REPAYMENTTextBox.Text))
        End If
        If WORKING_CAPITALTextBox.Text = "" Then
            sqlCmd.Parameters.AddWithValue("WORKING_CAPITAL", 0)
        Else
            sqlCmd.Parameters.AddWithValue("WORKING_CAPITAL", ToDecimal(WORKING_CAPITALTextBox.Text))
        End If
        If LOANTextBox.Text = "" Then
            sqlCmd.Parameters.AddWithValue("LOAN", 0)
        Else
            sqlCmd.Parameters.AddWithValue("LOAN", ToDecimal(LOANTextBox.Text))
        End If
        If LG_AVALTextBox.Text = "" Then
            sqlCmd.Parameters.AddWithValue("LG_AVAL", 0)
        Else
            sqlCmd.Parameters.AddWithValue("LG_AVAL", ToDecimal(LG_AVALTextBox.Text))
        End If
        If ASSETS_INCREASE_LOANTextBox.Text = "" Then
            sqlCmd.Parameters.AddWithValue("ASSETS_INCREASE_LOAN", 0)
        Else
            sqlCmd.Parameters.AddWithValue("ASSETS_INCREASE_LOAN", ToDecimal(ASSETS_INCREASE_LOANTextBox.Text))
        End If
        If BOND_DEPOSIT_PLEDGE_PERSONTextBox.Text = "" Then
            sqlCmd.Parameters.AddWithValue("BOND_DEPOSIT_PLEDGE_PERSON", 0)
        Else
            sqlCmd.Parameters.AddWithValue("BOND_DEPOSIT_PLEDGE_PERSON", ToDecimal(BOND_DEPOSIT_PLEDGE_PERSONTextBox.Text))
        End If
        If APPRAISAL_VALUE_ZONE_ATextBox.Text = "" Then
            sqlCmd.Parameters.AddWithValue("APPRAISAL_VALUE_ZONE_A", 0)
        Else
            sqlCmd.Parameters.AddWithValue("APPRAISAL_VALUE_ZONE_A", ToDecimal(APPRAISAL_VALUE_ZONE_ATextBox.Text))
        End If
        If APPRAISAL_VALUE_ZONE_BTextBox.Text = "" Then
            sqlCmd.Parameters.AddWithValue("APPRAISAL_VALUE_ZONE_B", 0)
        Else
            sqlCmd.Parameters.AddWithValue("APPRAISAL_VALUE_ZONE_B", ToDecimal(APPRAISAL_VALUE_ZONE_BTextBox.Text))
        End If
        If APPRAISAL_VALUE_ZONE_CTextBox.Text = "" Then
            sqlCmd.Parameters.AddWithValue("APPRAISAL_VALUE_ZONE_C", 0)
        Else
            sqlCmd.Parameters.AddWithValue("APPRAISAL_VALUE_ZONE_C", ToDecimal(APPRAISAL_VALUE_ZONE_CTextBox.Text))
        End If
        If APPRAISAL_VALUE_ZONE_DTextBox.Text = "" Then
            sqlCmd.Parameters.AddWithValue("APPRAISAL_VALUE_ZONE_D", 0)
        Else
            sqlCmd.Parameters.AddWithValue("APPRAISAL_VALUE_ZONE_D", ToDecimal(APPRAISAL_VALUE_ZONE_DTextBox.Text))
        End If

        If APPRAISAL_VALUE_ZONE_ETextBox.Text = "" Then
            sqlCmd.Parameters.AddWithValue("APPRAISAL_VALUE_ZONE_E", 0)
        Else
            sqlCmd.Parameters.AddWithValue("APPRAISAL_VALUE_ZONE_E", ToDecimal(APPRAISAL_VALUE_ZONE_ETextBox.Text))
        End If

        If APPRAISAL_VALUE_ZONE_FTextBox.Text = "" Then
            sqlCmd.Parameters.AddWithValue("APPRAISAL_VALUE_ZONE_F", 0)
        Else
            sqlCmd.Parameters.AddWithValue("APPRAISAL_VALUE_ZONE_F", ToDecimal(APPRAISAL_VALUE_ZONE_FTextBox.Text))
        End If

        If APPRAISAL_VALUE_ZONE_GTextBox.Text = "" Then
            sqlCmd.Parameters.AddWithValue("APPRAISAL_VALUE_ZONE_G", 0)
        Else
            sqlCmd.Parameters.AddWithValue("APPRAISAL_VALUE_ZONE_G", ToDecimal(APPRAISAL_VALUE_ZONE_GTextBox.Text))
        End If

        If TCG_GUARANTEETextBox.Text = "" Then
            sqlCmd.Parameters.AddWithValue("TCG_GUARANTEE", 0)
        Else
            sqlCmd.Parameters.AddWithValue("TCG_GUARANTEE", ToDecimal(TCG_GUARANTEETextBox.Text))
        End If


        If BOND_DEPOSIT_PLEDGETextBox.Text = "" Then
            sqlCmd.Parameters.AddWithValue("BOND_DEPOSIT_PLEDGE", 0)
        Else
            sqlCmd.Parameters.AddWithValue("BOND_DEPOSIT_PLEDGE", ToDecimal(BOND_DEPOSIT_PLEDGETextBox.Text))
        End If
        If CASH_BOND_CALTextBox.Text = "" Then
            sqlCmd.Parameters.AddWithValue("CASH_BOND_CAL", 0)
        Else
            sqlCmd.Parameters.AddWithValue("CASH_BOND_CAL", ToDecimal(CASH_BOND_CALTextBox.Text))
        End If
        If ACCOUNT_RECEIVABLE_CALTextBox.Text = "" Then
            sqlCmd.Parameters.AddWithValue("ACCOUNT_RECEIVABLE_CAL", 0)
        Else
            sqlCmd.Parameters.AddWithValue("ACCOUNT_RECEIVABLE_CAL", ToDecimal(ACCOUNT_RECEIVABLE_CALTextBox.Text))
        End If
        If INVENTORY_CALTextBox.Text = "" Then
            sqlCmd.Parameters.AddWithValue("INVENTORY_CAL", 0)
        Else
            sqlCmd.Parameters.AddWithValue("INVENTORY_CAL", ToDecimal(INVENTORY_CALTextBox.Text))
        End If
        If TOTAL_CURRENT_ASSETS_CALTextBox.Text = "" Then
            sqlCmd.Parameters.AddWithValue("TOTAL_CURRENT_ASSETS_CAL", 0)
        Else
            sqlCmd.Parameters.AddWithValue("TOTAL_CURRENT_ASSETS_CAL", ToDecimal(TOTAL_CURRENT_ASSETS_CALTextBox.Text))
        End If

        If MACHINERY_EQUIPMENT_CALTextBox.Text = "" Then
            sqlCmd.Parameters.AddWithValue("MACHINERY_EQUIPMENT_CAL", 0)
        Else
            sqlCmd.Parameters.AddWithValue("MACHINERY_EQUIPMENT_CAL", ToDecimal(MACHINERY_EQUIPMENT_CALTextBox.Text))
        End If

        If PROPERTY_PLANT_BUILDING_CALTextBox.Text = "" Then
            sqlCmd.Parameters.AddWithValue("PROPERTY_PLANT_BUILDING_CAL", 0)
        Else
            sqlCmd.Parameters.AddWithValue("PROPERTY_PLANT_BUILDING_CAL", ToDecimal(PROPERTY_PLANT_BUILDING_CALTextBox.Text))
        End If

        If OTHER_FIXED_ASSETS_OTHER_BANK_CALTextBox.Text = "" Then
            sqlCmd.Parameters.AddWithValue("OTHER_FIXED_ASSETS_OTHER_BANK_CAL", 0)
        Else
            sqlCmd.Parameters.AddWithValue("OTHER_FIXED_ASSETS_OTHER_BANK_CAL", ToDecimal(OTHER_FIXED_ASSETS_OTHER_BANK_CALTextBox.Text))
        End If

        If OTHER_FIXED_ASSETS_CALTextBox.Text = "" Then
            sqlCmd.Parameters.AddWithValue("OTHER_FIXED_ASSETS_CAL", 0)
        Else
            sqlCmd.Parameters.AddWithValue("OTHER_FIXED_ASSETS_CAL", ToDecimal(OTHER_FIXED_ASSETS_CALTextBox.Text))
        End If

        If ASSETS_FROM_CREDIT_CALTextBox.Text = "" Then
            sqlCmd.Parameters.AddWithValue("ASSETS_FROM_CREDIT_CAL", 0)
        Else
            sqlCmd.Parameters.AddWithValue("ASSETS_FROM_CREDIT_CAL", ToDecimal(ASSETS_FROM_CREDIT_CALTextBox.Text))
        End If

        If TOTAL_FIXED_ASSETS_CALTextBox.Text = "" Then
            sqlCmd.Parameters.AddWithValue("TOTAL_FIXED_ASSETS_CAL", 0)
        Else
            sqlCmd.Parameters.AddWithValue("TOTAL_FIXED_ASSETS_CAL", ToDecimal(TOTAL_FIXED_ASSETS_CALTextBox.Text))
        End If

        If TOTAL_FIXED_ASSETS_CALTextBox.Text = "" Then
            sqlCmd.Parameters.AddWithValue("TOTAL_ASSETS_CAL", 0)
        Else
            sqlCmd.Parameters.AddWithValue("TOTAL_ASSETS_CAL", ToDecimal(TOTAL_ASSETS_CALTextBox.Text))
        End If

        If ACCOUNT_PAYABLE_CALTextBox.Text = "" Then
            sqlCmd.Parameters.AddWithValue("ACCOUNT_PAYABLE_CAL", 0)
        Else
            sqlCmd.Parameters.AddWithValue("ACCOUNT_PAYABLE_CAL", ToDecimal(ACCOUNT_PAYABLE_CALTextBox.Text))
        End If

        If CURRENT_LIABILITY_BAY_CALTextBox.Text = "" Then
            sqlCmd.Parameters.AddWithValue("CURRENT_LIABILITY_BAY_CAL", 0)
        Else
            sqlCmd.Parameters.AddWithValue("CURRENT_LIABILITY_BAY_CAL", ToDecimal(CURRENT_LIABILITY_BAY_CALTextBox.Text))
        End If

        If OTHER_CURRENT_LIABILITY_CALTextBox.Text = "" Then
            sqlCmd.Parameters.AddWithValue("OTHER_CURRENT_LIABILITY_CAL", 0)
        Else
            sqlCmd.Parameters.AddWithValue("OTHER_CURRENT_LIABILITY_CAL", ToDecimal(OTHER_CURRENT_LIABILITY_CALTextBox.Text))
        End If

        If TOTAL_CURRENT_LIABILITY_CALTextBox.Text = "" Then
            sqlCmd.Parameters.AddWithValue("TOTAL_CURRENT_LIABILITY_CAL", 0)
        Else
            sqlCmd.Parameters.AddWithValue("TOTAL_CURRENT_LIABILITY_CAL", ToDecimal(TOTAL_CURRENT_LIABILITY_CALTextBox.Text))
        End If

        If LONG_TERM_LIABILITY_BAY_CALTextBox.Text = "" Then
            sqlCmd.Parameters.AddWithValue("LONG_TERM_LIABILITY_BAY_CAL", 0)
        Else
            sqlCmd.Parameters.AddWithValue("LONG_TERM_LIABILITY_BAY_CAL", ToDecimal(LONG_TERM_LIABILITY_BAY_CALTextBox.Text))
        End If

        If OTHER_LONG_TERM_LIABILITY_CALTextBox.Text = "" Then
            sqlCmd.Parameters.AddWithValue("OTHER_LONG_TERM_LIABILITY_CAL", 0)
        Else
            sqlCmd.Parameters.AddWithValue("OTHER_LONG_TERM_LIABILITY_CAL", ToDecimal(OTHER_LONG_TERM_LIABILITY_CALTextBox.Text))
        End If

        If TOTAL_LIABILITY_CALTextBox.Text = "" Then
            sqlCmd.Parameters.AddWithValue("TOTAL_LIABILITY_CAL", 0)
        Else
            sqlCmd.Parameters.AddWithValue("TOTAL_LIABILITY_CAL", ToDecimal(TOTAL_LIABILITY_CALTextBox.Text))
        End If

        If LOANS_REL_CO_DIRECTORS_CALTextBox.Text = "" Then
            sqlCmd.Parameters.AddWithValue("LOANS_REL_CO_DIRECTORS_CAL", 0)
        Else
            sqlCmd.Parameters.AddWithValue("LOANS_REL_CO_DIRECTORS_CAL", ToDecimal(LOANS_REL_CO_DIRECTORS_CALTextBox.Text))
        End If

        If EQUITY_CALTextBox.Text = "" Then
            sqlCmd.Parameters.AddWithValue("EQUITY_CAL", 0)
        Else
            sqlCmd.Parameters.AddWithValue("EQUITY_CAL", ToDecimal(EQUITY_CALTextBox.Text))
        End If

        If LIABILITY_EQUITY_CALTextBox.Text = "" Then
            sqlCmd.Parameters.AddWithValue("LIABILITY_EQUITY_CAL", 0)
        Else
            sqlCmd.Parameters.AddWithValue("LIABILITY_EQUITY_CAL", ToDecimal(LIABILITY_EQUITY_CALTextBox.Text))
        End If

        If EBIDA_PERCENT_CALTextBox.Text = "" Then
            sqlCmd.Parameters.AddWithValue("EBIDA_PERCENT_CAL", 0)
        Else
            sqlCmd.Parameters.AddWithValue("EBIDA_PERCENT_CAL", ToDecimal(EBIDA_PERCENT_CALTextBox.Text))
        End If

        If EBIDA_CALTextBox.Text = "" Then
            sqlCmd.Parameters.AddWithValue("EBIDA_CAL", 0)
        Else
            sqlCmd.Parameters.AddWithValue("EBIDA_CAL", ToDecimal(EBIDA_CALTextBox.Text))
        End If

        If DE_BEFORE_LOAN_CALTextBox.Text = "" Then
            sqlCmd.Parameters.AddWithValue("DE_BEFORE_LOAN_CAL", 0)
        Else
            sqlCmd.Parameters.AddWithValue("DE_BEFORE_LOAN_CAL", ToDecimal(DE_BEFORE_LOAN_CALTextBox.Text))
        End If

        If DSCR_BEFORE_LOAN_CALTextBox.Text = "" Then
            sqlCmd.Parameters.AddWithValue("DSCR_BEFORE_LOAN_CAL", 0)
        Else
            sqlCmd.Parameters.AddWithValue("DSCR_BEFORE_LOAN_CAL", ToDecimal(DSCR_BEFORE_LOAN_CALTextBox.Text))
        End If

        If AR_DAY_CALTextBox.Text = "" Then
            sqlCmd.Parameters.AddWithValue("AR_DAY_CAL", 0)
        Else
            sqlCmd.Parameters.AddWithValue("AR_DAY_CAL", ToDecimal(AR_DAY_CALTextBox.Text))
        End If

        If INVENTORY_DAY_CALTextBox.Text = "" Then
            sqlCmd.Parameters.AddWithValue("INVENTORY_DAY_CAL", 0)
        Else
            sqlCmd.Parameters.AddWithValue("INVENTORY_DAY_CAL", ToDecimal(INVENTORY_DAY_CALTextBox.Text))
        End If

        If WORKING_CAPITAL_NEED_CALTextBox.Text = "" Then
            sqlCmd.Parameters.AddWithValue("WORKING_CAPITAL_NEED_CAL", 0)
        Else
            sqlCmd.Parameters.AddWithValue("WORKING_CAPITAL_NEED_CAL", ToDecimal(WORKING_CAPITAL_NEED_CALTextBox.Text))
        End If

        If LOAN_NEED_CALTextBox.Text = "" Then
            sqlCmd.Parameters.AddWithValue("LOAN_NEED_CAL", 0)
        Else
            sqlCmd.Parameters.AddWithValue("LOAN_NEED_CAL", ToDecimal(LOAN_NEED_CALTextBox.Text))
        End If

        If OWNERS_EQUITY_PERCENT_CALTextBox.Text = "" Then
            sqlCmd.Parameters.AddWithValue("OWNERS_EQUITY_PERCENT_CAL", 0)
        Else
            sqlCmd.Parameters.AddWithValue("OWNERS_EQUITY_PERCENT_CAL", ToDecimal(OWNERS_EQUITY_PERCENT_CALTextBox.Text))
        End If

        If OWNERS_EQUITY_CALTextBox.Text = "" Then
            sqlCmd.Parameters.AddWithValue("OWNERS_EQUITY_CAL", 0)
        Else
            sqlCmd.Parameters.AddWithValue("OWNERS_EQUITY_CAL", ToDecimal(OWNERS_EQUITY_CALTextBox.Text))
        End If

        If FIXED_INTEREST_PERCENT_CALTextBox.Text = "" Then
            sqlCmd.Parameters.AddWithValue("FIXED_INTEREST_PERCENT_CAL", 0)
        Else
            sqlCmd.Parameters.AddWithValue("FIXED_INTEREST_PERCENT_CAL", ToDecimal(FIXED_INTEREST_PERCENT_CALTextBox.Text))
        End If

        If PAYMENT_PERIOD_CALTextBox.Text = "" Then
            sqlCmd.Parameters.AddWithValue("PAYMENT_PERIOD_CAL", 0)
        Else
            sqlCmd.Parameters.AddWithValue("PAYMENT_PERIOD_CAL", ToDecimal(PAYMENT_PERIOD_CALTextBox.Text))
        End If

        If AVERAGE_PAYMENT_PERIOD_CALTextBox.Text = "" Then
            sqlCmd.Parameters.AddWithValue("AVERAGE_PAYMENT_PERIOD_CAL", 0)
        Else
            sqlCmd.Parameters.AddWithValue("AVERAGE_PAYMENT_PERIOD_CAL", ToDecimal(AVERAGE_PAYMENT_PERIOD_CALTextBox.Text))
        End If

        If WORKING_CAPITAL_APPROVE_CALTextBox.Text = "" Then
            sqlCmd.Parameters.AddWithValue("WORKING_CAPITAL_APPROVE_CAL", 0)
        Else
            sqlCmd.Parameters.AddWithValue("WORKING_CAPITAL_APPROVE_CAL", ToDecimal(WORKING_CAPITAL_APPROVE_CALTextBox.Text))
        End If

        If LOAN_APPROVE_CALTextBox.Text = "" Then
            sqlCmd.Parameters.AddWithValue("LOAN_APPROVE_CAL", 0)
        Else
            sqlCmd.Parameters.AddWithValue("LOAN_APPROVE_CAL", ToDecimal(LOAN_APPROVE_CALTextBox.Text))
        End If

        If INTEREST_RATE_PERCENTTextBox.Text = "" Then
            sqlCmd.Parameters.AddWithValue("INTEREST_RATE_PERCENT", 0)
        Else
            sqlCmd.Parameters.AddWithValue("INTEREST_RATE_PERCENT", ToDecimal(INTEREST_RATE_PERCENTTextBox.Text))
        End If

        If INTEREST_RATE_PERCENT_USEDTextBox.Text = "" Then
            sqlCmd.Parameters.AddWithValue("INTEREST_RATE_PERCENT_USED", 0)
        Else
            sqlCmd.Parameters.AddWithValue("INTEREST_RATE_PERCENT_USED", ToDecimal(INTEREST_RATE_PERCENT_USEDTextBox.Text))
        End If

        If CONTRACT_YEARTextBox.Text = "" Then
            sqlCmd.Parameters.AddWithValue("CONTRACT_YEAR", 0)
        Else
            sqlCmd.Parameters.AddWithValue("CONTRACT_YEAR", ToDecimal(CONTRACT_YEARTextBox.Text))
        End If

        If DSCR_THIS_TIMETextBox.Text = "" Then
            sqlCmd.Parameters.AddWithValue("DSCR_THIS_TIME", 0)
        Else
            sqlCmd.Parameters.AddWithValue("DSCR_THIS_TIME", ToDecimal(DSCR_THIS_TIMETextBox.Text))
        End If

        If DSCR_THIS_TIME_PERCENTTextBox.Text = "" Then
            sqlCmd.Parameters.AddWithValue("DSCR_THIS_TIME_PERCENT", 0)
        Else
            sqlCmd.Parameters.AddWithValue("DSCR_THIS_TIME_PERCENT", ToDecimal(DSCR_THIS_TIME_PERCENTTextBox.Text))
        End If

        If DE_THIS_TIMETextBox.Text = "" Then
            sqlCmd.Parameters.AddWithValue("DE_THIS_TIME", 0)
        Else
            sqlCmd.Parameters.AddWithValue("DE_THIS_TIME", ToDecimal(DE_THIS_TIMETextBox.Text))
        End If

        If LTV_THIS_TIMETextBox.Text = "" Then
            sqlCmd.Parameters.AddWithValue("LTV_THIS_TIME", 0)
        Else
            sqlCmd.Parameters.AddWithValue("LTV_THIS_TIME", ToDecimal(LTV_THIS_TIMETextBox.Text))
        End If

        If LTV_THIS_TIME_PERCENTTextBox.Text = "" Then
            sqlCmd.Parameters.AddWithValue("LTV_THIS_TIME_PERCENT", 0)
        Else
            sqlCmd.Parameters.AddWithValue("LTV_THIS_TIME_PERCENT", ToDecimal(LTV_THIS_TIME_PERCENTTextBox.Text))
        End If

        If WORKING_CAPITAL_DEFAULTTextBox.Text = "" Then
            sqlCmd.Parameters.AddWithValue("WORKING_CAPITAL_DEFAULT", 0)
        Else
            sqlCmd.Parameters.AddWithValue("WORKING_CAPITAL_DEFAULT", ToDecimal(WORKING_CAPITAL_DEFAULTTextBox.Text))
        End If

        If LOAN_DEFAULTTextBox.Text = "" Then
            sqlCmd.Parameters.AddWithValue("LOAN_DEFAULT", 0)
        Else
            sqlCmd.Parameters.AddWithValue("LOAN_DEFAULT", ToDecimal(LOAN_DEFAULTTextBox.Text))
        End If

        If WORKING_CAPITAL_DEFAULT_APPROVETextBox.Text = "" Then
            sqlCmd.Parameters.AddWithValue("WORKING_CAPITAL_DEFAULT_APPROVE", 0)
        Else
            sqlCmd.Parameters.AddWithValue("WORKING_CAPITAL_DEFAULT_APPROVE", ToDecimal(WORKING_CAPITAL_DEFAULT_APPROVETextBox.Text))
        End If

        If LOAN_DEFAULT_APPROVETextBox.Text = "" Then
            sqlCmd.Parameters.AddWithValue("LOAN_DEFAULT_APPROVE", 0)
        Else
            sqlCmd.Parameters.AddWithValue("LOAN_DEFAULT_APPROVE", ToDecimal(LOAN_DEFAULT_APPROVETextBox.Text))
        End If

        If CURRENT_ASSET_OTHERTextBox.Text = "" Then
            sqlCmd.Parameters.AddWithValue("CURRENT_ASSET_OTHER", 0)
        Else
            sqlCmd.Parameters.AddWithValue("CURRENT_ASSET_OTHER", ToDecimal(CURRENT_ASSET_OTHERTextBox.Text))
        End If

        sqlCmd.ExecuteNonQuery()

        sqlCmd.Transaction.Commit()
        'Catch ex As Exception
        '    sqlCmd.Transaction.Rollback()
        '    runScirpt("alert('Cannot save data. \n " & ex.Message.Replace("'", "") & "');")
        '    Exit Sub
        ' Finally
        If (conn.State = ConnectionState.Open) Then
            conn.Close()
        End If
        conn = Nothing
        Dim jscript As String = ""


        If action = "Insert" Then

            jscript = jscript & "changeMenu(""" & SMES_IDTextBox.Text & """);"
            jscript = jscript & "showDialog('Insert Complete');"
            'jscript = jscript & "alert('Insert Complete');"
            BtnInsert.Visible = False
            BtnUpdate.Visible = True
        Else
            jscript = jscript & "changeMenu(""" & SMES_IDTextBox.Text & """);"
            jscript = jscript & "showDialog('Update Complete');"
            'jscript = jscript & "alert('Insert Complete');"
        End If

        ' jscript = jscript & "changePage(""" & SMES_IDTextBox.Text & """,""" & SMES_TYPETextBox.Text & """);"
        runScirpt(jscript)  ' เรียก javascript 

        'End Try

    End Sub
    'Sub UpdateData()
    '    If SMES_DATA_IDTextBox.Text = "" Then
    '        alert("Can 't update lost data id.")
    '    End If
    '    'declare connection
    '    'declare connection
    '    Dim conn As SqlConnection = Nothing
    '    Dim sqlCmd As New SqlCommand()
    '    Dim sql As String = Nothing
    '    Try
    '        conn = ConnectionUtil.getSqlConnectionFromWebConfig()

    '        sqlCmd.Connection = conn
    '        sqlCmd.Transaction = sqlCmd.Connection.BeginTransaction()
    '        sqlCmd.CommandText = "[SME_S].[P_SS_FINANCIAL_DATA_UPDATE]"
    '        sqlCmd.CommandType = CommandType.StoredProcedure

    '        sqlCmd.Parameters.AddWithValue("SMES_DATA_ID", SMES_DATA_IDTextBox.Text)


    '        If SMES_IDTextBox.Text = "" Then
    '            sqlCmd.Parameters.AddWithValue("SMES_ID", System.DBNull.Value)
    '        Else
    '            sqlCmd.Parameters.AddWithValue("SMES_ID", SMES_IDTextBox.Text)
    '        End If

    '        If SMES_TYPETextBox.Text = "" Then
    '            sqlCmd.Parameters.AddWithValue("SMES_TYPE", System.DBNull.Value)
    '        Else
    '            sqlCmd.Parameters.AddWithValue("SMES_TYPE", SMES_TYPETextBox.Text)
    '        End If

    '        If USERTextBox.Text = "" Then
    '            sqlCmd.Parameters.AddWithValue("UPDATE_USER", System.DBNull.Value)
    '        Else
    '            sqlCmd.Parameters.AddWithValue("UPDATE_USER", USERTextBox.Text)
    '        End If


    '        If SALESTextBox.Text = "" Then
    '            sqlCmd.Parameters.AddWithValue("SALES", System.DBNull.Value)
    '        Else
    '            sqlCmd.Parameters.AddWithValue("SALES", ToDecimal(SALESTextBox.Text))
    '        End If

    '        If COST_OF_SALESTextBox.Text = "" Then
    '            sqlCmd.Parameters.AddWithValue("COST_OF_SALES", System.DBNull.Value)
    '        Else
    '            sqlCmd.Parameters.AddWithValue("COST_OF_SALES", ToDecimal(COST_OF_SALESTextBox.Text))
    '        End If

    '        If COST_OF_SALES_PERCENTTextBox.Text = "" Then
    '            sqlCmd.Parameters.AddWithValue("COST_OF_SALES_PERCENT", System.DBNull.Value)
    '        Else
    '            sqlCmd.Parameters.AddWithValue("COST_OF_SALES_PERCENT", ToDecimal(COST_OF_SALES_PERCENTTextBox.Text))
    '        End If

    '        If CREDIT_SALETextBox.Text = "" Then
    '            sqlCmd.Parameters.AddWithValue("CREDIT_SALE", System.DBNull.Value)
    '        Else
    '            sqlCmd.Parameters.AddWithValue("CREDIT_SALE", ToDecimal(CREDIT_SALETextBox.Text))
    '        End If
    '        If CREDIT_TERMTextBox.Text = "" Then
    '            sqlCmd.Parameters.AddWithValue("CREDIT_TERM", System.DBNull.Value)
    '        Else
    '            sqlCmd.Parameters.AddWithValue("CREDIT_TERM", ToDecimal(CREDIT_TERMTextBox.Text))
    '        End If
    '        If PURCHASETextBox.Text = "" Then
    '            sqlCmd.Parameters.AddWithValue("PURCHASE", System.DBNull.Value)
    '        Else
    '            sqlCmd.Parameters.AddWithValue("PURCHASE", ToDecimal(PURCHASETextBox.Text))
    '        End If
    '        If CREDIT_PURCHASETextBox.Text = "" Then
    '            sqlCmd.Parameters.AddWithValue("CREDIT_PURCHASE", System.DBNull.Value)
    '        Else
    '            sqlCmd.Parameters.AddWithValue("CREDIT_PURCHASE", ToDecimal(CREDIT_PURCHASETextBox.Text))
    '        End If
    '        If TERM_PURCHASETextBox.Text = "" Then
    '            sqlCmd.Parameters.AddWithValue("TERM_PURCHASE", System.DBNull.Value)
    '        Else
    '            sqlCmd.Parameters.AddWithValue("TERM_PURCHASE", ToDecimal(TERM_PURCHASETextBox.Text))
    '        End If

    '        If OPERATING_EXPENSESTextBox.Text = "" Then
    '            sqlCmd.Parameters.AddWithValue("OPERATING_EXPENSES", System.DBNull.Value)
    '        Else
    '            sqlCmd.Parameters.AddWithValue("OPERATING_EXPENSES", ToDecimal(OPERATING_EXPENSESTextBox.Text))
    '        End If

    '        If OPERATING_EXPENSES_PERCENTTextBox.Text = "" Then
    '            sqlCmd.Parameters.AddWithValue("OPERATING_EXPENSES_PERCENT", System.DBNull.Value)
    '        Else
    '            sqlCmd.Parameters.AddWithValue("OPERATING_EXPENSES_PERCENT", ToDecimal(OPERATING_EXPENSES_PERCENTTextBox.Text))
    '        End If

    '        If DEFAULT_MARGINTextBox.Text = "" Then
    '            sqlCmd.Parameters.AddWithValue("DEFAULT_MARGIN", System.DBNull.Value)
    '        Else
    '            sqlCmd.Parameters.AddWithValue("DEFAULT_MARGIN", ToDecimal(DEFAULT_MARGINTextBox.Text))
    '        End If

    '        If GROSS_PROFITTextBox.Text = "" Then
    '            sqlCmd.Parameters.AddWithValue("GROSS_PROFIT", System.DBNull.Value)
    '        Else
    '            sqlCmd.Parameters.AddWithValue("GROSS_PROFIT", ToDecimal(GROSS_PROFITTextBox.Text))
    '        End If

    '        If TAXTextBox.Text = "" Then
    '            sqlCmd.Parameters.AddWithValue("TAX", System.DBNull.Value)
    '        Else
    '            sqlCmd.Parameters.AddWithValue("TAX", ToDecimal(TAXTextBox.Text))
    '        End If

    '        If INVENTORY_INTERVIEWTextBox.Text = "" Then
    '            sqlCmd.Parameters.AddWithValue("INVENTORY_INTERVIEW", System.DBNull.Value)
    '        Else
    '            sqlCmd.Parameters.AddWithValue("INVENTORY_INTERVIEW", ToDecimal(INVENTORY_INTERVIEWTextBox.Text))
    '        End If
    '        If INVENTORY_VISITTextBox.Text = "" Then
    '            sqlCmd.Parameters.AddWithValue("INVENTORY_VISIT", System.DBNull.Value)
    '        Else
    '            sqlCmd.Parameters.AddWithValue("INVENTORY_VISIT", ToDecimal(INVENTORY_VISITTextBox.Text))
    '        End If
    '        If ACCOUNT_RECEIVABLETextBox.Text = "" Then
    '            sqlCmd.Parameters.AddWithValue("ACCOUNT_RECEIVABLE", System.DBNull.Value)
    '        Else
    '            sqlCmd.Parameters.AddWithValue("ACCOUNT_RECEIVABLE", ToDecimal(ACCOUNT_RECEIVABLETextBox.Text))
    '        End If
    '        If MACHINERY_EQUIPMENTTextBox.Text = "" Then
    '            sqlCmd.Parameters.AddWithValue("MACHINERY_EQUIPMENT", System.DBNull.Value)
    '        Else
    '            sqlCmd.Parameters.AddWithValue("MACHINERY_EQUIPMENT", ToDecimal(MACHINERY_EQUIPMENTTextBox.Text))
    '        End If

    '        If CORE_ASSETSTextBox.Text = "" Then
    '            sqlCmd.Parameters.AddWithValue("CORE_ASSETS", System.DBNull.Value)
    '        Else
    '            sqlCmd.Parameters.AddWithValue("CORE_ASSETS", ToDecimal(CORE_ASSETSTextBox.Text))
    '        End If

    '        If OTHER_FIXED_ASSETSTextBox.Text = "" Then
    '            sqlCmd.Parameters.AddWithValue("OTHER_FIXED_ASSETS", System.DBNull.Value)
    '        Else
    '            sqlCmd.Parameters.AddWithValue("OTHER_FIXED_ASSETS", ToDecimal(OTHER_FIXED_ASSETSTextBox.Text))
    '        End If

    '        If OTHER_FIXED_ASSETS_OTHER_BANKTextBox.Text = "" Then
    '            sqlCmd.Parameters.AddWithValue("OTHER_FIXED_ASSETS_OTHER_BANK", System.DBNull.Value)
    '        Else
    '            sqlCmd.Parameters.AddWithValue("OTHER_FIXED_ASSETS_OTHER_BANK", ToDecimal(OTHER_FIXED_ASSETS_OTHER_BANKTextBox.Text))
    '        End If

    '        If CASH_BONDTextBox.Text = "" Then
    '            sqlCmd.Parameters.AddWithValue("CASH_BOND", System.DBNull.Value)
    '        Else
    '            sqlCmd.Parameters.AddWithValue("CASH_BOND", ToDecimal(CASH_BONDTextBox.Text))
    '        End If
    '        If CALCULATE_RATETextBox.Text = "" Then
    '            sqlCmd.Parameters.AddWithValue("CALCULATE_RATE", System.DBNull.Value)
    '        Else
    '            sqlCmd.Parameters.AddWithValue("CALCULATE_RATE", ToDecimal(CALCULATE_RATETextBox.Text))
    '        End If

    '        If ACCOUNT_PAYABLETextBox.Text = "" Then
    '            sqlCmd.Parameters.AddWithValue("ACCOUNT_PAYABLE", System.DBNull.Value)
    '        Else
    '            sqlCmd.Parameters.AddWithValue("ACCOUNT_PAYABLE", ToDecimal(ACCOUNT_PAYABLETextBox.Text))
    '        End If
    '        If CURRENT_LIABILITY_BAYTextBox.Text = "" Then
    '            sqlCmd.Parameters.AddWithValue("CURRENT_LIABILITY_BAY", System.DBNull.Value)
    '        Else
    '            sqlCmd.Parameters.AddWithValue("CURRENT_LIABILITY_BAY", ToDecimal(CURRENT_LIABILITY_BAYTextBox.Text))
    '        End If
    '        If CURRENT_LIABILITY_OTHER_BANKTextBox.Text = "" Then
    '            sqlCmd.Parameters.AddWithValue("CURRENT_LIABILITY_OTHER_BANK", System.DBNull.Value)
    '        Else
    '            sqlCmd.Parameters.AddWithValue("CURRENT_LIABILITY_OTHER_BANK", ToDecimal(CURRENT_LIABILITY_OTHER_BANKTextBox.Text))
    '        End If
    '        If OTHER_CURRENT_LIABILITYTextBox.Text = "" Then
    '            sqlCmd.Parameters.AddWithValue("OTHER_CURRENT_LIABILITY", System.DBNull.Value)
    '        Else
    '            sqlCmd.Parameters.AddWithValue("OTHER_CURRENT_LIABILITY", ToDecimal(OTHER_CURRENT_LIABILITYTextBox.Text))
    '        End If
    '        If LONG_TERM_LIABILITY_BAYTextBox.Text = "" Then
    '            sqlCmd.Parameters.AddWithValue("LONG_TERM_LIABILITY_BAY", System.DBNull.Value)
    '        Else
    '            sqlCmd.Parameters.AddWithValue("LONG_TERM_LIABILITY_BAY", ToDecimal(LONG_TERM_LIABILITY_BAYTextBox.Text))
    '        End If
    '        If LONG_TERM_LIABILITY_BAY_REPAYMENTTextBox.Text = "" Then
    '            sqlCmd.Parameters.AddWithValue("LONG_TERM_LIABILITY_BAY_REPAYMENT", System.DBNull.Value)
    '        Else
    '            sqlCmd.Parameters.AddWithValue("LONG_TERM_LIABILITY_BAY_REPAYMENT", ToDecimal(LONG_TERM_LIABILITY_BAY_REPAYMENTTextBox.Text))
    '        End If
    '        If LONG_TERM_LIABILITY_OTHER_BANKTextBox.Text = "" Then
    '            sqlCmd.Parameters.AddWithValue("LONG_TERM_LIABILITY_OTHER_BANK", System.DBNull.Value)
    '        Else
    '            sqlCmd.Parameters.AddWithValue("LONG_TERM_LIABILITY_OTHER_BANK", ToDecimal(LONG_TERM_LIABILITY_OTHER_BANKTextBox.Text))
    '        End If
    '        If LONG_TERM_LIABILITY_OTHER_REPAYMENTTextBox.Text = "" Then
    '            sqlCmd.Parameters.AddWithValue("LONG_TERM_LIABILITY_OTHER_REPAYMENT", System.DBNull.Value)
    '        Else
    '            sqlCmd.Parameters.AddWithValue("LONG_TERM_LIABILITY_OTHER_REPAYMENT", ToDecimal(LONG_TERM_LIABILITY_OTHER_REPAYMENTTextBox.Text))
    '        End If
    '        If LONG_TERM_OTHER_LIABILITYTextBox.Text = "" Then
    '            sqlCmd.Parameters.AddWithValue("LONG_TERM_OTHER_LIABILITY", System.DBNull.Value)
    '        Else
    '            sqlCmd.Parameters.AddWithValue("LONG_TERM_OTHER_LIABILITY", ToDecimal(LONG_TERM_OTHER_LIABILITYTextBox.Text))
    '        End If
    '        If LONG_TERM_OTHER_REPAYMENTTextBox.Text = "" Then
    '            sqlCmd.Parameters.AddWithValue("LONG_TERM_OTHER_REPAYMENT", System.DBNull.Value)
    '        Else
    '            sqlCmd.Parameters.AddWithValue("LONG_TERM_OTHER_REPAYMENT", ToDecimal(LONG_TERM_OTHER_REPAYMENTTextBox.Text))
    '        End If
    '        If LOANS_REL_CO_DIRECTORSTextBox.Text = "" Then
    '            sqlCmd.Parameters.AddWithValue("LOANS_REL_CO_DIRECTORS", System.DBNull.Value)
    '        Else
    '            sqlCmd.Parameters.AddWithValue("LOANS_REL_CO_DIRECTORS", ToDecimal(LOANS_REL_CO_DIRECTORSTextBox.Text))
    '        End If
    '        If LG_AVAL_BAYTextBox.Text = "" Then
    '            sqlCmd.Parameters.AddWithValue("LG_AVAL_BAY", System.DBNull.Value)
    '        Else
    '            sqlCmd.Parameters.AddWithValue("LG_AVAL_BAY", ToDecimal(LG_AVAL_BAYTextBox.Text))
    '        End If
    '        If REFINANCE_WORKING_CAPITAL_OTHERTextBox.Text = "" Then
    '            sqlCmd.Parameters.AddWithValue("REFINANCE_WORKING_CAPITAL_OTHER", System.DBNull.Value)
    '        Else
    '            sqlCmd.Parameters.AddWithValue("REFINANCE_WORKING_CAPITAL_OTHER", ToDecimal(REFINANCE_WORKING_CAPITAL_OTHERTextBox.Text))
    '        End If
    '        If REFINANCE_WORKING_LOAN_OTHERTextBox.Text = "" Then
    '            sqlCmd.Parameters.AddWithValue("REFINANCE_WORKING_LOAN_OTHER", System.DBNull.Value)
    '        Else
    '            sqlCmd.Parameters.AddWithValue("REFINANCE_WORKING_LOAN_OTHER", ToDecimal(REFINANCE_WORKING_LOAN_OTHERTextBox.Text))
    '        End If
    '        If REFINANCE_REPAYMENTTextBox.Text = "" Then
    '            sqlCmd.Parameters.AddWithValue("REFINANCE_REPAYMENT", System.DBNull.Value)
    '        Else
    '            sqlCmd.Parameters.AddWithValue("REFINANCE_REPAYMENT", ToDecimal(REFINANCE_REPAYMENTTextBox.Text))
    '        End If
    '        If WORKING_CAPITALTextBox.Text = "" Then
    '            sqlCmd.Parameters.AddWithValue("WORKING_CAPITAL", System.DBNull.Value)
    '        Else
    '            sqlCmd.Parameters.AddWithValue("WORKING_CAPITAL", ToDecimal(WORKING_CAPITALTextBox.Text))
    '        End If
    '        If LOANTextBox.Text = "" Then
    '            sqlCmd.Parameters.AddWithValue("LOAN", System.DBNull.Value)
    '        Else
    '            sqlCmd.Parameters.AddWithValue("LOAN", ToDecimal(LOANTextBox.Text))
    '        End If
    '        If LG_AVALTextBox.Text = "" Then
    '            sqlCmd.Parameters.AddWithValue("LG_AVAL", System.DBNull.Value)
    '        Else
    '            sqlCmd.Parameters.AddWithValue("LG_AVAL", ToDecimal(LG_AVALTextBox.Text))
    '        End If
    '        If ASSETS_INCREASE_LOANTextBox.Text = "" Then
    '            sqlCmd.Parameters.AddWithValue("ASSETS_INCREASE_LOAN", System.DBNull.Value)
    '        Else
    '            sqlCmd.Parameters.AddWithValue("ASSETS_INCREASE_LOAN", ToDecimal(ASSETS_INCREASE_LOANTextBox.Text))
    '        End If
    '        If BOND_DEPOSIT_PLEDGE_PERSONTextBox.Text = "" Then
    '            sqlCmd.Parameters.AddWithValue("BOND_DEPOSIT_PLEDGE_PERSON", System.DBNull.Value)
    '        Else
    '            sqlCmd.Parameters.AddWithValue("BOND_DEPOSIT_PLEDGE_PERSON", ToDecimal(BOND_DEPOSIT_PLEDGE_PERSONTextBox.Text))
    '        End If
    '        If APPRAISAL_VALUE_ZONE_ATextBox.Text = "" Then
    '            sqlCmd.Parameters.AddWithValue("APPRAISAL_VALUE_ZONE_A", System.DBNull.Value)
    '        Else
    '            sqlCmd.Parameters.AddWithValue("APPRAISAL_VALUE_ZONE_A", ToDecimal(APPRAISAL_VALUE_ZONE_ATextBox.Text))
    '        End If
    '        If APPRAISAL_VALUE_ZONE_BTextBox.Text = "" Then
    '            sqlCmd.Parameters.AddWithValue("APPRAISAL_VALUE_ZONE_B", System.DBNull.Value)
    '        Else
    '            sqlCmd.Parameters.AddWithValue("APPRAISAL_VALUE_ZONE_B", ToDecimal(APPRAISAL_VALUE_ZONE_BTextBox.Text))
    '        End If
    '        If APPRAISAL_VALUE_ZONE_CTextBox.Text = "" Then
    '            sqlCmd.Parameters.AddWithValue("APPRAISAL_VALUE_ZONE_C", System.DBNull.Value)
    '        Else
    '            sqlCmd.Parameters.AddWithValue("APPRAISAL_VALUE_ZONE_C", ToDecimal(APPRAISAL_VALUE_ZONE_CTextBox.Text))
    '        End If
    '        If APPRAISAL_VALUE_ZONE_DTextBox.Text = "" Then
    '            sqlCmd.Parameters.AddWithValue("APPRAISAL_VALUE_ZONE_D", System.DBNull.Value)
    '        Else
    '            sqlCmd.Parameters.AddWithValue("APPRAISAL_VALUE_ZONE_D", ToDecimal(APPRAISAL_VALUE_ZONE_DTextBox.Text))
    '        End If
    '        If APPRAISAL_VALUE_ZONE_ETextBox.Text = "" Then
    '            sqlCmd.Parameters.AddWithValue("APPRAISAL_VALUE_ZONE_E", System.DBNull.Value)
    '        Else
    '            sqlCmd.Parameters.AddWithValue("APPRAISAL_VALUE_ZONE_E", ToDecimal(APPRAISAL_VALUE_ZONE_ETextBox.Text))
    '        End If
    '        If BOND_DEPOSIT_PLEDGETextBox.Text = "" Then
    '            sqlCmd.Parameters.AddWithValue("BOND_DEPOSIT_PLEDGE", System.DBNull.Value)
    '        Else
    '            sqlCmd.Parameters.AddWithValue("BOND_DEPOSIT_PLEDGE", ToDecimal(BOND_DEPOSIT_PLEDGETextBox.Text))
    '        End If
    '        If CASH_BOND_CALTextBox.Text = "" Then
    '            sqlCmd.Parameters.AddWithValue("CASH_BOND_CAL", System.DBNull.Value)
    '        Else
    '            sqlCmd.Parameters.AddWithValue("CASH_BOND_CAL", ToDecimal(CASH_BOND_CALTextBox.Text))
    '        End If
    '        If ACCOUNT_RECEIVABLE_CALTextBox.Text = "" Then
    '            sqlCmd.Parameters.AddWithValue("ACCOUNT_RECEIVABLE_CAL", System.DBNull.Value)
    '        Else
    '            sqlCmd.Parameters.AddWithValue("ACCOUNT_RECEIVABLE_CAL", ToDecimal(ACCOUNT_RECEIVABLE_CALTextBox.Text))
    '        End If
    '        If INVENTORY_CALTextBox.Text = "" Then
    '            sqlCmd.Parameters.AddWithValue("INVENTORY_CAL", System.DBNull.Value)
    '        Else
    '            sqlCmd.Parameters.AddWithValue("INVENTORY_CAL", ToDecimal(INVENTORY_CALTextBox.Text))
    '        End If
    '        If TOTAL_CURRENT_ASSETS_CALTextBox.Text = "" Then
    '            sqlCmd.Parameters.AddWithValue("TOTAL_CURRENT_ASSETS_CAL", System.DBNull.Value)
    '        Else
    '            sqlCmd.Parameters.AddWithValue("TOTAL_CURRENT_ASSETS_CAL", ToDecimal(TOTAL_CURRENT_ASSETS_CALTextBox.Text))
    '        End If

    '        If MACHINERY_EQUIPMENT_CALTextBox.Text = "" Then
    '            sqlCmd.Parameters.AddWithValue("MACHINERY_EQUIPMENT_CAL", System.DBNull.Value)
    '        Else
    '            sqlCmd.Parameters.AddWithValue("MACHINERY_EQUIPMENT_CAL", ToDecimal(MACHINERY_EQUIPMENT_CALTextBox.Text))
    '        End If

    '        If PROPERTY_PLANT_BUILDING_CALTextBox.Text = "" Then
    '            sqlCmd.Parameters.AddWithValue("PROPERTY_PLANT_BUILDING_CAL", System.DBNull.Value)
    '        Else
    '            sqlCmd.Parameters.AddWithValue("PROPERTY_PLANT_BUILDING_CAL", ToDecimal(PROPERTY_PLANT_BUILDING_CALTextBox.Text))
    '        End If

    '        If OTHER_FIXED_ASSETS_CALTextBox.Text = "" Then
    '            sqlCmd.Parameters.AddWithValue("OTHER_FIXED_ASSETS_CAL", System.DBNull.Value)
    '        Else
    '            sqlCmd.Parameters.AddWithValue("OTHER_FIXED_ASSETS_CAL", ToDecimal(OTHER_FIXED_ASSETS_CALTextBox.Text))
    '        End If

    '        If OTHER_FIXED_ASSETS_OTHER_BANK_CALTextBox.Text = "" Then
    '            sqlCmd.Parameters.AddWithValue("OTHER_FIXED_ASSETS_OTHER_BANK_CAL", System.DBNull.Value)
    '        Else
    '            sqlCmd.Parameters.AddWithValue("OTHER_FIXED_ASSETS_OTHER_BANK_CAL", ToDecimal(OTHER_FIXED_ASSETS_OTHER_BANK_CALTextBox.Text))
    '        End If

    '        If ASSETS_FROM_CREDIT_CALTextBox.Text = "" Then
    '            sqlCmd.Parameters.AddWithValue("ASSETS_FROM_CREDIT_CAL", System.DBNull.Value)
    '        Else
    '            sqlCmd.Parameters.AddWithValue("ASSETS_FROM_CREDIT_CAL", ToDecimal(ASSETS_FROM_CREDIT_CALTextBox.Text))
    '        End If

    '        If TOTAL_FIXED_ASSETS_CALTextBox.Text = "" Then
    '            sqlCmd.Parameters.AddWithValue("TOTAL_FIXED_ASSETS_CAL", System.DBNull.Value)
    '        Else
    '            sqlCmd.Parameters.AddWithValue("TOTAL_FIXED_ASSETS_CAL", ToDecimal(TOTAL_FIXED_ASSETS_CALTextBox.Text))
    '        End If

    '        If TOTAL_FIXED_ASSETS_CALTextBox.Text = "" Then
    '            sqlCmd.Parameters.AddWithValue("TOTAL_ASSETS_CAL", System.DBNull.Value)
    '        Else
    '            sqlCmd.Parameters.AddWithValue("TOTAL_ASSETS_CAL", ToDecimal(TOTAL_ASSETS_CALTextBox.Text))
    '        End If

    '        If ACCOUNT_PAYABLE_CALTextBox.Text = "" Then
    '            sqlCmd.Parameters.AddWithValue("ACCOUNT_PAYABLE_CAL", System.DBNull.Value)
    '        Else
    '            sqlCmd.Parameters.AddWithValue("ACCOUNT_PAYABLE_CAL", ToDecimal(ACCOUNT_PAYABLE_CALTextBox.Text))
    '        End If

    '        If CURRENT_LIABILITY_BAY_CALTextBox.Text = "" Then
    '            sqlCmd.Parameters.AddWithValue("CURRENT_LIABILITY_BAY_CAL", System.DBNull.Value)
    '        Else
    '            sqlCmd.Parameters.AddWithValue("CURRENT_LIABILITY_BAY_CAL", ToDecimal(CURRENT_LIABILITY_BAY_CALTextBox.Text))
    '        End If

    '        If OTHER_CURRENT_LIABILITY_CALTextBox.Text = "" Then
    '            sqlCmd.Parameters.AddWithValue("OTHER_CURRENT_LIABILITY_CAL", System.DBNull.Value)
    '        Else
    '            sqlCmd.Parameters.AddWithValue("OTHER_CURRENT_LIABILITY_CAL", ToDecimal(OTHER_CURRENT_LIABILITY_CALTextBox.Text))
    '        End If

    '        If TOTAL_CURRENT_LIABILITY_CALTextBox.Text = "" Then
    '            sqlCmd.Parameters.AddWithValue("TOTAL_CURRENT_LIABILITY_CAL", System.DBNull.Value)
    '        Else
    '            sqlCmd.Parameters.AddWithValue("TOTAL_CURRENT_LIABILITY_CAL", ToDecimal(TOTAL_CURRENT_LIABILITY_CALTextBox.Text))
    '        End If

    '        If LONG_TERM_LIABILITY_BAY_CALTextBox.Text = "" Then
    '            sqlCmd.Parameters.AddWithValue("LONG_TERM_LIABILITY_BAY_CAL", System.DBNull.Value)
    '        Else
    '            sqlCmd.Parameters.AddWithValue("LONG_TERM_LIABILITY_BAY_CAL", ToDecimal(LONG_TERM_LIABILITY_BAY_CALTextBox.Text))
    '        End If

    '        If OTHER_LONG_TERM_LIABILITY_CALTextBox.Text = "" Then
    '            sqlCmd.Parameters.AddWithValue("OTHER_LONG_TERM_LIABILITY_CAL", System.DBNull.Value)
    '        Else
    '            sqlCmd.Parameters.AddWithValue("OTHER_LONG_TERM_LIABILITY_CAL", ToDecimal(OTHER_LONG_TERM_LIABILITY_CALTextBox.Text))
    '        End If

    '        If TOTAL_LIABILITY_CALTextBox.Text = "" Then
    '            sqlCmd.Parameters.AddWithValue("TOTAL_LIABILITY_CAL", System.DBNull.Value)
    '        Else
    '            sqlCmd.Parameters.AddWithValue("TOTAL_LIABILITY_CAL", ToDecimal(TOTAL_LIABILITY_CALTextBox.Text))
    '        End If

    '        If LOANS_REL_CO_DIRECTORS_CALTextBox.Text = "" Then
    '            sqlCmd.Parameters.AddWithValue("LOANS_REL_CO_DIRECTORS_CAL", System.DBNull.Value)
    '        Else
    '            sqlCmd.Parameters.AddWithValue("LOANS_REL_CO_DIRECTORS_CAL", ToDecimal(LOANS_REL_CO_DIRECTORS_CALTextBox.Text))
    '        End If

    '        If EQUITY_CALTextBox.Text = "" Then
    '            sqlCmd.Parameters.AddWithValue("EQUITY_CAL", System.DBNull.Value)
    '        Else
    '            sqlCmd.Parameters.AddWithValue("EQUITY_CAL", ToDecimal(EQUITY_CALTextBox.Text))
    '        End If

    '        If LIABILITY_EQUITY_CALTextBox.Text = "" Then
    '            sqlCmd.Parameters.AddWithValue("LIABILITY_EQUITY_CAL", System.DBNull.Value)
    '        Else
    '            sqlCmd.Parameters.AddWithValue("LIABILITY_EQUITY_CAL", ToDecimal(LIABILITY_EQUITY_CALTextBox.Text))
    '        End If

    '        If EBIDA_PERCENT_CALTextBox.Text = "" Then
    '            sqlCmd.Parameters.AddWithValue("EBIDA_PERCENT_CAL", System.DBNull.Value)
    '        Else
    '            sqlCmd.Parameters.AddWithValue("EBIDA_PERCENT_CAL", ToDecimal(EBIDA_PERCENT_CALTextBox.Text))
    '        End If

    '        If EBIDA_CALTextBox.Text = "" Then
    '            sqlCmd.Parameters.AddWithValue("EBIDA_CAL", System.DBNull.Value)
    '        Else
    '            sqlCmd.Parameters.AddWithValue("EBIDA_CAL", ToDecimal(EBIDA_CALTextBox.Text))
    '        End If

    '        If DE_BEFORE_LOAN_CALTextBox.Text = "" Then
    '            sqlCmd.Parameters.AddWithValue("DE_BEFORE_LOAN_CAL", System.DBNull.Value)
    '        Else
    '            sqlCmd.Parameters.AddWithValue("DE_BEFORE_LOAN_CAL", ToDecimal(DE_BEFORE_LOAN_CALTextBox.Text))
    '        End If

    '        If DSCR_BEFORE_LOAN_CALTextBox.Text = "" Then
    '            sqlCmd.Parameters.AddWithValue("DSCR_BEFORE_LOAN_CAL", System.DBNull.Value)
    '        Else
    '            sqlCmd.Parameters.AddWithValue("DSCR_BEFORE_LOAN_CAL", ToDecimal(DSCR_BEFORE_LOAN_CALTextBox.Text))
    '        End If

    '        If AR_DAY_CALTextBox.Text = "" Then
    '            sqlCmd.Parameters.AddWithValue("AR_DAY_CAL", System.DBNull.Value)
    '        Else
    '            sqlCmd.Parameters.AddWithValue("AR_DAY_CAL", ToDecimal(AR_DAY_CALTextBox.Text))
    '        End If

    '        If INVENTORY_DAY_CALTextBox.Text = "" Then
    '            sqlCmd.Parameters.AddWithValue("INVENTORY_DAY_CAL", System.DBNull.Value)
    '        Else
    '            sqlCmd.Parameters.AddWithValue("INVENTORY_DAY_CAL", ToDecimal(INVENTORY_DAY_CALTextBox.Text))
    '        End If

    '        If WORKING_CAPITAL_NEED_CALTextBox.Text = "" Then
    '            sqlCmd.Parameters.AddWithValue("WORKING_CAPITAL_NEED_CAL", System.DBNull.Value)
    '        Else
    '            sqlCmd.Parameters.AddWithValue("WORKING_CAPITAL_NEED_CAL", ToDecimal(WORKING_CAPITAL_NEED_CALTextBox.Text))
    '        End If

    '        If LOAN_NEED_CALTextBox.Text = "" Then
    '            sqlCmd.Parameters.AddWithValue("LOAN_NEED_CAL", System.DBNull.Value)
    '        Else
    '            sqlCmd.Parameters.AddWithValue("LOAN_NEED_CAL", ToDecimal(LOAN_NEED_CALTextBox.Text))
    '        End If

    '        If OWNERS_EQUITY_PERCENT_CALTextBox.Text = "" Then
    '            sqlCmd.Parameters.AddWithValue("OWNERS_EQUITY_PERCENT_CAL", System.DBNull.Value)
    '        Else
    '            sqlCmd.Parameters.AddWithValue("OWNERS_EQUITY_PERCENT_CAL", ToDecimal(OWNERS_EQUITY_PERCENT_CALTextBox.Text))
    '        End If

    '        If OWNERS_EQUITY_CALTextBox.Text = "" Then
    '            sqlCmd.Parameters.AddWithValue("OWNERS_EQUITY_CAL", System.DBNull.Value)
    '        Else
    '            sqlCmd.Parameters.AddWithValue("OWNERS_EQUITY_CAL", ToDecimal(OWNERS_EQUITY_CALTextBox.Text))
    '        End If

    '        If FIXED_INTEREST_PERCENT_CALTextBox.Text = "" Then
    '            sqlCmd.Parameters.AddWithValue("FIXED_INTEREST_PERCENT_CAL", System.DBNull.Value)
    '        Else
    '            sqlCmd.Parameters.AddWithValue("FIXED_INTEREST_PERCENT_CAL", ToDecimal(FIXED_INTEREST_PERCENT_CALTextBox.Text))
    '        End If

    '        If PAYMENT_PERIOD_CALTextBox.Text = "" Then
    '            sqlCmd.Parameters.AddWithValue("PAYMENT_PERIOD_CAL", System.DBNull.Value)
    '        Else
    '            sqlCmd.Parameters.AddWithValue("PAYMENT_PERIOD_CAL", ToDecimal(PAYMENT_PERIOD_CALTextBox.Text))
    '        End If

    '        If AVERAGE_PAYMENT_PERIOD_CALTextBox.Text = "" Then
    '            sqlCmd.Parameters.AddWithValue("AVERAGE_PAYMENT_PERIOD_CAL", System.DBNull.Value)
    '        Else
    '            sqlCmd.Parameters.AddWithValue("AVERAGE_PAYMENT_PERIOD_CAL", ToDecimal(AVERAGE_PAYMENT_PERIOD_CALTextBox.Text))
    '        End If

    '        If WORKING_CAPITAL_APPROVE_CALTextBox.Text = "" Then
    '            sqlCmd.Parameters.AddWithValue("WORKING_CAPITAL_APPROVE_CAL", System.DBNull.Value)
    '        Else
    '            sqlCmd.Parameters.AddWithValue("WORKING_CAPITAL_APPROVE_CAL", ToDecimal(WORKING_CAPITAL_APPROVE_CALTextBox.Text))
    '        End If

    '        If LOAN_APPROVE_CALTextBox.Text = "" Then
    '            sqlCmd.Parameters.AddWithValue("LOAN_APPROVE_CAL", System.DBNull.Value)
    '        Else
    '            sqlCmd.Parameters.AddWithValue("LOAN_APPROVE_CAL", ToDecimal(LOAN_APPROVE_CALTextBox.Text))
    '        End If

    '        If INTEREST_RATE_PERCENTTextBox.Text = "" Then
    '            sqlCmd.Parameters.AddWithValue("INTEREST_RATE_PERCENT", System.DBNull.Value)
    '        Else
    '            sqlCmd.Parameters.AddWithValue("INTEREST_RATE_PERCENT", ToDecimal(INTEREST_RATE_PERCENTTextBox.Text))
    '        End If

    '        If INTEREST_RATE_PERCENT_USEDTextBox.Text = "" Then
    '            sqlCmd.Parameters.AddWithValue("INTEREST_RATE_PERCENT_USED", System.DBNull.Value)
    '        Else
    '            sqlCmd.Parameters.AddWithValue("INTEREST_RATE_PERCENT_USED", ToDecimal(INTEREST_RATE_PERCENT_USEDTextBox.Text))
    '        End If

    '        If CONTRACT_YEARTextBox.Text = "" Then
    '            sqlCmd.Parameters.AddWithValue("CONTRACT_YEAR", System.DBNull.Value)
    '        Else
    '            sqlCmd.Parameters.AddWithValue("CONTRACT_YEAR", ToDecimal(CONTRACT_YEARTextBox.Text))
    '        End If

    '        If DSCR_THIS_TIMETextBox.Text = "" Then
    '            sqlCmd.Parameters.AddWithValue("DSCR_THIS_TIME", System.DBNull.Value)
    '        Else
    '            sqlCmd.Parameters.AddWithValue("DSCR_THIS_TIME", ToDecimal(DSCR_THIS_TIMETextBox.Text))
    '        End If

    '        If DSCR_THIS_TIME_PERCENTTextBox.Text = "" Then
    '            sqlCmd.Parameters.AddWithValue("DSCR_THIS_TIME_PERCENT", System.DBNull.Value)
    '        Else
    '            sqlCmd.Parameters.AddWithValue("DSCR_THIS_TIME_PERCENT", ToDecimal(DSCR_THIS_TIME_PERCENTTextBox.Text))
    '        End If

    '        If DE_THIS_TIMETextBox.Text = "" Then
    '            sqlCmd.Parameters.AddWithValue("DE_THIS_TIME", System.DBNull.Value)
    '        Else
    '            sqlCmd.Parameters.AddWithValue("DE_THIS_TIME", ToDecimal(DE_THIS_TIMETextBox.Text))
    '        End If

    '        If LTV_THIS_TIMETextBox.Text = "" Then
    '            sqlCmd.Parameters.AddWithValue("LTV_THIS_TIME", System.DBNull.Value)
    '        Else

    '            sqlCmd.Parameters.AddWithValue("LTV_THIS_TIME", ToDecimal(LTV_THIS_TIMETextBox.Text))
    '        End If

    '        If LTV_THIS_TIME_PERCENTTextBox.Text = "" Then
    '            sqlCmd.Parameters.AddWithValue("LTV_THIS_TIME_PERCENT", System.DBNull.Value)
    '        Else
    '            sqlCmd.Parameters.AddWithValue("LTV_THIS_TIME_PERCENT", ToDecimal(LTV_THIS_TIME_PERCENTTextBox.Text))
    '        End If

    '        If WORKING_CAPITAL_DEFAULTTextBox.Text = "" Then
    '            sqlCmd.Parameters.AddWithValue("WORKING_CAPITAL_DEFAULT", System.DBNull.Value)
    '        Else
    '            sqlCmd.Parameters.AddWithValue("WORKING_CAPITAL_DEFAULT", ToDecimal(WORKING_CAPITAL_DEFAULTTextBox.Text))
    '        End If

    '        If LOAN_DEFAULTTextBox.Text = "" Then
    '            sqlCmd.Parameters.AddWithValue("LOAN_DEFAULT", System.DBNull.Value)
    '        Else
    '            sqlCmd.Parameters.AddWithValue("LOAN_DEFAULT", ToDecimal(LOAN_DEFAULTTextBox.Text))
    '        End If

    '        If WORKING_CAPITAL_DEFAULT_APPROVETextBox.Text = "" Then
    '            sqlCmd.Parameters.AddWithValue("WORKING_CAPITAL_DEFAULT_APPROVE", System.DBNull.Value)
    '        Else
    '            sqlCmd.Parameters.AddWithValue("WORKING_CAPITAL_DEFAULT_APPROVE", ToDecimal(WORKING_CAPITAL_DEFAULT_APPROVETextBox.Text))
    '        End If

    '        If LOAN_DEFAULT_APPROVETextBox.Text = "" Then
    '            sqlCmd.Parameters.AddWithValue("LOAN_DEFAULT_APPROVE", System.DBNull.Value)
    '        Else
    '            sqlCmd.Parameters.AddWithValue("LOAN_DEFAULT_APPROVE", ToDecimal(LOAN_DEFAULT_APPROVETextBox.Text))
    '        End If


    '        sqlCmd.ExecuteNonQuery()
    '        sqlCmd.Transaction.Commit()

    '    Catch ex As Exception
    '        sqlCmd.Transaction.Rollback()
    '        runScirpt("alert('Cannot save data. \n " & ex.Message.Replace("'", "") & "');")
    '        Exit Sub
    '    Finally
    '        If (conn.State = ConnectionState.Open) Then
    '            conn.Close()
    '        End If
    '        conn = Nothing
    '        Dim jscript As String = ""
    '        jscript = jscript & "showDialog('Update Complete');"
    '        'jscript = jscript & "changeMenu(""" & SMES_IDTextBox.Text & """);"
    '        'jscript = jscript & "changePage(""" & SMES_IDTextBox.Text & """,""" & SMES_TYPETextBox.Text & """);"
    '        runScirpt(jscript)  ' เรียก javascript 
    '    End Try

    'End Sub
    Protected Sub alert(ByVal str As String)
        'Response.Write("<script language=javascript>showProgress();</script>")
        'Page.ClientScript.RegisterStartupScript(Me.GetType(), "messagebox", "showProgress();", True)
        'Page.RegisterStartupScript("progress", "<script>showProgress();</script>")
        str = "alert(""" & str & """);"
        Page.ClientScript.RegisterStartupScript(Me.GetType(), "messagebox", str, True)
    End Sub
    Protected Sub runScirpt(ByVal str As String)
        str = " $(document).ready(function(){" & str & "});"
        Page.ClientScript.RegisterStartupScript(Me.GetType(), "", str, True)

        'Dim l As New Literal
        'l.Text = "<script type=""text/javascript"">$(document).ready(function(){" & str & "});</script>"
        'Page.Controls.Add(l)
        'Dim script As String = "<script type=""text/javascript"">$(document).ready(function(){" & str & "});</script>"
        'RegisterStartupScript("PopupScript", script)

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

    Protected Sub ImportRMButton_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles ImportRMButton.Click
        Dim SMES_ID As String = Request.QueryString("SMES_ID")
        ShowData(SMES_ID, 1, 2)
        ClearInputTextBox.Text = "0"
    End Sub
End Class
