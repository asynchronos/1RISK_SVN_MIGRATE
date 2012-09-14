Option Explicit On
Option Strict On

Imports Microsoft.VisualBasic
Imports System.Data
Imports System.Data.SqlClient
Imports System.Diagnostics
Imports System.Collections.Generic

Public Class AnnalsViewerDAL

	Private Shared className As String = "AnnalsViewerDAL"

#Region "GetByPK"
	Public Function getAnnalsViewerByANNALS_TYPE(ByVal objAnnalsViewer As AnnalsViewer) As AnnalsViewer
		Return getAnnalsViewerByANNALS_TYPE(objAnnalsViewer.ANNALS_TYPE)
	End Function

	Public Function getAnnalsViewerByANNALS_TYPE(ByVal ANNALS_TYPE As String) As AnnalsViewer

		'declare connection
		Dim conn As SqlConnection = Nothing
		'declare result
		Dim result As AnnalsViewer = Nothing

		Try
			conn = ConnectionUtil.getSqlConnectionFromWebConfig()
            Dim sql As String = "SELECT " _
             & "ANNALS_TYPE, ANNALS_SEQ_NO, ANNALS_YEAR, EMP_ID " _
             & "FROM ANNALS_VIEWER " _
             & "WHERE ANNALS_TYPE=@ANNALS_TYPE " _
             & "ORDER BY ANNALS_TYPE"

			Dim sqlCmd As New SqlCommand(sql, conn)
			sqlCmd.Prepare()

			sqlCmd.Parameters.AddWithValue("@ANNALS_TYPE", ANNALS_TYPE)

			Dim reader As SqlDataReader = sqlCmd.ExecuteReader()

			While reader.Read()
				result = bindingAnnalsViewer(reader)
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
#End Region

#Region "GetAll"
	Public Function getAllAnnalsViewer() As List (Of AnnalsViewer)

		'declare connection
		Dim conn As SqlConnection = Nothing
		'declare result
		Dim result As New List(Of AnnalsViewer)

		Try
			conn = ConnectionUtil.getSqlConnectionFromWebConfig()
            Dim sql As String = "SELECT " _
             & "ANNALS_TYPE, ANNALS_SEQ_NO, ANNALS_YEAR, EMP_ID " _
             & "FROM ANNALS_VIEWER " _
             & "ORDER BY ANNALS_TYPE"

            Dim sqlCmd As New SqlCommand(sql, conn)
            sqlCmd.Prepare()

            Dim reader As SqlDataReader = sqlCmd.ExecuteReader()

            While reader.Read()
                result.Add(bindingAnnalsViewer(reader))
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
    ''' <summary>
    ''' ใช้สำหรับ maintain master table
    ''' </summary>
    ''' <param name="objAnnalsViewer"></param>
    ''' <remarks></remarks>
    Public Sub insertAnnalsViewer(ByVal objAnnalsViewer As AnnalsViewer)

        'declare connection
        Dim conn As SqlConnection = Nothing

        Try
            conn = ConnectionUtil.getSqlConnectionFromWebConfig()
            'Dim sql As String = "INSERT INTO ANNALS_VIEWER " _
            '    & " (ANNALS_TYPE, ANNALS_SEQ_NO, ANNALS_YEAR, EMP_ID) " _
            '    & " VALUES(@ANNALS_TYPE, @ANNALS_SEQ_NO, @ANNALS_YEAR, @EMP_ID) "

            Dim sqlCmd As New SqlCommand()
            sqlCmd.Connection = conn
            insertAnnalsViewer(objAnnalsViewer, sqlCmd)

        Catch sqlEx As SqlException
            Throw New Exception(sqlEx.Message & " : " & sqlEx.StackTrace)
        Catch ex As Exception
            Throw New Exception(ex.Message & " : " & ex.StackTrace)
        Finally
            If (conn.State = ConnectionState.Open) Then
                conn.Close()
            End If
            conn = Nothing
        End Try

    End Sub

    ''' <summary>
    ''' ใช้ insert ในกรณีทำ transaction ที่ Class อื่น
    ''' </summary>
    ''' <param name="objAnnalsViewer"></param>
    ''' <param name="sqlCmd"></param>
    ''' <remarks></remarks>
    Public Sub insertAnnalsViewer(ByVal objAnnalsViewer As AnnalsViewer, ByVal sqlCmd As SqlCommand)

        'Dim sqlCmd As New SqlCommand("Annals_Viewer_Insert", conn)
        sqlCmd.CommandText = "Annals_Viewer_Insert"
        sqlCmd.CommandType = CommandType.StoredProcedure
        sqlCmd.Parameters.Clear()

        sqlCmd.Parameters.AddWithValue("@ANNALS_TYPE", objAnnalsViewer.ANNALS_TYPE)
        sqlCmd.Parameters.AddWithValue("@ANNALS_SEQ_NO", objAnnalsViewer.ANNALS_SEQ_NO)
        sqlCmd.Parameters.AddWithValue("@ANNALS_YEAR", objAnnalsViewer.ANNALS_YEAR)
        sqlCmd.Parameters.AddWithValue("@EMP_ID", objAnnalsViewer.EMP_ID)

        sqlCmd.ExecuteNonQuery()

    End Sub
#End Region

#Region "Update"
    Public Sub updateAnnalsViewer(ByVal objAnnalsViewer As AnnalsViewer)

        'declare connection
        Dim conn As SqlConnection = Nothing

        Try
            conn = ConnectionUtil.getSqlConnectionFromWebConfig()
            Dim sql As String = "UPDATE ANNALS_VIEWER SET " _
                & " ANNALS_SEQ_NO=@ANNALS_SEQ_NO, " _
                & " ANNALS_YEAR=@ANNALS_YEAR, " _
                & " EMP_ID=@EMP_ID " _
                & " WHERE ANNALS_TYPE=@ANNALS_TYPE "

            Dim sqlCmd As New SqlCommand(sql, conn)
            sqlCmd.Prepare()

            sqlCmd.Parameters.AddWithValue("@ANNALS_TYPE", objAnnalsViewer.ANNALS_TYPE)
            sqlCmd.Parameters.AddWithValue("@ANNALS_SEQ_NO", objAnnalsViewer.ANNALS_SEQ_NO)
            sqlCmd.Parameters.AddWithValue("@ANNALS_YEAR", objAnnalsViewer.ANNALS_YEAR)
            sqlCmd.Parameters.AddWithValue("@EMP_ID", objAnnalsViewer.EMP_ID)

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
    Public Sub deleteAnnalsViewerByFullSeq(ByVal objAnnalsViewer As AnnalsViewer)
        deleteAnnalsViewerByFullSeq(objAnnalsViewer.ANNALS_TYPE, objAnnalsViewer.ANNALS_SEQ_NO, objAnnalsViewer.ANNALS_YEAR)
    End Sub

    Public Sub deleteAnnalsViewerByFullSeq(ByVal ANNALS_TYPE As String, ByVal ANNALS_SEQ_NO As String, ByVal ANNALS_YEAR As String)

        'declare connection
        Dim conn As SqlConnection = Nothing

        Try
            conn = ConnectionUtil.getSqlConnectionFromWebConfig()
            'Dim sql As String = "DELETE FROM ANNALS_VIEWER WHERE ANNALS_TYPE=@ANNALS_TYPE AND ANNALS_SEQ_NO=@ANNALS_SEQ_NO AND ANNALS_YEAR=@ANNALS_YEAR"

            Dim sqlCmd As New SqlCommand("Annals_Viewer_Delete", conn)
            'sqlCmd.Prepare()
            sqlCmd.CommandType = CommandType.StoredProcedure

            sqlCmd.Parameters.AddWithValue("@ANNALS_TYPE", ANNALS_TYPE)
            sqlCmd.Parameters.AddWithValue("@ANNALS_SEQ_NO", ANNALS_SEQ_NO)
            sqlCmd.Parameters.AddWithValue("@ANNALS_YEAR", ANNALS_YEAR)

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

    ''' <summary>
    ''' ใช้ในกรณีทำ transaction ที่ Class อื่น
    ''' </summary>
    ''' <param name="objAnnalsViewer"></param>
    ''' <remarks></remarks>
    Public Sub deleteAnnalsViewerWithEmpId(ByVal objAnnalsViewer As AnnalsViewer, ByVal sqlCmd As SqlCommand)
        deleteAnnalsViewerWithEmpId(objAnnalsViewer.ANNALS_TYPE, objAnnalsViewer.ANNALS_SEQ_NO, objAnnalsViewer.ANNALS_YEAR, objAnnalsViewer.EMP_ID, sqlCmd)
    End Sub

    ''' <summary>
    ''' ใช้ในกรณีทำ transaction ที่ Class อื่น
    ''' </summary>
    ''' <param name="ANNALS_TYPE"></param>
    ''' <param name="ANNALS_SEQ_NO"></param>
    ''' <param name="ANNALS_YEAR"></param>
    ''' <param name="EMP_ID"></param>
    ''' <remarks></remarks>
    Public Sub deleteAnnalsViewerWithEmpId(ByVal ANNALS_TYPE As String, ByVal ANNALS_SEQ_NO As String, ByVal ANNALS_YEAR As String, ByVal EMP_ID As String, ByVal sqlCmd As SqlCommand)

        sqlCmd.CommandText = "Annals_Viewer_Delete_With_EmpId"
        sqlCmd.CommandType = CommandType.StoredProcedure
        sqlCmd.Parameters.Clear()

        sqlCmd.Parameters.AddWithValue("@ANNALS_TYPE", ANNALS_TYPE)
        sqlCmd.Parameters.AddWithValue("@ANNALS_SEQ_NO", ANNALS_SEQ_NO)
        sqlCmd.Parameters.AddWithValue("@ANNALS_YEAR", ANNALS_YEAR)
        sqlCmd.Parameters.AddWithValue("@EMP_ID", EMP_ID)

        sqlCmd.ExecuteNonQuery()

    End Sub
#End Region

#Region "Add reciver&viewer"
    ''' <summary>
    ''' ใช้ insert ในกรณีทำ transaction ที่ Class อื่น
    ''' </summary>
    ''' <param name="viewer"></param>
    ''' <param name="reciverString"></param>
    ''' <param name="sqlCmd"></param>
    ''' <remarks></remarks>
    Public Sub addAnnalsReciver(ByVal viewer As AnnalsViewer, ByVal reciverString As String, ByVal sqlCmd As SqlCommand)

        sqlCmd.CommandText = "UPDATE ANNALS SET RECIVER=" _
                            + "(SELECT RECIVER + ',' + @RECIVER FROM ANNALS " _
                            + "WHERE ANNALS_TYPE=@ANNALS_TYPE " _
                            + "AND ANNALS_SEQ_NO=@ANNALS_SEQ_NO " _
                            + "AND ANNALS_YEAR=@ANNALS_YEAR) " _
                            + "WHERE ANNALS_TYPE=@ANNALS_TYPE " _
                            + "AND ANNALS_SEQ_NO=@ANNALS_SEQ_NO " _
                            + "AND ANNALS_YEAR=@ANNALS_YEAR "
        sqlCmd.CommandType = CommandType.Text
        sqlCmd.Parameters.Clear()

        sqlCmd.Parameters.AddWithValue("@ANNALS_TYPE", viewer.ANNALS_TYPE)
        sqlCmd.Parameters.AddWithValue("@ANNALS_SEQ_NO", viewer.ANNALS_SEQ_NO)
        sqlCmd.Parameters.AddWithValue("@ANNALS_YEAR", viewer.ANNALS_YEAR)
        sqlCmd.Parameters.AddWithValue("@RECIVER", reciverString)

        sqlCmd.ExecuteNonQuery()

    End Sub
#End Region

#Region "Binding"
    Public Function bindingAnnalsViewer(ByVal reader As SqlDataReader) As AnnalsViewer

        Dim objAnnalsViewer As New AnnalsViewer

        objAnnalsViewer.ANNALS_TYPE = CType(ConvertUtil.getObjectValue(reader("ANNALS_TYPE"), ConvertUtil.ObjectValueEnum.StringValue), String)
        objAnnalsViewer.ANNALS_SEQ_NO = CType(ConvertUtil.getObjectValue(reader("ANNALS_SEQ_NO"), ConvertUtil.ObjectValueEnum.StringValue), String)
        objAnnalsViewer.ANNALS_YEAR = CType(ConvertUtil.getObjectValue(reader("ANNALS_YEAR"), ConvertUtil.ObjectValueEnum.StringValue), String)
        objAnnalsViewer.EMP_ID = CType(ConvertUtil.getObjectValue(reader("EMP_ID"), ConvertUtil.ObjectValueEnum.StringValue), String)

        Return objAnnalsViewer

    End Function
#End Region

End Class
