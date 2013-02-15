Option Explicit On
Option Strict On

Namespace aspx.role

    Partial Class RoleCategory
        Inherits aspx.role.RolePageClass

        Protected Const queryStringAction As String = "action"

        Protected Sub DS_RoleCategory_Deleted(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.SqlDataSourceStatusEventArgs) Handles DS_RoleCategory.Deleted
            Server.Transfer("~/aspx/role/roleCategory.aspx?action=insert")
        End Sub

        Protected Sub DS_RoleCategory_Inserted(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.SqlDataSourceStatusEventArgs) Handles DS_RoleCategory.Inserted
            Server.Transfer("~/aspx/role/roleCategory.aspx?action=view&id=" + TryCast(e.Command.Parameters.Item("@ROLE_CATEGORY_ID").Value, String))
        End Sub

        Protected Sub FV_RoleCategory_Init(ByVal sender As Object, ByVal e As System.EventArgs) Handles FV_RoleCategory.Init
            If Not Me.IsPostBack Then
                If hasQueryString(queryStringAction) Then
                    If getQueryString(queryStringAction).Equals("insert") Then
                        FV_RoleCategory.ChangeMode(FormViewMode.Insert)
                    End If
                End If
            End If
        End Sub

    End Class

End Namespace