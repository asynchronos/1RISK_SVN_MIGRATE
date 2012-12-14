Imports System.Collections.Generic
Imports System.Globalization
Partial Class _AnnalsCovenant
    Inherits System.Web.UI.Page

    Public user_id As String
    Public id As String
    Protected cul As New CultureInfo("th-TH") ' ปี ไทย  
    Dim sql As String

    Protected Sub alert(ByVal str As String)
        'Response.Clear()
        'Response.Write("<script language=""javascript"">alert(""" & str & """)</script>")
        str = "alert(""" & str & """);"
        Page.ClientScript.RegisterStartupScript(Me.GetType(), "messagebox", str, True)

    End Sub
    Sub bindDropDown()


        Dim dalCOVENANT_TYPE As New AnnalsCovenantTypeDAL
        Dim arrCOVENANT_TYPE As New List(Of AnnalsCovenantType)
        arrCOVENANT_TYPE = dalCOVENANT_TYPE.getAllAnnalsCovenantType
        Session("arrCOVENANT_TYPE") = arrCOVENANT_TYPE

        Dim ddlCovenantAction As New AnnalsCovenantActionDAL
        Dim arrCovenantAction As New List(Of AnnalsCovenantAction)
        arrCovenantAction = ddlCovenantAction.getAllAnnalsCovenantAction
        Session("arrCovenantAction") = arrCovenantAction

        Dim ddlNextCovenantAction As New AnnalsCovenantNextActionDAL
        Dim arrNextCovenantAction As New List(Of AnnalsCovenantNextAction)
        arrNextCovenantAction = ddlNextCovenantAction.getAllAnnalsCovenantNextAction
        Session("arrNextCovenantAction") = arrNextCovenantAction



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
            user_id = Request.QueryString("user_id").Trim
            If user_id = "" Then
                alert(" No user id")
                closeWindow()
                Exit Sub
            End If
        End If


        If Page.IsPostBack = False Then
            bindDropDown()
            'Dim sql As String = "Select  *  from  V_ANNALS_COVENANT  where  ID='" & annals_id & "' order by id"
            Dim sql As String = "Select  *  from  V_ANNALS_COVENANT "

            Dim dal As New VAnnalsCovenantDAL
            Dim strCIF As String = Nothing


            If Request("groupid") <> "" Then
                ' ค้นหา cif จาก groupid ที่มาจากหน้า  smeCustomerDetail.aspx
                strCIF = dal.getGroupCIF(Request("groupid"))
                strCIF = strCIF.Remove(strCIF.Length - 1)
                sql += " Where cif  in (" & strCIF & ")"
                msg.Text = "Reference  CIF  (" & strCIF & ")"
            End If
            If Request("cif") <> "" And Request("id") <> "" Then ' กรณีที่มาจากหน้า credit detail
                sql = " SELECT *  FROM V_ANNALS_COVENANT   "
                sql += " WHERE GROUP_ID IN "
                sql += "(SELECT GROUP_ID FROM CUSTOMER_SME WHERE CIF IN "
                sql += " (" & Request("cif") & "))"
                sql += " or   id='" & Request("id") & "'"
                msg.Text = "Reference  C/A (" & Request("id") & ") " & "  CIF  (" & Request("cif") & ")"
            ElseIf Not Request("cif") Is Nothing Then
                strCIF = dal.getGroupCIF(dal.getGroupIDFromCIF(Request("cif")))
                If strCIF <> "" Then
                    strCIF = strCIF.Remove(strCIF.Length - 1)
                    sql += " Where cif  in (" & strCIF & ")"
                    msg.Text = "Reference  CIF  Group (" & strCIF & ")"
                End If
            ElseIf Request("id") <> "" Then ' กรณีมาจากหน้าค้นหา ca
                sql = " SELECT *  FROM V_ANNALS_COVENANT   "
                sql += " WHERE GROUP_ID IN "
                sql += "(SELECT GROUP_ID FROM CUSTOMER_SME WHERE CIF IN "
                sql += "(SELECT CIF FROM ANNALS_CREDIT_ACCOUNT WHERE ID='" & Request("id") & "'))"
                sql += " or   id='" & Request("id") & "'"
                msg.Text = "Reference  C/A (" & Request("id") & ")"

            End If

            Session("sql") = sql
            ShowGridCovenant()
            ' สามารถเพิ่ม covenant ผ่านหน้า credit  เท่านั้น  หรือ ผู้ที่มี role readonly ไม่สามารถเพิ่มได้
            If Request("update") <> "true" Or _
                HttpCookieUtil.hasRolesId(Context.Request.Cookies(FormsAuthentication.FormsCookieName), RoleIdConst.A_READ_ONLY) Then
                btnAddNew.Visible = False
            Else
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

        sql = "SELECT '' as IDEN" & _
      ",'' as CIF" & _
      ",'' as Cifname" & _
      ",'' as COVENANT_TYPE_ID" & _
      ",'' as COVENANT_TYPE" & _
      ",'' as DETAIL" & _
      ",'' as CREATE_DATE" & _
      ",'' as DEADLINE_DATE" & _
      ",'' as COVENANT_ACTION_ID" & _
      ",'' as COVENANT_ACTION" & _
      ",'' as REMARK" & _
      ",'' as ACTION_DATE" & _
      ",'' as USER_ID" & _
      ",'' as USER_UPDATE_DATE" & _
      ",'' as EMP_NAME" & _
      ",'' as ID" & _
      ",'' as NEXT_COVENANT_ACTION_ID" & _
      ",'' as NEXT_COVENANT_ACTION" & _
      ",'' as NEXT_ACTION_DATE" & _
      ",'' as BREACH_DATE" & _
      ",'' as WAVE_FLAG" & _
      ",'' as WAVE_DATE"

        bindGridCovenant(0, sql)
        GridCovenant.SelectedIndex = 0
    End Sub
    Sub bindGridCovenant(ByVal EditRow As Integer, ByVal SQL As String)

        ' On Error Resume Next

        ' ใช้ sub นี้ทั้งการ insert และ edit
        Dim dal As New VAnnalsCovenantDAL
        Dim arr As New List(Of VAnnalsCovenant)
        arr = dal.getAllVAnnalsCovenantBySQL(SQL)
        Session("GridCovenant") = arr
        GridCovenant.EditIndex = EditRow
        GridCovenant.DataSource = arr

        ' GridCovenant.Columns(3).Visible = False
        'GridCovenant.Columns(4).Visible = False

        'GridCovenant.Columns(9).Visible = False
        'GridCovenant.Columns(8).Visible = False

        'If EditRow < 0 Then
        '    GridCovenant.Columns(9).Visible = True
        'Else
        '    GridCovenant.Columns(9).Visible = False
        'End If
        GridCovenant.DataBind()

        '' ===============หา control

        If EditRow >= 0 Then  ' === กรณีที่เป็นการแก้ไข rowindex  >=0

            Dim lblIDEN As HiddenField = GridCovenant.Rows(EditRow).Cells(0).FindControl("lblIDEN")
            Dim tbCIF As TextBox = GridCovenant.Rows(EditRow).Cells(0).FindControl("tbCIF")
            Dim tbDETAIL As TextBox = GridCovenant.Rows(EditRow).Cells(0).FindControl("tbDETAIL")
            'Dim tbRemark As TextBox = GridCovenant.Rows(EditRow).Cells(0).FindControl("tbRemark")

            Dim tbUser_ID As HiddenField = GridCovenant.Rows(EditRow).Cells(0).FindControl("tbUser_ID")
            Dim tbEMP_NAME As TextBox = GridCovenant.Rows(EditRow).Cells(0).FindControl("tbEMP_NAME")
            Dim tbID As TextBox = GridCovenant.Rows(EditRow).Cells(0).FindControl("tbID")


            Dim tbDeadLine_Date As TextBox = GridCovenant.Rows(EditRow).Cells(0).FindControl("tbDeadLine_Date")
            Dim tbAction_Date As TextBox = GridCovenant.Rows(EditRow).Cells(0).FindControl("tbAction_Date")
            Dim tbNext_Action_Date As TextBox = GridCovenant.Rows(EditRow).Cells(0).FindControl("tbNEXT_ACTION_DATE")

            Dim tbBreach_DATE As TextBox = GridCovenant.Rows(EditRow).FindControl("tbBreach_DATE")
            Dim ddlWAVE_FLAG As DropDownList = GridCovenant.Rows(EditRow).Cells(0).FindControl("ddlWAVE_FLAG")
            Dim tbWAVE_DATE As TextBox = GridCovenant.Rows(EditRow).FindControl("tbWAVE_DATE")



            Dim tbUSER_UPDATE_DATE As TextBox = GridCovenant.Rows(EditRow).Cells(0).FindControl("tbUSER_UPDATE_DATE")

            'Dim tbCreate_date As TextBox = GridCovenant.Rows(EditRow).Cells(0).FindControl("tbCreate_date")
            'tbCreate_date.Enabled = False
            Dim BtnDelete As ImageButton = GridCovenant.Rows(EditRow).Cells(0).FindControl("BtnDelete")
            BtnDelete.Attributes.Add("onclick", "return confirm_delete();")

            Dim chkNoDEADLINE_DATE As CheckBox = GridCovenant.Rows(EditRow).Cells(0).FindControl("chkNoDEADLINE_DATE")
            chkNoDEADLINE_DATE.Attributes.Add("onclick", "chkDeadLineValue(this,'" & tbDeadLine_Date.ClientID & "')")

            If HttpCookieUtil.hasRolesId(Context.Request.Cookies(FormsAuthentication.FormsCookieName), RoleIdConst.R_ADMIN) Then
                BtnDelete.Visible = True
            Else
                BtnDelete.Visible = False
            End If

            ' กำหนดให้ แก้ไขค่าจากระบบ ไม่ได้

            tbID.Enabled = False
            tbUSER_UPDATE_DATE.Enabled = False
            tbEMP_NAME.Enabled = False


            Dim BtnUpdate As ImageButton = GridCovenant.Rows(EditRow).Cells(0).FindControl("BtnUpdate")
            BtnUpdate.Attributes.Add("onclick", "return confirm_update();")

            If LCase(Session("event")) = "addfile" Then
                tbID.Text = id
                tbUser_ID.Value = user_id
                tbDeadLine_Date.Text = ""
                tbAction_Date.Text = ""
                tbUSER_UPDATE_DATE.Text = ""
            Else
                Dim ImageButton1 As Image = GridCovenant.Rows(EditRow).FindControl("ImageButton1")
                ImageButton1.Visible = False
                tbCIF.ReadOnly = True

            End If


            Dim ddlCOVENANT_TYPE As DropDownList = GridCovenant.Rows(EditRow).Cells(0).FindControl("ddlCOVENANT_TYPE")
            ddlCOVENANT_TYPE.DataSource = Session("arrCOVENANT_TYPE")
            ddlCOVENANT_TYPE.DataValueField = "COVENANT_TYPE_ID"
            ddlCOVENANT_TYPE.DataTextField = "COVENANT_TYPE"
            ddlCOVENANT_TYPE.DataBind()
            ddlCOVENANT_TYPE.Items.Insert(0, New ListItem("โปรดเลือก", ""))


            Dim ddlCovenantAction As DropDownList = GridCovenant.Rows(EditRow).Cells(0).FindControl("ddlCovenantAction")
            ddlCovenantAction.DataSource = Session("arrCovenantAction")
            ddlCovenantAction.DataValueField = "COVENANT_ACTION_ID"
            ddlCovenantAction.DataTextField = "COVENANT_ACTION"
            ddlCovenantAction.DataBind()

            Dim ddlNextCovenantAction As DropDownList = GridCovenant.Rows(EditRow).Cells(0).FindControl("ddlNextCovenantAction")
            ddlNextCovenantAction.DataSource = Session("arrNextCovenantAction")
            ddlNextCovenantAction.DataValueField = "NEXT_COVENANT_ACTION_ID"
            ddlNextCovenantAction.DataTextField = "NEXT_COVENANT_ACTION"
            ddlNextCovenantAction.DataBind()





            ''====== กำหนดค่าที่เลือกลงใน control และ dropdown  โดยดึงค่าจาก class

            ' Code check input error. 

            Dim aobj As New AnnalsCovenant  ' Create object 
            Dim adal As New AnnalsCovenantDAL

            aobj.IDEN = CInt(lblIDEN.Value)

            aobj = adal.getAnnalsCovenantByIDEN(aobj)


            For i As Integer = 0 To ddlCOVENANT_TYPE.Items.Count - 1
                If ddlCOVENANT_TYPE.Items(i).Value = aobj.COVENANT_TYPE_ID Then
                    ddlCOVENANT_TYPE.SelectedIndex = i
                    Exit For
                End If
            Next

            SearchCovenant()
            Dim ddlCOVENANT_DETAIL As DropDownList = GridCovenant.Rows(EditRow).Cells(0).FindControl("ddlCOVENANT_DETAIL")
            'MsgBox(aobj.COVENANT_DETAIL_ID)
            For i As Integer = 0 To ddlCOVENANT_DETAIL.Items.Count - 1
                'MsgBox(ddlCOVENANT_DETAIL.Items(i).Value)
                If ddlCOVENANT_DETAIL.Items(i).Value = aobj.COVENANT_DETAIL_ID Then
                    ddlCOVENANT_DETAIL.SelectedIndex = i

                    Exit For
                End If
            Next


            For i As Integer = 0 To ddlCovenantAction.Items.Count - 1
                If ddlCovenantAction.Items(i).Value = aobj.COVENANT_ACTION_ID Then
                    ddlCovenantAction.SelectedIndex = i
                    Exit For
                End If
            Next

            For i As Integer = 0 To ddlNextCovenantAction.Items.Count - 1
                If ddlNextCovenantAction.Items(i).Value = aobj.NEXT_COVENANT_ACTION_ID Then
                    ddlNextCovenantAction.SelectedIndex = i
                    Exit For
                End If
            Next


            For i As Integer = 0 To ddlWAVE_FLAG.Items.Count - 1
                If ddlWAVE_FLAG.Items(i).Value = aobj.WAVE_FLAG Then
                    ddlWAVE_FLAG.SelectedIndex = i
                    Exit For
                End If
            Next

            tbBreach_DATE.Text = aobj.BREACH_DATE
            tbWAVE_DATE.Text = aobj.WAVE_DATE

            If LCase(Session("event")) <> "addfile" Then


                ' กรณีเกินระยะเวลาแก้ไข จะทำการ ปิดช่องกรอกข้อมูลต่าง  ๆ ไม่ให้กรอกได้ แต่ สามารถยกเลิกได้

                Dim hdfCREATE_DATE As HiddenField = GridCovenant.Rows(EditRow).FindControl("hdfCREATE_DATE")
                Dim LblMsgEdit As Label = GridCovenant.Rows(EditRow).FindControl("LblMsgEdit")
                Dim CalImageBt As ImageButton = GridCovenant.Rows(EditRow).FindControl("CalImageBt")

                If Not hdfCREATE_DATE Is Nothing Then
                    Dim createDate As Date = New Date(Year(hdfCREATE_DATE.Value), Month(hdfCREATE_DATE.Value), Day(hdfCREATE_DATE.Value), 0, 0, 0, cul.Calendar)
                    If (DateDiff(DateInterval.Day, createDate, Date.Now)) > 7 Then


                        tbDETAIL.Enabled = False
                        'tbDeadLine_Date.Enabled = False
                        'CalImageBt.Enabled = False
                        'chkNoDEADLINE_DATE.Enabled = False
                        ddlCOVENANT_TYPE.Enabled = False
                        ddlCOVENANT_DETAIL.Enabled = False
                        ' LblMsgEdit.Text = "เกินระยะเวลาแก้ไข ยกเลิกได้เท่านั้น"

                    End If
                End If
            End If  '   If LCase(Session("event")) <> "addfile" Then


        End If

        If Err.Description <> "" Then
            Err.Clear()
            alert("หมดเวลาแก้ไขกรุณาปิดหน้านี้")
        End If
    End Sub
    Protected Sub GridCovenant_DataBound(ByVal sender As Object, ByVal e As System.EventArgs) Handles GridCovenant.DataBound
        Dim i As Integer
        For i = 0 To GridCovenant.Rows.Count - 1
            Dim BtnEdit As Image = GridCovenant.Rows(i).FindControl("BtnEdit")

            '  กำหนดขนาดให้ detail 
            Dim tbDetail As TextBox = GridCovenant.Rows(i).FindControl("tbDetail")
            Dim tbRemark As TextBox = GridCovenant.Rows(i).FindControl("tbRemark")

            If tbDetail.Text.ToString.Length > 40 Then
                tbDetail.Rows = tbDetail.Text.ToString.Length / 40
                tbDetail.BackColor = GridCovenant.Rows(i).BackColor
            End If
            If tbDetail.Rows < 5 Then tbDetail.Rows = 5
            tbRemark.Rows = tbDetail.Rows

            Dim tbUser_ID As HiddenField = GridCovenant.Rows(i).FindControl("tbUser_ID")
            If IsNothing(BtnEdit) = False And IsNothing(tbUser_ID) = False Then
                ' MsgBox("user_id=" & tbUser_ID.Value.Trim & "; iden=" & User.Identity.Name.Trim)

                'If tbUser_ID.Value.Trim = User.Identity.Name.Trim Or HttpCookieUtil.hasRolesId(Context.Request.Cookies(FormsAuthentication.FormsCookieName), RoleIdConst.R_ADMIN) Then
                '    BtnEdit.Visible = True

                If HttpCookieUtil.hasRolesId(Context.Request.Cookies(FormsAuthentication.FormsCookieName), RoleIdConst.A_READ_ONLY) Then
                    ' ถ้ามี Role readonly ให้ไม่โชปุ่ม update
                    BtnEdit.Visible = False
                Else
                    BtnEdit.Visible = True
                End If
                'Else
                '    '    BtnEdit.Visible = False
                'End If
            End If

            ' กำหนด format ให้กับ เลขที่ c/a

            Dim lblid As Label = GridCovenant.Rows(i).FindControl("lblid")
            If Not lblid Is Nothing Then
                If lblid.Text.Length = 10 Then
                    Dim char1 As String = lblid.Text.Substring(0, 6)
                    Dim char2 As String = CStr(CInt(lblid.Text.Substring(6, 4)) + 543)
                    lblid.Text = char1 & "/" & char2
                End If
            End If
        Next
    End Sub
    Protected Sub GridCovenant_RowCancelingEdit(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewCancelEditEventArgs) Handles GridCovenant.RowCancelingEdit
        sql = Session("sql")
        Session("event") = "edit"
        bindGridCovenant(-1, sql)
    End Sub
    Protected Sub GridCovenant_RowEditing(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewEditEventArgs) Handles GridCovenant.RowEditing
        GridCovenant.SelectedIndex = e.NewEditIndex
        sql = Session("sql")
        bindGridCovenant(e.NewEditIndex, sql)
    End Sub
    Sub ShowGridCovenant()

        sql = Session("sql")
        bindGridCovenant(-1, sql)
    End Sub
    Protected Sub GridCovenant_PageIndexChanging(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewPageEventArgs) Handles GridCovenant.PageIndexChanging
        GridCovenant.PageIndex = e.NewPageIndex
        GridCovenant.DataSource = Session("GridCovenant")
        GridCovenant.DataBind()
    End Sub
    Protected Sub GridCovenant_RowUpdating(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewUpdateEventArgs) Handles GridCovenant.RowUpdating

        Dim lblIDeN As HiddenField = GridCovenant.Rows(e.RowIndex).Cells(0).FindControl("lblIDEN")
        Dim tbCIF As TextBox = GridCovenant.Rows(e.RowIndex).Cells(0).FindControl("tbCIF")
        Dim lblCIFName As Label = GridCovenant.Rows(e.RowIndex).Cells(0).FindControl("lblCIFName")
        Dim tbDetail As TextBox = GridCovenant.Rows(e.RowIndex).Cells(0).FindControl("tbDetail")
        Dim tbRemark As TextBox = GridCovenant.Rows(e.RowIndex).Cells(0).FindControl("tbRemark")
        Dim tbDeadLine_Date As TextBox = GridCovenant.Rows(e.RowIndex).Cells(0).FindControl("tbDeadLine_Date")
        Dim tbAction_Date As TextBox = GridCovenant.Rows(e.RowIndex).Cells(0).FindControl("tbAction_Date")
        Dim tbUSER_UPDATE_DATE As TextBox = GridCovenant.Rows(e.RowIndex).Cells(0).FindControl("tbUSER_UPDATE_DATE")

        Dim ddlCOVENANT_TYPE As DropDownList = GridCovenant.Rows(e.RowIndex).Cells(0).FindControl("ddlCOVENANT_TYPE")
        Dim ddlCOVENANT_DETAIL As DropDownList = GridCovenant.Rows(e.RowIndex).Cells(0).FindControl("ddlCOVENANT_DETAIL")
        Dim ddlCovenantAction As DropDownList = GridCovenant.Rows(e.RowIndex).Cells(0).FindControl("ddlCovenantAction")

        Dim chkNoDEADLINE_DATE As CheckBox = GridCovenant.Rows(e.RowIndex).Cells(0).FindControl("chkNoDEADLINE_DATE")
        ' เพิ่มการเก็บวันที่ action ครั้งต่อไป
        Dim ddlNextCovenantAction As DropDownList = GridCovenant.Rows(e.RowIndex).FindControl("ddlNextCovenantAction")
        Dim tbNextAction_Date As TextBox = GridCovenant.Rows(e.RowIndex).FindControl("tbNEXT_ACTION_DATE")

        Dim tbBreach_DATE As TextBox = GridCovenant.Rows(e.RowIndex).FindControl("tbBreach_DATE")
        Dim ddlWAVE_FLAG As DropDownList = GridCovenant.Rows(e.RowIndex).Cells(0).FindControl("ddlWAVE_FLAG")
        Dim tbWAVE_DATE As TextBox = GridCovenant.Rows(e.RowIndex).FindControl("tbWAVE_DATE")


        Dim tbID As TextBox = GridCovenant.Rows(e.RowIndex).Cells(0).FindControl("tbID")
        Dim tbUser_ID As HiddenField = GridCovenant.Rows(e.RowIndex).Cells(0).FindControl("tbUser_ID")
        'Code check input error. 

        If tbCIF.Text = "" Or lblCIFName.Text = "" Then
            alert("ไม่สามารถบันทึก กรุณาระบุ CIF")
            'alert(message.Text)
            Exit Sub
        End If
        If ddlCOVENANT_TYPE.SelectedValue = "" Then
            alert("ไม่สามารถบันทึก กรุณาระบุ ประเภทConvenant")
            'alert(message.Text)
            Exit Sub
        End If

        If ddlCovenantAction.Items(ddlCovenantAction.SelectedIndex).Value = "3" Then

            If tbBreach_DATE.Text = "" Then
                alert("ไม่สามารถบันทึก กรุณาระบุ วันที่ผิดเงื่อนไข (Branch Date) ")
                tbBreach_DATE.BackColor = Drawing.Color.Red
                Exit Sub
            Else
                If IsDate(tbBreach_DATE.Text) = False Then
                    alert("ไม่สามารถบันทึก กรุณาระบุ วันที่ผิดเงื่อนไข (Branch Date) ให้ถูกต้อง ")
                    tbBreach_DATE.BackColor = Drawing.Color.Red
                    Exit Sub
                End If
            End If
            If ddlWAVE_FLAG.Items(ddlWAVE_FLAG.SelectedIndex).Value = "" Then
                alert("ไม่สามารถบันทึก กรุณาระบุ มีการขอยกเว้น (Wave Flag)  ")
                ddlWAVE_FLAG.BackColor = Drawing.Color.Red
                Exit Sub
            ElseIf ddlWAVE_FLAG.Items(ddlWAVE_FLAG.SelectedIndex).Value = "1" Then
                If tbWAVE_DATE.Text = "" Then
                    alert("ไม่สามารถบันทึก วันที่ขอยกเว้น(Wave Date) ")
                    tbWAVE_DATE.BackColor = Drawing.Color.Red
                    Exit Sub
                Else
                    If IsDate(tbWAVE_DATE.Text) = False Then
                        alert("ไม่สามารถบันทึก กรุณาระบุ วันที่ขอยกเว้น(Wave Date)  ให้ถูกต้อง ")
                        tbWAVE_DATE.BackColor = Drawing.Color.Red
                        Exit Sub
                    End If
                End If
            ElseIf ddlWAVE_FLAG.Items(ddlWAVE_FLAG.SelectedIndex).Value = "0" Then
                tbWAVE_DATE.Text = ""
            End If

        Else  ' กรณีที่เลือก action <> 3 คือไม่ได้มีการผิดเงื่อนไข
            tbBreach_DATE.Text = ""
            ddlWAVE_FLAG.SelectedIndex = 0
            tbWAVE_DATE.Text = ""
        End If

        'alert(ddlCOVENANT_DETAIL.Items(ddlCOVENANT_DETAIL.SelectedIndex).Value)

        Dim dal As New AnnalsCovenantDAL   ' Create object dal
        Dim obj As New AnnalsCovenant  ' Create object
        obj.IDEN = lblIDeN.Value
        obj.CIF = CInt(tbCIF.Text)

        obj.REMARK = tbRemark.Text
        obj.DETAIL = tbDetail.Text

        obj.COVENANT_TYPE_ID = ddlCOVENANT_TYPE.SelectedValue
        obj.COVENANT_ACTION_ID = ddlCovenantAction.SelectedValue
        obj.COVENANT_DETAIL_ID = ddlCOVENANT_DETAIL.Items(ddlCOVENANT_DETAIL.SelectedIndex).Value
        ' New Date(ddlYearProcess_date.SelectedValue, ddlMonthProcess_date.SelectedValue, ddlDayProcess_date.SelectedValue, 0, 0, 0)     ' วันที่ Process")
        obj.CREATE_DATE = Date.Now

        ' obj.DEADLINE_DATE = New Date(CInt(tbDeadLine_Date.Text.Substring(6, 2)), CInt(tbDeadLine_Date.Text.Substring(3, 2)), CInt(tbDeadLine_Date.Text.Substring(0, 2)), 0, 0, 0)
        obj.DEADLINE_DATE = ""
        obj.ACTION_DATE = ""
        obj.ID = tbID.Text
        obj.USER_ID = tbUser_ID.Value
        obj.USER_UPDATE_DATE = Date.Now

        obj.NEXT_ACTION_DATE = tbNextAction_Date.Text
        obj.NEXT_COVENANT_ACTION_ID = ddlNextCovenantAction.Items(ddlNextCovenantAction.SelectedIndex).Value

        obj.BREACH_DATE = tbBreach_DATE.Text
        obj.WAVE_FLAG = ddlWAVE_FLAG.Text
        obj.WAVE_DATE = tbWAVE_DATE.Text


        'MsgBox(Session("event"))
        If LCase(Session("event")) = "addfile" Then
            dal.insertAnnalsCovenant(obj)
            alert("Add  complete ( เพิ่มข้อมูลเรียบร้อย)")
        Else
            dal.updateAnnalsCovenant(obj)
            alert("Update  complete ( บันทึกข้อมูลเรียบร้อย )")
        End If
        Session("event") = ""
        ShowGridCovenant() ' Show grid data.
        ' Catch ex As Exception
        'message.Text = ex.Message
        'End Try
    End Sub
    Protected Sub GridCovenant_RowDeleting(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewDeleteEventArgs) Handles GridCovenant.RowDeleting
        Try
            Dim lblIDEN As HiddenField = GridCovenant.Rows(e.RowIndex).Cells(0).FindControl("lblIDEN")
            Dim dal As New AnnalsCovenantDAL
            dal.deleteAnnalsCovenant(CInt(lblIDEN.Value), Request("ID"))
            ShowGridCovenant() ' Show grid data.
            message.Text = "Delete   complete"
        Catch ex As Exception
            alert(ex.Message)
        End Try
    End Sub
    Protected Sub GridCovenant_RowCommand(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewCommandEventArgs) Handles GridCovenant.RowCommand
        ' remark  การค้นหา covenant ครั้งล่าสุดไว้

        If e.CommandName = "SearchCIF" Then  ' ถ้าเป้นการกดปุ่มแว่นขยาย (ค้นหา)
            If GridCovenant.Rows.Count >= 0 Then
                GridCovenant.SelectedIndex = 0

                Dim tbCIF As TextBox = GridCovenant.Rows(GridCovenant.SelectedIndex).Cells(0).FindControl("tbCIF")
                Dim lblIDeN As HiddenField = GridCovenant.Rows(GridCovenant.SelectedIndex).Cells(0).FindControl("lblIDEN")
                Dim lblCIFName As Label = GridCovenant.Rows(GridCovenant.SelectedIndex).Cells(0).FindControl("lblCIFName")
                'Dim tbDetail As TextBox = GridCovenant.Rows(GridCovenant.SelectedIndex).Cells(0).FindControl("tbDetail")
                'Dim tbRemark As TextBox = GridCovenant.Rows(GridCovenant.SelectedIndex).Cells(0).FindControl("tbRemark")
                'Dim tbDeadLine_Date As TextBox = GridCovenant.Rows(GridCovenant.SelectedIndex).Cells(0).FindControl("tbDeadLine_Date")
                'Dim tbAction_Date As TextBox = GridCovenant.Rows(GridCovenant.SelectedIndex).Cells(0).FindControl("tbAction_Date")
                'Dim tbUSER_UPDATE_DATE As TextBox = GridCovenant.Rows(GridCovenant.SelectedIndex).Cells(0).FindControl("tbUSER_UPDATE_DATE")
                'Dim ddlCOVENANT_TYPE As DropDownList = GridCovenant.Rows(GridCovenant.SelectedIndex).Cells(0).FindControl("ddlCOVENANT_TYPE")
                'Dim ddlCOVENANT_DETAIL As DropDownList = GridCovenant.Rows(GridCovenant.SelectedIndex).Cells(0).FindControl("ddlCOVENANT_DETAIL")
                'Dim ddlCovenantAction As DropDownList = GridCovenant.Rows(GridCovenant.SelectedIndex).Cells(0).FindControl("ddlCovenantAction")
                'Dim tbID As TextBox = GridCovenant.Rows(GridCovenant.SelectedIndex).Cells(0).FindControl("tbID")
                'Dim tbUser_ID As HiddenField = GridCovenant.Rows(GridCovenant.SelectedIndex).Cells(0).FindControl("tbUser_ID")

                If Not tbCIF Is Nothing Then

                    If tbCIF.Text <> "" Then
                        Dim dal1 As New CustomerDAL
                        Dim obj1 As New Customer
                        obj1.CIF = tbCIF.Text
                        obj1 = dal1.getCustomerByCIF(obj1)
                        If obj1.CUS_FIRST = "" Then
                            alert("ไม่พบข้อมูลลูกค้า CIF" & tbCIF.Text)
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
    Protected Sub SearchCovenant()


        If GridCovenant.SelectedIndex >= 0 Then
            Dim ddlCOVENANT_TYPE As DropDownList = GridCovenant.Rows(GridCovenant.SelectedIndex).Cells(0).FindControl("ddlCOVENANT_TYPE")

            If ddlCOVENANT_TYPE.Items(ddlCOVENANT_TYPE.SelectedIndex).Value <> "" Then

                Dim dal As New AnnalsCovenantDetailDAL
                Dim arrCOVENANT_DETAIL As New List(Of AnnalsCovenantDetail)

                arrCOVENANT_DETAIL = dal.getAllAnnalsCovenantDetailByCOVENANT_TYPE_ID(ddlCOVENANT_TYPE.SelectedValue)
                Dim ddlCOVENANT_DETAIL As DropDownList = GridCovenant.Rows(GridCovenant.SelectedIndex).Cells(0).FindControl("ddlCOVENANT_DETAIL")
                ddlCOVENANT_DETAIL.DataSource = arrCOVENANT_DETAIL
                ddlCOVENANT_DETAIL.DataValueField = "COVENANT_DETAIL_ID"
                ddlCOVENANT_DETAIL.DataTextField = "COVENANT_DETAIL_SHORT"
                ddlCOVENANT_DETAIL.DataBind()
                'ddlCOVENANT_DETAIL.Items.Insert(0, New ListItem("โปรดเลือก", ""))

            End If

        End If
    End Sub
    Protected Sub PutCovenant()

        Dim ddlCOVENANT_DETAIL As DropDownList = GridCovenant.Rows(GridCovenant.SelectedIndex).Cells(0).FindControl("ddlCOVENANT_DETAIL")
        If ddlCOVENANT_DETAIL.Items(ddlCOVENANT_DETAIL.SelectedIndex).Value <> "" Then

            Dim tbDetail As TextBox = GridCovenant.Rows(GridCovenant.SelectedIndex).Cells(0).FindControl("tbDetail")
            tbDetail.Text = ddlCOVENANT_DETAIL.Items(ddlCOVENANT_DETAIL.SelectedIndex).Text
            'If tbDetail.Text.ToString.Length > 40 Then
            '    tbDetail.Rows = tbDetail.Text.ToString.Length / 40
            'End If

        End If
    End Sub

End Class
