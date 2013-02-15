Option Explicit On
Option Strict On

Imports System.Globalization
Imports System.Data.SqlClient
Imports System.Data
Imports System.IO

Namespace aspx.report

    Partial Class SelectReport
        Inherits aspx.MyPageClass

        'Protected cul As New CultureInfo("th-TH") ' ปี ไทย  
        Protected cul As New CultureInfo("en-US") ' ปี eng
        Dim intC, int11, int12, int13, int14, int15, int16 As New Double
        Dim int17, int18, int19, int20, int21, int22, int23, int24, int25, int26, int27, int28, int29, int30, int31, int32, int33 As Double
        Dim m As String = Nothing

        Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
            If Not Page.IsPostBack Then
                bindDropDown()
                bindCheckbox()

                If Request("reptype") = "cr" Then
                    lblReport.Text = "รายงานสินเชื่อรายหนังสือ"
                ElseIf Request("reptype") = "crdt" Then
                    lblReport.Text = "รายงานสินเชื่อรายบัญชี"
                End If
            End If

        End Sub
        Sub bindCheckbox()
            If (Request.QueryString("y") = "0" And Request.QueryString("m") = "0" And Request.QueryString("d") = "0") _
            Or (Request.QueryString("y") = "" And Request.QueryString("m") = "" And Request.QueryString("d") = "") Then
                CheckBoxDate.Checked = False
            Else
                CheckBoxDate.Checked = True
                DropDownListDay.Enabled = True
                DropDownListMonth.Enabled = True
                DropDownListYear.Enabled = True
            End If
            If (Request.QueryString("yr") = "0" And Request.QueryString("mr") = "0" And Request.QueryString("dr") = "0") _
            Or (Request.QueryString("yr") = "" And Request.QueryString("mr") = "" And Request.QueryString("dr") = "") Then
                CheckBoxDateR.Checked = False
            Else
                CheckBoxDateR.Checked = True
                DropDownListDayR.Enabled = True
                DropDownListMonthR.Enabled = True
                DropDownListYearR.Enabled = True
            End If
            If (Request.QueryString("l") = "0" And Request.QueryString("r") = "0" And Request.QueryString("e") = "0") _
               Or (Request.QueryString("l") = "" And Request.QueryString("r") = "" And Request.QueryString("e") = "") Then
                CheckBoxSection.Checked = False
            Else
                CheckBoxSection.Checked = True
                DropDownListLevel.Enabled = True
                TextBoxRegion.Enabled = True
                TextBoxEmpID.Enabled = True
            End If
            If Request.QueryString("g") = "0" Or Request.QueryString("g") = "" Then
                CheckBoxGroup.Checked = False
            Else
                CheckBoxGroup.Checked = True
                DropDownListGroup.Enabled = True
            End If
        End Sub
        Sub bindDropDown()

            '===========เริ่มสร้าง dropdownlist สำหรับเลือกวันที่สถานะ
            For d As Integer = 1 To 31
                Dim item As New ListItem
                item.Value = d.ToString
                item.Text = d.ToString
                DropDownListDay.Items.Add(item)
            Next
            Dim ditem As New ListItem
            ditem.Text = "all"
            ditem.Value = "0"
            DropDownListDay.Items.Insert(0, ditem)
            DropDownListDay.SelectedIndex = Day(Now)

            For m As Integer = 1 To 12
                Dim item As New ListItem
                item.Value = m.ToString
                item.Text = MonthName(m)
                DropDownListMonth.Items.Add(item)

            Next
            'Dim mitem As New ListItem("all", "0")
            'DropDownListMonth.Items.Insert(0, mitem)
            DropDownListMonth.SelectedIndex = Month(Now) - 1

            For y As Integer = cul.Calendar.GetYear(Date.Now) To cul.Calendar.GetYear(Date.Now) - 5 Step -1
                Dim item As New ListItem
                item.Value = y.ToString
                item.Text = (y + 543).ToString
                DropDownListYear.Items.Add(item)
            Next


            '===========เริ่มสร้าง dropdownlist สำหรับเลือกวันที่ register
            For d2 As Integer = 1 To 31
                Dim item As New ListItem
                item.Value = d2.ToString
                item.Text = d2.ToString
                DropDownListDayR.Items.Add(item)
            Next
            Dim ditem2 As New ListItem
            ditem2.Text = "all"
            ditem2.Value = "0"
            DropDownListDayR.Items.Insert(0, ditem2)
            DropDownListDayR.SelectedIndex = Day(Now)

            For m As Integer = 1 To 12
                Dim item As New ListItem
                item.Value = m.ToString
                item.Text = MonthName(m)
                DropDownListMonthR.Items.Add(item)

            Next
            'Dim mitem2 As New ListItem("all", "0")
            'DropDownListMonthR.Items.Insert(0, mitem2)
            DropDownListMonthR.SelectedIndex = Month(Now) - 1

            For y As Integer = cul.Calendar.GetYear(Date.Now) To cul.Calendar.GetYear(Date.Now) - 5 Step -1
                Dim item As New ListItem
                item.Value = y.ToString
                item.Text = (y + 543).ToString
                DropDownListYearR.Items.Add(item)
            Next

            '------------จบสร้าง dropdownlist วันที่


            Dim Gitem0 As New ListItem("all", "0")
            'Dim GitemA As New ListItem("Register", "A")  ' เอาออกวันที่ 5 สิงหา 2551  ให้รวมในกลุ่ม B 
            Dim GitemB As New ListItem("ระหว่างขั้นตอนการปฎิบัติงาน", "B")
            Dim GitemC As New ListItem("คืนเรื่อง", "C")
            Dim GitemD As New ListItem("อนุมัติ", "D")
            Dim GitemE As New ListItem("ไม่อนุมัติ", "E")


            DropDownListGroup.Items.Insert(0, Gitem0)
            'DropDownListGroup.Items.Insert(1, GitemA)
            DropDownListGroup.Items.Insert(1, GitemB)
            DropDownListGroup.Items.Insert(2, GitemC)
            DropDownListGroup.Items.Insert(3, GitemD)
            DropDownListGroup.Items.Insert(4, GitemE)


            Dim dal As New ControllingLevelDAL
            DropDownListLevel.DataSource = dal.getAllControllingLevel
            DropDownListLevel.DataValueField = "Level_id"
            DropDownListLevel.DataTextField = "Level_name"
            DropDownListLevel.DataBind()
            Dim Lvitem As New ListItem("all", "0")
            DropDownListLevel.Items.Insert(0, Lvitem)

            If Request.QueryString("y") <> "" Then
                For i = 0 To DropDownListYear.Items.Count - 1
                    If DropDownListYear.Items(i).Value.ToString = Request.QueryString("y") Then
                        DropDownListYear.SelectedIndex = i
                        Exit For
                    End If
                Next
            End If
            If Request.QueryString("m") <> "" Then
                For i = 0 To DropDownListMonth.Items.Count - 1
                    If DropDownListMonth.Items(i).Value.ToString = Request.QueryString("m") Then
                        DropDownListMonth.SelectedIndex = i
                        Exit For
                    End If
                Next
            End If
            If Request.QueryString("d") <> "" Then
                For k = 0 To DropDownListDay.Items.Count - 1

                    If DropDownListDay.Items(k).Value.ToString = Request.QueryString("d").ToString Then
                        'MsgBox(k)
                        DropDownListDay.SelectedIndex = k
                        Exit For
                    End If
                Next
            End If


            If Request.QueryString("yr") <> "" Then
                For i = 0 To DropDownListYearR.Items.Count - 1
                    If DropDownListYearR.Items(i).Value.ToString = Request.QueryString("yr") Then
                        DropDownListYearR.SelectedIndex = i
                        Exit For
                    End If
                Next
            End If
            If Request.QueryString("mr") <> "" Then
                For i = 0 To DropDownListMonthR.Items.Count - 1
                    If DropDownListMonthR.Items(i).Value.ToString = Request.QueryString("mr") Then
                        DropDownListMonthR.SelectedIndex = i
                        Exit For
                    End If
                Next
            End If
            If Request.QueryString("dr") <> "" Then
                For i = 0 To DropDownListDayR.Items.Count - 1
                    If DropDownListDayR.Items(i).Value.ToString = Request.QueryString("dr") Then
                        DropDownListDayR.SelectedIndex = i
                        Exit For
                    End If
                Next
            End If

            If Request.QueryString("g") <> "" Then
                For i = 0 To DropDownListGroup.Items.Count - 1
                    If DropDownListGroup.Items(i).Value.ToString = Request.QueryString("g") Then
                        DropDownListGroup.SelectedIndex = i
                        Exit For
                    End If
                Next
            End If
            If Request.QueryString("l") <> "" Then
                For i = 0 To DropDownListLevel.Items.Count - 1
                    If DropDownListLevel.Items(i).Value.ToString = Request.QueryString("l") Then
                        DropDownListLevel.SelectedIndex = i
                        Exit For
                    End If
                Next
            End If
            TextBoxRegion.Text = Request.QueryString("r")
            If TextBoxRegion.Text = "0" Then TextBoxRegion.Text = ""
            TextBoxEmpID.Text = Request.QueryString("e")
            If TextBoxEmpID.Text = "0" Then TextBoxEmpID.Text = ""
            If Request.QueryString("f") <> "" Then
                CheckBoxNotfin.Checked = CBool(Request.QueryString("f"))
            End If


            DropDownListDay.Enabled = False
            DropDownListDayR.Enabled = False
            DropDownListMonth.Enabled = False
            DropDownListMonthR.Enabled = False
            DropDownListYear.Enabled = False
            DropDownListYearR.Enabled = False

            DropDownListGroup.Enabled = False
            DropDownListLevel.Enabled = False
            TextBoxRegion.Enabled = False
            TextBoxEmpID.Enabled = False

        End Sub

        Protected Sub Button1_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles Button1.Click

            Dim log As New ClsLog
            log.InsertLog(5, Request.UserHostAddress, User.Identity.Name)


            'Dim d, m, y, dR, mR, yR As String
            'Dim g, r, ee, l, f As String



            'y = DropDownListYear.Items(DropDownListYear.SelectedIndex).Value
            'm = DropDownListMonth.Items(DropDownListMonth.SelectedIndex).Value
            'd = DropDownListDay.Items(DropDownListDay.SelectedIndex).Value
            'g = DropDownListGroup.Items(DropDownListGroup.SelectedIndex).Value
            'r = TextBoxRegion.Text
            'ee = TextBoxEmpID.Text
            'f = CheckBoxNotfin.Checked.ToString
            'l = DropDownListLevel.Items(DropDownListLevel.SelectedIndex).Value
            'yR = DropDownListYearR.Items(DropDownListYearR.SelectedIndex).Value
            'mR = DropDownListMonthR.Items(DropDownListMonthR.SelectedIndex).Value
            'dR = DropDownListDayR.Items(DropDownListDayR.SelectedIndex).Value

            'If CheckBoxDate.Checked = False Then
            '    y = "0"
            '    m = "0"
            '    d = "0"
            'End If

            'If CheckBoxDateR.Checked = False Then
            '    yR = "0"
            '    mR = "0"
            '    dR = "0"
            'End If

            'If (y = "0" And yR = "0") And f = "False" Then
            '    msg.Text = "Please select date. (กรุณาเลือกวันที่ใดวันที่หนึ่ง)"
            '    Exit Sub
            'Else
            '    msg.Text = ""
            'End If

            'If r = "" Then r = "0"
            'If ee = "" Then ee = "0"

            'Dim s1 As String = String.Empty
            ''s1 += "<script type='text/javascript'>"
            'If Request("reptype") = "cr" Then
            '    s1 += "window.open('ReportCreditByProduct.aspx"
            'ElseIf Request("reptype") = "crdt" Then
            '    s1 += "window.open('ReportCreditByCustomer.aspx"
            'End If
            's1 += "?y=" & y & "&m=" & m & "&d=" & d & "&g=" & g & "&r=" & r & "&e=" & ee & "&l=" & l & "&f=" & f & "&yr=" & yR & "&mr=" & mR & "&dr=" & dR
            '' Button1.Attributes.Add("onclick", s1 & "','pop', 'width=700, height=500');")
            's1 += "','pop', 'width=800, height=600,status=1,scrollbars=1');"
            ''s1 += "</script>"

            ''Str = "alert(""" & Str() & """);"
            'Page.ClientScript.RegisterStartupScript(Me.GetType(), "messagebox", s1, True)

            'Response.Write(s1)
            ' Response.Redirect("ReportCreditByProduct.aspx?y=" & y & "&m=" & m & "&d=" & d & "&g=" & g & "&r=" & r & "&e=" & ee & "&l=" & l & "&f=" & f & "&yr=" & yR & "&mr=" & mR & "&dr=" & dR)

        End Sub

        Protected Sub CheckBoxDateR_CheckedChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles CheckBoxDateR.CheckedChanged
            DropDownListDayR.Enabled = CheckBoxDateR.Checked
            DropDownListMonthR.Enabled = CheckBoxDateR.Checked
            DropDownListYearR.Enabled = CheckBoxDateR.Checked
        End Sub

        Protected Sub CheckBoxDate_Che(ByVal sender As Object, ByVal e As System.EventArgs) Handles CheckBoxDate.CheckedChanged
            DropDownListDay.Enabled = CheckBoxDate.Checked
            DropDownListMonth.Enabled = CheckBoxDate.Checked
            DropDownListYear.Enabled = CheckBoxDate.Checked
        End Sub

        Protected Sub CheckBoxSection_CheckedChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles CheckBoxSection.CheckedChanged
            DropDownListLevel.Enabled = CheckBoxSection.Checked
            TextBoxRegion.Enabled = CheckBoxSection.Checked
            TextBoxEmpID.Enabled = CheckBoxSection.Checked
        End Sub

        Protected Sub CheckBoxGroup_CheckedChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles CheckBoxGroup.CheckedChanged
            DropDownListGroup.Enabled = CheckBoxGroup.Checked
        End Sub

        Protected Sub CheckBoxNotfin_CheckedChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles CheckBoxNotfin.CheckedChanged

            CheckBoxDateR.Checked = Not CheckBoxNotfin.Checked
            CheckBoxDateR.Enabled = Not CheckBoxNotfin.Checked

            CheckBoxDate.Checked = Not CheckBoxNotfin.Checked
            CheckBoxDate.Enabled = Not CheckBoxNotfin.Checked

            DropDownListDay.Enabled = Not CheckBoxNotfin.Checked
            DropDownListMonth.Enabled = Not CheckBoxNotfin.Checked
            DropDownListYear.Enabled = Not CheckBoxNotfin.Checked
            DropDownListDayR.Enabled = Not CheckBoxNotfin.Checked
            DropDownListMonthR.Enabled = Not CheckBoxNotfin.Checked
            DropDownListYearR.Enabled = Not CheckBoxNotfin.Checked
        End Sub
    End Class

End Namespace
