Option Explicit On
Option Strict On

Imports Microsoft.VisualBasic
Imports System.Data
Imports System.Data.SqlClient
Imports System.Diagnostics
Imports System.Collections.Generic

Public Class CustomerSmeDAL

    Private Shared className As String = "CustomerSmeDAL"

#Region "UPDATE NEW GROUP ID ON CIF"
    Public Shared Sub updateNewGroupID(ByVal CIF As Integer)
        'declare connection
        Dim conn As SqlConnection = Nothing

        Try
            Dim sql As String = "SP_CUSTOMER_SME_SET_NEW_GROUPID"

            Dim sqlCmd As New SqlCommand(sql, conn)
            sqlCmd.CommandType = CommandType.StoredProcedure

            sqlCmd.Parameters.AddWithValue("@CIF", CIF)

            sqlCmd.ExecuteNonQuery()
        Catch ex As Exception
            Throw New Exception(ex.Message & " : " & ex.StackTrace)
        Finally
            If (conn.State = ConnectionState.Open) Then
                conn.Close()
            End If
            conn = Nothing
        End Try
    End Sub
#End Region

#Region "UPDATE GROUP ID BY CIF"
    Public Shared Sub updateGroupIdByCIF(ByVal CIF1 As Integer, ByVal CIF2 As Integer, ByVal updateEmp As String)

        'declare connection
        Dim conn As SqlConnection = Nothing

        Try
            conn = ConnectionUtil.getSqlConnectionFromWebConfig()
            Dim sql As String = "SP_CUSTOMER_SME_UPDATE_GROUPID_BY_CIF"

            Dim sqlCmd As New SqlCommand(sql, conn)
            sqlCmd.CommandType = CommandType.StoredProcedure

            sqlCmd.Parameters.AddWithValue("@CIF1", CIF1)
            sqlCmd.Parameters.AddWithValue("@CIF2", CIF2)
            sqlCmd.Parameters.AddWithValue("@UPDATE_BY", updateEmp)
            sqlCmd.Parameters.AddWithValue("@UPDATE_DATE", Date.Now)

            sqlCmd.ExecuteNonQuery()
        Catch ex As Exception
            Throw New Exception(ex.Message & " : " & ex.StackTrace)
        Finally
            If (conn.State = ConnectionState.Open) Then
                conn.Close()
            End If
            conn = Nothing
        End Try
    End Sub
#End Region

End Class