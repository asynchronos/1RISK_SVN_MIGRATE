Option Explicit On
Option Strict On

Imports Microsoft.VisualBasic
Imports System.Data
Imports System.Data.SqlClient
Imports System.Diagnostics
Imports System.Collections.Generic

Public Class AnnalsCovenantDAL

    Private Shared className As String = "AnnalsCovenantDAL"

    Public Function getAnnalsCovenantByCIF(ByVal objAnnalsCovenant As AnnalsCovenant) As AnnalsCovenant

        'declare connection
        Dim conn As SqlConnection = Nothing
        'declare result
        Dim result As New AnnalsCovenant()

        Try
            conn = ConnectionUtil.getSqlConnectionFromWebConfig()
            Dim sql As String = "SELECT  TOP 1 " _
             & "IDEN, CIF, COVENANT_TYPE_ID, DETAIL, " _
             & "CREATE_DATE, DEADLINE_DATE, COVENANT_ACTION_ID, REMARK, " _
             & "ACTION_DATE, USER_ID, USER_UPDATE_DATE, ID ,COVENANT_DETAIL_ID " _
             & "FROM ANNALS_COVENANT " _
             & "WHERE CIF=@CIF" _
             & " ORDER BY IDEN DESC"

            Dim sqlCmd As New SqlCommand(sql, conn)
            sqlCmd.Prepare()

            sqlCmd.Parameters.AddWithValue("@CIF", objAnnalsCovenant.CIF)

            Dim reader As SqlDataReader = sqlCmd.ExecuteReader()

            While reader.Read()
                result = bindingAnnalsCovenant(reader)
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

    Public Function getAnnalsCovenantByIDEN(ByVal objAnnalsCovenant As AnnalsCovenant) As AnnalsCovenant

        'declare connection
        Dim conn As SqlConnection = Nothing
        'declare result
        Dim result As New AnnalsCovenant()

        Try
            conn = ConnectionUtil.getSqlConnectionFromWebConfig()
            Dim sql As String = "SELECT * " _
             & "FROM ANNALS_COVENANT " _
             & "WHERE IDEN=@IDEN " _
             & "ORDER BY IDEN"

            Dim sqlCmd As New SqlCommand(sql, conn)
            sqlCmd.Prepare()

            sqlCmd.Parameters.AddWithValue("@IDEN", objAnnalsCovenant.IDEN)

            Dim reader As SqlDataReader = sqlCmd.ExecuteReader()

            While reader.Read()
                result = bindingAnnalsCovenant(reader)
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

    Public Function getAnnalsCovenantByIDEN(ByVal IDEN As Integer) As AnnalsCovenant

        'declare connection
        Dim conn As SqlConnection = Nothing
        'declare result
        Dim result As New AnnalsCovenant()

        Try
            conn = ConnectionUtil.getSqlConnectionFromWebConfig()
            Dim sql As String = "SELECT " _
             & "IDEN, CIF, COVENANT_TYPE_ID, DETAIL, " _
             & "CREATE_DATE, DEADLINE_DATE, COVENANT_ACTION_ID, REMARK, " _
             & "ACTION_DATE, USER_ID, USER_UPDATE_DATE, ID,COVENANT_DETAIL_ID " _
             & "FROM ANNALS_COVENANT " _
             & "WHERE IDEN=@IDEN " _
             & "ORDER BY IDEN"

            Dim sqlCmd As New SqlCommand(sql, conn)
            sqlCmd.Prepare()

            sqlCmd.Parameters.AddWithValue("@IDEN", IDEN)

            Dim reader As SqlDataReader = sqlCmd.ExecuteReader()

            While reader.Read()
                result = bindingAnnalsCovenant(reader)
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

    Public Function getAllAnnalsCovenant() As List(Of AnnalsCovenant)

        'declare connection
        Dim conn As SqlConnection = Nothing
        'declare result
        Dim result As New List(Of AnnalsCovenant)

        Try
            conn = ConnectionUtil.getSqlConnectionFromWebConfig()
            Dim sql As String = "SELECT " _
             & "IDEN, CIF, COVENANT_TYPE_ID, DETAIL, " _
             & "CREATE_DATE, DEADLINE_DATE, COVENANT_ACTION_ID, REMARK, " _
             & "ACTION_DATE, USER_ID, USER_UPDATE_DATE, ID,COVENANT_DETAIL_ID " _
             & "FROM ANNALS_COVENANT " _
             & "ORDER BY IDEN"

            Dim sqlCmd As New SqlCommand(sql, conn)
            sqlCmd.Prepare()

            Dim reader As SqlDataReader = sqlCmd.ExecuteReader()

            While reader.Read()
                result.Add(bindingAnnalsCovenant(reader))
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

    Public Function getAllAnnalsCovenantBySQL(ByVal sql As String) As List(Of AnnalsCovenant)

        'declare connection
        Dim conn As SqlConnection = Nothing
        'declare result
        Dim result As New List(Of AnnalsCovenant)

        'Try
        conn = ConnectionUtil.getSqlConnectionFromWebConfig()
        Dim sqlCmd As New SqlCommand(sql, conn)
        sqlCmd.Prepare()

        Dim reader As SqlDataReader = sqlCmd.ExecuteReader()

        While reader.Read()
            result.Add(bindingAnnalsCovenant(reader))
        End While

        reader.Close()
        conn.Close()
        'Catch ex As Exception
        '          Throw New Exception(ex.Message & " : " & ex.StackTrace)
        '      Finally
        If (conn.State = ConnectionState.Open) Then
            conn.Close()
        End If
        conn = Nothing
        'End Try

        Return result

    End Function

    Public Sub insertAnnalsCovenant(ByVal objAnnalsCovenant As AnnalsCovenant)

        'declare connection
        Dim conn As SqlConnection = Nothing

        Try
            conn = ConnectionUtil.getSqlConnectionFromWebConfig()
            Dim sql As String = "ANNALS_COVENANT_INSERT "
            Dim sqlCmd As New SqlCommand(sql, conn)
            sqlCmd.CommandType = CommandType.StoredProcedure
            sqlCmd.Prepare()

            sqlCmd.Parameters.AddWithValue("@IDEN", objAnnalsCovenant.IDEN)
            sqlCmd.Parameters.AddWithValue("@CIF", objAnnalsCovenant.CIF)
            sqlCmd.Parameters.AddWithValue("@COVENANT_TYPE_ID", objAnnalsCovenant.COVENANT_TYPE_ID)
            sqlCmd.Parameters.AddWithValue("@DETAIL", objAnnalsCovenant.DETAIL)
            sqlCmd.Parameters.AddWithValue("@CREATE_DATE", objAnnalsCovenant.CREATE_DATE)
            If objAnnalsCovenant.DEADLINE_DATE = "" Then
                sqlCmd.Parameters.AddWithValue("@DEADLINE_DATE", System.DBNull.Value)
            Else
                sqlCmd.Parameters.AddWithValue("@DEADLINE_DATE", CDate(objAnnalsCovenant.DEADLINE_DATE))
            End If
            sqlCmd.Parameters.AddWithValue("@COVENANT_ACTION_ID", objAnnalsCovenant.COVENANT_ACTION_ID)
            sqlCmd.Parameters.AddWithValue("@REMARK", objAnnalsCovenant.REMARK)
            If objAnnalsCovenant.ACTION_DATE = "" Then
                sqlCmd.Parameters.AddWithValue("@ACTION_DATE", System.DBNull.Value)
            Else
                sqlCmd.Parameters.AddWithValue("@ACTION_DATE", CDate(objAnnalsCovenant.ACTION_DATE))
            End If
            sqlCmd.Parameters.AddWithValue("@NEXT_COVENANT_ACTION_ID", objAnnalsCovenant.NEXT_COVENANT_ACTION_ID)
            If objAnnalsCovenant.NEXT_ACTION_DATE = "" Then
                sqlCmd.Parameters.AddWithValue("@NEXT_ACTION_DATE", System.DBNull.Value)
            Else
                sqlCmd.Parameters.AddWithValue("@NEXT_ACTION_DATE", CDate(objAnnalsCovenant.NEXT_ACTION_DATE))
            End If
            If objAnnalsCovenant.BREACH_DATE = "" Then
                sqlCmd.Parameters.AddWithValue("@BREACH_DATE", System.DBNull.Value)
            Else
                sqlCmd.Parameters.AddWithValue("@BREACH_DATE", CDate(objAnnalsCovenant.BREACH_DATE))
            End If
            If objAnnalsCovenant.WAVE_FLAG = "" Then
                sqlCmd.Parameters.AddWithValue("@WAVE_FLAG", System.DBNull.Value)
            Else
                sqlCmd.Parameters.AddWithValue("@WAVE_FLAG", CInt(objAnnalsCovenant.WAVE_FLAG))
            End If
            If objAnnalsCovenant.WAVE_DATE = "" Then
                sqlCmd.Parameters.AddWithValue("@WAVE_DATE", System.DBNull.Value)
            Else
                sqlCmd.Parameters.AddWithValue("@WAVE_DATE", CDate(objAnnalsCovenant.WAVE_DATE))
            End If


            sqlCmd.Parameters.AddWithValue("@USER_ID", objAnnalsCovenant.USER_ID)
            sqlCmd.Parameters.AddWithValue("@USER_UPDATE_DATE", objAnnalsCovenant.USER_UPDATE_DATE)
            sqlCmd.Parameters.AddWithValue("@ID", objAnnalsCovenant.ID)
            sqlCmd.Parameters.AddWithValue("@COVENANT_DETAIL_ID", objAnnalsCovenant.COVENANT_DETAIL_ID)



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

    Public Sub updateAnnalsCovenant(ByVal objAnnalsCovenant As AnnalsCovenant)

        'declare connection
        Dim conn As SqlConnection = Nothing

        'Try
        conn = ConnectionUtil.getSqlConnectionFromWebConfig()
        Dim sql As String = "ANNALS_COVENANT_UPDATE"
        Dim sqlCmd As New SqlCommand(sql, conn)
        sqlCmd.CommandType = CommandType.StoredProcedure

        sqlCmd.Prepare()

        sqlCmd.Parameters.AddWithValue("@IDEN", objAnnalsCovenant.IDEN)
        sqlCmd.Parameters.AddWithValue("@CIF", objAnnalsCovenant.CIF)
        sqlCmd.Parameters.AddWithValue("@COVENANT_TYPE_ID", objAnnalsCovenant.COVENANT_TYPE_ID)
        sqlCmd.Parameters.AddWithValue("@DETAIL", objAnnalsCovenant.DETAIL)
        sqlCmd.Parameters.AddWithValue("@CREATE_DATE", objAnnalsCovenant.CREATE_DATE)
        If objAnnalsCovenant.DEADLINE_DATE = "" Then
            sqlCmd.Parameters.AddWithValue("@DEADLINE_DATE", System.DBNull.Value)
        Else
            sqlCmd.Parameters.AddWithValue("@DEADLINE_DATE", CDate(objAnnalsCovenant.DEADLINE_DATE))
        End If
        sqlCmd.Parameters.AddWithValue("@COVENANT_ACTION_ID", objAnnalsCovenant.COVENANT_ACTION_ID)
        sqlCmd.Parameters.AddWithValue("@REMARK", objAnnalsCovenant.REMARK)
        If objAnnalsCovenant.ACTION_DATE = "" Then
            sqlCmd.Parameters.AddWithValue("@ACTION_DATE", System.DBNull.Value)
        Else
            sqlCmd.Parameters.AddWithValue("@ACTION_DATE", CDate(objAnnalsCovenant.ACTION_DATE))
        End If

        sqlCmd.Parameters.AddWithValue("@NEXT_COVENANT_ACTION_ID", objAnnalsCovenant.NEXT_COVENANT_ACTION_ID)
        If objAnnalsCovenant.NEXT_ACTION_DATE = "" Then
            sqlCmd.Parameters.AddWithValue("@NEXT_ACTION_DATE", System.DBNull.Value)
        Else
            sqlCmd.Parameters.AddWithValue("@NEXT_ACTION_DATE", CDate(objAnnalsCovenant.NEXT_ACTION_DATE))
        End If
        If objAnnalsCovenant.BREACH_DATE = "" Then
            sqlCmd.Parameters.AddWithValue("@BREACH_DATE", System.DBNull.Value)
        Else
            sqlCmd.Parameters.AddWithValue("@BREACH_DATE", CDate(objAnnalsCovenant.BREACH_DATE))
        End If
        If objAnnalsCovenant.WAVE_FLAG = "" Then
            sqlCmd.Parameters.AddWithValue("@WAVE_FLAG", System.DBNull.Value)
        Else
            sqlCmd.Parameters.AddWithValue("@WAVE_FLAG", CInt(objAnnalsCovenant.WAVE_FLAG))
        End If
        If objAnnalsCovenant.WAVE_DATE = "" Then
            sqlCmd.Parameters.AddWithValue("@WAVE_DATE", System.DBNull.Value)
        Else
            sqlCmd.Parameters.AddWithValue("@WAVE_DATE", CDate(objAnnalsCovenant.WAVE_DATE))
        End If
        sqlCmd.Parameters.AddWithValue("@USER_ID", objAnnalsCovenant.USER_ID)
        sqlCmd.Parameters.AddWithValue("@USER_UPDATE_DATE", objAnnalsCovenant.USER_UPDATE_DATE)
        sqlCmd.Parameters.AddWithValue("@ID", objAnnalsCovenant.ID)
        sqlCmd.Parameters.AddWithValue("@COVENANT_DETAIL_ID", objAnnalsCovenant.COVENANT_DETAIL_ID)


        sqlCmd.ExecuteNonQuery()


        'Catch ex As Exception
        '	Throw New Exception(ex.Message & " : " & ex.StackTrace)
        'Finally
        If (conn.State = ConnectionState.Open) Then
            conn.Close()
        End If
        conn = Nothing
        'End Try

    End Sub

    Public Sub deleteAnnalsCovenant(ByVal objAnnalsCovenant As AnnalsCovenant)

        'declare connection
        Dim conn As SqlConnection = Nothing

        Try
            conn = ConnectionUtil.getSqlConnectionFromWebConfig()
            Dim sql As String = "ANNALS_COVENANT_DELETE"
            Dim sqlCmd As New SqlCommand(sql, conn)
            sqlCmd.CommandType = CommandType.StoredProcedure
            sqlCmd.Prepare()

            sqlCmd.Parameters.AddWithValue("@IDEN", objAnnalsCovenant.IDEN)

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

    Public Sub deleteAnnalsCovenantByID(ByVal Annals_ID As String)

        'declare connection
        Dim conn As SqlConnection = Nothing

        Try
            conn = ConnectionUtil.getSqlConnectionFromWebConfig()
            Dim sql As String = "Delete  from  ANNALS_COVENANT  WHERE  ID=@ID"
            Dim sqlCmd As New SqlCommand(sql, conn)
            sqlCmd.CommandType = CommandType.Text
            sqlCmd.Prepare()

            sqlCmd.Parameters.AddWithValue("@ID", Annals_ID)

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

    Public Sub deleteAnnalsCovenant(ByVal IDEN As Integer, ByVal ID As String)

        'declare connection
        Dim conn As SqlConnection = Nothing

        Try
            conn = ConnectionUtil.getSqlConnectionFromWebConfig()
            Dim sql As String = "ANNALS_COVENANT_DELETE"
            Dim sqlCmd As New SqlCommand(sql, conn)
            sqlCmd.CommandType = CommandType.StoredProcedure
            sqlCmd.Prepare()

            sqlCmd.Parameters.AddWithValue("@IDEN", IDEN)
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

    Public Function bindingAnnalsCovenant(ByVal reader As SqlDataReader) As AnnalsCovenant

        Dim objAnnalsCovenant As New AnnalsCovenant

        objAnnalsCovenant.IDEN = CType(ConvertUtil.getObjectValue(reader("IDEN"), ConvertUtil.ObjectValueEnum.NumbericValue), Integer)
        objAnnalsCovenant.CIF = CType(ConvertUtil.getObjectValue(reader("CIF"), ConvertUtil.ObjectValueEnum.NumbericValue), Integer)
        objAnnalsCovenant.COVENANT_TYPE_ID = CType(ConvertUtil.getObjectValue(reader("COVENANT_TYPE_ID"), ConvertUtil.ObjectValueEnum.StringValue), String)
        objAnnalsCovenant.DETAIL = CType(ConvertUtil.getObjectValue(reader("DETAIL"), ConvertUtil.ObjectValueEnum.StringValue), String)
        objAnnalsCovenant.CREATE_DATE = CType(ConvertUtil.getObjectValue(reader("CREATE_DATE"), ConvertUtil.ObjectValueEnum.DateValue), Date)
        objAnnalsCovenant.DEADLINE_DATE = CType(ConvertUtil.getObjectValue(reader("DEADLINE_DATE"), ConvertUtil.ObjectValueEnum.DateValue), String)
        objAnnalsCovenant.COVENANT_ACTION_ID = CType(ConvertUtil.getObjectValue(reader("COVENANT_ACTION_ID"), ConvertUtil.ObjectValueEnum.StringValue), String)
        objAnnalsCovenant.REMARK = CType(ConvertUtil.getObjectValue(reader("REMARK"), ConvertUtil.ObjectValueEnum.StringValue), String)
        objAnnalsCovenant.ACTION_DATE = CType(ConvertUtil.getObjectValue(reader("ACTION_DATE"), ConvertUtil.ObjectValueEnum.DateValue), String)
        objAnnalsCovenant.USER_ID = CType(ConvertUtil.getObjectValue(reader("USER_ID"), ConvertUtil.ObjectValueEnum.StringValue), String)
        objAnnalsCovenant.USER_UPDATE_DATE = CType(ConvertUtil.getObjectValue(reader("USER_UPDATE_DATE"), ConvertUtil.ObjectValueEnum.DateValue), Date)
        objAnnalsCovenant.ID = CType(ConvertUtil.getObjectValue(reader("ID"), ConvertUtil.ObjectValueEnum.StringValue), String)
        objAnnalsCovenant.COVENANT_DETAIL_ID = CType(ConvertUtil.getObjectValue(reader("COVENANT_DETAIL_ID"), ConvertUtil.ObjectValueEnum.StringValue), String)
        objAnnalsCovenant.NEXT_ACTION_DATE = CType(ConvertUtil.getObjectValue(reader("NEXT_ACTION_DATE"), ConvertUtil.ObjectValueEnum.DateValue), String)
        objAnnalsCovenant.NEXT_COVENANT_ACTION_ID = CType(ConvertUtil.getObjectValue(reader("NEXT_COVENANT_ACTION_ID"), ConvertUtil.ObjectValueEnum.StringValue), String)
        objAnnalsCovenant.BREACH_DATE = CType(ConvertUtil.getObjectValue(reader("BREACH_DATE"), ConvertUtil.ObjectValueEnum.DateValue), String)
        objAnnalsCovenant.WAVE_FLAG = CType(ConvertUtil.getObjectValue(reader("WAVE_FLAG"), ConvertUtil.ObjectValueEnum.StringValue), String)
        objAnnalsCovenant.WAVE_DATE = CType(ConvertUtil.getObjectValue(reader("WAVE_DATE"), ConvertUtil.ObjectValueEnum.DateValue), String)


        Return objAnnalsCovenant

    End Function

End Class
