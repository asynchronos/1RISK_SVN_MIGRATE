Option Strict On
Option Explicit On

Namespace aspx.customer
    Partial Class SmeGroupDetail
        Inherits aspx.MyPageClass

        Protected Sub LinkButton1_Load(ByVal sender As Object, ByVal e As System.EventArgs)
            If User.IsInRole(RoleIdConst.A_READ_ONLY) Then
                DirectCast(sender, WebControl).Enabled = False
            Else
                DirectCast(sender, LinkButton).OnClientClick = "return confirm(""คุณต้องการเอา CIF นี้ออกจากกลุ่ม?"");"
            End If
        End Sub

        Protected Sub SqlDataSource1_Deleted(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.SqlDataSourceStatusEventArgs) Handles SqlDataSource1.Deleted
            Dim script As String = "if (window.parent != window) {" _
                                + "     window.parent.frames['SmeCusIframe1'].location.reload();" _
                                + "     window.parent.frames['SmeCusIframe2'].location.reload();" _
                                + "}"

            Page.ClientScript.RegisterStartupScript(Me.GetType, "reload", script, True)
        End Sub

        Protected Sub SqlDataSource1_Deleting(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.SqlDataSourceCommandEventArgs) Handles SqlDataSource1.Deleting
            'UPDATE_BY
            e.Command.Parameters.Item(2).Value = User.Identity.Name
            'UPDATE_DATE
            e.Command.Parameters.Item(3).Value = DateTime.Now
        End Sub

        Protected Sub Header_Label_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Header_Label.Load
            Dim groupId As String = Request.QueryString.Get("groupId")
            If Not IsNothing(groupId) Then
                DirectCast(sender, Label).Text = "รายชื่อ CIF ในกลุ่ม (GROUP ID : " + groupId + ")"
            End If
        End Sub
    End Class
End Namespace

