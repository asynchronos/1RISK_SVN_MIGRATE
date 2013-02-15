Imports System.Collections.Generic
Imports System.Globalization
Partial Class _UploadFileType
Inherits System.Web.UI.Page
'Protected cul As New CultureInfo("th-TH") ' ปี ไทย  
 Protected cul As New CultureInfo("en-US") ' ปี eng 
Protected Sub alert(ByVal str As String)
	 Response.Write("<script language=""javascript"">alert(""" & Str & """)</script>")
End sub 
 Protected Sub BindDropDown
End Sub
Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
	If Page.IsPostBack = False Then
		ShowGridUploadFileType()
		PreSearch()
		BindDropdown()
		BtnDelete.Attributes.Add("onclick", "return confirm('Do you want to delete this data?');")
	End if 
End Sub
Protected Sub btnSearch_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnSearch.Click
 ' Code check input error. 
	Dim dal As New UploadFileTypeDAL ' Create object dal
	Dim obj As New UploadFileType ' Create object 
	obj.ID = tbID.Text
	obj=dal.getUploadFileTypeByID(obj)
	tbID.text=obj.ID
	tbTYPE.text=obj.TYPE
PreUpdate()
End sub
Protected Sub btnSearchVar_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnSearchVar.Click
	Dim sqlString As String = "Select * From UPLOAD_FILE_TYPE"
	If tbSearchValue.Text <> "" Then
		If ddlOperator.SelectedValue = " LIKE "  Or  ddlOperator.SelectedValue = " Not LIKE " Then  '-- "Contains" comparison, e.g.,
			sqlString &= " Where " & ddlFieldValue.SelectedValue & _
			ddlOperator.SelectedValue & "N'%" & Replace(tbSearchValue.Text.Trim, "'", "''") & "%'"
		Else  '-- Numeric comparison, e.g.,
			sqlString &= " Where  " & ddlFieldValue.SelectedValue & _
			ddlOperator.SelectedValue & "'" & Replace(tbSearchValue.Text.Trim, "'", "''") & "'"
		End If
	End If
Dim dal As New UploadFileTypeDAL
Dim arr As New List(Of UploadFileType)
arr = dal.getAllUploadFileTypeBySQL(sqlString)
GridUploadFileType.DataSource = arr
Session("GridUploadFileType") = arr
GridUploadFileType.DataBind()
End Sub
Sub PreAdd()
	btnAdd.Visible = True 
	btnUpdate.Visible = False 
	btnDelete.Visible = False
	ClearText()
	PanelGridUploadFileType.visible=False
	PanelUploadFileType.visible=True
End Sub
Protected Sub btnAdd_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnAdd.Click
 'Code check input error. 
	Dim ErrString As String = CheckErrINput()
	If ErrString <> "" Then
		 alert(ErrString)
		 Exit Sub
	End If
	Dim dal As New UploadFileTypeDAL ' Create object dal
	Dim obj As New UploadFileType ' Create object
	obj.ID=tbID.text
	obj.TYPE=tbTYPE.text
	dal.insertUploadFileType(obj)
		ShowGridUploadFileType() ' Show grid data.
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
	PanelGridUploadFileType.visible=False
	PanelUploadFileType.visible=True
End Sub
Sub PreSearch()
	btnAdd.Visible = False
	btnUpdate.Visible = True
	btnDelete.Visible = True
	PanelGridUploadFileType.visible=True
	PanelUploadFileType.visible=False
End Sub
Protected Sub btnUpdate_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnUpdate.Click
 'Code check input error. 
	Dim ErrString As String = CheckErrINput()
	If ErrString <> "" Then
		 alert(ErrString)
		 Exit sub
	End If
	Dim dal As New UploadFileTypeDAL ' Create object dal
	Dim obj As New UploadFileType ' Create object 
	obj.ID=tbID.text
	obj.TYPE=tbTYPE.text
	dal.updateUploadFileType(obj)
		ShowGridUploadFileType()
		PreSearch()
		alert(" Update complete ")
End sub
Protected Sub btnDelete_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnDelete.Click
	Dim dal As New UploadFileTypeDAL
	Dim obj As New UploadFileType
	obj.ID = tbID.Text
	dal.deleteUploadFileType(obj)
		ShowGridUploadFileType()
		PreSearch()
End sub
Sub ClearText()
tbID.Text = "" 
tbTYPE.Text = "" 
End Sub
Protected Sub btnCancel_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnCancel.Click
	 PreSearch() 
End sub 
 Protected Sub GridUploadFileType_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles GridUploadFileType.SelectedIndexChanged
	tbID.Text =  HttpUtility.HtmlDecode(GridUploadFileType.Rows(GridUploadFileType.SelectedIndex).Cells(1).Text).Trim
	tbTYPE.Text =  HttpUtility.HtmlDecode(GridUploadFileType.Rows(GridUploadFileType.SelectedIndex).Cells(2).Text).Trim
	PreUpdate()
End Sub 
Sub ShowGridUploadFileType
	Dim dal As New UploadFileTypeDAL
	Dim arr As New List(Of UploadFileType)
	arr = dal.getAllUploadFileType
	GridUploadFileType.DataSource = arr
	Session("GridUploadFileType") = arr
	GridUploadFileType.DataBind()
End Sub
Protected Sub GridUploadFileType_PageIndexChanging(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewPageEventArgs) Handles GridUploadFileType.PageIndexChanging
	GridUploadFileType.PageIndex = e.NewPageIndex
	GridUploadFileType.DataSource = Session("GridUploadFileType")
	GridUploadFileType.DataBind()
End Sub
Function CheckErrINput() As String
	 Dim str As String = ""
	if tbID.text = "" then 
		str+="Please input ID.  \n"
	End if 
	if tbTYPE.text = "" then 
		str+="Please input TYPE.  \n"
	End if 
	if str <> ""  then 
	 str=" Can not save data. \n " & str 
	 end if
	Return str
End Function
End Class
