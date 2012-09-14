Option Explicit On
Option Strict On

Namespace aspx.role
    Partial Class CifManageRole
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
            Return DirectCast(FV_RoleInCif.FindControl("DDL_RoleCategory"), DropDownList)
        End Function
#End Region

#Region "Get Control Button"
        Protected Function Butt_CancelEdit() As Button
            Return DirectCast(FV_RoleInCif.FindControl("Butt_CancelEdit"), Button)
        End Function

        Protected Function Butt_SaveRole() As Button
            Return DirectCast(FV_RoleInCif.FindControl("Butt_SaveRole"), Button)
        End Function

        Protected Function Butt_CancelRole() As Button
            Return DirectCast(FV_RoleInCif.FindControl("Butt_CancelRole"), Button)
        End Function
#End Region

#Region "Get Control ListBox"
        Protected Function ListBox_AvailableRole() As ListBox
            Return DirectCast(FV_RoleInCif.FindControl("ListBox_AvailableRole"), ListBox)
        End Function

        Protected Function ListBox_SelectedRole() As ListBox
            Return DirectCast(FV_RoleInCif.FindControl("ListBox_SelectedRole"), ListBox)
        End Function

#End Region

#Region "Get Control Datasource"
        Protected Function DS_SelectedRole() As SqlDataSource
            Return DirectCast(FV_RoleInCif.FindControl("DS_SelectedRole"), SqlDataSource)
        End Function
#End Region

        Protected Sub LinkButt_CifValue_Click(ByVal sender As Object, ByVal e As System.EventArgs)
            Dim selectLink As LinkButton = DirectCast(sender, LinkButton)
            Server.Transfer(Page.ResolveUrl("~/aspx/role/cifManageRole.aspx?cif=" + selectLink.Text))
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
            e.Command.Parameters.Item("@Cif").Value = DirectCast(FV_RoleInCif.FindControl("Label_CifValue"), Label).Text
            e.Command.Parameters.Item("@Roles").Value = getListBoxValues(ListBox_SelectedRole())
            e.Command.Parameters.Item("@CategoryId").Value = DDL_RoleCategory.SelectedValue
        End Sub

        Protected Sub Butt_Search_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles Butt_Search.Click
            Server.Transfer("~/aspx/role/cifManageRole.aspx?cif=" + TextBox_Cif.Text)
        End Sub

        Protected Sub Page_Init(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Init
            If Not Me.IsPostBack Then
                If hasQueryString("cif") Then
                    TextBox_Cif.Text = getQueryString("cif")
                End If
            End If
        End Sub

        Protected Sub ListBox_AvailableRole_OnDataBinding(ByVal sender As Object, ByVal e As System.EventArgs)
            'ถ้าเป็น Branch หรือ Region จะให้เลือกได้แค่ 1 เท่านั้น(1 CIF มีได้แค่ 1 Branch 1 Region)
            If DDL_RoleCategory.SelectedItem.Text.Equals("BRANCH") Or DDL_RoleCategory.SelectedItem.Text.Equals("REGION") Then
                ListBox_AvailableRole.SelectionMode = ListSelectionMode.Single
            Else
                ListBox_AvailableRole.SelectionMode = ListSelectionMode.Multiple
            End If
        End Sub
    End Class
End Namespace

