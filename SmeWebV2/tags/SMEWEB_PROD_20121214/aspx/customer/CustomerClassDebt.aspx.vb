Option Strict On
Option Explicit On

Namespace aspx.customer
    Partial Class CustomerClassDebt
        Inherits aspx.MyPageClass

        'Protected Sub GridView1_RowDataBound(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewRowEventArgs) Handles GridView1.RowDataBound
        '    'If e.Row.RowType = DataControlRowType.DataRow Then
        '    '    Dim idRating As String = DirectCast(DataBinder.Eval(e.Row.DataItem, "Id_rating"), String)
        '    '    If idRating.StartsWith("N") And Not idRating.Equals("N00") Then
        '    '        e.Row.Visible = False
        '    '    End If
        '    'End If
        'End Sub

        'Sub Change_View(ByVal Src As Object, ByVal Args As CommandEventArgs)

        '    Select Case (Args.CommandName)
        '        Case "View1"
        '            ValidationViews.SetActiveView(View1)
        '        Case "View2"
        '            ValidationViews.SetActiveView(View2)
        '    End Select
        'End Sub

        Public Function MappingClassify(ByVal input As Object) As String
            Dim result As String = String.Empty

            If Not IsNothing(input) Then
                If input.Equals("¡") Then
                    result = "DOL"
                ElseIf input.Equals("¢") Then
                    result = "DOF"
                ElseIf input.Equals("¤") Then
                    result = "SUB"
                ElseIf input.Equals("§") Then
                    result = "SM"
                ElseIf input.Equals("¨") Then
                    result = "PASS"
                ElseIf input.Equals("-") Then
                    result = "-"
                End If
            End If

            Return result
        End Function
    End Class

End Namespace
