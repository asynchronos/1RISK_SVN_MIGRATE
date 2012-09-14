Option Explicit On
Option Strict On

Imports Microsoft.VisualBasic
Imports System.Data
Imports System.Data.SqlClient
Imports System.Diagnostics
Imports System.Collections.Generic

Public Class ControllingUsersinlevelDAL

	Private Shared className As String = "ControllingUsersinlevelDAL"
#Region "Custom Code"
    Public Function getControllingUsersinlevelByEMP_ID(ByVal EMP_ID As String) As ControllingUsersinlevel

        'declare connection
        Dim conn As SqlConnection = Nothing
        'declare result
        Dim result As New ControllingUsersinlevel

        Try
            conn = ConnectionUtil.getSqlConnectionFromWebConfig()
            Dim sql As String = "SELECT " _
             & "Controlling_UsersInLevel.LEVEL_ID,Controlling_UsersInLevel.EMP_ID " _
             & "FROM Controlling_UsersInLevel " _
             & "WHERE Controlling_UsersInLevel.EMP_ID=@EMP_ID " _
             & "ORDER BY LEVEL_ID "

            Dim sqlCmd As New SqlCommand(sql, conn)
            sqlCmd.Prepare()

            sqlCmd.Parameters.AddWithValue("@EMP_ID", EMP_ID)

            Dim reader As SqlDataReader = sqlCmd.ExecuteReader()

            While reader.Read()
                result = bindingControllingUsersinlevel(reader)
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
    Public Function getControllingUsersinlevelByLEVEL_ID(ByVal objControllingUsersinlevel As ControllingUsersinlevel) As List(Of ControllingUsersinlevel)
        Return getControllingUsersinlevelByLEVEL_ID(objControllingUsersinlevel.LEVEL_ID)
    End Function

    Public Function getControllingUsersinlevelByLEVEL_ID(ByVal LEVEL_ID As String) As List(Of ControllingUsersinlevel)

        'declare connection
        Dim conn As SqlConnection = Nothing
        'declare result
        Dim result As New List(Of ControllingUsersinlevel)

        Try
            conn = ConnectionUtil.getSqlConnectionFromWebConfig()
            Dim sql As String = "SELECT " _
             & "Controlling_UsersInLevel.LEVEL_ID, TB_EMPLOYEE.EMP_ID , TB_EMPLOYEE.EMPNAME, TB_EMPLOYEE.EMPSURNAME " _
             & "FROM Controlling_UsersInLevel INNER JOIN " _
             & "TB_EMPLOYEE ON Controlling_UsersInLevel.EMP_ID = TB_EMPLOYEE.EMP_ID " _
             & "WHERE Controlling_UsersInLevel.LEVEL_ID=@LEVEL_ID " _
             & "ORDER BY LEVEL_ID"

            Dim sqlCmd As New SqlCommand(sql, conn)
            sqlCmd.Prepare()

            sqlCmd.Parameters.AddWithValue("@LEVEL_ID", LEVEL_ID)

            Dim reader As SqlDataReader = sqlCmd.ExecuteReader()

            While reader.Read()
                result.Add(bindingControllingUsersinlevel(reader))
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
    Public Function getAllControllingUsersinlevel() As List(Of ControllingUsersinlevel)

        'declare connection
        Dim conn As SqlConnection = Nothing
        'declare result
        Dim result As New List(Of ControllingUsersinlevel)

        Try
            conn = ConnectionUtil.getSqlConnectionFromWebConfig()
            Dim sql As String = "SELECT " _
             & "LEVEL_ID, EMP_ID " _
             & "FROM Controlling_UsersInLevel " _
             & "ORDER BY LEVEL_ID"

            Dim sqlCmd As New SqlCommand(sql, conn)
            sqlCmd.Prepare()

            Dim reader As SqlDataReader = sqlCmd.ExecuteReader()

            While reader.Read()
                result.Add(bindingControllingUsersinlevel(reader))
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

#Region "Insert"
    Public Sub insertControllingUsersinlevel(ByVal objControllingUsersinlevel As ControllingUsersinlevel)

        'declare connection
        Dim conn As SqlConnection = Nothing

        Try
            conn = ConnectionUtil.getSqlConnectionFromWebConfig()
            Dim sql As String = "INSERT INTO Controlling_UsersInLevel " _
                & " (LEVEL_ID, EMP_ID) " _
                & " VALUES(@LEVEL_ID, @EMP_ID) "

            Dim sqlCmd As New SqlCommand(sql, conn)
            sqlCmd.Prepare()

            sqlCmd.Parameters.AddWithValue("@LEVEL_ID", objControllingUsersinlevel.LEVEL_ID)
            sqlCmd.Parameters.AddWithValue("@EMP_ID", objControllingUsersinlevel.EMP_ID)

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

#Region "Update"
    Public Sub updateControllingUsersinlevel(ByVal objControllingUsersinlevel As ControllingUsersinlevel)

        'declare connection
        Dim conn As SqlConnection = Nothing

        Try
            conn = ConnectionUtil.getSqlConnectionFromWebConfig()
            Dim sql As String = "UPDATE Controlling_UsersInLevel SET " _
                & " EMP_ID=@EMP_ID " _
                & " WHERE LEVEL_ID=@LEVEL_ID "

            Dim sqlCmd As New SqlCommand(sql, conn)
            sqlCmd.Prepare()

            sqlCmd.Parameters.AddWithValue("@LEVEL_ID", objControllingUsersinlevel.LEVEL_ID)
            sqlCmd.Parameters.AddWithValue("@EMP_ID", objControllingUsersinlevel.EMP_ID)

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

#Region "Delete"
    Public Sub deleteControllingUsersinlevel(ByVal objControllingUsersinlevel As ControllingUsersinlevel)
        deleteControllingUsersinlevel(objControllingUsersinlevel.LEVEL_ID)
    End Sub

    Public Sub deleteControllingUsersinlevel(ByVal LEVEL_ID As String)

        'declare connection
        Dim conn As SqlConnection = Nothing

        Try
            conn = ConnectionUtil.getSqlConnectionFromWebConfig()
            Dim sql As String = "DELETE FROM Controlling_UsersInLevel WHERE LEVEL_ID=@LEVEL_ID"

            Dim sqlCmd As New SqlCommand(sql, conn)
            sqlCmd.Prepare()

            sqlCmd.Parameters.AddWithValue("@LEVEL_ID", LEVEL_ID)

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

#Region "Binding"
    Public Function bindingControllingUsersinlevel(ByVal reader As SqlDataReader) As ControllingUsersinlevel

        Dim objControllingUsersinlevel As New ControllingUsersinlevel

        objControllingUsersinlevel.LEVEL_ID = CType(ConvertUtil.getObjectValue(reader("LEVEL_ID"), ConvertUtil.ObjectValueEnum.StringValue), String)
        objControllingUsersinlevel.EMP_ID = CType(ConvertUtil.getObjectValue(reader("EMP_ID"), ConvertUtil.ObjectValueEnum.StringValue), String)

        Return objControllingUsersinlevel

    End Function
#End Region

End Class
