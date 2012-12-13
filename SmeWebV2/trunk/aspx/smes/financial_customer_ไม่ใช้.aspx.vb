Imports System.Data
Imports System.Data.SqlClient
Imports System.Globalization
Partial Class smes_financial_customer
    Inherits System.Web.UI.Page
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
        Buss += "window.open('BusinessType.aspx?returnIdTarget=" & BusinessCodeTextBox.ClientID & "&returnDetailTarget=" & BusinessNameTextBox.ClientID
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
    Sub ShowData(ByVal smes_id As Integer)
        Dim conn As SqlConnection = Nothing
        'Try
        conn = ConnectionUtil.getSqlConnectionFromWebConfig()
        Dim Sql As String = "SME_S.P_SS_FINANCIAL_MAIN_SELECT"
        Dim sqlCmd As New SqlCommand(Sql, conn)
        sqlCmd.CommandType = CommandType.StoredProcedure
        sqlCmd.Prepare()
        Dim SMES_ID_PARM As SqlParameter = sqlCmd.Parameters.AddWithValue("@SMES_ID", Request.QueryString("SMES_ID"))

        Dim reader As SqlDataReader = sqlCmd.ExecuteReader()

        While reader.Read()
            '   Console.WriteLine(String.Format("{0}, {1}", reader(0), reader(1)))
            If IsDBNull(reader("SMES_ID")) = False Then SMES_IDTextBox.Text = reader("SMES_ID").ToString()
            If IsDBNull(reader("REF_ID")) = False Then Session("REF_ID") = reader("REF_ID").ToString()
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

        reader.Close()
        sqlCmd.Dispose()

        'Catch ex As Exception
        '    alert(ex.ToString)
        'Finally
        'End Try

    End Sub
    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        SMES_IDTextBox.Text = Request.QueryString("SMES_ID")
        If Not Page.IsPostBack Then
            bindCustomerGrid()
            showCustomerGrid()
            ' MsgBox(Request.QueryString("SMES_ID"))
            If SMES_IDTextBox.Text <> "" Then
                ShowData(Request.QueryString("SMES_ID"))
                InsertButton.Visible = False
                UpdateButton.Visible = True
            Else
                InsertButton.Visible = True
                UpdateButton.Visible = False
            End If
        End If
    End Sub

    Protected Sub Button1_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles InsertButton.Click
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
            sqlCmd.CommandText = "[SME_S].[P_SS_FINANCIAL_MAIN_INSERT]"
            sqlCmd.CommandType = CommandType.StoredProcedure


            If REF_IDTextBox.Text = "" Then
                sqlCmd.Parameters.AddWithValue("REF_ID", System.DBNull.Value)
            Else
                sqlCmd.Parameters.AddWithValue("REF_ID", REF_IDTextBox.Text)
            End If


            If USERTextBox.Text = "" Then
                sqlCmd.Parameters.AddWithValue("CREATE_USER", System.DBNull.Value)
            Else
                sqlCmd.Parameters.AddWithValue("CREATE_USER", USERTextBox.Text)
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
            runScirpt("alert(" & ex.Message & ");")
            Exit Sub
        Finally
            If (conn.State = ConnectionState.Open) Then
                conn.Close()
            End If
            conn = Nothing
            Dim jscript As String
            jscript = "alert('Insert Complete');"
            jscript = jscript & "changeMenu(""" & NEW_SMES_ID & """);"
            jscript = jscript & "changeURLtoRM(""" & NEW_SMES_ID & """);"
            runScirpt(jscript)  ' เรียก javascript 

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
    
    Protected Sub runScirpt(ByVal str As String)
        Page.ClientScript.RegisterStartupScript(Me.GetType(), "", str, True)
    End Sub

    Protected Sub UpdateButton_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles UpdateButton.Click
        UpdateData()
    End Sub
    Sub UpdateData()
        Dim SMES_ID As String = SMES_IDTextBox.Text
        'declare connection
        'declare connection
        Dim conn As SqlConnection = Nothing
        Dim sqlCmd As New SqlCommand()
        Dim sql As String = Nothing
        'Try
        conn = ConnectionUtil.getSqlConnectionFromWebConfig()

        sqlCmd.Connection = conn
        sqlCmd.Transaction = sqlCmd.Connection.BeginTransaction()
        sqlCmd.CommandText = "[SME_S].[P_SS_FINANCIAL_MAIN_UPDATE]"
        sqlCmd.CommandType = CommandType.StoredProcedure

        sqlCmd.Parameters.AddWithValue("SMES_ID", SMES_ID)


        If REF_IDTextBox.Text = "" Then
            sqlCmd.Parameters.AddWithValue("REF_ID", System.DBNull.Value)
        Else
            sqlCmd.Parameters.AddWithValue("REF_ID", REF_IDTextBox.Text)
        End If

        If USERTextBox.Text = "" Then
            sqlCmd.Parameters.AddWithValue("UPDATE_USER", System.DBNull.Value)
        Else
            sqlCmd.Parameters.AddWithValue("UPDATE_USER", USERTextBox.Text)
        End If

        If SMES_IDTextBox.Text = "" Then
            sqlCmd.Parameters.AddWithValue("SMES_STATUS", System.DBNull.Value)
        Else
            sqlCmd.Parameters.AddWithValue("SMES_STATUS", 1)
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
        Dim jscript As String
        jscript = "alert('Update Complete');"
        jscript = jscript & "changeCustomer(""" & SMES_ID & """);"
        runScirpt(jscript)  ' เรียก javascript 

        'End Try

    End Sub
End Class
