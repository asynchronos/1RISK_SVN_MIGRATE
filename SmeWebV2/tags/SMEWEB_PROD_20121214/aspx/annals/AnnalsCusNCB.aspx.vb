Imports System.Collections.Generic
Imports System.Globalization
Partial Class _AnnalsCusNCB
    Inherits System.Web.UI.Page
    Public id As String
    Public user_id As String
    Protected cul As New CultureInfo("th-TH") ' ปี ไทย  
    Dim sql As String

    Protected Sub alert(ByVal str As String)
        'Response.Clear()
        'Response.Write("<script language=""javascript"">alert(""" & str & """)</script>")
        str = "alert(""" & str & """);"
        Page.ClientScript.RegisterStartupScript(Me.GetType(), "messagebox", str, True)

    End Sub
    Sub bindDropDown()

        Dim dalCusNcbType As New AnnalsCusNcbTypeDAL
        Dim arrCusNcbType As New List(Of AnnalsCusNcbType)
        arrCusNcbType = dalCusNcbType.getAllAnnalsCusNcbType
        Session("arrCusNcbType") = arrCusNcbType
        ' MsgBox(arrCusNcbType.Count)

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

        Dim sql As String = " SELECT * "
        sql += " FROM  [dbo].[V_ANNALS_CUS_NCB_ACC]"
        sql += " WHERE  ID=" & Request("id")
        Session("sql") = sql

        If Page.IsPostBack = False Then
            bindDropDown()

            Dim dal As New VAnnalsCusNcb
            Dim strCIF As String = Nothing


            ShowGridCusNcb()
            ' สามารถเพิ่ม covenant ผ่านหน้า credit  เท่านั้น  หรือ ผู้ที่มี role readonly ไม่สามารถเพิ่มได้
            If Request("update") <> "true" Or _
                HttpCookieUtil.hasRolesId(Context.Request.Cookies(FormsAuthentication.FormsCookieName), RoleIdConst.A_READ_ONLY) Then
                btnAddNew.Visible = False
            Else
                btnAddNew.Visible = True

            End If

            If HttpCookieUtil.hasRolesId(Context.Request.Cookies(FormsAuthentication.FormsCookieName), RoleIdConst.A_ADMIN) Then
                btnAddNew.Visible = True
            End If
        End If
    End Sub
    Protected Sub btnAddNew_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnAddNew.Click
        PreAddFileDetail()
    End Sub
    Sub PreAddFileDetail()
        Dim str As String = ""
        Session("event") = "addfile"

        sql = "SELECT '' as ID, '' as CIF, '' as Cifname, '' as CUS_NCB_TYPE_ID, " _
        & " '' as CUS_NCB_TYPE, '' as CUS_NCB_TYPE_DETAIL_ID, '' as CUS_NCB_TYPE_DETAIL, '' as CUS_NCB_DATE, " _
        & " '' as DETAIL, '' as DEPT_ID, '' as DEPT, '' as CUS_TYPE_ID, " _
        & " '' as CUS_TYPE, '' as AUTH_1_ID, '' as AUTH_1_NAME, '' as AUTH_2_ID, " _
        & " '' as AUTH_2_NAME "


        bindGridCusNcb(0, sql)
        GridCusNcb.SelectedIndex = 0
    End Sub
    Sub bindGridCusNcb(ByVal EditRow As Integer, ByVal SQL As String)

        ' On Error Resume Next

        ' ใช้ sub นี้ทั้งการ insert และ edit
        Dim dal As New VAnnalsCusNcbDAL
        Dim arr As New List(Of VAnnalsCusNcb)
        'MsgBox(SQL)
        arr = dal.getAllVAnnalsCusNcbBySQL(SQL)
        'MsgBox(SQL)
        ' Session("GridCusNcb") = arr
        GridCusNcb.EditIndex = EditRow
        GridCusNcb.DataSource = arr
        GridCusNcb.DataBind()

        '' ===============หา control

        If EditRow >= 0 Then  ' === กรณีที่เป็นการแก้ไข rowindex  >=0

            '   Dim lblIDEN As HiddenField = GridCusNcb.Rows(EditRow).Cells(0).FindControl("lblIDEN")
            Dim tbCIF As TextBox = GridCusNcb.Rows(EditRow).Cells(0).FindControl("tbCIF")

            'Dim lblCIF As Label = GridCusNcb.Rows(EditRow).Cells(0).FindControl("lblCIF")
            'Dim tbRemark As TextBox = GridCusNcb.Rows(EditRow).Cells(0).FindControl("tbRemark")

            Dim tbCUS_NCB_DATE As TextBox = GridCusNcb.Rows(EditRow).Cells(0).FindControl("tbCUS_NCB_DATE")
            'tbCreate_date.Enabled = False
            Dim BtnDelete As ImageButton = GridCusNcb.Rows(EditRow).Cells(0).FindControl("BtnDelete")
            BtnDelete.Attributes.Add("onclick", "return confirm_delete();")

            Dim BtnSearch As ImageButton = GridCusNcb.Rows(EditRow).Cells(0).FindControl("ImageButton1")
          

            If HttpCookieUtil.hasRolesId(Context.Request.Cookies(FormsAuthentication.FormsCookieName), RoleIdConst.R_ADMIN) Or _
                HttpCookieUtil.hasRolesId(Context.Request.Cookies(FormsAuthentication.FormsCookieName), RoleIdConst.A_ADMIN) Then
                BtnSearch.Visible = True
                tbCIF.Enabled = True
            Else
                tbCIF.Enabled = False
                BtnSearch.Visible = False
            End If

            ' กำหนดให้ แก้ไขค่าจากระบบ ไม่ได้

            Dim BtnUpdate As ImageButton = GridCusNcb.Rows(EditRow).Cells(0).FindControl("BtnUpdate")
            BtnUpdate.Attributes.Add("onclick", "return confirm_update();")


            Dim ddlCusNcbType As DropDownList = GridCusNcb.Rows(EditRow).Cells(0).FindControl("ddlCusNcbType")
            ddlCusNcbType.DataSource = Session("arrCusNcbType")
            ddlCusNcbType.DataValueField = "CUS_NCB_TYPE_ID"
            ddlCusNcbType.DataTextField = "CUS_NCB_TYPE"
            ddlCusNcbType.DataBind()
            ddlCusNcbType.Items.Insert(0, New ListItem("...โปรดเลือก...", ""))





            'Dim LabelCusTypeDetail As Label = GridCusNcb.Rows(EditRow).Cells(0).FindControl("LabelCusTypeDetail")
            ''MsgBox(LabelCusExceptType.ClientID)
            'ddlCusNcbType.Attributes.Add("onchange", "chkVisible(this,'" & ddlCustTypeDetail.ClientID & "','" & LabelCusTypeDetail.ClientID & "')")

            Dim ddlDept As DropDownList = GridCusNcb.Rows(EditRow).Cells(0).FindControl("ddlDept")
            ddlDept.DataSource = DeptSqlDataSource
            ddlDept.DataValueField = "DEPT_ID"
            ddlDept.DataTextField = "DEPT_NAME"
            ddlDept.DataBind()
            ddlDept.Items.Insert(0, New ListItem("...โปรดเลือก...", ""))
    


            Dim ddlCusType As DropDownList = GridCusNcb.Rows(EditRow).Cells(0).FindControl("ddlCustype")
            ddlCusType.DataSource = CusTypeSqlDataSource
            ddlCusType.DataValueField = "CUS_TYPE_ID"
            ddlCusType.DataTextField = "CUS_TYPE"
            ddlCusType.DataBind()
            ddlCusType.Items.Insert(0, New ListItem("...โปรดเลือก...", ""))



            Dim ddlAuth1 As DropDownList = GridCusNcb.Rows(EditRow).Cells(0).FindControl("ddlAuth1")
            ddlAuth1.DataSource = Auth1SqlDatasource
            ddlAuth1.DataValueField = "EMP_ID"
            ddlAuth1.DataTextField = "EMP_NAME"
            ddlAuth1.DataBind()
            ddlAuth1.Items.Insert(0, New ListItem("...โปรดเลือก...", ""))



            Dim ddlAuth2 As DropDownList = GridCusNcb.Rows(EditRow).Cells(0).FindControl("ddlAuth2")
            ddlAuth2.DataSource = Auth2SqlDatasource
            ddlAuth2.DataValueField = "EMP_ID"
            ddlAuth2.DataTextField = "EMP_NAME"
            ddlAuth2.DataBind()
            ddlAuth2.Items.Insert(0, New ListItem("...โปรดเลือก...", ""))

            ''====== กำหนดค่าที่เลือกลงใน control และ dropdown  โดยดึงค่าจาก class

            ' Code check input error. 

            If Session("event") = "addfile" Then
                tbCIF.Text = ""
                tbCUS_NCB_DATE.Text = ""
                ddlCusNcbType.SelectedIndex = 0
                ddlDept.SelectedIndex = 0
                ddlCusType.SelectedIndex = 0
                ddlAuth1.SelectedIndex = 0
                ddlAuth2.SelectedIndex = 0
            Else

                Dim aobj As New AnnalsCusNcb
                Dim adal As New AnnalsCusNcbDAL

                aobj.ID = Request.QueryString("id")
                aobj.CIF = tbCIF.Text
                aobj = adal.getAnnalsCusNcbByID(aobj)


                If aobj.CUS_NCB_DATE <> Nothing Then
                    tbCUS_NCB_DATE.Text = aobj.CUS_NCB_DATE
                Else
                    tbCUS_NCB_DATE.Text = ""
                End If



                If aobj.CUS_NCB_TYPE_ID <> Nothing Then
                    For i As Integer = 0 To ddlCusNcbType.Items.Count - 1
                        If ddlCusNcbType.Items(i).Value = aobj.CUS_NCB_TYPE_ID Then
                            ddlCusNcbType.SelectedIndex = i
                            Exit For
                        End If
                    Next
                End If


                SearchCusNcbTypeDetail()
                Dim ddlCusNcbTypeDetail As DropDownList = GridCusNcb.Rows(EditRow).Cells(0).FindControl("ddlCusNcbTypeDetail")


                If aobj.CUS_NCB_TYPE_DETAIL_ID.ToString <> Nothing Then
                    For i As Integer = 0 To ddlCusNcbTypeDetail.Items.Count - 1
                        If ddlCusNcbTypeDetail.Items(i).Value = aobj.CUS_NCB_TYPE_DETAIL_ID.ToString Then
                            ddlCusNcbTypeDetail.SelectedIndex = i
                            Exit For
                        End If
                    Next
                End If

                If aobj.CUS_TYPE_ID <> Nothing Then
                    For i As Integer = 0 To ddlCusType.Items.Count - 1
                        If ddlCusType.Items(i).Value = aobj.CUS_TYPE_ID.ToString Then
                            ddlCusType.SelectedIndex = i
                            Exit For
                        End If
                    Next
                End If

                If aobj.DEPT_ID <> Nothing Then
                    For i As Integer = 0 To ddlDept.Items.Count - 1
                        If ddlDept.Items(i).Value = aobj.DEPT_ID.ToString Then
                            ddlDept.SelectedIndex = i
                            Exit For
                        End If
                    Next
                End If

                If aobj.AUTH_1_ID <> Nothing Then
                    For i As Integer = 0 To ddlAuth1.Items.Count - 1
                        If ddlAuth1.Items(i).Value = aobj.AUTH_1_ID.ToString Then
                            ddlAuth1.SelectedIndex = i
                            Exit For
                        End If
                    Next
                End If

                If aobj.AUTH_2_ID <> Nothing Then
                    For i As Integer = 0 To ddlAuth2.Items.Count - 1
                        If ddlAuth2.Items(i).Value = aobj.AUTH_2_ID.ToString Then
                            ddlAuth2.SelectedIndex = i
                            Exit For
                        End If
                    Next
                End If


                'If ddlCusNcbType.SelectedValue = "3" Then
                '    ' LabelCusExceptType.Visible = True
                '    'ddlCustExceptType.Visible = True
                '    ddlCustExceptType.Attributes.CssStyle.Value = "visibility:visibility"
                '    LabelCusExceptType.Attributes.CssStyle.Value = "visibility:visibility"

                'Else
                '    'LabelCusExceptType.Visible = False
                '    'ddlCustExceptType.Visible = False
                '    LabelCusExceptType.Attributes.CssStyle.Value = "visibility:hidden"
                '    ddlCustExceptType.Attributes.CssStyle.Value = "visibility:hidden"
                'End If

            End If   '      If Session("event") <> "addfile" Then

        End If

        If Err.Description <> "" Then
            Err.Clear()
            alert("หมดเวลาแก้ไขกรุณาปิดหน้านี้")
        End If
    End Sub
    Protected Sub GridCusNcb_DataBound(ByVal sender As Object, ByVal e As System.EventArgs) Handles GridCusNcb.DataBound
        Dim i As Integer
        For i = 0 To GridCusNcb.Rows.Count - 1
            Dim BtnEdit As Image = GridCusNcb.Rows(i).FindControl("BtnEdit")


            Dim tbUser_ID As HiddenField = GridCusNcb.Rows(i).FindControl("tbUser_ID")
            If IsNothing(BtnEdit) = False And IsNothing(tbUser_ID) = False Then
                If tbUser_ID.Value = User.Identity.Name Or HttpCookieUtil.hasRolesId(Context.Request.Cookies(FormsAuthentication.FormsCookieName), RoleIdConst.R_ADMIN) Then
                    BtnEdit.Visible = True

                    If HttpCookieUtil.hasRolesId(Context.Request.Cookies(FormsAuthentication.FormsCookieName), RoleIdConst.A_READ_ONLY) Then
                        ' ถ้ามี Role readonly ให้ไม่โชปุ่ม update
                        BtnEdit.Visible = False
                    Else
                        BtnEdit.Visible = True
                    End If
                Else
                    BtnEdit.Visible = False
                End If
            End If

            ' กำหนด format ให้กับ เลขที่ c/a

            Dim lblid As Label = GridCusNcb.Rows(i).FindControl("lblid")
            If Not lblid Is Nothing Then
                If lblid.Text.Length = 10 Then
                    Dim char1 As String = lblid.Text.Substring(0, 6)
                    Dim char2 As String = CStr(CInt(lblid.Text.Substring(6, 4)) + 543)
                    lblid.Text = char1 & "/" & char2
                End If
            End If
        Next
    End Sub
    Protected Sub GridCusNcb_RowCancelingEdit(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewCancelEditEventArgs) Handles GridCusNcb.RowCancelingEdit
        sql = Session("sql")
        Session("event") = "edit"
        bindGridCusNcb(-1, sql)
    End Sub
    Protected Sub GridCusNcb_RowEditing(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewEditEventArgs) Handles GridCusNcb.RowEditing
        GridCusNcb.SelectedIndex = e.NewEditIndex
        sql = Session("sql")
        bindGridCusNcb(e.NewEditIndex, sql)
    End Sub
    Sub ShowGridCusNcb()

        sql = Session("sql")
        bindGridCusNcb(-1, sql)
    End Sub
    Protected Sub GridCusNcb_PageIndexChanging(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewPageEventArgs) Handles GridCusNcb.PageIndexChanging
        GridCusNcb.PageIndex = e.NewPageIndex
        GridCusNcb.DataSource = Session("GridCusNcb")
        GridCusNcb.DataBind()
    End Sub
    Protected Sub GridCusNcb_RowUpdating(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewUpdateEventArgs) Handles GridCusNcb.RowUpdating

        Dim lblIDeN As HiddenField = GridCusNcb.Rows(e.RowIndex).Cells(0).FindControl("lblIDEN")
        Dim tbCIF As TextBox = GridCusNcb.Rows(e.RowIndex).Cells(0).FindControl("tbCIF")
        'Dim lblCIF As Label = GridCusNcb.Rows(e.RowIndex).Cells(0).FindControl("lblCIF")
        Dim lblCIFName As Label = GridCusNcb.Rows(e.RowIndex).Cells(0).FindControl("lblCIFName")

        Dim ddlDept As DropDownList = GridCusNcb.Rows(e.RowIndex).Cells(0).FindControl("ddlDept")
        Dim ddlCusType As DropDownList = GridCusNcb.Rows(e.RowIndex).Cells(0).FindControl("ddlCustype")

        Dim tbCUS_NCB_DATE As TextBox = GridCusNcb.Rows(e.RowIndex).Cells(0).FindControl("tbCUS_NCB_DATE")
        
        Dim ddlCusNcbType As DropDownList = GridCusNcb.Rows(e.RowIndex).Cells(0).FindControl("ddlCusNcbType")
        Dim ddlCusNcbTypeDetail As DropDownList = GridCusNcb.Rows(e.RowIndex).Cells(0).FindControl("ddlCusNcbTypeDetail")

        Dim LabelCusNcbTypeDetail As Label = GridCusNcb.Rows(e.RowIndex).Cells(0).FindControl("LabelCusNcbTypeDetail")

        Dim ddlAuth1 As DropDownList = GridCusNcb.Rows(e.RowIndex).Cells(0).FindControl("ddlAuth1")
        Dim ddlAuth2 As DropDownList = GridCusNcb.Rows(e.RowIndex).Cells(0).FindControl("ddlAuth2")
      
        Dim tbDetail As TextBox = GridCusNcb.Rows(e.RowIndex).Cells(0).FindControl("tbDetail")



        'Code check input error. 
        If tbCIF.Text = "" Then
            alert("ไม่สามารถบันทึก กรุณาระบุข้อมูล CIF ")
            tbCIF.BackColor = Drawing.Color.Red
            Exit Sub
        Else
            tbCIF.BackColor = Drawing.Color.White
        End If
        If ddlCusType.Items(ddlCusType.SelectedIndex).Value.Length = 0 Then
            alert("ไม่สามารถบันทึก กรุณาระบุข้อมูลประเภทลูกค้า")
            ddlCusType.BackColor = Drawing.Color.Red
            Exit Sub
        Else
            ddlCusType.BackColor = Drawing.Color.White
        End If
        If ddlDept.Items(ddlDept.SelectedIndex).Value.Length = 0 Then
            alert("ไม่สามารถบันทึก กรุณาระบุข้อมูลหน่วยงาน")
            ddlDept.BackColor = Drawing.Color.Red
            Exit Sub
        Else
            ddlDept.BackColor = Drawing.Color.White
        End If
        'MsgBox(ddlCusNcbType.Items(ddlCusNcbType.SelectedIndex).Value)
        If ddlCusNcbType.Items(ddlCusNcbType.SelectedIndex).Value.Length = 0 Then
            alert("ไม่สามารถบันทึก กรุณาระบุข้อมูลการเช็ค NCB")
            ddlCusNcbType.BackColor = Drawing.Color.Red
            Exit Sub
        Else
            ddlCusNcbType.BackColor = Drawing.Color.White
        End If

        If ddlCusNcbTypeDetail.Items(ddlCusNcbTypeDetail.SelectedIndex).Value.Length = 0 Then
            alert("ไม่สามารถบันทึก กรุณาระบุข้อมูลการเช็ค NCB")
            ddlCusNcbTypeDetail.BackColor = Drawing.Color.Red
            Exit Sub
        Else
            ddlCusNcbTypeDetail.BackColor = Drawing.Color.White
        End If
        ' ถ้าเป็นเรื่องยกเว้นต้องกรอกผู้อนุมัต
        ' แต่ถ้าเป็น บมจ  รหัส 4 ไม่จำเป็นต้องมีผู้อนุมัต
        ' หรือถ้าเป็น สถาบันการเงิน , สหกรณ์, หน่วยงานราชการ , รัฐวิสาหกิจ  ไม่ต้องมีผู้อนุมัต
        If ddlCusNcbType.Items(ddlCusNcbType.SelectedIndex).Value = "3" And _
            (ddlCusNcbTypeDetail.Items(ddlCusNcbTypeDetail.SelectedIndex).Value <> "4" And _
              ddlCusNcbTypeDetail.Items(ddlCusNcbTypeDetail.SelectedIndex).Value <> "5") Then
            If ddlAuth1.Items(ddlAuth1.SelectedIndex).Value.Length = 0 Then
                alert("ไม่สามารถบันทึก กรุณาระบุผู้อนุมัติ 1")
                ddlAuth1.BackColor = Drawing.Color.Red
                Exit Sub
            Else
                ddlAuth1.BackColor = Drawing.Color.White
            End If
            If ddlAuth2.Items(ddlAuth2.SelectedIndex).Value.Length = 0 Then
                alert("ไม่สามารถบันทึก กรุณาระบุผู้อนุมัติ 2")
                ddlAuth2.BackColor = Drawing.Color.Red
                Exit Sub
            Else
                ddlAuth2.BackColor = Drawing.Color.White
            End If

        End If
        If tbCUS_NCB_DATE.Text <> "" Then
            If IsDate(tbCUS_NCB_DATE.Text) = False Then
                alert("ไม่สามารถบันทึก กรุณาระบุวันที่")
                tbCUS_NCB_DATE.BackColor = Drawing.Color.Red
                Exit Sub
            Else
                tbCUS_NCB_DATE.BackColor = Drawing.Color.White
            End If
        Else
              alert("กรุณาระบุวันที่")
            tbCUS_NCB_DATE.BackColor = Drawing.Color.White
            Exit Sub

        End If

            Dim id = Request.QueryString("id")
            Dim dal As New AnnalsCusNcbDAL    ' Create object dal
            Dim obj As New AnnalsCusNcb  ' Create object

            obj.ID = id
            obj.CIF = tbCIF.Text


        obj.CUS_NCB_DATE = tbCUS_NCB_DATE.Text

        If ddlCusType.Items(ddlCusType.SelectedIndex).Value <> "" Then
            obj.CUS_TYPE_ID = ddlCusType.Items(ddlCusType.SelectedIndex).Value
        Else
            obj.CUS_TYPE_ID = 0
        End If

        If ddlDept.Items(ddlDept.SelectedIndex).Value <> "" Then
            obj.DEPT_ID = ddlDept.Items(ddlDept.SelectedIndex).Value
        Else
            obj.DEPT_ID = 0
        End If

        If ddlCusNcbType.Items(ddlCusNcbType.SelectedIndex).Value <> "" Then
            obj.CUS_NCB_TYPE_ID = ddlCusNcbType.Items(ddlCusNcbType.SelectedIndex).Value
        Else
            obj.CUS_NCB_TYPE_ID = 0
        End If
        'MsgBox(ddlCusNcbTypeDetail.Items(ddlCusNcbTypeDetail.SelectedIndex).Value)
        If ddlCusNcbTypeDetail.Items(ddlCusNcbTypeDetail.SelectedIndex).Value <> "" Then
            obj.CUS_NCB_TYPE_DETAIL_ID = ddlCusNcbTypeDetail.Items(ddlCusNcbTypeDetail.SelectedIndex).Value
        Else
            obj.CUS_NCB_TYPE_DETAIL_ID = 0
        End If

        If ddlAuth1.Items(ddlAuth1.SelectedIndex).Value <> "" Then
            obj.AUTH_1_ID = ddlAuth1.Items(ddlAuth1.SelectedIndex).Value
        Else
            obj.AUTH_1_ID = 0
        End If

        If ddlAuth2.Items(ddlAuth2.SelectedIndex).Value <> "" Then
            obj.AUTH_2_ID = ddlAuth2.Items(ddlAuth2.SelectedIndex).Value
        Else
            obj.AUTH_2_ID = 0
        End If

        obj.DETAIL = tbDetail.Text


        ' ค้นหาข้อมูลถ้ายังไม่มีให้เพิ่ม
        Dim objN As AnnalsCusNcb = dal.getAnnalsCusNcbByID(obj)


        'MsgBox("id=" & objN.ID)
        If objN.ID = Nothing Then
            ' If Session("event") = "addfile" Then
            'If objN.ID <> Nothing Then
            '    alert("ไม่สามารถบันทึกข้อมูล มี cif นี้แล้ว")
            '    Exit Sub
            'End If

            dal.insertAnnalsCusNcb(obj)
            alert("Add  complete ( เพิ่มข้อมูลเรียบร้อย)")
        Else
            dal.updateAnnalsCusNcb(obj)
            alert("Update  complete ( บันทึกข้อมูลเรียบร้อย )")
        End If
        ''MsgBox(Session("event"))
        'If LCase(Session("event")) = "addfile" Then
        '    dal.insertAnnalsCusNcb(obj)
        '    alert("Add  complete ( เพิ่มข้อมูลเรียบร้อย)")
        'Else
        '    dal.updateAnnalsCusNcb(obj)
        '    alert("Update  complete ( บันทึกข้อมูลเรียบร้อย )")
        'End If
        Session("event") = ""
        ShowGridCusNcb() ' Show grid data.
        ' Catch ex As Exception
        'message.Text = ex.Message
        'End Try
    End Sub
    Protected Sub GridCusNcb_RowDeleting(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewDeleteEventArgs) Handles GridCusNcb.RowDeleting

        'Dim lblIDEN As HiddenField = GridCusNcb.Rows(e.RowIndex).Cells(0).FindControl("lblIDEN")
        Dim tbcif As TextBox = GridCusNcb.Rows(e.RowIndex).Cells(0).FindControl("tbCIF")
        Dim id = Request.QueryString("id")
        Dim obj As New AnnalsCusNcb  ' Create object
        obj.ID = id
        obj.CIF = tbcif.Text
        Dim dal As New AnnalsCusNcbDAL
        dal.deleteAnnalsCusNcb(obj)
        message.Text = "Delete   complete"
        alert(message.Text)
        ShowGridCusNcb() ' Show grid data.
    End Sub
    Protected Sub GridCusNcb_RowCommand(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewCommandEventArgs) Handles GridCusNcb.RowCommand
        ' remark  การค้นหา covenant ครั้งล่าสุดไว้
        'Exit Sub
        ' MsgBox("x")
        If e.CommandName = "SearchCIF" Then  ' ถ้าเป้นการกดปุ่มแว่นขยาย (ค้นหา)
            If GridCusNcb.Rows.Count >= 0 Then
                GridCusNcb.SelectedIndex = 0

                Dim tbCIF As TextBox = GridCusNcb.Rows(GridCusNcb.SelectedIndex).Cells(0).FindControl("tbCIF")
                Dim lblIDeN As HiddenField = GridCusNcb.Rows(GridCusNcb.SelectedIndex).Cells(0).FindControl("lblIDEN")
                Dim lblCIFName As Label = GridCusNcb.Rows(GridCusNcb.SelectedIndex).Cells(0).FindControl("lblCIFName")
                'Dim tbDetail As TextBox = GridCusNcb.Rows(GridCusNcb.SelectedIndex).Cells(0).FindControl("tbDetail")
                'Dim tbRemark As TextBox = GridCusNcb.Rows(GridCusNcb.SelectedIndex).Cells(0).FindControl("tbRemark")
                'Dim tbDeadLine_Date As TextBox = GridCusNcb.Rows(GridCusNcb.SelectedIndex).Cells(0).FindControl("tbDeadLine_Date")
                'Dim tbAction_Date As TextBox = GridCusNcb.Rows(GridCusNcb.SelectedIndex).Cells(0).FindControl("tbAction_Date")
                'Dim tbUSER_UPDATE_DATE As TextBox = GridCusNcb.Rows(GridCusNcb.SelectedIndex).Cells(0).FindControl("tbUSER_UPDATE_DATE")
                'Dim ddlCOVENANT_TYPE As DropDownList = GridCusNcb.Rows(GridCusNcb.SelectedIndex).Cells(0).FindControl("ddlCOVENANT_TYPE")
                'Dim ddlCOVENANT_DETAIL As DropDownList = GridCusNcb.Rows(GridCusNcb.SelectedIndex).Cells(0).FindControl("ddlCOVENANT_DETAIL")
                'Dim ddlCovenantAction As DropDownList = GridCusNcb.Rows(GridCusNcb.SelectedIndex).Cells(0).FindControl("ddlCovenantAction")
                'Dim tbID As TextBox = GridCusNcb.Rows(GridCusNcb.SelectedIndex).Cells(0).FindControl("tbID")
                'Dim tbUser_ID As HiddenField = GridCusNcb.Rows(GridCusNcb.SelectedIndex).Cells(0).FindControl("tbUser_ID")

                If Not tbCIF Is Nothing Then

                    If tbCIF.Text <> "" Then
                        Dim dal1 As New CustomerDAL
                        Dim obj1 As New Customer
                        obj1.CIF = tbCIF.Text
                        obj1 = dal1.getCustomerByCIF(obj1)
                        If obj1.CUS_FIRST = "" Then
                            lblCIFName.Text = ""
                            Exit Sub
                        Else
                            lblCIFName.Text = obj1.CUS_TITLE & " " & obj1.CUS_FIRST & " " & obj1.CUS_LAST
                        End If

                        'If lblCIFName.Text <> "" Then '  กรณีค้นหาแล้วพบชื่อลูกค้า

                        '    Dim dalC As New VAnnalsCovenantDAL
                        '    Dim objC As New VAnnalsCovenant
                        '    objC.CIF = CInt(tbCIF.Text)
                        '    objC = dalC.getVAnnalsCovenantByCIF(objC)
                        '    tbDetail.Text = objC.DETAIL
                        '    tbRemark.Text = objC.REMARK
                        '    tbDeadLine_Date.Text = objC.DEADLINE_DATE
                        '    tbAction_Date.Text = objC.ACTION_DATE
                        '    ' ค้นหา covenant type ที่เลือกไว้
                        '    For i = 0 To ddlCOVENANT_TYPE.Items.Count - 1
                        '        If objC.COVENANT_TYPE_ID = ddlCOVENANT_TYPE.Items(i).Value Then
                        '            ddlCOVENANT_TYPE.SelectedIndex = i
                        '            Exit For
                        '        End If
                        '    Next

                        '    For i = 0 To ddlCovenantAction.Items.Count - 1
                        '        If objC.COVENANT_ACTION_ID = ddlCovenantAction.Items(i).Value Then
                        '            ddlCovenantAction.SelectedIndex = i
                        '            Exit For
                        '        End If
                        '    Next
                        'End If


                    End If
                End If

            End If
        End If
    End Sub
    Protected Sub SearchCusNcbTypeDetail()
        If GridCusNcb.SelectedIndex < 0 Then
            GridCusNcb.SelectedIndex = 0
        End If
        Dim ddlCusNcbType As DropDownList = GridCusNcb.Rows(GridCusNcb.SelectedIndex).FindControl("ddlCusNcbType")
        Dim ddlCusNcbTypeDetail As DropDownList = GridCusNcb.Rows(GridCusNcb.SelectedIndex).FindControl("ddlCusNcbTypeDetail")
        Dim ddlAuth1 As DropDownList = GridCusNcb.Rows(GridCusNcb.SelectedIndex).FindControl("ddlAuth1")
        Dim ddlAuth2 As DropDownList = GridCusNcb.Rows(GridCusNcb.SelectedIndex).FindControl("ddlAuth2")


        If ddlCusNcbType.Items(ddlCusNcbType.SelectedIndex).Value <> "" Then
            Dim cusNcbTypeID = ddlCusNcbType.Items(ddlCusNcbType.SelectedIndex).Value
            '  MsgBox(cusNcbTypeID)
            Dim dalAnnalsCusNcbTypeDetail As New AnnalsCusNcbTypeDetailDAL
            Dim arrAnnalsCusNcbTypeDetail As New List(Of AnnalsCusNcbTypeDetail)
            arrAnnalsCusNcbTypeDetail = dalAnnalsCusNcbTypeDetail.getListAnnalsCusNcbTypeDetail(CInt(cusNcbTypeID))
            ' MsgBox(arrAnnalsCusNcbTypeDetail.Count)
            'MsgBox(ddlCusNcbTypeDetail.ID)
            ddlCusNcbTypeDetail.DataSource = arrAnnalsCusNcbTypeDetail
            ddlCusNcbTypeDetail.DataTextField = "CUS_NCB_TYPE_DETAIL"
            ddlCusNcbTypeDetail.DataValueField = "CUS_NCB_TYPE_DETAIL_ID"
            ddlCusNcbTypeDetail.DataBind()

            If ddlCusNcbTypeDetail.Items.Count > 1 Then
                ddlCusNcbTypeDetail.Items.Insert(0, New ListItem("...โปรดเลือก...", ""))
            End If
        Else
            ddlCusNcbTypeDetail.Items.Clear()
        End If
        If ddlCusNcbType.Items(ddlCusNcbType.SelectedIndex).Value = "3" Then
            ddlAuth1.Enabled = True
            ddlAuth2.Enabled = True
        Else
            ddlAuth1.Enabled = False
            ddlAuth2.Enabled = False
        End If
    End Sub
    

    Protected Sub GridCusNcb_RowDataBound(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewRowEventArgs) Handles GridCusNcb.RowDataBound
        If e.Row.RowType = DataControlRowType.DataRow Then
            Dim LabelCusTypeDetail As Label = e.Row.FindControl("LabelCusTypeDetail")
            If Not LabelCusTypeDetail Is Nothing Then
                If LabelCusTypeDetail.Text = String.Empty Then
                    'e.Row.Attributes.Add("Style", "background-color:#FF..2211; font-weight: bold;")
                    e.Row.BackColor = Drawing.Color.Red
                End If
            End If

        End If
    End Sub

End Class
