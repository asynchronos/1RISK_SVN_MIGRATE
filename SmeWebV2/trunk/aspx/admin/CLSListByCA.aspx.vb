Imports CheckDrawn.linq

Partial Class CLSListByCA
    Inherits aspx.MyPageClass

    Protected Sub GridViewLimitByCA_RowDataBound(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewRowEventArgs)
        If e.Row.RowType = DataControlRowType.Header Then
            'e.Row.Attributes.CssStyle.Add("position", "absolute")
        End If

        If e.Row.RowType = DataControlRowType.DataRow Then
            Dim TextControlLIMIT_NO As ITextControl
            Dim TextControlLIMIT_NOShow As ITextControl
            Dim TextControlLIMIT_TYPE As ITextControl

            TextControlLIMIT_NO = DirectCast(e.Row.FindControl("LabelLIMIT_NO"), ITextControl)
            TextControlLIMIT_NOShow = DirectCast(e.Row.FindControl("LabelLIMIT_NOShow"), ITextControl)
            TextControlLIMIT_TYPE = DirectCast(e.Row.FindControl("LabelLIMIT_TYPE"), ITextControl)

            If TextControlLIMIT_TYPE.Text.Equals("R") Then
                If TextControlLIMIT_NO.Text.Trim().Length < 1 Then
                    'ถ้าไม่มี Limit No แสดงว่าเป็น dummy
                    e.Row.CssClass = "clsDummyRow"

                    'show edit button
                    If e.Row.RowState = DataControlRowState.Normal Or _
                        e.Row.RowState = DataControlRowState.Alternate Then
                        e.Row.FindControl("LinkButtonEdit").Visible = True
                    End If
                Else
                    TextControlLIMIT_NOShow.Text = TextControlLIMIT_NO.Text
                    e.Row.CssClass = "clsRootRow"
                End If
            ElseIf TextControlLIMIT_TYPE.Text.Equals("L") Then
                TextControlLIMIT_NOShow.Text = "&nbsp;&nbsp;&nbsp;" + TextControlLIMIT_NO.Text
                e.Row.CssClass = "clsLineRow"
            ElseIf TextControlLIMIT_TYPE.Text.Equals("P") Then
                TextControlLIMIT_NOShow.Text = "&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;" + TextControlLIMIT_NO.Text
                e.Row.CssClass = "clsProductRow"

                'show edit button
                If e.Row.RowState = DataControlRowState.Normal Or _
                    e.Row.RowState = DataControlRowState.Alternate Then
                    e.Row.FindControl("LinkButtonEdit").Visible = True
                End If
            Else
                TextControlLIMIT_NOShow.Text = "Please Contact Adminstrator:2630"
            End If

        End If
    End Sub

    Protected Sub ObjectDataSource_CLSSubGrid_Updating(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.ObjectDataSourceMethodEventArgs) Handles ObjectDataSource_CLSSubGrid.Updating
        'DirectCast(e.InputParameters(0), P_CLS_SELECT_BY_CAResult).LIMIT_CHANGE_DATE = DateTime.Now
    End Sub

End Class
