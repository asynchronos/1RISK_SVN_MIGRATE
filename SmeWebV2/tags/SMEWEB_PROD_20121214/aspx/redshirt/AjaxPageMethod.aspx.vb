Imports System.Web.Services
Imports System.Web
Imports System.Data
Imports System.Data.SqlClient
Partial Class test_AjaxPageMethod
    Inherits System.Web.UI.Page
    <System.Web.Script.Services.ScriptMethod()> _
   <System.Web.Services.WebMethod()> _
    Public Shared Function myMethod(ByVal param1 As Object) As String
        Return "xx"
    End Function

End Class
