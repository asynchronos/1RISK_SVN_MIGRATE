
Partial Class aspx_customer_CreditPerformance
    Inherits System.Web.UI.Page

    Private Sub gvByCustomer_RowDataBound(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewRowEventArgs) Handles gvByCustomer.RowDataBound
        Dim lblNPL_Flag As New Label
        Dim lblTDR_Flag As New Label
        Dim lblWriteoff_Flag As New Label
        If e.Row.RowType = DataControlRowType.DataRow Then
            lblNPL_Flag = DirectCast(e.Row.FindControl("lblNPL_Flag"), Label)
            lblTDR_Flag = DirectCast(e.Row.FindControl("lblTDR_Flag"), Label)
            lblWriteoff_Flag = DirectCast(e.Row.FindControl("lblWriteoff_Flag"), Label)

            If lblNPL_Flag.Text = "Y" Then
                lblNPL_Flag.ForeColor = Drawing.Color.Red
            Else
                lblNPL_Flag.ForeColor = Drawing.Color.Green
            End If

            If lblTDR_Flag.Text = "Y" Then
                lblTDR_Flag.ForeColor = Drawing.Color.Red
            Else
                lblTDR_Flag.ForeColor = Drawing.Color.Green
            End If

            If lblWriteoff_Flag.Text = "Y" Then
                lblWriteoff_Flag.ForeColor = Drawing.Color.Red
            Else
                lblWriteoff_Flag.ForeColor = Drawing.Color.Green
            End If
        End If
    End Sub

    Protected Sub listFilter_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles listFilter.SelectedIndexChanged
        Dim drop As DropDownList = DirectCast(sender, DropDownList)

        If drop.SelectedValue.Equals("CIF") Then
            filterTextBox.Text = String.Empty
            RegularExpressionValidator1.Enabled = True
        Else
            RegularExpressionValidator1.Enabled = False
        End If
    End Sub

    Private Sub FormView3_DataBound(ByVal sender As Object, ByVal e As System.EventArgs) Handles FormView3.DataBound
        Dim TDR_FlagLabel As New Label
        If FormView3.CurrentMode = FormViewMode.ReadOnly Then
            If FormView3.Row.RowType = DataControlRowType.DataRow Then
                TDR_FlagLabel = DirectCast(sender.FindControl("TDR_FlagLabel"), Label)

                If TDR_FlagLabel.Text = "Y" Then
                    TDR_FlagLabel.ForeColor = Drawing.Color.Red
                Else
                    TDR_FlagLabel.ForeColor = Drawing.Color.Green
                End If

            End If
        End If
    End Sub


    Private Sub FormView1_DataBound(ByVal sender As Object, ByVal e As System.EventArgs) Handles FormView1.DataBound
        Dim Npl_FlagLabel As New Label
        If FormView1.CurrentMode = FormViewMode.ReadOnly Then
            If FormView1.Row.RowType = DataControlRowType.DataRow Then
                Npl_FlagLabel = DirectCast(sender.FindControl("Npl_FlagLabel"), Label)

                If Npl_FlagLabel.Text = "Y" Then
                    Npl_FlagLabel.ForeColor = Drawing.Color.Red
                Else
                    Npl_FlagLabel.ForeColor = Drawing.Color.Green
                End If

            End If
        End If
    End Sub
    Private Sub FormView2_DataBound(ByVal sender As Object, ByVal e As System.EventArgs) Handles FormView2.DataBound
        Dim WriteOff_Sale_FlagLabel As New Label
        Dim WriteOff_FlagLabel As New Label
        Dim NPLSaleFlagLabel As New Label
        If FormView2.CurrentMode = FormViewMode.ReadOnly Then
            If FormView2.Row.RowType = DataControlRowType.DataRow Then
                WriteOff_Sale_FlagLabel = DirectCast(sender.FindControl("WriteOff_Sale_FlagLabel"), Label)
                WriteOff_FlagLabel = DirectCast(sender.FindControl("WriteOff_FlagLabel"), Label)
                NPLSaleFlagLabel = DirectCast(sender.FindControl("NPLSaleFlagLabel"), Label)

                If WriteOff_Sale_FlagLabel.Text = "Y" Then
                    WriteOff_Sale_FlagLabel.ForeColor = Drawing.Color.Red
                Else
                    WriteOff_Sale_FlagLabel.ForeColor = Drawing.Color.Green
                End If

                If WriteOff_FlagLabel.Text = "Y" Then
                    WriteOff_FlagLabel.ForeColor = Drawing.Color.Red
                Else
                    WriteOff_FlagLabel.ForeColor = Drawing.Color.Green
                End If

                If NPLSaleFlagLabel.Text = "Y" Then
                    NPLSaleFlagLabel.ForeColor = Drawing.Color.Red
                Else
                    NPLSaleFlagLabel.ForeColor = Drawing.Color.Green
                End If
            End If
        End If

    End Sub

End Class
