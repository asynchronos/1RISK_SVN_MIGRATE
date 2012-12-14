Option Explicit On
Option Strict On

Partial Class aspx_employee_Department
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        
    End Sub

    Protected Sub DepartmentGridView_RowDataBound(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewRowEventArgs) Handles DepartmentGridView.RowDataBound
        If e.Row.RowType = DataControlRowType.DataRow Then
            Dim SelectLinkBt As LinkButton = DirectCast(e.Row.Cells(0).FindControl("SelectLinkButton"), LinkButton)
            Dim Id_departLabel As Label = DirectCast(e.Row.Cells(1).FindControl("Label1"), Label)

            SelectLinkBt.OnClientClick = "returnTarget('" + Id_departLabel.Text + "');window.self.close();"
        End If
    End Sub
End Class
