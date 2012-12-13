Imports System.Data
Imports System.Data.SqlClient
Imports System.Globalization

Partial Class smes_financial_customer

    Inherits System.Web.UI.Page
    Shared CusDT As DataTable
    Shared Action As String
    Protected cul As New CultureInfo("th-TH") ' ปี ไทย  
    'Protected cul As New CultureInfo("en-US") ' ปี ไทย  

    Sub CustomerGridEditCommand(ByVal sender As Object, ByVal e As GridViewEditEventArgs)
        CustomersGridView.EditIndex = e.NewEditIndex
        showForm()
        showCustomerDebt()
    End Sub
    Sub CustomerGridCancelCommand(ByVal sender As Object, ByVal e As GridViewCancelEditEventArgs)
        CustomersGridView.EditIndex = -1
    End Sub

    Sub ShowData()

        Dim conn As SqlConnection = Nothing
        'Try
        conn = ConnectionUtil.getSqlConnectionFromWebConfig()
        Dim Sql As String = "SME_S.P_SS_FINANCIAL_CUSTOMER_CA_SELECT"
        Dim sqlCmd As New SqlCommand(Sql, conn)
        sqlCmd.CommandType = CommandType.StoredProcedure
        sqlCmd.Prepare()
        sqlCmd.Parameters.AddWithValue("SMES_ID", Request.QueryString("SMES_ID"))
        'MsgBox(Request.QueryString("SMES_ID"))
        Dim reader As SqlDataReader = sqlCmd.ExecuteReader()
        'MsgBox(reader.HasRows)
        If reader.HasRows Then
            CustomersGridView.DataSource = reader
            CustomersGridView.DataBind()
        Else
            ' setAdd()  ' remark ไว้ไม่สามารถให้เพิ่มข้อมูลได้
        End If

        ' ถ้ามี business ให้หาชื่อ business

        reader.Close()
        sqlCmd.Dispose()
        conn.Close()

        'Catch ex As Exception
        'runScirpt("alert('" & ex.ToString.Replace("'", "") & "');")
        ' Finally
        ' End Try

    End Sub
    Sub showForm()

        Dim CIF As String = CustomersGridView.Rows(CustomersGridView.EditIndex).Cells(1).Text

        Dim conn As SqlConnection = Nothing
        ' Try
        conn = ConnectionUtil.getSqlConnectionFromWebConfig()
        'Dim Sql As String = "SME_S.P_SS_FINANCIAL_CUSTOMER_SELECT_CIF"
        Dim Sql As String = "SME_S.P_SS_FINANCIAL_CUSTOMER_CA_SELECT_CIF"
        Dim sqlCmd As New SqlCommand(Sql, conn)
        sqlCmd.CommandType = CommandType.StoredProcedure
        sqlCmd.Prepare()
        sqlCmd.Parameters.AddWithValue("@SMES_ID", Request.QueryString("SMES_ID"))
        sqlCmd.Parameters.AddWithValue("@CIF", CIF)

        Dim reader As SqlDataReader = sqlCmd.ExecuteReader()
        If reader.HasRows = False Then
            clearInput()
            setAdd()

            CIFTextBox.Text = CustomersGridView.Rows(CustomersGridView.EditIndex).Cells(1).Text
            CIFNameTextBox.Text = CustomersGridView.Rows(CustomersGridView.EditIndex).Cells(2).Text

        Else
            While reader.Read()
                clearInput()
                '   Console.WriteLine(String.Format("{0}, {1}", reader(0), reader(1)))
                If IsDBNull(reader("CIF")) = False Then CIFTextBox.Text = reader("CIF").ToString()
                If IsDBNull(reader("NAME")) = False Then CIFNameTextBox.Text = reader("NAME").ToString()
                If IsDBNull(reader("CUSTOMER_TYPE")) = False Then
                    CustomerTypeDropDownList.SelectedIndex = CustomerTypeDropDownList.Items.IndexOf(CustomerTypeDropDownList.Items.FindByValue(reader("CUSTOMER_TYPE")))
                End If

                If IsDBNull(reader("BIRTH_DATE")) = False Then BirthDateTextBox.Text = String.Format("{0:dd/MM/yyyy}", reader("BIRTH_DATE"), cul)
                If IsDBNull(reader("OPERATE_DATE")) = False Then OperateDateTextBox.Text = String.Format("{0:dd/MM/yyyy}", reader("OPERATE_DATE"))
                If IsDBNull(reader("REGISTER_DATE")) = False Then RegisterDateTextBox.Text = String.Format("{0:dd/MM/yyyy}", reader("REGISTER_DATE"))
                If IsDBNull(reader("NATIONALITY_LISt_ID")) = False Then NationalityDropDownList.SelectedIndex = NationalityDropDownList.Items.IndexOf(NationalityDropDownList.Items.FindByValue(reader("NATIONALITY_LISt_ID")))
                If IsDBNull(reader("BNATIONALITY_LISt_ID")) = False Then BNationalityDropDownList.SelectedIndex = BNationalityDropDownList.Items.IndexOf(BNationalityDropDownList.Items.FindByValue(reader("BNATIONALITY_LISt_ID")))
                If IsDBNull(reader("JURISTIC_LIST_ID")) = False Then JuristicDropDownList.SelectedIndex = JuristicDropDownList.Items.IndexOf(JuristicDropDownList.Items.FindByValue(reader("JURISTIC_LIST_ID")))
                If IsDBNull(reader("BLACKLIST_LIST_ID")) = False Then BlackListDropDownList.SelectedIndex = BlackListDropDownList.Items.IndexOf(BlackListDropDownList.Items.FindByValue(reader("BLACKLIST_LIST_ID")))
                If IsDBNull(reader("NCB_LIST_ID")) = False Then NCBDropDownList.SelectedIndex = NCBDropDownList.Items.IndexOf(NCBDropDownList.Items.FindByValue(reader("NCB_LIST_ID")))
                If IsDBNull(reader("NCB_CODE")) = False Then NCBCodeDropDownList.SelectedIndex = NCBCodeDropDownList.Items.IndexOf(NCBCodeDropDownList.Items.FindByValue(reader("NCB_CODE")))
                If IsDBNull(reader("TDR_LIST_ID")) = False Then TDRDropDownList.SelectedIndex = TDRDropDownList.Items.IndexOf(TDRDropDownList.Items.FindByValue(reader("TDR_LIST_ID")))
                If IsDBNull(reader("RATING_LIST_ID")) = False Then RatingDropDownList.SelectedIndex = RatingDropDownList.Items.IndexOf(RatingDropDownList.Items.FindByValue(reader("RATING_LIST_ID")))
                If IsDBNull(reader("LEGAL_LIST_ID")) = False Then LegalDropDownList.SelectedIndex = LegalDropDownList.Items.IndexOf(LegalDropDownList.Items.FindByValue(reader("LEGAL_LIST_ID")))
                If IsDBNull(reader("REGIS_DOC_LIST_ID")) = False Then RegisDocDropDownList.SelectedIndex = RegisDocDropDownList.Items.IndexOf(RegisDocDropDownList.Items.FindByValue(reader("REGIS_DOC_LIST_ID")))
                If IsDBNull(reader("SHAREHOLDER_LIST_ID")) = False Then ShareHolderDropDownList.SelectedIndex = ShareHolderDropDownList.Items.IndexOf(ShareHolderDropDownList.Items.FindByValue(reader("SHAREHOLDER_LIST_ID")))
                If IsDBNull(reader("EXPERIENCE")) = False Then ExperienceTextBox.Text = reader("EXPERIENCE")


                If IsDBNull(reader("AGE_CEO")) = False Then CEOAgeTextBox.Text = reader("AGE_CEO")
                If IsDBNull(reader("FIXED_ASSET_NO_LAND")) = False Then FIXED_ASSET_NO_LANDTextBox.Text = String.Format("{0:n0}", reader("FIXED_ASSET_NO_LAND"))
                If IsDBNull(reader("CHECK_NCB_6MONTH")) = False Then CHECK_NCB_6MONTHTextBox.Text = reader("CHECK_NCB_6MONTH")
                If IsDBNull(reader("CHECK_NCB_6MONTH")) = False Then CHECK_NCB_6MONTHTextBox.Text = reader("CHECK_NCB_6MONTH")

                If IsDBNull(reader("DSS_OPERATE_STATUS")) = False Then DSS_OPERATE_STATUSDropDownList.SelectedIndex = DSS_OPERATE_STATUSDropDownList.Items.IndexOf(DSS_OPERATE_STATUSDropDownList.Items.FindByValue(reader("DSS_OPERATE_STATUS")))
                If IsDBNull(reader("POSITIVE_EQUITY")) = False Then POSITIVE_EQUITYDropDownList.SelectedIndex = POSITIVE_EQUITYDropDownList.Items.IndexOf(POSITIVE_EQUITYDropDownList.Items.FindByValue(reader("POSITIVE_EQUITY")))
                If IsDBNull(reader("PROFIT_LAST_2YEARS")) = False Then PROFIT_LAST_2YEARSDropDownList.SelectedIndex = PROFIT_LAST_2YEARSDropDownList.Items.IndexOf(PROFIT_LAST_2YEARSDropDownList.Items.FindByValue(reader("PROFIT_LAST_2YEARS")))
                If IsDBNull(reader("INSIGNIFICANT_LOST")) = False Then INSIGNIFICANT_LOSTDropDownList.SelectedIndex = INSIGNIFICANT_LOSTDropDownList.Items.IndexOf(INSIGNIFICANT_LOSTDropDownList.Items.FindByValue(reader("INSIGNIFICANT_LOST")))

                If IsDBNull(reader("CHEQUE_RETURN_6MONTH")) = False Then CHEQUE_RETURN_6MONTHTextBox.Text = String.Format("{0:n0}", reader("CHEQUE_RETURN_6MONTH"))
                If IsDBNull(reader("TRADING_CHEQUE_RETURN_VAL_6MONTH")) = False Then TRADING_CHEQUE_RETURN_VAL_6MONTHTextBox.Text = String.Format("{0:n2}", reader("TRADING_CHEQUE_RETURN_VAL_6MONTH"))
                If IsDBNull(reader("OD_UTILIZATION_PERCENT")) = False Then OD_UTILIZATION_PERCENTTextBox.Text = reader("OD_UTILIZATION_PERCENT")
                If IsDBNull(reader("OD_SWING_PERCENT")) = False Then OD_SWING_PERCENTTextBox.Text = reader("OD_SWING_PERCENT")
                If IsDBNull(reader("OD_OVER_NUMBER")) = False Then OD_OVER_NUMBERTextBox.Text = reader("OD_OVER_NUMBER")


                If IsDBNull(reader("DPD_MORE_10_30_MONTH_1_3")) = False Then DPD_MORE_10_30_MONTH_1_3DropDownList.SelectedIndex = DPD_MORE_10_30_MONTH_1_3DropDownList.Items.IndexOf(DPD_MORE_10_30_MONTH_1_3DropDownList.Items.FindByValue(reader("DPD_MORE_10_30_MONTH_1_3")))
                If IsDBNull(reader("DPD_MORE_30_60_MONTH_1_3")) = False Then DPD_MORE_30_60_MONTH_1_3DropDownList.SelectedIndex = DPD_MORE_30_60_MONTH_1_3DropDownList.Items.IndexOf(DPD_MORE_30_60_MONTH_1_3DropDownList.Items.FindByValue(reader("DPD_MORE_30_60_MONTH_1_3")))
                If IsDBNull(reader("DPD_MORE_60_90_MONTH_1_3")) = False Then DPD_MORE_60_90_MONTH_1_3DropDownList.SelectedIndex = DPD_MORE_60_90_MONTH_1_3DropDownList.Items.IndexOf(DPD_MORE_60_90_MONTH_1_3DropDownList.Items.FindByValue(reader("DPD_MORE_60_90_MONTH_1_3")))
                If IsDBNull(reader("DPD_MORE_90_MONTH_1_3")) = False Then DPD_MORE_90_MONTH_1_3DropDownList.SelectedIndex = DPD_MORE_90_MONTH_1_3DropDownList.Items.IndexOf(DPD_MORE_90_MONTH_1_3DropDownList.Items.FindByValue(reader("DPD_MORE_90_MONTH_1_3")))


                If IsDBNull(reader("DPD_MORE_10_30_MONTH_4_12")) = False Then DPD_MORE_10_30_MONTH_4_12DropDownList.SelectedIndex = DPD_MORE_10_30_MONTH_4_12DropDownList.Items.IndexOf(DPD_MORE_10_30_MONTH_4_12DropDownList.Items.FindByValue(reader("DPD_MORE_10_30_MONTH_4_12")))
                If IsDBNull(reader("DPD_MORE_30_60_MONTH_4_12")) = False Then DPD_MORE_30_60_MONTH_4_12DropDownList.SelectedIndex = DPD_MORE_30_60_MONTH_4_12DropDownList.Items.IndexOf(DPD_MORE_30_60_MONTH_4_12DropDownList.Items.FindByValue(reader("DPD_MORE_30_60_MONTH_4_12")))
                If IsDBNull(reader("DPD_MORE_60_90_MONTH_4_12")) = False Then DPD_MORE_60_90_MONTH_4_12DropDownList.SelectedIndex = DPD_MORE_60_90_MONTH_4_12DropDownList.Items.IndexOf(DPD_MORE_60_90_MONTH_4_12DropDownList.Items.FindByValue(reader("DPD_MORE_60_90_MONTH_4_12")))
                If IsDBNull(reader("DPD_MORE_90_MONTH_4_12")) = False Then DPD_MORE_90_MONTH_4_12DropDownList.SelectedIndex = DPD_MORE_90_MONTH_4_12DropDownList.Items.IndexOf(DPD_MORE_90_MONTH_4_12DropDownList.Items.FindByValue(reader("DPD_MORE_90_MONTH_4_12")))


                If IsDBNull(reader("DPD_MORE_10_30_MONTH_12_24")) = False Then DPD_MORE_10_30_MONTH_12_24DropDownList.SelectedIndex = DPD_MORE_10_30_MONTH_12_24DropDownList.Items.IndexOf(DPD_MORE_10_30_MONTH_12_24DropDownList.Items.FindByValue(reader("DPD_MORE_10_30_MONTH_12_24")))
                If IsDBNull(reader("DPD_MORE_30_60_MONTH_12_24")) = False Then DPD_MORE_30_60_MONTH_12_24DropDownList.SelectedIndex = DPD_MORE_30_60_MONTH_12_24DropDownList.Items.IndexOf(DPD_MORE_30_60_MONTH_12_24DropDownList.Items.FindByValue(reader("DPD_MORE_30_60_MONTH_12_24")))
                If IsDBNull(reader("DPD_MORE_60_90_MONTH_12_24")) = False Then DPD_MORE_60_90_MONTH_12_24DropDownList.SelectedIndex = DPD_MORE_60_90_MONTH_12_24DropDownList.Items.IndexOf(DPD_MORE_60_90_MONTH_12_24DropDownList.Items.FindByValue(reader("DPD_MORE_60_90_MONTH_12_24")))
                If IsDBNull(reader("DPD_MORE_90_MONTH_12_24")) = False Then DPD_MORE_90_MONTH_12_24DropDownList.SelectedIndex = DPD_MORE_90_MONTH_12_24DropDownList.Items.IndexOf(DPD_MORE_90_MONTH_12_24DropDownList.Items.FindByValue(reader("DPD_MORE_90_MONTH_12_24")))



                setEdit()

            End While
        End If

        reader.Close()

        reader.Close()
        sqlCmd.Dispose()
        conn.Close()

        ActionLabel.Text = "แก้ไขข้อมูล"
        ' Catch ex As Exception

        'runScirpt("alert('" & ex.ToString().Substring(0, 50).Replace("'", "") & "');")
        '  Finally
        'End Try

    End Sub
    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        SMES_IDTextBox.Text = Request.QueryString("SMES_ID")
        If Not Page.IsPostBack Then
            bindDropDown()
            setShow()
            If SMES_IDTextBox.Text <> "" Then
                ShowData()
            Else
            End If
        Else

        End If
        If Request.QueryString("action") = "delete" Then
            deleteCustomer(Request.QueryString("CIF"), Request.QueryString("SMES_ID"))
        End If


    End Sub
    Sub deleteCustomer(ByVal CIF As Integer, ByVal SMES_ID As Integer)

        Dim conn As SqlConnection = Nothing
        conn = ConnectionUtil.getSqlConnectionFromWebConfig()
        Dim Sql As String = "SME_S.P_SS_FINANCIAL_CUSTOMER_DELETE_CIF"
        Dim sqlCmd As New SqlCommand(Sql, conn)
        sqlCmd.CommandType = CommandType.StoredProcedure
        sqlCmd.Parameters.AddWithValue("CIF", CIF)
        sqlCmd.Parameters.AddWithValue("SMES_ID", SMES_ID)
        sqlCmd.ExecuteNonQuery()
        conn.Close()


        Response.Redirect("financial_customer.aspx?SMES_ID=" & SMES_ID)

    End Sub
    Sub bindDropDown()

        Dim conn As SqlConnection = Nothing
        conn = ConnectionUtil.getSqlConnectionFromWebConfig()
        Dim Sql As String = "SME_S.P_SS_LIST_SELECT_LIST_TYPE_ALL"
        Dim sqlCmd As New SqlCommand(Sql, conn)
        sqlCmd.CommandType = CommandType.StoredProcedure
        'sqlCmd.Parameters.AddWithValue("LIST_TYPE", "'BLACKLIST','JURISTIC','LEGAL','NATIONALITY','RATING'")
        sqlCmd.Prepare()
        Dim reader As SqlDataReader = sqlCmd.ExecuteReader()
        Dim dt As DataTable = New DataTable()
        dt.Load(reader)

        Dim dr() As DataRow

        dr = dt.Select("LIST_TYPE='5' ")
        For i = 0 To dr.GetUpperBound(0)
            Dim item As New ListItem(dr(i)(2), dr(i)(1))
            CustomerTypeDropDownList.Items.Add(item)
        Next i
        CustomerTypeDropDownList.Items.Insert(0, New ListItem("...โปรดเลือก...", ""))

        dr = dt.Select("LIST_TYPE='10' ")
        For i = 0 To dr.GetUpperBound(0)
            Dim item As New ListItem(dr(i)(2), dr(i)(1))
            NationalityDropDownList.Items.Add(item)
        Next i
        NationalityDropDownList.Items.Insert(0, New ListItem("...โปรดเลือก...", ""))

        dr = dt.Select("LIST_TYPE='3' ")
        For i = 0 To dr.GetUpperBound(0)
            Dim item As New ListItem(dr(i)(2), dr(i)(1))
            BNationalityDropDownList.Items.Add(item)
        Next i
        BNationalityDropDownList.Items.Insert(0, New ListItem("...โปรดเลือก...", ""))


        dr = dt.Select("LIST_TYPE='7' ")
        For i = 0 To dr.GetUpperBound(0)
            Dim item As New ListItem(dr(i)(2), dr(i)(1))
            JuristicDropDownList.Items.Add(item)
        Next i
        JuristicDropDownList.Items.Insert(0, New ListItem("...โปรดเลือก...", ""))

        dr = dt.Select("LIST_TYPE='16' ")
        For i = 0 To dr.GetUpperBound(0)
            Dim item As New ListItem(dr(i)(2), dr(i)(1))
            RegisDocDropDownList.Items.Add(item)
        Next i
        RegisDocDropDownList.Items.Insert(0, New ListItem("...โปรดเลือก...", ""))

        dr = dt.Select("LIST_TYPE='17' ")
        For i = 0 To dr.GetUpperBound(0)
            Dim item As New ListItem(dr(i)(2), dr(i)(1))
            ShareHolderDropDownList.Items.Add(item)
        Next i
        ShareHolderDropDownList.Items.Insert(0, New ListItem("...โปรดเลือก...", ""))

        dr = dt.Select("LIST_TYPE='2' ")
        For i = 0 To dr.GetUpperBound(0)
            Dim item As New ListItem(dr(i)(2), dr(i)(1))
            BlackListDropDownList.Items.Add(item)
        Next i
        BlackListDropDownList.Items.Insert(0, New ListItem("...โปรดเลือก...", ""))

        dr = dt.Select("LIST_TYPE='11' ")
        For i = 0 To dr.GetUpperBound(0)
            Dim item As New ListItem(dr(i)(2), dr(i)(1))
            NCBDropDownList.Items.Add(item)
        Next i
        NCBDropDownList.Items.Insert(0, New ListItem("...โปรดเลือก...", ""))

        dr = dt.Select("LIST_TYPE='12' ")
        For i = 0 To dr.GetUpperBound(0)
            Dim item As New ListItem(dr(i)(2), dr(i)(1))
            NCBCodeDropDownList.Items.Add(item)
        Next i
        NCBCodeDropDownList.Items.Insert(0, New ListItem("...โปรดเลือก...", ""))

        dr = dt.Select("LIST_TYPE='18' ")
        For i = 0 To dr.GetUpperBound(0)
            Dim item As New ListItem(dr(i)(2), dr(i)(1))
            TDRDropDownList.Items.Add(item)
        Next i
        TDRDropDownList.Items.Insert(0, New ListItem("...โปรดเลือก...", ""))

        dr = dt.Select("LIST_TYPE='15' ")
        For i = 0 To dr.GetUpperBound(0)
            Dim item As New ListItem(dr(i)(2), dr(i)(1))
            RatingDropDownList.Items.Add(item)
        Next i
        RatingDropDownList.Items.Insert(0, New ListItem("...โปรดเลือก...", ""))

        dr = dt.Select("LIST_TYPE='8' ")
        For i = 0 To dr.GetUpperBound(0)
            Dim item As New ListItem(dr(i)(2), dr(i)(1))
            LegalDropDownList.Items.Add(item)
        Next i
        LegalDropDownList.Items.Insert(0, New ListItem("...โปรดเลือก...", ""))


        dr = dt.Select("LIST_TYPE='21'")
        For i = 0 To dr.GetUpperBound(0)
            Dim item As New ListItem(dr(i)(2), dr(i)(1))
            DSS_OPERATE_STATUSDropDownList.Items.Add(item)
        Next i
        DSS_OPERATE_STATUSDropDownList.Items.Insert(0, New ListItem("...โปรดเลือก...", ""))

        dr = dt.Select("LIST_TYPE='22'")
        For i = 0 To dr.GetUpperBound(0)
            Dim item As New ListItem(dr(i)(2), dr(i)(1))
            POSITIVE_EQUITYDropDownList.Items.Add(item)
        Next i
        POSITIVE_EQUITYDropDownList.Items.Insert(0, New ListItem("...โปรดเลือก...", ""))

        dr = dt.Select("LIST_TYPE='23'")
        For i = 0 To dr.GetUpperBound(0)
            Dim item As New ListItem(dr(i)(2), dr(i)(1))
            PROFIT_LAST_2YEARSDropDownList.Items.Add(item)
        Next i
        PROFIT_LAST_2YEARSDropDownList.Items.Insert(0, New ListItem("...โปรดเลือก...", ""))

        dr = dt.Select("LIST_TYPE='24'")
        For i = 0 To dr.GetUpperBound(0)
            Dim item As New ListItem(dr(i)(2), dr(i)(1))
            INSIGNIFICANT_LOSTDropDownList.Items.Add(item)
        Next i
        INSIGNIFICANT_LOSTDropDownList.Items.Insert(0, New ListItem("...โปรดเลือก...", ""))



        Dim Sql2 As String = "SME_S.P_SS_LIST_SELECT_DEBT"
        Dim sqlCmd2 As New SqlCommand(Sql2, conn)
        sqlCmd2.Prepare()
        Dim reader2 As SqlDataReader = sqlCmd2.ExecuteReader()
        DebtDropDownList.DataSource = reader2
        DebtDropDownList.DataValueField = "DEBT_ID"
        DebtDropDownList.DataTextField = "DEBT_NAME"
        DebtDropDownList.DataBind()

        reader.Close()
        conn.Close()


    End Sub
    Sub setEdit()
        divTable.Visible = False
        divForm.Visible = True
        CIFTextBox.Attributes.Add("onfocus", "this.blur();")
        CIFNameTextBox.Attributes.Add("onfocus", "this.blur();")
        AddCustomerButton.Visible = False
        InsertButton.Visible = False
        UpdateButton.Visible = True
    End Sub
    Sub setShow()
        divTable.Visible = True
        divForm.Visible = False
        AddCustomerButton.Visible = True
        ShowData()
    End Sub
    Sub clearInput()
        CustomerTypeDropDownList.SelectedIndex = 0
        CIFTextBox.Text = ""
        CIFTextBox.Enabled = True
        CIFNameTextBox.Text = ""
        BirthDateTextBox.Text = ""
        NationalityDropDownList.SelectedIndex = 0
        BNationalityDropDownList.SelectedIndex = 0
        RegisterDateTextBox.Text = ""
        OperateDateTextBox.Text = ""
        JuristicDropDownList.SelectedIndex = 0
        RegisDocDropDownList.SelectedIndex = 0
        ShareHolderDropDownList.SelectedIndex = 0
        BlackListDropDownList.SelectedIndex = 0
        NCBCodeDropDownList.SelectedIndex = 0
        NCBDropDownList.SelectedIndex = 0
        LegalDropDownList.SelectedIndex = 0
        RatingDropDownList.SelectedIndex = 0
        ExperienceTextBox.Text = ""
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

    Protected Sub runScirpt(ByVal str As String)
        str = " $(document).ready(function(){" & str & "});"
        Page.ClientScript.RegisterStartupScript(Me.GetType(), "", str, True)
    End Sub
    Protected Sub SearchCif()

        If CIFTextBox.Text = "" Then
            CIFNameTextBox.Text = "กรุณาระบุ CIF"
            CIFTextBox.BackColor = Drawing.Color.Red
            Exit Sub
        Else
            If IsNumeric(CIFTextBox.Text) = False Then
                CIFTextBox.Text = ""
                CIFNameTextBox.Text = "กรุณาระบุ CIF ด้วยตัวเลข"
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
            CIFNameTextBox.Text = ""
            Exit Sub
        Else
            CIFNameTextBox.Text = objCus.Cifname
            CIFTextBox.BackColor = Drawing.Color.White
            CIFTextBox.Enabled = False
        End If
    End Sub

    Protected Sub AddCustomerButton_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles AddCustomerButton.Click
        setAdd()
        ActionLabel.Text = "เพิ่มข้อมูล"
    End Sub
    Sub setAdd()

        divTable.Visible = False
        divForm.Visible = True
        clearInput()
        InsertButton.Visible = True
        UpdateButton.Visible = False
        DeleteButton.Visible = False
    
        CIFTextBox.Attributes.Add("onfocus", "this.blur();")
        CIFNameTextBox.Attributes.Add("onfocus", "this.blur();")
        'CIFTextBox.Attributes.Remove("onfocus")
        'CIFNameTextBox.Attributes.Remove("onfocus")
    End Sub
    Protected Sub CancelButton_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles CancelButton.Click
        setShow()
    End Sub
    Sub SaveData(ByVal action As String)

        Dim errMsg As String = ""
        Dim err = False
        If CustomerTypeDropDownList.Items(CustomerTypeDropDownList.SelectedIndex).Value = "" Then
            err = True
            errMsg += " ไม่ระบุประเภทลูกค้า "
        End If
        If CIFNameTextBox.Text = "" Then
            err = True
            errMsg += " ไม่พบลูกค้ารายนี้"
        End If

        ' ยกเลิกการเช็คลูกค้าซ้ำใน grid เนื่องจากมีการดึงลูกค้ามาแล้วจาก ca
        'If action = "Insert" Then
        '    For i = 0 To CustomersGridView.Rows.Count - 1
        '        If CustomersGridView.Rows(i).Cells(1).Text = CIFTextBox.Text Then
        '            err = True
        '            errMsg += " มีลูกค้ารายนี้แล้ว"
        '        End If
        '    Next
        'End If

        If CustomerTypeDropDownList.Items(CustomerTypeDropDownList.SelectedIndex).Value = "CU01" Then ' บุคคลธรรมดา
            If IsDate(BirthDateTextBox.Text) = False Then
                err = True
                errMsg += " วันเกิดไม่ถูกต้อง "
            Else
                If Year(BirthDateTextBox.Text) < 2400 Then
                    err = True
                    errMsg += " วันเกิดต้องเป็น พ.ศ. "
                End If
        End If

        ElseIf CustomerTypeDropDownList.Items(CustomerTypeDropDownList.SelectedIndex).Value = "CU02" Then ' นิติบุคคล
            If IsDate(RegisterDateTextBox.Text) = False Then
                err = True
                errMsg += " วันที่จดทะเบียนไม่ถูกต้อง "
            Else
                If Year(RegisterDateTextBox.Text) < 2400 Then
                    err = True
                    errMsg += " วันที่จดทะเบียนต้องเป็น พ.ศ. "
                End If
            End If
            If JuristicDropDownList.Items(JuristicDropDownList.SelectedIndex).Value = "" Then
                err = True
                errMsg += " ไม่ระบุประเภทธุรกิจ "
            End If
            If ShareHolderDropDownList.Items(ShareHolderDropDownList.SelectedIndex).Value = "" Then
                err = True
                errMsg += " ไม่ระบุประเภทผู้ถือหุ้น "
            End If

            If IsDate(OperateDateTextBox.Text) = False Then
                err = True
                errMsg += " วันที่ดำเนินการไม่ถูกต้อง "
            Else
                If Year(OperateDateTextBox.Text) < 2400 Then
                    err = True
                    errMsg += " วันที่ดำเนินการต้องเป็น พ.ศ. "
                End If
            End If

        End If
        If IsNumeric(ExperienceTextBox.Text) = False Then
            err = True
            errMsg += " ระบุประสบการณ์ไม่ถูกต้อง "
        End If

       

        If err = True Then
            '  MsgBox(err)
            runScirpt("showErrorDialog('" & errMsg & "');")
            Exit Sub
        End If



        'declare connection
        Dim conn As SqlConnection = Nothing
        Dim sqlCmd As New SqlCommand()
        Dim sql As String = Nothing
        'Try
        conn = ConnectionUtil.getSqlConnectionFromWebConfig()

        sqlCmd.Connection = conn
        sqlCmd.Transaction = sqlCmd.Connection.BeginTransaction()
        If action = "Insert" Then
            sqlCmd.CommandText = "[SME_S].[P_SS_FINANCIAL_CUSTOMER_INSERT]"
        Else
            sqlCmd.CommandText = "[SME_S].[P_SS_FINANCIAL_CUSTOMER_UPDATE]"
        End If
        sqlCmd.CommandType = CommandType.StoredProcedure
        sqlCmd.Parameters.AddWithValue("CIF", CIFTextBox.Text)

        sqlCmd.Parameters.AddWithValue("CUSTOMER_TYPE", CustomerTypeDropDownList.Items(CustomerTypeDropDownList.SelectedIndex).Value)

        sqlCmd.Parameters.AddWithValue("NATIONALITY_LIST_ID", NationalityDropDownList.Items(NationalityDropDownList.SelectedIndex).Value)
        sqlCmd.Parameters.AddWithValue("BNATIONALITY_LIST_ID", BNationalityDropDownList.Items(BNationalityDropDownList.SelectedIndex).Value)

        If CustomerTypeDropDownList.Items(CustomerTypeDropDownList.SelectedIndex).Value = "CU01" Then ' บุคคลธรรมดา
            Dim BIRTH_DATE As Date = New Date(Year(BirthDateTextBox.Text), Month(BirthDateTextBox.Text), Day(BirthDateTextBox.Text), 0, 0, 0, cul.Calendar)
            sqlCmd.Parameters.AddWithValue("BIRTH_DATE", BIRTH_DATE)
            sqlCmd.Parameters.AddWithValue("JURISTIC_LIST_ID", System.DBNull.Value)
            sqlCmd.Parameters.AddWithValue("REGISTER_DATE", System.DBNull.Value)
            sqlCmd.Parameters.AddWithValue("SHAREHOLDER_LIST_ID", System.DBNull.Value)
            sqlCmd.Parameters.AddWithValue("OPERATE_DATE", System.DBNull.Value)

        Else  ' CU02'
            sqlCmd.Parameters.AddWithValue("BIRTH_DATE", System.DBNull.Value)
            sqlCmd.Parameters.AddWithValue("JURISTIC_LIST_ID", JuristicDropDownList.Items(JuristicDropDownList.SelectedIndex).Value)
            Dim REGISTER_DATE As Date = New Date(Year(RegisterDateTextBox.Text), Month(RegisterDateTextBox.Text), Day(RegisterDateTextBox.Text), 0, 0, 0, cul.Calendar)
            sqlCmd.Parameters.AddWithValue("REGISTER_DATE", REGISTER_DATE)
            sqlCmd.Parameters.AddWithValue("SHAREHOLDER_LIST_ID", ShareHolderDropDownList.Items(ShareHolderDropDownList.SelectedIndex).Value)
            Dim OPERATE_DATE As Date = New Date(Year(OperateDateTextBox.Text), Month(OperateDateTextBox.Text), Day(OperateDateTextBox.Text), 0, 0, 0, cul.Calendar)
            sqlCmd.Parameters.AddWithValue("OPERATE_DATE", OPERATE_DATE)
        End If

       
        sqlCmd.Parameters.AddWithValue("EXPERIENCE", CInt(ExperienceTextBox.Text))
        sqlCmd.Parameters.AddWithValue("BLACKLIST_LIST_ID", BlackListDropDownList.Items(BlackListDropDownList.SelectedIndex).Value)
        sqlCmd.Parameters.AddWithValue("NCB_LIST_ID", NCBDropDownList.Items(NCBDropDownList.SelectedIndex).Value)
        sqlCmd.Parameters.AddWithValue("NCB_CODE", NCBCodeDropDownList.Items(NCBCodeDropDownList.SelectedIndex).Value)
        sqlCmd.Parameters.AddWithValue("TDR_LIST_ID", TDRDropDownList.Items(TDRDropDownList.SelectedIndex).Value)
        sqlCmd.Parameters.AddWithValue("RATING_LIST_ID", RatingDropDownList.Items(RatingDropDownList.SelectedIndex).Value)
        sqlCmd.Parameters.AddWithValue("LEGAL_LIST_ID", LegalDropDownList.Items(LegalDropDownList.SelectedIndex).Value)
        sqlCmd.Parameters.AddWithValue("REGIS_DOC_LIST_ID", RegisDocDropDownList.Items(RegisDocDropDownList.SelectedIndex).Value)


        sqlCmd.Parameters.AddWithValue("DPD_MORE_10_30_MONTH_1_3", DPD_MORE_10_30_MONTH_1_3DropDownList.Items(DPD_MORE_10_30_MONTH_1_3DropDownList.SelectedIndex).Value)
        sqlCmd.Parameters.AddWithValue("DPD_MORE_30_60_MONTH_1_3", DPD_MORE_30_60_MONTH_1_3DropDownList.Items(DPD_MORE_30_60_MONTH_1_3DropDownList.SelectedIndex).Value)
        sqlCmd.Parameters.AddWithValue("DPD_MORE_60_90_MONTH_1_3", DPD_MORE_60_90_MONTH_1_3DropDownList.Items(DPD_MORE_60_90_MONTH_1_3DropDownList.SelectedIndex).Value)
        sqlCmd.Parameters.AddWithValue("DPD_MORE_90_MONTH_1_3", DPD_MORE_90_MONTH_1_3DropDownList.Items(DPD_MORE_90_MONTH_1_3DropDownList.SelectedIndex).Value)

        sqlCmd.Parameters.AddWithValue("DPD_MORE_10_30_MONTH_4_12", DPD_MORE_10_30_MONTH_4_12DropDownList.Items(DPD_MORE_10_30_MONTH_4_12DropDownList.SelectedIndex).Value)
        sqlCmd.Parameters.AddWithValue("DPD_MORE_30_60_MONTH_4_12", DPD_MORE_30_60_MONTH_4_12DropDownList.Items(DPD_MORE_30_60_MONTH_4_12DropDownList.SelectedIndex).Value)
        sqlCmd.Parameters.AddWithValue("DPD_MORE_60_90_MONTH_4_12", DPD_MORE_60_90_MONTH_4_12DropDownList.Items(DPD_MORE_60_90_MONTH_4_12DropDownList.SelectedIndex).Value)
        sqlCmd.Parameters.AddWithValue("DPD_MORE_90_MONTH_4_12", DPD_MORE_90_MONTH_4_12DropDownList.Items(DPD_MORE_90_MONTH_4_12DropDownList.SelectedIndex).Value)

        sqlCmd.Parameters.AddWithValue("DPD_MORE_10_30_MONTH_12_24", DPD_MORE_10_30_MONTH_12_24DropDownList.Items(DPD_MORE_10_30_MONTH_12_24DropDownList.SelectedIndex).Value)
        sqlCmd.Parameters.AddWithValue("DPD_MORE_30_60_MONTH_12_24", DPD_MORE_30_60_MONTH_12_24DropDownList.Items(DPD_MORE_30_60_MONTH_12_24DropDownList.SelectedIndex).Value)
        sqlCmd.Parameters.AddWithValue("DPD_MORE_60_90_MONTH_12_24", DPD_MORE_60_90_MONTH_12_24DropDownList.Items(DPD_MORE_60_90_MONTH_12_24DropDownList.SelectedIndex).Value)
        sqlCmd.Parameters.AddWithValue("DPD_MORE_90_MONTH_12_24", DPD_MORE_90_MONTH_12_24DropDownList.Items(DPD_MORE_90_MONTH_12_24DropDownList.SelectedIndex).Value)

        If CEOAgeTextBox.Text = "" Then
            sqlCmd.Parameters.AddWithValue("AGE_CEO", System.DBNull.Value)
        Else
            sqlCmd.Parameters.AddWithValue("AGE_CEO", CInt(CEOAgeTextBox.Text))
        End If

        If FIXED_ASSET_NO_LANDTextBox.Text = "" Then
            sqlCmd.Parameters.AddWithValue("FIXED_ASSET_NO_LAND", System.DBNull.Value)
        Else
            sqlCmd.Parameters.AddWithValue("FIXED_ASSET_NO_LAND", ToDecimal(FIXED_ASSET_NO_LANDTextBox.Text))
        End If

        If CHECK_NCB_6MONTHTextBox.Text = "" Then
            sqlCmd.Parameters.AddWithValue("CHECK_NCB_6MONTH", System.DBNull.Value)
        Else
            sqlCmd.Parameters.AddWithValue("CHECK_NCB_6MONTH", ToDecimal(CHECK_NCB_6MONTHTextBox.Text))
        End If
       
        sqlCmd.Parameters.AddWithValue("DSS_OPERATE_STATUS", DSS_OPERATE_STATUSDropDownList.Items(DSS_OPERATE_STATUSDropDownList.SelectedIndex).Value)
        sqlCmd.Parameters.AddWithValue("POSITIVE_EQUITY", POSITIVE_EQUITYDropDownList.Items(POSITIVE_EQUITYDropDownList.SelectedIndex).Value)
        sqlCmd.Parameters.AddWithValue("PROFIT_LAST_2YEARS", PROFIT_LAST_2YEARSDropDownList.Items(PROFIT_LAST_2YEARSDropDownList.SelectedIndex).Value)
        sqlCmd.Parameters.AddWithValue("INSIGNIFICANT_LOST", INSIGNIFICANT_LOSTDropDownList.Items(INSIGNIFICANT_LOSTDropDownList.SelectedIndex).Value)

        If CHEQUE_RETURN_6MONTHTextBox.Text = "" Then
            sqlCmd.Parameters.AddWithValue("CHEQUE_RETURN_6MONTH", System.DBNull.Value)
        Else
            sqlCmd.Parameters.AddWithValue("CHEQUE_RETURN_6MONTH", CInt(CHEQUE_RETURN_6MONTHTextBox.Text))
        End If

        If TRADING_CHEQUE_RETURN_VAL_6MONTHTextBox.Text = "" Then
            sqlCmd.Parameters.AddWithValue("TRADING_CHEQUE_RETURN_VAL_6MONTH", System.DBNull.Value)
        Else
            sqlCmd.Parameters.AddWithValue("TRADING_CHEQUE_RETURN_VAL_6MONTH", ToDecimal(TRADING_CHEQUE_RETURN_VAL_6MONTHTextBox.Text))
        End If

        If OD_UTILIZATION_PERCENTTextBox.Text = "" Then
            sqlCmd.Parameters.AddWithValue("OD_UTILIZATION_PERCENT", System.DBNull.Value)
        Else
            sqlCmd.Parameters.AddWithValue("OD_UTILIZATION_PERCENT", CInt(OD_UTILIZATION_PERCENTTextBox.Text))
        End If

        If OD_SWING_PERCENTTextBox.Text = "" Then
            sqlCmd.Parameters.AddWithValue("OD_SWING_PERCENT", System.DBNull.Value)
        Else
            sqlCmd.Parameters.AddWithValue("OD_SWING_PERCENT", CInt(OD_SWING_PERCENTTextBox.Text))
        End If
        If OD_OVER_NUMBERTextBox.Text = "" Then
            sqlCmd.Parameters.AddWithValue("OD_OVER_NUMBER", System.DBNull.Value)
        Else
            sqlCmd.Parameters.AddWithValue("OD_OVER_NUMBER", CInt(OD_OVER_NUMBERTextBox.Text))
        End If


      

        ',@OD_OVER_NUMBER int

        sqlCmd.Parameters.AddWithValue("SMES_ID", SMES_IDTextBox.Text)
        If action = "Insert" Then
            sqlCmd.Parameters.AddWithValue("CREATE_USER", USERTextBox.Text)
        Else
            sqlCmd.Parameters.AddWithValue("UPDATE_USER", USERTextBox.Text)
        End If
        sqlCmd.ExecuteNonQuery()
        sqlCmd.Transaction.Commit()
        'Catch ex As Exception
        'sqlCmd.Transaction.Rollback()
        'runScirpt("alert('Cannot save data. \n " & ex.Message.ToString.Replace("'", "") & "');")
        'Exit Sub
        'Finally
        If (conn.State = ConnectionState.Open) Then
            conn.Close()
        End If
        conn = Nothing

        Dim jscript As String = ""
        'If action = "Insert" Then
        '    jscript = jscript & "changeMain('Insert Complete.',""" & SMES_IDTextBox.Text & """);"
        'Else
        '    jscript = jscript & "changeMain('Update Complete.',""" & SMES_IDTextBox.Text & """);"
        'End If

        setShow()
        If action = "Insert" Then
            InsertButton.Visible = False
            UpdateButton.Visible = True
            jscript = jscript & "changeMenu(""" & SMES_IDTextBox.Text & """);"
            jscript = jscript & "showDialog('Insert Complete');"
            'jscript = jscript & "alert('Insert Complete');"
        Else
            jscript = jscript & "changeMenu(""" & SMES_IDTextBox.Text & """);"
            jscript = jscript & "showDialog('Update Complete');"
            'jscript = jscript & "alert('Insert Complete');"
        End If
        runScirpt(jscript)  ' เรียก javascript 
        ' End Try

    End Sub
    Protected Sub InsertButton_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles InsertButton.Click
        SaveData("Insert")
    End Sub
    Protected Sub UpdateButton_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles UpdateButton.Click
        SaveData("Update")
    End Sub

    Protected Sub CustomerSearchImageButton_Click(ByVal sender As Object, ByVal e As System.Web.UI.ImageClickEventArgs) Handles CustomerSearchImageButton.Click
        SearchCif()
    End Sub
    <System.Web.Script.Services.ScriptMethod()> _
<System.Web.Services.WebMethod()> _
    Public Shared Function CIFSearch(ByVal CIF As String) As String

        Dim dalCus As New CustomerInfoDAL
        Dim objCus As New CustomerInfo
        objCus.CIF = CIF
        objCus = dalCus.getCustomerInfoByCIF(objCus)

        Dim strJson As String = ""
        If objCus.Cifname <> "" Then
            strJson = " { 'cif':'" & objCus.Cifname.Replace("'", "") & "'}"
        Else
            strJson = " {}"
        End If
        Return strJson

    End Function


    Protected Sub AddDebtButton_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles AddDebtButton.Click

        Dim errMsg As String = ""
        Dim err = False
        If DebtDropDownList.Items(DebtDropDownList.SelectedIndex).Value = "" Then
            err = True
            errMsg += " ระบุประเภทสินเชื่อ "
        End If
        If ValueTextBox.Text = "" Then
            err = True
            errMsg += " กรุณาระบุวงเงิน "
        End If
        If GUARANTEE_VALUETextBox.Text = "" Then
            err = True
            errMsg += " กรุณาระบุวงเงินค้ำประกัน "
        End If
        If IsDate(UseValueDateTextBox.Text) = False Then
            err = True
            errMsg += " กรุณาระบุวันที่ใช้วงเงิน "
        End If


        If err = True Then
            '  MsgBox(err)
            runScirpt("showErrorDialog('" & errMsg & "');")
            Exit Sub
        End If

        Dim conn As SqlConnection = Nothing
        Dim sqlCmd As New SqlCommand()
        Dim sql As String = Nothing

        conn = ConnectionUtil.getSqlConnectionFromWebConfig()
        sqlCmd.Connection = conn
        sqlCmd.CommandType = CommandType.StoredProcedure
        sqlCmd.CommandText = "[SME_S].[P_SS_FINANCIAL_CUSTOMER_DEBT_INSERT]"

        sqlCmd.Parameters.AddWithValue("SMES_ID", SMES_IDTextBox.Text)
        sqlCmd.Parameters.AddWithValue("CREATE_USER", USERTextBox.Text)
        sqlCmd.Parameters.AddWithValue("CIF", CIFTextBox.Text)
        sqlCmd.Parameters.AddWithValue("DEBT_ID", DebtDropDownList.Items(DebtDropDownList.SelectedIndex).Value)
        sqlCmd.Parameters.AddWithValue("VALUE", ToDecimal(ValueTextBox.Text))
        sqlCmd.Parameters.AddWithValue("GUARANTEE_VALUE", ToDecimal(GUARANTEE_VALUETextBox.Text))
        Dim USE_VALUE_DATE As Date = New Date(Year(UseValueDateTextBox.Text), Month(UseValueDateTextBox.Text), Day(UseValueDateTextBox.Text), 0, 0, 0, cul.Calendar)
        sqlCmd.Parameters.AddWithValue("USE_VALUE_DATE", USE_VALUE_DATE)


        sqlCmd.ExecuteNonQuery()

        sqlCmd.Dispose()
        sqlCmd = Nothing
        conn.Close()
        conn = Nothing

        showCustomerDebt()
        DebtDropDownList.SelectedIndex = 0
        ValueTextBox.Text = ""
        GUARANTEE_VALUETextBox.Text = ""
        UseValueDateTextBox.Text = ""

    End Sub
    Sub showCustomerDebt()


        Dim conn As SqlConnection = Nothing
        'Try
        conn = ConnectionUtil.getSqlConnectionFromWebConfig()

        Dim Sql As String = "[SME_S].[P_SS_FINANCIAL_CUSTOMER_DEBT_SELECT]"
        Dim sqlCmd As New SqlCommand(Sql, conn)
        sqlCmd.CommandType = CommandType.StoredProcedure
        sqlCmd.Prepare()
        sqlCmd.Parameters.AddWithValue("SMES_ID", SMES_IDTextBox.Text)
        sqlCmd.Parameters.AddWithValue("CIF", CIFTextBox.Text)

        Dim reader As SqlDataReader = sqlCmd.ExecuteReader()

        'If reader.HasRows Then

        DebtGridView.DataSource = reader
        DebtGridView.DataBind()

        'End If


        reader.Close()
        sqlCmd.Dispose()
        conn.Close()

        sqlCmd = Nothing
        conn = Nothing
        'Catch ex As Exception
        'runScirpt("alert('" & ex.ToString.Replace("'", "") & "');")
        ' Finally
        ' End Try

    End Sub

    Sub DebtGridDeleteCommand(ByVal sender As Object, ByVal e As GridViewDeleteEventArgs)
        'MsgBox(e.RowIndex)
        DebtGridView.EditIndex = e.RowIndex
        Dim DebtCustomerID As HiddenField = DebtGridView.Rows(DebtGridView.EditIndex).FindControl("HdCustomerDebtID")
        'MsgBox(DebtCustomerID.Value)

        Dim conn As SqlConnection = Nothing
        Dim sqlCmd As New SqlCommand()
        Dim sql As String = Nothing

        conn = ConnectionUtil.getSqlConnectionFromWebConfig()
        sqlCmd.Connection = conn
        sqlCmd.CommandType = CommandType.StoredProcedure
        sqlCmd.CommandText = "[SME_S].[P_SS_FINANCIAL_CUSTOMER_DEBT_DELETE]"

        sqlCmd.Parameters.AddWithValue("CUSTOMER_DEBT_ID", DebtCustomerID.Value)

        sqlCmd.ExecuteNonQuery()

        sqlCmd.Dispose()
        sqlCmd = Nothing
        conn.Close()
        conn = Nothing

        showCustomerDebt()

    End Sub

    Protected Sub DebtGridView_RowDataBound(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewRowEventArgs) Handles DebtGridView.RowDataBound
        If e.Row.RowType = DataControlRowType.DataRow Then
            e.Row.Attributes.Add("OnMouseOver", "this.style.backgroundColor = 'lightblue';")
            If e.Row.RowState = DataControlRowState.Alternate Then
                Dim alColor As String = System.Drawing.ColorTranslator.ToHtml(DebtGridView.AlternatingRowStyle.BackColor)
                e.Row.Attributes.Add("OnMouseOut", "this.style.backgroundColor ='" & alColor & "'")
            Else
                Dim bkColor As String = System.Drawing.ColorTranslator.ToHtml(DebtGridView.RowStyle.BackColor)
                e.Row.Attributes.Add("OnMouseOut", "this.style.backgroundColor ='" & bkColor & "'")
            End If
        End If
    End Sub
End Class
