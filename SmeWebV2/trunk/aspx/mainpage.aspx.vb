Imports System.Collections.Generic
Imports System.Data
Imports System.Data.SqlClient
Partial Class aspx_mainpage
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        lblUserOnline.Text = Application("UserOnline")

        If Not IsNothing(Session.Item(SessionKeyConst.EMP_ID)) Then
            Hidden_EMP_ID.Value = Session.Item(SessionKeyConst.EMP_ID)
        End If

        'check ว่ามี role RM USER หรือไม่
        If User.IsInRole(RoleIdConst.R_RM_USER) Then
            table1.Style.Item("display") = "none"

            Response.Redirect(Page.ResolveUrl("~/aspx/download/downloadPage.aspx"))
        End If

        'check ว่ามี role audit attach หรือไม่
        If User.IsInRole(RoleIdConst.AUDIT_ATTACH) Then
            table1.Style.Item("display") = "none"

            Response.Redirect(Page.ResolveUrl("~/aspx/uploadfile/SearchUploadFile.aspx"))
        End If

    End Sub
End Class
