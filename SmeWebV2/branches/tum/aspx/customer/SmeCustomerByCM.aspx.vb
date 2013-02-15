Option Strict On
Option Explicit On

Namespace aspx.customer
    Partial Class SmeCustomerByCM
        Inherits aspx.MyPageClass

        Protected Sub SelectLinkButton_Click(ByVal sender As Object, ByVal e As System.EventArgs)
            Dim selectLink As LinkButton = DirectCast(sender, LinkButton)
            Dim cifLabel As Label = DirectCast(selectLink.Parent.FindControl("CIFLabel"), Label)
            Response.Redirect(Page.ResolveUrl("~/aspx/portfolio/smeCustomerDetail.aspx?CIF=" + cifLabel.Text))
        End Sub

        Protected Sub GridView1_PreRender(ByVal sender As Object, ByVal e As System.EventArgs) Handles GridView1.PreRender
            If DirectCast(sender, GridView).Rows.Count > 0 Then
                ExportControl1.Visible = True
            Else
                ExportControl1.Visible = False
            End If
        End Sub

        Protected Sub ControllingTree1_Init(ByVal sender As Object, ByVal e As System.EventArgs) Handles ControllingTree1.Init
            DirectCast(sender, ControllingTree).EMP_ID_ROOT = User.Identity.Name
        End Sub

        Protected Sub ControllingTree1_SelectedNodeChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles ControllingTree1.SelectedNodeChanged
            Dim treeLine As ControllingTree = DirectCast(sender, ControllingTree)
            Hidd_TreeSelectedEmpIds.Value = treeLine.SelectedEmpIds
            Hidd_TreeSelectedValue.Value = treeLine.SelectedValue
            Hidd_TreeSelectedValueType.Value = treeLine.SelectedValueType
        End Sub

        Protected Sub Page_PreRender(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.PreRender
            TreeSelectedLabel.Text = ControllingTree1.SelectedText
            Hidd_TreeSelectedEmpIds.Value = ControllingTree1.SelectedEmpIds
            Hidd_TreeSelectedValue.Value = ControllingTree1.SelectedValue
            Hidd_TreeSelectedValueType.Value = ControllingTree1.SelectedValueType
        End Sub


    End Class
End Namespace
