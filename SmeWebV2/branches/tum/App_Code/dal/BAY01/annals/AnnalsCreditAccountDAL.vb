Option Explicit On
Option Strict On

Imports Microsoft.VisualBasic
Imports System.Data
Imports System.Data.SqlClient
Imports System.Diagnostics
Imports System.Collections.Generic

Public Class AnnalsCreditAccountDAL

	Private Shared className As String = "AnnalsCreditAccountDAL"

	Public Function getAnnalsCreditAccountByID(ByVal objAnnalsCreditAccount As AnnalsCreditAccount) As AnnalsCreditAccount

		'declare connection
		Dim conn As SqlConnection = Nothing
		'declare result
		Dim result As New AnnalsCreditAccount()

		Try
			conn = ConnectionUtil.getSqlConnectionFromWebConfig()
			Dim sql As String = "SELECT " _
				& "ID, CIF, ACCNO, NBRTHAI, " _
				& "DECB_RD_ID, SUMLIMIT, SUMPRIN, SUMACCRU, " _
				& "SUMSUSP, SUMAGING, SUBJECT_DETAIL_ID, Value_Customer, " _
				& "VALUE_OLD, VALUE, VALUE_APPROVE, Others " _
				& "FROM ANNALS_CREDIT_ACCOUNT " _
				& "WHERE ID=@ID " _
				& "ORDER BY ID"

			Dim sqlCmd As New SqlCommand(sql, conn)
			sqlCmd.Prepare()

			sqlCmd.Parameters.AddWithValue("@ID", objAnnalsCreditAccount.ID)

			Dim reader As SqlDataReader = sqlCmd.ExecuteReader()

			While reader.Read()
				result = bindingAnnalsCreditAccount(reader)
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

	Public Function getAnnalsCreditAccountByID(ByVal ID As String) As AnnalsCreditAccount

		'declare connection
		Dim conn As SqlConnection = Nothing
		'declare result
		Dim result As New AnnalsCreditAccount()

		Try
			conn = ConnectionUtil.getSqlConnectionFromWebConfig()
			Dim sql As String = "SELECT " _
				& "ID, CIF, ACCNO, NBRTHAI, " _
				& "DECB_RD_ID, SUMLIMIT, SUMPRIN, SUMACCRU, " _
				& "SUMSUSP, SUMAGING, SUBJECT_DETAIL_ID, Value_Customer, " _
				& "VALUE_OLD, VALUE, VALUE_APPROVE, Others " _
				& "FROM ANNALS_CREDIT_ACCOUNT " _
				& "WHERE ID=@ID " _
				& "ORDER BY ID"

			Dim sqlCmd As New SqlCommand(sql, conn)
			sqlCmd.Prepare()

			sqlCmd.Parameters.AddWithValue("@ID", ID)

			Dim reader As SqlDataReader = sqlCmd.ExecuteReader()

			While reader.Read()
				result = bindingAnnalsCreditAccount(reader)
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

	Public Function getAllAnnalsCreditAccount() As List (Of AnnalsCreditAccount)

		'declare connection
		Dim conn As SqlConnection = Nothing
		'declare result
		Dim result As New List(Of AnnalsCreditAccount)

		Try
			conn = ConnectionUtil.getSqlConnectionFromWebConfig()
			Dim sql As String = "SELECT " _
				& "ID, CIF, ACCNO, NBRTHAI, " _
				& "DECB_RD_ID, SUMLIMIT, SUMPRIN, SUMACCRU, " _
				& "SUMSUSP, SUMAGING, SUBJECT_DETAIL_ID, Value_Customer, " _
				& "VALUE_OLD, VALUE, VALUE_APPROVE, Others " _
				& "FROM ANNALS_CREDIT_ACCOUNT " _
				& "ORDER BY ID"

			Dim sqlCmd As New SqlCommand(sql, conn)
			sqlCmd.Prepare()

			Dim reader As SqlDataReader = sqlCmd.ExecuteReader()

			While reader.Read()
				result.Add(bindingAnnalsCreditAccount(reader))
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

	Public Function getAllAnnalsCreditAccountBySQL(ByVal sql AS String) As List (Of AnnalsCreditAccount)

		'declare connection
		Dim conn As SqlConnection = Nothing
		'declare result
		Dim result As New List(Of AnnalsCreditAccount)

		Try
			conn = ConnectionUtil.getSqlConnectionFromWebConfig()
			Dim sqlCmd As New SqlCommand(sql, conn)
			sqlCmd.Prepare()

			Dim reader As SqlDataReader = sqlCmd.ExecuteReader()

			While reader.Read()
				result.Add(bindingAnnalsCreditAccount(reader))
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

    Public Sub insertAnnalsCreditAccount(ByVal objAnnalsCreditAccount As AnnalsCreditAccount)

        'declare connection
        Dim conn As SqlConnection = Nothing

        Try
            conn = ConnectionUtil.getSqlConnectionFromWebConfig()
            Dim sql As String = "INSERT INTO ANNALS_CREDIT_ACCOUNT " _
                & " (ID, CIF, ACCNO, NBRTHAI, DECB_RD_ID, SUMLIMIT, SUMPRIN, SUMACCRU, SUMSUSP, SUMAGING, SUBJECT_DETAIL_ID, Value_Customer, VALUE_OLD, VALUE, VALUE_APPROVE, Others) " _
                & " VALUES(@ID, @CIF, @ACCNO, @NBRTHAI, @DECB_RD_ID, @SUMLIMIT, @SUMPRIN, @SUMACCRU, @SUMSUSP, @SUMAGING, @SUBJECT_DETAIL_ID, @Value_Customer, @VALUE_OLD, @VALUE, @VALUE_APPROVE, @Others) "

            Dim sqlCmd As New SqlCommand(sql, conn)
            sqlCmd.Prepare()

            sqlCmd.Parameters.AddWithValue("@ID", objAnnalsCreditAccount.ID)
            sqlCmd.Parameters.AddWithValue("@CIF", objAnnalsCreditAccount.CIF)
            sqlCmd.Parameters.AddWithValue("@ACCNO", objAnnalsCreditAccount.ACCNO)
            sqlCmd.Parameters.AddWithValue("@NBRTHAI", objAnnalsCreditAccount.NBRTHAI)
            sqlCmd.Parameters.AddWithValue("@DECB_RD_ID", objAnnalsCreditAccount.DECB_RD_ID)
            sqlCmd.Parameters.AddWithValue("@SUMLIMIT", objAnnalsCreditAccount.SUMLIMIT)
            sqlCmd.Parameters.AddWithValue("@SUMPRIN", objAnnalsCreditAccount.SUMPRIN)
            sqlCmd.Parameters.AddWithValue("@SUMACCRU", objAnnalsCreditAccount.SUMACCRU)
            sqlCmd.Parameters.AddWithValue("@SUMSUSP", objAnnalsCreditAccount.SUMSUSP)
            sqlCmd.Parameters.AddWithValue("@SUMAGING", objAnnalsCreditAccount.SUMAGING)
            sqlCmd.Parameters.AddWithValue("@SUBJECT_DETAIL_ID", objAnnalsCreditAccount.SUBJECT_DETAIL_ID)
            sqlCmd.Parameters.AddWithValue("@Value_Customer", objAnnalsCreditAccount.Value_Customer)
            sqlCmd.Parameters.AddWithValue("@VALUE_OLD", objAnnalsCreditAccount.VALUE_OLD)
            sqlCmd.Parameters.AddWithValue("@VALUE", objAnnalsCreditAccount.VALUE)
            sqlCmd.Parameters.AddWithValue("@VALUE_APPROVE", objAnnalsCreditAccount.VALUE_APPROVE)
            sqlCmd.Parameters.AddWithValue("@Others", objAnnalsCreditAccount.Others)

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

    Public Sub updateAnnalsCreditAccount(ByVal objAnnalsCreditAccount As AnnalsCreditAccount)

        'declare connection
        Dim conn As SqlConnection = Nothing

        Try
            conn = ConnectionUtil.getSqlConnectionFromWebConfig()
            Dim sql As String = "UPDATE ANNALS_CREDIT_ACCOUNT SET " _
                & " CIF=@CIF, " _
                & " ACCNO=@ACCNO, " _
                & " NBRTHAI=@NBRTHAI, " _
                & " DECB_RD_ID=@DECB_RD_ID, " _
                & " SUMLIMIT=@SUMLIMIT, " _
                & " SUMPRIN=@SUMPRIN, " _
                & " SUMACCRU=@SUMACCRU, " _
                & " SUMSUSP=@SUMSUSP, " _
                & " SUMAGING=@SUMAGING, " _
                & " SUBJECT_DETAIL_ID=@SUBJECT_DETAIL_ID, " _
                & " Value_Customer=@Value_Customer, " _
                & " VALUE_OLD=@VALUE_OLD, " _
                & " VALUE=@VALUE, " _
                & " VALUE_APPROVE=@VALUE_APPROVE, " _
                & " Others=@Others " _
                & " WHERE ID=@ID "

            Dim sqlCmd As New SqlCommand(sql, conn)
            sqlCmd.Prepare()

            sqlCmd.Parameters.AddWithValue("@ID", objAnnalsCreditAccount.ID)
            sqlCmd.Parameters.AddWithValue("@CIF", objAnnalsCreditAccount.CIF)
            sqlCmd.Parameters.AddWithValue("@ACCNO", objAnnalsCreditAccount.ACCNO)
            sqlCmd.Parameters.AddWithValue("@NBRTHAI", objAnnalsCreditAccount.NBRTHAI)
            sqlCmd.Parameters.AddWithValue("@DECB_RD_ID", objAnnalsCreditAccount.DECB_RD_ID)
            sqlCmd.Parameters.AddWithValue("@SUMLIMIT", objAnnalsCreditAccount.SUMLIMIT)
            sqlCmd.Parameters.AddWithValue("@SUMPRIN", objAnnalsCreditAccount.SUMPRIN)
            sqlCmd.Parameters.AddWithValue("@SUMACCRU", objAnnalsCreditAccount.SUMACCRU)
            sqlCmd.Parameters.AddWithValue("@SUMSUSP", objAnnalsCreditAccount.SUMSUSP)
            sqlCmd.Parameters.AddWithValue("@SUMAGING", objAnnalsCreditAccount.SUMAGING)
            sqlCmd.Parameters.AddWithValue("@SUBJECT_DETAIL_ID", objAnnalsCreditAccount.SUBJECT_DETAIL_ID)
            sqlCmd.Parameters.AddWithValue("@Value_Customer", objAnnalsCreditAccount.Value_Customer)
            sqlCmd.Parameters.AddWithValue("@VALUE_OLD", objAnnalsCreditAccount.VALUE_OLD)
            sqlCmd.Parameters.AddWithValue("@VALUE", objAnnalsCreditAccount.VALUE)
            sqlCmd.Parameters.AddWithValue("@VALUE_APPROVE", objAnnalsCreditAccount.VALUE_APPROVE)
            sqlCmd.Parameters.AddWithValue("@Others", objAnnalsCreditAccount.Others)

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

    Public Sub deleteAnnalsCreditAccount(ByVal objAnnalsCreditAccount As AnnalsCreditAccount)

        'declare connection
        Dim conn As SqlConnection = Nothing

        Try
            conn = ConnectionUtil.getSqlConnectionFromWebConfig()
            Dim sql As String = "DELETE FROM ANNALS_CREDIT_ACCOUNT WHERE ID=@ID"

            Dim sqlCmd As New SqlCommand(sql, conn)
            sqlCmd.Prepare()

            sqlCmd.Parameters.AddWithValue("@ID", objAnnalsCreditAccount.ID)

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

    Public Sub deleteAnnalsCreditAccount(ByVal ID As String)

        'declare connection
        Dim conn As SqlConnection = Nothing

        Try
            conn = ConnectionUtil.getSqlConnectionFromWebConfig()
            Dim sql As String = "DELETE FROM ANNALS_CREDIT_ACCOUNT WHERE ID=@ID"

            Dim sqlCmd As New SqlCommand(sql, conn)
            sqlCmd.Prepare()

            sqlCmd.Parameters.AddWithValue("@ID", ID)

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

    Public Function bindingAnnalsCreditAccount(ByVal reader As SqlDataReader) As AnnalsCreditAccount

        Dim objAnnalsCreditAccount As New AnnalsCreditAccount

        objAnnalsCreditAccount.ID = CType(ConvertUtil.getObjectValue(reader("ID"), ConvertUtil.ObjectValueEnum.StringValue), String)
        objAnnalsCreditAccount.CIF = CType(ConvertUtil.getObjectValue(reader("CIF"), ConvertUtil.ObjectValueEnum.NumbericValue), Integer)
        objAnnalsCreditAccount.ACCNO = CType(ConvertUtil.getObjectValue(reader("ACCNO"), ConvertUtil.ObjectValueEnum.StringValue), String)
        objAnnalsCreditAccount.NBRTHAI = CType(ConvertUtil.getObjectValue(reader("NBRTHAI"), ConvertUtil.ObjectValueEnum.StringValue), String)
        objAnnalsCreditAccount.DECB_RD_ID = CType(ConvertUtil.getObjectValue(reader("DECB_RD_ID"), ConvertUtil.ObjectValueEnum.StringValue), String)
        objAnnalsCreditAccount.SUMLIMIT = CType(ConvertUtil.getObjectValue(reader("SUMLIMIT"), ConvertUtil.ObjectValueEnum.DoubleValue), Double)
        objAnnalsCreditAccount.SUMPRIN = CType(ConvertUtil.getObjectValue(reader("SUMPRIN"), ConvertUtil.ObjectValueEnum.DoubleValue), Double)
        objAnnalsCreditAccount.SUMACCRU = CType(ConvertUtil.getObjectValue(reader("SUMACCRU"), ConvertUtil.ObjectValueEnum.DoubleValue), Double)
        objAnnalsCreditAccount.SUMSUSP = CType(ConvertUtil.getObjectValue(reader("SUMSUSP"), ConvertUtil.ObjectValueEnum.DoubleValue), Double)
        objAnnalsCreditAccount.SUMAGING = CType(ConvertUtil.getObjectValue(reader("SUMAGING"), ConvertUtil.ObjectValueEnum.DoubleValue), Double)
        objAnnalsCreditAccount.SUBJECT_DETAIL_ID = CType(ConvertUtil.getObjectValue(reader("SUBJECT_DETAIL_ID"), ConvertUtil.ObjectValueEnum.StringValue), String)

        objAnnalsCreditAccount.Value_Customer = CType(ConvertUtil.getObjectValue(reader("Value_Customer"), ConvertUtil.ObjectValueEnum.StringValue), String)  ' เป็น string เนื่องจากสามารถเป็น null ได้
        objAnnalsCreditAccount.VALUE_OLD = CType(ConvertUtil.getObjectValue(reader("VALUE_OLD"), ConvertUtil.ObjectValueEnum.StringValue), String)
        objAnnalsCreditAccount.VALUE = CType(ConvertUtil.getObjectValue(reader("VALUE"), ConvertUtil.ObjectValueEnum.StringValue), String)
        objAnnalsCreditAccount.VALUE_APPROVE = CType(ConvertUtil.getObjectValue(reader("VALUE_APPROVE"), ConvertUtil.ObjectValueEnum.StringValue), String)

        objAnnalsCreditAccount.Others = CType(ConvertUtil.getObjectValue(reader("Others"), ConvertUtil.ObjectValueEnum.StringValue), String)

        Return objAnnalsCreditAccount

    End Function

End Class
