Imports System.Data.SqlClient
Partial Class Controls_Content_Content
    Inherits System.Web.UI.UserControl

    Public path As String
    Public objCmd As SqlCommand
    Public strCmd As String
    Public lableltext As String
    Public strContentID As String
    Public Property ContentID() As String
        Get
            Return strContentID
        End Get
        Set(ByVal Value As String)
            strContentID = Value
        End Set
    End Property

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        getVariables()
        getdata()
    End Sub

    Sub getVariables()
        If ID = "" Then
            LableText.Text = "<p>no zone id was set!</p>"
        Else
            strCmd = "SELECT * FROM TB_Contents WHERE id = " & ContentID
            Try
                If HttpCookieUtil.hasRolesId(Context.Request.Cookies(FormsAuthentication.FormsCookieName), RoleIdConst.R_ADMIN) Then

                    zone_button.Text = "<a href='" + Page.ResolveUrl("~/aspx/admin/edit_zone_popup.aspx") + "?id=" & ContentID & "&&x=0&y=0&type=on&keepThis=true&TB_iframe=True&height=400&width=450' class='thickbox edit_zone'>Edit Content</a>"
                End If
            Catch ex As HttpCookieUtilException
                If Not ex.Message.Equals(HttpCookieUtilException.CanNotFindCookieExcep) Then
                    Throw ex
                End If
            End Try
            

        End If

    End Sub


    Sub getdata()
        Dim objConn As SqlConnection = Nothing
        Dim arValues As Boolean = Nothing

        Try
            objConn = ConnectionUtil.getSqlConnectionFromWebConfig()

            objCmd = New SqlCommand(strCmd, objConn)
            objCmd.CommandType = Data.CommandType.Text

            Dim objRdr As SqlDataReader = objCmd.ExecuteReader()
            arValues = objRdr.Read()

            If Page.User.Identity.IsAuthenticated Then
                LableText.Text = _
                "<div class='zone_edit_wrapper'>" _
                & objRdr("Contents") _
                & "</div>"
            Else
                LableText.Text = _
                 "<!-- zone " & objRdr("id") & " " & objRdr("Name") & " starts -->" _
                & objRdr("Contents") _
                & "<!-- zone " & objRdr("id") & " " & objRdr("Name") & " ends -->"
            End If

            objRdr.Close()
            objConn.Close()
        Catch ex As Exception
            LableText.Text = "<p>We are having trouble displaying this zone!</p><!--" & ex.ToString & "-->" & ex.ToString
        Finally
            ConnectionUtil.closeConnection(objConn)
        End Try

    End Sub
End Class
