Option Explicit On
Option Strict On

Imports Microsoft.VisualBasic
Imports System.Data
Imports System.Data.SqlClient
Imports System.Diagnostics
Imports System.Collections.Generic

Public Class ControllingLevelDAL

    Private Shared className As String = "ControllingLevelDAL"

#Region "Custom Code"
    Public Function getClassifyTreeByKey(ByVal categoryKey As Integer) As List(Of ControllingLevel)

        'declare connection
        Dim conn As SqlConnection = Nothing
        'declare result
        Dim result As New List(Of ControllingLevel)

        Try
            conn = ConnectionUtil.getSqlConnectionFromWebConfig()

            Dim sqlCmd As New SqlCommand("CLASSIFY.P_CLASSIFY_TREE_BY_KEY", conn)
            sqlCmd.CommandType = CommandType.StoredProcedure
            sqlCmd.Parameters.AddWithValue("@CATE_KEY", categoryKey)

            Dim reader As SqlDataReader = sqlCmd.ExecuteReader()

            While reader.Read()
                result.Add(bindingControllingLevel(reader))
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

    Public Function getAllUserByClassify() As List(Of ControllingUserFullDesc)

        'declare connection
        Dim conn As SqlConnection = Nothing
        'declare result
        Dim result As New List(Of ControllingUserFullDesc)

        Try
            conn = ConnectionUtil.getSqlConnectionFromWebConfig()

            'Dim sql As String = "SELECT CLASSIFY.CATE_AND_EMP.CATEGORY_KEY AS LEVEL_ID, CLASSIFY.V_003_LINKED_CATEGORY_TYPE_1_INFO.CATEGORY_VALUE AS LEVEL_CODE, CLASSIFY.V_003_LINKED_CATEGORY_TYPE_1_INFO.CATEGORY_DESC AS LEVEL_NAME, CLASSIFY.V_003_LINKED_CATEGORY_TYPE_1_INFO.PARENT_CATEGORY_KEY AS LEVEL_ROOT, CLASSIFY.CATE_AND_EMP.EMP_ID, dbo.EMPLOYEE01.TITLE_NAME, dbo.EMPLOYEE01.EMPNAME, dbo.EMPLOYEE01.EMPSURNAME, CLASSIFY.CATE_AND_EMP.HEAD_PRIORITY AS LEAD_ID, NULL AS LEAD_ID2 FROM  CLASSIFY.CATE_AND_EMP INNER JOIN CLASSIFY.V_003_LINKED_CATEGORY_TYPE_1_INFO ON CLASSIFY.CATE_AND_EMP.CATEGORY_KEY = CLASSIFY.V_003_LINKED_CATEGORY_TYPE_1_INFO.CATEGORY_KEY INNER JOIN dbo.EMPLOYEE01 ON CLASSIFY.CATE_AND_EMP.EMP_ID = dbo.EMPLOYEE01.EMP_ID WHERE (CLASSIFY.CATE_AND_EMP.DEL_FLAG <> 1) AND (CLASSIFY.V_003_LINKED_CATEGORY_TYPE_1_INFO.CATEGORY_TYPE_KEY = 8)"

            'Dim sqlCmd As New SqlCommand(sql, conn)
            'sqlCmd.Prepare()

            Dim sqlCmd As New SqlCommand("CLASSIFY.P_ALL_USER_BY_CATEGORY_TYPE_KEY", conn)
            sqlCmd.CommandType = CommandType.StoredProcedure
            sqlCmd.Parameters.AddWithValue("@CATE_TYPE_KEY", 14)

            Dim reader As SqlDataReader = sqlCmd.ExecuteReader()

            While reader.Read()
                result.Add(bindingControllingUserFullDesc(reader))
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

    Public Function getFullControllingLevel() As List(Of ControllingLevel)
        Return getControllingLevelByLevelRoot("ROOT")
    End Function

    Public Function getControllingLevelByLevelRoot(ByVal level_root As String) As List(Of ControllingLevel)

        'declare connection
        Dim conn As SqlConnection = Nothing
        'declare result
        Dim result As New List(Of ControllingLevel)

        Try
            conn = ConnectionUtil.getSqlConnectionFromWebConfig()

            Dim sqlCmd As New SqlCommand("ControllingLineByLevelRoot", conn)
            sqlCmd.CommandType = CommandType.StoredProcedure
            sqlCmd.Parameters.AddWithValue("@Level_Root", level_root)

            Dim reader As SqlDataReader = sqlCmd.ExecuteReader()

            While reader.Read()
                result.Add(bindingControllingLevel(reader))
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

    Public Function getAllControllingUser() As List(Of ControllingUserFullDesc)

        'declare connection
        Dim conn As SqlConnection = Nothing
        'declare result
        Dim result As New List(Of ControllingUserFullDesc)

        Try
            conn = ConnectionUtil.getSqlConnectionFromWebConfig()

            Dim sql As String = "SELECT " _
             & "LEVEL_ID, LEVEL_CODE, LEVEL_NAME, LEVEL_ROOT, EMP_ID, TITLE_NAME, EMPNAME, EMPSURNAME, LEAD_ID, LEAD_ID2 " _
             & "FROM CONTROLLING_LINE_FULL " _
             & "ORDER BY LEVEL_ID, LEVEL_ROOT "

            Dim sqlCmd As New SqlCommand(sql, conn)
            sqlCmd.Prepare()

            Dim reader As SqlDataReader = sqlCmd.ExecuteReader()

            While reader.Read()
                result.Add(bindingControllingUserFullDesc(reader))
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

    Public Function getControllingUserByFilter(ByVal filter As String) As List(Of ControllingUserFullDesc)

        'declare connection
        Dim conn As SqlConnection = Nothing
        'declare result
        Dim result As New List(Of ControllingUserFullDesc)

        Try
            conn = ConnectionUtil.getSqlConnectionFromWebConfig()

            Dim sql As String = "SELECT [CATEGORY_KEY] LEVEL_ID,[CATEGORY_KEY] LEVEL_CODE,[CATEGORY_DESC] LEVEL_NAME,[MANAGER_CATEGORY_KEY] LEVEL_ROOT,[EMP_ID],[TITLE_NAME],[EMPNAME],[EMPSURNAME],[HEAD_EMP_ID] LEAD_ID,[MANAGER_EMP_ID] LEAD_ID2 FROM [BAY01].[CLASSIFY].[V_025_CM_HEAD_MANAGER_WITH_DESC_LAST_CATEGORY] WHERE ((EMP_ID LIKE @FILTER) OR (EMPNAME LIKE @FILTER) OR (EMPSURNAME LIKE @FILTER)) ORDER BY LEVEL_ID, LEVEL_ROOT"

            Dim sqlCmd As New SqlCommand(sql, conn)
            sqlCmd.Prepare()

            sqlCmd.Parameters.AddWithValue("@FILTER", "%" + filter + "%")

            Dim reader As SqlDataReader = sqlCmd.ExecuteReader()

            While reader.Read()
                result.Add(bindingControllingUserFullDesc(reader))
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

    Public Shared Function getControllingLevelLineByEMP_ID(ByVal emp_id As String) As List(Of ControllingLevel)

        'declare connection
        Dim conn As SqlConnection = Nothing
        'declare result
        Dim result As New List(Of ControllingLevel)

        Try
            conn = ConnectionUtil.getSqlConnectionFromWebConfig()

            Dim sqlCmd As New SqlCommand("ControllingLevelLineByEMP_ID", conn)
            sqlCmd.CommandType = CommandType.StoredProcedure
            sqlCmd.Parameters.AddWithValue("@EMP_ID", emp_id)

            Dim reader As SqlDataReader = sqlCmd.ExecuteReader()

            While reader.Read()
                result.Add(bindingControllingLevel(reader))
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

    Public Shared Function getControllingUserLineByEMP_ID(ByVal emp_id As String) As List(Of ControllingUserFullDesc)

        'declare connection
        Dim conn As SqlConnection = Nothing
        'declare result
        Dim result As New List(Of ControllingUserFullDesc)

        Try
            conn = ConnectionUtil.getSqlConnectionFromWebConfig()

            Dim sqlCmd As New SqlCommand("ControllingUserLineByEMP_ID", conn)
            sqlCmd.CommandType = CommandType.StoredProcedure
            sqlCmd.Parameters.AddWithValue("@EMP_ID", emp_id)

            Dim reader As SqlDataReader = sqlCmd.ExecuteReader()

            While reader.Read()
                result.Add(bindingControllingUserFullDesc(reader))
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

    Public Function getListControllingLevelByLevel_Root(ByVal Level_id As String) As List(Of ControllingLevel)
        'declare connection
        Dim conn As SqlConnection = Nothing
        'declare result
        Dim result As New List(Of ControllingLevel)

        Try
            conn = ConnectionUtil.getSqlConnectionFromWebConfig()
            Dim sql As String = "SELECT " _
             & "LEVEL_ID, LEVEL_CODE, LEVEL_NAME, LEVEL_ROOT " _
             & "FROM Controlling_Level " _
             & "Where LEVEL_ROOT = @LEVEL_ID " _
             & "ORDER BY LEVEL_ID"

            Dim sqlCmd As New SqlCommand(sql, conn)
            sqlCmd.Prepare()
            sqlCmd.Parameters.AddWithValue("@LEVEL_ID", Level_id)
            Dim reader As SqlDataReader = sqlCmd.ExecuteReader()

            While reader.Read()
                result.Add(bindingControllingLevel(reader))
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
    Public Function getControllingLevelByLEVEL_ID(ByVal objControllingLevel As ControllingLevel) As ControllingLevel
        Return getControllingLevelByLEVEL_ID(objControllingLevel.LEVEL_ID)
    End Function

    Public Function getControllingLevelByLEVEL_ID(ByVal LEVEL_ID As String) As ControllingLevel

        'declare connection
        Dim conn As SqlConnection = Nothing
        'declare result
        Dim result As ControllingLevel = Nothing

        Try
            conn = ConnectionUtil.getSqlConnectionFromWebConfig()
            Dim sql As String = "SELECT " _
             & "LEVEL_ID, LEVEL_CODE, LEVEL_NAME, LEVEL_ROOT " _
             & "FROM Controlling_Level " _
             & "WHERE LEVEL_ID=@LEVEL_ID " _
             & "ORDER BY LEVEL_ID"

            Dim sqlCmd As New SqlCommand(sql, conn)
            sqlCmd.Prepare()

            sqlCmd.Parameters.AddWithValue("@LEVEL_ID", LEVEL_ID)

            Dim reader As SqlDataReader = sqlCmd.ExecuteReader()

            While reader.Read()
                result = bindingControllingLevel(reader)
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
    Public Function getAllControllingLevel() As List(Of ControllingLevel)

        'declare connection
        Dim conn As SqlConnection = Nothing
        'declare result
        Dim result As New List(Of ControllingLevel)

        Try
            conn = ConnectionUtil.getSqlConnectionFromWebConfig()
            'Dim sql As String = "SELECT " _
            ' & "LEVEL_ID, LEVEL_CODE, LEVEL_NAME, LEVEL_ROOT " _
            ' & "FROM Controlling_Level " _
            ' & "ORDER BY LEVEL_ID"

            'Dim sqlCmd As New SqlCommand(sql, conn)
            'sqlCmd.Prepare()

            Dim sqlCmd As New SqlCommand("CLASSIFY.P_GET_ALL_ORGANIZE", conn)
            sqlCmd.CommandType = CommandType.StoredProcedure

            Dim reader As SqlDataReader = sqlCmd.ExecuteReader()

            While reader.Read()
                result.Add(bindingControllingLevel(reader))
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
    Public Sub insertControllingLevel(ByVal objControllingLevel As ControllingLevel)

        'declare connection
        Dim conn As SqlConnection = Nothing

        Try
            conn = ConnectionUtil.getSqlConnectionFromWebConfig()
            Dim sql As String = "INSERT INTO Controlling_Level " _
                & " (LEVEL_ID, LEVEL_CODE, LEVEL_NAME, LEVEL_ROOT) " _
                & " VALUES(@LEVEL_ID, @LEVEL_CODE, @LEVEL_NAME, @LEVEL_ROOT) "

            Dim sqlCmd As New SqlCommand(sql, conn)
            sqlCmd.Prepare()

            sqlCmd.Parameters.AddWithValue("@LEVEL_ID", objControllingLevel.LEVEL_ID)
            sqlCmd.Parameters.AddWithValue("@LEVEL_CODE", objControllingLevel.LEVEL_CODE)
            sqlCmd.Parameters.AddWithValue("@LEVEL_NAME", objControllingLevel.LEVEL_NAME)
            sqlCmd.Parameters.AddWithValue("@LEVEL_ROOT", objControllingLevel.LEVEL_ROOT)

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
    Public Sub updateControllingLevel(ByVal objControllingLevel As ControllingLevel)

        'declare connection
        Dim conn As SqlConnection = Nothing

        Try
            conn = ConnectionUtil.getSqlConnectionFromWebConfig()
            Dim sql As String = "UPDATE Controlling_Level SET " _
                & " LEVEL_CODE=@LEVEL_CODE, " _
                & " LEVEL_NAME=@LEVEL_NAME, " _
                & " LEVEL_ROOT=@LEVEL_ROOT " _
                & " WHERE LEVEL_ID=@LEVEL_ID "

            Dim sqlCmd As New SqlCommand(sql, conn)
            sqlCmd.Prepare()

            sqlCmd.Parameters.AddWithValue("@LEVEL_ID", objControllingLevel.LEVEL_ID)
            sqlCmd.Parameters.AddWithValue("@LEVEL_CODE", objControllingLevel.LEVEL_CODE)
            sqlCmd.Parameters.AddWithValue("@LEVEL_NAME", objControllingLevel.LEVEL_NAME)
            sqlCmd.Parameters.AddWithValue("@LEVEL_ROOT", objControllingLevel.LEVEL_ROOT)

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
    Public Sub deleteControllingLevel(ByVal objControllingLevel As ControllingLevel)
        deleteControllingLevel(objControllingLevel.LEVEL_ID)
    End Sub

    Public Sub deleteControllingLevel(ByVal LEVEL_ID As String)

        'declare connection
        Dim conn As SqlConnection = Nothing

        Try
            conn = ConnectionUtil.getSqlConnectionFromWebConfig()
            Dim sql As String = "DELETE FROM Controlling_Level WHERE LEVEL_ID=@LEVEL_ID"

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
    Private Shared Function bindingControllingLevel(ByVal reader As SqlDataReader) As ControllingLevel

        Dim objControllingLevel As New ControllingLevel

        objControllingLevel.LEVEL_ID = CType(ConvertUtil.getObjectValue(reader("LEVEL_ID"), ConvertUtil.ObjectValueEnum.StringValue), String)
        objControllingLevel.LEVEL_CODE = CType(ConvertUtil.getObjectValue(reader("LEVEL_CODE"), ConvertUtil.ObjectValueEnum.StringValue), String)
        objControllingLevel.LEVEL_NAME = CType(ConvertUtil.getObjectValue(reader("LEVEL_NAME"), ConvertUtil.ObjectValueEnum.StringValue), String)
        objControllingLevel.LEVEL_ROOT = CType(ConvertUtil.getObjectValue(reader("LEVEL_ROOT"), ConvertUtil.ObjectValueEnum.StringValue), String)

        Return objControllingLevel

    End Function

    Private Shared Function bindingControllingUserFullDesc(ByVal reader As SqlDataReader) As ControllingUserFullDesc

        Dim objTbLevel As New ControllingUserFullDesc

        objTbLevel.LEVEL_ID = CType(ConvertUtil.getObjectValue(reader("Level_id"), ConvertUtil.ObjectValueEnum.StringValue), String)
        objTbLevel.LEVEL_CODE = CType(ConvertUtil.getObjectValue(reader("Level_Code"), ConvertUtil.ObjectValueEnum.StringValue), String)
        objTbLevel.LEVEL_NAME = CType(ConvertUtil.getObjectValue(reader("Level_Name"), ConvertUtil.ObjectValueEnum.StringValue), String)
        objTbLevel.LEVEL_ROOT = CType(ConvertUtil.getObjectValue(reader("Level_Root"), ConvertUtil.ObjectValueEnum.StringValue), String)
        objTbLevel.EMP_ID = CType(ConvertUtil.getObjectValue(reader("EMP_ID"), ConvertUtil.ObjectValueEnum.StringValue), String)
        objTbLevel.TITLE_NAME = CType(ConvertUtil.getObjectValue(reader("TITLE_NAME"), ConvertUtil.ObjectValueEnum.StringValue), String)
        objTbLevel.EMPNAME = CType(ConvertUtil.getObjectValue(reader("EMPNAME"), ConvertUtil.ObjectValueEnum.StringValue), String)
        objTbLevel.EMPSURNAME = CType(ConvertUtil.getObjectValue(reader("EMPSURNAME"), ConvertUtil.ObjectValueEnum.StringValue), String)
        objTbLevel.LEAD_ID = CType(ConvertUtil.getObjectValue(reader("LEAD_ID"), ConvertUtil.ObjectValueEnum.StringValue), String)
        objTbLevel.LEAD_ID2 = CType(ConvertUtil.getObjectValue(reader("LEAD_ID2"), ConvertUtil.ObjectValueEnum.StringValue), String)

        Return objTbLevel

    End Function
#End Region

End Class
