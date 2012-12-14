
Partial Class aspx_stop_sm_update
    Inherits System.Web.UI.Page

    Protected Sub SqlDataSource1_Updated(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.SqlDataSourceStatusEventArgs) Handles SqlDataSource1.Updated
        ' MessageBox.Show(e.AffectedRows.ToString());
        Dim Message As String
        If e.AffectedRows.ToString() = "-1" Then
            Message = "Cannot update data."
        Else
            Message = "Update Successed."
        End If
        Dim Str = "alert(""" & Message & """);parent.location='sm_history.aspx';"
        Page.ClientScript.RegisterStartupScript(Me.GetType(), "messagebox", Str, True)

    End Sub
    Protected Sub SqlDataSource1_Deleteted(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.SqlDataSourceStatusEventArgs) Handles SqlDataSource1.Deleted
        ' MessageBox.Show(e.AffectedRows.ToString());
        Dim Message As String
        If e.AffectedRows.ToString() = "-1" Then
            Message = "Cannot delete data."
        Else
            Message = "Delete Successed."
        End If
        Dim Str = "alert(""" & Message & """);parent.location='sm_history.aspx';"
        Page.ClientScript.RegisterStartupScript(Me.GetType(), "messagebox", Str, True)

    End Sub



End Class
