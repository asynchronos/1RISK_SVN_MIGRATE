Imports System.Data
Imports CheckDrawn.linq

Partial Class CAApproveList
    Inherits aspx.MyPageClass

    Dim prevCAId As String

    Protected Sub GridViewCAByApproveDate_RowDataBound(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewRowEventArgs) Handles GridViewCAByApproveDate.RowDataBound
        If e.Row.RowType = DataControlRowType.DataRow Then

            Dim LabelCA_NO_ID As ITextControl = DirectCast(e.Row.FindControl("LabelCA_NO_ID"), ITextControl)
            Dim LinkButtonCA_NO_IDShow As IButtonControl = DirectCast(e.Row.FindControl("LinkButtonCA_NO_IDShow"), IButtonControl)

            LinkButtonCA_NO_IDShow.Text = LabelCA_NO_ID.Text.Substring(0, 4) + "/" + LabelCA_NO_ID.Text.Substring(4)

            If DirectCast(e.Row.DataItem, CheckDrawn.linq.R_COUNT_MAPPING).CountNullMappingStatus.Equals(0) Then
                e.Row.CssClass = "mappingAll"
            End If

            'check dup CA
            'If (LabelCA_NO_ID.Text.Equals(prevCAId)) Then
            '    'do nothing
            'Else
            '    LinkButtonCA_NO_IDShow.Text = LabelCA_NO_ID.Text.Substring(0, 4) + "/" + LabelCA_NO_ID.Text.Substring(4)
            '    prevCAId = LabelCA_NO_ID.Text
            'End If

            'make sub gridview
            'Dim GridViewLimitByCA As GridView = DirectCast(e.Row.FindControl("GridViewLimitByCA"), GridView)
            'Using SQLDS = New SqlDataSource()
            '    SQLDS.ConnectionString = ConfigurationManager.ConnectionStrings("BAY01ConnectionString").ConnectionString
            '    SQLDS.SelectCommandType = SqlDataSourceCommandType.StoredProcedure
            '    SQLDS.SelectCommand = "P_LIMIT_SELECT_BY_CA"
            '    SQLDS.SelectParameters.Add("leader1CAOldId", DirectCast(e.Row.DataItem, REPORT39_38_BY_CA).OLD_ID)

            '    GridViewLimitByCA.DataSource = SQLDS
            '    GridViewLimitByCA.DataBind()
            'End Using
        End If
    End Sub

    Protected Sub txtBoxApproveDate_Init(ByVal sender As Object, ByVal e As System.EventArgs) Handles txtBoxApproveDate.Init
        Dim txt As ITextControl = DirectCast(sender, ITextControl)

        txt.Text = DateTime.Now.ToString("d", Application.Get(ApplicationKeyConst.App_Culture))
    End Sub

    Protected Sub txtBoxApproveDateEnd_Init(ByVal sender As Object, ByVal e As System.EventArgs) Handles txtBoxApproveDateEnd.Init
        Dim txt As ITextControl = DirectCast(sender, ITextControl)

        txt.Text = DateTime.Now.ToString("d", Application.Get(ApplicationKeyConst.App_Culture))
    End Sub

End Class
