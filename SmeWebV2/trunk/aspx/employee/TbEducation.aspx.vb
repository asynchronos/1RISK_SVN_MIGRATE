Imports System.Collections.Generic
Imports System.Globalization
Partial Class _TbEducation
Inherits System.Web.UI.Page
'Protected cul As New CultureInfo("th-TH") ' ปี ไทย  
 Protected cul As New CultureInfo("en-US") ' ปี eng 
Protected Sub alert(ByVal str As String)
	 Response.Write("<script language=""javascript"">alert(""" & Str & """)</script>")
End sub 
 Protected Sub BindDropDown
	

	Dim dalDEGREE_CODE As New TbDegreeDAL
	Dim arrDEGREE_CODE As New List(Of TbDegree)
	arrDEGREE_CODE = dalDEGREE_CODE.getAllTbDegree
	ddlDEGREE_CODE.DataSource = arrDEGREE_CODE
	ddlDEGREE_CODE.DataValueField = "DEGREE_CODE"
	ddlDEGREE_CODE.DataTextField = "DEGREE_NAME"
	ddlDEGREE_CODE.DataBind()

For d As Integer = 1 To 31
	Dim item As New ListItem
	item.Value = d
	item.Text = d
	ddlDayDATEOFGRADUAT.Items.Add(item)
Next
For m As Integer = 1 To 12
	Dim item As New ListItem
	item.Value = m
	item.Text = MonthName(m)
	ddlMonthDATEOFGRADUAT.Items.Add(item)
Next
For y As Integer = cul.Calendar.GetYear(Date.Now) - 100 To cul.Calendar.GetYear(Date.Now) + 1
	Dim item As New ListItem
	item.Value = y
	item.Text = y
	ddlYearDATEOFGRADUAT.Items.Add(item)
Next

End Sub
Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
	If Page.IsPostBack = False Then
		ShowGridTbEducation()
		PreSearch()
		BindDropdown()
		BtnDelete.Attributes.Add("onclick", "return confirm('Do you want to delete this data?');")
	End if 
End Sub

Sub PreAdd()
	btnAdd.Visible = True 
	btnUpdate.Visible = False 
	btnDelete.Visible = False
	ClearText()
        PanelGridTbEducation.Visible = False
        PanelTbEducation.Visible = True
End Sub
Protected Sub btnAdd_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnAdd.Click
 'Code check input error. 
	Dim ErrString As String = CheckErrINput()
	If ErrString <> "" Then
		 alert(ErrString)
		 Exit Sub
	End If
	Dim dal As New TbEducationDAL ' Create object dal
	Dim obj As New TbEducation ' Create object
        obj.ID = 0
        obj.EMP_ID = tbEMP_ID.Text
        obj.DEGREE_CODE = ddlDEGREE_CODE.SelectedValue
        obj.U_NAME = tbU_NAME.Text
        obj.MAJOR = tbMAJOR.Text
        obj.DATEOFGRADUAT = New Date(ddlYearDATEOFGRADUAT.SelectedValue, ddlMonthDATEOFGRADUAT.SelectedValue, ddlDayDATEOFGRADUAT.SelectedValue, 0, 0, 0, cul.Calendar)
	
        dal.insertTbEducation(obj)
		ShowGridTbEducation() ' Show grid data.
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
        PanelGridTbEducation.Visible = False
        PanelTbEducation.Visible = True
End Sub
Sub PreSearch()
	btnAdd.Visible = False
	btnUpdate.Visible = True
	btnDelete.Visible = True
        PanelGridTbEducation.Visible = True
        PanelTbEducation.Visible = False
End Sub
Protected Sub btnUpdate_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnUpdate.Click
 'Code check input error. 
	Dim ErrString As String = CheckErrINput()
	If ErrString <> "" Then
		 alert(ErrString)
		 Exit Sub
	End If
	Dim dal As New TbEducationDAL ' Create object dal
	Dim obj As New TbEducation ' Create object 
	obj.ID=tbID.text
        obj.EMP_ID = tbEMP_ID.Text
	obj.DEGREE_CODE=ddlDEGREE_CODE.SelectedValue
	obj.U_NAME=tbU_NAME.text
	obj.MAJOR=tbMAJOR.text
	obj.DATEOFGRADUAT= New Date(ddlYearDATEOFGRADUAT.SelectedValue,ddlMonthDATEOFGRADUAT.SelectedValue,ddlDayDATEOFGRADUAT.SelectedValue, 0, 0, 0, cul.Calendar)
	
	dal.updateTbEducation(obj)
		ShowGridTbEducation()
		PreSearch()
		alert(" Update complete ")
End sub
Protected Sub btnDelete_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnDelete.Click
	Dim dal As New TbEducationDAL
	Dim obj As New TbEducation
	obj.ID = tbID.Text
	dal.deleteTbEducation(obj)
		ShowGridTbEducation()
		PreSearch()
End sub
Sub ClearText()
tbID.Text = "" 
        tbEMP_ID.Text = User.Identity.Name
ddlDEGREE_CODE.SelectedIndex = -1
tbU_NAME.Text = "" 
tbMAJOR.Text = "" 
ddlDayDATEOFGRADUAT.SelectedIndex = -1
ddlMonthDATEOFGRADUAT.SelectedIndex = -1
ddlYearDATEOFGRADUAT.SelectedIndex = -1

End Sub
Protected Sub btnCancel_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnCancel.Click
	 PreSearch() 
End sub 
 Protected Sub GridTbEducation_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles GridTbEducation.SelectedIndexChanged
        Dim dal As New TbEducationDAL ' Create object dal
        Dim obj As New TbEducation ' Create object 

        ' กำหนดค่า id และ emp_id ให้กับ object
        obj.ID = CInt(GridTbEducation.Rows(GridTbEducation.SelectedIndex).Cells(1).Text)
        'obj.EMP_ID = User.Identity.Name

        obj = dal.getTbEducationByID(obj)

        tbID.Text = obj.ID
        tbEMP_ID.text = obj.EMP_ID
        ddlDEGREE_CODE.SelectedIndex = 0
        For i As Integer = 0 To ddlDEGREE_CODE.Items.Count - 1
            If ddlDEGREE_CODE.Items(i).Value = obj.DEGREE_CODE Then
                ddlDEGREE_CODE.SelectedIndex = i
                Exit For
            End If
        Next
        tbU_NAME.Text = obj.U_NAME
        tbMAJOR.Text = obj.MAJOR
        ddlDayDATEOFGRADUAT.SelectedIndex = 0
        ddlMonthDATEOFGRADUAT.SelectedIndex = 0
        ddlYearDATEOFGRADUAT.SelectedIndex = 0
        If IsDate(obj.DATEOFGRADUAT) = True Then
            For i As Integer = 0 To ddlDayDATEOFGRADUAT.Items.Count - 1
                If ddlDayDATEOFGRADUAT.Items(i).Value = obj.DATEOFGRADUAT.Day Then
                    ddlDayDATEOFGRADUAT.SelectedIndex = i
                    Exit For
                End If
            Next
            For i As Integer = 0 To ddlMonthDATEOFGRADUAT.Items.Count - 1
                If ddlMonthDATEOFGRADUAT.Items(i).Value = obj.DATEOFGRADUAT.Month Then
                    ddlMonthDATEOFGRADUAT.SelectedIndex = i
                    Exit For
                End If
            Next
            For i As Integer = 0 To ddlYearDATEOFGRADUAT.Items.Count - 1
                If ddlYearDATEOFGRADUAT.Items(i).Value = cul.Calendar.GetYear(obj.DATEOFGRADUAT) Then
                    ddlYearDATEOFGRADUAT.SelectedIndex = i
                    Exit For
                End If
            Next
        End If

        PreUpdate()
End Sub 
Sub ShowGridTbEducation
	Dim dal As New TbEducationDAL
	Dim arr As New List(Of TbEducation)
        arr = dal.getAllTbEducationByEmpID(User.Identity.Name)
        GridTbEducation.DataSource = arr
	Session("GridTbEducation") = arr
        GridTbEducation.DataBind()

End Sub
Protected Sub GridTbEducation_PageIndexChanging(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewPageEventArgs) Handles GridTbEducation.PageIndexChanging
	GridTbEducation.PageIndex = e.NewPageIndex
	GridTbEducation.DataSource = Session("GridTbEducation")
	GridTbEducation.DataBind()
End Sub
Function CheckErrINput() As String
        Dim str As String = ""
	
	if tbU_NAME.text = "" then 
		str+="Please input University Name.  \n"
	End if 
	if tbMAJOR.text = "" then 
		str+="Please input Major.  \n"
	End if 
	if  isdate(ddlMonthDATEOFGRADUAT.SelectedValue & "/"& ddlDayDATEOFGRADUAT.SelectedValue & "/" & ddlYearDATEOFGRADUAT.SelectedValue) = False Then
		str+="Please input Date of Graduate with correct date. \n "
	End if
	
	if str <> ""  then 
	 str=" Can not save data. \n " & str 
	 end if
	Return str
End Function
End Class
