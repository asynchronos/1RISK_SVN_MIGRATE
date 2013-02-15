
Partial Class aspx_stop_stop_update
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        HyperLink1.NavigateUrl = Page.ResolveUrl("../stop/stop_update_detail.aspx?cif=" & Request("cif") & "&type=" & Request("type"))
        HyperLink1.Target = "frmupdate"
    End Sub
End Class
