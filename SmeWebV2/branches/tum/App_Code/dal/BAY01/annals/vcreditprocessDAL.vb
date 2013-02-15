Option Explicit On
Option Strict On

Imports Microsoft.VisualBasic
Imports System.Data
Imports System.Data.SqlClient
Imports System.Diagnostics
Imports System.Collections.Generic

Public Class vcreditprocessDAL

	Private Shared className As String = "vcreditprocessDAL"

    Public Function getAllvcreditprocess(ByVal Emp_id As String) As List(Of vcreditprocess)

        'declare connection
        Dim conn As SqlConnection = Nothing
        'declare result
        Dim result As New List(Of vcreditprocess)

        Try
            conn = ConnectionUtil.getSqlConnectionFromWebConfig()
            Dim sql As String = "SELECT     dbo.ANNALS_CREDIT.ID  AS ID, "
            ' Dim sql As String = "SELECT     SUBSTRING(dbo.ANNALS_CREDIT.ID, 1, 1) + '' + SUBSTRING(dbo.ANNALS_CREDIT.ID, 2, 5) + '/' + SUBSTRING(dbo.ANNALS_CREDIT.ID, 7, 4) AS ID, "
            sql += " dbo.ANNALS_PROCESS.PROCESS, MAX(dbo.ANNALS_CREDIT_PROCESS.PROCESS_DATE) AS process_date"
            sql += " FROM         dbo.ANNALS_CREDIT INNER JOIN"
            sql += " dbo.ANNALS_CREDIT_PROCESS ON dbo.ANNALS_CREDIT.ID = dbo.ANNALS_CREDIT_PROCESS.ID INNER JOIN"
            sql += " dbo.ANNALS_PROCESS ON dbo.ANNALS_CREDIT_PROCESS.PROCESS_ID = dbo.ANNALS_PROCESS.PROCESS_ID"
            sql += " WHERE     (dbo.ANNALS_CREDIT_PROCESS.EMP_ID = @EMP_ID)"
            sql += " GROUP BY dbo.ANNALS_CREDIT.ID, dbo.ANNALS_PROCESS.PROCESS"

            Dim sqlCmd As New SqlCommand(sql, conn)
            sqlCmd.Prepare()
            sqlCmd.Parameters.AddWithValue("@EMP_ID", Emp_id)

            Dim reader As SqlDataReader = sqlCmd.ExecuteReader()

            While reader.Read()
                result.Add(bindingvcreditprocess(reader))
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

	Public Function getAllvcreditprocessBySQL(ByVal sql AS String) As List (Of vcreditprocess)

		'declare connection
		Dim conn As SqlConnection = Nothing
		'declare result
		Dim result As New List(Of vcreditprocess)

		Try
			conn = ConnectionUtil.getSqlConnectionFromWebConfig()
			Dim sqlCmd As New SqlCommand(sql, conn)
			sqlCmd.Prepare()

			Dim reader As SqlDataReader = sqlCmd.ExecuteReader()

			While reader.Read()
				result.Add(bindingvcreditprocess(reader))
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


	Public Function bindingvcreditprocess(ByVal reader as SqlDataReader) As vcreditprocess

		Dim objvcreditprocess As New vcreditprocess

		objvcreditprocess.ID = CType(ConvertUtil.getObjectValue(reader("ID"), ConvertUtil.ObjectValueEnum.StringValue), String)
		objvcreditprocess.PROCESS = CType(ConvertUtil.getObjectValue(reader("PROCESS"), ConvertUtil.ObjectValueEnum.StringValue), String)
		objvcreditprocess.process_date = CType(ConvertUtil.getObjectValue(reader("process_date"), ConvertUtil.ObjectValueEnum.DateValue), Date)

		Return objvcreditprocess

	End Function

End Class
