Imports System.Data
Imports System.Data.SqlClient
Imports System.Collections.Generic
Imports System.Globalization

Partial Class appointment
    Inherits System.Web.UI.Page


    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Not Page.IsPostBack Then
            bindLocation()
            bindTime()
            ClearData()
            MainCalendar.SelectedDate = MainCalendar.TodaysDate
            bindTask()
            DeleteBtn.Attributes.Add("onclick", "return confirm(' คุณต้องการลบข้อมูลนี้หรือไม่  ?');")
            EmpSearchBtn.Attributes.Add("onclick", "window.open('SearchOffice.aspx', 'pop', 'width=600, height=400');")
            CifSearchBTN.Attributes.Add("onclick", "window.open('SearchCustomerRisk.aspx', 'pop', 'width=600, height=400');")
            DepSearchBTN.Attributes.Add("onclick", "window.open('SearchDep.aspx', 'pop', 'width=600, height=400');")
            'RiskSearchBTN.Attributes.Add("onclick", "window.open('SearchRisk.aspx', 'pop', 'width=600, height=400');")

            Dim s2 As String
            s2 += "window.open('../employee/SearchEmployee.aspx"
            s2 += "?tbEmp_id=" & RiskIDTB.ClientID
            s2 += "&tbEmployee=" & RiskNameTB.ClientID
            RiskSearchBTN.Attributes.Add("onclick", s2 & "','pop', 'width=700, height=500');")
            RiskIDTB.Attributes.Add("onfocus", "this.blur();")  '  set readonly

        End If
      
    End Sub

    Sub bindTime()
        Dim A(3) As Integer
        A(0) = 0
        A(1) = 15
        A(2) = 30
        A(3) = 45
        For i As Integer = 0 To 23
            For m As Integer = 0 To 3
                Dim item As New ListItem
                item.Value = Right("0" & i.ToString, 2) & "." & Right("0" & A(m).ToString, 2)
                item.Text = Right("0" & i.ToString, 2) & "." & Right("0" & A(m.ToString), 2)
                StimeDdl.Items.Add(item)
                STimeMDdl.Items.Add(item)
            Next
        Next
     
    End Sub

    Sub bindLocation()

        Dim dal As New TbProvinceDAL()
        LocationDDL.DataSource = dal.getAllTbProvince

        LocationDDL.DataValueField = "PROV_CODE"
        LocationDDL.DataTextField = "PROV_NAME"
        LocationDDL.DataBind()
        If LocationDDL.Items.Count > 0 Then
            LocationDDL.SelectedIndex = 0
        End If


    End Sub
  
    Sub ClearData()
        StimeDdl.SelectedIndex = 0
        STimeMDdl.SelectedIndex = 0
        IDlabel.Text = ""
        SdateTB.Text = ""
        StimeDdl.SelectedIndex = 0
        EmpIDTB.Text = ""
        EmpNameTB.Text = ""
        EmpDepTB.Text = ""
        EmpTelTB.Text = ""
        RiskIDTB.Text = ""
        RiskNameTB.Text = ""
        RiskTeamTB.Text = ""
        RiskTelTB.Text = ""
        ObjectiveTB.Text = ""
        cifTB.Text = ""
        cifNameTB.Text = ""
        DepIDTB.Text = ""
        DepartTB.Text = ""
        LocationDDL.SelectedIndex = 0
        RestRadio0.Checked = False
        RestRadio1.Checked = False
        OfficeChk.Checked = False
        HomeChk.Checked = False
        ShopChk.Checked = False
        FacChk.Checked = False
        CollChk.Checked = False
        OtherTB.Text = ""

        'CifPanel.Visible = False
        'DepartPanel.Visible = False
        'RiskPanel.Visible = False
        'EmpPanel.Visible = False
        'CalendarPanel.Visible = False

        'Calendar1.SelectedDate = Date.Now
        FormPanel.Visible = False   '  กำหนดให้ formหลัก หายไป
        CalendarPanel.Height = 0
        bindTask()
    End Sub

    'Sub SearchScheduleByID(ByVal id As String)

    '    id = ConvertUtil.getObjectValue(id, ConvertUtil.ObjectValueEnum.NumbericValue)
    '    Dim conn1 As New Conn
    '    Dim sql As String = " Select * from TB_Schedule Where id=@para1"
    '    Dim dt As DataTable = conn1.getDataTablePara(sql, id)


    'End Sub

    Protected Sub ActionData(ByVal action As String)



        'On Error Resume Next
        Dim actionM As String
        Dim obj As New Schedule
        Dim cul As New CultureInfo("th-TH")
        obj.ID = ConvertUtil.getObjectValue(IDlabel.Text, ConvertUtil.ObjectValueEnum.NumbericValue)
        If action = "add" Or action = "update" Then



            Dim d As String = CType(Mid(SdateTB.Text, 1, 2), Integer)
            Dim m As Integer = CType(Mid(SdateTB.Text, 4, 2), Integer)
            Dim y As String = CType(Mid(SdateTB.Text, 7, 4), Integer)


            If IsNumeric(RiskIDTB.Text) = False Then
                alert(" กรุณาใส่รหัสพนักงานของ risk ด้วยตัวเลข ")
                Exit Sub
            End If

            If IsDate(New Date(y, m, d, 0, 0, 0, cul.Calendar)) = False Then
                alert(" ไม่สามารถบันทึก \ n กรุณาตรวจสอบข้อมูลวันที่นัด")
                Exit Sub
            End If


            If IsNumeric(EmpIDTB.Text) = False Then
                alert(" กรุณาใส่รหัสพนักงานของผู้นัดด้วยตัวเลข ")
                Exit Sub
            End If



            If IsNumeric(cifTB.Text) = False Then
                alert(" กรุณาใส่รหัส cif ด้วยตัวเลข ")
                Exit Sub
            End If

            If IsNumeric(DepIDTB.Text) = False Then
                alert(" กรุณาใส่รหัสสาขาด้วยตัวเลข ")
                Exit Sub
            End If

            obj.TimeBegin = StimeDdl.SelectedValue
            obj.TimeEnd = STimeMDdl.SelectedValue
            obj.SDate = New Date(y, m, d, 0, 0, 0, cul.Calendar)
            obj.Employee = ConvertUtil.getObjectValue(EmpIDTB.Text, ConvertUtil.ObjectValueEnum.StringValue)
            obj.PersonName = ConvertUtil.getObjectValue(EmpNameTB.Text, ConvertUtil.ObjectValueEnum.StringValue)
            obj.PersonDep = ConvertUtil.getObjectValue(EmpDepTB.Text, ConvertUtil.ObjectValueEnum.StringValue)
            obj.PersonTel = ConvertUtil.getObjectValue(EmpTelTB.Text, ConvertUtil.ObjectValueEnum.StringValue)
            obj.Risk = ConvertUtil.getObjectValue(RiskIDTB.Text, ConvertUtil.ObjectValueEnum.StringValue)
            obj.RiskName = ConvertUtil.getObjectValue(RiskNameTB.Text, ConvertUtil.ObjectValueEnum.StringValue)
            obj.RiskTeam = ConvertUtil.getObjectValue(RiskTeamTB.Text, ConvertUtil.ObjectValueEnum.StringValue)
            obj.RiskTel = ConvertUtil.getObjectValue(RiskTelTB.Text, ConvertUtil.ObjectValueEnum.StringValue)
            obj.Objective = ConvertUtil.getObjectValue(ObjectiveTB.Text, ConvertUtil.ObjectValueEnum.StringValue)
            obj.Cif = ConvertUtil.getObjectValue(cifTB.Text, ConvertUtil.ObjectValueEnum.StringValue)
            obj.CifName = ConvertUtil.getObjectValue(cifNameTB.Text, ConvertUtil.ObjectValueEnum.StringValue)
            obj.ID_Branch = ConvertUtil.getObjectValue(DepIDTB.Text, ConvertUtil.ObjectValueEnum.StringValue)
            obj.Depbranch = ConvertUtil.getObjectValue(DepartTB.Text, ConvertUtil.ObjectValueEnum.StringValue)
            obj.Location = LocationDDL.SelectedValue
            Dim Days = DaysTB.Text
            If IsNumeric(Days) = False Then
                Days = 1
            End If
            obj.Days = Days
            Dim Rest As Integer
            If RestRadio0.Checked Then
                Rest = 0
            Else
                Rest = 1
            End If
            obj.Rest = Rest
            obj.Office_chk = OfficeChk.Checked
            obj.Home_chk = HomeChk.Checked
            obj.Shop_chk = ShopChk.Checked
            obj.Fac_chk = FacChk.Checked
            obj.Col_chk = CollChk.Checked
            obj.Other_chk = OtherTB.Text
            obj.Attach_File = ""
            obj.IP = Request.UserHostAddress()
            obj.UserName = User.Identity.Name
            obj.TranDate = Now
        End If
        Dim dal As New ScheduleDAL

        If action = "add" Or obj.ID = 0 Then
            dal.insertSchedule(obj)
            actionM = "เพิ่ม"
        ElseIf action = "update" Then
            dal.updateSchedule(obj)
            actionM = "แก้ไข"
        ElseIf action = "delete" Then
            dal.deleteSchedule(obj)
            actionM = "ลบ"
        End If


        If Err.Description = "" Then
            ' Response.Write("<Script language='JavaScript'>alert('" & Session("action") & " complete')</script>")
            alert(actionM & "ข้อมูลเรียบร้อยแล้ว")
            'Page.RegisterClientScriptBlock(msg, msg)
            ClearData()
        Else
            '       Response.Write("<Script language='JavaScript'>alert(' Can not " & Session("action") & "  \n  Please check data again ')</script>")
            alert(" ไม่สามารถ" & actionM & "  \n  กรุณาตรวจสอบข้อมูล ")
            Err.Clear()
        End If
    End Sub

    Protected Sub SaveBtn_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles SaveBtn.Click
        ActionData("update")
    End Sub

    Protected Sub DataList1_EditCommand(ByVal source As Object, ByVal e As System.Web.UI.WebControls.DataListCommandEventArgs) Handles DataList1.EditCommand
        Dim ID As String = DataList1.DataKeys(e.Item.ItemIndex).ToString()
        EditSchedule(ID)
    End Sub

    Sub EditSchedule(ByVal Id)
        ClearData()
        FormPanel.Visible = True
        Dim dal As New ScheduleDAL
        Dim ns As New Schedule
        'Dim sid As Integer = CType(DataList1.DataKeys("id"), Integer)
        ns.ID = Id
        ns = dal.getScheduleByID(ns)
        IDlabel.Text = ns.ID
        SdateTB.Text = ns.SDate.ToString("dd/MM/yyyy", New CultureInfo("th-TH"))
        'SdateTB.Text = ConvertUtil.setObjectFormat(Format(ns.SDate, "MM/dd/yyyy"), ConvertUtil.ObjectFormatEnum.ReplaceDayMonth)
        'Dim hh As Integer = ns.SDate.Hour
        'Dim mm As Integer = ns.SDate.Minute

        StimeDdl.SelectedIndex = 0
        For i As Integer = 0 To StimeDdl.Items.Count - 1
            If ns.TimeBegin = StimeDdl.Items(i).Value Then
                StimeDdl.SelectedIndex = i
            End If
        Next

        STimeMDdl.SelectedIndex = 0
        For i As Integer = 0 To STimeMDdl.Items.Count - 1
            If ns.TimeEnd = STimeMDdl.Items(i).Value Then
                STimeMDdl.SelectedIndex = i
            End If
        Next

        EmpIDTB.Text = ns.Employee
        EmpNameTB.Text = ns.PersonName
        EmpDepTB.Text = ns.PersonDep
        EmpTelTB.Text = ns.PersonTel
        RiskIDTB.Text = ns.Risk
        RiskNameTB.Text = ns.RiskName
        RiskTeamTB.Text = ns.RiskTeam
        RiskTelTB.Text = ns.RiskTel
        ObjectiveTB.Text = ns.Objective
        cifTB.Text = ns.Cif
        cifNameTB.Text = ns.CifName
        DepIDTB.Text = ns.ID_Branch
        DepartTB.Text = ns.Depbranch
        Dim ll = ns.Location
        If IsNumeric(ll) = True Then
            For i As Integer = 0 To LocationDDL.Items.Count - 1
                If ll = LocationDDL.Items(i).Value Then
                    LocationDDL.SelectedIndex = i
                End If
            Next
        End If
        If ns.Rest = 0 Then
            RestRadio0.Checked = True
        Else
            RestRadio1.Checked = True
        End If
        ' RestRadio1.Checked = Not RestRadio0.Checked
        OfficeChk.Checked = ns.Office_chk
        HomeChk.Checked = ns.Home_chk
        ShopChk.Checked = ns.Shop_chk
        FacChk.Checked = ns.Fac_chk
        CollChk.Checked = ns.Col_chk
        OtherTB.Text = ns.Other_chk

        'RiskPanel.Visible = False
        'EmpPanel.Visible = False
        'CalendarPanel.Visible = False
        'Calendar1.SelectedDate = Date.Now

        FormPanel.Visible = True   '  กำหนดให้ formpanel หายไป


    End Sub
    Sub bindTask()
        lblDate.Text = MainCalendar.SelectedDate.ToString("dd/MM/yyyy", New CultureInfo("th-TH"))
        AddBtn.Visible = True
        DataList1.EditItemIndex = -1
        'DataList1.DataSource = Nothing
        'DataList1.DataBind()
        'DataList1 = New DataList


        Dim dal As New ScheduleDAL


        'Dim conn1 As New Conn
        Dim sdate As String = MainCalendar.SelectedDate
        Dim dd, mm, yy As Integer
        dd = Day(sdate)
        mm = Month(sdate)
        yy = Year(sdate)
        If yy > 2500 Then
            yy = yy - 543
        End If
        Dim sql As String
        sql += "Select * from tb_schedule "
        sql += " where day(sdate)=" & dd & " "
        sql += " and month(sdate)=" & mm & " "
        sql += " and year(sdate)=" & yy & " "
        sql += " and( risk='" & User.Identity.Name & "'"
        sql += " or  employee='" & User.Identity.Name & "')"

        'Dim dt As DataTable = conn1.getDataTable(sql)
        'GridView1.DataSource = dt
        DataList1.DataSource = dal.getAllScheduleBySQL(sql)
        Session("dt") = DataList1.DataSource
        DataList1.DataBind()
        'Session("action") = "Update"
        'If dt.Rows.Count <= 0 Then
        'createNew()
        'Session("action") = "add"
        'Else

        'End If

    End Sub
    Protected Sub DataList1_UpdateCommand(ByVal source As Object, ByVal e As System.Web.UI.WebControls.DataListCommandEventArgs)
        ActionData("update")
    End Sub

    Protected Sub AddBtn_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles AddBtn.Click
        AddSchedule()
    End Sub
    Sub AddSchedule()
        ClearData()
        FormPanel.Visible = True
        SdateTB.Text = MainCalendar.SelectedDate.ToString("dd/MM/yyyy", New CultureInfo("th-TH"))
    End Sub
    Protected Sub DataList1_DeleteCommand(ByVal source As Object, ByVal e As System.Web.UI.WebControls.DataListCommandEventArgs) Handles DataList1.DeleteCommand
        ActionData("delete")
    End Sub

    Protected Sub MainCalendar_DayRender(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.DayRenderEventArgs) Handles MainCalendar.DayRender
        ' If ee = False Then ' ถ้าเท่ากับ false แสดงว่าเป็นครั้งแรก ให้ทำครั้งเดียว
        ' เนื่องจากต้องหาค่าเดือนปัจจุบันของ calendar ที่เปลี่ยนไปจึงต้องมาดูจาก cell แรกของ calendar
        'MsgBox("Render")

        'Dim conn1 As New Conn
        'Dim sdate As String = MainCalendar.SelectedDate
        Dim dal As New ScheduleDAL
        Dim dd, mm, yy As Integer
        dd = Day(e.Day.Date)
        mm = Month(e.Day.Date)
        yy = Year(e.Day.Date)
        If yy > 2500 Then
            yy = yy - 543
        End If
        Dim sql As String
        sql += " Select * from tb_schedule "
        sql += " where day(sdate)='" & dd & "'"
        sql += " and month(sdate)='" & mm & "'"
        sql += " and year(sdate)='" & yy & "'"
        sql += " and( risk='" & User.Identity.Name & "'"
        sql += " or  employee='" & User.Identity.Name & "')"
        'Dim dt As DataTable = conn1.getDataTable(sql)
        'GridView1.DataSource = dt
        'DataBind()
        Dim arr As New List(Of Schedule)
        arr = dal.getAllScheduleBySQL(sql)
        If arr.Count > 0 Then
            e.Cell.BackColor = Drawing.Color.Coral
            ' e.Cell.Controls.Add(New LiteralControl(ChrW(60) & "br" & ChrW(62) & ":>"))
            '  e.Cell.Text = e.Day.DayNumberText.ToString() & "<br>" & "<img src='images/contacts.gif'>"
            For i As Integer = 0 To arr.Count - 1
                e.Cell.Controls.Add(New LiteralControl("<br>" & arr(i).TimeBegin & "-" & arr(i).TimeEnd & ","))
            Next

        End If
        'Else

        'End If
    End Sub

    Protected Sub MainCalendar_SelectionChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles MainCalendar.SelectionChanged
        bindTask()
        ClearData()
    End Sub

    Protected Sub CancelBtn_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles CancelBtn.Click
        ClearData()
    End Sub

    Protected Sub DeleteBtn_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles DeleteBtn.Click
        ActionData("delete")
    End Sub

    Sub alert(ByVal msg As String)
        Response.Write("<Script language='JavaScript'>alert('" & msg & "')</script>")
    End Sub


    Protected Sub SelDateBtn_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles SelDateBtn.Click
        'CalendarPanel.Style.Item("position") = "absolute"
        'CalendarPanel.Style.Item("z-index") = "1"
        CalendarPanel.Visible = True
        CalendarPanel.Height = 300
    End Sub

    Protected Sub Calendar1_DayRender(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.DayRenderEventArgs) Handles Calendar1.DayRender
        ' If ee = False Then ' ถ้าเท่ากับ false แสดงว่าเป็นครั้งแรก ให้ทำครั้งเดียว
        ' เนื่องจากต้องหาค่าเดือนปัจจุบันของ calendar ที่เปลี่ยนไปจึงต้องมาดูจาก cell แรกของ calendar
        'MsgBox("Render")

        'Dim conn1 As New Conn
        'Dim sdate As String = MainCalendar.SelectedDate
        Dim dal As New ScheduleDAL
        Dim dd, mm, yy As Integer
        dd = Day(e.Day.Date)
        mm = Month(e.Day.Date)
        yy = Year(e.Day.Date)
        If yy > 2500 Then
            yy = yy - 543
        End If
        Dim sql As String
        sql += "Select * from tb_schedule "
        sql += "where day(sdate)='" & dd & "'"
        sql += "and month(sdate)='" & mm & "'"
        sql += "and year(sdate)='" & yy & "'"
        sql += "and risk ='" & RiskIDTB.Text & "'"

        'Dim dt As DataTable = conn1.getDataTable(sql)
        'GridView1.DataSource = dt
        'DataBind()
        Dim arr As New List(Of Schedule)
        arr = dal.getAllScheduleBySQL(sql)
        If arr.Count > 0 Then
            e.Cell.BackColor = Drawing.Color.Red
            'e.Cell.ToolTip = arr(0).TimeBegin & "-" & arr(0).TimeEnd
            'e.Cell.Text = e.Day.DayNumberText.ToString() & "<br>" & arr(0).TimeBegin & "-" & arr(0).TimeEnd
            For i As Integer = 0 To arr.Count - 1
                e.Cell.Controls.Add(New LiteralControl("<br>" & arr(i).TimeBegin & "-" & arr(i).TimeEnd & ","))
            Next
        End If
        'Else

        'End If
    End Sub

    Protected Sub Calendar1_SelectionChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles Calendar1.SelectionChanged
        SdateTB.Text = Calendar1.SelectedDate.ToString("dd/MM/yyyy", New CultureInfo("th-TH"))
        CalendarPanel.Visible = False
    End Sub
End Class
