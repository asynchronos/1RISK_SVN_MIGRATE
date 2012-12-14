Option Strict On
Option Explicit On

Namespace aspx.report
    Partial Class InProcessCA
        Inherits aspx.MyPageClass

        Protected Sub DDL_Level_DataBound(ByVal sender As Object, ByVal e As System.EventArgs) Handles DDL_Level.DataBound
            Select Case DirectCast(sender, DropDownList).Items.Count
                Case 0
                    DirectCast(sender, DropDownList).Visible = False
                    Label_Header.Visible = False
                Case Else
                    DirectCast(sender, DropDownList).Visible = True
                    Label_Header.Visible = True
            End Select
        End Sub

        Protected Sub GV_InProcessCA_RowCreated(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewRowEventArgs) Handles GV_InProcessCA.RowCreated
            If e.Row.RowType = DataControlRowType.DataRow Then

                Dim dataRow As Data.DataRowView = DirectCast(e.Row.DataItem, Data.DataRowView)

                If Not IsNothing(dataRow) Then
                    If (dataRow.Item("SIZE_DETAIL").ToString().Equals("SME_S") _
                        Or dataRow.Item("SIZE_DETAIL").ToString().Equals("SME_R")) _
                        And DirectCast(dataRow.Item("TIME_USE"), Decimal) > 5 Then

                        e.Row.Cells.Item(9).CssClass = "urgent"

                    ElseIf DirectCast(dataRow.Item("TIME_USE"), Decimal) > 15 Then
                        e.Row.Cells.Item(9).CssClass = "urgent"
                    End If
                End If

            End If
        End Sub

    End Class
End Namespace

