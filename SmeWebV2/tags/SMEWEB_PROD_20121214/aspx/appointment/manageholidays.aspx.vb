Imports System.Data
Imports System.Data.SqlClient
Imports System.Collections.Generic
Imports System.Globalization
Partial Class aspx_appointment_manageholidays
    Inherits System.Web.UI.Page

    Protected Sub Calendar1_DayRender(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.DayRenderEventArgs) Handles Calendar1.DayRender
        Dim dayArr As ArrayList = Session.Item("Days")
        Dim dayNameArr As ArrayList = Session.Item("DaysName")

        For i = 0 To dayArr.Count - 1
            'Response.Write(e.Day.Date & " : " & dayArr(i))
            If e.Day.Date = dayArr(i) Then
                e.Cell.BackColor = Drawing.Color.AntiqueWhite
            End If
        Next


    End Sub

    Protected Sub Calendar1_SelectionChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles Calendar1.SelectionChanged

        'FormView1.ChangeMode(FormViewMode.Insert)

    End Sub

    Protected Sub FormView1_DataBinding(ByVal sender As Object, ByVal e As System.EventArgs) Handles FormView1.DataBinding
        '  dfdf
    End Sub

    Protected Sub FormView1_DataBound(ByVal sender As Object, ByVal e As System.EventArgs) Handles FormView1.DataBound
        'dfdsf

        ' Dim Dayslabel As Label = DirectCast(FormView1.FindControl("DaysLabel1"), Label)
        'Dayslabel.Text = Calendar1.SelectedDate
        If FormView1.CurrentMode = FormViewMode.Insert Then

            Dim l1 As Label = DirectCast(FormView1.FindControl("DaysLabel1"), Label)
            If Calendar1.SelectedDate.ToString <> " " Then
                l1.Text = Calendar1.SelectedDate
            End If
        End If

    End Sub

    Protected Sub Button1_Click(ByVal sender As Object, ByVal e As System.EventArgs)

    End Sub

    Protected Sub DaysTextBox_TextChanged(ByVal sender As Object, ByVal e As System.EventArgs)

    End Sub

    Protected Sub FormView1_PageIndexChanging(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.FormViewPageEventArgs) Handles FormView1.PageIndexChanging

    End Sub

    Protected Sub SqlDataSource1_Inserting(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.SqlDataSourceCommandEventArgs) Handles SqlDataSource1.Inserting
        'MsgBox(e.Command.Parameters("@Days").Value)
        'MsgBox(e.Command.Parameters("@Days_Name").Value)
    End Sub

    Protected Sub SqlDataSource1_Updating(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.SqlDataSourceCommandEventArgs) Handles SqlDataSource1.Updating
        'MsgBox(e.Command.Parameters("@Days_Name").Value)
        'MsgBox(e.Command.Parameters("@original_Days").Value)
        'MsgBox(e.Command.Parameters("@original_Days_Name").Value)
    End Sub

    Protected Sub Button1_Click1(ByVal sender As Object, ByVal e As System.EventArgs)
        FormView1.ChangeMode(FormViewMode.Insert)

    End Sub
    Sub FindDay()

        Dim sql As String = " Select * from tb_holiday "

        Dim sqlCmd As SqlCommand
        Dim sqlConn As SqlConnection
        Dim sqlReader As SqlDataReader

        sqlConn = ConnectionUtil.getSqlConnectionFromWebConfig()
        sqlCmd = New SqlCommand(sql, sqlConn)
        sqlCmd.CommandType = CommandType.Text


        sqlReader = sqlCmd.ExecuteReader
        Dim DayArr As New ArrayList
        Dim DayNameArr As New ArrayList

        While (sqlReader.Read)
            DayArr.Add(sqlReader("Days"))
            DayNameArr.Add(sqlReader("Days_Name"))
        End While

        Session.Add("Days", DayArr)
        Session.Add("DaysName", DayNameArr)

    End Sub

    Protected Sub form1_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles form1.Load
        If Not Page.IsPostBack Then
            FindDay()
        End If
    End Sub
End Class
