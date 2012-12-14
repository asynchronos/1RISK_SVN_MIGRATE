Option Explicit On
Option Strict On

Imports Microsoft.VisualBasic
Imports System.Data
Imports System.Data.SqlClient
Imports System.Diagnostics
Imports System.Collections.Generic

Public Class AnnalsDAL

    Private Shared className As String = "AnnalsDAL"

#Region "GetByPK"
    Public Function getAnnalsByPK(ByVal objAnnals As Annals) As Annals
        Return getAnnalsByPK(objAnnals.ANNALS_TYPE, objAnnals.ANNALS_SEQ_NO, objAnnals.ANNALS_YEAR)
    End Function

    Public Function getAnnalsByPK(ByVal ANNALS_TYPE As String, ByVal ANNALS_SEQ_NO As String, ByVal ANNALS_YEAR As String) As Annals

        'declare connection
        Dim conn As SqlConnection = Nothing
        'declare result
        Dim result As Annals = Nothing

        Try
            conn = ConnectionUtil.getSqlConnectionFromWebConfig()
            Dim sql As String = "SELECT " _
             & "ANNALS_TYPE, ANNALS_SEQ_NO, ANNALS_YEAR, SENDER, " _
             & "RECIVER, REFERENCE, HEADER, DETAIL, " _
             & "DATE_IN_ANNALS, ANNALS_CREATE_DATE, ANNALS_UPDATE_DATE " _
             & "FROM ANNALS " _
             & "WHERE ANNALS_TYPE=@ANNALS_TYPE " _
             & "AND ANNALS_SEQ_NO=@ANNALS_SEQ_NO " _
             & "AND ANNALS_YEAR=@ANNALS_YEAR "

            Dim sqlCmd As New SqlCommand(sql, conn)
            sqlCmd.Prepare()

            sqlCmd.Parameters.AddWithValue("@ANNALS_TYPE", ANNALS_TYPE)
            sqlCmd.Parameters.AddWithValue("@ANNALS_SEQ_NO", ANNALS_SEQ_NO)
            sqlCmd.Parameters.AddWithValue("@ANNALS_YEAR", ANNALS_YEAR)

            Dim reader As SqlDataReader = sqlCmd.ExecuteReader()

            While reader.Read()
                result = bindingAnnals(reader)
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
    Public Function getAllAnnals() As List(Of Annals)

        'declare connection
        Dim conn As SqlConnection = Nothing
        'declare result
        Dim result As New List(Of Annals)

        Try
            conn = ConnectionUtil.getSqlConnectionFromWebConfig()
            Dim sql As String = "SELECT " _
             & "ANNALS_TYPE, ANNALS_SEQ_NO, ANNALS_YEAR, SENDER, " _
             & "RECIVER, REFERENCE, HEADER, DETAIL, " _
             & "DATE_IN_ANNALS, ANNALS_CREATE_DATE, ANNALS_UPDATE_DATE " _
             & "FROM ANNALS " _
             & "ORDER BY ANNALS_TYPE"

            Dim sqlCmd As New SqlCommand(sql, conn)
            sqlCmd.Prepare()

            Dim reader As SqlDataReader = sqlCmd.ExecuteReader()

            While reader.Read()
                result.Add(bindingAnnals(reader))
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

    Public Sub insertAnnals(ByVal objAnnals As Annals)

        'declare connection
        Dim conn As SqlConnection = Nothing
        Dim sqlCmd As SqlCommand = Nothing

        Try
            conn = ConnectionUtil.getSqlConnectionFromWebConfig()

            sqlCmd = New SqlCommand()
            sqlCmd.Connection = conn
            sqlCmd.Transaction = sqlCmd.Connection.BeginTransaction()

            insertAnnals(objAnnals, sqlCmd)

            sqlCmd.Transaction.Commit()
        Catch ex As Exception
            sqlCmd.Transaction.Rollback()
            Throw New Exception(ex.Message & " : " & ex.StackTrace)
        Finally
            If (conn.State = ConnectionState.Open) Then
                conn.Close()
            End If
            conn = Nothing
        End Try

    End Sub

    ''' <summary>
    ''' ใช้ในกรณีทำ Transection ที่อื่น(ประกาศ Begin Tran ที่อื่น)
    ''' ทำการ insert หนังสือลง Annals
    ''' และทำการ insert คนมองเห็นหนังสือลง AnnalsViewer
    ''' </summary>
    ''' <param name="objAnnals"></param>
    ''' <param name="sqlCmd"></param>
    ''' <remarks></remarks>
    Public Sub insertAnnals(ByVal objAnnals As Annals, ByVal sqlCmd As SqlCommand)

        sqlCmd.CommandText = "Annals_Insert"
        sqlCmd.CommandType = CommandType.StoredProcedure
        sqlCmd.Parameters.Clear()

        sqlCmd.Parameters.AddWithValue("@ANNALS_TYPE", objAnnals.ANNALS_TYPE)
        sqlCmd.Parameters.AddWithValue("@SENDER", objAnnals.SENDER)
        sqlCmd.Parameters.AddWithValue("@RECIVER", objAnnals.RECIVER)
        sqlCmd.Parameters.AddWithValue("@REFERENCE", objAnnals.REFERENCE)
        sqlCmd.Parameters.AddWithValue("@HEADER", objAnnals.HEADER)
        sqlCmd.Parameters.AddWithValue("@DETAIL", objAnnals.DETAIL)
        sqlCmd.Parameters.AddWithValue("@DEPART_REFER", objAnnals.DEPART_REFER)
        sqlCmd.Parameters.AddWithValue("@DATE_IN_ANNALS", objAnnals.DATE_IN_ANNALS)

        'output parameter
        Dim ANNALS_SEQ_NO_OUT As New SqlParameter("@ANNALS_SEQ_NO_OUT", SqlDbType.NVarChar, 5)
        ANNALS_SEQ_NO_OUT.Direction = ParameterDirection.Output
        sqlCmd.Parameters.Add(ANNALS_SEQ_NO_OUT)

        'output parameter
        Dim ANNALS_YEAR_OUT As New SqlParameter("@ANNALS_YEAR_OUT", SqlDbType.NVarChar, 4)
        ANNALS_YEAR_OUT.Direction = ParameterDirection.Output
        sqlCmd.Parameters.Add(ANNALS_YEAR_OUT)

        sqlCmd.ExecuteNonQuery()

        'รับค่า output จาก database
        objAnnals.ANNALS_SEQ_NO = CType(sqlCmd.Parameters("@ANNALS_SEQ_NO_OUT").Value, String)
        objAnnals.ANNALS_YEAR = CType(sqlCmd.Parameters("@ANNALS_YEAR_OUT").Value, String)

        'ถ้า sender หรือ recieve มีค่าจะทำการนำไป insert ลง table AnnalsViewer
        If (objAnnals.SENDER.Trim.Length > 0) Or (objAnnals.RECIVER.Trim.Length > 0) Then
            'insert  annals viewer 
            Dim bo As New AnnalsViewerBO
            bo.InsertAnnalsViewerAfterInsertAnnals(objAnnals.ANNALS_TYPE, objAnnals.ANNALS_SEQ_NO, objAnnals.ANNALS_YEAR, objAnnals.SENDER, objAnnals.RECIVER, sqlCmd)
        End If
        
    End Sub

    Public Sub insertAnnalsCreditOut(ByVal objAnnalsOut As Annals, ByVal annalsCreditID As String)

        'declare connection
        Dim conn As SqlConnection = Nothing
        Dim sqlCmd As SqlCommand = Nothing

        Try
            conn = ConnectionUtil.getSqlConnectionFromWebConfig()

            sqlCmd = New SqlCommand()
            sqlCmd.Connection = conn
            sqlCmd.Transaction = sqlCmd.Connection.BeginTransaction()

            insertAnnalsCreditOut(objAnnalsOut, annalsCreditID, sqlCmd)

            sqlCmd.Transaction.Commit()
        Catch ex As Exception
            sqlCmd.Transaction.Rollback()
            Throw New Exception(ex.Message & " : " & ex.StackTrace)
        Finally
            If (conn.State = ConnectionState.Open) Then
                conn.Close()
            End If
            conn = Nothing
        End Try

    End Sub

    ''' <summary>
    ''' ใช้ในกรณีทำ Transection ที่อื่น(ประกาศ Begin Tran ที่อื่น)
    ''' ทำการ insert หนังสือลง Annals
    ''' ทำการ insert คนมองเห็นหนังสือลง AnnalsViewer
    ''' และทำการ update เลขที่หนังสือออกในหนังสือสินเชื่อ
    ''' </summary>
    ''' <param name="objAnnalsOut"></param>
    ''' <param name="annalsCreditID"></param>
    ''' <param name="sqlCmd"></param>
    ''' <remarks></remarks>
    Public Sub insertAnnalsCreditOut(ByVal objAnnalsOut As Annals, ByVal annalsCreditID As String, ByVal sqlCmd As SqlCommand)

        insertAnnals(objAnnalsOut, sqlCmd)

        'อัพเดตเลขที่หนังสือออก
        sqlCmd.CommandText = "UPDATE ANNALS_CREDIT SET ID_OUT = @ID_OUT WHERE ID = @ID"
        sqlCmd.CommandType = CommandType.Text
        sqlCmd.Parameters.Clear()

        sqlCmd.Parameters.AddWithValue("@ID_OUT", objAnnalsOut.ANNALS_TYPE + objAnnalsOut.ANNALS_SEQ_NO + "/" + (CInt(objAnnalsOut.ANNALS_YEAR) + 543).ToString)
        sqlCmd.Parameters.AddWithValue("@ID", annalsCreditID)

        sqlCmd.ExecuteNonQuery()

    End Sub

#End Region

#Region "Update"
    Public Sub updateAnnals(ByVal objAnnals As Annals)

        'declare connection
        Dim conn As SqlConnection = Nothing
        Dim sqlCmd As SqlCommand = Nothing

        Try
            conn = ConnectionUtil.getSqlConnectionFromWebConfig()

            sqlCmd = New SqlCommand()
            sqlCmd.Connection = conn
            sqlCmd.Transaction = sqlCmd.Connection.BeginTransaction()

            updateAnnals(objAnnals, sqlCmd)

            sqlCmd.Transaction.Commit()
        Catch ex As Exception
            sqlCmd.Transaction.Rollback()
            Throw New Exception(ex.Message & " : " & ex.StackTrace)
        Finally
            If (conn.State = ConnectionState.Open) Then
                conn.Close()
            End If
            conn = Nothing
        End Try

    End Sub

    Public Sub updateAnnals(ByVal objAnnals As Annals, ByVal sqlCmd As SqlCommand)

        sqlCmd.CommandText = "UPDATE ANNALS  SET " _
                         & "  SENDER=@SENDER, " _
                         & "  RECIVER=@RECIVER, " _
                         & "  REFERENCE=@REFERENCE, " _
                         & "  HEADER=@HEADER, " _
                         & "  DETAIL=@DETAIL, " _
                         & "  DATE_IN_ANNALS=@DATE_IN_ANNALS, " _
                         & "  ANNALS_UPDATE_DATE=getdate() " _
                         & "  WHERE ANNALS_TYPE=@ANNALS_TYPE" _
                         & " AND ANNALS_SEQ_NO=@ANNALS_SEQ_NO" _
                         & " AND ANNALS_YEAR=@ANNALS_YEAR "
        sqlCmd.CommandType = CommandType.Text
        sqlCmd.Parameters.Clear()

        sqlCmd.Parameters.AddWithValue("@ANNALS_TYPE", objAnnals.ANNALS_TYPE)
        sqlCmd.Parameters.AddWithValue("@ANNALS_SEQ_NO", objAnnals.ANNALS_SEQ_NO)
        sqlCmd.Parameters.AddWithValue("@ANNALS_YEAR", objAnnals.ANNALS_YEAR)
        sqlCmd.Parameters.AddWithValue("@SENDER", objAnnals.SENDER)
        sqlCmd.Parameters.AddWithValue("@RECIVER", objAnnals.RECIVER)
        sqlCmd.Parameters.AddWithValue("@REFERENCE", objAnnals.REFERENCE)
        sqlCmd.Parameters.AddWithValue("@HEADER", objAnnals.HEADER)
        sqlCmd.Parameters.AddWithValue("@DETAIL", objAnnals.DETAIL)
        sqlCmd.Parameters.AddWithValue("@DATE_IN_ANNALS", objAnnals.DATE_IN_ANNALS)

        sqlCmd.ExecuteNonQuery()

        'ถ้า sender หรือ recieve มีค่าจะทำการนำไป insert ลง table AnnalsViewer
        If (objAnnals.SENDER.Trim.Length > 0) Or (objAnnals.RECIVER.Trim.Length > 0) Then
            'insert  annals viewer 
            Dim bo As New AnnalsViewerBO
            bo.InsertAnnalsViewerAfterInsertAnnals(objAnnals.ANNALS_TYPE, objAnnals.ANNALS_SEQ_NO, objAnnals.ANNALS_YEAR, objAnnals.SENDER, objAnnals.RECIVER, sqlCmd)
        End If

    End Sub


#End Region

#Region "Delete"
    Public Sub deleteAnnals(ByVal objAnnals As Annals)
        deleteAnnals(objAnnals.ANNALS_TYPE)
    End Sub

    Public Sub deleteAnnals(ByVal ANNALS_TYPE As String)

        'declare connection
        Dim conn As SqlConnection = Nothing

        Try
            conn = ConnectionUtil.getSqlConnectionFromWebConfig()
            Dim sql As String = "DELETE FROM ANNALS WHERE ANNALS_TYPE=@ANNALS_TYPE"

            Dim sqlCmd As New SqlCommand(sql, conn)
            sqlCmd.Prepare()

            sqlCmd.Parameters.AddWithValue("@ANNALS_TYPE", ANNALS_TYPE)

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
    Public Function bindingAnnals(ByVal reader As SqlDataReader) As Annals

        Dim objAnnals As New Annals

        objAnnals.ANNALS_TYPE = CType(ConvertUtil.getObjectValue(reader("ANNALS_TYPE"), ConvertUtil.ObjectValueEnum.StringValue), String)
        objAnnals.ANNALS_SEQ_NO = CType(ConvertUtil.getObjectValue(reader("ANNALS_SEQ_NO"), ConvertUtil.ObjectValueEnum.StringValue), String)
        objAnnals.ANNALS_YEAR = CType(ConvertUtil.getObjectValue(reader("ANNALS_YEAR"), ConvertUtil.ObjectValueEnum.StringValue), String)
        objAnnals.SENDER = CType(ConvertUtil.getObjectValue(reader("SENDER"), ConvertUtil.ObjectValueEnum.StringValue), String)
        objAnnals.RECIVER = CType(ConvertUtil.getObjectValue(reader("RECIVER"), ConvertUtil.ObjectValueEnum.StringValue), String)
        objAnnals.REFERENCE = CType(ConvertUtil.getObjectValue(reader("REFERENCE"), ConvertUtil.ObjectValueEnum.StringValue), String)
        objAnnals.HEADER = CType(ConvertUtil.getObjectValue(reader("HEADER"), ConvertUtil.ObjectValueEnum.StringValue), String)
        objAnnals.DETAIL = CType(ConvertUtil.getObjectValue(reader("DETAIL"), ConvertUtil.ObjectValueEnum.StringValue), String)
        objAnnals.DATE_IN_ANNALS = CType(ConvertUtil.getObjectValue(reader("DATE_IN_ANNALS"), ConvertUtil.ObjectValueEnum.DateValue), Date)
        objAnnals.ANNALS_CREATE_DATE = CType(ConvertUtil.getObjectValue(reader("ANNALS_CREATE_DATE"), ConvertUtil.ObjectValueEnum.DateValue), Date)
        objAnnals.ANNALS_UPDATE_DATE = CType(ConvertUtil.getObjectValue(reader("ANNALS_UPDATE_DATE"), ConvertUtil.ObjectValueEnum.DateValue), Date)

        Return objAnnals

    End Function
#End Region

#Region "Check Reference"
    Public Function getIdByReference(ByVal reference As String) As String

        'declare connection
        Dim conn As SqlConnection = Nothing
        'declare result
        Dim result As String = Nothing

        Try
            conn = ConnectionUtil.getSqlConnectionFromWebConfig()
            Dim sql As String = "SELECT ANNALS_TYPE + ANNALS_SEQ_NO + ANNALS_YEAR AS ID " _
             & "FROM ANNALS " _
             & "WHERE REFERENCE=@REFERENCE AND ANNALS_TYPE='1'" 'เช็คเฉพาะหนังสือเข้า

            Dim sqlCmd As New SqlCommand(sql, conn)
            sqlCmd.Prepare()

            sqlCmd.Parameters.AddWithValue("@REFERENCE", reference)

            Dim reader As SqlDataReader = sqlCmd.ExecuteReader()


            While reader.Read()
                result = CType(ConvertUtil.getObjectValue(reader("ID"), ConvertUtil.ObjectValueEnum.StringValue), String)
            End While

            If IsNothing(result) Then
                result = String.Empty
            End If

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
    Public Function getAnnalsProcessByReference(ByVal reference As String) As ArrayList

        'declare connection
        Dim conn As SqlConnection = Nothing
        'declare result
        Dim arrayID As New ArrayList


        Try
            conn = ConnectionUtil.getSqlConnectionFromWebConfig()
            Dim sql As String = "ANNALS_CREDIT_CHECK_REFERENCE"

            Dim sqlCmd As New SqlCommand(sql, conn)
            sqlCmd.CommandType = CommandType.StoredProcedure
            sqlCmd.Prepare()

            sqlCmd.Parameters.AddWithValue("@REFERENCE", reference)

            Dim reader As SqlDataReader = sqlCmd.ExecuteReader()
            While reader.Read()
                'MsgBox(CType(ConvertUtil.getObjectValue(reader("ID"), ConvertUtil.ObjectValueEnum.StringValue), String))
                arrayID.Add(CType(ConvertUtil.getObjectValue(reader("ID"), ConvertUtil.ObjectValueEnum.StringValue), String))
                arrayID.Add(CType(ConvertUtil.getObjectValue(reader("PROCESS_GROUP"), ConvertUtil.ObjectValueEnum.StringValue), String))
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

        Return arrayID

    End Function
#End Region

End Class