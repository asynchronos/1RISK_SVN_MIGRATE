Option Explicit On
Option Strict On

Namespace aspx.role
    Partial Class CifInRole
        Inherits aspx.role.RolePageClass

        Protected Sub GV_CifInRole_DataBound(ByVal sender As Object, ByVal e As System.EventArgs)
            'ทุกครั้งที่ทำ Databound ให้ทำการเปลี่ยน SelectedIndex ใหม่
            DirectCast(sender, GridView).SelectedIndex = -1
        End Sub

        Protected Sub DS_AddCifInRole_Inserted(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.SqlDataSourceStatusEventArgs)
            If Not IsNothing(e.Exception) Then
                Label_dbException.Text = e.Exception.Message
                e.ExceptionHandled = True
            End If

            GV_CifInRole.DataBind()
        End Sub

        Protected Sub DS_AddCifInRole_Inserting(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.SqlDataSourceCommandEventArgs)
            e.Command.Parameters.Item("@ROLE_ID").Value = DDL_RoleName.SelectedValue
        End Sub

        Protected Sub Butt_AddCif_Click(ByVal sender As Object, ByVal e As System.EventArgs)
            FV_AddCifInRole.ChangeMode(FormViewMode.Insert)
            Label_dbException.Text = Nothing
        End Sub

        Protected Sub CUSTOMER_PopupBt_Load(ByVal sender As Object, ByVal e As System.EventArgs)
            Dim popupBt As ImageButton = DirectCast(sender, ImageButton)

            Dim customerId As TextBox = DirectCast(popupBt.Parent.FindControl("TextBoxCUSTOMER_ID"), TextBox)
            Dim customerName As TextBox = DirectCast(popupBt.Parent.FindControl("TextBoxCUSTOMER_NAME"), TextBox)

            popupBt.OnClientClick = "var customerPopup = window.open('" + Page.ResolveUrl("~/aspx/customer/Customer.aspx") + "?returnIdTarget=" + customerId.ClientID + "&returnIdProp=value&returnDetailTarget=" + customerName.ClientID + "&returnDetailProp=value'" _
                                                                + ",'customerPopup'" _
                                                                + ",'toolbar=No,width=400,height=380,resizable=no,scrollbars=yes');" _
                                    + "customerPopup.focus();" _
                                    + "return false;"

        End Sub

        Protected Sub DDL_RoleCategory_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs)
            Server.Transfer("~/aspx/role/cifInRole.aspx?" + queryStringCategoryId + "=" + DDL_RoleCategory.SelectedValue)
        End Sub

        Protected Sub DDL_RoleName_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles DDL_RoleName.SelectedIndexChanged
            Server.Transfer("~/aspx/role/cifInRole.aspx?" + queryStringCategoryId + "=" + DDL_RoleCategory.SelectedValue + "&" + queryStringRoleId + "=" + DDL_RoleName.SelectedValue)
        End Sub

        Protected Sub DDL_RoleName_DataBound(ByVal sender As Object, ByVal e As System.EventArgs) Handles DDL_RoleName.DataBound
            If Not Me.IsPostBack Then
                If hasQueryString(queryStringRoleId) Then
                    Try
                        'MsgBox("1:" + DDL_RoleName.SelectedValue)
                        DDL_RoleName.SelectedValue = getQueryString(queryStringRoleId)
                        'MsgBox("2:" + DDL_RoleName.SelectedValue)
                    Catch ex As Exception
                        MsgBox("exception")
                    End Try
                End If
            End If
        End Sub

        Protected Sub Page_InitComplete(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.InitComplete
            If hasQueryString(queryStringCategoryId) Then
                DDL_RoleCategory.SelectedValue = getQueryString(queryStringCategoryId)
            End If
        End Sub

        Protected Sub Butt_NewRole_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles Butt_NewRole.Click
            Server.Transfer("~/aspx/role/role.aspx?action=insert&" + queryStringCategoryId + "=" + DDL_RoleCategory.SelectedValue)
        End Sub

        Protected Sub Butt_Del_PreRender(ByVal sender As Object, ByVal e As System.EventArgs)
            'ป้องกันการลบถ้า Catagory เป็น ROLE_CATEGORY
            'เนื่องจากเป็นการ link มาแสดงด้วยการ MAPPING ถ้าลบจะทำให้ข้อมูลต้นทางถูกลบด้วย
            If DDL_RoleCategory.SelectedValue = "5" Then 'ROLE_CATEGORY มี ID = 5
                DirectCast(sender, Button).Enabled = False
            Else
                DirectCast(sender, Button).Enabled = True
            End If
        End Sub
    End Class
End Namespace

