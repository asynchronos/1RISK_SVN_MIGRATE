Option Explicit On
Option Strict On

Imports Microsoft.VisualBasic
Imports System.Data
Imports System.Data.SqlClient
Imports System.Diagnostics
Imports System.Collections.Generic

Public Class TbEmptraningDAL

	Private Shared className As String = "TbEmptraningDAL"

	Public Function getTbEmptraningByID_NO(ByVal objTbEmptraning As TbEmptraning) As TbEmptraning

		'declare connection
		Dim conn As SqlConnection = Nothing
		'declare result
		Dim result As New TbEmptraning()

		Try
			conn = ConnectionUtil.getSqlConnectionFromWebConfig()
			Dim sql As String = "SELECT " _
				& "ID_NO, EMP_ID, NAMETRAIN, PLACE, " _
				& "STARTDATE, FINISHDATE, IN_OUT, UP_DT " _
				& "FROM TB_EMPTRANING " _
				& "WHERE ID_NO=@ID_NO " _
				& "ORDER BY ID_NO"

			Dim sqlCmd As New SqlCommand(sql, conn)
			sqlCmd.Prepare()

			sqlCmd.Parameters.AddWithValue("@ID_NO", objTbEmptraning.ID_NO)

			Dim reader As SqlDataReader = sqlCmd.ExecuteReader()

			While reader.Read()
				result = bindingTbEmptraning(reader)
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

	Public Function getTbEmptraningByID_NO(ByVal ID_NO As Integer) As TbEmptraning

		'declare connection
		Dim conn As SqlConnection = Nothing
		'declare result
		Dim result As New TbEmptraning()

		Try
			conn = ConnectionUtil.getSqlConnectionFromWebConfig()
			Dim sql As String = "SELECT " _
				& "ID_NO, EMP_ID, NAMETRAIN, PLACE, " _
				& "STARTDATE, FINISHDATE, IN_OUT, UP_DT " _
				& "FROM TB_EMPTRANING " _
				& "WHERE ID_NO=@ID_NO " _
				& "ORDER BY ID_NO"

			Dim sqlCmd As New SqlCommand(sql, conn)
			sqlCmd.Prepare()

			sqlCmd.Parameters.AddWithValue("@ID_NO", ID_NO)

			Dim reader As SqlDataReader = sqlCmd.ExecuteReader()

			While reader.Read()
				result = bindingTbEmptraning(reader)
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

	Public Function getAllTbEmptraning() As List (Of TbEmptraning)

		'declare connection
		Dim conn As SqlConnection = Nothing
		'declare result
		Dim result As New List(Of TbEmptraning)

		Try
			conn = ConnectionUtil.getSqlConnectionFromWebConfig()
			Dim sql As String = "SELECT " _
				& "ID_NO, EMP_ID, NAMETRAIN, PLACE, " _
				& "STARTDATE, FINISHDATE, IN_OUT, UP_DT " _
				& "FROM TB_EMPTRANING " _
				& "ORDER BY ID_NO"

			Dim sqlCmd As New SqlCommand(sql, conn)
			sqlCmd.Prepare()

			Dim reader As SqlDataReader = sqlCmd.ExecuteReader()

			While reader.Read()
				result.Add(bindingTbEmptraning(reader))
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
    Public Function getAllTbEmptraningByEmpID(ByVal Emp_id As String) As List(Of TbEmptraning)

        'declare connection
        Dim conn As SqlConnection = Nothing
        'declare result
        Dim result As New List(Of TbEmptraning)

        Try
            conn = ConnectionUtil.getSqlConnectionFromWebConfig()
            Dim sql As String = "SELECT " _
             & "ID_NO, EMP_ID, NAMETRAIN, PLACE, " _
             & "STARTDATE, FINISHDATE, IN_OUT, UP_DT " _
             & "FROM TB_EMPTRANING " _
             & "Where EMP_ID=@Emp_ID"

            Dim sqlCmd As New SqlCommand(sql, conn)
            sqlCmd.Prepare()
            sqlCmd.Parameters.AddWithValue("@EMP_ID", Emp_id)

            Dim reader As SqlDataReader = sqlCmd.ExecuteReader()

            While reader.Read()
                result.Add(bindingTbEmptraning(reader))
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
	Public Function getAllTbEmptraningBySQL(ByVal sql AS String) As List (Of TbEmptraning)

		'declare connection
		Dim conn As SqlConnection = Nothing
		'declare result
		Dim result As New List(Of TbEmptraning)

		Try
			conn = ConnectionUtil.getSqlConnectionFromWebConfig()
			Dim sqlCmd As New SqlCommand(sql, conn)
			sqlCmd.Prepare()

			Dim reader As SqlDataReader = sqlCmd.ExecuteReader()

			While reader.Read()
				result.Add(bindingTbEmptraning(reader))
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

	Public Sub insertTbEmptraning(ByVal objTbEmptraning As TbEmptraning)

		'declare connection
		Dim conn As SqlConnection = Nothing

		Try
			conn = ConnectionUtil.getSqlConnectionFromWebConfig()
            Dim sql As String = "INSERT INTO TB_EMPTRANING " _
                & " (EMP_ID, NAMETRAIN, PLACE, STARTDATE, FINISHDATE, IN_OUT, UP_DT) " _
                & " VALUES( @EMP_ID, @NAMETRAIN, @PLACE, @STARTDATE, @FINISHDATE,'',getdate()) "

			Dim sqlCmd As New SqlCommand(sql, conn)
			sqlCmd.Prepare()

            'sqlCmd.Parameters.AddWithValue("@ID_NO", objTbEmptraning.ID_NO)
			sqlCmd.Parameters.AddWithValue("@EMP_ID", objTbEmptraning.EMP_ID)
			sqlCmd.Parameters.AddWithValue("@NAMETRAIN", objTbEmptraning.NAMETRAIN)
			sqlCmd.Parameters.AddWithValue("@PLACE", objTbEmptraning.PLACE)
			sqlCmd.Parameters.AddWithValue("@STARTDATE", objTbEmptraning.STARTDATE)
			sqlCmd.Parameters.AddWithValue("@FINISHDATE", objTbEmptraning.FINISHDATE)
            'sqlCmd.Parameters.AddWithValue("@IN_OUT", objTbEmptraning.IN_OUT)
            'sqlCmd.Parameters.AddWithValue("@UP_DT", objTbEmptraning.UP_DT)

			sqlCmd.ExecuteNonQuery()
		Catch ex As Exception
			Throw New Exception(ex.Message & " : " & ex.StackTrace)
		Finally
			If (conn.State = ConnectionState.Open) Then
				conn.Close()
			End IF
			conn = Nothing
		End Try

	End Sub

	Public Sub updateTbEmptraning(ByVal objTbEmptraning As TbEmptraning)

		'declare connection
		Dim conn As SqlConnection = Nothing

		Try
			conn = ConnectionUtil.getSqlConnectionFromWebConfig()
            Dim sql As String = "UPDATE TB_EMPTRANING SET " _
                & " EMP_ID=@EMP_ID, " _
                & " NAMETRAIN=@NAMETRAIN, " _
                & " PLACE=@PLACE, " _
                & " STARTDATE=@STARTDATE, " _
                & " FINISHDATE=@FINISHDATE, " _
                & " IN_OUT='', " _
                & " UP_DT=getdate() " _
                & " WHERE ID_NO=@ID_NO "

			Dim sqlCmd As New SqlCommand(sql, conn)
			sqlCmd.Prepare()

			sqlCmd.Parameters.AddWithValue("@ID_NO", objTbEmptraning.ID_NO)
			sqlCmd.Parameters.AddWithValue("@EMP_ID", objTbEmptraning.EMP_ID)
			sqlCmd.Parameters.AddWithValue("@NAMETRAIN", objTbEmptraning.NAMETRAIN)
			sqlCmd.Parameters.AddWithValue("@PLACE", objTbEmptraning.PLACE)
			sqlCmd.Parameters.AddWithValue("@STARTDATE", objTbEmptraning.STARTDATE)
			sqlCmd.Parameters.AddWithValue("@FINISHDATE", objTbEmptraning.FINISHDATE)
            'sqlCmd.Parameters.AddWithValue("@IN_OUT", objTbEmptraning.IN_OUT)
            'sqlCmd.Parameters.AddWithValue("@UP_DT", objTbEmptraning.UP_DT)

			sqlCmd.ExecuteNonQuery()
		Catch ex As Exception
			Throw New Exception(ex.Message & " : " & ex.StackTrace)
		Finally
			If (conn.State = ConnectionState.Open) Then
				conn.Close()
			End IF
			conn = Nothing
		End Try

	End Sub

	Public Sub deleteTbEmptraning(ByVal objTbEmptraning As TbEmptraning)

		'declare connection
		Dim conn As SqlConnection = Nothing

		Try
			conn = ConnectionUtil.getSqlConnectionFromWebConfig()
			Dim sql As String = "DELETE FROM TB_EMPTRANING WHERE ID_NO=@ID_NO"

			Dim sqlCmd As New SqlCommand(sql, conn)
			sqlCmd.Prepare()

			sqlCmd.Parameters.AddWithValue("@ID_NO", objTbEmptraning.ID_NO)

			sqlCmd.ExecuteNonQuery()
		Catch ex As Exception
			Throw New Exception(ex.Message & " : " & ex.StackTrace)
		Finally
			If (conn.State = ConnectionState.Open) Then
				conn.Close()
			End IF
			conn = Nothing
		End Try

	End Sub

	Public Sub deleteTbEmptraning(ByVal ID_NO As Integer)

		'declare connection
		Dim conn As SqlConnection = Nothing

		Try
			conn = ConnectionUtil.getSqlConnectionFromWebConfig()
			Dim sql As String = "DELETE FROM TB_EMPTRANING WHERE ID_NO=@ID_NO"

			Dim sqlCmd As New SqlCommand(sql, conn)
			sqlCmd.Prepare()

			sqlCmd.Parameters.AddWithValue("@ID_NO", ID_NO)

			sqlCmd.ExecuteNonQuery()
		Catch ex As Exception
			Throw New Exception(ex.Message & " : " & ex.StackTrace)
		Finally
			If (conn.State = ConnectionState.Open) Then
				conn.Close()
			End IF
			conn = Nothing
		End Try

	End Sub

	Public Function bindingTbEmptraning(ByVal reader as SqlDataReader) As TbEmptraning

		Dim objTbEmptraning As New TbEmptraning

		objTbEmptraning.ID_NO = CType(ConvertUtil.getObjectValue(reader("ID_NO"), ConvertUtil.ObjectValueEnum.NumbericValue), Integer)
		objTbEmptraning.EMP_ID = CType(ConvertUtil.getObjectValue(reader("EMP_ID"), ConvertUtil.ObjectValueEnum.StringValue), String)
		objTbEmptraning.NAMETRAIN = CType(ConvertUtil.getObjectValue(reader("NAMETRAIN"), ConvertUtil.ObjectValueEnum.StringValue), String)
		objTbEmptraning.PLACE = CType(ConvertUtil.getObjectValue(reader("PLACE"), ConvertUtil.ObjectValueEnum.StringValue), String)
		objTbEmptraning.STARTDATE = CType(ConvertUtil.getObjectValue(reader("STARTDATE"), ConvertUtil.ObjectValueEnum.DateValue), Date)
		objTbEmptraning.FINISHDATE = CType(ConvertUtil.getObjectValue(reader("FINISHDATE"), ConvertUtil.ObjectValueEnum.DateValue), Date)
		objTbEmptraning.IN_OUT = CType(ConvertUtil.getObjectValue(reader("IN_OUT"), ConvertUtil.ObjectValueEnum.StringValue), String)
		objTbEmptraning.UP_DT = CType(ConvertUtil.getObjectValue(reader("UP_DT"), ConvertUtil.ObjectValueEnum.DateValue), Date)

		Return objTbEmptraning

	End Function

End Class
