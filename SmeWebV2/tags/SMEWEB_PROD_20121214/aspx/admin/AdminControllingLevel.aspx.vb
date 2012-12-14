Imports System.Collections.Generic
Imports System.Globalization
Partial Class _AdminControllingLevel
Inherits System.Web.UI.Page
'Protected cul As New CultureInfo("th-TH") ' ปี ไทย  
 Protected cul As New CultureInfo("en-US") ' ปี eng 
Protected Sub alert(ByVal str As String)
	 Response.Write("<script language=""javascript"">alert(""" & Str & """)</script>")
End sub 
 Protected Sub BindDropDown
	Dim dalLEVEL_ROOT As New ControllingLevelDAL
	Dim arrLEVEL_ROOT As New List(Of ControllingLevel)
	arrLEVEL_ROOT = dalLEVEL_ROOT.getAllControllingLevel
	ddlLEVEL_ROOT.DataSource = arrLEVEL_ROOT
	ddlLEVEL_ROOT.DataValueField = "LEVEL_ID"
	ddlLEVEL_ROOT.DataTextField = "LEVEL_NAME"
	ddlLEVEL_ROOT.DataBind()


        Dim dalEMP_ID As New TbEmployeeDAL
        Dim arrEMP_ID As New List(Of TbEmployee)
        arrEMP_ID = dalEMP_ID.getListEmployeeForDropdown
        ddlEMP_ID.DataSource = arrEMP_ID
        ddlEMP_ID.DataValueField = "EMP_ID"
        ddlEMP_ID.DataTextField = "EMPNAME"
        ddlEMP_ID.DataBind()

        DDLempid2.DataSource = arrEMP_ID
        DDLempid2.DataValueField = "EMP_ID"
        DDLempid2.DataTextField = "EMPNAME"
        DDLempid2.DataBind()


End Sub
Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
	If Page.IsPostBack = False Then
		ShowGridAdminControllingLevel()
		PreSearch()
		BindDropdown()
		BtnDelete.Attributes.Add("onclick", "return confirm('Do you want to delete this data?');")
	End if 
End Sub
Protected Sub btnSearch_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnSearch.Click
 ' Code check input error. 
	Dim dal As New AdminControllingLevelDAL ' Create object dal
	Dim obj As New AdminControllingLevel ' Create object 
	obj.LEVEL_ID = tbLEVEL_ID.Text
	obj=dal.getAdminControllingLevelByLEVEL_ID(obj)
	tbLEVEL_ID.text=obj.LEVEL_ID
	tbLEVEL_CODE.text=obj.LEVEL_CODE
	tbLEVEL_NAME.text=obj.LEVEL_NAME
	 ddlLEVEL_ROOT.SelectedIndex = 0
		 For i As Integer = 0 To ddlLEVEL_ROOT.Items.Count - 1
			 If ddlLEVEL_ROOT.Items(i).Value = obj.LEVEL_ROOT Then
				 ddlLEVEL_ROOT.SelectedIndex = i
				 Exit For
			 End If
		 Next
PreUpdate()
End sub
Protected Sub btnSearchVar_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnSearchVar.Click
	Dim sqlString As String = "Select * From Controlling_Level"
	If tbSearchValue.Text <> "" Then
		If ddlOperator.SelectedValue = " LIKE "  Or  ddlOperator.SelectedValue = " Not LIKE " Then  '-- "Contains" comparison, e.g.,
			sqlString &= " Where " & ddlFieldValue.SelectedValue & _
			ddlOperator.SelectedValue & "N'%" & Replace(tbSearchValue.Text.Trim, "'", "''") & "%'"
		Else  '-- Numeric comparison, e.g.,
			sqlString &= " Where  " & ddlFieldValue.SelectedValue & _
			ddlOperator.SelectedValue & "'" & Replace(tbSearchValue.Text.Trim, "'", "''") & "'"
		End If
	End If
Dim dal As New AdminControllingLevelDAL
Dim arr As New List(Of AdminControllingLevel)
arr = dal.getAllAdminControllingLevelBySQL(sqlString)
GridAdminControllingLevel.DataSource = arr
Session("GridAdminControllingLevel") = arr
GridAdminControllingLevel.DataBind()
End Sub
Sub PreAdd()
	btnAdd.Visible = True 
        btnUpdate.Visible = False
	btnDelete.Visible = False
	ClearText()
        PanelAdminControllingLevel.Visible = True
    End Sub
    Sub PreAdd2()
        btnAdd2.Visible = True
        btnUpdate2.Visible = False
        btnDelete2.Visible = False
    End Sub
    Sub PreAdd3()
        btnAdd3.Visible = True
        btnUpdate3.Visible = False
        btnDelete3.Visible = False

    End Sub
Protected Sub btnAdd_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnAdd.Click
 'Code check input error. 
	Dim ErrString As String = CheckErrINput()
	If ErrString <> "" Then
		 alert(ErrString)
		 Exit Sub
	End If
	Dim dal As New AdminControllingLevelDAL ' Create object dal
	Dim obj As New AdminControllingLevel ' Create object
	obj.LEVEL_ID=tbLEVEL_ID.text
	obj.LEVEL_CODE=tbLEVEL_CODE.text
	obj.LEVEL_NAME=tbLEVEL_NAME.text
	obj.LEVEL_ROOT=ddlLEVEL_ROOT.SelectedValue
	dal.insertAdminControllingLevel(obj)
		ShowGridAdminControllingLevel() ' Show grid data.
		PreSearch() ' Set to presearch state.
		alert(" Update complete ")
End sub
Protected Sub btnAddNew_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnAddNew.Click
	 PreAdd() 
End sub 
Sub PreUpdate()
	btnAdd.Visible = False
	btnUpdate.Visible = True
	btnDelete.Visible = True
        PanelAdminControllingLevel.Visible = True
End Sub
Sub PreSearch()
	btnAdd.Visible = False
	btnUpdate.Visible = True
	btnDelete.Visible = True
        PanelAdminControllingLevel.Visible = True
End Sub
Protected Sub btnUpdate_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnUpdate.Click
 'Code check input error. 
	Dim ErrString As String = CheckErrINput()
	If ErrString <> "" Then
		 alert(ErrString)
		 Exit sub
	End If
	Dim dal As New AdminControllingLevelDAL ' Create object dal
	Dim obj As New AdminControllingLevel ' Create object 
	obj.LEVEL_ID=tbLEVEL_ID.text
	obj.LEVEL_CODE=tbLEVEL_CODE.text
	obj.LEVEL_NAME=tbLEVEL_NAME.text
	obj.LEVEL_ROOT=ddlLEVEL_ROOT.SelectedValue
	dal.updateAdminControllingLevel(obj)
		ShowGridAdminControllingLevel()
		PreSearch()
		alert(" Update complete ")
End sub
Protected Sub btnDelete_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnDelete.Click
	Dim dal As New AdminControllingLevelDAL
	Dim obj As New AdminControllingLevel
	obj.LEVEL_ID = tbLEVEL_ID.Text
	dal.deleteAdminControllingLevel(obj)
		ShowGridAdminControllingLevel()
		PreSearch()
End sub
Sub ClearText()
tbLEVEL_ID.Text = "" 
tbLEVEL_CODE.Text = "" 
tbLEVEL_NAME.Text = "" 
ddlLEVEL_ROOT.SelectedIndex = -1
End Sub
Protected Sub btnCancel_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnCancel.Click
	 PreSearch() 
End sub 
 Protected Sub GridAdminControllingLevel_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles GridAdminControllingLevel.SelectedIndexChanged
	tbLEVEL_ID.Text =  HttpUtility.HtmlDecode(GridAdminControllingLevel.Rows(GridAdminControllingLevel.SelectedIndex).Cells(1).Text).Trim
	tbLEVEL_CODE.Text =  HttpUtility.HtmlDecode(GridAdminControllingLevel.Rows(GridAdminControllingLevel.SelectedIndex).Cells(2).Text).Trim
	tbLEVEL_NAME.Text =  HttpUtility.HtmlDecode(GridAdminControllingLevel.Rows(GridAdminControllingLevel.SelectedIndex).Cells(3).Text).Trim
 ddlLEVEL_ROOT.SelectedIndex = 0
	 For i As Integer = 0 To ddlLEVEL_ROOT.Items.Count - 1
		 If ddlLEVEL_ROOT.Items(i).Value = HttpUtility.HtmlDecode(GridAdminControllingLevel.Rows(GridAdminControllingLevel.SelectedIndex).Cells(4).Text).Trim Then
			 ddlLEVEL_ROOT.SelectedIndex = i
			 Exit For
		 End If
	 Next
        PreUpdate()

        ShowGridAdminControllingLeadsinlevel(tbLEVEL_ID.Text)
        PreAdd2()
        ShowGridAdminControllingUsersinlevel(tbLEVEL_ID.Text)
        PreAdd3()
    End Sub
    Sub ShowGridAdminControllingLeadsinlevel(ByVal level_id As String)
        Dim dal As New AdminControllingLeadsinlevelDAL
        Dim arr As New List(Of AdminControllingLeadsinlevel)
        arr = dal.getAllAdminControllingLeadsinlevelByLevel_id(level_id)
        GridAdminControllingLeadsinlevel.DataSource = arr
        Session("GridAdminControllingLeadsinlevel") = arr
        GridAdminControllingLeadsinlevel.DataBind()
        If GridAdminControllingLeadsinlevel.Rows.Count > 0 Then
            GridAdminControllingLeadsinlevel.SelectedIndex = -1
            GridAdminControllingLeadsinlevel.SelectedIndex = 0

        End If
    End Sub
    Sub ShowGridAdminControllingUsersinlevel(ByVal level_id As String)
        Dim dal As New AdminControllingUsersinlevelDAL
        Dim arr As New List(Of AdminControllingUsersinlevel)
        arr = dal.getAllAdminControllingUsersinlevelByLevel_id(level_id)
        GridAdminControllingUsersinlevel.DataSource = arr
        Session("GridAdminControllingUsersinlevel") = arr
        GridAdminControllingUsersinlevel.DataBind()
        If GridAdminControllingUsersinlevel.Rows.Count > 0 Then
            GridAdminControllingUsersinlevel.SelectedIndex = -1
            GridAdminControllingUsersinlevel.SelectedIndex = 0
        End If
    End Sub
Sub ShowGridAdminControllingLevel
	Dim dal As New AdminControllingLevelDAL
	Dim arr As New List(Of AdminControllingLevel)
	arr = dal.getAllAdminControllingLevel
	GridAdminControllingLevel.DataSource = arr
	Session("GridAdminControllingLevel") = arr
	GridAdminControllingLevel.DataBind()
End Sub
Protected Sub GridAdminControllingLevel_PageIndexChanging(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewPageEventArgs) Handles GridAdminControllingLevel.PageIndexChanging
	GridAdminControllingLevel.PageIndex = e.NewPageIndex
	GridAdminControllingLevel.DataSource = Session("GridAdminControllingLevel")
	GridAdminControllingLevel.DataBind()
End Sub
Function CheckErrINput() As String
	 Dim str As String = ""
	if tbLEVEL_ID.text = "" then 
		str+="Please input LEVEL_ID.  \n"
	End if 
	if tbLEVEL_CODE.text = "" then 
		str+="Please input LEVEL_CODE.  \n"
	End if 
	if tbLEVEL_NAME.text = "" then 
		str+="Please input LEVEL_NAME.  \n"
	End if 
	if str <> ""  then 
	 str=" Can not save data. \n " & str 
	 end if
	Return str
End Function

    Protected Sub GridAdminControllingLeadsinlevel_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles GridAdminControllingLeadsinlevel.SelectedIndexChanged
        ddlEMP_ID.SelectedIndex = 0
        For i As Integer = 0 To ddlEMP_ID.Items.Count - 1
            If ddlEMP_ID.Items(i).Value = HttpUtility.HtmlDecode(GridAdminControllingLeadsinlevel.Rows(GridAdminControllingLeadsinlevel.SelectedIndex).Cells(2).Text).Trim Then
                ddlEMP_ID.SelectedIndex = i
                Exit For
            End If
        Next
        PreUpdate2()
    End Sub

    Protected Sub GridAdminControllingUsersinlevel_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles GridAdminControllingUsersinlevel.SelectedIndexChanged
        DDLempid2.SelectedIndex = 0
        For i As Integer = 0 To DDLempid2.Items.Count - 1
            If DDLempid2.Items(i).Value = HttpUtility.HtmlDecode(GridAdminControllingUsersinlevel.Rows(GridAdminControllingUsersinlevel.SelectedIndex).Cells(2).Text).Trim Then
                DDLempid2.SelectedIndex = i
                Exit For
            End If
        Next
        PreUpdate3()
    End Sub
    Sub PreUpdate2()
        btnAdd2.Visible = False
        btnUpdate2.Visible = True
        btnDelete2.Visible = True
   
    End Sub
    Sub PreUpdate3()
        btnAdd3.Visible = False
        btnUpdate3.Visible = True
        btnDelete3.Visible = True
    
    End Sub

    Protected Sub btnAddNew2_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnAddNew2.Click
        PreAdd2()
    End Sub

    Protected Sub btnAddnew3_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnAddnew3.Click
        PreAdd3()
    End Sub

    Protected Sub btnAdd2_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnAdd2.Click
        Dim ErrString As String = CheckErrINput()
        If ErrString <> "" Then
            alert(ErrString)
            Exit Sub
        End If
        Dim dal As New AdminControllingLeadsinlevelDAL ' Create object dal
        Dim obj As New AdminControllingLeadsinlevel ' Create object
        obj.LEVEL_ID = tbLEVEL_ID.Text
        obj.EMP_ID = ddlEMP_ID.SelectedValue
        dal.insertAdminControllingLeadsinlevel(obj)
        ShowGridAdminControllingLeadsinlevel(tbLEVEL_ID.Text) ' Show grid data.
        PreSearch() ' Set to presearch state.
        alert(" Add  complete ")
    End Sub

    Protected Sub btnUpdate2_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnUpdate2.Click
        Dim ErrString As String = CheckErrINput()
        If ErrString <> "" Then
            alert(ErrString)
            Exit Sub
        End If
        Dim dal As New AdminControllingLeadsinlevelDAL ' Create object dal
        Dim obj As New AdminControllingLeadsinlevel ' Create object 
        obj.LEVEL_ID = tbLEVEL_ID.Text
        obj.EMP_ID = ddlEMP_ID.SelectedValue
        dal.updateAdminControllingLeadsinlevel(obj)
        ShowGridAdminControllingLeadsinlevel(tbLEVEL_ID.Text)
        PreSearch()
        alert(" Update complete ")
    End Sub

    Protected Sub btnDelete2_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnDelete2.Click
        Dim dal As New AdminControllingLeadsinlevelDAL
        Dim obj As New AdminControllingLeadsinlevel
        obj.LEVEL_ID = tbLEVEL_ID.Text
        obj.EMP_ID = ddlEMP_ID.SelectedValue
        dal.deleteAdminControllingLeadsinlevel(obj)
        ShowGridAdminControllingLeadsinlevel(tbLEVEL_ID.Text)
        PreAdd2()
    End Sub
    Sub PreSearch2()
        btnAdd2.Visible = False
        btnUpdate2.Visible = True
        btnDelete2.Visible = True
   
    End Sub
    Sub PreSearch3()
        btnAdd3.Visible = False
        btnUpdate3.Visible = True
        btnDelete3.Visible = True
    End Sub

    Protected Sub btnCancel2_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnCancel2.Click
        PreSearch2()
    End Sub

    Protected Sub btnAdd3_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnAdd3.Click
        'Code check input error. 
        Dim ErrString As String = CheckErrINput()
        If ErrString <> "" Then
            alert(ErrString)
            Exit Sub
        End If
        Dim dal As New AdminControllingUsersinlevelDAL ' Create object dal
        Dim obj As New AdminControllingUsersinlevel ' Create object
        obj.LEVEL_ID = tbLEVEL_ID.Text
        obj.EMP_ID = DDLempid2.SelectedValue
        dal.insertAdminControllingUsersinlevel(obj)
        ShowGridAdminControllingUsersinlevel(tbLEVEL_ID.Text) ' Show grid data.
        PreSearch3() ' Set to presearch state.
        alert("  Add complete ")
    End Sub

    Protected Sub btnUpdate3_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnUpdate3.Click
        'Code check input error. 
        Dim ErrString As String = CheckErrINput()
        If ErrString <> "" Then
            alert(ErrString)
            Exit Sub
        End If
        Dim dal As New AdminControllingUsersinlevelDAL ' Create object dal
        Dim obj As New AdminControllingUsersinlevel ' Create object 
        obj.LEVEL_ID = tbLEVEL_ID.Text
        obj.EMP_ID = DDLempid2.SelectedValue
        dal.updateAdminControllingUsersinlevel(obj)
        ShowGridAdminControllingUsersinlevel(tbLEVEL_ID.Text)
        PreSearch3()
        alert(" Update complete ")
    End Sub

    Protected Sub btnDelete3_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnDelete3.Click
        Dim dal As New AdminControllingUsersinlevelDAL
        Dim obj As New AdminControllingUsersinlevel
        obj.LEVEL_ID = tbLEVEL_ID.Text
        obj.EMP_ID = DDLempid2.SelectedValue
        dal.deleteAdminControllingUsersinlevel(obj)
        ShowGridAdminControllingUsersinlevel(tbLEVEL_ID.Text)
        PreSearch3()
    End Sub

    Protected Sub btnCancel3_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnCancel3.Click
        PreSearch3()
    End Sub
End Class
