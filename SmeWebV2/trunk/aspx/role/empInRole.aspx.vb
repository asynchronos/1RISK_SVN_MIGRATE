Option Explicit On
Option Strict On

Namespace aspx.role
    Partial Class EmpInRole
        Inherits aspx.role.RolePageClass

        Protected Sub GV_EmpInRole_DataBound(ByVal sender As Object, ByVal e As System.EventArgs)
            'ทุกครั้งที่ทำ Databound ให้ทำการเปลี่ยน SelectedIndex ใหม่
            DirectCast(sender, GridView).SelectedIndex = -1
        End Sub

        Protected Sub DS_AddEmpInRole_Inserted(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.SqlDataSourceStatusEventArgs)
            If Not IsNothing(e.Exception) Then
                Label_dbException.Text = e.Exception.Message
                e.ExceptionHandled = True
            End If

            GV_EmpInRole.DataBind()
        End Sub

        Protected Sub DS_AddEmpInRole_Inserting(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.SqlDataSourceCommandEventArgs)
            e.Command.Parameters.Item("@ROLE_ID").Value = DDL_RoleName.SelectedValue
        End Sub

        Protected Sub Butt_AddEmp_Click(ByVal sender As Object, ByVal e As System.EventArgs)
            FV_AddEmpInRole.ChangeMode(FormViewMode.Insert)
            Label_dbException.Text = Nothing
        End Sub

        Protected Sub EMP_ID_PopupBt_Load(ByVal sender As Object, ByVal e As System.EventArgs)
            Dim popupBt As ImageButton = DirectCast(sender, ImageButton)

            Dim textBoxEmpId As TextBox = DirectCast(popupBt.Parent.FindControl("TextBoxEMP_ID"), TextBox)
            Dim textBoxEmpName As TextBox = DirectCast(popupBt.Parent.FindControl("TextBoxEMP_NAME"), TextBox)

            popupBt.OnClientClick = "var cmPopup = window.open('" + Page.ResolveUrl("~/aspx/employee/EmployeeFilter.aspx") + "?returnIdTarget=" + textBoxEmpId.ClientID + "&returnIdProp=value&returnDetailTarget=" + textBoxEmpName.ClientID + "&returnDetailProp=value'" _
                                                            + ",'cmPopup'" _
                                                            + ",'toolbar=No,width=500,height=500,resizable=no,scrollbars=yes');" _
                                + "cmPopup.focus();" _
                                + "return false;"

        End Sub

        Protected Sub DDL_RoleCategory_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs)
            Server.Transfer("~/aspx/role/empInRole.aspx?cateId=" + DDL_RoleCategory.SelectedValue)
        End Sub

        Protected Sub DDL_RoleName_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles DDL_RoleName.SelectedIndexChanged
            Server.Transfer("~/aspx/role/empInRole.aspx?cateId=" + DDL_RoleCategory.SelectedValue + "&roleId=" + DDL_RoleName.SelectedValue)
        End Sub

        Protected Sub DDL_RoleName_DataBound(ByVal sender As Object, ByVal e As System.EventArgs) Handles DDL_RoleName.DataBound
            If hasQueryString(queryStringRoleId) Then
                DDL_RoleName.SelectedValue = getQueryString(queryStringRoleId)
            End If
        End Sub

        Protected Sub Page_InitComplete(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.InitComplete
            If hasQueryString(queryStringCategoryId) Then
                DDL_RoleCategory.SelectedValue = getQueryString(queryStringCategoryId)
            End If
        End Sub

        Protected Sub Butt_NewRole_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles Butt_NewRole.Click
            Server.Transfer("~/aspx/role/role.aspx?action=insert&cateId=" + DDL_RoleCategory.SelectedValue)
        End Sub

    End Class
End Namespace

