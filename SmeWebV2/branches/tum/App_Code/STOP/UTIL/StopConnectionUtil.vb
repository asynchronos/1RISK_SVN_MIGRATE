Option Explicit On
Option Strict On

Imports Microsoft.VisualBasic
Imports System.Data.SqlClient

Public Class StopConnectionUtil

    Public Enum ConnectionString
        StopConnectionString
    End Enum

    'Public Shared ReadOnly Asset_DBConnectionString As String = "Asset_DBConnectionString"
    'Public Shared ReadOnly BAY01ConnectionString As String = "BAY01ConnectionString"
    'Public Shared ReadOnly CRMEConnectionString As String = "CRMEConnectionString"

    Private Shared ReadOnly ConnectionStringName() As String = { _
        "STOPConnectionString"}

    Public Shared Function getConnectionString(ByVal conStringEnum As ConnectionString) As String
        Return ConnectionStringName(conStringEnum)
    End Function

    ''' <summary>
    ''' Function นี้ใช้สำหรับสร้าง SqlConnection
    ''' </summary>
    ''' <returns>SqlConnection</returns>
    ''' <remarks></remarks>
    Public Shared Function getSqlConnectionFromWebConfig() As SqlConnection
        'defaultCon
        Return getSqlConnectionFromWebConfig(ConnectionString.StopConnectionString)
    End Function

    ''' <summary>
    ''' Function นี้ใช้สำหรับสร้าง SqlConnection
    ''' </summary>
    ''' <param name="conStringName">ชื่อ connection string ที่ต้องการติดต่อใน web config</param>
    ''' <returns>SqlConnection</returns>
    ''' <remarks></remarks>
    Public Shared Function getSqlConnectionFromWebConfig(ByVal conStringName As ConnectionString) As SqlConnection
        Dim conn As SqlConnection = Nothing

        conn = New SqlConnection(ConfigurationManager.ConnectionStrings(getConnectionString(conStringName)).ConnectionString)
        conn.Open()

        Return conn
    End Function

    ''' <summary>
    ''' Function นี้ใช้สำหรับสร้าง SqlConnection โดยการระบุค่า connection string ในรูปแบบ
    ''' Data Source=serverName;Initial Catalog=databaseName;Persist Security Info=True;User ID=username;Password=password
    ''' </summary>
    ''' <param name="connectionString">Data Source=serverName;Initial Catalog=databaseName;Persist Security Info=True;User ID=username;Password=password</param>
    ''' <returns></returns>
    ''' <remarks></remarks>
    Public Shared Function getSqlConnection(ByVal connectionString As String) As SqlConnection
        Dim conn As SqlConnection = Nothing

        conn = New SqlConnection(connectionString)
        conn.Open()

        Return conn
    End Function

    Public Shared Sub closeConnection(ByVal conn As SqlConnection)
        If (conn.State = Data.ConnectionState.Open) Then
            conn.Close()
        End If
        conn = Nothing
    End Sub

End Class
