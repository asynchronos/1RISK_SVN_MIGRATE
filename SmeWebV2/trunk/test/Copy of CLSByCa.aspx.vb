
Partial Class CLSByCa
    Inherits aspx.MyPageClass

    Dim prevCAId As String
    Dim prevCif As String

    Protected Sub GridViewCLSByCa_RowDataBound(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewRowEventArgs) Handles GridViewCLSByCa.RowDataBound
        If (e.Row.RowType = DataControlRowType.DataRow) Then
            'check dup CA
            Dim labelOLD_CA_ID As Label = DirectCast(e.Row.FindControl("labelOLD_CA_ID"), Label)
            Dim labelOLD_CA_IDShow As Label = DirectCast(e.Row.FindControl("labelOLD_CA_IDShow"), Label)
            Dim CAId = labelOLD_CA_ID.Text.Substring(6, 4) + labelOLD_CA_ID.Text.Substring(0, 6)

            If (CAId.Equals(prevCAId)) Then
                'do nothing
            Else
                labelOLD_CA_IDShow.Text = CAId
                'เปลี่ยน prevCAId
                prevCAId = CAId
            End If



            'check dup Cif
            Dim labelCif As Label = DirectCast(e.Row.FindControl("labelCif"), Label)
            Dim labelCifShow As Label = DirectCast(e.Row.FindControl("labelCifShow"), Label)

            If (labelCif.Text.Equals(prevCif)) Then
                'do nothing
            Else
                labelCifShow.Text = labelCif.Text
                'เปลี่ยน prevCAId
                prevCif = labelCif.Text
            End If

        End If
    End Sub

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        Dim imgUrl As String = Page.ResolveUrl("~/test/Watermark.aspx?text=" + Session.Item(SessionKeyConst.EMP_NAME))
        DirectCast(Master, SMEWeb.MasterPage).BodyTag.Attributes.Item("style") = "background-image:url(" + imgUrl + ");background-repeat:repeat;z-index:1"
    End Sub
End Class
