
Partial Class aspx_report_ReportPassBlackList
    Inherits System.Web.UI.Page

    Protected Sub ButtonSearch_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles ButtonSearch.Click
        If TextBoxLastname.Text = "" Then
            TextBoxLastname.Text = "%"
        End If
        Response.Redirect("ReportPassBlackList.aspx?name=" & TextBoxname.Text & "&lastname=" & TextBoxLastname.Text)


    End Sub

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

        If Not Page.IsPostBack Then
            '  MsgBox(Request.QueryString("name"))
            'MsgBox(Server.UrlEncode(Request.QueryString("name")))
            'MsgBox(HttpUtility.UrlEncode(Request.QueryString("name")))
            'Dim name As String = Request("name")
            'MsgBox(name)
            TextBoxname.Text = Request.QueryString("name")
            TextBoxLastname.Text = Request.QueryString("lastname")
 
        End If

    End Sub


End Class
