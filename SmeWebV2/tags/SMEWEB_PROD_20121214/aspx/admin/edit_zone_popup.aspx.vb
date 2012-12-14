
Partial Class admin_edit_zone_popup
    Inherits System.Web.UI.Page
    Public strZone As String

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

        strZone = Request.QueryString("c")
        'from setting
        EditForm.DataSourceID = "data"
        EditForm.AllowPaging = "true"
        Dim strId = Request.QueryString("id")
        If strId = "" Then
            data.SelectCommand = "SELECT * FROM [TB_Contents] WHERE id = 1"
            data.UpdateCommand = "UPDATE [TB_Contents] SET Name=@Name, Contents=@Contents WHERE id=1"
            data.DeleteCommand = "DELETE FROM TB_Contents WHERE id = 1"
        Else
            data.SelectCommand = "SELECT * FROM [TB_Contents] where id = " & strId
            data.UpdateCommand = "UPDATE [TB_Contents] SET Name=@Name, Contents=@Contents WHERE id=" & strId
            data.DeleteCommand = "DELETE FROM TB_Contents WHERE id = " & Request.QueryString("id")
        End If

        data.ConnectionString = ConfigurationManager.ConnectionStrings(ConnectionUtil.getConnectionString(ConnectionUtil.ConnectionString.BAY01ConnectionString)).ConnectionString
    End Sub


    Sub EmployeeFormView_ItemDeleted(ByVal sender As Object, ByVal e As FormViewDeletedEventArgs) Handles EditForm.ItemDeleted
        If e.Exception Is Nothing Then
            If e.AffectedRows = 1 Then
                form_wrapper.Visible = False
                MessageLabel.Text = "Record deleted successfully."

            Else
                form_wrapper.Visible = False
                MessageLabel.Text = "An error occurred during the delete operation."
            End If
        Else

            MessageLabel.Text = e.Exception.Message
            e.ExceptionHandled = True
        End If

    End Sub

    Sub EmployeeFormView_ItemUpdated(ByVal sender As Object, ByVal e As FormViewUpdatedEventArgs) Handles EditForm.ItemUpdated
        If e.Exception Is Nothing Then
            If e.AffectedRows = 1 Then
                form_wrapper.Visible = False
                MessageLabel.Text = "<span class='message2'>updated successfully</span>"
            Else
                form_wrapper.Visible = False
                MessageLabel.Text = "<span class='message'>An error occurred during the update operation</span>"
                e.KeepInEditMode = True
            End If

        Else
            MessageLabel.Text = e.Exception.Message
            e.ExceptionHandled = True
            e.KeepInEditMode = True
        End If

    End Sub
End Class
