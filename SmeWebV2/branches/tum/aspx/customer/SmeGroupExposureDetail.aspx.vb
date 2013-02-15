Option Explicit On
Option Strict On

Partial Class aspx_customer_SmeGroupExposureDetail
    Inherits System.Web.UI.Page

#Region "My Code"
    Private Function getListBoxValues(ByVal listBoxControl As ListBox) As String
        Dim result As String = Nothing

        For i As Integer = 0 To listBoxControl.Items.Count - 1
            result = result + listBoxControl.Items(i).Value + ";"
        Next

        Return result
    End Function

    Private Sub moveSelectedItem(ByVal srcListBox As ListBox, ByVal destinationListBox As ListBox)
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

#Region "Get Control ListBox"
    Private Function ListBox_AvailableCif() As ListBox
        Return DirectCast(FV_GROUP_EXPOSURE.FindControl("ListBox_AvailableCif"), ListBox)
    End Function

    Private Function ListBox_SelectedCif() As ListBox
        Return DirectCast(FV_GROUP_EXPOSURE.FindControl("ListBox_SelectedCif"), ListBox)
    End Function

#End Region

    Protected Sub Butt_ToRight_Click(ByVal sender As Object, ByVal e As System.EventArgs)
        moveSelectedItem(ListBox_AvailableCif, ListBox_SelectedCif)
    End Sub

    Protected Sub Butt_ToLeft_Click(ByVal sender As Object, ByVal e As System.EventArgs)
        moveSelectedItem(ListBox_SelectedCif, ListBox_AvailableCif)
    End Sub

    'แบบทำที่ datasource
    Protected Sub DS_GROUP_EXPOSURE_BY_ID_Inserting(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.SqlDataSourceCommandEventArgs) Handles DS_GROUP_EXPOSURE_BY_ID.Inserting
        e.Command.Parameters.Item("@GROUP_ID").Value = Request.QueryString.Get("groupId")
        e.Command.Parameters.Item("@CIFs").Value = getListBoxValues(ListBox_SelectedCif)

        'ถ้าเป็น role admin จะสามารถเลือกได้ว่าใครเป็นคน Update ข้อมูล
        'ส่วน User ที่เลือกไม่ได้จะใช้รหัสพนักงานของตัวเองที่ Login เข้ามา
        If IsNothing(e.Command.Parameters.Item("@UPDATE_BY").Value) Then
            e.Command.Parameters.Item("@UPDATE_BY").Value = User.Identity.Name
        End If

        'ถ้าเป็น role admin จะสามารถเลือกได้ว่าวันไหนเป็นวัน Update ข้อมูล
        'ส่วน User ที่เลือกวันที่ไม่ได้จะเอาวันที่ปัจจุบันเป็นวัน Update ข้อมูล
        If IsNothing(e.Command.Parameters.Item("@UPDATE_DATE").Value) Then
            e.Command.Parameters.Item("@UPDATE_DATE").Value = DateTime.Now
        End If

    End Sub

    Protected Sub FV_GROUP_EXPOSURE_DataBound(ByVal sender As Object, ByVal e As System.EventArgs) Handles FV_GROUP_EXPOSURE.DataBound
        If FV_GROUP_EXPOSURE.DataItemCount = 0 Then
            FV_GROUP_EXPOSURE.ChangeMode(FormViewMode.Insert)
        End If
    End Sub

    Protected Sub reload()
        Dim script As String = "if (window.top != window) {" _
                            + "     var SmeCusIframe1 = window.top.frames['SmeCusIframe1'];" _
                            + "     var SmeCusIframe2 = window.top.frames['SmeCusIframe2'];" _
                            + "" _
                            + "     if (SmeCusIframe1 != window){" _
                            + "         SmeCusIframe1.location.reload();" _
                            + "     }" _
                            + "" _
                            + "     if (SmeCusIframe2 != window){" _
                            + "         SmeCusIframe2.location.reload();" _
                            + "     }" _
                            + " }" 

        Page.ClientScript.RegisterStartupScript(Me.GetType, "reload", script, True)
    End Sub

    Protected Sub FV_GROUP_EXPOSURE_ItemDeleted(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.FormViewDeletedEventArgs) Handles FV_GROUP_EXPOSURE.ItemDeleted
        reload()
    End Sub

    Protected Sub FV_GROUP_EXPOSURE_ItemInserted(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.FormViewInsertedEventArgs) Handles FV_GROUP_EXPOSURE.ItemInserted
        reload()
    End Sub

    Protected Sub FV_GROUP_EXPOSURE_ItemUpdated(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.FormViewUpdatedEventArgs) Handles FV_GROUP_EXPOSURE.ItemUpdated
        reload()
    End Sub

    'แบบทำที่ formview
    Protected Sub FV_GROUP_EXPOSURE_ItemUpdating(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.FormViewUpdateEventArgs) Handles FV_GROUP_EXPOSURE.ItemUpdating
        e.NewValues.Item("CIFs") = getListBoxValues(ListBox_SelectedCif)

        'ถ้าเป็น role admin จะสามารถเลือกได้ว่าใครเป็นคน Update ข้อมูล
        'ส่วน User ที่เลือกไม่ได้จะใช้รหัสพนักงานของตัวเองที่ Login เข้ามา
        If e.NewValues.Item("UPDATE_BY").Equals(String.Empty) Then
            e.NewValues.Item("UPDATE_BY") = User.Identity.Name
        End If

        'ถ้าเป็น role admin จะสามารถเลือกได้ว่าวันไหนเป็นวัน Update ข้อมูล
        'ส่วน User ที่เลือกวันที่ไม่ได้จะเอาวันที่ปัจจุบันเป็นวัน Update ข้อมูล
        If e.OldValues.Item("UPDATE_DATE").Equals(e.NewValues.Item("UPDATE_DATE")) Then
            e.NewValues.Item("UPDATE_DATE") = DateTime.Now
        End If
    End Sub

    Protected Sub CM_CODE_PopupBt_Load(ByVal sender As Object, ByVal e As System.EventArgs)
        Dim popupBt As ImageButton = DirectCast(sender, ImageButton)

        Dim cmId As TextBox = DirectCast(popupBt.Parent.FindControl("UPDATE_BYTextBox"), TextBox)
        Dim cmDetail As TextBox = DirectCast(popupBt.Parent.FindControl("EMP_NAMETextBox"), TextBox)

        popupBt.OnClientClick = "var cmPopup = window.open('" + Page.ResolveUrl("~/aspx/employee/CMControllingTree.aspx") + "?returnIdTarget=" + cmId.ClientID + "&returnIdProp=value&returnDetailTarget=" + cmDetail.ClientID + "&returnDetailProp=value'" _
                                                            + ",'cmPopup'" _
                                                            + ",'toolbar=No,width=500,height=500,resizable=no,scrollbars=yes');" _
                                + "cmPopup.focus();" _
                                + "return false;"

    End Sub

    Protected Sub UPDATE_BY_PopupBt_Load(ByVal sender As Object, ByVal e As System.EventArgs)
        CM_CODE_PopupBt_Load(sender, e)
        validateControlRole(sender, e)
    End Sub

    Protected Sub CalImageBt_Load(ByVal sender As Object, ByVal e As System.EventArgs)
        validateControlRole(sender, e)
    End Sub

    Protected Sub validateControlRole(ByVal sender As Object, ByVal e As System.EventArgs)
        'check ว่ามี role admin หรือไม่ 
        If User.IsInRole(RoleIdConst.R_ADMIN) Then
            'If HttpCookieUtil.hasRolesId(Context.Request.Cookies(FormsAuthentication.FormsCookieName), RoleIdConst.R_ADMIN) Then
            'ถ้ามีให้แสดงปุ่มได้
            DirectCast(sender, Control).Visible = True
        Else
            DirectCast(sender, Control).Visible = False
        End If
    End Sub

End Class
