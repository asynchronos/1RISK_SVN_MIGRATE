Imports Microsoft.VisualBasic

Public Class HttpCookieUtilException
    Inherits System.Exception

    Public Shared CanNotFindCookieExcep As String = "Can not find cookie,Please Check cookie name valid."
    Public Shared CanNotDecryptCookieExcep As String = "Can not decrypt cookie"
    Public Shared NoAuthenTicketExcep As String = "Don' have authTicket in cookie"

    Public Sub New()
        MyBase.New()
    End Sub

    Public Sub New(ByVal message As String)
        MyBase.New(message)
    End Sub

End Class
