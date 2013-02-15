
Partial Class aspx_uploadfile_Default
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        Response.Write(Server.MapPath("../../FileUpload/0/1000022008_1.gif"))

    End Sub
End Class
