

Imports System.Collections.Generic
Imports System.Data
Imports System.Data.SqlClient

Public Class ClsLog

    Public Function InsertLog(ByVal LogType As Integer, ByVal IP As String, ByVal Username As String, Optional ByVal ID As String = "") As Integer
        '  รายละเอียด LogType เก็บในตาราง TB_LOG_TYPE 
        '  1=login,2=logout,3=create ca,4=update ca
        '  ถ้ามี ID ที่อัพเดทส่งมาด้วย
        Dim sqlConn As SqlConnection = Nothing
        Try
            Dim sqlCmd As SqlCommand


            sqlConn = ConnectionUtil.getSqlConnectionFromWebConfig()
            sqlCmd = New SqlCommand("INSERTLOG", sqlConn)
            sqlCmd.CommandType = CommandType.StoredProcedure

            If IsNothing(Username) Then
                Username = "999999"
            End If

            With sqlCmd

                .Parameters.Add("@IP", SqlDbType.NVarChar, 20).Value = IP
                .Parameters.Add("@USERNAME", SqlDbType.NVarChar, 20).Value = Username
                .Parameters.Add("@LOG_TYPE_ID", SqlDbType.Int).Value = LogType
                .Parameters.Add("@ID", SqlDbType.NVarChar, 20).Value = ID

            End With
            sqlCmd.ExecuteNonQuery()

            Return 0

        Catch ex As Exception
            Throw New Exception("ClsLog - " & ex.Message & " : " & ex.StackTrace)
        Finally
            Try
                sqlConn.Close()
            Catch ex As Exception

            End Try
            sqlConn = Nothing
        End Try


    End Function
End Class
