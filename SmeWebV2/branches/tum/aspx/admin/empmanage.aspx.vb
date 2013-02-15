Imports System.Collections.Generic
Imports System.Globalization
Partial Class _empmanage
    Inherits System.Web.UI.Page
    'Protected cul As New CultureInfo("th-TH") ' ปี ไทย  
    Protected cul As New CultureInfo("en-US") ' ปี eng 
    Protected Sub alert(ByVal str As String)
        Response.Write("<script language=""javascript"">alert(""" & str & """)</script>")
    End Sub
    Protected Sub BindDropDown()
      

        Dim dalRoleId As New AuthenRolesDAL
        Dim arrRoleId As New List(Of AuthenRoles)
        arrRoleId = dalRoleId.getAllAuthenRoles
        ddlRoleId.DataSource = arrRoleId
        ddlRoleId.DataValueField = "RoleId"
        ddlRoleId.DataTextField = "RoleName"
        ddlRoleId.DataBind()


        Dim dalTITLE_CODE As New TbTitleDAL
        Dim arrTITLE_CODE As New List(Of TbTitle)
        arrTITLE_CODE = dalTITLE_CODE.getAllTbTitle
        ddlTITLE_CODE.DataSource = arrTITLE_CODE
        ddlTITLE_CODE.DataValueField = "TITLE_CODE"
        ddlTITLE_CODE.DataTextField = "TITLE_NAME"
        ddlTITLE_CODE.DataBind()


  


    End Sub
    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Page.IsPostBack = False Then
            ' ShowGridtbEmployee()
            PreSearch()

            BindDropDown()
            btnDelete.Attributes.Add("onclick", "return confirm('Do you want to delete this data?');")
        End If
    End Sub
    Sub SearchEmp(empid As String)
        ' Code check input error. 
        Dim dal As New TbEmployeeDAL ' Create object dal
        Dim obj As New TbEmployee ' Create object 

        obj.EMP_ID = empid
        obj = dal.getTbEmployeeByEMP_ID(obj)
        tbEMP_ID.Text = obj.EMP_ID
        ddlTITLE_CODE.SelectedIndex = 0
        For i As Integer = 0 To ddlTITLE_CODE.Items.Count - 1
            If ddlTITLE_CODE.Items(i).Value = obj.TITLE_CODE Then
                ddlTITLE_CODE.SelectedIndex = i
                Exit For
            End If
        Next
        tbEMPNAME.Text = obj.EMPNAME
        tbEMPSURNAME.Text = obj.EMPSURNAME
        tbEMPNAME_E.Text = obj.EMPNAME_E
        tbEMPSURNAME_E.Text = obj.EMPSURNAME_E
        tbEMAIL.Text = obj.EMAIL

        tbUSERNAME.Text = obj.USERNAME
        tbPASSWD.Text = obj.PASSWD


        ddlRoleId.SelectedIndex = 0
        Dim objrDal As New AuthenUsersinrolesDAL
        Dim objr As New AuthenUsersinroles
        objr = objrDal.getAuthenUsersinrolesByUserId(obj.EMP_ID)
        If IsNothing(objr) = False Then
            For i As Integer = 0 To ddlRoleId.Items.Count - 1
                'alert(ddlRoleId.Items(i).Value & "--" & objr.RoleId)
                If ddlRoleId.Items(i).Value = objr.RoleId Then
                    ddlRoleId.SelectedIndex = i
                    Exit For
                End If
            Next
        End If

        ShowGridtbUserInRoles()

        PreUpdate()
    End Sub
    Sub PreUpdate()
        btnAdd.Visible = False
        btnUpdate.Visible = True
        PanelGridAdminEmployee.Visible = False
        PanelTbEmployee.Visible = True
    End Sub
    Sub PreSearch()

        PanelGridAdminEmployee.Visible = True
        PanelTbEmployee.Visible = False

    End Sub
    Sub PreAdd()
        btnAdd.Visible = True
        btnUpdate.Visible = False
        PanelGridAdminEmployee.Visible = False
        PanelTbEmployee.Visible = True
        ClearText()
    End Sub
    Protected Sub btnUpdate_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnUpdate.Click
        'Code check input error. 
        Dim ErrString As String = CheckErrINput()
        If ErrString <> "" Then
            alert(ErrString)
            Exit Sub
        End If
        Dim dal As New TbEmployeeDAL ' Create object dal
        Dim obj As New TbEmployee ' Create object 
        obj.EMP_ID = tbEMP_ID.Text
        obj.TITLE_CODE = ddlTITLE_CODE.SelectedValue
        obj.EMPNAME = tbEMPNAME.Text
        obj.EMPSURNAME = tbEMPSURNAME.Text
        obj.EMPNAME_E = tbEMPNAME_E.Text
        obj.EMPSURNAME_E = tbEMPSURNAME_E.Text
        obj.EMAIL = tbEMAIL.Text
        obj.IDCARD = ""
        obj.TAX_NO = ""
        obj.ACCNO = ""
        obj.ADDRESS = ""
        obj.SOI = ""
        obj.ROAD = ""
        obj.LOCALITY = ""
        obj.DISTRINCT = ""
        obj.PROV_CODE = ""
        obj.ZIPCODE = ""
        obj.TEL_HOME = ""
        obj.TEL_MOBILE = ""
        obj.TEL_INDOOR = ""
        obj.DATEOFBIRTH = DateTime.Now
        obj.IMAGENAME = ""

        obj.USERNAME = tbUSERNAME.Text
        obj.PASSWD = tbPASSWD.Text

        dal.updateTbEmployee(obj)



        '' code ส่วนนี้บันทึก  role 
        'Dim Audal As New AuthenUsersinrolesDAL
        'Dim auobj As New AuthenUsersinroles
        'auobj = Audal.getAuthenUsersinrolesByUserId(tbEMP_ID.Text)
        'MsgBox(auobj.RoleId)

        'If auobj.RoleId = Nothing Or auobj.RoleId = "" Then
        '    MsgBox("insert role")
        '    Dim objupdate As New AuthenUsersinroles
        '    objupdate.RoleId = ddlRoleId.SelectedValue
        '    objupdate.UserId = obj.EMP_ID
        '    Audal.insertAuthenUsersinroles(objupdate)

        'Else
        '    MsgBox("update role")
        '    Dim objupdate As New AuthenUsersinroles
        '    objupdate.RoleId = ddlRoleId.SelectedValue
        '    objupdate.UserId = obj.EMP_ID
        '    Audal.updateAuthenUsersinroles(objupdate)
        'End If



        'ShowGridTbEmployee()
        ' PreSearch()
        alert(" Update complete ")


    End Sub
    
    Sub ShowGridtbEmployee()
        Dim dal As New TbEmployeeDAL
        Dim arr As New List(Of TbEmployee)
        arr = dal.getAllTbEmployee
        GridAdminEmployee.DataSource = arr
        Session("GridAdminEmployee") = arr
        GridAdminEmployee.DataBind()
    End Sub
    Sub ShowGridtbUserInRoles()
        Dim dal As New AuthenUsersinrolesDAL
        Dim arr As New List(Of AuthenUsersinroles)
        Dim sql As String = "Select * from Authen_UsersInRoles where userid='" & tbEMP_ID.Text & "'"
        arr = dal.getAllAuthenUsersinrolesBySQL(sql)

        GridUserInrole.DataSource = arr
        GridUserInrole.DataBind()
    End Sub

    Sub ClearText()
        tbEMP_ID.Text = ""
        ddlTITLE_CODE.SelectedIndex = -1

        tbEMPNAME.Text = ""
        tbEMPSURNAME.Text = ""
        tbEMPNAME_E.Text = ""
        tbEMPSURNAME_E.Text = ""
        tbEMAIL.Text = ""

        'FileUpload.Value = ""
  

        tbUSERNAME.Text = ""
        tbPASSWD.Text = ""




    End Sub
    Protected Sub btnCancel_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnCancel.Click
        PreSearch()
    End Sub
    Function CheckErrINput() As String
        Dim str As String = ""
        If tbEMP_ID.Text = "" Then
            str += "Please input Employee ID.  \n"
        End If

        If tbEMPNAME.Text = "" Then
            str += "Please input Name.  \n"
        End If
        If tbEMPSURNAME.Text = "" Then
            str += "Please input Surname.  \n"
        End If
        If tbEMPNAME_E.Text = "" Then
            str += "Please input Name(Eng).  \n"
        End If
        If tbEMPSURNAME_E.Text = "" Then
            str += "Please input Surname(Eng).  \n"
        End If
        If tbEMAIL.Text = "" Then
            str += "Please input Email.  \n"
        End If
  

        If tbUSERNAME.Text = "" Then
            str += "Please input Username.  \n"
        End If
        If tbPASSWD.Text = "" Then
            str += "Please input Password.  \n"
        End If


        If str <> "" Then
            str = " Can not save data. \n " & str
        End If
        Return str
    End Function

    Protected Sub btnAddNew_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnAddNew.Click
        PreAdd()
    End Sub

    Protected Sub btnAdd_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnAdd.Click
        'Code check input error. 
        Dim ErrString As String = CheckErrINput()
        If ErrString <> "" Then
            alert(ErrString)
            Exit Sub
        End If

        Dim dalC As New TbEmployeeDAL
        Dim objc As New TbEmployee ' Create object 
        objc.EMP_ID = tbEMP_ID.Text
        objc = dalC.getTbEmployeeByEMP_ID(objc)

        If IsNothing(objc) = False Then
            alert(" Duplicate Employee ID.")
            Exit Sub
        End If
        ' Check Pimarykey


        Dim dal As New TbEmployeeDAL ' Create object dal
        Dim obj As New TbEmployee

        obj.EMP_ID = tbEMP_ID.Text
        obj.TITLE_CODE = ddlTITLE_CODE.SelectedValue
        obj.EMPNAME = tbEMPNAME.Text
        obj.EMPSURNAME = tbEMPSURNAME.Text
        obj.EMPNAME_E = tbEMPNAME_E.Text
        obj.EMPSURNAME_E = tbEMPSURNAME_E.Text
        obj.EMAIL = tbEMAIL.Text
        obj.IDCARD = ""
        obj.TAX_NO = ""
        obj.ACCNO = ""
        obj.ADDRESS = ""
        obj.SOI = ""
        obj.ROAD = ""
        obj.LOCALITY = ""
        obj.DISTRINCT = ""
        obj.PROV_CODE = ""
        obj.ZIPCODE = ""
        obj.TEL_HOME = ""
        obj.TEL_MOBILE = ""
        obj.TEL_INDOOR = ""
        obj.DATEOFBIRTH = DateTime.Now

        obj.IMAGENAME = ""

        obj.USERNAME = tbUSERNAME.Text
        obj.PASSWD = tbPASSWD.Text

        dal.insertTbEmployee(obj) ' บันทึก emp

        ' code ส่วนนี้บันทึก  role 

        'dal.updateTbEmployee(obj)
        '' code ส่วนนี้บันทึก  role 
        'Dim Audal As New AuthenUsersinrolesDAL
        'Dim auobj As New AuthenUsersinroles
        'auobj = Audal.getAuthenUsersinrolesByUserId(tbEMP_ID.Text)

        'If IsNothing(auobj.RoleId) Then
        '    Dim objupdate As New AuthenUsersinroles
        '    objupdate.RoleId = ddlRoleId.SelectedValue
        '    objupdate.UserId = obj.EMP_ID
        '    Audal.insertAuthenUsersinroles(objupdate)
        'End If
        'PreSearch()
        'ShowGridtbEmployee()
        alert(" Add complete ")
        'PreSearch()
        SearchEmp(tbEMP_ID.Text)
    End Sub

    Protected Sub GridAdminEmployee_PageIndexChanging(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewPageEventArgs) Handles GridAdminEmployee.PageIndexChanging
        GridAdminEmployee.PageIndex = e.NewPageIndex
        GridAdminEmployee.DataSource = Session("GridAdminEmployee")
        GridAdminEmployee.DataBind()
    End Sub

    Protected Sub GridAdminEmployee_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles GridAdminEmployee.SelectedIndexChanged
        SearchEmp(GridAdminEmployee.Rows(GridAdminEmployee.SelectedIndex).Cells(1).Text)
    End Sub

    Protected Sub btnDelete_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnDelete.Click
        Dim dal As New TbEmployeeDAL
        Dim obj As New TbEmployee
        obj.EMP_ID = tbEMP_ID.Text
        dal.deleteTbEmployee(obj)
        'ShowGridtbEmployee()
        PreSearch()
    End Sub

    Protected Sub btnSearchVar_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnSearchVar.Click
        If tbSearchValue.Text = "" Then Exit Sub
        Dim sqlString As String = "Select * From TB_EMPLOYEE"
        If tbSearchValue.Text <> "" Then
            If ddlOperator.SelectedValue = " LIKE " Or ddlOperator.SelectedValue = " Not LIKE " Then  '-- "Contains" comparison, e.g.,
                sqlString &= " Where " & ddlFieldValue.SelectedValue & _
                ddlOperator.SelectedValue & "N'%" & Replace(tbSearchValue.Text.Trim, "'", "''") & "%'"
            Else  '-- Numeric comparison, e.g.,
                sqlString &= " Where  " & ddlFieldValue.SelectedValue & _
                ddlOperator.SelectedValue & "'" & Replace(tbSearchValue.Text.Trim, "'", "''") & "'"
            End If
        End If
        Dim dal As New TbEmployeeDAL
        Dim arr As New List(Of TbEmployee)
        arr = dal.getAllTbEmployeeBySQL(sqlString)
        GridAdminEmployee.DataSource = arr
        Session("GridAdminEmployee") = arr
        GridAdminEmployee.DataBind()
    End Sub

    Protected Sub Button1_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles Button1.Click
        Dim obj As New AuthenUsersinroles
        obj.UserId = tbEMP_ID.Text
        obj.RoleId = ddlRoleId.Items(ddlRoleId.SelectedIndex).Value
        Dim dal As New AuthenUsersinrolesDAL
        dal.insertAuthenUsersinroles(obj)
        alert(" เพิ่ม role เรียบร้อยแล้ว ")
        ShowGridtbUserInRoles()
    End Sub

    Protected Sub GridUserInrole_RowDeleting(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewDeleteEventArgs) Handles GridUserInrole.RowDeleting
        'alert(GridUserInrole.SelectedIndex)
        Dim dal As New AuthenUsersinrolesDAL
        If GridUserInrole.SelectedIndex < 0 Then
            alert(" เลือก role ก่อนลบ ")
            Exit Sub
        End If
        Dim strRole As String = GridUserInrole.Rows(GridUserInrole.SelectedIndex).Cells(3).Text
        dal.deleteAuthenUsersinroles(tbEMP_ID.Text, strRole)
        alert(" ลบ  role เรียบร้อยแล้ว ")
        ShowGridtbUserInRoles()
    End Sub

End Class