Imports Microsoft.VisualBasic
Imports System.Data
Imports System.Data.SqlClient
Imports System.Diagnostics
Imports System.Collections.Generic
Imports System.Globalization
Partial Class aspx_annals_AnnalsCreditFloodBot
    Inherits System.Web.UI.Page
    Shared ModeInfo As String
    Protected Sub SearchCif(ByVal templateType As String)

        Dim CIFTextBox As TextBox
        Dim NameLabel As Label


        CIFTextBox = CustomersGridView.Rows(CustomersGridView.EditIndex).FindControl("TextBoxCIF")
        NameLabel = CustomersGridView.Rows(CustomersGridView.EditIndex).FindControl("LabelCIFName")


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


        End If


    End Sub

    Protected Sub btnAddNew_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnAddNew.Click
        Dim id = Request.QueryString("ID")
        If id = "" Then
            alert("ไม่พบข้อมูล ID CA กรุณาเข้าระบบใหม่ ")
            Exit Sub

        End If

        ' If btnAddNew.Text = "เพิ่มรายชื่อ" Then
        ' กำหนดให้แก้ไขที่แถวแรก
        CustomersGridView.EditIndex = 0


        ' bind grid โดยส่งแถวแรกมีค่าว่างมาด้วย

        Dim conn As SqlConnection = Nothing
        'Try
        conn = ConnectionUtil.getSqlConnectionFromWebConfig()
        Dim Sql As String = "ANNALS_CREDIT_FLOOD_BOT_SELECT_NEW "
        Dim sqlCmd As New SqlCommand(Sql, conn)
        sqlCmd.CommandType = CommandType.StoredProcedure
        sqlCmd.Prepare()
        sqlCmd.Parameters.AddWithValue("@ID", id)
        'sqlCmd.Parameters.AddWithValue("@SMES_TYPE", smes_type)
        Dim reader As SqlDataReader = sqlCmd.ExecuteReader()
        CustomersGridView.DataSource = reader
        CustomersGridView.DataBind()

        reader.Close()
        conn.Close()


        Session("mode") = "add"
        bindGridCustomer()



    End Sub
    Sub showCustomerGrid()
        Dim id As String = Request.QueryString("ID")
        If id = "" Then
            id = " "
        End If
        Dim conn As SqlConnection = Nothing
        'Try
        conn = ConnectionUtil.getSqlConnectionFromWebConfig()
        Dim Sql As String = "ANNALS_CREDIT_FLOOD_BOT_SELECT"
        Dim sqlCmd As New SqlCommand(Sql, conn)
        sqlCmd.CommandType = CommandType.StoredProcedure
        sqlCmd.Prepare()
        sqlCmd.Parameters.AddWithValue("@ID", id)
        Dim reader As SqlDataReader = sqlCmd.ExecuteReader()
        CustomersGridView.DataSource = reader
        CustomersGridView.DataBind()

        reader.Close()
        conn.Close()


    End Sub

    Sub CustomerGridEditCommand(ByVal sender As Object, ByVal e As GridViewEditEventArgs)
        CustomersGridView.EditIndex = e.NewEditIndex

        showCustomerGrid()


        bindGridCustomer()
        Dim LabelCUSTOMER_NEW_OLD As Label = CustomersGridView.Rows(CustomersGridView.EditIndex).FindControl("LabelCUSTOMER_NEW_OLD")
        If LabelCUSTOMER_NEW_OLD.Text = "" Then
            Session("mode") = "add"
        Else  ' กรณีเป็น YES หรือ NO
            Session("mode") = "update"
        End If

        'MsgBox(CustomersGridView.EditIndex)
        'If btnAddNew.Text = "ยกเลิกการเพิ่ม" Then
        '    CustomersGridView.EditIndex = CustomersGridView.EditIndex - 1
        'End If
        'MsgBox(CustomersGridView.EditIndex)

    End Sub
    Sub bindGridCustomer()

        ' ***** begin create control        
        ' Dim CIFTextBox As TextBox = CustomersGridView.Rows(CustomersGridView.EditIndex).FindControl("TextBoxCIF")

        Dim LabelCIF As Label = CustomersGridView.Rows(CustomersGridView.EditIndex).FindControl("LabelCIF")

        If Session("mode") = "update" Then
            ' LabelCIF.Enabled = False
            Dim BtnDelete As ImageButton = CustomersGridView.Rows(CustomersGridView.EditIndex).Cells(0).FindControl("BtnDelete")
            BtnDelete.Attributes.Add("onclick", "return confirm_delete();")
        Else ' in case of add
            ' LabelCIF.Enabled = True
        End If

        Dim ImageButtonSearchSubDistrict As ImageButton = CustomersGridView.Rows(CustomersGridView.EditIndex).FindControl("ImageButtonSearchSubDistrict")

        Dim str As String = "window.open('../common/ThProvince.aspx?control1=TextBoxSUB_DISTRICT_ID&control2=TextBoxLOCATION_NAME"
        ImageButtonSearchSubDistrict.Attributes.Add("onclick", str & "','popup', 'width=600, height=80,scrollbars=yes');return false;")
      
        'Dim TextBoxREMARK As TextBox = CustomersGridView.Rows(CustomersGridView.EditIndex).FindControl("TextBoxREMARK")
        'Dim TextBoxSUB_DISTRICT_ID As TextBox = CustomersGridView.Rows(CustomersGridView.EditIndex).FindControl("TextBoxSUB_DISTRICT_ID")
        'Dim TextBoxGUARANTEE_VALUE As TextBox = CustomersGridView.Rows(CustomersGridView.EditIndex).FindControl("TextBoxGUARANTEE_VALUE")
        'Dim TextBoxVALUE As TextBox = CustomersGridView.Rows(CustomersGridView.EditIndex).FindControl("TextBoxVALUE")

        'Dim DropDownListDAMAGE_TYPE_ID As DropDownList = CustomersGridView.Rows(CustomersGridView.EditIndex).FindControl("DropDownListDAMAGE_TYPE_ID")
        'Dim DropDownListIS_GUARANTEE As DropDownList = CustomersGridView.Rows(CustomersGridView.EditIndex).FindControl("DropDownListIS_GUARANTEE")
        'Dim DropDownListDECB_RD_ID As DropDownList = CustomersGridView.Rows(CustomersGridView.EditIndex).FindControl("DropDownListDECB_RD_ID")
        'Dim DropDownListLIMIT_NEW_OLD As DropDownList = CustomersGridView.Rows(CustomersGridView.EditIndex).FindControl("DropDownListLIMIT_NEW_OLD")
        'Dim DropDownListCUSTOMER_NEW_OLD As DropDownList = CustomersGridView.Rows(CustomersGridView.EditIndex).FindControl("DropDownListCUSTOMER_NEW_OLD")

        'If CIFTextBox.Text = "0" Then CIFTextBox.Text = ""
        'If TextBoxVALUE.Text = "0" Then TextBoxVALUE.Text = ""
        'If TextBoxGUARANTEE_VALUE.Text = "0" Then TextBoxGUARANTEE_VALUE.Text = ""
        'If TextBoxREMARK.Text = "0" Then TextBoxREMARK.Text = ""

        'DropDownListLIMIT_NEW_OLD.DataSource = SqlDataSourceOLD_NEW
        'DropDownListLIMIT_NEW_OLD.DataTextField = "name"
        'DropDownListLIMIT_NEW_OLD.DataValueField = "id"
        'DropDownListLIMIT_NEW_OLD.DataBind()
        'DropDownListLIMIT_NEW_OLD.Items.Insert(0, "...โปรดเลือก...")

        'DropDownListCUSTOMER_NEW_OLD.DataSource = SqlDataSourceOLD_NEW
        'DropDownListCUSTOMER_NEW_OLD.DataTextField = "name"
        'DropDownListCUSTOMER_NEW_OLD.DataValueField = "id"
        'DropDownListCUSTOMER_NEW_OLD.DataBind()
        'DropDownListCUSTOMER_NEW_OLD.Items.Insert(0, "...โปรดเลือก...")

        'DropDownListIS_GUARANTEE.DataSource = SqlDataSourceIS_GUARANTEE
        'DropDownListIS_GUARANTEE.DataTextField = "name"
        'DropDownListIS_GUARANTEE.DataValueField = "id"
        'DropDownListIS_GUARANTEE.DataBind()
        'DropDownListIS_GUARANTEE.Items.Insert(0, "...โปรดเลือก...")

        'DropDownListDAMAGE_TYPE_ID.DataSource = SqlDataSourceDAMAGE_TYPE_ID
        'DropDownListDAMAGE_TYPE_ID.DataTextField = "name"
        'DropDownListDAMAGE_TYPE_ID.DataValueField = "id"
        'DropDownListDAMAGE_TYPE_ID.DataBind()
        'DropDownListDAMAGE_TYPE_ID.Items.Insert(0, "...โปรดเลือก...")

        'DropDownListDECB_RD_ID.DataSource = SqlDataSourceGL
        'DropDownListDECB_RD_ID.DataTextField = "DECB_RD"
        'DropDownListDECB_RD_ID.DataValueField = "DECB_RD_ID"
        'DropDownListDECB_RD_ID.DataBind()
        'DropDownListDECB_RD_ID.Items.Insert(0, "...โปรดเลือก...")

        '* end create control

        ' begin set data to control

        'Dim conn As SqlConnection = Nothing
        'Try
        '    conn = ConnectionUtil.getSqlConnectionFromWebConfig()
        '    Dim Sql As String = "ANNALS_CREDIT_FLOOD_BOT_SELECT"
        '    Dim sqlCmd As New SqlCommand(Sql, conn)
        '    sqlCmd.CommandType = CommandType.StoredProcedure
        '    sqlCmd.Prepare()
        '    Dim ID As SqlParameter = sqlCmd.Parameters.AddWithValue("@ID", Request.QueryString("ID"))
        '    Dim CIF As SqlParameter = sqlCmd.Parameters.AddWithValue("@CIF", CIFTextBox.Text)

        '    Dim reader As SqlDataReader = sqlCmd.ExecuteReader()
        '    If reader.HasRows Then
        '        While reader.Read()

        '            If IsDBNull(reader("IMPACT_TYPE")) = False Then
        '                DropDownListIMPACT_TYPE.SelectedIndex = DropDownListIMPACT_TYPE.Items.IndexOf(DropDownListIMPACT_TYPE.Items.FindByValue(reader("IMPACT_TYPE")))
        '            End If
        '            If IsDBNull(reader("OPERATION")) = False Then
        '                DropDownListOPERATION.SelectedIndex = DropDownListOPERATION.Items.IndexOf(DropDownListOPERATION.Items.FindByValue(reader("OPERATION")))
        '            End If
        '            If IsDBNull(reader("PROGRAM")) = False Then
        '                DropDownListPROGRAM.SelectedIndex = DropDownListPROGRAM.Items.IndexOf(DropDownListPROGRAM.Items.FindByValue(reader("PROGRAM")))
        '            End If
        '            If IsDBNull(reader("IMPACT")) = False Then
        '                DropDownListIMPACT.SelectedIndex = DropDownListIMPACT.Items.IndexOf(DropDownListIMPACT.Items.FindByValue(reader("IMPACT")))
        '            End If
        '            If IsDBNull(reader("IMPACT_DATE")) = False Then
        '                IMPACT_DATETextBox.Text = reader("IMPACT_DATE")
        '            End If

        '        End While
        '        UpdateButton.Visible = True
        '        AddButton.Visible = False
        '    Else
        '        AddButton.Visible = True
        '        UpdateButton.Visible = False
        '    End If


        'Catch ex As Exception
        '    msg(ex.Message.ToString)
        '    Exit Sub
        'Finally
        '    If (conn.State = ConnectionState.Open) Then
        '        conn.Close()
        '    End If
        '    conn = Nothing
        'End Try


        ' end  set data to control


    End Sub
    Sub CustomerGridCancelCommand(ByVal sender As Object, ByVal e As GridViewCancelEditEventArgs)
        CustomersGridView.EditIndex = -1
        showCustomerGrid()
    End Sub
    Protected Sub CustomerGridRowCommand(ByVal sender As Object, ByVal e As GridViewCommandEventArgs)
        'If e.CommandName = "Insert" Then ' 55

        '    Dim CIFTextBox As TextBox = CustomersGridView.Rows(CustomersGridView.EditIndex).FindControl("TextBoxCIF")
        '    Dim NameLabel As Label = CustomersGridView.Rows(CustomersGridView.EditIndex).FindControl("LabelCIFName")

        '    If CIFTextBox.Text = "" Then
        '        CIFTextBox.BackColor = Drawing.Color.Red
        '        Exit Sub
        '    Else
        '        CIFTextBox.BackColor = Drawing.Color.White
        '    End If
        '    If NameLabel.Text = "" Or NameLabel.Text.Contains("กรุณาค้นหา") = True Then
        '        CIFTextBox.BackColor = Drawing.Color.Red
        '        Exit Sub
        '    End If
        '    MsgBox(" insert")
        '    CustomersGridView.EditIndex = -1
        '    showCustomerGrid()
        'End If

        If e.CommandName = "SearchCIFInsert" Then
            SearchCif("insert")
        End If
        If e.CommandName = "SearchCIFEdit" Then
            SearchCif("edit")
        End If

    End Sub

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Page.IsPostBack = False Then
            showCustomerInfoGrid()
            showCustomerGrid()
        End If
    End Sub

    Function createDropDown(ByVal record_type As String) As DropDownList
        Dim conn As SqlConnection = Nothing

        conn = ConnectionUtil.getSqlConnectionFromWebConfig()
        Dim Sql As String = "ANNALS_CREDIT_FLOOD_TABLE_SELECT"
        Dim sqlCmd As New SqlCommand(Sql, conn)
        sqlCmd.CommandType = CommandType.StoredProcedure
        sqlCmd.Prepare()
        sqlCmd.Parameters.AddWithValue("@RECORD_TYPE", record_type)
        Dim reader As SqlDataReader = sqlCmd.ExecuteReader()

        Dim newDDL As New DropDownList
        newDDL.DataSource = reader
        newDDL.DataTextField = "name"
        newDDL.DataValueField = "id"
        newDDL.DataBind()


        reader.Close()
        conn.Close()
        Return newDDL
    End Function

    Protected Sub alert(ByVal str As String)
        'Response.Clear()
        'Response.Write("<script language=""javascript"">alert(""" & str & """)</script>")
        str = "alert(""" & str & """);"
        Page.ClientScript.RegisterStartupScript(Me.GetType(), "messagebox", str, True)

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
    Protected Sub CustomersGridView_RowDeleting(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewDeleteEventArgs) Handles CustomersGridView.RowDeleting
        Dim username = User.Identity.Name

        If username = "" Then
            alert(" ไม่สามารถบันทึก ไม่พบข้อมูล username กรุณา login ใหม่ ")
        End If

        Dim IDEN As HiddenField = CustomersGridView.Rows(CustomersGridView.EditIndex).FindControl("IDEN")

        Dim conn As SqlConnection = Nothing
        Dim sqlCmd As New SqlCommand()
        Dim sql As String = Nothing
        Try

            conn = ConnectionUtil.getSqlConnectionFromWebConfig()
            sqlCmd.Connection = conn
            sqlCmd.Transaction = sqlCmd.Connection.BeginTransaction()
            sqlCmd.CommandText = "ANNALS_CREDIT_FLOOD_BOT_UPDATE_DEL_FLAG"
            sqlCmd.CommandType = CommandType.StoredProcedure

            sqlCmd.Parameters.AddWithValue("IDEN", IDEN.Value)
            sqlCmd.Parameters.AddWithValue("UPDATE_USER", username)

            sqlCmd.ExecuteNonQuery()
            sqlCmd.Transaction.Commit()
        Catch ex As Exception
            sqlCmd.Transaction.Rollback()
            alert(ex.Message.ToString)
            Exit Sub
        Finally
            If (conn.State = ConnectionState.Open) Then
                conn.Close()
            End If
            conn = Nothing
            alert("ลบข้อมูลเรียบร้อย")
            Session("mode") = ""

            CustomersGridView.EditIndex = -1
            showCustomerGrid()


        End Try

    End Sub

    Protected Sub CustomersGridView_RowUpdating(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewUpdateEventArgs) Handles CustomersGridView.RowUpdating
        Dim ID = Request.QueryString("ID")
        Dim mode As String = Session("mode")
        Dim username = User.Identity.Name

        ' MsgBox(ID & ";" & username & ";" & mode)
        If ID = "" Then
            alert(" ไม่สามารถบันทึก ไม่พบข้อมูล ID CA กรุณา login ใหม่ ")
            Exit Sub
        ElseIf mode = "" Then
            alert(" ไม่สามารถบันทึก หมดเวลา กรุณา login ใหม่ ")
            Exit Sub
        ElseIf username = "" Then
            alert(" ไม่สามารถบันทึก ไม่พบข้อมูล username กรุณา login ใหม่ ")
        End If

        Dim IDEN As HiddenField = CustomersGridView.Rows(CustomersGridView.EditIndex).FindControl("IDEN")
        Dim PROJECT_CODE As HiddenField = CustomersGridView.Rows(CustomersGridView.EditIndex).FindControl("PROJECT_CODE")


        'Dim CIFTextBox As TextBox = CustomersGridView.Rows(CustomersGridView.EditIndex).FindControl("TextBoxCIF")
        Dim LabelCIF As Label = CustomersGridView.Rows(CustomersGridView.EditIndex).FindControl("LabelCIF")


        Dim NameLabel As Label = CustomersGridView.Rows(CustomersGridView.EditIndex).FindControl("LabelCIFName")

        Dim TextBoxREMARK As TextBox = CustomersGridView.Rows(CustomersGridView.EditIndex).FindControl("TextBoxREMARK")
        Dim TextBoxSUB_DISTRICT_ID As TextBox = CustomersGridView.Rows(CustomersGridView.EditIndex).FindControl("TextBoxSUB_DISTRICT_ID")
        Dim TextBoxGUARANTEE_VALUE As TextBox = CustomersGridView.Rows(CustomersGridView.EditIndex).FindControl("TextBoxGUARANTEE_VALUE")
        Dim TextBoxVALUE As TextBox = CustomersGridView.Rows(CustomersGridView.EditIndex).FindControl("TextBoxVALUE")

        Dim DropDownListDAMAGE_TYPE_ID As DropDownList = CustomersGridView.Rows(CustomersGridView.EditIndex).FindControl("DropDownListDAMAGE_TYPE_ID")

        Dim DropDownListIS_GUARANTEE As DropDownList = CustomersGridView.Rows(CustomersGridView.EditIndex).FindControl("DropDownListIS_GUARANTEE")
        ' Dim DropDownListDECB_RD_ID As DropDownList = CustomersGridView.Rows(CustomersGridView.EditIndex).FindControl("DropDownListDECB_RD_ID")
        Dim LabelProductCode As Label = CustomersGridView.Rows(CustomersGridView.EditIndex).FindControl("LabelProductCode")

        Dim DropDownListLIMIT_NEW_OLD As DropDownList = CustomersGridView.Rows(CustomersGridView.EditIndex).FindControl("DropDownListLIMIT_NEW_OLD")
        Dim DropDownListCUSTOMER_NEW_OLD As DropDownList = CustomersGridView.Rows(CustomersGridView.EditIndex).FindControl("DropDownListCUSTOMER_NEW_OLD")



        If DropDownListCUSTOMER_NEW_OLD.SelectedValue = "" Then
            alert("กรุณาระบุลูกค้าใหม่ / เดิม ")
            Exit Sub
        End If
        If DropDownListLIMIT_NEW_OLD.SelectedValue = "" Then
            alert("กรุณาระบุวงเงินใหม่ / เดิม ")
            Exit Sub
        End If


        If TextBoxVALUE.Text = "" Then
            alert("กรุณาระบุจำนวนวงเงิน")
            Exit Sub
        End If

        If DropDownListIS_GUARANTEE.SelectedValue = "" Then
            alert("กรุณาระบุ บสย ค้ำประกันหรือไม่ ")
            Exit Sub
        End If

        If TextBoxGUARANTEE_VALUE.Text = "" Then
            alert("กรุณาระบุวงเงินค้ำประกัน")
            Exit Sub
      
        End If

        If DropDownListDAMAGE_TYPE_ID.SelectedValue = "" Then
            alert("กรุณาระบุ ประเภทความเสียหาย ")
            Exit Sub
        End If

        If TextBoxSUB_DISTRICT_ID.Text <> "" Then
            If TextBoxSUB_DISTRICT_ID.Text.Length < 6 Then
                alert("กรุณาระบุ รหัสพื้นที่ความเสียหายด้วยหมายเลข 6 หลัก")
                Exit Sub
            End If
        End If

        Dim conn As SqlConnection = Nothing
        Dim sqlCmd As New SqlCommand()
        Dim sql As String = Nothing
        ' Try
        If IDEN.Value = "" Then
            mode = "add"
        Else
            mode = "update"
        End If
        conn = ConnectionUtil.getSqlConnectionFromWebConfig()
        sqlCmd.Connection = conn
        sqlCmd.Transaction = sqlCmd.Connection.BeginTransaction()
        If mode = "add" Then
            sqlCmd.CommandText = "ANNALS_CREDIT_FLOOD_BOT_INSERT"
        ElseIf mode = "update" Then
            sqlCmd.CommandText = "ANNALS_CREDIT_FLOOD_BOT_UPDATE"
        Else
            alert("หมดเวลาบันทึกข้อมูล กรุณา login ใหม่")
            Exit Sub
        End If


        sqlCmd.CommandType = CommandType.StoredProcedure
        sqlCmd.Parameters.AddWithValue("ID", ID)
        sqlCmd.Parameters.AddWithValue("CIF", LabelCIF.Text)
        sqlCmd.Parameters.AddWithValue("CUSTOMER_NEW_OLD", DropDownListCUSTOMER_NEW_OLD.Items(DropDownListCUSTOMER_NEW_OLD.SelectedIndex).Value)
        sqlCmd.Parameters.AddWithValue("LIMIT_NEW_OLD", DropDownListLIMIT_NEW_OLD.Items(DropDownListLIMIT_NEW_OLD.SelectedIndex).Value)
        sqlCmd.Parameters.AddWithValue("DECB_RD_ID", LabelProductCode.Text)
        sqlCmd.Parameters.AddWithValue("VALUE", ToDecimal(TextBoxVALUE.Text))
        sqlCmd.Parameters.AddWithValue("IS_GUARANTEE", DropDownListIS_GUARANTEE.Items(DropDownListIS_GUARANTEE.SelectedIndex).Value)
        sqlCmd.Parameters.AddWithValue("GUARANTEE_VALUE", ToDecimal(TextBoxGUARANTEE_VALUE.Text))
        sqlCmd.Parameters.AddWithValue("DAMAGE_TYPE_ID", DropDownListDAMAGE_TYPE_ID.Items(DropDownListDAMAGE_TYPE_ID.SelectedIndex).Value)
        sqlCmd.Parameters.AddWithValue("REMARK", TextBoxREMARK.Text)
        sqlCmd.Parameters.AddWithValue("SUB_DISTRICT_ID", TextBoxSUB_DISTRICT_ID.Text)
        sqlCmd.Parameters.AddWithValue("PROJECT_CODE", PROJECT_CODE.Value)

        If mode = "add" Then
            sqlCmd.Parameters.AddWithValue("CREATE_USER", username)
        ElseIf mode = "update" Then
            sqlCmd.Parameters.AddWithValue("IDEN", IDEN.Value)
            sqlCmd.Parameters.AddWithValue("UPDATE_USER", username)
        End If
        sqlCmd.ExecuteNonQuery()
        sqlCmd.Transaction.Commit()
        'Catch ex As Exception
        '    sqlCmd.Transaction.Rollback()
        '    alert(ex.Message.ToString)
        '    Exit Sub
        'Finally
        If (conn.State = ConnectionState.Open) Then
            conn.Close()
        End If
        conn = Nothing
        alert("บันทึกข้อมูลเรียบร้อย")
        Session("mode") = ""

        CustomersGridView.EditIndex = -1
        showCustomerGrid()


        ' End Try
    End Sub

    Protected Sub btnAddNewInfo_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnAddNewInfo.Click
        Dim id = Request.QueryString("ID")
        If id = "" Then
            alert("ไม่พบข้อมูล ID CA กรุณาเข้าระบบใหม่ ")
            Exit Sub

        End If
        ' If btnAddNew.Text = "เพิ่มรายชื่อ" Then
        ' กำหนดให้แก้ไขที่แถวแรก
        CustomersInfoGridView.EditIndex = 0


        ' bind grid โดยส่งแถวแรกมีค่าว่างมาด้วย

        Dim conn As SqlConnection = Nothing
        'Try
        conn = ConnectionUtil.getSqlConnectionFromWebConfig()
        Dim Sql As String = "ANNALS_FLOOD_CUSTOMER_SELECT_NEW "
        Dim sqlCmd As New SqlCommand(Sql, conn)
        sqlCmd.CommandType = CommandType.StoredProcedure
        sqlCmd.Prepare()
        sqlCmd.Parameters.AddWithValue("@ID", id)
        'sqlCmd.Parameters.AddWithValue("@SMES_TYPE", smes_type)
        Dim reader As SqlDataReader = sqlCmd.ExecuteReader()
        CustomersInfoGridView.DataSource = reader
        CustomersInfoGridView.DataBind()

        reader.Close()
        conn.Close()

        ModeInfo = "add"


    End Sub
    Sub CustomerInfoGridEditCommand(ByVal sender As Object, ByVal e As GridViewEditEventArgs)
        CustomersInfoGridView.EditIndex = e.NewEditIndex
        showCustomerInfoGrid()

        ' ตรวจสอบข้อมูล reprice ว่ามีหรือยัง (ปกติจะบังคับให้กรอก)  ถ้าไม่มีให้เป็น mode add ถ้ามีแล้วให้เป็น update
        Dim REPRICELabel As Label = CustomersInfoGridView.Rows(CustomersInfoGridView.EditIndex).FindControl("REPRICELabel")
        If REPRICELabel.Text = "" Then
            ModeInfo = "add"
        Else  ' กรณีเป็น YES หรือ NO
            ModeInfo = "update"
        End If

        CheckReprice()
       

        'MsgBox(CustomersInfoGridView.EditIndex)
        'If btnAddNew.Text = "ยกเลิกการเพิ่ม" Then
        '    CustomersGridView.EditIndex = CustomersGridView.EditIndex - 1
        'End If
        'MsgBox(CustomersGridView.EditIndex)

    End Sub

    Sub showCustomerInfoGrid()
        Dim id As String = Request.QueryString("ID")
        If id = "" Then
            id = " "
        End If
        Dim conn As SqlConnection = Nothing

        conn = ConnectionUtil.getSqlConnectionFromWebConfig()
        Dim Sql As String = "ANNALS_FLOOD_CUSTOMER_SELECT"
        Dim sqlCmd As New SqlCommand(Sql, conn)
        sqlCmd.CommandType = CommandType.StoredProcedure
        sqlCmd.Prepare()
        sqlCmd.Parameters.AddWithValue("@ID", id)
        Dim reader As SqlDataReader = sqlCmd.ExecuteReader()
        CustomersInfoGridView.DataSource = reader
        CustomersInfoGridView.DataBind()

        reader.Close()
        conn.Close()


    End Sub

    Sub CustomerInfoGridCancelCommand(ByVal sender As Object, ByVal e As GridViewCancelEditEventArgs)

        CustomersInfoGridView.EditIndex = -1
        showCustomerInfoGrid()

    End Sub
    Protected Sub CustomersInfoGridView_RowUpdating(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewUpdateEventArgs) Handles CustomersInfoGridView.RowUpdating
        Dim ID = Request.QueryString("ID")
        Dim mode As String = ModeInfo
        Dim username = User.Identity.Name

         If ID = "" Then
            alert(" ไม่สามารถบันทึก ไม่พบข้อมูล ID CA กรุณา login ใหม่ ")
            Exit Sub
        ElseIf mode = "" Then
            alert(" ไม่สามารถบันทึก หมดเวลา กรุณา login ใหม่ ")
            Exit Sub
        ElseIf username = "" Then
            alert(" ไม่สามารถบันทึก ไม่พบข้อมูล username กรุณา login ใหม่ ")
        End If

      
        Dim RepriceDropDownList As DropDownList = CustomersInfoGridView.Rows(CustomersInfoGridView.EditIndex).FindControl("RepriceDropDownList")
        'Dim CustomerCADropDownList As DropDownList = CustomersInfoGridView.Rows(CustomersInfoGridView.EditIndex).FindControl("CustomerCADropDownList")

        Dim LabelCIF As Label = CustomersInfoGridView.Rows(CustomersInfoGridView.EditIndex).FindControl("LabelCIF")

        Dim FixedAssetTextBox As TextBox = CustomersInfoGridView.Rows(CustomersInfoGridView.EditIndex).FindControl("FixedAssetTextBox")
        Dim DepositTextBox As TextBox = CustomersInfoGridView.Rows(CustomersInfoGridView.EditIndex).FindControl("DepositTextBox")
        Dim DepositDropDownList As DropDownList = CustomersInfoGridView.Rows(CustomersInfoGridView.EditIndex).FindControl("DepositDropDownList")
        Dim DSCRTextBox As TextBox = CustomersInfoGridView.Rows(CustomersInfoGridView.EditIndex).FindControl("DSCRTextBox")
        Dim SMERLimitTextBox As TextBox = CustomersInfoGridView.Rows(CustomersInfoGridView.EditIndex).FindControl("SMERLimitTextBox")
        Dim SMERFloodTextBox As TextBox = CustomersInfoGridView.Rows(CustomersInfoGridView.EditIndex).FindControl("SMERFloodTextBox")
        Dim SMEROtherTextBox As TextBox = CustomersInfoGridView.Rows(CustomersInfoGridView.EditIndex).FindControl("SMEROtherTextBox")

        If RepriceDropDownList.Items(RepriceDropDownList.SelectedIndex).Value = "" Then
            alert(" ไม่สามารถบันทึกกรุณาระบุ วัตถุประสงค์ ")
            Exit Sub
        End If

        ' เช็คว่าเป็น reprice หรือ ไม่ถ้าเป็น ไม่ต้องตรวจสอบ
        If RepriceDropDownList.Items(RepriceDropDownList.SelectedIndex).Value = "0" Then

            If FixedAssetTextBox.Text = "" Then
                alert(" ไม่สามารถบันทึกกรุณาระบุ มูลค่าหลักประกัน fixed asset ")
                Exit Sub
            End If
            If DepositTextBox.Text = "" Then
                alert(" ไม่สามารถบันทึกกรุณาระบุ หลักประกันเงินฝาก ")
                Exit Sub
            End If
            If DepositDropDownList.Items(DepositDropDownList.SelectedIndex).Value = "" Then
                alert(" ไม่สามารถบันทึกกรุณาระบุ เงินฝาก 30% ")
                Exit Sub
            End If
            If DSCRTextBox.Text = "" Then
                alert(" ไม่สามารถบันทึกกรุณาระบุ DSCR ")
                Exit Sub
            End If
            If SMERLimitTextBox.Text = "" Then
                alert(" ไม่สามารถบันทึกกรุณาระบุ วงเงิน SME R ปกติ ")
                Exit Sub
            End If

            If SMERFloodTextBox.Text = "" Then
                alert(" ไม่สามารถบันทึกกรุณาระบุ วงเงิน SME R Flood")
                Exit Sub
            End If

            If SMEROtherTextBox.Text = "" Then
                alert(" ไม่สามารถบันทึกกรุณาระบุ วงเงิน SME R ในนามชื่อคนอื่น ")
                Exit Sub
            End If

        End If
      

        Dim conn As SqlConnection = Nothing
        Dim sqlCmd As New SqlCommand()
        Dim sql As String = Nothing
        ' Try

        conn = ConnectionUtil.getSqlConnectionFromWebConfig()
        sqlCmd.Connection = conn
        sqlCmd.Transaction = sqlCmd.Connection.BeginTransaction()
        If mode = "add" Then
            sqlCmd.CommandText = "ANNALS_FLOOD_CUSTOMER_INSERT"
        ElseIf mode = "update" Then
            sqlCmd.CommandText = "ANNALS_FLOOD_CUSTOMER_UPDATE"
        Else
            alert("หมดเวลาบันทึกข้อมูล กรุณา login ใหม่")
            Exit Sub
        End If

        sqlCmd.CommandType = CommandType.StoredProcedure
        sqlCmd.Parameters.AddWithValue("ID", ID)
        sqlCmd.Parameters.AddWithValue("CIF", LabelCIF.Text)
        sqlCmd.Parameters.AddWithValue("REPRICE_STATUS", RepriceDropDownList.Items(RepriceDropDownList.SelectedIndex).Value)
        ' ถ้าเป็นการ reprice ไม่ต้องมีค่าต่าง ๆ  1 reprice 0 ไม่เป็น
        If RepriceDropDownList.Items(RepriceDropDownList.SelectedIndex).Value = "0" Then

            sqlCmd.Parameters.AddWithValue("FIXED_ASSET", ToDecimal(FixedAssetTextBox.Text))
            sqlCmd.Parameters.AddWithValue("DEPOSIT", ToDecimal(DepositTextBox.Text))
            sqlCmd.Parameters.AddWithValue("DEPOSIT_STATUS", DepositDropDownList.Items(DepositDropDownList.SelectedIndex).Value)
            sqlCmd.Parameters.AddWithValue("DSCR", ToDecimal(DSCRTextBox.Text))
            sqlCmd.Parameters.AddWithValue("SMER_NORMAL_LIMIT", ToDecimal(SMERLimitTextBox.Text))
            sqlCmd.Parameters.AddWithValue("SMER_FLOOD_LIMIT", ToDecimal(SMERFloodTextBox.Text))
            sqlCmd.Parameters.AddWithValue("SMER_OTHER_LIMIT", ToDecimal(SMEROtherTextBox.Text))

        Else

            sqlCmd.Parameters.AddWithValue("FIXED_ASSET", DBNull.Value)
            sqlCmd.Parameters.AddWithValue("DEPOSIT", DBNull.Value)
            sqlCmd.Parameters.AddWithValue("DEPOSIT_STATUS", DBNull.Value)
            sqlCmd.Parameters.AddWithValue("DSCR", DBNull.Value)
            sqlCmd.Parameters.AddWithValue("SMER_NORMAL_LIMIT", DBNull.Value)
            sqlCmd.Parameters.AddWithValue("SMER_FLOOD_LIMIT", DBNull.Value)
            sqlCmd.Parameters.AddWithValue("SMER_OTHER_LIMIT", DBNull.Value)

        End If

        If mode = "add" Then
            sqlCmd.Parameters.AddWithValue("CREATE_USER", username)
        ElseIf mode = "update" Then
            sqlCmd.Parameters.AddWithValue("UPDATE_USER", username)
        End If
        sqlCmd.ExecuteNonQuery()
        sqlCmd.Transaction.Commit()
        'Catch ex As Exception
        '    sqlCmd.Transaction.Rollback()
        '    alert(ex.Message.ToString)
        '    Exit Sub
        'Finally
        If (conn.State = ConnectionState.Open) Then
            conn.Close()
        End If
        conn = Nothing
        'alert("บันทึกข้อมูลเรียบร้อย")
        ModeInfo = ""

        CustomersInfoGridView.EditIndex = -1
        showCustomerInfoGrid()


        ' End Try
    End Sub
    Protected Sub CustomersInfoGridView_RowDeleting(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewDeleteEventArgs) Handles CustomersInfoGridView.RowDeleting
        Dim username = User.Identity.Name

        If username = "" Then
            alert(" ไม่สามารถบันทึก ไม่พบข้อมูล username กรุณา login ใหม่ ")
        End If

        Dim conn As SqlConnection = Nothing
        Dim sqlCmd As New SqlCommand()
        Dim sql As String = Nothing
        'Try

        conn = ConnectionUtil.getSqlConnectionFromWebConfig()
        sqlCmd.Connection = conn
        sqlCmd.Transaction = sqlCmd.Connection.BeginTransaction()
        sqlCmd.CommandText = "ANNALS_FLOOD_CUSTOMER_UPDATE_DEL_FLAG"
        sqlCmd.CommandType = CommandType.StoredProcedure


        Dim ID = Request.QueryString("ID")
        ' Dim CustomerCADropDownList As DropDownList = CustomersInfoGridView.Rows(CustomersInfoGridView.EditIndex).FindControl("CustomerCADropDownList")
        Dim LabelCIF As Label = CustomersInfoGridView.Rows(CustomersInfoGridView.EditIndex).FindControl("LabelCIF")

        sqlCmd.Parameters.AddWithValue("ID", ID)
        sqlCmd.Parameters.AddWithValue("CIF", LabelCIF.Text)

        sqlCmd.Parameters.AddWithValue("UPDATE_USER", username)

        sqlCmd.ExecuteNonQuery()
        sqlCmd.Transaction.Commit()
        'Catch ex As Exception
        '    sqlCmd.Transaction.Rollback()
        '    alert(ex.Message.ToString)
        '    Exit Sub
        'Finally
        If (conn.State = ConnectionState.Open) Then
            conn.Close()
        End If
        conn = Nothing
        alert("ลบข้อมูลเรียบร้อย")
        ModeInfo = ""

        CustomersInfoGridView.EditIndex = -1
        showCustomerInfoGrid()


        '  End Try

    End Sub

    Protected Sub CustomerInfoGridRowCommand(ByVal sender As Object, ByVal e As GridViewCommandEventArgs)

        If e.CommandName = "AddBank" Then

            Dim conn As SqlConnection = Nothing
            Dim sqlCmd As New SqlCommand()
            Dim sql As String = Nothing
            ' Try
            Dim ID = Request.QueryString("ID")
            '            Dim CustomerCADropDownList As DropDownList = CustomersInfoGridView.Rows(CustomersInfoGridView.EditIndex).FindControl("CustomerCADropDownList")
            Dim LabelCIF As Label = CustomersInfoGridView.Rows(CustomersInfoGridView.EditIndex).FindControl("LabelCIF")

            Dim BankDropDownList As DropDownList = CustomersInfoGridView.Rows(CustomersInfoGridView.EditIndex).FindControl("BankDropDownList")
            Dim BankValueTextBox As TextBox = CustomersInfoGridView.Rows(CustomersInfoGridView.EditIndex).FindControl("BankValueTextBox")
            Dim BankGridView As GridView = CustomersInfoGridView.Rows(CustomersInfoGridView.EditIndex).FindControl("BankGridView")

            Dim dupBank As Boolean = False
            For i = 0 To BankGridView.Rows.Count - 1

                Dim BankIDLabel As Label = BankGridView.Rows(i).FindControl("BankIDLabel")
                If BankIDLabel.Text = BankDropDownList.Items(BankDropDownList.SelectedIndex).Value Then
                    dupBank = True
                End If
            Next

            If dupBank = True Then
                alert(" กรณากรอกรายชื่อ Bank อื่น ")
                Exit Sub
            End If
            conn = ConnectionUtil.getSqlConnectionFromWebConfig()
            sqlCmd.Connection = conn
            sqlCmd.Transaction = sqlCmd.Connection.BeginTransaction()

            sqlCmd.CommandText = "ANNALS_FLOOD_CUSTOMER_BANK_INSERT"
            sqlCmd.CommandType = CommandType.StoredProcedure
            sqlCmd.Parameters.AddWithValue("ID", ID)
            sqlCmd.Parameters.AddWithValue("CIF", LabelCIF.Text)
            sqlCmd.Parameters.AddWithValue("BANK_ID", BankDropDownList.Items(BankDropDownList.SelectedIndex).Value)
            sqlCmd.Parameters.AddWithValue("BANK_NAME", BankDropDownList.Items(BankDropDownList.SelectedIndex).Text)
            sqlCmd.Parameters.AddWithValue("VALUE", ToDecimal(BankValueTextBox.Text))

            sqlCmd.ExecuteNonQuery()
            sqlCmd.Transaction.Commit()

            BankGridView.DataBind()

        End If
    End Sub
    Protected Sub CustomerBankGridRowCommand(ByVal sender As Object, ByVal e As GridViewCommandEventArgs)

        If e.CommandName = "DeleteBank" Then

            Dim conn As SqlConnection = Nothing
            Dim sqlCmd As New SqlCommand()
            Dim sql As String = Nothing
            ' Try
            Dim ID = Request.QueryString("ID")
            'Dim CustomerCADropDownList As DropDownList = CustomersInfoGridView.Rows(CustomersInfoGridView.EditIndex).FindControl("CustomerCADropDownList")
            Dim LabelCIF As Label = CustomersInfoGridView.Rows(CustomersInfoGridView.EditIndex).FindControl("LabelCIF")

            Dim BankGridView As GridView = CustomersInfoGridView.Rows(CustomersInfoGridView.EditIndex).FindControl("BankGridView")
            Dim BankIDLabel As Label = BankGridView.Rows(BankGridView.EditIndex).FindControl("BankIDLabel")


            conn = ConnectionUtil.getSqlConnectionFromWebConfig()
            sqlCmd.Connection = conn
            sqlCmd.Transaction = sqlCmd.Connection.BeginTransaction()

            sqlCmd.CommandText = "ANNALS_FLOOD_CUSTOMER_BANK_DELETE"
            sqlCmd.CommandType = CommandType.StoredProcedure
            sqlCmd.Parameters.AddWithValue("ID", ID)
            sqlCmd.Parameters.AddWithValue("CIF", LabelCIF.Text)
            sqlCmd.Parameters.AddWithValue("BANK_ID", BankIDLabel.Text)


            sqlCmd.ExecuteNonQuery()
            sqlCmd.Transaction.Commit()

            BankGridView.DataBind()

        End If
    End Sub

    Sub CheckReprice()

        Dim RepriceDropDownList As DropDownList = CustomersInfoGridView.Rows(CustomersInfoGridView.EditIndex).FindControl("RepriceDropDownList")
        'Dim CustomerCADropDownList As DropDownList = CustomersInfoGridView.Rows(CustomersInfoGridView.EditIndex).FindControl("CustomerCADropDownList")

        Dim InputPanel As Panel = CustomersInfoGridView.Rows(CustomersInfoGridView.EditIndex).FindControl("InputPanel")

        If RepriceDropDownList.Items(RepriceDropDownList.SelectedIndex).Value = "1" Then
            InputPanel.Enabled = False
        ElseIf RepriceDropDownList.Items(RepriceDropDownList.SelectedIndex).Value = "0" Then
            InputPanel.Enabled = True
        ElseIf RepriceDropDownList.Items(RepriceDropDownList.SelectedIndex).Value = "2" Then
            InputPanel.Enabled = True
        Else
            InputPanel.Enabled = False
        End If

    End Sub
End Class
