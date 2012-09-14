Option Strict On
Option Explicit On

Partial Class test_SqlDataSource
    Inherits System.Web.UI.Page

    Protected Sub Button1_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles Button1.Click
        Dim dv As Data.DataView = TryCast(SqlDataSource1.Select(DataSourceSelectArguments.Empty), Data.DataView)

        GridView2.DataSource = dv.Table.DataSet.Tables.Item(1) '= dv.Table.DataSet.Tables.Item("DefaultView1") 
        GridView2.DataBind()

        Dim levelLineTable As System.Data.DataTable = dv.Table.DataSet.Tables.Item("DefaultView")
        Dim userLineTable As System.Data.DataTable = dv.Table.DataSet.Tables.Item("DefaultView1")


        For i As Integer = 0 To userLineTable.Rows.Count - 1
            Dim dRow As Data.DataRow = userLineTable.Rows(i)

            For j As Integer = 0 To userLineTable.Columns.Count - 1
                Dim dColumn As Data.DataColumn = userLineTable.Columns(j)

                Response.Write(dColumn.ColumnName + " = " + dRow.Item(j).ToString + "<br/>")
            Next

            Response.Write("<br/>")
        Next
    End Sub

    Protected Sub ImageButton1_Click(ByVal sender As Object, ByVal e As System.Web.UI.ImageClickEventArgs) Handles ImageButton1.Click
        MsgBox(TextBox2_CalendarExtender.SelectedDate)

        Dim d As DateTime = DateTime.ParseExact("29/12/2552", "dd/MM/yyyy", New System.Globalization.CultureInfo("th-TH"))
        MsgBox(d.ToString("dd/MM/yyyy"))
    End Sub
End Class
