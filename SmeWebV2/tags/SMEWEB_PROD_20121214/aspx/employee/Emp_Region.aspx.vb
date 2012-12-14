
Partial Class aspx_employee_Emp_Region
    Inherits System.Web.UI.Page

    Protected Sub DropDownList1_DataBound(ByVal sender As Object, ByVal e As System.EventArgs) Handles DropDownList1.DataBound
        DropDownList1.Items.Insert(0, New ListItem("ALL", ""))
    End Sub

    Protected Sub Button1_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles Button1.Click

        Dim emp_id As String = DropDownList2.Items(DropDownList2.SelectedIndex).Value
        Dim Id_Region As Integer = DropDownList1.Items(DropDownList1.SelectedIndex).Value

        SqlDataSourceView.InsertCommand = "insert into Controlling_Users_Region values (" & Id_Region & ",'" & emp_id & "')"
        SqlDataSourceView.Insert()

        selectEmp()
    End Sub

    Protected Sub DropDownList2_DataBound(ByVal sender As Object, ByVal e As System.EventArgs) Handles DropDownList2.DataBound
        DropDownList2.Items.Insert(0, New ListItem("ALL", ""))
    End Sub

    Protected Sub DropDownList2_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles DropDownList2.SelectedIndexChanged
        selectEmp()
    End Sub
    Sub selectEmp()
        Dim strSearch = DropDownList2.Items(DropDownList2.SelectedIndex).Value
        If strSearch <> "" Then
            SqlDataSourceView.SelectCommand = "SELECT id,[EMP_ID], [TITLE_NAME], [EMPNAME], [EMPSURNAME], [Id_Region], [Region_Name] FROM [CONTROLLING_LINE_FULL_WITH_REGION] where Emp_ID='" & strSearch & "'"
        Else
            SqlDataSourceView.SelectCommand = "SELECT id,[EMP_ID], [TITLE_NAME], [EMPNAME], [EMPSURNAME], [Id_Region], [Region_Name] FROM [CONTROLLING_LINE_FULL_WITH_REGION] "
        End If
    End Sub
End Class
