Option Explicit On
Option Strict On

Imports Microsoft.VisualBasic
Imports System.Data
Imports System.Data.SqlClient
Imports System.Diagnostics
Imports System.Collections.Generic

Public Class AuthenticationBO

    Private Shared className As String = "AuthenticationBO"
    Private dal As New UserDetailDAL()

    Public Function getRolesForUser(ByVal username As String, ByVal appid As String) As UserDetail
        Dim result As UserDetail = New UserDetail

        Dim hash As Hashtable = dal.getRolesForUser(username, appid)
        Dim rows As ArrayList = DirectCast(hash.Item("ROWS"), ArrayList)
        Dim roleList As ArrayList = New ArrayList()

        For i As Integer = 0 To rows.Count - 1
            Dim uir As UsersInRoles = DirectCast(rows.Item(i), UsersInRoles)

            roleList.Add(uir.ROLEID)
        Next

        result.USERNAME = username
        result.RoleIDList = roleList

        Return result
    End Function

End Class