Option Explicit On
Option Strict On

Imports System.Globalization
Imports System.Data.SqlClient
Imports System.Data
Partial Class aspx_report_ReportCreditByProductEmp
    Inherits System.Web.UI.Page

    'Protected cul As New CultureInfo("th-TH") ' ปี ไทย  
    Protected cul As New CultureInfo("en-US") ' ปี eng
    Dim intC, int3, int4, int5, int6, int7, int8, int9, int10, int11, int12, int13, int14, int15 As New Integer
    Dim int16, int17, int18 As Integer
    Dim m As String = Nothing

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Not Page.IsPostBack Then
            bindDropdown()
        End If
    End Sub
    Sub bindDropDown()

        For d As Integer = 1 To 31
            Dim item As New ListItem
            item.Value = d.ToString
            item.Text = d.ToString
            DropDownListDay.Items.Add(item)
        Next
        Dim ditem As New ListItem
        ditem.Text = "--"
        ditem.Value = "0"
        DropDownListDay.Items.Insert(0, ditem)
        DropDownListDay.SelectedIndex = Day(Now)
        For m As Integer = 1 To 12
            Dim item As New ListItem
            item.Value = m.ToString
            item.Text = MonthName(m)
            DropDownListMonth.Items.Add(item)
        Next
        Dim mitem As New ListItem("--", "0")
        DropDownListMonth.Items.Insert(0, mitem)
        DropDownListMonth.SelectedIndex = Month(Now)

        For y As Integer = cul.Calendar.GetYear(Date.Now) To cul.Calendar.GetYear(Date.Now) - 5 Step -1
            Dim item As New ListItem
            item.Value = y.ToString
            item.Text = (y + 543).ToString
            DropDownListYear.Items.Add(item)
        Next


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
            For i = 0 To DropDownListDay.Items.Count - 1
                If DropDownListDay.Items(i).Value.ToString = Request.QueryString("d") Then
                    DropDownListDay.SelectedIndex = i
                    Exit For
                End If
            Next
        End If
    End Sub

    Protected Sub Button1_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles Button1.Click
        Response.Redirect("ReportCreditByProductEmp.aspx?y=" & DropDownListYear.Items(DropDownListYear.SelectedIndex).Value & "&m=" & DropDownListMonth.Items(DropDownListMonth.SelectedIndex).Value & "&d=" & DropDownListDay.Items(DropDownListDay.SelectedIndex).Value)

    End Sub


    Protected Sub GridView1_RowDataBound(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewRowEventArgs) Handles GridView1.RowDataBound

        '  Select(1) |ID(2)| REG-DATE(3) | APP-DATE(4) | CIF(5) |CUSTOMER(5) | EMP-ID(6) |EMPLOYEE(7) |BRANCH-ID(8) BRANCH-NAME(9) REGION-ID(10) REGION-NAME(11)  
        'NEW(12) OLD(13) REVIEW(14) EXCEPTION(15) O-D (O-D) F-L (F-L) L-G (L-G) STL-PN (STL-PN) TRADE-FIN (TRADE-FIN) OTHERS (OTHERS) 

        If e.Row.RowType = DataControlRowType.DataRow Then
            intC += 1
          
            int3 += CInt(e.Row.Cells(3).Text)
            int4 += CInt(e.Row.Cells(4).Text)
            int5 += CInt(e.Row.Cells(5).Text)
            int6 += CInt(e.Row.Cells(6).Text)
            int7 += CInt(e.Row.Cells(7).Text)
            int8 += CInt(e.Row.Cells(8).Text)
            int9 += CInt(e.Row.Cells(9).Text)
            int10 += CInt(e.Row.Cells(10).Text)
            int11 += CInt(e.Row.Cells(11).Text)
            int12 += CInt(e.Row.Cells(12).Text)
            int13 += CInt(e.Row.Cells(13).Text)
            int14 += CInt(e.Row.Cells(14).Text)
            int15 += CInt(e.Row.Cells(15).Text)
            int16 += CInt(e.Row.Cells(16).Text)
            int17 += CInt(e.Row.Cells(17).Text)
            int18 += CInt(e.Row.Cells(18).Text)


        ElseIf e.Row.RowType = DataControlRowType.Footer Then

            e.Row.Cells(1).Text = "Total ( " & intC.ToString & ")"
            e.Row.Cells(3).Text = int3.ToString
            e.Row.Cells(4).Text = int4.ToString
            e.Row.Cells(5).Text = int5.ToString
            e.Row.Cells(6).Text = int6.ToString
           
            e.Row.Cells(7).Text = FormatNumber(int7.ToString, 0)
            e.Row.Cells(8).Text = FormatNumber(int8.ToString, 0)
            e.Row.Cells(9).Text = FormatNumber(int9.ToString, 0)
            e.Row.Cells(10).Text = FormatNumber(int10.ToString, 0)
            e.Row.Cells(11).Text = FormatNumber(int11.ToString, 0)
            e.Row.Cells(12).Text = FormatNumber(int12.ToString, 0)
            e.Row.Cells(13).Text = FormatNumber(int13.ToString, 0)
            e.Row.Cells(14).Text = FormatNumber(int14.ToString, 0)
            e.Row.Cells(15).Text = FormatNumber(int15.ToString, 0)
            e.Row.Cells(16).Text = FormatNumber(int16.ToString, 0)
            e.Row.Cells(17).Text = FormatNumber(int17.ToString, 0)
            e.Row.Cells(18).Text = FormatNumber(int18.ToString, 0)

       

        End If

    End Sub

    Protected Sub GridView1_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles GridView1.SelectedIndexChanged

    End Sub
End Class