Option Explicit On
Option Strict On

Imports Microsoft.VisualBasic
Imports System.Data
Imports System.Data.SqlClient
Imports System.Diagnostics
Imports System.Collections.Generic

Public Class VAnnalsCovenantDAL

	Private Shared className As String = "VAnnalsCovenantDAL"
    Public Function getVAnnalsCovenantByCIF(ByVal objVAnnalsCovenant As VAnnalsCovenant) As VAnnalsCovenant

        'declare connection
        Dim conn As SqlConnection = Nothing
        'declare result
        Dim result As New VAnnalsCovenant()

        Try
            conn = ConnectionUtil.getSqlConnectionFromWebConfig()
            Dim sql As String = "SELECT  TOP 1 " _
             & " *" _
             & "FROM V_ANNALS_COVENANT " _
             & "WHERE CIF=@CIF" _
             & " ORDER BY IDEN DESC"

            Dim sqlCmd As New SqlCommand(sql, conn)
            sqlCmd.Prepare()

            sqlCmd.Parameters.AddWithValue("@CIF", objVAnnalsCovenant.CIF)

            Dim reader As SqlDataReader = sqlCmd.ExecuteReader()

            While reader.Read()
                result = bindingVAnnalsCovenant(reader)
            End While

            reader.Close()
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

	Public Function getVAnnalsCovenantByIDEN(ByVal objVAnnalsCovenant As VAnnalsCovenant) As VAnnalsCovenant

		'declare connection
		Dim conn As SqlConnection = Nothing
		'declare result
		Dim result As New VAnnalsCovenant()

		Try
			conn = ConnectionUtil.getSqlConnectionFromWebConfig()
            Dim sql As String = "SELECT " _
             & "IDEN, CIF, Cifname, COVENANT_TYPE_ID, " _
             & "COVENANT_TYPE, DETAIL, CREATE_DATE, DEADLINE_DATE, " _
             & "COVENANT_ACTION_ID, COVENANT_ACTION, REMARK, ACTION_DATE, " _
             & "USER_ID, USER_UPDATE_DATE, EMP_NAME, ID , GROUP_ID " _
             & "FROM V_ANNALS_COVENANT " _
             & "WHERE IDEN=@IDEN " _
             & "ORDER BY IDEN"

			Dim sqlCmd As New SqlCommand(sql, conn)
			sqlCmd.Prepare()

			sqlCmd.Parameters.AddWithValue("@IDEN", objVAnnalsCovenant.IDEN)

			Dim reader As SqlDataReader = sqlCmd.ExecuteReader()

			While reader.Read()
				result = bindingVAnnalsCovenant(reader)
			End While

			reader.close()
		Catch ex As Exception
			Throw New Exception(ex.Message & " : " & ex.StackTrace)
		Finally
			If (conn.State = ConnectionState.Open) Then
				conn.Close()
			End IF
			conn = Nothing
		End Try

		Return result

	End Function

	Public Function getVAnnalsCovenantByIDEN(ByVal IDEN As Integer) As VAnnalsCovenant

		'declare connection
		Dim conn As SqlConnection = Nothing
		'declare result
		Dim result As New VAnnalsCovenant()

		Try
			conn = ConnectionUtil.getSqlConnectionFromWebConfig()
            Dim sql As String = "SELECT " _
             & "IDEN, CIF, Cifname, COVENANT_TYPE_ID, " _
             & "COVENANT_TYPE, DETAIL, CREATE_DATE, DEADLINE_DATE, " _
             & "COVENANT_ACTION_ID, COVENANT_ACTION, REMARK, ACTION_DATE, " _
             & "USER_ID, USER_UPDATE_DATE, EMP_NAME, ID , GROUP_ID" _
             & "FROM V_ANNALS_COVENANT " _
             & "WHERE IDEN=@IDEN " _
             & "ORDER BY IDEN"

			Dim sqlCmd As New SqlCommand(sql, conn)
			sqlCmd.Prepare()

			sqlCmd.Parameters.AddWithValue("@IDEN", IDEN)

			Dim reader As SqlDataReader = sqlCmd.ExecuteReader()

			While reader.Read()
				result = bindingVAnnalsCovenant(reader)
			End While

			reader.close()
		Catch ex As Exception
			Throw New Exception(ex.Message & " : " & ex.StackTrace)
		Finally
			If (conn.State = ConnectionState.Open) Then
				conn.Close()
			End IF
			conn = Nothing
		End Try

		Return result

	End Function

	Public Function getAllVAnnalsCovenant() As List (Of VAnnalsCovenant)

		'declare connection
		Dim conn As SqlConnection = Nothing
		'declare result
		Dim result As New List(Of VAnnalsCovenant)

		Try
			conn = ConnectionUtil.getSqlConnectionFromWebConfig()
            Dim sql As String = "SELECT " _
             & "IDEN, CIF, Cifname, COVENANT_TYPE_ID, " _
             & "COVENANT_TYPE, DETAIL, CREATE_DATE, DEADLINE_DATE, " _
             & "COVENANT_ACTION_ID, COVENANT_ACTION, REMARK, ACTION_DATE, " _
             & "USER_ID, USER_UPDATE_DATE, EMP_NAME, ID, GROUP_ID " _
             & "FROM V_ANNALS_COVENANT " _
             & "ORDER BY IDEN"

			Dim sqlCmd As New SqlCommand(sql, conn)
			sqlCmd.Prepare()

			Dim reader As SqlDataReader = sqlCmd.ExecuteReader()

			While reader.Read()
				result.Add(bindingVAnnalsCovenant(reader))
			End While

			reader.close()
			conn.Close()
		Catch ex As Exception
			Throw New Exception(ex.Message & " : " & ex.StackTrace)
		Finally
			If (conn.State = ConnectionState.Open) Then
				conn.Close()
			End IF
			conn = Nothing
		End Try

		Return result

	End Function

	Public Function getAllVAnnalsCovenantBySQL(ByVal sql AS String) As List (Of VAnnalsCovenant)

		'declare connection
		Dim conn As SqlConnection = Nothing
		'declare result
		Dim result As New List(Of VAnnalsCovenant)

        'Try
        conn = ConnectionUtil.getSqlConnectionFromWebConfig()
        Dim sqlCmd As New SqlCommand(sql, conn)
        sqlCmd.Prepare()

        Dim reader As SqlDataReader = sqlCmd.ExecuteReader()

        While reader.Read()
            result.Add(bindingVAnnalsCovenant(reader))
        End While

        reader.Close()
        conn.Close()
        'Catch ex As Exception
        '    Throw New Exception(ex.Message & " : " & ex.StackTrace)
        'Finally
        If (conn.State = ConnectionState.Open) Then
            conn.Close()
        End If
        conn = Nothing
        'End Try

        Return result

    End Function

    Public Function bindingVAnnalsCovenant(ByVal reader As SqlDataReader) As VAnnalsCovenant

        Dim objVAnnalsCovenant As New VAnnalsCovenant

        objVAnnalsCovenant.IDEN = CType(ConvertUtil.getObjectValue(reader("IDEN"), ConvertUtil.ObjectValueEnum.NumbericValue), Integer)
        objVAnnalsCovenant.CIF = CType(ConvertUtil.getObjectValue(reader("CIF"), ConvertUtil.ObjectValueEnum.NumbericValue), Integer)
        objVAnnalsCovenant.Cifname = CType(ConvertUtil.getObjectValue(reader("Cifname"), ConvertUtil.ObjectValueEnum.StringValue), String)
        objVAnnalsCovenant.COVENANT_TYPE_ID = CType(ConvertUtil.getObjectValue(reader("COVENANT_TYPE_ID"), ConvertUtil.ObjectValueEnum.StringValue), String)
        objVAnnalsCovenant.COVENANT_TYPE = CType(ConvertUtil.getObjectValue(reader("COVENANT_TYPE"), ConvertUtil.ObjectValueEnum.StringValue), String)
        objVAnnalsCovenant.DETAIL = CType(ConvertUtil.getObjectValue(reader("DETAIL"), ConvertUtil.ObjectValueEnum.StringValue), String)
        objVAnnalsCovenant.CREATE_DATE = CType(ConvertUtil.getObjectValue(reader("CREATE_DATE"), ConvertUtil.ObjectValueEnum.DateValue), Date)
        objVAnnalsCovenant.DEADLINE_DATE = CType(ConvertUtil.getObjectValue(reader("DEADLINE_DATE"), ConvertUtil.ObjectValueEnum.DateValue), String)
        objVAnnalsCovenant.COVENANT_ACTION_ID = CType(ConvertUtil.getObjectValue(reader("COVENANT_ACTION_ID"), ConvertUtil.ObjectValueEnum.StringValue), String)
        objVAnnalsCovenant.COVENANT_ACTION = CType(ConvertUtil.getObjectValue(reader("COVENANT_ACTION"), ConvertUtil.ObjectValueEnum.StringValue), String)
        objVAnnalsCovenant.REMARK = CType(ConvertUtil.getObjectValue(reader("REMARK"), ConvertUtil.ObjectValueEnum.StringValue), String)
        objVAnnalsCovenant.ACTION_DATE = CType(ConvertUtil.getObjectValue(reader("ACTION_DATE"), ConvertUtil.ObjectValueEnum.DateValue), String)
        objVAnnalsCovenant.USER_ID = CType(ConvertUtil.getObjectValue(reader("USER_ID"), ConvertUtil.ObjectValueEnum.StringValue), String)
        objVAnnalsCovenant.USER_UPDATE_DATE = CType(ConvertUtil.getObjectValue(reader("USER_UPDATE_DATE"), ConvertUtil.ObjectValueEnum.DateValue), Date)
        objVAnnalsCovenant.EMP_NAME = CType(ConvertUtil.getObjectValue(reader("EMP_NAME"), ConvertUtil.ObjectValueEnum.StringValue), String)
        objVAnnalsCovenant.ID = CType(ConvertUtil.getObjectValue(reader("ID"), ConvertUtil.ObjectValueEnum.StringValue), String)
        objVAnnalsCovenant.GROUP_ID = CType(ConvertUtil.getObjectValue(reader("ID"), ConvertUtil.ObjectValueEnum.NumbericValue), Integer)
        objVAnnalsCovenant.NEXT_ACTION_DATE = CType(ConvertUtil.getObjectValue(reader("NEXT_ACTION_DATE"), ConvertUtil.ObjectValueEnum.DateValue), String)
        objVAnnalsCovenant.NEXT_COVENANT_ACTION_ID = CType(ConvertUtil.getObjectValue(reader("NEXT_COVENANT_ACTION_ID"), ConvertUtil.ObjectValueEnum.StringValue), String)
        objVAnnalsCovenant.NEXT_COVENANT_ACTION = CType(ConvertUtil.getObjectValue(reader("NEXT_COVENANT_ACTION"), ConvertUtil.ObjectValueEnum.StringValue), String)



        Return objVAnnalsCovenant

    End Function

    Public Function getGroupCIF(ByVal GROUP_ID As Integer) As String
        'declare connection
        Dim conn As SqlConnection = Nothing
        Dim strCIF As String = Nothing
        'declare result
        Try
            conn = ConnectionUtil.getSqlConnectionFromWebConfig()
            Dim sql As String = "SELECT DISTINCT CIF,GROUP_ID " _
             & "FROM V_ANNALS_COVENANT " _
             & "WHERE  GROUP_ID=@GROUP_ID "

            Dim sqlCmd As New SqlCommand(sql, conn)
            sqlCmd.Prepare()

            sqlCmd.Parameters.AddWithValue("@GROUP_ID", GROUP_ID)

            Dim reader As SqlDataReader = sqlCmd.ExecuteReader()

            While reader.Read()
                strCIF = strCIF & reader.Item("CIF").ToString
                strCIF = strCIF & ","
            End While

            reader.Close()
        Catch ex As Exception
            Throw New Exception(ex.Message & " : " & ex.StackTrace)
        Finally
            If (conn.State = ConnectionState.Open) Then
                conn.Close()
            End If
            conn = Nothing
        End Try
        Return strCIF
    End Function

    Public Function getFlagHaveCovenantFromCIF(ByVal CIF As Integer) As Boolean
        'declare connection
        Dim conn As SqlConnection = Nothing
        Dim intGroup As Integer = Nothing
        'declare result
        Try

            conn = ConnectionUtil.getSqlConnectionFromWebConfig()
            Dim sql As String = "SELECT GROUP_ID " _
             & " FROM  CUSTOMER_SME " _
             & " WHERE  CIF=@CIF " _
            & " AND  GROUP_ID  IS NOT NULL"

            Dim sqlCmd As New SqlCommand(sql, conn)
            sqlCmd.Prepare()

            sqlCmd.Parameters.AddWithValue("@CIF", CIF)

            Dim reader As SqlDataReader = sqlCmd.ExecuteReader()
            While reader.Read()
                intGroup = CInt(reader.Item("GROUP_ID").ToString)
            End While
            reader.Close()

            If getGroupCIF(intGroup) <> "" Then
                Return True
            Else
                Return False
            End If

        Catch ex As Exception
            Throw New Exception(ex.Message & " : " & ex.StackTrace)
        Finally
            If (conn.State = ConnectionState.Open) Then
                conn.Close()
            End If
            conn = Nothing
        End Try

    End Function

    Public Function getGroupIDFromCIF(ByVal CIF As Integer) As Integer
        'declare connection
        Dim conn As SqlConnection = Nothing
        Dim intGroup As Integer = Nothing
        'declare result
        Try
            conn = ConnectionUtil.getSqlConnectionFromWebConfig()
            Dim sql As String = "SELECT TOP 1 GROUP_ID " _
             & "FROM  CUSTOMER_SME " _
             & "WHERE  CIF=@CIF "

            Dim sqlCmd As New SqlCommand(sql, conn)
            sqlCmd.Prepare()

            sqlCmd.Parameters.AddWithValue("@CIF", CIF)

            Dim reader As SqlDataReader = sqlCmd.ExecuteReader()
            While reader.Read()
                intGroup = CInt(reader.Item("GROUP_ID").ToString)
            End While
            reader.Close()
            Return intGroup
        Catch ex As Exception
            Throw New Exception(ex.Message & " : " & ex.StackTrace)
        Finally
            If (conn.State = ConnectionState.Open) Then
                conn.Close()
            End If
            conn = Nothing
        End Try

    End Function

End Class
