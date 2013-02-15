Option Explicit On
Option Strict On

Imports Microsoft.VisualBasic
Imports System.Data
Imports System.Data.SqlClient
Imports System.Diagnostics
Imports System.Collections.Generic

Public Class AnnalsProposalDAL

	Private Shared className As String = "AnnalsProposalDAL"

    'Public Function getAnnalsProposalByPROPOSAL_ID(ByVal objAnnalsProposal As AnnalsProposal) As AnnalsProposal

    '	'declare connection
    '	Dim conn As SqlConnection = Nothing
    '	'declare result
    '	Dim result As New AnnalsProposal()

    '	Try
    '		conn = ConnectionUtil.getSqlConnectionFromWebConfig()
    '		Dim sql As String = "SELECT " _
    '			& "PROPOSAL_ID, PROPOSAL_NAME, PRIORITY, STATUS " _
    '			& "FROM ANNALS_PROPOSAL " _
    '			& "WHERE PROPOSAL_ID=@PROPOSAL_ID " _
    '			& "ORDER BY PROPOSAL_ID"

    '		Dim sqlCmd As New SqlCommand(sql, conn)
    '		sqlCmd.Prepare()

    '		sqlCmd.Parameters.AddWithValue("@PROPOSAL_ID", objAnnalsProposal.PROPOSAL_ID)

    '		Dim reader As SqlDataReader = sqlCmd.ExecuteReader()

    '		While reader.Read()
    '			result = bindingAnnalsProposal(reader)
    '		End While

    '		reader.close()
    '	Catch ex As Exception
    '		Throw New Exception(ex.Message & " : " & ex.StackTrace)
    '	Finally
    '		If (conn.State = ConnectionState.Open) Then
    '			conn.Close()
    '		End IF
    '		conn = Nothing
    '	End Try

    '	Return result

    'End Function

    'Public Function getAnnalsProposalByPROPOSAL_ID(ByVal PROPOSAL_ID As String) As AnnalsProposal

    '	'declare connection
    '	Dim conn As SqlConnection = Nothing
    '	'declare result
    '	Dim result As New AnnalsProposal()

    '	Try
    '		conn = ConnectionUtil.getSqlConnectionFromWebConfig()
    '		Dim sql As String = "SELECT " _
    '			& "PROPOSAL_ID, PROPOSAL_NAME, PRIORITY, STATUS " _
    '			& "FROM ANNALS_PROPOSAL " _
    '			& "WHERE PROPOSAL_ID=@PROPOSAL_ID " _
    '			& "ORDER BY PROPOSAL_ID"

    '		Dim sqlCmd As New SqlCommand(sql, conn)
    '		sqlCmd.Prepare()

    '		sqlCmd.Parameters.AddWithValue("@PROPOSAL_ID", PROPOSAL_ID)

    '		Dim reader As SqlDataReader = sqlCmd.ExecuteReader()

    '		While reader.Read()
    '			result = bindingAnnalsProposal(reader)
    '		End While

    '		reader.close()
    '	Catch ex As Exception
    '		Throw New Exception(ex.Message & " : " & ex.StackTrace)
    '	Finally
    '		If (conn.State = ConnectionState.Open) Then
    '			conn.Close()
    '		End IF
    '		conn = Nothing
    '	End Try

    '	Return result

    'End Function

	Public Function getAllAnnalsProposal() As List (Of AnnalsProposal)

		'declare connection
		Dim conn As SqlConnection = Nothing
		'declare result
		Dim result As New List(Of AnnalsProposal)

		Try
			conn = ConnectionUtil.getSqlConnectionFromWebConfig()
            Dim sql As String = "SELECT " _
             & " PROPOSAL_ID, PROPOSAL_NAME, PRIORITY, STATUS " _
             & " FROM ANNALS_PROPOSAL   WHERE STATUS=1 " _
             & " ORDER BY PRIORITY "

			Dim sqlCmd As New SqlCommand(sql, conn)
			sqlCmd.Prepare()

			Dim reader As SqlDataReader = sqlCmd.ExecuteReader()

			While reader.Read()
				result.Add(bindingAnnalsProposal(reader))
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

    'Public Function getAllAnnalsProposalBySQL(ByVal sql AS String) As List (Of AnnalsProposal)

    '	'declare connection
    '	Dim conn As SqlConnection = Nothing
    '	'declare result
    '	Dim result As New List(Of AnnalsProposal)

    '	Try
    '		conn = ConnectionUtil.getSqlConnectionFromWebConfig()
    '		Dim sqlCmd As New SqlCommand(sql, conn)
    '		sqlCmd.Prepare()

    '		Dim reader As SqlDataReader = sqlCmd.ExecuteReader()

    '		While reader.Read()
    '			result.Add(bindingAnnalsProposal(reader))
    '		End While

    '		reader.close()
    '		conn.Close()
    '	Catch ex As Exception
    '		Throw New Exception(ex.Message & " : " & ex.StackTrace)
    '	Finally
    '		If (conn.State = ConnectionState.Open) Then
    '			conn.Close()
    '		End IF
    '		conn = Nothing
    '	End Try

    '	Return result

    'End Function

    'Public Sub insertAnnalsProposal(ByVal objAnnalsProposal As AnnalsProposal)

    '	'declare connection
    '	Dim conn As SqlConnection = Nothing

    '	Try
    '		conn = ConnectionUtil.getSqlConnectionFromWebConfig()
    '		Dim sql As String = "INSERT INTO ANNALS_PROPOSAL " _
    '						& " (PROPOSAL_ID, PROPOSAL_NAME, PRIORITY, STATUS) " _
    '						& " VALUES(@PROPOSAL_ID, @PROPOSAL_NAME, @PRIORITY, @STATUS) "

    '		Dim sqlCmd As New SqlCommand(sql, conn)
    '		sqlCmd.Prepare()

    '		sqlCmd.Parameters.AddWithValue("@PROPOSAL_ID", objAnnalsProposal.PROPOSAL_ID)
    '		sqlCmd.Parameters.AddWithValue("@PROPOSAL_NAME", objAnnalsProposal.PROPOSAL_NAME)
    '		sqlCmd.Parameters.AddWithValue("@PRIORITY", objAnnalsProposal.PRIORITY)
    '		sqlCmd.Parameters.AddWithValue("@STATUS", objAnnalsProposal.STATUS)

    '		sqlCmd.ExecuteNonQuery()
    '	Catch ex As Exception
    '		Throw New Exception(ex.Message & " : " & ex.StackTrace)
    '	Finally
    '		If (conn.State = ConnectionState.Open) Then
    '			conn.Close()
    '		End IF
    '		conn = Nothing
    '	End Try

    'End Sub

    'Public Sub updateAnnalsProposal(ByVal objAnnalsProposal As AnnalsProposal)

    '	'declare connection
    '	Dim conn As SqlConnection = Nothing

    '	Try
    '		conn = ConnectionUtil.getSqlConnectionFromWebConfig()
    '		Dim sql As String = "UPDATE ANNALS_PROPOSAL SET " _
    '						& " PROPOSAL_NAME=@PROPOSAL_NAME, " _
    '						& " PRIORITY=@PRIORITY, " _
    '						& " STATUS=@STATUS " _
    '						& " WHERE PROPOSAL_ID=@PROPOSAL_ID "

    '		Dim sqlCmd As New SqlCommand(sql, conn)
    '		sqlCmd.Prepare()

    '		sqlCmd.Parameters.AddWithValue("@PROPOSAL_ID", objAnnalsProposal.PROPOSAL_ID)
    '		sqlCmd.Parameters.AddWithValue("@PROPOSAL_NAME", objAnnalsProposal.PROPOSAL_NAME)
    '		sqlCmd.Parameters.AddWithValue("@PRIORITY", objAnnalsProposal.PRIORITY)
    '		sqlCmd.Parameters.AddWithValue("@STATUS", objAnnalsProposal.STATUS)

    '		sqlCmd.ExecuteNonQuery()
    '	Catch ex As Exception
    '		Throw New Exception(ex.Message & " : " & ex.StackTrace)
    '	Finally
    '		If (conn.State = ConnectionState.Open) Then
    '			conn.Close()
    '		End IF
    '		conn = Nothing
    '	End Try

    'End Sub

    'Public Sub deleteAnnalsProposal(ByVal objAnnalsProposal As AnnalsProposal)

    '	'declare connection
    '	Dim conn As SqlConnection = Nothing

    '	Try
    '		conn = ConnectionUtil.getSqlConnectionFromWebConfig()
    '		Dim sql As String = "DELETE FROM ANNALS_PROPOSAL WHERE PROPOSAL_ID=@PROPOSAL_ID"

    '		Dim sqlCmd As New SqlCommand(sql, conn)
    '		sqlCmd.Prepare()

    '		sqlCmd.Parameters.AddWithValue("@PROPOSAL_ID", objAnnalsProposal.PROPOSAL_ID)

    '		sqlCmd.ExecuteNonQuery()
    '	Catch ex As Exception
    '		Throw New Exception(ex.Message & " : " & ex.StackTrace)
    '	Finally
    '		If (conn.State = ConnectionState.Open) Then
    '			conn.Close()
    '		End IF
    '		conn = Nothing
    '	End Try

    'End Sub

    'Public Sub deleteAnnalsProposal(ByVal PROPOSAL_ID As String)

    '	'declare connection
    '	Dim conn As SqlConnection = Nothing

    '	Try
    '		conn = ConnectionUtil.getSqlConnectionFromWebConfig()
    '		Dim sql As String = "DELETE FROM ANNALS_PROPOSAL WHERE PROPOSAL_ID=@PROPOSAL_ID"

    '		Dim sqlCmd As New SqlCommand(sql, conn)
    '		sqlCmd.Prepare()

    '		sqlCmd.Parameters.AddWithValue("@PROPOSAL_ID", PROPOSAL_ID)

    '		sqlCmd.ExecuteNonQuery()
    '	Catch ex As Exception
    '		Throw New Exception(ex.Message & " : " & ex.StackTrace)
    '	Finally
    '		If (conn.State = ConnectionState.Open) Then
    '			conn.Close()
    '		End IF
    '		conn = Nothing
    '	End Try

    'End Sub

	Public Function bindingAnnalsProposal(ByVal reader as SqlDataReader) As AnnalsProposal

		Dim objAnnalsProposal As New AnnalsProposal

		objAnnalsProposal.PROPOSAL_ID = CType(ConvertUtil.getObjectValue(reader("PROPOSAL_ID"), ConvertUtil.ObjectValueEnum.StringValue), String)
		objAnnalsProposal.PROPOSAL_NAME = CType(ConvertUtil.getObjectValue(reader("PROPOSAL_NAME"), ConvertUtil.ObjectValueEnum.StringValue), String)
		objAnnalsProposal.PRIORITY = CType(ConvertUtil.getObjectValue(reader("PRIORITY"), ConvertUtil.ObjectValueEnum.NumbericValue), Integer)
		objAnnalsProposal.STATUS = CType(ConvertUtil.getObjectValue(reader("STATUS"), ConvertUtil.ObjectValueEnum.NumbericValue), Integer)

		Return objAnnalsProposal

	End Function

End Class
