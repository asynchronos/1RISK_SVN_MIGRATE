Option Explicit On
Option Strict On

Imports Microsoft.VisualBasic
Imports System.Data
Imports System.Data.SqlClient
Imports System.Diagnostics
Imports System.Collections.Generic

Public Class AnnalsSubCommitteeDAL

	Private Shared className As String = "AnnalsSubCommitteeDAL"

    Public Function getAnnalsSubCommitteeByID(ByVal ID As Integer) As AnnalsSubCommittee

        'declare connection
        Dim conn As SqlConnection = Nothing
        'declare result
        Dim result As New AnnalsSubCommittee()

        Try
            conn = ConnectionUtil.getSqlConnectionFromWebConfig()
            Dim sql = "  SELECT  E.EMP_ID" _
                     & " ,E.TITLE_NAME+E.EMPNAME+ ' ' + E.EMPSURNAME  'EMP_NAME'" _
                     & ",S.ID,S.PRIORITY " _
                     & " FROM  EMPLOYEE01  E INNER JOIN  ANNALS_SUB_COMMITTEE S " _
                     & " ON E.EMP_ID = S.EMP_ID " _
                     & " ORDER  BY  PRIORITY ASC "

            Dim sqlCmd As New SqlCommand(sql, conn)
            sqlCmd.Prepare()

            sqlCmd.Parameters.AddWithValue("@ID", ID)

            Dim reader As SqlDataReader = sqlCmd.ExecuteReader()

            While reader.Read()
                result = bindingAnnalsSubCommittee(reader)
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

	Public Function getAllAnnalsSubCommittee() As List (Of AnnalsSubCommittee)

		'declare connection
		Dim conn As SqlConnection = Nothing
		'declare result
        Dim result As New List(Of AnnalsSubCommittee)
        Dim sql = "  SELECT  E.EMP_ID" _
                            & " ,E.TITLE_NAME+E.EMPNAME + ' ' + E.EMPSURNAME 'EMP_NAME' " _
                            & ",S.ID,S.PRIORITY " _
                            & " FROM  EMPLOYEE01  E INNER JOIN  ANNALS_SUB_COMMITTEE S  " _
                            & " ON E.EMP_ID = S.EMP_ID " _
                            & " ORDER BY PRIORITY ASC "
		Try
			conn = ConnectionUtil.getSqlConnectionFromWebConfig()

			Dim sqlCmd As New SqlCommand(sql, conn)
			sqlCmd.Prepare()

			Dim reader As SqlDataReader = sqlCmd.ExecuteReader()

			While reader.Read()
				result.Add(bindingAnnalsSubCommittee(reader))
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

    Public Function bindingAnnalsSubCommittee(ByVal reader As SqlDataReader) As AnnalsSubCommittee

        Dim objAnnalsSubCommittee As New AnnalsSubCommittee

        objAnnalsSubCommittee.ID = CType(ConvertUtil.getObjectValue(reader("ID"), ConvertUtil.ObjectValueEnum.NumbericValue), Integer)
        objAnnalsSubCommittee.EMP_ID = CType(ConvertUtil.getObjectValue(reader("EMP_ID"), ConvertUtil.ObjectValueEnum.StringValue), String)
        objAnnalsSubCommittee.EMP_NAME = CType(ConvertUtil.getObjectValue(reader("EMP_NAME"), ConvertUtil.ObjectValueEnum.StringValue), String)
        objAnnalsSubCommittee.PRIORITY = CType(ConvertUtil.getObjectValue(reader("PRIORITY"), ConvertUtil.ObjectValueEnum.NumbericValue), Integer)

        Return objAnnalsSubCommittee

    End Function

End Class
