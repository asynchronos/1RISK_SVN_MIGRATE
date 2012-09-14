Imports System.Data
Imports System.Data.SqlClient
Imports System.Globalization
Partial Class aspx_smes_FINANCIAL_DATA
    Inherits System.Web.UI.Page


    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Not Page.IsPostBack Then
            bindCustomerGrid()
            showCustomerGrid()
            If Request.QueryString("SMES_ID") <> "" Then
                BtnInsert.Visible = False
                BtnUpdate.Visible = True
                ShowData(Request.QueryString("SME_S"))
            Else
                BtnInsert.Visible = True
                BtnUpdate.Visible = False

            End If
        Else
      
        End If

    End Sub

    Protected Sub CustomerGridRowCommand(ByVal sender As Object, ByVal e As GridViewCommandEventArgs)
        'MsgBox(e.CommandName)
        If e.CommandName = "Insert" Then

            Dim CIFTextBox As TextBox = CType(CustomersGridView.FooterRow.FindControl("CIFTextBox"), TextBox)
            Dim NameLabel As Label = CType(CustomersGridView.FooterRow.FindControl("CIFNameLabel"), Label)
            Dim BusinessCodeTextBox As TextBox = CType(CustomersGridView.FooterRow.FindControl("BusinessCodeTextBox"), TextBox)
            Dim BusinessNameTextBox As TextBox = CType(CustomersGridView.FooterRow.FindControl("BusinessNameTextBox"), TextBox)

            If CIFTextBox.Text = "" Then
                CIFTextBox.BackColor = Drawing.Color.Red
                Exit Sub
            Else
                CIFTextBox.BackColor = Drawing.Color.White
            End If
            If NameLabel.Text = "" Or NameLabel.Text.Contains("กรุณาค้นหา") = True Then
                CIFTextBox.BackColor = Drawing.Color.Red
                Exit Sub
            End If


            Dim CusDT As DataTable = Session("CusDT")
            Dim CusDR As DataRow = CusDT.NewRow()
            CusDR("CIF") = CIFTextBox.Text
            CusDR("Name") = NameLabel.Text
            CusDR("BusinessCode") = BusinessCodeTextBox.Text
            CusDR("BusinessName") = BusinessNameTextBox.Text

            CusDT.Rows.Add(CusDR)
            CustomersGridView.EditIndex = -1
            showCustomerGrid()
        End If
        If e.CommandName = "SearchCIFInsert" Then
            SearchCif("insert")
        End If
        If e.CommandName = "SearchCIFEdit" Then
            SearchCif("edit")
        End If

    End Sub
    Sub CustomerGridEditCommand(ByVal sender As Object, ByVal e As GridViewEditEventArgs)
        CustomersGridView.EditIndex = e.NewEditIndex
        showCustomerGrid()



        ' สร้าง popup business type
        Dim BusinessCodeTextBox As TextBox = CType(CustomersGridView.Rows(CustomersGridView.EditIndex).FindControl("BusinessCodeTextBox"), TextBox)
        Dim BusinessNameTextBox As TextBox = CType(CustomersGridView.Rows(CustomersGridView.EditIndex).FindControl("BusinessNameTextBox"), TextBox)
        Dim BusinessCodePopup As Image = CType(CustomersGridView.Rows(CustomersGridView.EditIndex).FindControl("BusinessCodePopup"), Image)


        Dim Buss As String = Nothing
        Buss += "window.open('../customer/BusinessType.aspx?returnIdTarget=" & BusinessCodeTextBox.ClientID & "&returnDetailTarget=" & BusinessNameTextBox.ClientID
        BusinessCodePopup.Attributes.Add("onclick", Buss & "','pop', 'width=900, height=400');")
        BusinessCodePopup.Style("cursor") = "pointer"   ' auto,crosshair ,default,pointer,help,move,Text,wait, e(-resize, w - resize, n - resize, s - resize, ne - resize, nw - resize, se - resize, sw - resize)
        BusinessCodeTextBox.Attributes.Add("onclick", Buss & "','pop', 'width=900, height=400');")


    End Sub
    Sub CustomerGridCancelCommand(ByVal sender As Object, ByVal e As GridViewCancelEditEventArgs)
        CustomersGridView.EditIndex = -1
        showCustomerGrid()
    End Sub
    Sub CustomerGridUpdateCommand(ByVal s As Object, ByVal e As GridViewUpdateEventArgs)
        Dim CusDT As DataTable = Session("CusDT")
        Dim CusDR = CusDT.Rows(e.RowIndex)


        Dim CIFTextBox As TextBox = CType(CustomersGridView.Rows(e.RowIndex).FindControl("CIFTextBox"), TextBox)
        Dim NameLabel As Label = CType(CustomersGridView.Rows(e.RowIndex).FindControl("CIFNameLabel"), Label)
        Dim BusinessCodeTextBox As TextBox = CType(CustomersGridView.Rows(e.RowIndex).FindControl("BusinessCodeTextBox"), TextBox)
        Dim BusinessNameTextBox As TextBox = CType(CustomersGridView.Rows(e.RowIndex).FindControl("BusinessNameTextBox"), TextBox)

        CusDR("CIF") = CIFTextBox.Text
        CusDR("Name") = NameLabel.Text
        CusDR("BusinessCode") = BusinessCodeTextBox.Text
        CusDR("BusinessName") = BusinessNameTextBox.Text

        CustomersGridView.EditIndex = -1
        showCustomerGrid()
    End Sub
    Sub CustomerGridDeleteCommand(ByVal sender As Object, ByVal e As GridViewDeleteEventArgs)

        Dim CusDT As DataTable = Session("CusDT")
        CusDT.Rows(e.RowIndex).Delete()
        CustomersGridView.EditIndex = -1
        showCustomerGrid()
    End Sub
    Sub showCustomerGrid()

        Dim CusDT As DataTable = Session("CusDT")
        Dim visRowOne As Boolean = True
        ' กรณีที่ไม่มีข้อมูลใน datatable เพิ่มแถวตุ๊กตาแล้วซ่อยเพื่อใช้ footer template ในการเพิ่ม
        If CusDT.Rows.Count < 1 Then
            Dim CusDR As DataRow = CusDT.NewRow()
            CusDR("CIF") = ""
            CusDR("Name") = ""
            CusDR("BusinessCode") = ""
            CusDR("BusinessName") = ""
            CusDT.Rows.Add(CusDR)
            visRowOne = False
        End If
        CustomersGridView.DataSource = CusDT
        CustomersGridView.DataBind()

        If visRowOne = False Then ' 
            ' ถ้าผ่านการเพิ่มแถวเพื่อให้ show footer ลบแถวออกด้วย เพื่อให้ table มีค่าเดิม
            CustomersGridView.Rows(0).Visible = visRowOne
            CusDT.Rows.Clear()
        End If

        CustomersGridView.ShowFooter = True

    End Sub
    Sub bindCustomerGrid()
        Dim CusDT As New DataTable
        CusDT.Columns.Add("CIF")
        CusDT.Columns.Add("Name")
        CusDT.Columns.Add("BusinessCode")
        CusDT.Columns.Add("BusinessName")

        'For i = 0 To 10
        '    Dim CusDR As DataRow = CusDT.NewRow()
        '    CusDR("CIF") = i
        '    CusDR("Name") = "Test"
        '    CusDR("BusinessType") = "Home"
        '    CusDT.Rows.Add(CusDR)
        'Next
        Session("CusDT") = CusDT
    End Sub
    Protected Sub SearchCif(ByVal templateType As String)

        Dim CIFTextBox As TextBox
        Dim NameLabel As Label
        Dim BusinessCodeTextBox As TextBox
        Dim BusinessNameTextBox As TextBox

        If templateType = "insert" Then  ' การ insert

            CIFTextBox = CType(CustomersGridView.FooterRow.FindControl("CIFTextBox"), TextBox)

            'Dim lblGridCifCustomer As Label = CustomersGridView.Rows(CustomersGridView.SelectedIndex).FindControl("lblGridCifCustomer")
            'Dim tbBusinessTypeID As TextBox = CustomersGridView.Rows(CustomersGridView.SelectedIndex).FindControl("tbBusinessTypeID")
            'Dim LabelBusinessTypeDetail As TextBox = CustomersGridView.Rows(CustomersGridView.SelectedIndex).FindControl("LabelBusinessTypeDetail")

            NameLabel = CType(CustomersGridView.FooterRow.FindControl("CIFNameLabel"), Label)
            BusinessCodeTextBox = CType(CustomersGridView.FooterRow.FindControl("BusinessCodeTextBox"), TextBox)
            BusinessNameTextBox = CType(CustomersGridView.FooterRow.FindControl("BusinessNameTextBox"), TextBox)

        ElseIf templateType = "edit" Then

            CIFTextBox = CustomersGridView.Rows(CustomersGridView.EditIndex).FindControl("CIFTextBox")
            NameLabel = CustomersGridView.Rows(CustomersGridView.EditIndex).FindControl("CIFNameLabel")

            BusinessCodeTextBox = CustomersGridView.Rows(CustomersGridView.EditIndex).FindControl("BusinessCodeTextBox")
            BusinessNameTextBox = CustomersGridView.Rows(CustomersGridView.EditIndex).FindControl("BusinessNameTextBox")

        End If
        If CIFTextBox.Text = "" Then
            NameLabel.Text = "กรุณาระบุ CIF"
            CIFTextBox.BackColor = Drawing.Color.Red
            Exit Sub
        Else
            If IsNumeric(CIFTextBox.Text) = False Then
                CIFTextBox.Text = ""
                NameLabel.Text = "กรุณาระบุ CIF ด้วยตัวเลข"
                CIFTextBox.BackColor = Drawing.Color.Red
                Exit Sub
            Else
                CIFTextBox.BackColor = Drawing.Color.White
            End If

        End If

        Dim CIF As String = CIFTextBox.Text
        Dim dalCus As New CustomerInfoDAL
        Dim objCus As New CustomerInfo
        objCus.CIF = CIF
        objCus = dalCus.getCustomerInfoByCIF(objCus)

        If objCus.Cifname = String.Empty Then
            NameLabel.Text = ""
            Exit Sub
        Else

            NameLabel.Text = objCus.Cifname


            CIFTextBox.Enabled = False
            CIFTextBox.BackColor = Drawing.Color.White

            'Dim dalCusSme As New CustomerSme00AllStatusDAL
            'Dim objCusSme As New CustomerSme00AllStatus
            'objCusSme = dalCusSme.getCustomerSme00AllStatusByCIF(CInt(CIF))
            'tbBusinessTypeID.Text = objCusSme.BUSI_RISK1_ID
            'LabelBusinessTypeDetail.Text = objCusSme.BUSI_RISK1_DETAIL

        End If


    End Sub
    Protected Sub CustomersGridView_DataBound(ByVal sender As Object, ByVal e As System.EventArgs) Handles CustomersGridView.DataBound

        ' สร้าง popup business type
        Dim BusinessCodeTextBox As TextBox = CType(CustomersGridView.FooterRow.FindControl("BusinessCodeTextBox"), TextBox)
        Dim BusinessNameTextBox As TextBox = CType(CustomersGridView.FooterRow.FindControl("BusinessNameTextBox"), TextBox)
        Dim BusinessCodePopup As Image = CType(CustomersGridView.FooterRow.FindControl("BusinessCodePopup"), Image)


        Dim Buss As String = Nothing
        Buss += "window.open('../customer/BusinessType.aspx?returnIdTarget=" & BusinessCodeTextBox.ClientID & "&returnDetailTarget=" & BusinessNameTextBox.ClientID
        BusinessCodePopup.Attributes.Add("onclick", Buss & "','pop', 'width=900, height=400');")
        BusinessCodePopup.Style("cursor") = "pointer"   ' auto,crosshair ,default,pointer,help,move,Text,wait, e(-resize, w - resize, n - resize, s - resize, ne - resize, nw - resize, se - resize, sw - resize)
        BusinessCodeTextBox.Attributes.Add("onclick", Buss & "','pop', 'width=900, height=400');")

    End Sub
    Sub ShowData(ByVal smes_id As Integer)
        Dim conn As SqlConnection = Nothing
        'Try
        conn = ConnectionUtil.getSqlConnectionFromWebConfig()
        Dim Sql As String = "SME_S.P_SS_FINANCIAL_DATA_SELECT "
        Dim sqlCmd As New SqlCommand(Sql, conn)
        sqlCmd.CommandType = CommandType.StoredProcedure
        sqlCmd.Prepare()
        Dim SMES_ID_PARM As SqlParameter = sqlCmd.Parameters.AddWithValue("@SMES_ID", Request.QueryString("SMES_ID"))

        Dim reader As SqlDataReader = sqlCmd.ExecuteReader()

        While reader.Read()
            '   Console.WriteLine(String.Format("{0}, {1}", reader(0), reader(1)))
            If IsDBNull(reader("SMES_ID")) = False Then SMES_IDTextBox.Text = reader("SMES_ID").ToString()
            If IsDBNull(reader("REF_ID")) = False Then Session("REF_ID") = reader("REF_ID").ToString()
            ' If IsDBNull(reader("BUS_GRP_ID")) = False Then BUSINESS_ID_TABLETextBox.Text = reader("BUS_GRP_ID").ToString()
            If IsDBNull(reader("SALES")) = False Then
                ' SALESTextBox.Text = String.Format("{0:#,###.##}", reader("SALES"))
                SALESTextBox.Text = String.Format("{0:n0}", reader("SALES"))

            End If

            If IsDBNull(reader("CREDIT_SALE")) = False Then CREDIT_SALETextBox.Text = String.Format("{0:n0}", reader("CREDIT_SALE"))
            If IsDBNull(reader("CREDIT_TERM")) = False Then CREDIT_TERMTextBox.Text = String.Format("{0:n0}", reader("CREDIT_TERM"))
            If IsDBNull(reader("PURCHASE")) = False Then PURCHASETextBox.Text = String.Format("{0:n0}", reader("PURCHASE"))
            If IsDBNull(reader("CREDIT_PURCHASE")) = False Then CREDIT_PURCHASETextBox.Text = String.Format("{0:n0}", reader("CREDIT_PURCHASE"))
            If IsDBNull(reader("TERM_PURCHASE")) = False Then TERM_PURCHASETextBox.Text = String.Format("{0:n0}", reader("TERM_PURCHASE"))
            If IsDBNull(reader("DEFAULT_MARGIN")) = False Then DEFAULT_MARGINTextBox.Text = String.Format("{0:n0}", reader("DEFAULT_MARGIN"))
            If IsDBNull(reader("GROSS_PROFIT")) = False Then GROSS_PROFITTextBox.Text = String.Format("{0:n0}", reader("GROSS_PROFIT"))
            If IsDBNull(reader("INVENTORY_INTERVIEW")) = False Then INVENTORY_INTERVIEWTextBox.Text = String.Format("{0:n0}", reader("INVENTORY_INTERVIEW"))
            If IsDBNull(reader("INVENTORY_VISIT")) = False Then INVENTORY_VISITTextBox.Text = String.Format("{0:n0}", reader("INVENTORY_VISIT"))
            If IsDBNull(reader("ACCOUNT_RECEIVABLE")) = False Then ACCOUNT_RECEIVABLETextBox.Text = String.Format("{0:n0}", reader("ACCOUNT_RECEIVABLE"))
            If IsDBNull(reader("MACHINERY_EQUIPMENT")) = False Then MACHINERY_EQUIPMENTTextBox.Text = String.Format("{0:n0}", reader("MACHINERY_EQUIPMENT"))
            If IsDBNull(reader("CORE_ASSETS")) = False Then CORE_ASSETSTextBox.Text = String.Format("{0:n0}", reader("CORE_ASSETS"))
            If IsDBNull(reader("OTHER_FIXED_ASSETS")) = False Then OTHER_FIXED_ASSETSTextBox.Text = String.Format("{0:n0}", reader("OTHER_FIXED_ASSETS"))
            If IsDBNull(reader("CASH_BOND")) = False Then CASH_BONDTextBox.Text = String.Format("{0:n0}", reader("CASH_BOND"))
            If IsDBNull(reader("CALCULATE_RATE")) = False Then CALCULATE_RATETextBox.Text = String.Format("{0:n0}", reader("CALCULATE_RATE"))
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
            Dim totalAPPRAISAL_VALUE_ZONE As Decimal
            totalAPPRAISAL_VALUE_ZONE = ToDecimal(APPRAISAL_VALUE_ZONE_ATextBox.Text) + ToDecimal(APPRAISAL_VALUE_ZONE_BTextBox.Text) + ToDecimal(APPRAISAL_VALUE_ZONE_CTextBox.Text) + ToDecimal(APPRAISAL_VALUE_ZONE_DTextBox.Text) + ToDecimal(APPRAISAL_VALUE_ZONE_ETextBox.Text)
            TOTAL_AMOUNT_OF_COLLATERALTextBox.Text = String.Format("{0:n0}", totalAPPRAISAL_VALUE_ZONE)
            If IsDBNull(reader("BOND_DEPOSIT_PLEDGE")) = False Then BOND_DEPOSIT_PLEDGETextBox.Text = String.Format("{0:n0}", reader("BOND_DEPOSIT_PLEDGE"))
            If IsDBNull(reader("CASH_BOND_CAL")) = False Then CASH_BOND_CALTextBox.Text = String.Format("{0:n0}", reader("CASH_BOND_CAL"))
            If IsDBNull(reader("ACCOUNT_RECEIVABLE_CAL")) = False Then ACCOUNT_RECEIVABLE_CALTextBox.Text = String.Format("{0:n0}", reader("ACCOUNT_RECEIVABLE_CAL"))
            If IsDBNull(reader("INVENTORY_CAL")) = False Then INVENTORY_CALTextBox.Text = String.Format("{0:n0}", reader("INVENTORY_CAL"))
            If IsDBNull(reader("TOTAL_CURRENT_ASSETS_CAL")) = False Then TOTAL_CURRENT_ASSETS_CALTextBox.Text = String.Format("{0:n0}", reader("TOTAL_CURRENT_ASSETS_CAL"))
            If IsDBNull(reader("MACHINERY_EQUIPMENT_CAL")) = False Then MACHINERY_EQUIPMENT_CALTextBox.Text = String.Format("{0:n0}", reader("MACHINERY_EQUIPMENT_CAL"))
            If IsDBNull(reader("PROPERTY_PLANT_BUILDING_CAL")) = False Then PROPERTY_PLANT_BUILDING_CALTextBox.Text = String.Format("{0:n0}", reader("PROPERTY_PLANT_BUILDING_CAL"))
            If IsDBNull(reader("OTHER_FIXED_ASSETS_CAL")) = False Then OTHER_FIXED_ASSETS_CALTextBox.Text = String.Format("{0:n0}", reader("OTHER_FIXED_ASSETS_CAL"))
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
            If IsDBNull(reader("INTEREST_RATE_PERCENT")) = False Then INTEREST_RATE_PERCENTTextBox.Text = String.Format("{0:n2}", reader("INTEREST_RATE_PERCENT"))
            If IsDBNull(reader("INTEREST_RATE_PERCENT_USED")) = False Then INTEREST_RATE_PERCENT_USEDTextBox.Text = String.Format("{0:n2}", reader("INTEREST_RATE_PERCENT_USED"))
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


        End While
        reader.Close()

        sqlCmd.Parameters.Clear()

        sqlCmd.CommandText = "SME_S.P_SS_FINANCIAL_CIF_SELECT "
        sqlCmd.CommandType = CommandType.StoredProcedure
        sqlCmd.Parameters.Add(SMES_ID_PARM)
        reader = sqlCmd.ExecuteReader()

        If reader.HasRows Then
            CustomersGridView.DataSource = reader
            Dim CifTable As DataTable = Session("CusDT")
            CifTable.Clear()
            CifTable.Load(reader)
            CustomersGridView.DataSource = CifTable
            CustomersGridView.DataBind()
        End If


        ' ถ้ามี business ให้หาชื่อ business

        If BUSINESS_ID_TABLETextBox.Text <> "" Then

            reader.Close()
            sqlCmd.Parameters.Clear()
            sqlCmd.Parameters.AddWithValue("@BUSINESS_ID", BUSINESS_ID_TABLETextBox.Text)
            sqlCmd.CommandText = "SME_S.P_SS_BUSINESS_TYPE_SELECT "
            sqlCmd.CommandType = CommandType.StoredProcedure
            reader = sqlCmd.ExecuteReader()

            While reader.Read()
                If IsDBNull(reader("BUSINESS_NAME")) = False Then BUSINESS_NAME_TABLETextBox.Text = reader("BUSINESS_NAME").ToString()
                If IsDBNull(reader("BUSINESS_GROUP")) = False Then BUSINESS_GROUP_TABLETextBox.Text = reader("BUSINESS_GROUP").ToString()
            End While
        End If

        'Catch ex As Exception
        '    alert(ex.ToString)
        'Finally
        'End Try
    End Sub
    Protected Sub BtnInsert_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles BtnInsert.Click
        InsertData()
    End Sub
    Sub InsertData()

        'declare connection
        Dim conn As SqlConnection = Nothing
        Dim sqlCmd As New SqlCommand()
        Dim sql As String = Nothing
        Dim NEW_SMES_ID As Integer
        Try
            conn = ConnectionUtil.getSqlConnectionFromWebConfig()

            sqlCmd.Connection = conn
            sqlCmd.Transaction = sqlCmd.Connection.BeginTransaction()
            sqlCmd.CommandText = "[SME_S].[P_SS_FINANCIAL_DATA_INSERT]"
            sqlCmd.CommandType = CommandType.StoredProcedure


            If Session("SMES_TYPE") = "" Then
                sqlCmd.Parameters.AddWithValue("SMES_TYPE", System.DBNull.Value)
            Else
                sqlCmd.Parameters.AddWithValue("SMES_TYPE", Session("SMES_TYPE"))
            End If
            If Session("SMES_STATUS") = "" Then
                sqlCmd.Parameters.AddWithValue("SMES_STATUS", System.DBNull.Value)
            Else
                sqlCmd.Parameters.AddWithValue("SMES_STATUS", Session("SMES_STATUS"))
            End If

            If REF_IDTextBox.Text = "" Then
                sqlCmd.Parameters.AddWithValue("REF_ID", System.DBNull.Value)
            Else
                sqlCmd.Parameters.AddWithValue("REF_ID", REF_IDTextBox.Text)
            End If

            If BUSINESS_ID_TABLETextBox.Text = "" Then
                sqlCmd.Parameters.AddWithValue("BUS_GRP_ID", System.DBNull.Value)
            Else
                sqlCmd.Parameters.AddWithValue("BUS_GRP_ID", BUSINESS_ID_TABLETextBox.Text)
            End If

            If Session("EMP_ID") = "" Then
                sqlCmd.Parameters.AddWithValue("CREATE_USER", System.DBNull.Value)
            Else
                sqlCmd.Parameters.AddWithValue("CREATE_USER", Session("EMP_ID"))
            End If

            'If AR_TABLETextBox.Text = "" Then
            '    sqlCmd.Parameters.AddWithValue("CREDIT_TERM_TABLE", System.DBNull.Value)
            'Else
            '    sqlCmd.Parameters.AddWithValue("CREDIT_TERM_TABLE", ToDecimal(CREDIT_TERM_TABLETextBox.Text))
            'End If

            'If AP_TABLETextBox.Text = "" Then
            '    sqlCmd.Parameters.AddWithValue("TERM_PURCHASE_TABLE", System.DBNull.Value)
            'Else
            '    sqlCmd.Parameters.AddWithValue("TERM_PURCHASE_TABLE", ToDecimal(TERM_PURCHASE_TABLETextBox.Text))
            'End If

            'If STOCK_TABLETextBox.Text = "" Then
            '    sqlCmd.Parameters.AddWithValue("INVENTORY_VISIT_TABLE", System.DBNull.Value)
            'Else
            '    sqlCmd.Parameters.AddWithValue("INVENTORY_VISIT_TABLE", ToDecimal(INVENTORY_VISIT_TABLETextBox.Text))
            'End If


            If SALESTextBox.Text = "" Then
                sqlCmd.Parameters.AddWithValue("SALES", System.DBNull.Value)
            Else
                sqlCmd.Parameters.AddWithValue("SALES", ToDecimal(SALESTextBox.Text))
            End If
            If CREDIT_SALETextBox.Text = "" Then
                sqlCmd.Parameters.AddWithValue("CREDIT_SALE", System.DBNull.Value)
            Else
                sqlCmd.Parameters.AddWithValue("CREDIT_SALE", ToDecimal(CREDIT_SALETextBox.Text))
            End If
            If CREDIT_TERMTextBox.Text = "" Then
                sqlCmd.Parameters.AddWithValue("CREDIT_TERM", System.DBNull.Value)
            Else
                sqlCmd.Parameters.AddWithValue("CREDIT_TERM", ToDecimal(CREDIT_TERMTextBox.Text))
            End If
            If PURCHASETextBox.Text = "" Then
                sqlCmd.Parameters.AddWithValue("PURCHASE", System.DBNull.Value)
            Else
                sqlCmd.Parameters.AddWithValue("PURCHASE", ToDecimal(PURCHASETextBox.Text))
            End If
            If CREDIT_PURCHASETextBox.Text = "" Then
                sqlCmd.Parameters.AddWithValue("CREDIT_PURCHASE", System.DBNull.Value)
            Else
                sqlCmd.Parameters.AddWithValue("CREDIT_PURCHASE", ToDecimal(CREDIT_PURCHASETextBox.Text))
            End If
            If TERM_PURCHASETextBox.Text = "" Then
                sqlCmd.Parameters.AddWithValue("TERM_PURCHASE", System.DBNull.Value)
            Else
                sqlCmd.Parameters.AddWithValue("TERM_PURCHASE", ToDecimal(TERM_PURCHASETextBox.Text))
            End If
            If DEFAULT_MARGINTextBox.Text = "" Then
                sqlCmd.Parameters.AddWithValue("DEFAULT_MARGIN", System.DBNull.Value)
            Else
                sqlCmd.Parameters.AddWithValue("DEFAULT_MARGIN", ToDecimal(DEFAULT_MARGINTextBox.Text))
            End If

            If GROSS_PROFITTextBox.Text = "" Then
                sqlCmd.Parameters.AddWithValue("GROSS_PROFIT", System.DBNull.Value)
            Else
                sqlCmd.Parameters.AddWithValue("GROSS_PROFIT", ToDecimal(GROSS_PROFITTextBox.Text))
            End If

            If INVENTORY_INTERVIEWTextBox.Text = "" Then
                sqlCmd.Parameters.AddWithValue("INVENTORY_INTERVIEW", System.DBNull.Value)
            Else
                sqlCmd.Parameters.AddWithValue("INVENTORY_INTERVIEW", ToDecimal(INVENTORY_INTERVIEWTextBox.Text))
            End If
            If INVENTORY_VISITTextBox.Text = "" Then
                sqlCmd.Parameters.AddWithValue("INVENTORY_VISIT", System.DBNull.Value)
            Else
                sqlCmd.Parameters.AddWithValue("INVENTORY_VISIT", ToDecimal(INVENTORY_VISITTextBox.Text))
            End If
            If ACCOUNT_RECEIVABLETextBox.Text = "" Then
                sqlCmd.Parameters.AddWithValue("ACCOUNT_RECEIVABLE", System.DBNull.Value)
            Else
                sqlCmd.Parameters.AddWithValue("ACCOUNT_RECEIVABLE", ToDecimal(ACCOUNT_RECEIVABLETextBox.Text))
            End If
            If MACHINERY_EQUIPMENTTextBox.Text = "" Then
                sqlCmd.Parameters.AddWithValue("MACHINERY_EQUIPMENT", System.DBNull.Value)
            Else
                sqlCmd.Parameters.AddWithValue("MACHINERY_EQUIPMENT", ToDecimal(MACHINERY_EQUIPMENTTextBox.Text))
            End If

            If CORE_ASSETSTextBox.Text = "" Then
                sqlCmd.Parameters.AddWithValue("CORE_ASSETS", System.DBNull.Value)
            Else
                sqlCmd.Parameters.AddWithValue("CORE_ASSETS", ToDecimal(CORE_ASSETSTextBox.Text))
            End If

            If OTHER_FIXED_ASSETSTextBox.Text = "" Then
                sqlCmd.Parameters.AddWithValue("OTHER_FIXED_ASSETS", System.DBNull.Value)
            Else
                sqlCmd.Parameters.AddWithValue("OTHER_FIXED_ASSETS", ToDecimal(OTHER_FIXED_ASSETSTextBox.Text))
            End If

            If CASH_BONDTextBox.Text = "" Then
                sqlCmd.Parameters.AddWithValue("CASH_BOND", System.DBNull.Value)
            Else
                sqlCmd.Parameters.AddWithValue("CASH_BOND", ToDecimal(CASH_BONDTextBox.Text))
            End If
            If CALCULATE_RATETextBox.Text = "" Then
                sqlCmd.Parameters.AddWithValue("CALCULATE_RATE", System.DBNull.Value)
            Else
                sqlCmd.Parameters.AddWithValue("CALCULATE_RATE", ToDecimal(CALCULATE_RATETextBox.Text))
            End If

            If ACCOUNT_PAYABLETextBox.Text = "" Then
                sqlCmd.Parameters.AddWithValue("ACCOUNT_PAYABLE", System.DBNull.Value)
            Else
                sqlCmd.Parameters.AddWithValue("ACCOUNT_PAYABLE", ToDecimal(ACCOUNT_PAYABLETextBox.Text))
            End If
            If CURRENT_LIABILITY_BAYTextBox.Text = "" Then
                sqlCmd.Parameters.AddWithValue("CURRENT_LIABILITY_BAY", System.DBNull.Value)
            Else
                sqlCmd.Parameters.AddWithValue("CURRENT_LIABILITY_BAY", ToDecimal(CURRENT_LIABILITY_BAYTextBox.Text))
            End If
            If CURRENT_LIABILITY_OTHER_BANKTextBox.Text = "" Then
                sqlCmd.Parameters.AddWithValue("CURRENT_LIABILITY_OTHER_BANK", System.DBNull.Value)
            Else
                sqlCmd.Parameters.AddWithValue("CURRENT_LIABILITY_OTHER_BANK", ToDecimal(CURRENT_LIABILITY_OTHER_BANKTextBox.Text))
            End If
            If OTHER_CURRENT_LIABILITYTextBox.Text = "" Then
                sqlCmd.Parameters.AddWithValue("OTHER_CURRENT_LIABILITY", System.DBNull.Value)
            Else
                sqlCmd.Parameters.AddWithValue("OTHER_CURRENT_LIABILITY", ToDecimal(OTHER_CURRENT_LIABILITYTextBox.Text))
            End If
            If LONG_TERM_LIABILITY_BAYTextBox.Text = "" Then
                sqlCmd.Parameters.AddWithValue("LONG_TERM_LIABILITY_BAY", System.DBNull.Value)
            Else
                sqlCmd.Parameters.AddWithValue("LONG_TERM_LIABILITY_BAY", ToDecimal(LONG_TERM_LIABILITY_BAYTextBox.Text))
            End If
            If LONG_TERM_LIABILITY_BAY_REPAYMENTTextBox.Text = "" Then
                sqlCmd.Parameters.AddWithValue("LONG_TERM_LIABILITY_BAY_REPAYMENT", System.DBNull.Value)
            Else
                sqlCmd.Parameters.AddWithValue("LONG_TERM_LIABILITY_BAY_REPAYMENT", ToDecimal(LONG_TERM_LIABILITY_BAY_REPAYMENTTextBox.Text))
            End If
            If LONG_TERM_LIABILITY_OTHER_BANKTextBox.Text = "" Then
                sqlCmd.Parameters.AddWithValue("LONG_TERM_LIABILITY_OTHER_BANK", System.DBNull.Value)
            Else
                sqlCmd.Parameters.AddWithValue("LONG_TERM_LIABILITY_OTHER_BANK", ToDecimal(LONG_TERM_LIABILITY_OTHER_BANKTextBox.Text))
            End If
            If LONG_TERM_LIABILITY_OTHER_REPAYMENTTextBox.Text = "" Then
                sqlCmd.Parameters.AddWithValue("LONG_TERM_LIABILITY_OTHER_REPAYMENT", System.DBNull.Value)
            Else
                sqlCmd.Parameters.AddWithValue("LONG_TERM_LIABILITY_OTHER_REPAYMENT", ToDecimal(LONG_TERM_LIABILITY_OTHER_REPAYMENTTextBox.Text))
            End If
            If LONG_TERM_OTHER_LIABILITYTextBox.Text = "" Then
                sqlCmd.Parameters.AddWithValue("LONG_TERM_OTHER_LIABILITY", System.DBNull.Value)
            Else
                sqlCmd.Parameters.AddWithValue("LONG_TERM_OTHER_LIABILITY", ToDecimal(LONG_TERM_OTHER_LIABILITYTextBox.Text))
            End If
            If LONG_TERM_OTHER_REPAYMENTTextBox.Text = "" Then
                sqlCmd.Parameters.AddWithValue("LONG_TERM_OTHER_REPAYMENT", System.DBNull.Value)
            Else
                sqlCmd.Parameters.AddWithValue("LONG_TERM_OTHER_REPAYMENT", ToDecimal(LONG_TERM_OTHER_REPAYMENTTextBox.Text))
            End If
            If LOANS_REL_CO_DIRECTORSTextBox.Text = "" Then
                sqlCmd.Parameters.AddWithValue("LOANS_REL_CO_DIRECTORS", System.DBNull.Value)
            Else
                sqlCmd.Parameters.AddWithValue("LOANS_REL_CO_DIRECTORS", ToDecimal(LOANS_REL_CO_DIRECTORSTextBox.Text))
            End If
            If LG_AVAL_BAYTextBox.Text = "" Then
                sqlCmd.Parameters.AddWithValue("LG_AVAL_BAY", System.DBNull.Value)
            Else
                sqlCmd.Parameters.AddWithValue("LG_AVAL_BAY", ToDecimal(LG_AVAL_BAYTextBox.Text))
            End If
            If REFINANCE_WORKING_CAPITAL_OTHERTextBox.Text = "" Then
                sqlCmd.Parameters.AddWithValue("REFINANCE_WORKING_CAPITAL_OTHER", System.DBNull.Value)
            Else
                sqlCmd.Parameters.AddWithValue("REFINANCE_WORKING_CAPITAL_OTHER", ToDecimal(REFINANCE_WORKING_CAPITAL_OTHERTextBox.Text))
            End If
            If REFINANCE_WORKING_LOAN_OTHERTextBox.Text = "" Then
                sqlCmd.Parameters.AddWithValue("REFINANCE_WORKING_LOAN_OTHER", System.DBNull.Value)
            Else
                sqlCmd.Parameters.AddWithValue("REFINANCE_WORKING_LOAN_OTHER", ToDecimal(REFINANCE_WORKING_LOAN_OTHERTextBox.Text))
            End If
            If REFINANCE_REPAYMENTTextBox.Text = "" Then
                sqlCmd.Parameters.AddWithValue("REFINANCE_REPAYMENT", System.DBNull.Value)
            Else
                sqlCmd.Parameters.AddWithValue("REFINANCE_REPAYMENT", ToDecimal(REFINANCE_REPAYMENTTextBox.Text))
            End If
            If WORKING_CAPITALTextBox.Text = "" Then
                sqlCmd.Parameters.AddWithValue("WORKING_CAPITAL", System.DBNull.Value)
            Else
                sqlCmd.Parameters.AddWithValue("WORKING_CAPITAL", ToDecimal(WORKING_CAPITALTextBox.Text))
            End If
            If LOANTextBox.Text = "" Then
                sqlCmd.Parameters.AddWithValue("LOAN", System.DBNull.Value)
            Else
                sqlCmd.Parameters.AddWithValue("LOAN", ToDecimal(LOANTextBox.Text))
            End If
            If LG_AVALTextBox.Text = "" Then
                sqlCmd.Parameters.AddWithValue("LG_AVAL", System.DBNull.Value)
            Else
                sqlCmd.Parameters.AddWithValue("LG_AVAL", ToDecimal(LG_AVALTextBox.Text))
            End If
            If ASSETS_INCREASE_LOANTextBox.Text = "" Then
                sqlCmd.Parameters.AddWithValue("ASSETS_INCREASE_LOAN", System.DBNull.Value)
            Else
                sqlCmd.Parameters.AddWithValue("ASSETS_INCREASE_LOAN", ToDecimal(ASSETS_INCREASE_LOANTextBox.Text))
            End If
            If BOND_DEPOSIT_PLEDGE_PERSONTextBox.Text = "" Then
                sqlCmd.Parameters.AddWithValue("BOND_DEPOSIT_PLEDGE_PERSON", System.DBNull.Value)
            Else
                sqlCmd.Parameters.AddWithValue("BOND_DEPOSIT_PLEDGE_PERSON", ToDecimal(BOND_DEPOSIT_PLEDGE_PERSONTextBox.Text))
            End If
            If APPRAISAL_VALUE_ZONE_ATextBox.Text = "" Then
                sqlCmd.Parameters.AddWithValue("APPRAISAL_VALUE_ZONE_A", System.DBNull.Value)
            Else
                sqlCmd.Parameters.AddWithValue("APPRAISAL_VALUE_ZONE_A", ToDecimal(APPRAISAL_VALUE_ZONE_ATextBox.Text))
            End If
            If APPRAISAL_VALUE_ZONE_BTextBox.Text = "" Then
                sqlCmd.Parameters.AddWithValue("APPRAISAL_VALUE_ZONE_B", System.DBNull.Value)
            Else
                sqlCmd.Parameters.AddWithValue("APPRAISAL_VALUE_ZONE_B", ToDecimal(APPRAISAL_VALUE_ZONE_BTextBox.Text))
            End If
            If APPRAISAL_VALUE_ZONE_CTextBox.Text = "" Then
                sqlCmd.Parameters.AddWithValue("APPRAISAL_VALUE_ZONE_C", System.DBNull.Value)
            Else
                sqlCmd.Parameters.AddWithValue("APPRAISAL_VALUE_ZONE_C", ToDecimal(APPRAISAL_VALUE_ZONE_CTextBox.Text))
            End If
            If APPRAISAL_VALUE_ZONE_DTextBox.Text = "" Then
                sqlCmd.Parameters.AddWithValue("APPRAISAL_VALUE_ZONE_D", System.DBNull.Value)
            Else
                sqlCmd.Parameters.AddWithValue("APPRAISAL_VALUE_ZONE_D", ToDecimal(APPRAISAL_VALUE_ZONE_DTextBox.Text))
            End If
            If APPRAISAL_VALUE_ZONE_ETextBox.Text = "" Then
                sqlCmd.Parameters.AddWithValue("APPRAISAL_VALUE_ZONE_E", System.DBNull.Value)
            Else
                sqlCmd.Parameters.AddWithValue("APPRAISAL_VALUE_ZONE_E", ToDecimal(APPRAISAL_VALUE_ZONE_ETextBox.Text))
            End If
            If BOND_DEPOSIT_PLEDGETextBox.Text = "" Then
                sqlCmd.Parameters.AddWithValue("BOND_DEPOSIT_PLEDGE", System.DBNull.Value)
            Else
                sqlCmd.Parameters.AddWithValue("BOND_DEPOSIT_PLEDGE", ToDecimal(BOND_DEPOSIT_PLEDGETextBox.Text))
            End If
            If CASH_BOND_CALTextBox.Text = "" Then
                sqlCmd.Parameters.AddWithValue("CASH_BOND_CAL", System.DBNull.Value)
            Else
                sqlCmd.Parameters.AddWithValue("CASH_BOND_CAL", ToDecimal(CASH_BOND_CALTextBox.Text))
            End If
            If ACCOUNT_RECEIVABLE_CALTextBox.Text = "" Then
                sqlCmd.Parameters.AddWithValue("ACCOUNT_RECEIVABLE_CAL", System.DBNull.Value)
            Else
                sqlCmd.Parameters.AddWithValue("ACCOUNT_RECEIVABLE_CAL", ToDecimal(ACCOUNT_RECEIVABLE_CALTextBox.Text))
            End If
            If INVENTORY_CALTextBox.Text = "" Then
                sqlCmd.Parameters.AddWithValue("INVENTORY_CAL", System.DBNull.Value)
            Else
                sqlCmd.Parameters.AddWithValue("INVENTORY_CAL", ToDecimal(INVENTORY_CALTextBox.Text))
            End If
            If TOTAL_CURRENT_ASSETS_CALTextBox.Text = "" Then
                sqlCmd.Parameters.AddWithValue("TOTAL_CURRENT_ASSETS_CAL", System.DBNull.Value)
            Else
                sqlCmd.Parameters.AddWithValue("TOTAL_CURRENT_ASSETS_CAL", ToDecimal(TOTAL_CURRENT_ASSETS_CALTextBox.Text))
            End If

            If MACHINERY_EQUIPMENT_CALTextBox.Text = "" Then
                sqlCmd.Parameters.AddWithValue("MACHINERY_EQUIPMENT_CAL", System.DBNull.Value)
            Else
                sqlCmd.Parameters.AddWithValue("MACHINERY_EQUIPMENT_CAL", ToDecimal(MACHINERY_EQUIPMENT_CALTextBox.Text))
            End If

            If PROPERTY_PLANT_BUILDING_CALTextBox.Text = "" Then
                sqlCmd.Parameters.AddWithValue("PROPERTY_PLANT_BUILDING_CAL", System.DBNull.Value)
            Else
                sqlCmd.Parameters.AddWithValue("PROPERTY_PLANT_BUILDING_CAL", ToDecimal(PROPERTY_PLANT_BUILDING_CALTextBox.Text))
            End If

            If OTHER_FIXED_ASSETS_CALTextBox.Text = "" Then
                sqlCmd.Parameters.AddWithValue("OTHER_FIXED_ASSETS_CAL", System.DBNull.Value)
            Else
                sqlCmd.Parameters.AddWithValue("OTHER_FIXED_ASSETS_CAL", ToDecimal(OTHER_FIXED_ASSETS_CALTextBox.Text))
            End If

            If ASSETS_FROM_CREDIT_CALTextBox.Text = "" Then
                sqlCmd.Parameters.AddWithValue("ASSETS_FROM_CREDIT_CAL", System.DBNull.Value)
            Else
                sqlCmd.Parameters.AddWithValue("ASSETS_FROM_CREDIT_CAL", ToDecimal(ASSETS_FROM_CREDIT_CALTextBox.Text))
            End If

            If TOTAL_FIXED_ASSETS_CALTextBox.Text = "" Then
                sqlCmd.Parameters.AddWithValue("TOTAL_FIXED_ASSETS_CAL", System.DBNull.Value)
            Else
                sqlCmd.Parameters.AddWithValue("TOTAL_FIXED_ASSETS_CAL", ToDecimal(TOTAL_FIXED_ASSETS_CALTextBox.Text))
            End If

            If TOTAL_FIXED_ASSETS_CALTextBox.Text = "" Then
                sqlCmd.Parameters.AddWithValue("TOTAL_ASSETS_CAL", System.DBNull.Value)
            Else
                sqlCmd.Parameters.AddWithValue("TOTAL_ASSETS_CAL", ToDecimal(TOTAL_ASSETS_CALTextBox.Text))
            End If

            If ACCOUNT_PAYABLE_CALTextBox.Text = "" Then
                sqlCmd.Parameters.AddWithValue("ACCOUNT_PAYABLE_CAL", System.DBNull.Value)
            Else
                sqlCmd.Parameters.AddWithValue("ACCOUNT_PAYABLE_CAL", ToDecimal(ACCOUNT_PAYABLE_CALTextBox.Text))
            End If

            If CURRENT_LIABILITY_BAY_CALTextBox.Text = "" Then
                sqlCmd.Parameters.AddWithValue("CURRENT_LIABILITY_BAY_CAL", System.DBNull.Value)
            Else
                sqlCmd.Parameters.AddWithValue("CURRENT_LIABILITY_BAY_CAL", ToDecimal(CURRENT_LIABILITY_BAY_CALTextBox.Text))
            End If

            If OTHER_CURRENT_LIABILITY_CALTextBox.Text = "" Then
                sqlCmd.Parameters.AddWithValue("OTHER_CURRENT_LIABILITY_CAL", System.DBNull.Value)
            Else
                sqlCmd.Parameters.AddWithValue("OTHER_CURRENT_LIABILITY_CAL", ToDecimal(OTHER_CURRENT_LIABILITY_CALTextBox.Text))
            End If

            If TOTAL_CURRENT_LIABILITY_CALTextBox.Text = "" Then
                sqlCmd.Parameters.AddWithValue("TOTAL_CURRENT_LIABILITY_CAL", System.DBNull.Value)
            Else
                sqlCmd.Parameters.AddWithValue("TOTAL_CURRENT_LIABILITY_CAL", ToDecimal(TOTAL_CURRENT_LIABILITY_CALTextBox.Text))
            End If

            If LONG_TERM_LIABILITY_BAY_CALTextBox.Text = "" Then
                sqlCmd.Parameters.AddWithValue("LONG_TERM_LIABILITY_BAY_CAL", System.DBNull.Value)
            Else
                sqlCmd.Parameters.AddWithValue("LONG_TERM_LIABILITY_BAY_CAL", ToDecimal(LONG_TERM_LIABILITY_BAY_CALTextBox.Text))
            End If

            If OTHER_LONG_TERM_LIABILITY_CALTextBox.Text = "" Then
                sqlCmd.Parameters.AddWithValue("OTHER_LONG_TERM_LIABILITY_CAL", System.DBNull.Value)
            Else
                sqlCmd.Parameters.AddWithValue("OTHER_LONG_TERM_LIABILITY_CAL", ToDecimal(OTHER_LONG_TERM_LIABILITY_CALTextBox.Text))
            End If

            If TOTAL_LIABILITY_CALTextBox.Text = "" Then
                sqlCmd.Parameters.AddWithValue("TOTAL_LIABILITY_CAL", System.DBNull.Value)
            Else
                sqlCmd.Parameters.AddWithValue("TOTAL_LIABILITY_CAL", ToDecimal(TOTAL_LIABILITY_CALTextBox.Text))
            End If

            If LOANS_REL_CO_DIRECTORS_CALTextBox.Text = "" Then
                sqlCmd.Parameters.AddWithValue("LOANS_REL_CO_DIRECTORS_CAL", System.DBNull.Value)
            Else
                sqlCmd.Parameters.AddWithValue("LOANS_REL_CO_DIRECTORS_CAL", ToDecimal(LOANS_REL_CO_DIRECTORS_CALTextBox.Text))
            End If

            If EQUITY_CALTextBox.Text = "" Then
                sqlCmd.Parameters.AddWithValue("EQUITY_CAL", System.DBNull.Value)
            Else
                sqlCmd.Parameters.AddWithValue("EQUITY_CAL", ToDecimal(EQUITY_CALTextBox.Text))
            End If

            If LIABILITY_EQUITY_CALTextBox.Text = "" Then
                sqlCmd.Parameters.AddWithValue("LIABILITY_EQUITY_CAL", System.DBNull.Value)
            Else
                sqlCmd.Parameters.AddWithValue("LIABILITY_EQUITY_CAL", ToDecimal(LIABILITY_EQUITY_CALTextBox.Text))
            End If

            If EBIDA_PERCENT_CALTextBox.Text = "" Then
                sqlCmd.Parameters.AddWithValue("EBIDA_PERCENT_CAL", System.DBNull.Value)
            Else
                sqlCmd.Parameters.AddWithValue("EBIDA_PERCENT_CAL", ToDecimal(EBIDA_PERCENT_CALTextBox.Text))
            End If

            If EBIDA_CALTextBox.Text = "" Then
                sqlCmd.Parameters.AddWithValue("EBIDA_CAL", System.DBNull.Value)
            Else
                sqlCmd.Parameters.AddWithValue("EBIDA_CAL", ToDecimal(EBIDA_CALTextBox.Text))
            End If

            If DE_BEFORE_LOAN_CALTextBox.Text = "" Then
                sqlCmd.Parameters.AddWithValue("DE_BEFORE_LOAN_CAL", System.DBNull.Value)
            Else
                sqlCmd.Parameters.AddWithValue("DE_BEFORE_LOAN_CAL", ToDecimal(DE_BEFORE_LOAN_CALTextBox.Text))
            End If

            If DSCR_BEFORE_LOAN_CALTextBox.Text = "" Then
                sqlCmd.Parameters.AddWithValue("DSCR_BEFORE_LOAN_CAL", System.DBNull.Value)
            Else
                sqlCmd.Parameters.AddWithValue("DSCR_BEFORE_LOAN_CAL", ToDecimal(DSCR_BEFORE_LOAN_CALTextBox.Text))
            End If

            If AR_DAY_CALTextBox.Text = "" Then
                sqlCmd.Parameters.AddWithValue("AR_DAY_CAL", System.DBNull.Value)
            Else
                sqlCmd.Parameters.AddWithValue("AR_DAY_CAL", ToDecimal(AR_DAY_CALTextBox.Text))
            End If

            If INVENTORY_DAY_CALTextBox.Text = "" Then
                sqlCmd.Parameters.AddWithValue("INVENTORY_DAY_CAL", System.DBNull.Value)
            Else
                sqlCmd.Parameters.AddWithValue("INVENTORY_DAY_CAL", ToDecimal(INVENTORY_DAY_CALTextBox.Text))
            End If

            If WORKING_CAPITAL_NEED_CALTextBox.Text = "" Then
                sqlCmd.Parameters.AddWithValue("WORKING_CAPITAL_NEED_CAL", System.DBNull.Value)
            Else
                sqlCmd.Parameters.AddWithValue("WORKING_CAPITAL_NEED_CAL", ToDecimal(WORKING_CAPITAL_NEED_CALTextBox.Text))
            End If

            If LOAN_NEED_CALTextBox.Text = "" Then
                sqlCmd.Parameters.AddWithValue("LOAN_NEED_CAL", System.DBNull.Value)
            Else
                sqlCmd.Parameters.AddWithValue("LOAN_NEED_CAL", ToDecimal(LOAN_NEED_CALTextBox.Text))
            End If

            If OWNERS_EQUITY_PERCENT_CALTextBox.Text = "" Then
                sqlCmd.Parameters.AddWithValue("OWNERS_EQUITY_PERCENT_CAL", System.DBNull.Value)
            Else
                sqlCmd.Parameters.AddWithValue("OWNERS_EQUITY_PERCENT_CAL", ToDecimal(OWNERS_EQUITY_PERCENT_CALTextBox.Text))
            End If

            If OWNERS_EQUITY_CALTextBox.Text = "" Then
                sqlCmd.Parameters.AddWithValue("OWNERS_EQUITY_CAL", System.DBNull.Value)
            Else
                sqlCmd.Parameters.AddWithValue("OWNERS_EQUITY_CAL", ToDecimal(OWNERS_EQUITY_CALTextBox.Text))
            End If

            If FIXED_INTEREST_PERCENT_CALTextBox.Text = "" Then
                sqlCmd.Parameters.AddWithValue("FIXED_INTEREST_PERCENT_CAL", System.DBNull.Value)
            Else
                sqlCmd.Parameters.AddWithValue("FIXED_INTEREST_PERCENT_CAL", ToDecimal(FIXED_INTEREST_PERCENT_CALTextBox.Text))
            End If

            If PAYMENT_PERIOD_CALTextBox.Text = "" Then
                sqlCmd.Parameters.AddWithValue("PAYMENT_PERIOD_CAL", System.DBNull.Value)
            Else
                sqlCmd.Parameters.AddWithValue("PAYMENT_PERIOD_CAL", ToDecimal(PAYMENT_PERIOD_CALTextBox.Text))
            End If

            If AVERAGE_PAYMENT_PERIOD_CALTextBox.Text = "" Then
                sqlCmd.Parameters.AddWithValue("AVERAGE_PAYMENT_PERIOD_CAL", System.DBNull.Value)
            Else
                sqlCmd.Parameters.AddWithValue("AVERAGE_PAYMENT_PERIOD_CAL", ToDecimal(AVERAGE_PAYMENT_PERIOD_CALTextBox.Text))
            End If

            If WORKING_CAPITAL_APPROVE_CALTextBox.Text = "" Then
                sqlCmd.Parameters.AddWithValue("WORKING_CAPITAL_APPROVE_CAL", System.DBNull.Value)
            Else
                sqlCmd.Parameters.AddWithValue("WORKING_CAPITAL_APPROVE_CAL", ToDecimal(WORKING_CAPITAL_APPROVE_CALTextBox.Text))
            End If

            If LOAN_APPROVE_CALTextBox.Text = "" Then
                sqlCmd.Parameters.AddWithValue("LOAN_APPROVE_CAL", System.DBNull.Value)
            Else
                sqlCmd.Parameters.AddWithValue("LOAN_APPROVE_CAL", ToDecimal(LOAN_APPROVE_CALTextBox.Text))
            End If

            If INTEREST_RATE_PERCENTTextBox.Text = "" Then
                sqlCmd.Parameters.AddWithValue("INTEREST_RATE_PERCENT", System.DBNull.Value)
            Else
                sqlCmd.Parameters.AddWithValue("INTEREST_RATE_PERCENT", ToDecimal(INTEREST_RATE_PERCENTTextBox.Text))
            End If

            If INTEREST_RATE_PERCENT_USEDTextBox.Text = "" Then
                sqlCmd.Parameters.AddWithValue("INTEREST_RATE_PERCENT_USED", System.DBNull.Value)
            Else
                sqlCmd.Parameters.AddWithValue("INTEREST_RATE_PERCENT_USED", ToDecimal(INTEREST_RATE_PERCENT_USEDTextBox.Text))
            End If

            If CONTRACT_YEARTextBox.Text = "" Then
                sqlCmd.Parameters.AddWithValue("CONTRACT_YEAR", System.DBNull.Value)
            Else
                sqlCmd.Parameters.AddWithValue("CONTRACT_YEAR", ToDecimal(CONTRACT_YEARTextBox.Text))
            End If

            If DSCR_THIS_TIMETextBox.Text = "" Then
                sqlCmd.Parameters.AddWithValue("DSCR_THIS_TIME", System.DBNull.Value)
            Else
                sqlCmd.Parameters.AddWithValue("DSCR_THIS_TIME", ToDecimal(DSCR_THIS_TIMETextBox.Text))
            End If

            If DSCR_THIS_TIME_PERCENTTextBox.Text = "" Then
                sqlCmd.Parameters.AddWithValue("DSCR_THIS_TIME_PERCENT", System.DBNull.Value)
            Else
                sqlCmd.Parameters.AddWithValue("DSCR_THIS_TIME_PERCENT", ToDecimal(DSCR_THIS_TIME_PERCENTTextBox.Text))
            End If

            If DE_THIS_TIMETextBox.Text = "" Then
                sqlCmd.Parameters.AddWithValue("DE_THIS_TIME", System.DBNull.Value)
            Else
                sqlCmd.Parameters.AddWithValue("DE_THIS_TIME", ToDecimal(DE_THIS_TIMETextBox.Text))
            End If

            If LTV_THIS_TIMETextBox.Text = "" Then
                sqlCmd.Parameters.AddWithValue("LTV_THIS_TIME", System.DBNull.Value)
            Else
                sqlCmd.Parameters.AddWithValue("LTV_THIS_TIME", ToDecimal(LTV_THIS_TIMETextBox.Text))
            End If

            If LTV_THIS_TIME_PERCENTTextBox.Text = "" Then
                sqlCmd.Parameters.AddWithValue("LTV_THIS_TIME_PERCENT", System.DBNull.Value)
            Else
                sqlCmd.Parameters.AddWithValue("LTV_THIS_TIME_PERCENT", ToDecimal(LTV_THIS_TIME_PERCENTTextBox.Text))
            End If

            If WORKING_CAPITAL_DEFAULTTextBox.Text = "" Then
                sqlCmd.Parameters.AddWithValue("WORKING_CAPITAL_DEFAULT", System.DBNull.Value)
            Else
                sqlCmd.Parameters.AddWithValue("WORKING_CAPITAL_DEFAULT", ToDecimal(WORKING_CAPITAL_DEFAULTTextBox.Text))
            End If

            If LOAN_DEFAULTTextBox.Text = "" Then
                sqlCmd.Parameters.AddWithValue("LOAN_DEFAULT", System.DBNull.Value)
            Else
                sqlCmd.Parameters.AddWithValue("LOAN_DEFAULT", ToDecimal(LOAN_DEFAULTTextBox.Text))
            End If

            If WORKING_CAPITAL_DEFAULT_APPROVETextBox.Text = "" Then
                sqlCmd.Parameters.AddWithValue("WORKING_CAPITAL_DEFAULT_APPROVE", System.DBNull.Value)
            Else
                sqlCmd.Parameters.AddWithValue("WORKING_CAPITAL_DEFAULT_APPROVE", ToDecimal(WORKING_CAPITAL_DEFAULT_APPROVETextBox.Text))
            End If

            If LOAN_DEFAULT_APPROVETextBox.Text = "" Then
                sqlCmd.Parameters.AddWithValue("LOAN_DEFAULT_APPROVE", System.DBNull.Value)
            Else
                sqlCmd.Parameters.AddWithValue("LOAN_DEFAULT_APPROVE", ToDecimal(LOAN_DEFAULT_APPROVETextBox.Text))
            End If

            If BUSINESS_ID_TABLETextBox.Text = "" Then
                sqlCmd.Parameters.AddWithValue("BUSINESS_ID_TABLE", System.DBNull.Value)
            Else
                sqlCmd.Parameters.AddWithValue("BUSINESS_ID_TABLE", BUSINESS_ID_TABLETextBox.Text)
            End If

            If MARGIN_TABLETextBox.Text = "" Then
                sqlCmd.Parameters.AddWithValue("MARGIN_TABLE", System.DBNull.Value)
            Else
                sqlCmd.Parameters.AddWithValue("MARGIN_TABLE", ToDecimal(MARGIN_TABLETextBox.Text))
            End If

            If DSCR_TABLETextBox.Text = "" Then
                sqlCmd.Parameters.AddWithValue("DSCR_TABLE", System.DBNull.Value)
            Else
                sqlCmd.Parameters.AddWithValue("DSCR_TABLE", ToDecimal(DSCR_TABLETextBox.Text))
            End If

            If AP_TABLETextBox.Text = "" Then
                sqlCmd.Parameters.AddWithValue("AP_TABLE", System.DBNull.Value)
            Else
                sqlCmd.Parameters.AddWithValue("AP_TABLE", ToDecimal(AP_TABLETextBox.Text))
            End If

            If AR_TABLETextBox.Text = "" Then
                sqlCmd.Parameters.AddWithValue("AR_TABLE", System.DBNull.Value)
            Else
                sqlCmd.Parameters.AddWithValue("AR_TABLE", ToDecimal(AR_TABLETextBox.Text))
            End If

            If STOCK_TABLETextBox.Text = "" Then
                sqlCmd.Parameters.AddWithValue("STOCK_TABLE", System.DBNull.Value)
            Else
                sqlCmd.Parameters.AddWithValue("STOCK_TABLE", ToDecimal(STOCK_TABLETextBox.Text))
            End If

            If LTV_TABLETextBox.Text = "" Then
                sqlCmd.Parameters.AddWithValue("LTV_TABLE", System.DBNull.Value)
            Else
                sqlCmd.Parameters.AddWithValue("LTV_TABLE", ToDecimal(LTV_TABLETextBox.Text))
            End If
            If WORKING_CAPITAL_TABLETextBox.Text = "" Then
                sqlCmd.Parameters.AddWithValue("WORKING_CAPITAL_TABLE", System.DBNull.Value)
            Else
                sqlCmd.Parameters.AddWithValue("WORKING_CAPITAL_TABLE", ToDecimal(LTV_TABLETextBox.Text))
            End If

            If RATE_TABLETextBox.Text = "" Then
                sqlCmd.Parameters.AddWithValue("RATE_TABLE", System.DBNull.Value)
            Else
                sqlCmd.Parameters.AddWithValue("RATE_TABLE", ToDecimal(RATE_TABLETextBox.Text))
            End If

            If CONTRACT_TABLETextBox.Text = "" Then
                sqlCmd.Parameters.AddWithValue("CONTRACT_TABLE", System.DBNull.Value)
            Else
                sqlCmd.Parameters.AddWithValue("CONTRACT_TABLE", ToDecimal(CONTRACT_TABLETextBox.Text))
            End If


            Dim SMES_ID_OUT As New SqlParameter("@SMES_ID_OUT", SqlDbType.Int)
            SMES_ID_OUT.Direction = ParameterDirection.Output
            sqlCmd.Parameters.Add(SMES_ID_OUT)

            sqlCmd.ExecuteNonQuery()

            NEW_SMES_ID = CType(sqlCmd.Parameters("@SMES_ID_OUT").Value, Integer)

            Dim CifTable As DataTable = Session("CusDT")
            For i As Integer = 0 To CifTable.Rows.Count - 1
                With CifTable.Rows(i)

                    sqlCmd.CommandText = "[SME_S].[P_SS_FINANCIAL_CIF_INSERT]"
                    sqlCmd.CommandType = CommandType.StoredProcedure
                    sqlCmd.Parameters.Clear()

                    sqlCmd.Parameters.AddWithValue("@SMES_ID", NEW_SMES_ID)
                    sqlCmd.Parameters.AddWithValue("@CIF", CType(.Item("CIF"), Integer))
                    sqlCmd.Parameters.AddWithValue("@BUS_CODE", .Item("BusinessCode"))

                    'Dim SMES_ID As New SqlParameter("@SMES_ID", SqlDbType.Int)
                    'SMES_ID.Value = NEW_SMES_ID
                    'sqlCmd.Parameters.Add(SMES_ID)
                    'Dim CIF As New SqlParameter("@CIF", SqlDbType.Int)
                    'CIF.Value = CType(.Item("CIF"), Integer)
                    'sqlCmd.Parameters.Add(CIF)
                    'Dim BUS_CODE As New SqlParameter("@BUS_CODE", SqlDbType.Int)
                    'BUS_CODE.Value = CType(.Item("BusinessCode"), Integer)
                    'sqlCmd.Parameters.Add(BUS_CODE)


                    sqlCmd.ExecuteNonQuery()
                End With
            Next
            sqlCmd.Transaction.Commit()
        Catch ex As Exception
            sqlCmd.Transaction.Rollback()
            alert(ex.Message)
            Exit Sub
        Finally
            If (conn.State = ConnectionState.Open) Then
                conn.Close()
            End If
            conn = Nothing
            Response.Redirect("financial_data.aspx?SMES_ID=" & NEW_SMES_ID)
            alert("Insert complete.")
        End Try

    End Sub
    Protected Sub BtnUpdate_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles BtnUpdate.Click
        UpdateData()
    End Sub
    Sub UpdateData()
        'declare connection
            'declare connection
        Dim conn As SqlConnection = Nothing
        Dim sqlCmd As New SqlCommand()
        Dim sql As String = Nothing
        'Try
        conn = ConnectionUtil.getSqlConnectionFromWebConfig()

        sqlCmd.Connection = conn
        sqlCmd.Transaction = sqlCmd.Connection.BeginTransaction()
        sqlCmd.CommandText = "[SME_S].[P_SS_FINANCIAL_DATA_UPDATE]"
        sqlCmd.CommandType = CommandType.StoredProcedure

        sqlCmd.Parameters.AddWithValue("SMES_ID", SMES_IDTextBox.Text)

        If Session("SMES_TYPE") = "" Then
            sqlCmd.Parameters.AddWithValue("SMES_TYPE", System.DBNull.Value)
        Else
            sqlCmd.Parameters.AddWithValue("SMES_TYPE", Session("SMES_TYPE"))
        End If
        If Session("SMES_STATUS") = "" Then
            sqlCmd.Parameters.AddWithValue("SMES_STATUS", System.DBNull.Value)
        Else
            sqlCmd.Parameters.AddWithValue("SMES_STATUS", Session("SMES_STATUS"))
        End If

        If REF_IDTextBox.Text = "" Then
            sqlCmd.Parameters.AddWithValue("REF_ID", System.DBNull.Value)
        Else
            sqlCmd.Parameters.AddWithValue("REF_ID", REF_IDTextBox.Text)
        End If

        If BUSINESS_ID_TABLETextBox.Text = "" Then
            sqlCmd.Parameters.AddWithValue("BUS_GRP_ID", System.DBNull.Value)
        Else
            sqlCmd.Parameters.AddWithValue("BUS_GRP_ID", BUSINESS_ID_TABLETextBox.Text)
        End If

        If Session("EMP_ID") = "" Then
            sqlCmd.Parameters.AddWithValue("UPDATE_USER", System.DBNull.Value)
        Else
            sqlCmd.Parameters.AddWithValue("UPDATE_USER", Session("EMP_ID"))
        End If


        'If CREDIT_TERM_TABLETextBox.Text = "" Then
        '    sqlCmd.Parameters.AddWithValue("CREDIT_TERM_TABLE", System.DBNull.Value)
        'Else
        '    sqlCmd.Parameters.AddWithValue("CREDIT_TERM_TABLE", ToDecimal(CREDIT_TERM_TABLETextBox.Text))
        'End If

        'If TERM_PURCHASE_TABLETextBox.Text = "" Then
        '    sqlCmd.Parameters.AddWithValue("TERM_PURCHASE_TABLE", System.DBNull.Value)
        'Else
        '    sqlCmd.Parameters.AddWithValue("TERM_PURCHASE_TABLE", ToDecimal(TERM_PURCHASE_TABLETextBox.Text))
        'End If

        'If INVENTORY_VISIT_TABLETextBox.Text = "" Then
        '    sqlCmd.Parameters.AddWithValue("INVENTORY_VISIT_TABLE", System.DBNull.Value)
        'Else
        '    sqlCmd.Parameters.AddWithValue("INVENTORY_VISIT_TABLE", ToDecimal(INVENTORY_VISIT_TABLETextBox.Text))
        'End If

        If SALESTextBox.Text = "" Then
            sqlCmd.Parameters.AddWithValue("SALES", System.DBNull.Value)
        Else
            sqlCmd.Parameters.AddWithValue("SALES", ToDecimal(SALESTextBox.Text))
        End If
        If CREDIT_SALETextBox.Text = "" Then
            sqlCmd.Parameters.AddWithValue("CREDIT_SALE", System.DBNull.Value)
        Else
            sqlCmd.Parameters.AddWithValue("CREDIT_SALE", ToDecimal(CREDIT_SALETextBox.Text))
        End If
        If CREDIT_TERMTextBox.Text = "" Then
            sqlCmd.Parameters.AddWithValue("CREDIT_TERM", System.DBNull.Value)
        Else
            sqlCmd.Parameters.AddWithValue("CREDIT_TERM", ToDecimal(CREDIT_TERMTextBox.Text))
        End If
        If PURCHASETextBox.Text = "" Then
            sqlCmd.Parameters.AddWithValue("PURCHASE", System.DBNull.Value)
        Else
            sqlCmd.Parameters.AddWithValue("PURCHASE", ToDecimal(PURCHASETextBox.Text))
        End If
        If CREDIT_PURCHASETextBox.Text = "" Then
            sqlCmd.Parameters.AddWithValue("CREDIT_PURCHASE", System.DBNull.Value)
        Else
            sqlCmd.Parameters.AddWithValue("CREDIT_PURCHASE", ToDecimal(CREDIT_PURCHASETextBox.Text))
        End If
        If TERM_PURCHASETextBox.Text = "" Then
            sqlCmd.Parameters.AddWithValue("TERM_PURCHASE", System.DBNull.Value)
        Else
            sqlCmd.Parameters.AddWithValue("TERM_PURCHASE", ToDecimal(TERM_PURCHASETextBox.Text))
        End If
        If DEFAULT_MARGINTextBox.Text = "" Then
            sqlCmd.Parameters.AddWithValue("DEFAULT_MARGIN", System.DBNull.Value)
        Else
            sqlCmd.Parameters.AddWithValue("DEFAULT_MARGIN", ToDecimal(DEFAULT_MARGINTextBox.Text))
        End If

        If GROSS_PROFITTextBox.Text = "" Then
            sqlCmd.Parameters.AddWithValue("GROSS_PROFIT", System.DBNull.Value)
        Else
            sqlCmd.Parameters.AddWithValue("GROSS_PROFIT", ToDecimal(GROSS_PROFITTextBox.Text))
        End If

        If INVENTORY_INTERVIEWTextBox.Text = "" Then
            sqlCmd.Parameters.AddWithValue("INVENTORY_INTERVIEW", System.DBNull.Value)
        Else
            sqlCmd.Parameters.AddWithValue("INVENTORY_INTERVIEW", ToDecimal(INVENTORY_INTERVIEWTextBox.Text))
        End If
        If INVENTORY_VISITTextBox.Text = "" Then
            sqlCmd.Parameters.AddWithValue("INVENTORY_VISIT", System.DBNull.Value)
        Else
            sqlCmd.Parameters.AddWithValue("INVENTORY_VISIT", ToDecimal(INVENTORY_VISITTextBox.Text))
        End If
        If ACCOUNT_RECEIVABLETextBox.Text = "" Then
            sqlCmd.Parameters.AddWithValue("ACCOUNT_RECEIVABLE", System.DBNull.Value)
        Else
            sqlCmd.Parameters.AddWithValue("ACCOUNT_RECEIVABLE", ToDecimal(ACCOUNT_RECEIVABLETextBox.Text))
        End If
        If MACHINERY_EQUIPMENTTextBox.Text = "" Then
            sqlCmd.Parameters.AddWithValue("MACHINERY_EQUIPMENT", System.DBNull.Value)
        Else
            sqlCmd.Parameters.AddWithValue("MACHINERY_EQUIPMENT", ToDecimal(MACHINERY_EQUIPMENTTextBox.Text))
        End If

        If CORE_ASSETSTextBox.Text = "" Then
            sqlCmd.Parameters.AddWithValue("CORE_ASSETS", System.DBNull.Value)
        Else
            sqlCmd.Parameters.AddWithValue("CORE_ASSETS", ToDecimal(CORE_ASSETSTextBox.Text))
        End If

        If OTHER_FIXED_ASSETSTextBox.Text = "" Then
            sqlCmd.Parameters.AddWithValue("OTHER_FIXED_ASSETS", System.DBNull.Value)
        Else
            sqlCmd.Parameters.AddWithValue("OTHER_FIXED_ASSETS", ToDecimal(OTHER_FIXED_ASSETSTextBox.Text))
        End If

        If CASH_BONDTextBox.Text = "" Then
            sqlCmd.Parameters.AddWithValue("CASH_BOND", System.DBNull.Value)
        Else
            sqlCmd.Parameters.AddWithValue("CASH_BOND", ToDecimal(CASH_BONDTextBox.Text))
        End If
        If CALCULATE_RATETextBox.Text = "" Then
            sqlCmd.Parameters.AddWithValue("CALCULATE_RATE", System.DBNull.Value)
        Else
            sqlCmd.Parameters.AddWithValue("CALCULATE_RATE", ToDecimal(CALCULATE_RATETextBox.Text))
        End If

        If ACCOUNT_PAYABLETextBox.Text = "" Then
            sqlCmd.Parameters.AddWithValue("ACCOUNT_PAYABLE", System.DBNull.Value)
        Else
            sqlCmd.Parameters.AddWithValue("ACCOUNT_PAYABLE", ToDecimal(ACCOUNT_PAYABLETextBox.Text))
        End If
        If CURRENT_LIABILITY_BAYTextBox.Text = "" Then
            sqlCmd.Parameters.AddWithValue("CURRENT_LIABILITY_BAY", System.DBNull.Value)
        Else
            sqlCmd.Parameters.AddWithValue("CURRENT_LIABILITY_BAY", ToDecimal(CURRENT_LIABILITY_BAYTextBox.Text))
        End If
        If CURRENT_LIABILITY_OTHER_BANKTextBox.Text = "" Then
            sqlCmd.Parameters.AddWithValue("CURRENT_LIABILITY_OTHER_BANK", System.DBNull.Value)
        Else
            sqlCmd.Parameters.AddWithValue("CURRENT_LIABILITY_OTHER_BANK", ToDecimal(CURRENT_LIABILITY_OTHER_BANKTextBox.Text))
        End If
        If OTHER_CURRENT_LIABILITYTextBox.Text = "" Then
            sqlCmd.Parameters.AddWithValue("OTHER_CURRENT_LIABILITY", System.DBNull.Value)
        Else
            sqlCmd.Parameters.AddWithValue("OTHER_CURRENT_LIABILITY", ToDecimal(OTHER_CURRENT_LIABILITYTextBox.Text))
        End If
        If LONG_TERM_LIABILITY_BAYTextBox.Text = "" Then
            sqlCmd.Parameters.AddWithValue("LONG_TERM_LIABILITY_BAY", System.DBNull.Value)
        Else
            sqlCmd.Parameters.AddWithValue("LONG_TERM_LIABILITY_BAY", ToDecimal(LONG_TERM_LIABILITY_BAYTextBox.Text))
        End If
        If LONG_TERM_LIABILITY_BAY_REPAYMENTTextBox.Text = "" Then
            sqlCmd.Parameters.AddWithValue("LONG_TERM_LIABILITY_BAY_REPAYMENT", System.DBNull.Value)
        Else
            sqlCmd.Parameters.AddWithValue("LONG_TERM_LIABILITY_BAY_REPAYMENT", ToDecimal(LONG_TERM_LIABILITY_BAY_REPAYMENTTextBox.Text))
        End If
        If LONG_TERM_LIABILITY_OTHER_BANKTextBox.Text = "" Then
            sqlCmd.Parameters.AddWithValue("LONG_TERM_LIABILITY_OTHER_BANK", System.DBNull.Value)
        Else
            sqlCmd.Parameters.AddWithValue("LONG_TERM_LIABILITY_OTHER_BANK", ToDecimal(LONG_TERM_LIABILITY_OTHER_BANKTextBox.Text))
        End If
        If LONG_TERM_LIABILITY_OTHER_REPAYMENTTextBox.Text = "" Then
            sqlCmd.Parameters.AddWithValue("LONG_TERM_LIABILITY_OTHER_REPAYMENT", System.DBNull.Value)
        Else
            sqlCmd.Parameters.AddWithValue("LONG_TERM_LIABILITY_OTHER_REPAYMENT", ToDecimal(LONG_TERM_LIABILITY_OTHER_REPAYMENTTextBox.Text))
        End If
        If LONG_TERM_OTHER_LIABILITYTextBox.Text = "" Then
            sqlCmd.Parameters.AddWithValue("LONG_TERM_OTHER_LIABILITY", System.DBNull.Value)
        Else
            sqlCmd.Parameters.AddWithValue("LONG_TERM_OTHER_LIABILITY", ToDecimal(LONG_TERM_OTHER_LIABILITYTextBox.Text))
        End If
        If LONG_TERM_OTHER_REPAYMENTTextBox.Text = "" Then
            sqlCmd.Parameters.AddWithValue("LONG_TERM_OTHER_REPAYMENT", System.DBNull.Value)
        Else
            sqlCmd.Parameters.AddWithValue("LONG_TERM_OTHER_REPAYMENT", ToDecimal(LONG_TERM_OTHER_REPAYMENTTextBox.Text))
        End If
        If LOANS_REL_CO_DIRECTORSTextBox.Text = "" Then
            sqlCmd.Parameters.AddWithValue("LOANS_REL_CO_DIRECTORS", System.DBNull.Value)
        Else
            sqlCmd.Parameters.AddWithValue("LOANS_REL_CO_DIRECTORS", ToDecimal(LOANS_REL_CO_DIRECTORSTextBox.Text))
        End If
        If LG_AVAL_BAYTextBox.Text = "" Then
            sqlCmd.Parameters.AddWithValue("LG_AVAL_BAY", System.DBNull.Value)
        Else
            sqlCmd.Parameters.AddWithValue("LG_AVAL_BAY", ToDecimal(LG_AVAL_BAYTextBox.Text))
        End If
        If REFINANCE_WORKING_CAPITAL_OTHERTextBox.Text = "" Then
            sqlCmd.Parameters.AddWithValue("REFINANCE_WORKING_CAPITAL_OTHER", System.DBNull.Value)
        Else
            sqlCmd.Parameters.AddWithValue("REFINANCE_WORKING_CAPITAL_OTHER", ToDecimal(REFINANCE_WORKING_CAPITAL_OTHERTextBox.Text))
        End If
        If REFINANCE_WORKING_LOAN_OTHERTextBox.Text = "" Then
            sqlCmd.Parameters.AddWithValue("REFINANCE_WORKING_LOAN_OTHER", System.DBNull.Value)
        Else
            sqlCmd.Parameters.AddWithValue("REFINANCE_WORKING_LOAN_OTHER", ToDecimal(REFINANCE_WORKING_LOAN_OTHERTextBox.Text))
        End If
        If REFINANCE_REPAYMENTTextBox.Text = "" Then
            sqlCmd.Parameters.AddWithValue("REFINANCE_REPAYMENT", System.DBNull.Value)
        Else
            sqlCmd.Parameters.AddWithValue("REFINANCE_REPAYMENT", ToDecimal(REFINANCE_REPAYMENTTextBox.Text))
        End If
        If WORKING_CAPITALTextBox.Text = "" Then
            sqlCmd.Parameters.AddWithValue("WORKING_CAPITAL", System.DBNull.Value)
        Else
            sqlCmd.Parameters.AddWithValue("WORKING_CAPITAL", ToDecimal(WORKING_CAPITALTextBox.Text))
        End If
        If LOANTextBox.Text = "" Then
            sqlCmd.Parameters.AddWithValue("LOAN", System.DBNull.Value)
        Else
            sqlCmd.Parameters.AddWithValue("LOAN", ToDecimal(LOANTextBox.Text))
        End If
        If LG_AVALTextBox.Text = "" Then
            sqlCmd.Parameters.AddWithValue("LG_AVAL", System.DBNull.Value)
        Else
            sqlCmd.Parameters.AddWithValue("LG_AVAL", ToDecimal(LG_AVALTextBox.Text))
        End If
        If ASSETS_INCREASE_LOANTextBox.Text = "" Then
            sqlCmd.Parameters.AddWithValue("ASSETS_INCREASE_LOAN", System.DBNull.Value)
        Else
            sqlCmd.Parameters.AddWithValue("ASSETS_INCREASE_LOAN", ToDecimal(ASSETS_INCREASE_LOANTextBox.Text))
        End If
        If BOND_DEPOSIT_PLEDGE_PERSONTextBox.Text = "" Then
            sqlCmd.Parameters.AddWithValue("BOND_DEPOSIT_PLEDGE_PERSON", System.DBNull.Value)
        Else
            sqlCmd.Parameters.AddWithValue("BOND_DEPOSIT_PLEDGE_PERSON", ToDecimal(BOND_DEPOSIT_PLEDGE_PERSONTextBox.Text))
        End If
        If APPRAISAL_VALUE_ZONE_ATextBox.Text = "" Then
            sqlCmd.Parameters.AddWithValue("APPRAISAL_VALUE_ZONE_A", System.DBNull.Value)
        Else
            sqlCmd.Parameters.AddWithValue("APPRAISAL_VALUE_ZONE_A", ToDecimal(APPRAISAL_VALUE_ZONE_ATextBox.Text))
        End If
        If APPRAISAL_VALUE_ZONE_BTextBox.Text = "" Then
            sqlCmd.Parameters.AddWithValue("APPRAISAL_VALUE_ZONE_B", System.DBNull.Value)
        Else
            sqlCmd.Parameters.AddWithValue("APPRAISAL_VALUE_ZONE_B", ToDecimal(APPRAISAL_VALUE_ZONE_BTextBox.Text))
        End If
        If APPRAISAL_VALUE_ZONE_CTextBox.Text = "" Then
            sqlCmd.Parameters.AddWithValue("APPRAISAL_VALUE_ZONE_C", System.DBNull.Value)
        Else
            sqlCmd.Parameters.AddWithValue("APPRAISAL_VALUE_ZONE_C", ToDecimal(APPRAISAL_VALUE_ZONE_CTextBox.Text))
        End If
        If APPRAISAL_VALUE_ZONE_DTextBox.Text = "" Then
            sqlCmd.Parameters.AddWithValue("APPRAISAL_VALUE_ZONE_D", System.DBNull.Value)
        Else
            sqlCmd.Parameters.AddWithValue("APPRAISAL_VALUE_ZONE_D", ToDecimal(APPRAISAL_VALUE_ZONE_DTextBox.Text))
        End If
        If APPRAISAL_VALUE_ZONE_ETextBox.Text = "" Then
            sqlCmd.Parameters.AddWithValue("APPRAISAL_VALUE_ZONE_E", System.DBNull.Value)
        Else
            sqlCmd.Parameters.AddWithValue("APPRAISAL_VALUE_ZONE_E", ToDecimal(APPRAISAL_VALUE_ZONE_ETextBox.Text))
        End If
        If BOND_DEPOSIT_PLEDGETextBox.Text = "" Then
            sqlCmd.Parameters.AddWithValue("BOND_DEPOSIT_PLEDGE", System.DBNull.Value)
        Else
            sqlCmd.Parameters.AddWithValue("BOND_DEPOSIT_PLEDGE", ToDecimal(BOND_DEPOSIT_PLEDGETextBox.Text))
        End If
        If CASH_BOND_CALTextBox.Text = "" Then
            sqlCmd.Parameters.AddWithValue("CASH_BOND_CAL", System.DBNull.Value)
        Else
            sqlCmd.Parameters.AddWithValue("CASH_BOND_CAL", ToDecimal(CASH_BOND_CALTextBox.Text))
        End If
        If ACCOUNT_RECEIVABLE_CALTextBox.Text = "" Then
            sqlCmd.Parameters.AddWithValue("ACCOUNT_RECEIVABLE_CAL", System.DBNull.Value)
        Else
            sqlCmd.Parameters.AddWithValue("ACCOUNT_RECEIVABLE_CAL", ToDecimal(ACCOUNT_RECEIVABLE_CALTextBox.Text))
        End If
        If INVENTORY_CALTextBox.Text = "" Then
            sqlCmd.Parameters.AddWithValue("INVENTORY_CAL", System.DBNull.Value)
        Else
            sqlCmd.Parameters.AddWithValue("INVENTORY_CAL", ToDecimal(INVENTORY_CALTextBox.Text))
        End If
        If TOTAL_CURRENT_ASSETS_CALTextBox.Text = "" Then
            sqlCmd.Parameters.AddWithValue("TOTAL_CURRENT_ASSETS_CAL", System.DBNull.Value)
        Else
            sqlCmd.Parameters.AddWithValue("TOTAL_CURRENT_ASSETS_CAL", ToDecimal(TOTAL_CURRENT_ASSETS_CALTextBox.Text))
        End If

        If MACHINERY_EQUIPMENT_CALTextBox.Text = "" Then
            sqlCmd.Parameters.AddWithValue("MACHINERY_EQUIPMENT_CAL", System.DBNull.Value)
        Else
            sqlCmd.Parameters.AddWithValue("MACHINERY_EQUIPMENT_CAL", ToDecimal(MACHINERY_EQUIPMENT_CALTextBox.Text))
        End If

        If PROPERTY_PLANT_BUILDING_CALTextBox.Text = "" Then
            sqlCmd.Parameters.AddWithValue("PROPERTY_PLANT_BUILDING_CAL", System.DBNull.Value)
        Else
            sqlCmd.Parameters.AddWithValue("PROPERTY_PLANT_BUILDING_CAL", ToDecimal(PROPERTY_PLANT_BUILDING_CALTextBox.Text))
        End If

        If OTHER_FIXED_ASSETS_CALTextBox.Text = "" Then
            sqlCmd.Parameters.AddWithValue("OTHER_FIXED_ASSETS_CAL", System.DBNull.Value)
        Else
            sqlCmd.Parameters.AddWithValue("OTHER_FIXED_ASSETS_CAL", ToDecimal(OTHER_FIXED_ASSETS_CALTextBox.Text))
        End If

        If ASSETS_FROM_CREDIT_CALTextBox.Text = "" Then
            sqlCmd.Parameters.AddWithValue("ASSETS_FROM_CREDIT_CAL", System.DBNull.Value)
        Else
            sqlCmd.Parameters.AddWithValue("ASSETS_FROM_CREDIT_CAL", ToDecimal(ASSETS_FROM_CREDIT_CALTextBox.Text))
        End If

        If TOTAL_FIXED_ASSETS_CALTextBox.Text = "" Then
            sqlCmd.Parameters.AddWithValue("TOTAL_FIXED_ASSETS_CAL", System.DBNull.Value)
        Else
            sqlCmd.Parameters.AddWithValue("TOTAL_FIXED_ASSETS_CAL", ToDecimal(TOTAL_FIXED_ASSETS_CALTextBox.Text))
        End If

        If TOTAL_FIXED_ASSETS_CALTextBox.Text = "" Then
            sqlCmd.Parameters.AddWithValue("TOTAL_ASSETS_CAL", System.DBNull.Value)
        Else
            sqlCmd.Parameters.AddWithValue("TOTAL_ASSETS_CAL", ToDecimal(TOTAL_ASSETS_CALTextBox.Text))
        End If

        If ACCOUNT_PAYABLE_CALTextBox.Text = "" Then
            sqlCmd.Parameters.AddWithValue("ACCOUNT_PAYABLE_CAL", System.DBNull.Value)
        Else
            sqlCmd.Parameters.AddWithValue("ACCOUNT_PAYABLE_CAL", ToDecimal(ACCOUNT_PAYABLE_CALTextBox.Text))
        End If

        If CURRENT_LIABILITY_BAY_CALTextBox.Text = "" Then
            sqlCmd.Parameters.AddWithValue("CURRENT_LIABILITY_BAY_CAL", System.DBNull.Value)
        Else
            sqlCmd.Parameters.AddWithValue("CURRENT_LIABILITY_BAY_CAL", ToDecimal(CURRENT_LIABILITY_BAY_CALTextBox.Text))
        End If

        If OTHER_CURRENT_LIABILITY_CALTextBox.Text = "" Then
            sqlCmd.Parameters.AddWithValue("OTHER_CURRENT_LIABILITY_CAL", System.DBNull.Value)
        Else
            sqlCmd.Parameters.AddWithValue("OTHER_CURRENT_LIABILITY_CAL", ToDecimal(OTHER_CURRENT_LIABILITY_CALTextBox.Text))
        End If

        If TOTAL_CURRENT_LIABILITY_CALTextBox.Text = "" Then
            sqlCmd.Parameters.AddWithValue("TOTAL_CURRENT_LIABILITY_CAL", System.DBNull.Value)
        Else
            sqlCmd.Parameters.AddWithValue("TOTAL_CURRENT_LIABILITY_CAL", ToDecimal(TOTAL_CURRENT_LIABILITY_CALTextBox.Text))
        End If

        If LONG_TERM_LIABILITY_BAY_CALTextBox.Text = "" Then
            sqlCmd.Parameters.AddWithValue("LONG_TERM_LIABILITY_BAY_CAL", System.DBNull.Value)
        Else
            sqlCmd.Parameters.AddWithValue("LONG_TERM_LIABILITY_BAY_CAL", ToDecimal(LONG_TERM_LIABILITY_BAY_CALTextBox.Text))
        End If

        If OTHER_LONG_TERM_LIABILITY_CALTextBox.Text = "" Then
            sqlCmd.Parameters.AddWithValue("OTHER_LONG_TERM_LIABILITY_CAL", System.DBNull.Value)
        Else
            sqlCmd.Parameters.AddWithValue("OTHER_LONG_TERM_LIABILITY_CAL", ToDecimal(OTHER_LONG_TERM_LIABILITY_CALTextBox.Text))
        End If

        If TOTAL_LIABILITY_CALTextBox.Text = "" Then
            sqlCmd.Parameters.AddWithValue("TOTAL_LIABILITY_CAL", System.DBNull.Value)
        Else
            sqlCmd.Parameters.AddWithValue("TOTAL_LIABILITY_CAL", ToDecimal(TOTAL_LIABILITY_CALTextBox.Text))
        End If

        If LOANS_REL_CO_DIRECTORS_CALTextBox.Text = "" Then
            sqlCmd.Parameters.AddWithValue("LOANS_REL_CO_DIRECTORS_CAL", System.DBNull.Value)
        Else
            sqlCmd.Parameters.AddWithValue("LOANS_REL_CO_DIRECTORS_CAL", ToDecimal(LOANS_REL_CO_DIRECTORS_CALTextBox.Text))
        End If

        If EQUITY_CALTextBox.Text = "" Then
            sqlCmd.Parameters.AddWithValue("EQUITY_CAL", System.DBNull.Value)
        Else
            sqlCmd.Parameters.AddWithValue("EQUITY_CAL", ToDecimal(EQUITY_CALTextBox.Text))
        End If

        If LIABILITY_EQUITY_CALTextBox.Text = "" Then
            sqlCmd.Parameters.AddWithValue("LIABILITY_EQUITY_CAL", System.DBNull.Value)
        Else
            sqlCmd.Parameters.AddWithValue("LIABILITY_EQUITY_CAL", ToDecimal(LIABILITY_EQUITY_CALTextBox.Text))
        End If

        If EBIDA_PERCENT_CALTextBox.Text = "" Then
            sqlCmd.Parameters.AddWithValue("EBIDA_PERCENT_CAL", System.DBNull.Value)
        Else
            sqlCmd.Parameters.AddWithValue("EBIDA_PERCENT_CAL", ToDecimal(EBIDA_PERCENT_CALTextBox.Text))
        End If

        If EBIDA_CALTextBox.Text = "" Then
            sqlCmd.Parameters.AddWithValue("EBIDA_CAL", System.DBNull.Value)
        Else
            sqlCmd.Parameters.AddWithValue("EBIDA_CAL", ToDecimal(EBIDA_CALTextBox.Text))
        End If

        If DE_BEFORE_LOAN_CALTextBox.Text = "" Then
            sqlCmd.Parameters.AddWithValue("DE_BEFORE_LOAN_CAL", System.DBNull.Value)
        Else
            sqlCmd.Parameters.AddWithValue("DE_BEFORE_LOAN_CAL", ToDecimal(DE_BEFORE_LOAN_CALTextBox.Text))
        End If

        If DSCR_BEFORE_LOAN_CALTextBox.Text = "" Then
            sqlCmd.Parameters.AddWithValue("DSCR_BEFORE_LOAN_CAL", System.DBNull.Value)
        Else
            sqlCmd.Parameters.AddWithValue("DSCR_BEFORE_LOAN_CAL", ToDecimal(DSCR_BEFORE_LOAN_CALTextBox.Text))
        End If

        If AR_DAY_CALTextBox.Text = "" Then
            sqlCmd.Parameters.AddWithValue("AR_DAY_CAL", System.DBNull.Value)
        Else
            sqlCmd.Parameters.AddWithValue("AR_DAY_CAL", ToDecimal(AR_DAY_CALTextBox.Text))
        End If

        If INVENTORY_DAY_CALTextBox.Text = "" Then
            sqlCmd.Parameters.AddWithValue("INVENTORY_DAY_CAL", System.DBNull.Value)
        Else
            sqlCmd.Parameters.AddWithValue("INVENTORY_DAY_CAL", ToDecimal(INVENTORY_DAY_CALTextBox.Text))
        End If

        If WORKING_CAPITAL_NEED_CALTextBox.Text = "" Then
            sqlCmd.Parameters.AddWithValue("WORKING_CAPITAL_NEED_CAL", System.DBNull.Value)
        Else
            sqlCmd.Parameters.AddWithValue("WORKING_CAPITAL_NEED_CAL", ToDecimal(WORKING_CAPITAL_NEED_CALTextBox.Text))
        End If

        If LOAN_NEED_CALTextBox.Text = "" Then
            sqlCmd.Parameters.AddWithValue("LOAN_NEED_CAL", System.DBNull.Value)
        Else
            sqlCmd.Parameters.AddWithValue("LOAN_NEED_CAL", ToDecimal(LOAN_NEED_CALTextBox.Text))
        End If

        If OWNERS_EQUITY_PERCENT_CALTextBox.Text = "" Then
            sqlCmd.Parameters.AddWithValue("OWNERS_EQUITY_PERCENT_CAL", System.DBNull.Value)
        Else
            sqlCmd.Parameters.AddWithValue("OWNERS_EQUITY_PERCENT_CAL", ToDecimal(OWNERS_EQUITY_PERCENT_CALTextBox.Text))
        End If

        If OWNERS_EQUITY_CALTextBox.Text = "" Then
            sqlCmd.Parameters.AddWithValue("OWNERS_EQUITY_CAL", System.DBNull.Value)
        Else
            sqlCmd.Parameters.AddWithValue("OWNERS_EQUITY_CAL", ToDecimal(OWNERS_EQUITY_CALTextBox.Text))
        End If

        If FIXED_INTEREST_PERCENT_CALTextBox.Text = "" Then
            sqlCmd.Parameters.AddWithValue("FIXED_INTEREST_PERCENT_CAL", System.DBNull.Value)
        Else
            sqlCmd.Parameters.AddWithValue("FIXED_INTEREST_PERCENT_CAL", ToDecimal(FIXED_INTEREST_PERCENT_CALTextBox.Text))
        End If

        If PAYMENT_PERIOD_CALTextBox.Text = "" Then
            sqlCmd.Parameters.AddWithValue("PAYMENT_PERIOD_CAL", System.DBNull.Value)
        Else
            sqlCmd.Parameters.AddWithValue("PAYMENT_PERIOD_CAL", ToDecimal(PAYMENT_PERIOD_CALTextBox.Text))
        End If

        If AVERAGE_PAYMENT_PERIOD_CALTextBox.Text = "" Then
            sqlCmd.Parameters.AddWithValue("AVERAGE_PAYMENT_PERIOD_CAL", System.DBNull.Value)
        Else
            sqlCmd.Parameters.AddWithValue("AVERAGE_PAYMENT_PERIOD_CAL", ToDecimal(AVERAGE_PAYMENT_PERIOD_CALTextBox.Text))
        End If

        If WORKING_CAPITAL_APPROVE_CALTextBox.Text = "" Then
            sqlCmd.Parameters.AddWithValue("WORKING_CAPITAL_APPROVE_CAL", System.DBNull.Value)
        Else
            sqlCmd.Parameters.AddWithValue("WORKING_CAPITAL_APPROVE_CAL", ToDecimal(WORKING_CAPITAL_APPROVE_CALTextBox.Text))
        End If

        If LOAN_APPROVE_CALTextBox.Text = "" Then
            sqlCmd.Parameters.AddWithValue("LOAN_APPROVE_CAL", System.DBNull.Value)
        Else
            sqlCmd.Parameters.AddWithValue("LOAN_APPROVE_CAL", ToDecimal(LOAN_APPROVE_CALTextBox.Text))
        End If

        If INTEREST_RATE_PERCENTTextBox.Text = "" Then
            sqlCmd.Parameters.AddWithValue("INTEREST_RATE_PERCENT", System.DBNull.Value)
        Else
            sqlCmd.Parameters.AddWithValue("INTEREST_RATE_PERCENT", ToDecimal(INTEREST_RATE_PERCENTTextBox.Text))
        End If

        If INTEREST_RATE_PERCENT_USEDTextBox.Text = "" Then
            sqlCmd.Parameters.AddWithValue("INTEREST_RATE_PERCENT_USED", System.DBNull.Value)
        Else
            sqlCmd.Parameters.AddWithValue("INTEREST_RATE_PERCENT_USED", ToDecimal(INTEREST_RATE_PERCENT_USEDTextBox.Text))
        End If

        If CONTRACT_YEARTextBox.Text = "" Then
            sqlCmd.Parameters.AddWithValue("CONTRACT_YEAR", System.DBNull.Value)
        Else
            sqlCmd.Parameters.AddWithValue("CONTRACT_YEAR", ToDecimal(CONTRACT_YEARTextBox.Text))
        End If

        If DSCR_THIS_TIMETextBox.Text = "" Then
            sqlCmd.Parameters.AddWithValue("DSCR_THIS_TIME", System.DBNull.Value)
        Else
            sqlCmd.Parameters.AddWithValue("DSCR_THIS_TIME", ToDecimal(DSCR_THIS_TIMETextBox.Text))
        End If

        If DSCR_THIS_TIME_PERCENTTextBox.Text = "" Then
            sqlCmd.Parameters.AddWithValue("DSCR_THIS_TIME_PERCENT", System.DBNull.Value)
        Else
            sqlCmd.Parameters.AddWithValue("DSCR_THIS_TIME_PERCENT", ToDecimal(DSCR_THIS_TIME_PERCENTTextBox.Text))
        End If

        If DE_THIS_TIMETextBox.Text = "" Then
            sqlCmd.Parameters.AddWithValue("DE_THIS_TIME", System.DBNull.Value)
        Else
            sqlCmd.Parameters.AddWithValue("DE_THIS_TIME", ToDecimal(DE_THIS_TIMETextBox.Text))
        End If

        If LTV_THIS_TIMETextBox.Text = "" Then
            sqlCmd.Parameters.AddWithValue("LTV_THIS_TIME", System.DBNull.Value)
        Else

            sqlCmd.Parameters.AddWithValue("LTV_THIS_TIME", ToDecimal(LTV_THIS_TIMETextBox.Text))
        End If

        If LTV_THIS_TIME_PERCENTTextBox.Text = "" Then
            sqlCmd.Parameters.AddWithValue("LTV_THIS_TIME_PERCENT", System.DBNull.Value)
        Else
            sqlCmd.Parameters.AddWithValue("LTV_THIS_TIME_PERCENT", ToDecimal(LTV_THIS_TIME_PERCENTTextBox.Text))
        End If

        If WORKING_CAPITAL_DEFAULTTextBox.Text = "" Then
            sqlCmd.Parameters.AddWithValue("WORKING_CAPITAL_DEFAULT", System.DBNull.Value)
        Else
            sqlCmd.Parameters.AddWithValue("WORKING_CAPITAL_DEFAULT", ToDecimal(WORKING_CAPITAL_DEFAULTTextBox.Text))
        End If

        If LOAN_DEFAULTTextBox.Text = "" Then
            sqlCmd.Parameters.AddWithValue("LOAN_DEFAULT", System.DBNull.Value)
        Else
            sqlCmd.Parameters.AddWithValue("LOAN_DEFAULT", ToDecimal(LOAN_DEFAULTTextBox.Text))
        End If

        If WORKING_CAPITAL_DEFAULT_APPROVETextBox.Text = "" Then
            sqlCmd.Parameters.AddWithValue("WORKING_CAPITAL_DEFAULT_APPROVE", System.DBNull.Value)
        Else
            sqlCmd.Parameters.AddWithValue("WORKING_CAPITAL_DEFAULT_APPROVE", ToDecimal(WORKING_CAPITAL_DEFAULT_APPROVETextBox.Text))
        End If

        If LOAN_DEFAULT_APPROVETextBox.Text = "" Then
            sqlCmd.Parameters.AddWithValue("LOAN_DEFAULT_APPROVE", System.DBNull.Value)
        Else
            sqlCmd.Parameters.AddWithValue("LOAN_DEFAULT_APPROVE", ToDecimal(LOAN_DEFAULT_APPROVETextBox.Text))
        End If

        If BUSINESS_ID_TABLETextBox.Text = "" Then
            sqlCmd.Parameters.AddWithValue("BUSINESS_ID_TABLE", System.DBNull.Value)
        Else
            sqlCmd.Parameters.AddWithValue("BUSINESS_ID_TABLE", BUSINESS_ID_TABLETextBox.Text)
        End If

        If MARGIN_TABLETextBox.Text = "" Then
            sqlCmd.Parameters.AddWithValue("MARGIN_TABLE", System.DBNull.Value)
        Else
            sqlCmd.Parameters.AddWithValue("MARGIN_TABLE", ToDecimal(MARGIN_TABLETextBox.Text))
        End If

        If DSCR_TABLETextBox.Text = "" Then
            sqlCmd.Parameters.AddWithValue("DSCR_TABLE", System.DBNull.Value)
        Else
            sqlCmd.Parameters.AddWithValue("DSCR_TABLE", ToDecimal(DSCR_TABLETextBox.Text))
        End If

        If AP_TABLETextBox.Text = "" Then
            sqlCmd.Parameters.AddWithValue("AP_TABLE", System.DBNull.Value)
        Else
            sqlCmd.Parameters.AddWithValue("AP_TABLE", ToDecimal(AP_TABLETextBox.Text))
        End If

        If AR_TABLETextBox.Text = "" Then
            sqlCmd.Parameters.AddWithValue("AR_TABLE", System.DBNull.Value)
        Else
            sqlCmd.Parameters.AddWithValue("AR_TABLE", ToDecimal(AR_TABLETextBox.Text))
        End If

        If STOCK_TABLETextBox.Text = "" Then
            sqlCmd.Parameters.AddWithValue("STOCK_TABLE", System.DBNull.Value)
        Else
            sqlCmd.Parameters.AddWithValue("STOCK_TABLE", ToDecimal(STOCK_TABLETextBox.Text))
        End If

        If LTV_TABLETextBox.Text = "" Then
            sqlCmd.Parameters.AddWithValue("LTV_TABLE", System.DBNull.Value)
        Else
            sqlCmd.Parameters.AddWithValue("LTV_TABLE", ToDecimal(LTV_TABLETextBox.Text))
        End If
        If WORKING_CAPITAL_TABLETextBox.Text = "" Then
            sqlCmd.Parameters.AddWithValue("WORKING_CAPITAL_TABLE", System.DBNull.Value)
        Else
            sqlCmd.Parameters.AddWithValue("WORKING_CAPITAL_TABLE", ToDecimal(WORKING_CAPITAL_TABLETextBox.Text))
        End If

        If RATE_TABLETextBox.Text = "" Then
            sqlCmd.Parameters.AddWithValue("RATE_TABLE", System.DBNull.Value)
        Else
            sqlCmd.Parameters.AddWithValue("RATE_TABLE", ToDecimal(RATE_TABLETextBox.Text))
        End If

        If CONTRACT_TABLETextBox.Text = "" Then
            sqlCmd.Parameters.AddWithValue("CONTRACT_TABLE", System.DBNull.Value)
        Else
            sqlCmd.Parameters.AddWithValue("CONTRACT_TABLE", ToDecimal(CONTRACT_TABLETextBox.Text))
        End If


        sqlCmd.ExecuteNonQuery()

        '  insert  cif ใน C/A

        sqlCmd.CommandType = CommandType.StoredProcedure
        sqlCmd.CommandText = "[SME_S].[P_SS_FINANCIAL_CIF_DELETE]"
        sqlCmd.Parameters.Clear()
        sqlCmd.Parameters.AddWithValue("@SMES_ID", SMES_IDTextBox.Text)
        sqlCmd.ExecuteNonQuery()

        Dim CifTable As DataTable = Session("CusDT")
        For i As Integer = 0 To CifTable.Rows.Count - 1
            With CifTable.Rows(i)

                sqlCmd.CommandText = "[SME_S].[P_SS_FINANCIAL_CIF_INSERT]"
                sqlCmd.CommandType = CommandType.StoredProcedure
                sqlCmd.Parameters.Clear()

                sqlCmd.Parameters.AddWithValue("@SMES_ID", SMES_IDTextBox.Text)
                sqlCmd.Parameters.AddWithValue("@CIF", CType(.Item("CIF"), Integer))
                sqlCmd.Parameters.AddWithValue("@BUS_CODE", .Item("BusinessCode"))

                sqlCmd.ExecuteNonQuery()
            End With
        Next
        sqlCmd.Transaction.Commit()

        'Catch ex As Exception
        '    sqlCmd.Transaction.Rollback()
        '    alert(ex.Message.ToString())
        '    Exit Sub
        'Finally
        If (conn.State = ConnectionState.Open) Then
            conn.Close()
        End If
        conn = Nothing
        alert("Update complete.")
        'End Try

    End Sub
    Protected Sub alert(ByVal str As String)
        'Response.Write("<script language=javascript>showProgress();</script>")
        'Page.ClientScript.RegisterStartupScript(Me.GetType(), "messagebox", "showProgress();", True)
        'Page.RegisterStartupScript("progress", "<script>showProgress();</script>")
        str = "alert(""" & str & """);"
        Page.ClientScript.RegisterStartupScript(Me.GetType(), "messagebox", str, True)
    End Sub
    Protected Sub BtnBack_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles BtnBack.Click
        Response.Redirect("financial_main.aspx")
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

End Class
