Imports System.Collections.Generic
Imports System.Globalization
Partial Class _TbEmptraning
    Inherits System.Web.UI.Page
    'Protected cul As New CultureInfo("th-TH") ' ปี ไทย  
    Protected cul As New CultureInfo("en-US") ' ปี eng 
    Protected Sub alert(ByVal str As String)
        Response.Write("<script language=""javascript"">alert(""" & Str & """)</script>")
    End Sub
    Protected Sub BindDropDown()
        For d As Integer = 1 To 31
            Dim item As New ListItem
            item.Value = d
            item.Text = d
            ddlDaySTARTDATE.Items.Add(item)
        Next
        For m As Integer = 1 To 12
            Dim item As New ListItem
            item.Value = m
            item.Text = MonthName(m)
            ddlMonthSTARTDATE.Items.Add(item)
        Next
        For y As Integer = cul.Calendar.GetYear(Date.Now) - 100 To cul.Calendar.GetYear(Date.Now) + 1
            Dim item As New ListItem
            item.Value = y
            item.Text = y
            ddlYearSTARTDATE.Items.Add(item)
        Next
        For d As Integer = 1 To 31
            Dim item As New ListItem
            item.Value = d
            item.Text = d
            ddlDayFINISHDATE.Items.Add(item)
        Next
        For m As Integer = 1 To 12
            Dim item As New ListItem
            item.Value = m
            item.Text = MonthName(m)
            ddlMonthFINISHDATE.Items.Add(item)
        Next
        For y As Integer = cul.Calendar.GetYear(Date.Now) - 100 To cul.Calendar.GetYear(Date.Now) + 1
            Dim item As New ListItem
            item.Value = y
            item.Text = y
            ddlYearFINISHDATE.Items.Add(item)
        Next
      
    End Sub
    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Page.IsPostBack = False Then
            ShowGridTbEmptraning()
            PreSearch()
            BindDropdown()
            BtnDelete.Attributes.Add("onclick", "return confirm('Do you want to delete this data?');")
        End If
    End Sub

    Sub PreAdd()
        btnAdd.Visible = True
        btnUpdate.Visible = False
        btnDelete.Visible = False
        ClearText()
        PanelGridTbEmptraning.visible = False
        PanelTbEmptraning.visible = True
    End Sub
    Protected Sub btnAdd_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnAdd.Click
        'Code check input error. 
        Dim ErrString As String = CheckErrINput()
        If ErrString <> "" Then
            alert(ErrString)
            Exit Sub
        End If
        Dim dal As New TbEmptraningDAL ' Create object dal
        Dim obj As New TbEmptraning ' Create object
        obj.ID_NO = tbID_NO.text
        obj.EMP_ID = tbEMP_ID.text
        obj.NAMETRAIN = tbNAMETRAIN.text
        obj.PLACE = tbPLACE.text
        obj.STARTDATE = New Date(ddlYearSTARTDATE.SelectedValue, ddlMonthSTARTDATE.SelectedValue, ddlDaySTARTDATE.SelectedValue, 0, 0, 0, cul.Calendar)
        obj.FINISHDATE = New Date(ddlYearFINISHDATE.SelectedValue, ddlMonthFINISHDATE.SelectedValue, ddlDayFINISHDATE.SelectedValue, 0, 0, 0, cul.Calendar)
         dal.insertTbEmptraning(obj)
        ShowGridTbEmptraning() ' Show grid data.
        PreSearch() ' Set to presearch state.
        alert(" Add complete ")
    End Sub
    Protected Sub btnAddNew_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnAddNew.Click
        PreAdd()
    End Sub
    Sub PreUpdate()
        btnAdd.Visible = False
        btnUpdate.Visible = True
        btnDelete.Visible = True
        PanelGridTbEmptraning.visible = False
        PanelTbEmptraning.visible = True
    End Sub
    Sub PreSearch()
        btnAdd.Visible = False
        btnUpdate.Visible = True
        btnDelete.Visible = True
        PanelGridTbEmptraning.visible = True
        PanelTbEmptraning.visible = False
    End Sub
    Protected Sub btnUpdate_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnUpdate.Click
        'Code check input error. 
        Dim ErrString As String = CheckErrINput()
        If ErrString <> "" Then
            alert(ErrString)
            Exit Sub
        End If
        Dim dal As New TbEmptraningDAL ' Create object dal
        Dim obj As New TbEmptraning ' Create object 
        obj.ID_NO = tbID_NO.text
        obj.EMP_ID = tbEMP_ID.text
        obj.NAMETRAIN = tbNAMETRAIN.text
        obj.PLACE = tbPLACE.text
        obj.STARTDATE = New Date(ddlYearSTARTDATE.SelectedValue, ddlMonthSTARTDATE.SelectedValue, ddlDaySTARTDATE.SelectedValue, 0, 0, 0, cul.Calendar)
        obj.FINISHDATE = New Date(ddlYearFINISHDATE.SelectedValue, ddlMonthFINISHDATE.SelectedValue, ddlDayFINISHDATE.SelectedValue, 0, 0, 0, cul.Calendar)
        dal.updateTbEmptraning(obj)
        ShowGridTbEmptraning()
        PreSearch()
        alert(" Update complete ")
    End Sub
    Protected Sub btnDelete_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnDelete.Click
        Dim dal As New TbEmptraningDAL
        Dim obj As New TbEmptraning
        obj.ID_NO = tbID_NO.Text
        dal.deleteTbEmptraning(obj)
        ShowGridTbEmptraning()
        PreSearch()
    End Sub
    Sub ClearText()
        tbID_NO.Text = 0
        tbEMP_ID.Text = User.Identity.Name
        tbNAMETRAIN.Text = ""
        tbPLACE.Text = ""
        ddlDaySTARTDATE.SelectedIndex = -1
        ddlMonthSTARTDATE.SelectedIndex = -1
        ddlYearSTARTDATE.SelectedIndex = -1
        ddlDayFINISHDATE.SelectedIndex = -1
        ddlMonthFINISHDATE.SelectedIndex = -1
        ddlYearFINISHDATE.SelectedIndex = -1
      
    End Sub
    Protected Sub btnCancel_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnCancel.Click
        PreSearch()
    End Sub
    Protected Sub GridTbEmptraning_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles GridTbEmptraning.SelectedIndexChanged
        tbID_NO.Text = HttpUtility.HtmlDecode(GridTbEmptraning.Rows(GridTbEmptraning.SelectedIndex).Cells(1).Text).Trim
        tbEMP_ID.Text = User.Identity.Name
        tbNAMETRAIN.Text = HttpUtility.HtmlDecode(GridTbEmptraning.Rows(GridTbEmptraning.SelectedIndex).Cells(3).Text).Trim
        tbPLACE.Text = HttpUtility.HtmlDecode(GridTbEmptraning.Rows(GridTbEmptraning.SelectedIndex).Cells(4).Text).Trim
        ddlDaySTARTDATE.SelectedIndex = 0
        ddlMonthSTARTDATE.SelectedIndex = 0
        ddlYearSTARTDATE.SelectedIndex = 0
        If Isdate(HttpUtility.HtmlDecode(GridTbEmptraning.Rows(GridTbEmptraning.SelectedIndex).Cells(5).Text).Trim) = True Then
            For i As Integer = 0 To ddlDaySTARTDATE.Items.Count - 1
                If ddlDaySTARTDATE.Items(i).Value = Day(HttpUtility.HtmlDecode(GridTbEmptraning.Rows(GridTbEmptraning.SelectedIndex).Cells(5).Text).Trim) Then
                    ddlDaySTARTDATE.SelectedIndex = i
                    Exit For
                End If
            Next
            For i As Integer = 0 To ddlMonthSTARTDATE.Items.Count - 1
                If ddlMonthSTARTDATE.Items(i).Value = Month(HttpUtility.HtmlDecode(GridTbEmptraning.Rows(GridTbEmptraning.SelectedIndex).Cells(5).Text).Trim) Then
                    ddlMonthSTARTDATE.SelectedIndex = i
                    Exit For
                End If
            Next
            For i As Integer = 0 To ddlYearSTARTDATE.Items.Count - 1
                If ddlYearSTARTDATE.Items(i).Value = cul.Calendar.GetYear(HttpUtility.HtmlDecode(GridTbEmptraning.Rows(GridTbEmptraning.SelectedIndex).Cells(5).Text).Trim) Then
                    ddlYearSTARTDATE.SelectedIndex = i
                    Exit For
                End If
            Next
        End If
        ddlDayFINISHDATE.SelectedIndex = 0
        ddlMonthFINISHDATE.SelectedIndex = 0
        ddlYearFINISHDATE.SelectedIndex = 0
        If Isdate(HttpUtility.HtmlDecode(GridTbEmptraning.Rows(GridTbEmptraning.SelectedIndex).Cells(6).Text).Trim) = True Then
            For i As Integer = 0 To ddlDayFINISHDATE.Items.Count - 1
                If ddlDayFINISHDATE.Items(i).Value = Day(HttpUtility.HtmlDecode(GridTbEmptraning.Rows(GridTbEmptraning.SelectedIndex).Cells(6).Text).Trim) Then
                    ddlDayFINISHDATE.SelectedIndex = i
                    Exit For
                End If
            Next
            For i As Integer = 0 To ddlMonthFINISHDATE.Items.Count - 1
                If ddlMonthFINISHDATE.Items(i).Value = Month(HttpUtility.HtmlDecode(GridTbEmptraning.Rows(GridTbEmptraning.SelectedIndex).Cells(6).Text).Trim) Then
                    ddlMonthFINISHDATE.SelectedIndex = i
                    Exit For
                End If
            Next
            For i As Integer = 0 To ddlYearFINISHDATE.Items.Count - 1
                If ddlYearFINISHDATE.Items(i).Value = cul.Calendar.GetYear(HttpUtility.HtmlDecode(GridTbEmptraning.Rows(GridTbEmptraning.SelectedIndex).Cells(6).Text).Trim) Then
                    ddlYearFINISHDATE.SelectedIndex = i
                    Exit For
                End If
            Next
        End If

        PreUpdate()
    End Sub
    Sub ShowGridTbEmptraning()
        Dim dal As New TbEmptraningDAL
        Dim arr As New List(Of TbEmptraning)
        arr = dal.getAllTbEmptraningByEmpID(User.Identity.Name)
        GridTbEmptraning.DataSource = arr
        Session("GridTbEmptraning") = arr
        GridTbEmptraning.DataBind()
    End Sub
    Protected Sub GridTbEmptraning_PageIndexChanging(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewPageEventArgs) Handles GridTbEmptraning.PageIndexChanging
        GridTbEmptraning.PageIndex = e.NewPageIndex
        GridTbEmptraning.DataSource = Session("GridTbEmptraning")
        GridTbEmptraning.DataBind()
    End Sub
    Function CheckErrINput() As String
        Dim str As String = ""
       
        If tbEMP_ID.text = "" Then
            str += "Please input Employee ID.  \n"
        End If
        If tbNAMETRAIN.text = "" Then
            str += "Please input Train Name.  \n"
        End If
        If tbPLACE.text = "" Then
            str += "Please input Place.  \n"
        End If
        If isdate(ddlMonthSTARTDATE.SelectedValue & "/" & ddlDaySTARTDATE.SelectedValue & "/" & ddlYearSTARTDATE.SelectedValue) = False Then
            str += "Please input Date of Start with correct date. \n "
        End If
        If isdate(ddlMonthFINISHDATE.SelectedValue & "/" & ddlDayFINISHDATE.SelectedValue & "/" & ddlYearFINISHDATE.SelectedValue) = False Then
            str += "Please input Date of finish with correct date. \n "
        End If
       
        If str <> "" Then
            str = " Can not save data. \n " & str
        End If
        Return str
    End Function
End Class