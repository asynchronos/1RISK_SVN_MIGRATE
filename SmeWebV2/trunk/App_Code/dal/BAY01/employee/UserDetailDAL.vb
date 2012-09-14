Option Explicit On
Option Strict On

Imports Microsoft.VisualBasic
Imports System.Data
Imports System.Data.SqlClient
Imports System.Diagnostics
Imports System.Collections.Generic

Public Class UserDetailDAL

    Private Shared className As String = "UserDetailDAL"

    Public Function getRolesForUser(ByVal username As String, ByVal appId As String) As Hashtable

        'declare connection
        Dim conn As SqlConnection = Nothing
        'declare result
        Dim result As New Hashtable()
        Dim rows As New ArrayList()

        Try
            conn = ConnectionUtil.getSqlConnectionFromWebConfig()

            Dim sqlCmd As New SqlCommand("GetRolesForUser", conn)
            sqlCmd.CommandType = CommandType.StoredProcedure

            sqlCmd.Parameters.AddWithValue("@USERID", username)
            sqlCmd.Parameters.AddWithValue("@APPID", appId)

            Dim reader As SqlDataReader = sqlCmd.ExecuteReader()

            While reader.Read()
                rows.Add(bindingUsersInRoles(reader))
            End While
            result.Add("ROWS", rows)

            reader.Close()
            conn.Close()
        Catch ex As Exception
            Throw New Exception(ex.Message & " : " & ex.StackTrace)
        Finally
            If (conn.State = ConnectionState.Open) Then
                conn.Close()
            End If
            conn = Nothing
        End Try

        Return result

    End Function

#Region "Binding"
    Public Function bindingUsersInRoles(ByVal reader As SqlDataReader) As UsersInRoles

        Dim obj As New UsersInRoles

        obj.USERNAME = CType(ConvertUtil.getObjectValue(reader("UserId"), ConvertUtil.ObjectValueEnum.StringValue), String)
        obj.ROLENAME = CType(ConvertUtil.getObjectValue(reader("RoleName"), ConvertUtil.ObjectValueEnum.StringValue), String)
        obj.ROLEID = CType(ConvertUtil.getObjectValue(reader("RoleId"), ConvertUtil.ObjectValueEnum.StringValue), String)

        Return obj

    End Function
#End Region

End Class