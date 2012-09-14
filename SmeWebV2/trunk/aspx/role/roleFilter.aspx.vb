Option Explicit On
Option Strict On

Namespace aspx.role
    Partial Class RoleFilter
        Inherits aspx.role.RolePageClass

        Protected Const queryStringFilterText As String = "filterText"
        Protected Const queryStringHasFilterText As String = "hasFilterText"

#Region "Get Control"
        Protected Function GV_Role() As GridView
            Return DirectCast(FV_RoleFilter.FindControl("GV_Role"), GridView)
        End Function

        Protected Function GV_RoleLink() As GridView
            Return DirectCast(FV_RoleFilter.FindControl("GV_RoleLink"), GridView)
        End Function


        Protected Function DS_Role() As SqlDataSource
            Return DirectCast(FV_RoleFilter.FindControl("DS_Role"), SqlDataSource)
        End Function

        Protected Function DS_RoleLink() As SqlDataSource
            Return DirectCast(FV_RoleFilter.FindControl("DS_RoleLink"), SqlDataSource)
        End Function



        Protected Function DDL_RoleCategory() As DropDownList
            Return DirectCast(FV_RoleFilter.FindControl("DDL_RoleCategory"), DropDownList)
        End Function



        Protected Function TextBox_RoleFilter() As TextBox
            Return DirectCast(FV_RoleFilter.FindControl("TextBox_RoleFilter"), TextBox)
        End Function



        Protected Function Hidd_RoleFilter() As HiddenField
            Return DirectCast(FV_RoleFilter.FindControl("Hidd_RoleFilter"), HiddenField)
        End Function
#End Region

        Protected Sub GV_Role_DataBound(ByVal sender As Object, ByVal e As System.EventArgs)
            DirectCast(sender, GridView).SelectedIndex = -1
            GV_RoleLink.DataSourceID = String.Empty
        End Sub

        Protected Sub LinkButt_RoleName_Click(ByVal sender As Object, ByVal e As System.EventArgs)
            Server.Transfer("~/aspx/role/role.aspx?action=view&roleId=" + DirectCast(DirectCast(sender, LinkButton).Parent.FindControl("Label_RoleId"), Label).Text)
        End Sub

        Protected Sub Butt_Search_Click(ByVal sender As Object, ByVal e As System.EventArgs)
            Dim url As String = "~/aspx/role/roleFilter.aspx?cateId=" + DDL_RoleCategory.SelectedValue
            If TextBox_RoleFilter.Text.Trim.Length >= 1 Then
                url += "&hasFilterText=true&filterText=" + TextBox_RoleFilter.Text
            End If
            Server.Transfer(url)
        End Sub

        Protected Sub Butt_RoleLink_Click(ByVal sender As Object, ByVal e As System.EventArgs)
            GV_RoleLink.DataSourceID = DS_RoleLink.ID
        End Sub

        Protected Sub LinkButt_Desc_Click(ByVal sender As Object, ByVal e As System.EventArgs)
            Dim url As String = DirectCast(DirectCast(sender, LinkButton).Parent.FindControl("Label_Link"), Label).Text
            Server.Transfer(url + "?cateId=" + DDL_RoleCategory.SelectedValue + "&roleId=" + GV_Role.SelectedValue.ToString())
        End Sub

        Protected Sub TextBox_RoleFilter_Load(ByVal sender As Object, ByVal e As System.EventArgs)
            If hasQueryString(queryStringHasFilterText) Then
                TextBox_RoleFilter.Text = getQueryString(queryStringFilterText)
            Else
                TextBox_RoleFilter.Text = String.Empty
            End If
        End Sub

        Protected Sub Hidd_RoleFilter_Load(ByVal sender As Object, ByVal e As System.EventArgs)
            If hasQueryString(queryStringHasFilterText) Then
                Hidd_RoleFilter.Value = "%" + getQueryString(queryStringFilterText) + "%"
            Else
                Hidd_RoleFilter.Value = " "
            End If
        End Sub

        Protected Sub Butt_NewRole_Click(ByVal sender As Object, ByVal e As System.EventArgs)
            Server.Transfer("~/aspx/role/role.aspx?action=insert&cateId=" + DDL_RoleCategory.SelectedValue)
        End Sub

    End Class
End Namespace

