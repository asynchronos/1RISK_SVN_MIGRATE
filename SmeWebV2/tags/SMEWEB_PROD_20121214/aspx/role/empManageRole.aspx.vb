Option Explicit On
Option Strict On

Namespace aspx.role
    Partial Class EmpManageRole
        Inherits aspx.role.RolePageClass

#Region "My Code For Move ListBox"
        Protected Function getListBoxValues(ByVal listBoxControl As ListBox) As String
            Dim result As String = Nothing

            For i As Integer = 0 To listBoxControl.Items.Count - 1
                result = result + listBoxControl.Items(i).Value + ";"
            Next

            Return result
        End Function

        Protected Sub moveSelectedItem(ByVal srcListBox As ListBox, ByVal destinationListBox As ListBox)
            Dim srcItemTotal As Integer = srcListBox.Items.Count - 1
            Dim srcItemIndex As Integer = 0

            'Reset SelectedIndex ฝั่ง destination
            For i As Integer = 0 To destinationListBox.Items.Count - 1
                destinationListBox.Items(i).Selected = False
            Next

            For i As Integer = srcItemIndex To srcItemTotal
                If srcListBox.Items(srcItemIndex).Selected Then
                    destinationListBox.Items.Add(srcListBox.Items(srcItemIndex))
                    srcListBox.Items.RemoveAt(srcItemIndex)
                Else
                    srcItemIndex = srcItemIndex + 1
                End If
            Next
        End Sub

#End Region

#Region "My Mode For ListBox"
        Protected Sub RolesEditMode()
            DDL_RoleCategory.Enabled = False

            Butt_CancelEdit.Visible = False
            Butt_SaveRole.Visible = True
            Butt_CancelRole.Visible = True
        End Sub

        Protected Sub RolesReadMode()
            DDL_RoleCategory.Enabled = True

            Butt_CancelEdit.Visible = True
            Butt_SaveRole.Visible = False
            Butt_CancelRole.Visible = False
        End Sub
#End Region

#Region "Get Control DropdownList"
        Protected Function DDL_RoleCategory() As DropDownList
            Return DirectCast(FV_RoleInEmp.FindControl("DDL_RoleCategory"), DropDownList)
        End Function
#End Region

#Region "Get Control Button"
        Protected Function Butt_CancelEdit() As Button
            Return DirectCast(FV_RoleInEmp.FindControl("Butt_CancelEdit"), Button)
        End Function

        Protected Function Butt_SaveRole() As Button
            Return DirectCast(FV_RoleInEmp.FindControl("Butt_SaveRole"), Button)
        End Function

        Protected Function Butt_CancelRole() As Button
            Return DirectCast(FV_RoleInEmp.FindControl("Butt_CancelRole"), Button)
        End Function
#End Region

#Region "Get Control ListBox"
        Protected Function ListBox_AvailableRole() As ListBox
            Return DirectCast(FV_RoleInEmp.FindControl("ListBox_AvailableRole"), ListBox)
        End Function

        Protected Function ListBox_SelectedRole() As ListBox
            Return DirectCast(FV_RoleInEmp.FindControl("ListBox_SelectedRole"), ListBox)
        End Function

#End Region

#Region "Get Control Datasource"
        Protected Function DS_SelectedRole() As SqlDataSource
            Return DirectCast(FV_RoleInEmp.FindControl("DS_SelectedRole"), SqlDataSource)
        End Function
#End Region

        Protected Sub LinkButt_EmpValue_Click(ByVal sender As Object, ByVal e As System.EventArgs)
            Server.Transfer(Page.ResolveUrl("~/aspx/role/empManageRole.aspx?empId=" + DirectCast(sender, LinkButton).Text))
        End Sub

        Protected Sub Butt_ToRight_Click(ByVal sender As Object, ByVal e As System.EventArgs)
            RolesEditMode()

            moveSelectedItem(ListBox_AvailableRole, ListBox_SelectedRole)
        End Sub

        Protected Sub Butt_ToLeft_Click(ByVal sender As Object, ByVal e As System.EventArgs)
            RolesEditMode()

            moveSelectedItem(ListBox_SelectedRole, ListBox_AvailableRole)
        End Sub

        Protected Sub Butt_SaveRole_Click(ByVal sender As Object, ByVal e As System.EventArgs)
            RolesReadMode()

            DS_SelectedRole.Update()
        End Sub

        Protected Sub Butt_CancelRole_Click(ByVal sender As Object, ByVal e As System.EventArgs)
            RolesReadMode()

            ListBox_AvailableRole.DataBind()
            ListBox_SelectedRole.DataBind()
        End Sub

        Protected Sub DS_SelectedRole_Updating(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.SqlDataSourceCommandEventArgs)
            e.Command.Parameters.Item("@EMP_ID").Value = DirectCast(FV_RoleInEmp.FindControl("Label_EmpIdValue"), Label).Text
            e.Command.Parameters.Item("@Roles").Value = getListBoxValues(ListBox_SelectedRole())
            e.Command.Parameters.Item("@CategoryId").Value = DDL_RoleCategory.SelectedValue
        End Sub

        Protected Sub Butt_Search_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles Butt_Search.Click
            Server.Transfer("~/aspx/role/empManageRole.aspx?empId=" + TextBox_EmpId.Text)
        End Sub

        Protected Sub Page_Init(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Init
            If Not Me.IsPostBack Then
                If hasQueryString("empId") Then
                    TextBox_EmpId.Text = getQueryString("empId")
                End If
            End If
        End Sub

    End Class
End Namespace

