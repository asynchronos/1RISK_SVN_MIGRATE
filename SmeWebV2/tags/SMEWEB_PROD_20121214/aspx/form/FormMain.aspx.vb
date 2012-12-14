Imports System.Collections.Generic
Imports System.Globalization
Partial Class aspx_form_FormMain
    Inherits System.Web.UI.Page

    Public user_id As String
    Public id As String
    Protected cul As New CultureInfo("th-TH") ' ปี ไทย  
    Dim sql As String
    ' Dim ConnString = ConfigurationManager.ConnectionStrings("Bay01ConnectionString").ToString
    Dim ConnString = ConfigurationManager.ConnectionStrings("BAY01ConnectionString").ToString

    Protected Sub alert(ByVal str As String)
        'Response.Clear()
        'Response.Write("<script language=""javascript"">alert(""" & str & """)</script>")
        str = "alert(""" & str & """);"
        Page.ClientScript.RegisterStartupScript(Me.GetType(), "messagebox", str, True)

    End Sub
    Protected Sub closeWindow()
        Response.Clear()
        Response.Write("<script language=""javascript"">window.close();</script>")

    End Sub
    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load


        user_id = User.Identity.Name
        id = Request("id")
        'id = "000001"
        If user_id = "" Then
            user_id = Request.QueryString("user_id")
            If user_id = "" Then
                alert(" No user id")
                closeWindow()
                Exit Sub
            End If
        End If


        If Page.IsPostBack = False Then
            'Dim sql As String = "Select  *  from  V_ANNALS_COVENANT  where  ID='" & annals_id & "' order by id"
            ' ถ้ามีการเรียกหน้านี้จาก หน้าอื่น (จากหน้าแรกของ leader) ให้แสดงเฉพาะ link ไปกรอกข้อมูลเท่านั้น
            Dim sql As String 
            If Request.QueryString("mode") = "1" Then
                sql = "Select  *  from  FORM.TB_FORM  where  form_status=1 order by form_id desc"
            ElseIf Request.QueryString("mode") = "2" Then
                sql = "Select  *  from  FORM.TB_FORM order by form_id desc "
            End If


            Session("sql") = sql
            ShowGrid()
            ' สามารถเพิ่ม covenant ผ่านหน้า credit  เท่านั้น  หรือ ผู้ที่มี role readonly ไม่สามารถเพิ่มได้
            '   If HttpCookieUtil.hasRolesId(Context.Request.Cookies(FormsAuthentication.FormsCookieName), RoleIdConst.A_READ_ONLY) Then
            'btnAddNew.Visible = False
            ' Else
            'btnAddNew.Visible = True
            'End If

            ' ถ้ามีการเรียกหน้านี้จาก หน้าอื่น (จากหน้าแรกของ leader) ให้แสดงเฉพาะ link ไปกรอกข้อมูลเท่านั้น
            If Request.QueryString("mode") = "1" Then
                LabelShow.Visible = False
                LabelDesc.Visible = False
                btnAddNew.Visible = False
                GridForm.ShowHeader = False
                GridForm.ShowFooter = False
                GridForm.Columns(0).Visible = False
                GridForm.Columns(2).Visible = False
                GridForm.Columns(3).Visible = False
                GridForm.Columns(4).Visible = False
                GridForm.Columns(5).Visible = False
                GridForm.Columns(6).Visible = False
                GridForm.RowHeaderColumn = ""
            End If

        End If
    End Sub
    Protected Sub btnAddNew_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnAddNew.Click
        PreAddFileDetail()
    End Sub
    Sub PreAddFileDetail()
        Dim str As String = ""
        Session("event") = "addfile"

        sql = "SELECT '' as Form_ID" & _
      ",'' as Form_Name" & _
      ",'' as Form_Desc" & _
      ",'' as TB_Name" & _
      ",'' as TB_Name_Key" & _
      ",'' as TB_SQL" & _
      ",'' as TB_QUERY_Key " & _
       ",'' as TB_QUERY_Key_Value "


   
        bindGridForm(0, sql)
        GridForm.SelectedIndex = 0
    End Sub
    Sub bindGridForm(ByVal EditRow As Integer, ByVal SQL As String)

        ' On Error Resume Next

        ' ใช้ sub นี้ทั้งการ insert และ edit
        'MsgBox(SQL)
         Dim SqlForm As New SqlDataSource
        SqlForm.ConnectionString = ConnString
        SqlForm.SelectCommand = SQL
        Session("sql") = SQL
        SqlForm.SelectCommandType = SqlDataSourceCommandType.Text
        GridForm.EditIndex = EditRow
        GridForm.DataSource = SqlForm

        ' GridForm.Columns(3).Visible = False
        'GridForm.Columns(4).Visible = False

        'GridForm.Columns(9).Visible = False
        'GridForm.Columns(8).Visible = False

        'If EditRow < 0 Then
        '    GridForm.Columns(9).Visible = True
        'Else
        '    GridForm.Columns(9).Visible = False
        'End If
        GridForm.DataBind()

        ' ในการแก้ไขฟอร์มจะแสดงรายละเอียดของฟอร์ม และ แสดงฟิวที่ฟอร์มนี้มีด้านขวา
        ' ใช้การสร้าง control และเพิ่มเข้าไปใน cell ของ grid
        ' cell ที่ไม่ได้ใช้ remove ออกไป

        If EditRow >= 0 Then  ' === กรณีที่เป็นการแก้ไข rowindex  >=0


            ' สร้าง ฟอร์ม บันทึกจาก
            Dim form_id As HiddenField = GridForm.Rows(EditRow).FindControl("Form_ID")
            Dim tbForm_Name As TextBox = GridForm.Rows(EditRow).FindControl("tbForm_Name")
            Dim tbForm_Desc As TextBox = GridForm.Rows(EditRow).FindControl("tbForm_Desc")
            Dim tbTb_Name_Key As TextBox = GridForm.Rows(EditRow).FindControl("tbTb_Name_Key")
            Dim tbTb_SQL As TextBox = GridForm.Rows(EditRow).FindControl("tbTb_SQL")
            Dim tbTB_QUERY_KEY As TextBox = GridForm.Rows(EditRow).FindControl("tbTB_QUERY_KEY")

            Dim lblForm_Name As New Label
            lblForm_Name.Text = "Name"
            Dim lblForm_Desc As New Label
            lblForm_Desc.Text = "Description"
            Dim lblTb_Name_Key As New Label
            lblTb_Name_Key.Text = "Key of form"
            Dim lblTb_SQL As New Label
            lblTb_SQL.Text = "Query for select data"
            Dim lblTB_QUERY_KEY As New Label
            lblTB_QUERY_KEY.Text = "Key   of  SQL or Request"

            Dim NewCell As TableCell = GridForm.Rows(EditRow).Cells(1)
            NewCell.ColumnSpan = 5
            NewCell.BackColor = Drawing.Color.WhiteSmoke

            Dim TB As New Table
            TB.BorderWidth = 3
            TB.Width = 800
            NewCell.Controls.Add(TB)

            Dim TR1 As New TableRow
            Dim TC11 As New TableCell
            TC11.Controls.Add(lblForm_Name)
            Dim TC12 As New TableCell
            TC12.Controls.Add(tbForm_Name)
            Dim TC13 As New TableCell
            TC13.Controls.Add(lblForm_Desc)
            Dim TC14 As New TableCell
            TC14.Controls.Add(tbForm_Desc)
            TR1.Cells.Add(TC11)
            TR1.Cells.Add(TC12)
            TR1.Cells.Add(TC13)
            TR1.Cells.Add(TC14)

            Dim TR2 As New TableRow
            Dim TC21 As New TableCell
            TC21.Controls.Add(lblTb_SQL)
            Dim TC22 As New TableCell
            TC22.Controls.Add(tbTb_SQL)
            Dim TC23 As New TableCell
            TC23.Controls.Add(lblTB_QUERY_KEY)
            Dim TC24 As New TableCell
            TC24.Controls.Add(tbTB_QUERY_KEY)
            TR2.Cells.Add(TC21)
            TR2.Cells.Add(TC22)
            TR2.Cells.Add(TC23)
            TR2.Cells.Add(TC24)

            Dim TR3 As New TableRow
            Dim TC31 As New TableCell
            TC31.Controls.Add(lblTb_Name_Key)
            Dim TC32 As New TableCell
            TC32.Controls.Add(tbTb_Name_Key)
            TR3.Cells.Add(TC31)
            TR3.Cells.Add(TC32)
      
            TB.Rows.Add(TR1)
            TB.Rows.Add(TR2)
            TB.Rows.Add(TR3)
     

            'NewCell.Controls.Add(lblForm_Name)
            ' NewCell.Controls.Add(tbForm_Name)
            'NewCell.Controls.Add(tbForm_Desc)
            'NewCell.Controls.Add(tbTb_Name_Key)
            'NewCell.Controls.Add(tbTb_SQL)
            'NewCell.Controls.Add(tbTB_QUERY_KEY)
            For i = 0 To 3
                GridForm.Rows(EditRow).Cells.Remove(GridForm.Rows(EditRow).Cells(2))
            Next i


            'Dim tbCreate_date As TextBox = GridForm.Rows(EditRow).Cells(0).FindControl("tbCreate_date")
            'tbCreate_date.Enabled = False
            Dim BtnDelete As ImageButton = GridForm.Rows(EditRow).Cells(0).FindControl("BtnDelete")
            BtnDelete.Attributes.Add("onclick", "return confirm_delete();")

            If HttpCookieUtil.hasRolesId(Context.Request.Cookies(FormsAuthentication.FormsCookieName), RoleIdConst.R_ADMIN) Then
                BtnDelete.Visible = True
            Else
                BtnDelete.Visible = False
            End If

            ' กำหนดให้ แก้ไขค่าจากระบบ ไม่ได้


            Dim BtnUpdate As ImageButton = GridForm.Rows(EditRow).Cells(0).FindControl("BtnUpdate")
            BtnUpdate.Attributes.Add("onclick", "return confirm_update();")


            If LCase(Session("event")) <> "addfile" Then



            End If  '   If LCase(Session("event")) <> "addfile" Then


        End If

        If Err.Description <> "" Then
            Err.Clear()
            alert("หมดเวลาแก้ไขกรุณาปิดหน้านี้")
        End If
    End Sub
    Protected Sub GridForm_RowCancelingEdit(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewCancelEditEventArgs) Handles GridForm.RowCancelingEdit
        Dim sql As String = "Select * from  FORM.TB_FORM "
        Session("event") = "edit"
        bindGridForm(-1, sql)
    End Sub
    Protected Sub GridForm_RowEditing(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewEditEventArgs) Handles GridForm.RowEditing
        GridForm.SelectedIndex = e.NewEditIndex
        sql = Session("sql")
        bindGridForm(e.NewEditIndex, sql)
    End Sub
    Sub ShowGrid()

        sql = Session("sql")
        bindGridForm(-1, sql)
    End Sub
    Protected Sub GridForm_PageIndexChanging(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewPageEventArgs) Handles GridForm.PageIndexChanging
        GridForm.PageIndex = e.NewPageIndex
        GridForm.DataSource = Session("GridForm")
        GridForm.DataBind()
    End Sub
    Protected Sub GridForm_RowUpdating(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewUpdateEventArgs) Handles GridForm.RowUpdating


        Dim form_id As HiddenField = GridForm.Rows(e.RowIndex).Cells(0).FindControl("Form_ID")
        Dim tbForm_Name As TextBox = GridForm.Rows(e.RowIndex).Cells(0).FindControl("tbForm_Name")
        Dim tbForm_Desc As TextBox = GridForm.Rows(e.RowIndex).Cells(0).FindControl("tbForm_Desc")
        Dim tbTb_Name_Key As TextBox = GridForm.Rows(e.RowIndex).Cells(0).FindControl("tbTb_Name_Key")
        Dim tbTB_QUERY_KEY As TextBox = GridForm.Rows(e.RowIndex).Cells(0).FindControl("tbTB_QUERY_KEY")
        Dim tbTb_SQL As TextBox = GridForm.Rows(e.RowIndex).Cells(0).FindControl("tbTb_SQL")

        'Code check input error. 

        'MsgBox(Session("event"))

        If LCase(Session("event")) = "addfile" Then
            Dim strInsert As String = ""
            strInsert += " INSERT  INTO  FORM.[TB_FORM]"
            strInsert += "  VALUES (@form_name,@form_desc,@tb_name_key,@tb_sql,@TB_QUERY_KEY)"

            Dim InsertDatasource As New SqlDataSource
            InsertDatasource.ConnectionString = ConnString
            InsertDatasource.InsertCommand = strInsert
            InsertDatasource.InsertCommandType = SqlDataSourceCommandType.Text
            InsertDatasource.InsertParameters.Add("form_name", tbForm_Name.Text)
            InsertDatasource.InsertParameters.Add("form_desc", tbForm_Desc.Text)
            InsertDatasource.InsertParameters.Add("tb_name_key", tbTb_Name_Key.Text)
            InsertDatasource.InsertParameters.Add("tb_queryl_key", tbTB_QUERY_KEY.Text)
            InsertDatasource.InsertParameters.Add("tb_sql", tbTb_SQL.Text)
            InsertDatasource.Insert()
            alert("Add  complete ( เพิ่มข้อมูลเรียบร้อย)")
        Else
            Dim strUpdate As String = ""
            strUpdate += " Update  FORM.[TB_FORM]"
            strUpdate += "  SET  form_name = @form_name, "
            strUpdate += "  form_desc=@form_desc, "
            strUpdate += "  tb_name_key=@tb_name_key,"
            strUpdate += "  tb_query_key=@tb_query_key,"
            strUpdate += "  tb_sql=@tb_sql"
            strUpdate += " where form_id=@form_id"

            Dim UpdateDatasource As New SqlDataSource
            UpdateDatasource.ConnectionString = ConnString
            UpdateDatasource.UpdateCommand = strUpdate
            UpdateDatasource.UpdateCommandType = SqlDataSourceCommandType.Text
            UpdateDatasource.UpdateParameters.Add("form_id", form_id.Value)
            UpdateDatasource.UpdateParameters.Add("form_name", tbForm_Name.Text)
            UpdateDatasource.UpdateParameters.Add("form_desc", tbForm_Desc.Text)
            UpdateDatasource.UpdateParameters.Add("tb_name_key", tbTb_Name_Key.Text)
            UpdateDatasource.UpdateParameters.Add("tb_query_key", tbTB_QUERY_KEY.Text)
            UpdateDatasource.UpdateParameters.Add("tb_sql", tbTb_SQL.Text)
            UpdateDatasource.Update()
            alert("Update  complete ( บันทึกข้อมูลเรียบร้อย )")
        End If
        Session("event") = ""
        Session("sql") = "Select  *  from  FORM.TB_FORM "
        ShowGrid() ' Show grid data.
        ' Catch ex As Exception
        'message.Text = ex.Message
        'End Try
    End Sub
    Protected Sub GridForm_RowDeleting(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewDeleteEventArgs) Handles GridForm.RowDeleting
        Dim form_id As HiddenField = GridForm.Rows(e.RowIndex).Cells(0).FindControl("Form_ID")

        Try
            Dim strDelete As String = ""
            strDelete += " Delete  from   FORM.[TB_FORM]"
            strDelete += " where form_id=@form_id"

            Dim DeleteDatasource As New SqlDataSource
            DeleteDatasource.ConnectionString = ConnString
            DeleteDatasource.DeleteCommand = strDelete
            DeleteDatasource.DeleteCommandType = SqlDataSourceCommandType.Text
            DeleteDatasource.DeleteParameters.Add("form_id", form_id.Value)
            alert(" Delete  complete ")
        Catch ex As Exception
            alert(ex.Message)
        End Try
    End Sub
    Protected Sub GridForm_RowDataBound(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewRowEventArgs) Handles GridForm.RowDataBound
        If e.Row.RowType = DataControlRowType.DataRow Then
            Dim lblForm_Name As Label = e.Row.FindControl("lblForm_Name")
            Dim lblForm_Desc As Label = e.Row.FindControl("lblForm_Desc")
            Dim lblTb_SQL As Label = e.Row.FindControl("lblTb_SQL")
            Dim form_id As HiddenField = e.Row.FindControl("Form_ID")

            If IsNothing(lblForm_Name) = False Then
                lblForm_Name.Attributes.Add("onclick", " creditPopup = window.open('" + Page.ResolveUrl("formCreate.aspx?admin=true&formid=" & form_id.Value) + "','creditPopup','toolbar=No,width=900,height=600,resizable=yes,scrollbars=yes');" _
                                                      + " creditPopup.focus();")
                lblForm_Name.Style("cursor") = "pointer"   ' auto,crosshair ,default,pointer,help,move,Text,wait, e(-resize, w - resize, n - resize, s - resize, ne - resize, nw - resize, se - resize, sw - resize)
            End If
            If IsNothing(lblTb_SQL) = False Then
                If Len(lblTb_SQL.Text) > 0 Then
                    lblTb_SQL.Text = lblTb_SQL.Text.Substring(0, 10) & "..."
                Else
                    lblTb_SQL.Text = " Don 't have SQL "
                End If
                lblTb_SQL.Attributes.Add("onclick", " creditPopup = window.open('" + Page.ResolveUrl("formData.aspx?admin=true&formid=" & form_id.Value) + "','creditPopup','toolbar=No,width=900,height=600,resizable=yes,scrollbars=yes');" _
                                                      + " creditPopup.focus();")
                lblTb_SQL.Style("cursor") = "pointer"   ' auto,crosshair ,default,pointer,help,move,Text,wait, e(-resize, w - resize, n - resize, s - resize, ne - resize, nw - resize, se - resize, sw - resize)

            End If

            ' ถ้ามีการเรียกหน้านี้จาก หน้าอื่น (จากหน้าแรกของ leader) ให้แสดงเฉพาะ link ไปกรอกข้อมูลเท่านั้น
            If Request.QueryString("mode") = "1" Then
                lblForm_Name.Attributes.Add("onclick", " creditPopup = window.open('" + Page.ResolveUrl("formData.aspx?admin=true&formid=" & form_id.Value) + "','creditPopup','toolbar=No,width=900,height=600,resizable=yes,scrollbars=yes');" _
                                                   + " creditPopup.focus();")
                lblForm_Name.Style("cursor") = "pointer"   ' auto,crosshair ,default,pointer,help,move,Text,wait, e(-resize, w - resize, n - resize, s - resize, ne - resize, nw - resize, se - resize, sw - resize)
                lblForm_Name.Attributes.Add("OnMouseOver", "this.style.backgroundColor = 'lightblue';")
                lblForm_Name.Attributes.Add("OnMouseOut", "this.style.backgroundColor = '#E5F2FA';")

            End If


            e.Row.Attributes.Add("OnMouseOver", "this.style.backgroundColor = 'lightblue';")
            If e.Row.RowState = DataControlRowState.Alternate Then
                Dim alColor As String = System.Drawing.ColorTranslator.ToHtml(GridForm.AlternatingRowStyle.BackColor)
                e.Row.Attributes.Add("OnMouseOut", "this.style.backgroundColor ='" & alColor & "'")
            Else
                Dim bkColor As String = System.Drawing.ColorTranslator.ToHtml(GridForm.RowStyle.BackColor)
                e.Row.Attributes.Add("OnMouseOut", "this.style.backgroundColor ='" & bkColor & "'")
            End If

        End If

    End Sub

End Class
