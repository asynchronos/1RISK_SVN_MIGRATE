Option Strict On
Option Explicit On

Namespace aspx.role
    Partial Class Role
        Inherits aspx.role.RolePageClass

        Protected Const queryStringAction As String = "action"

#Region "Get Control"
        Protected Function Hidd_RoleCategoryId() As HiddenField
            Return DirectCast(FV_Role.FindControl("Hidd_RoleCategoryId"), HiddenField)
        End Function

        Protected Function DDL_RoleCategory() As DropDownList
            Return DirectCast(FV_Role.FindControl("DDL_RoleCategory"), DropDownList)
        End Function
#End Region

        Protected Sub DS_RoleDetail_Deleted(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.SqlDataSourceStatusEventArgs) Handles DS_Role.Deleted
            Server.Transfer("~/aspx/role/role.aspx?action=insert")
        End Sub

        Protected Sub DS_RoleDetail_Inserted(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.SqlDataSourceStatusEventArgs) Handles DS_Role.Inserted
            Server.Transfer("~/aspx/role/role.aspx?action=view&roleId=" + TryCast(e.Command.Parameters.Item("@ROLE_ID").Value, String))
        End Sub

        Protected Sub Butt_NewCategory_Click(ByVal sender As Object, ByVal e As System.EventArgs)
            Server.Transfer("~/aspx/role/roleCategory.aspx?action=insert")
        End Sub

        Protected Sub LinkButt_RoleCategoryName_Click(ByVal sender As Object, ByVal e As System.EventArgs)
            Server.Transfer("~/aspx/role/roleCategory.aspx?action=view&cateId=" + Hidd_RoleCategoryId.Value)
        End Sub

        Protected Sub FV_Role_Init(ByVal sender As Object, ByVal e As System.EventArgs) Handles FV_Role.Init
            If Not Me.IsPostBack Then
                If hasQueryString(queryStringAction) Then
                    If getQueryString(queryStringAction).Equals("insert") Then
                        FV_Role.ChangeMode(FormViewMode.Insert)
                    End If
                End If
            End If
            getQueryString(queryStringRoleId)
        End Sub

        Protected Sub FV_Role_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles FV_Role.Load
            If Not Me.IsPostBack Then
                If hasQueryString(queryStringCategoryId) Then
                    If Not IsNothing(DDL_RoleCategory) Then
                        DDL_RoleCategory.SelectedValue = getQueryString(queryStringCategoryId)
                    End If
                End If
            End If
        End Sub

        Protected Sub Butt_EmpInRolePopup_PreRender(ByVal sender As Object, ByVal e As System.EventArgs) Handles Butt_EmpInRolePopup.PreRender
            Dim cateId As String = ""
            Dim roleId As String = ""

            If Not IsNothing(Hidd_RoleCategoryId) Then
                cateId = Hidd_RoleCategoryId.Value
            End If

            If hasQueryString(queryStringRoleId) Then
                roleId = getQueryString(queryStringRoleId)
            End If

            DirectCast(sender, Button).OnClientClick = "openPopup('EMPInRolePopup','" + Page.ResolveUrl("~/aspx/role/empInRole.aspx") + "','cateId=" + cateId + "&roleId=" + roleId + "');return false;"
        End Sub

        Protected Sub Butt_CifInRolePopup_PreRender(ByVal sender As Object, ByVal e As System.EventArgs) Handles Butt_CifInRolePopup.PreRender
            Dim cateId As String = ""
            Dim roleId As String = ""

            If Not IsNothing(Hidd_RoleCategoryId) Then
                cateId = Hidd_RoleCategoryId.Value
            End If

            If hasQueryString(queryStringRoleId) Then
                roleId = getQueryString(queryStringRoleId)
            End If

            DirectCast(sender, Button).OnClientClick = "openPopup('CIFInRolePopup','" + Page.ResolveUrl("~/aspx/role/cifInRole.aspx") + "','cateId=" + cateId + "&roleId=" + roleId + "');return false;"
        End Sub
    End Class
End Namespace