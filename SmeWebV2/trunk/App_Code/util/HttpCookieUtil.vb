Option Strict On
Option Explicit On

Imports Microsoft.VisualBasic

Public Class HttpCookieUtil

    Private Shared Function getAuthTicket(ByVal authCookie As HttpCookie) As FormsAuthenticationTicket
        If IsNothing(authCookie) Then
            Throw New HttpCookieUtilException("Can not find cookie,Please Check cookie name valid.")
        End If

        Dim authTicket As FormsAuthenticationTicket = Nothing
        Try
            authTicket = FormsAuthentication.Decrypt(authCookie.Value)
        Catch ex As Exception
            Throw New HttpCookieUtilException("Can not decrypt cookie")
        End Try

        If IsNothing(authTicket) Then
            Throw New HttpCookieUtilException("Don' have authTicket in cookie")
        End If

        Return authTicket
    End Function

    Private Shared Function getUserDetail(ByVal authTicket As FormsAuthenticationTicket) As UserDetail
        Dim roles As String() = authTicket.UserData.Split("|"c)
        Dim id As FormsIdentity = New FormsIdentity(authTicket)

        Dim roleList As New ArrayList()
        For i As Integer = 0 To roles.Length - 1
            roleList.Add(roles(i))
        Next

        Dim user As New UserDetail()
        user.USERNAME = id.Name
        user.RoleIDList = roleList

        Return user
    End Function

    Public Shared Function getuserDetail(ByVal authCookie As HttpCookie) As UserDetail
        Return getuserDetail(getAuthTicket(authCookie))
    End Function

    ''' <summary>
    ''' เช็คว่ามี RoleId นั้นๆใน cookie หรือไม่
    ''' </summary>
    ''' <param name="authCookie">HttpCookie ได้จาก Context.Request.Cookies(CookieName)</param>
    ''' <param name="roleId">RoleId ที่ต้องการจะเช็คว่ามีหรือไม่</param>
    ''' <returns>True ถ้ามี RoleId นั้นใน cookie list</returns>
    ''' <remarks></remarks>
    Public Shared Function hasRolesId(ByVal authCookie As HttpCookie, ByVal roleId As String) As Boolean
        Dim result As Boolean = False

        Dim userDetailObj As UserDetail = HttpCookieUtil.getUserDetail(getAuthTicket(authCookie))

        For i As Integer = 0 To userDetailObj.RoleIDList.Count - 1
            If userDetailObj.Role(i).Equals(roleId) Then
                result = True
                Exit For
            End If
        Next

        Return result
    End Function
End Class

