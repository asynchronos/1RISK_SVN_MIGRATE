Option Explicit On
Option Strict On

Imports Microsoft.VisualBasic
Imports System.Data
Imports System.Data.SqlClient
Imports System.Diagnostics
Imports System.Collections.Generic

Public Class ControllingDAL

    Private Shared className As String = "ControllingDAL"

#Region "Custom Code"
    Public Function getControllingLine(ByVal Level_code As String) As List(Of Controlling)

        'declare connection
        Dim conn As SqlConnection = Nothing
        'declare result
        Dim result As New List(Of Controlling)

        Try
            conn = ConnectionUtil.getSqlConnectionFromWebConfig()
            
            Dim sqlCmd As New SqlCommand("Controlling_GetLine2", conn)
            sqlCmd.CommandType = CommandType.StoredProcedure
            sqlCmd.Parameters.AddWithValue("@Level_code", Level_code)

            Dim reader As SqlDataReader = sqlCmd.ExecuteReader()

            While reader.Read()
                result.Add(bindingControlling(reader))
            End While

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
#End Region

#Region "GetByPK"
    Public Function getControllingByPK(ByVal objControlling As Controlling) As Controlling
        Return getControllingByPK(objControlling.Level_Code, objControlling.Level_Root)
    End Function

    Public Function getControllingByPK(ByVal Level_code As String, ByVal Level_root As String) As Controlling

        'declare connection
        Dim conn As SqlConnection = Nothing
        'declare result
        Dim result As Controlling = Nothing

        Try
            conn = ConnectionUtil.getSqlConnectionFromWebConfig()
            Dim sql As String = "SELECT " _
             & "Level_Code, Level_Root, Level_Name " _
             & "FROM Controlling " _
             & "WHERE Level_code=@Level_code " _
             & "AND Level_root=@Level_root " _
             & "ORDER BY Level_code,Level_root "

            Dim sqlCmd As New SqlCommand(sql, conn)
            sqlCmd.Prepare()

            sqlCmd.Parameters.AddWithValue("@Level_code", Level_code)
            sqlCmd.Parameters.AddWithValue("@Level_root", Level_root)

            Dim reader As SqlDataReader = sqlCmd.ExecuteReader()

            While reader.Read()
                result = bindingControlling(reader)
            End While

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
#End Region

#Region "GetAll"
    Public Function getAllControlling() As List(Of Controlling)

        'declare connection
        Dim conn As SqlConnection = Nothing
        'declare result
        Dim result As New List(Of Controlling)

        Try
            conn = ConnectionUtil.getSqlConnectionFromWebConfig()
            Dim sql As String = "SELECT " _
             & "Level_Code, Level_Root, Level_Name " _
             & "FROM Controlling " _
             & "ORDER BY Level_code,Level_root "

            Dim sqlCmd As New SqlCommand(sql, conn)
            sqlCmd.Prepare()

            Dim reader As SqlDataReader = sqlCmd.ExecuteReader()

            While reader.Read()
                result.Add(bindingControlling(reader))
            End While

            reader.close()
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
#End Region

#Region "Binding"
    Public Function bindingControlling(ByVal reader As SqlDataReader) As Controlling

        Dim objControlling As New Controlling

        objControlling.Level_Code = CType(ConvertUtil.getObjectValue(reader("Level_Code"), ConvertUtil.ObjectValueEnum.StringValue), String)
        objControlling.Level_Root = CType(ConvertUtil.getObjectValue(reader("Level_Root"), ConvertUtil.ObjectValueEnum.StringValue), String)
        objControlling.Level_Name = CType(ConvertUtil.getObjectValue(reader("Level_Name"), ConvertUtil.ObjectValueEnum.StringValue), String)

        Return objControlling

    End Function
#End Region

End Class