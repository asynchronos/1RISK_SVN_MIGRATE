Imports System.Data
Imports System.Data.SqlClient
Imports System.Globalization
Partial Class aspx_annals_AnnalsCreditFlood
    Inherits System.Web.UI.Page
    Dim thCul As System.Globalization.CultureInfo = New System.Globalization.CultureInfo("th-TH")
    Protected Sub AddButton_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles AddButton.Click
        saveData("add")
    End Sub

    Protected Sub UpdateButton_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles UpdateButton.Click
        saveData("update")
    End Sub
    Sub bindDropDown()
        Dim conn As SqlConnection = Nothing
        conn = ConnectionUtil.getSqlConnectionFromWebConfig()

        Dim sqlCmd As New SqlCommand
        sqlCmd.Connection = conn
        sqlCmd.CommandType = CommandType.StoredProcedure
        sqlCmd.CommandText = "ANNALS_CREDIT_FLOOD_TABLE_SELECT"
        sqlCmd.Parameters.AddWithValue("@RECORD_TYPE", "IMPACT_TYPE")
        sqlCmd.Prepare()
        Dim reader As SqlDataReader = sqlCmd.ExecuteReader()
        DropDownListIMPACT_TYPE.DataSource = reader
        DropDownListIMPACT_TYPE.DataValueField = "ID"
        DropDownListIMPACT_TYPE.DataTextField = "Name"
        DropDownListIMPACT_TYPE.DataBind()
         DropDownListIMPACT_TYPE.Items.Insert(0, New ListItem("..โปรดเลือก..", ""))
        reader.Close()

        sqlCmd.Parameters.Clear()
        sqlCmd.CommandText = "ANNALS_CREDIT_FLOOD_TABLE_SELECT"
        sqlCmd.Parameters.AddWithValue("@RECORD_TYPE", "OPERATION")
        sqlCmd.Prepare()
        reader = sqlCmd.ExecuteReader()
        DropDownListOPERATION.DataSource = reader
        DropDownListOPERATION.DataValueField = "ID"
        DropDownListOPERATION.DataTextField = "Name"
        DropDownListOPERATION.DataBind()
        DropDownListOPERATION.Items.Insert(0, New ListItem("..โปรดเลือก..", ""))
        reader.Close()

        sqlCmd.Parameters.Clear()
        sqlCmd.CommandText = "ANNALS_CREDIT_FLOOD_TABLE_SELECT"
        sqlCmd.Parameters.AddWithValue("@RECORD_TYPE", "PROGRAM")
        sqlCmd.Prepare()
        reader = sqlCmd.ExecuteReader()
        DropDownListPROGRAM.DataSource = reader
        DropDownListPROGRAM.DataValueField = "ID"
        DropDownListPROGRAM.DataTextField = "Name"
        DropDownListPROGRAM.DataBind()
        DropDownListPROGRAM.Items.Insert(0, New ListItem("..โปรดเลือก..", ""))
        reader.Close()

        sqlCmd.Parameters.Clear()
        sqlCmd.CommandText = "ANNALS_CREDIT_FLOOD_TABLE_SELECT"
        sqlCmd.Parameters.AddWithValue("@RECORD_TYPE", "IMPACT")
        sqlCmd.Prepare()
        reader = sqlCmd.ExecuteReader()
        DropDownListIMPACT.DataSource = reader
        DropDownListIMPACT.DataValueField = "ID"
        DropDownListIMPACT.DataTextField = "Name"
        DropDownListIMPACT.DataBind()
        DropDownListIMPACT.Items.Insert(0, New ListItem("..โปรดเลือก..", ""))
        reader.Close()

        conn.Close()

    End Sub
    Sub saveData(ByVal mode As String)

        Dim IDCA As String = Request.QueryString("ID")
        Dim UPDATE_USER As String = Request.QueryString("EMP_ID")
        If IDCA = "" Then
            Msg("ไม่สามารถบันทึกข้อมูล \n ไม่พบเลขที่หนังสือ")
            Exit Sub
        End If
        If UPDATE_USER = "" Then
            Msg("ไม่สามารถบันทึกข้อมูล \n ไม่พบข้อมูลผู้บันทึก")
            Exit Sub
        End If
         If DropDownListIMPACT_TYPE.Items(DropDownListIMPACT_TYPE.SelectedIndex).Value = "" Then
            Msg("ไม่สามารถบันทึกข้อมูล \n กรุณาระบุประเภทผลกระทบ")
            Exit Sub
        End If

        If DropDownListOPERATION.Items(DropDownListOPERATION.SelectedIndex).Value = "" Then
            Msg("ไม่สามารถบันทึกข้อมูล \n กรุณาระบุการดำเนินการ")
            Exit Sub
        End If

        If DropDownListPROGRAM.Items(DropDownListPROGRAM.SelectedIndex).Value = "" Then
            Msg("ไม่สามารถบันทึกข้อมูล \n กรุณาระบุโปรแกรม")
            Exit Sub
        End If

        If DropDownListIMPACT.Items(DropDownListIMPACT.SelectedIndex).Value = "" Then
            Msg("ไม่สามารถบันทึกข้อมูล \n กรุณาระบุผลกระทบ")
            Exit Sub
        End If

        If IMPACT_DATETextBox.Text = "" Then
            Msg("ไม่สามารถบันทึกข้อมูล \n กรุณาระบุวันที่เกิดผลกระทบ")
            Exit Sub
        End If




        Dim conn As SqlConnection = Nothing
        Dim sqlCmd As New SqlCommand()
        Dim sql As String = Nothing
        Try
            conn = ConnectionUtil.getSqlConnectionFromWebConfig()
            sqlCmd.Connection = conn
            sqlCmd.Transaction = sqlCmd.Connection.BeginTransaction()
            If mode = "add" Then
                sqlCmd.CommandText = "ANNALS_CREDIT_FLOOD_INSERT"
            ElseIf mode = "update" Then
                sqlCmd.CommandText = "ANNALS_CREDIT_FLOOD_UPDATE"
            End If
            sqlCmd.CommandType = CommandType.StoredProcedure
            sqlCmd.Parameters.AddWithValue("ID", IDCA)
            sqlCmd.Parameters.AddWithValue("IMPACT_TYPE", DropDownListIMPACT_TYPE.Items(DropDownListIMPACT_TYPE.SelectedIndex).Value)
            sqlCmd.Parameters.AddWithValue("OPERATION", DropDownListOPERATION.Items(DropDownListOPERATION.SelectedIndex).Value)
            sqlCmd.Parameters.AddWithValue("PROGRAM", DropDownListPROGRAM.Items(DropDownListPROGRAM.SelectedIndex).Value)
            sqlCmd.Parameters.AddWithValue("IMPACT", DropDownListIMPACT.Items(DropDownListIMPACT.SelectedIndex).Value)
            If IMPACT_DATETextBox.Text = "" Then
                sqlCmd.Parameters.AddWithValue("IMPACT_DATE", System.DBNull.Value)
            Else
                Dim MyDateTime = New DateTime()
                MyDateTime = DateTime.Parse(IMPACT_DATETextBox.Text, thCul)
                sqlCmd.Parameters.AddWithValue("IMPACT_DATE", MyDateTime)
            End If
            sqlCmd.Parameters.AddWithValue("UPDATE_USER", UPDATE_USER)
            sqlCmd.ExecuteNonQuery()
            sqlCmd.Transaction.Commit()
        Catch ex As Exception
            sqlCmd.Transaction.Rollback()
            Msg(ex.Message.ToString)
            Exit Sub
        Finally
            If (conn.State = ConnectionState.Open) Then
                conn.Close()
            End If
            conn = Nothing

            AddButton.Visible = False
            UpdateButton.Visible = False
            If mode = "add" Then
                Msg("เพิ่มข้อมูลเรียบร้อย")
            ElseIf mode = "update" Then
                Msg("บันทึกข้อมูลเรียบร้อย")
            End If

        End Try
    End Sub
    Sub showData()
        Dim conn As SqlConnection = Nothing
        Try
            conn = ConnectionUtil.getSqlConnectionFromWebConfig()
            Dim Sql As String = "ANNALS_CREDIT_FLOOD_SELECT"
            Dim sqlCmd As New SqlCommand(Sql, conn)
            sqlCmd.CommandType = CommandType.StoredProcedure
            sqlCmd.Prepare()
            Dim ID As SqlParameter = sqlCmd.Parameters.AddWithValue("@ID", Request.QueryString("ID"))

            Dim reader As SqlDataReader = sqlCmd.ExecuteReader()
            If reader.HasRows Then
                While reader.Read()

                    If IsDBNull(reader("IMPACT_TYPE")) = False Then
                        DropDownListIMPACT_TYPE.SelectedIndex = DropDownListIMPACT_TYPE.Items.IndexOf(DropDownListIMPACT_TYPE.Items.FindByValue(reader("IMPACT_TYPE")))
                    End If
                    If IsDBNull(reader("OPERATION")) = False Then
                        DropDownListOPERATION.SelectedIndex = DropDownListOPERATION.Items.IndexOf(DropDownListOPERATION.Items.FindByValue(reader("OPERATION")))
                    End If
                    If IsDBNull(reader("PROGRAM")) = False Then
                        DropDownListPROGRAM.SelectedIndex = DropDownListPROGRAM.Items.IndexOf(DropDownListPROGRAM.Items.FindByValue(reader("PROGRAM")))
                    End If
                    If IsDBNull(reader("IMPACT")) = False Then
                        DropDownListIMPACT.SelectedIndex = DropDownListIMPACT.Items.IndexOf(DropDownListIMPACT.Items.FindByValue(reader("IMPACT")))
                    End If
                    If IsDBNull(reader("IMPACT_DATE")) = False Then
                        IMPACT_DATETextBox.Text = reader("IMPACT_DATE")
                    End If

                End While
                UpdateButton.Visible = True
                AddButton.Visible = False
            Else
                AddButton.Visible = True
                UpdateButton.Visible = False
            End If


        Catch ex As Exception
            Msg(ex.Message.ToString)
            Exit Sub
        Finally
            If (conn.State = ConnectionState.Open) Then
                conn.Close()
            End If
            conn = Nothing
        End Try
    End Sub
    Protected Sub Msg(ByVal str As String)
        'Response.Write("<script language=javascript>alert('" & str & "')</script>")
        str = "alert(""" & str & """);"
        Page.ClientScript.RegisterStartupScript(Me.GetType(), "messagebox", str, True)
    End Sub

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Not Page.IsPostBack Then
            bindDropDown()
            showData()
        End If
    End Sub
End Class
