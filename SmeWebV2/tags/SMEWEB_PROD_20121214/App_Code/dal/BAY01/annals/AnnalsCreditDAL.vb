Option Explicit On
Option Strict On

Imports Microsoft.VisualBasic
Imports System.Data
Imports System.Data.SqlClient
Imports System.Diagnostics
Imports System.Collections.Generic
Imports System.Globalization

Public Class AnnalsCreditDAL

    Private Shared className As String = "AnnalsCreditDAL"

    Public Function getAnnalsCreditByID(ByVal objAnnalsCredit As AnnalsCredit) As AnnalsCredit

        'declare connection
        Dim conn As SqlConnection = Nothing
        'declare result
        Dim result As New AnnalsCredit()

        Try
            conn = ConnectionUtil.getSqlConnectionFromWebConfig()
            Dim sql As String = "SELECT " _
             & "ID, ANNALS_TYPE, ANNALS_SEQ_NO, ANNALS_YEAR, " _
             & "ID_OUT, EMP_APPROVE_ID, EMP_REQUEST_ID, EMP_APPROVE2_ID,EMP_APPROVE3_ID,EMP_APPROVE4_ID, " _
             & "Send_To_Board, BOARD_ID, RM_ID, BRANCH_ID, " _
             & "Flag,DEP_ID, REGION_ID, Others, Others2, " _
             & " Result,Comment,CM_Judgement,CM_Judgement_Board,CM_Remark,Reason,Reason2,Job_Type_Id,SME_Referral_No,Customer_Size,COVENANT_FLAG,DO_KFS_FLAG" _
             & ",SUB_COMMITTEE_1,SUB_COMMITTEE_2,SUB_COMMITTEE_3  " _
             & ",APPROVE_CUS_TYPE,APPROVE_INC_TYPE ,OUT_OF_SCOPE_ID ,GROUP_EXPOSURE,REVIEW_DATE,EMP_CONTROL " _
             & ",IS_FLOOD " _
             & " FROM ANNALS_CREDIT " _
             & " WHERE ID=@ID " _
             & " ORDER BY ID"

            Dim sqlCmd As New SqlCommand(sql, conn)
            sqlCmd.Prepare()

            sqlCmd.Parameters.AddWithValue("@ID", objAnnalsCredit.ID)

            Dim reader As SqlDataReader = sqlCmd.ExecuteReader()

            While reader.Read()
                result = bindingAnnalsCredit(reader)
            End While

            reader.close()
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

    'Public Function getAnnalsCreditByID(ByVal ID As String) As AnnalsCredit

    '    'declare connection
    '    Dim conn As SqlConnection = Nothing
    '    'declare result
    '    Dim result As New AnnalsCredit()

    '    Try
    '        conn = ConnectionUtil.getSqlConnectionFromWebConfig()
    '        Dim sql As String = "SELECT " _
    '         & "ID, ANNALS_TYPE, ANNALS_SEQ_NO, ANNALS_YEAR, " _
    '          & "ID_OUT, EMP_APPROVE_ID, EMP_REQUEST_ID, EMP_APPROVE2_ID,EMP_APPROVE3_ID,EMP_APPROVE4_ID, " _
    '          & "Send_To_Board, BOARD_ID, RM_ID, BRANCH_ID, " _
    '         & "Flag,DEP_ID, REGION_ID, Others, Others2, " _
    '         & " Result,Comment,CM_Judgement,CM_Judgement_Board,CM_Remark,Reason,Reason2,Job_Type_Id,SME_Referral_No,Customer_Size,COVENANT_FLAG,DO_KFS_FLAG" _
    '         & ",SUB_COMMITTEE_1,SUB_COMMITTEE_2,SUB_COMMITTEE_3  " _
    '         & " FROM ANNALS_CREDIT " _
    '         & " WHERE ID=@ID " _
    '         & " ORDER BY ID"

    '        Dim sqlCmd As New SqlCommand(sql, conn)
    '        sqlCmd.Prepare()

    '        sqlCmd.Parameters.AddWithValue("@ID", ID)

    '        Dim reader As SqlDataReader = sqlCmd.ExecuteReader()

    '        While reader.Read()
    '            result = bindingAnnalsCredit(reader)
    '        End While

    '        reader.close()
    '    Catch ex As Exception
    '        Throw New Exception(ex.Message & " : " & ex.StackTrace)
    '    Finally
    '        If (conn.State = ConnectionState.Open) Then
    '            conn.Close()
    '        End If
    '        conn = Nothing
    '    End Try

    '    Return result

    'End Function

    'Public Function getAllAnnalsCredit() As List(Of AnnalsCredit)

    '    'declare connection
    '    Dim conn As SqlConnection = Nothing
    '    'declare result
    '    Dim result As New List(Of AnnalsCredit)

    '    Try
    '        conn = ConnectionUtil.getSqlConnectionFromWebConfig()
    '        Dim sql As String = "SELECT " _
    '         & "ID, ANNALS_TYPE, ANNALS_SEQ_NO, ANNALS_YEAR, " _
    '         & "ID_OUT, EMP_APPROVE_ID, EMP_REQUEST_ID, EMP_APPROVE2_ID,EMP_APPROVE3_ID,EMP_APPROVE4_ID, " _
    '         & "Send_To_Board, BOARD_ID, RM_ID, BRANCH_ID, " _
    '         & "Flag,DEP_ID, REGION_ID, Others, Others2, " _
    '         & "Result,Comment,CM_Judgement,CM_Judgement_Board,CM_Remark,Reason,Reason2,Job_Type_Id,SME_Referral_No,Customer_Size,COVENANT_FLAG,DO_KFS_FLAG" _
    '         & ",SUB_COMMITTEE_1,SUB_COMMITTEE_2,SUB_COMMITTEE_3  " _
    '        & " FROM ANNALS_CREDIT " _
    '         & " ORDER BY ID"

    '        Dim sqlCmd As New SqlCommand(sql, conn)
    '        sqlCmd.Prepare()

    '        Dim reader As SqlDataReader = sqlCmd.ExecuteReader()

    '        While reader.Read()
    '            result.Add(bindingAnnalsCredit(reader))
    '        End While

    '        reader.close()
    '        conn.Close()
    '    Catch ex As Exception
    '        Throw New Exception(ex.Message & " : " & ex.StackTrace)
    '    Finally
    '        If (conn.State = ConnectionState.Open) Then
    '            conn.Close()
    '        End If
    '        conn = Nothing
    '    End Try

    '    Return result

    'End Function

    Public Function getAllAnnalsCreditBySQL(ByVal sql As String) As List(Of AnnalsCredit)

        'declare connection
        Dim conn As SqlConnection = Nothing
        'declare result
        Dim result As New List(Of AnnalsCredit)

        Try
            conn = ConnectionUtil.getSqlConnectionFromWebConfig()
            Dim sqlCmd As New SqlCommand(sql, conn)
            sqlCmd.Prepare()

            Dim reader As SqlDataReader = sqlCmd.ExecuteReader()

            While reader.Read()
                result.Add(bindingAnnalsCredit(reader))
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

    Public Function InsertAnnalsCreditTransaction(ByVal objAnnalsCredit As AnnalsCredit, ByVal objAnnals As Annals, ByVal objAccount As DataTable, ByVal objProcess As DataTable, ByVal objCif As DataTable) As String

        'declare connection
        Dim conn As SqlConnection = Nothing
        Dim sqlCmd As New SqlCommand()
        Dim sql As String = Nothing
        Try
            conn = ConnectionUtil.getSqlConnectionFromWebConfig()

            sqlCmd.Connection = conn
            sqlCmd.Transaction = sqlCmd.Connection.BeginTransaction()
            sqlCmd.CommandText = "Annals_Insert"

            'sqlCmd = New SqlCommand("Annals_Insert", conn)
            sqlCmd.CommandType = CommandType.StoredProcedure

            sqlCmd.Parameters.AddWithValue("@ANNALS_TYPE", objAnnals.ANNALS_TYPE)
            sqlCmd.Parameters.AddWithValue("@SENDER", objAnnals.SENDER)
            sqlCmd.Parameters.AddWithValue("@RECIVER", objAnnals.RECIVER)
            sqlCmd.Parameters.AddWithValue("@REFERENCE", objAnnals.REFERENCE)
            sqlCmd.Parameters.AddWithValue("@HEADER", objAnnals.HEADER)
            sqlCmd.Parameters.AddWithValue("@DETAIL", objAnnals.DETAIL)
            sqlCmd.Parameters.AddWithValue("@DEPART_REFER", objAnnals.DEPART_REFER)
            sqlCmd.Parameters.AddWithValue("@DATE_IN_ANNALS", objAnnals.DATE_IN_ANNALS)
            'sqlCmd.Parameters.AddWithValue("@ANNALS_CREATE_DATE", objAnnals.ANNALS_CREATE_DATE)
            'sqlCmd.Parameters.AddWithValue("@ANNALS_UPDATE_DATE", objAnnals.ANNALS_UPDATE_DATE)

            Dim ANNALS_SEQ_NO_OUT As New SqlParameter("@ANNALS_SEQ_NO_OUT", SqlDbType.NVarChar, 5)
            ANNALS_SEQ_NO_OUT.Direction = ParameterDirection.Output
            sqlCmd.Parameters.Add(ANNALS_SEQ_NO_OUT)

            Dim ANNALS_YEAR_OUT As New SqlParameter("@ANNALS_YEAR_OUT", SqlDbType.NVarChar, 4)
            ANNALS_YEAR_OUT.Direction = ParameterDirection.Output
            sqlCmd.Parameters.Add(ANNALS_YEAR_OUT)

            sqlCmd.ExecuteNonQuery()

            Dim bo As New AnnalsViewerBO

            objAnnals.ANNALS_SEQ_NO = CType(sqlCmd.Parameters("@ANNALS_SEQ_NO_OUT").Value, String)
            objAnnals.ANNALS_YEAR = CType(sqlCmd.Parameters("@ANNALS_YEAR_OUT").Value, String)

            '  insert  annals viewer 
            bo.InsertAnnalsViewerAfterInsertAnnals(objAnnals.ANNALS_TYPE, objAnnals.ANNALS_SEQ_NO, objAnnals.ANNALS_YEAR, objAnnals.SENDER, objAnnals.RECIVER, sqlCmd)

            'MsgBox("SEQ_NO_OUT = " & SEQ_NO_OUT & " year =" & YEAR_OUT)
            objAnnalsCredit.ID = objAnnals.ANNALS_TYPE & objAnnals.ANNALS_SEQ_NO & objAnnals.ANNALS_YEAR

            sql = "INSERT INTO ANNALS_CREDIT " _
                & " (ID, ANNALS_TYPE, ANNALS_SEQ_NO, ANNALS_YEAR, ID_OUT, EMP_APPROVE_ID, EMP_REQUEST_ID, EMP_APPROVE2_ID, Send_To_Board, BOARD_ID, RM_ID, BRANCH_ID, Flag,DEP_ID, REGION_ID, Others, Others2, Result,Comment,CM_Judgement,CM_Judgement_Board,CM_Remark,Reason,Reason2,Job_Type_Id,SME_Referral_No,Customer_Size,EMP_APPROVE3_ID,EMP_APPROVE4_ID,DO_KFS_FLAG,SUB_COMMITTEE_1,SUB_COMMITTEE_2,SUB_COMMITTEE_3,OUT_OF_SCOPE_ID,GROUP_EXPOSURE,REVIEW_DATE,EMP_CONTROL,IS_FLOOD) " _
                & " VALUES(@ID,@ANNALS_TYPE,@ANNALS_SEQ_NO, @ANNALS_YEAR, @ID_OUT, @EMP_APPROVE_ID, @EMP_REQUEST_ID, @EMP_APPROVE2_ID, @Send_To_Board, @BOARD_ID, @RM_ID, @BRANCH_ID, @Flag,@DEP_ID, @REGION_ID, @Others, @Others2, @Result,@Comment,@CM_Judgement,@CM_Judgement_Board,@CM_Remark,@Reason,@Reason2,@Job_Type_Id,@SME_Referral_No,@Customer_Size,@EMP_APPROVE3_ID,@EMP_APPROVE4_ID,@DO_KFS_FLAG,@SUB_COMMITTEE_1,@SUB_COMMITTEE_2,@SUB_COMMITTEE_3,@OUT_OF_SCOPE_ID,@GROUP_EXPOSURE,@REVIEW_DATE,@EMP_CONTROL,@IS_FLOOD) "

            sqlCmd.CommandText = sql
            sqlCmd.CommandType = CommandType.Text
            sqlCmd.Parameters.Clear()
            '   sqlCmd.Prepare()
            sqlCmd.Parameters.AddWithValue("@ID", objAnnalsCredit.ID)
            sqlCmd.Parameters.AddWithValue("@ANNALS_TYPE", objAnnals.ANNALS_TYPE)
            sqlCmd.Parameters.AddWithValue("@ANNALS_SEQ_NO", objAnnals.ANNALS_SEQ_NO)
            sqlCmd.Parameters.AddWithValue("@ANNALS_YEAR", objAnnals.ANNALS_YEAR)
            sqlCmd.Parameters.AddWithValue("@ID_OUT", objAnnalsCredit.ID_OUT)
            sqlCmd.Parameters.AddWithValue("@EMP_APPROVE_ID", objAnnalsCredit.EMP_APPROVE_ID)
            sqlCmd.Parameters.AddWithValue("@EMP_REQUEST_ID", objAnnalsCredit.EMP_REQUEST_ID)
            sqlCmd.Parameters.AddWithValue("@EMP_APPROVE2_ID", objAnnalsCredit.EMP_APPROVE2_ID)
            sqlCmd.Parameters.AddWithValue("@Send_To_Board", objAnnalsCredit.Send_To_Board)
            sqlCmd.Parameters.AddWithValue("@BOARD_ID", objAnnalsCredit.BOARD_ID)
            sqlCmd.Parameters.AddWithValue("@RM_ID", objAnnalsCredit.RM_ID)
            sqlCmd.Parameters.AddWithValue("@BRANCH_ID", objAnnalsCredit.BRANCH_ID)
            sqlCmd.Parameters.AddWithValue("@DEP_ID", objAnnalsCredit.DEP_ID)
            sqlCmd.Parameters.AddWithValue("@Flag", objAnnalsCredit.Flag)
            sqlCmd.Parameters.AddWithValue("@REGION_ID", objAnnalsCredit.REGION_ID)
            sqlCmd.Parameters.AddWithValue("@Others", objAnnalsCredit.Others)
            sqlCmd.Parameters.AddWithValue("@Others2", objAnnalsCredit.Others2)
            sqlCmd.Parameters.AddWithValue("@Result", objAnnalsCredit.Result)
            sqlCmd.Parameters.AddWithValue("@Comment", objAnnalsCredit.Comment)
            sqlCmd.Parameters.AddWithValue("@CM_Judgement", objAnnalsCredit.CMJudgement)
            sqlCmd.Parameters.AddWithValue("@CM_Judgement_Board", objAnnalsCredit.CMJudgementBoard)
            sqlCmd.Parameters.AddWithValue("@CM_Remark", objAnnalsCredit.CMRemark)
            sqlCmd.Parameters.AddWithValue("@Reason", objAnnalsCredit.Reason)
            sqlCmd.Parameters.AddWithValue("@Reason2", objAnnalsCredit.Reason2)
            sqlCmd.Parameters.AddWithValue("@Job_Type_Id", objAnnalsCredit.Job_Type_Id)
            sqlCmd.Parameters.AddWithValue("@SME_Referral_No", objAnnalsCredit.SME_Referral_No)
            sqlCmd.Parameters.AddWithValue("@Customer_Size", objAnnalsCredit.Customer_Size)
            sqlCmd.Parameters.AddWithValue("@EMP_APPROVE3_ID", objAnnalsCredit.EMP_APPROVE3_ID)  '  เพิ่มวันที่ 28/07/2009
            sqlCmd.Parameters.AddWithValue("@EMP_APPROVE4_ID", objAnnalsCredit.EMP_APPROVE4_ID)
            ' sqlCmd.Parameters.AddWithValue("@COVENANT_FLAG", objAnnalsCredit.COVENANT_FLAG)
            If objAnnalsCredit.DO_KFS_FLAG = Nothing Then
                sqlCmd.Parameters.AddWithValue("@DO_KFS_FLAG", System.DBNull.Value)
            Else
                sqlCmd.Parameters.AddWithValue("@DO_KFS_FLAG", objAnnalsCredit.DO_KFS_FLAG)
            End If
            If objAnnalsCredit.SUB_COMMITTEE_1 = "" Then
                sqlCmd.Parameters.AddWithValue("@SUB_COMMITTEE_1", System.DBNull.Value)
            Else
                sqlCmd.Parameters.AddWithValue("@SUB_COMMITTEE_1", objAnnalsCredit.SUB_COMMITTEE_1)
            End If
            If objAnnalsCredit.SUB_COMMITTEE_2 = "" Then
                sqlCmd.Parameters.AddWithValue("@SUB_COMMITTEE_2", System.DBNull.Value)
            Else
                sqlCmd.Parameters.AddWithValue("@SUB_COMMITTEE_2", objAnnalsCredit.SUB_COMMITTEE_2)
            End If
            If objAnnalsCredit.SUB_COMMITTEE_3 = "" Then
                sqlCmd.Parameters.AddWithValue("@SUB_COMMITTEE_3", System.DBNull.Value)
            Else
                sqlCmd.Parameters.AddWithValue("@SUB_COMMITTEE_3", objAnnalsCredit.SUB_COMMITTEE_3)
            End If
            If objAnnalsCredit.OUT_OF_SCOPE_ID = "" Then
                sqlCmd.Parameters.AddWithValue("@OUT_OF_SCOPE_ID", System.DBNull.Value)
            Else
                sqlCmd.Parameters.AddWithValue("@OUT_OF_SCOPE_ID", objAnnalsCredit.OUT_OF_SCOPE_ID)
            End If
            If objAnnalsCredit.GROUP_EXPOSURE = -1 Then   ' ถ้ามีค่าติดลบมากำหนดให้บันทึกค่า null ใน db
                sqlCmd.Parameters.AddWithValue("@GROUP_EXPOSURE", System.DBNull.Value)
            Else
                sqlCmd.Parameters.AddWithValue("@GROUP_EXPOSURE", objAnnalsCredit.GROUP_EXPOSURE)
            End If
            If objAnnalsCredit.REVIEW_DATE = Nothing Then
                sqlCmd.Parameters.AddWithValue("@REVIEW_DATE", System.DBNull.Value)
            Else
                sqlCmd.Parameters.AddWithValue("@REVIEW_DATE", objAnnalsCredit.REVIEW_DATE)
            End If
            If objAnnalsCredit.EMP_CONTROL = "" Then
                sqlCmd.Parameters.AddWithValue("@EMP_CONTROL", System.DBNull.Value)
            Else
                sqlCmd.Parameters.AddWithValue("@EMP_CONTROL", objAnnalsCredit.EMP_CONTROL)
            End If

            If objAnnalsCredit.IS_FLOOD = -1 Then
                sqlCmd.Parameters.AddWithValue("@IS_FLOOD", System.DBNull.Value)
            Else
                sqlCmd.Parameters.AddWithValue("@IS_FLOOD", objAnnalsCredit.IS_FLOOD)
            End If


            ' การเพิ่มยังไม่ใส่ covenant flag
            sqlCmd.ExecuteNonQuery()

            sql = "DELETE FROM ANNALS_CREDIT_PROCESS WHERE ID=@ID"
            sqlCmd.CommandText = sql
            'sqlCmd.Prepare()
            sqlCmd.Parameters.Clear()
            sqlCmd.Parameters.AddWithValue("@ID", objAnnalsCredit.ID)
            sqlCmd.ExecuteNonQuery()


            ' บันทึก process
            Dim Ptable As DataTable = objProcess
            For i As Integer = 0 To Ptable.Rows.Count - 1
                With Ptable.Rows(i)

                    sql = "INSERT INTO ANNALS_CREDIT_PROCESS " _
                              & " (ID, EMP_ID,USER_ID,PROCESS_ID, PROCESS_DATE, LEVEL_ID ) " _
                              & " VALUES(@ID, @EMP_ID,@USER_ID,@PROCESS_ID, @PROCESS_DATE, @LEVEL_ID) "
                    sqlCmd.CommandType = CommandType.Text
                    sqlCmd.CommandText = sql
                    sqlCmd.Parameters.Clear()
                    sqlCmd.Parameters.AddWithValue("@ID", objAnnalsCredit.ID)
                    sqlCmd.Parameters.AddWithValue("@EMP_ID", .Item("Emp_id"))
                    sqlCmd.Parameters.AddWithValue("@USER_ID", .Item("User_id"))
                    sqlCmd.Parameters.AddWithValue("@PROCESS_ID", .Item("PROCESS_ID"))
                    sqlCmd.Parameters.AddWithValue("@PROCESS_DATE", .Item("PROCESS_DATE"))
                    'MsgBox(.Item("LEVEL_ID"))
                    sqlCmd.Parameters.AddWithValue("@LEVEL_ID", .Item("LEVEL_ID"))

                    sqlCmd.ExecuteNonQuery()

                    ' add annals viewer from process
                    ' update recieve  in annals  and  insert   in annals_viewer
                    If objAnnals.RECIVER.IndexOf(.Item("EMP_ID").ToString) < 0 Then
                        bo.addAnnalsReciverAndViewer(New AnnalsViewer(objAnnals.ANNALS_TYPE, objAnnals.ANNALS_SEQ_NO, objAnnals.ANNALS_YEAR, .Item("EMP_ID").ToString), .Item("EMPLOYEE").ToString + ":" + .Item("EMP_ID").ToString, sqlCmd)
                    End If
                End With
            Next

            sql = "DELETE FROM ANNALS_CREDIT_ACCOUNT WHERE ID=@ID"
            sqlCmd.CommandType = CommandType.Text
            sqlCmd.CommandText = sql
            sqlCmd.Parameters.Clear()
            sqlCmd.Parameters.AddWithValue("@ID", objAnnalsCredit.ID)
            sqlCmd.ExecuteNonQuery()

            ' บันทึกค่าใหม่ใน db 
            Dim dtable As DataTable = objAccount
            For i As Integer = 0 To dtable.Rows.Count - 1
                With dtable.Rows(i)
                    sql = "INSERT INTO ANNALS_CREDIT_ACCOUNT " _
                  & " (ID, CIF, ACCNO, NBRTHAI, DECB_RD_ID, SUMLIMIT, SUMPRIN, SUMACCRU, SUMSUSP, SUMAGING, SUBJECT_DETAIL_ID, Value_Customer, VALUE_OLD, VALUE, VALUE_APPROVE, Others,PROJECT_CODE,PRODUCT_CODE,PROPOSAL_ID,RM_ID,PROGRAM_ID,PROJECT_ID,PRODUCT_ID) " _
                    & " VALUES(@ID, @CIF, @ACCNO, @NBRTHAI, @DECB_RD_ID, @SUMLIMIT, @SUMPRIN, @SUMACCRU, @SUMSUSP, @SUMAGING, @SUBJECT_DETAIL_ID, @Value_Customer, @VALUE_OLD, @VALUE, @VALUE_APPROVE, @Others,@PROJECT_CODE,@PRODUCT_CODE,@PROPOSAL_ID,@RM_ID,@PROGRAM_ID,@PROJECT_ID,@PRODUCT_ID) "

                    sqlCmd.CommandText = sql
                    sqlCmd.CommandType = CommandType.Text
                    'sqlCmd.Prepare()
                    sqlCmd.Parameters.Clear()
                    sqlCmd.Parameters.AddWithValue("@ID", objAnnalsCredit.ID)
                    sqlCmd.Parameters.AddWithValue("@CIF", CType(.Item("Cif"), Integer))
                    sqlCmd.Parameters.AddWithValue("@ACCNO", .Item("ACCNO"))
                    sqlCmd.Parameters.AddWithValue("@NBRTHAI", "")
                    sqlCmd.Parameters.AddWithValue("@DECB_RD_ID", .Item("DECB_RD_ID"))
                    sqlCmd.Parameters.AddWithValue("@SUMLIMIT", 0)
                    sqlCmd.Parameters.AddWithValue("@SUMPRIN", 0)
                    sqlCmd.Parameters.AddWithValue("@SUMACCRU", 0)
                    sqlCmd.Parameters.AddWithValue("@SUMSUSP", 0)
                    sqlCmd.Parameters.AddWithValue("@SUMAGING", 0)
                    sqlCmd.Parameters.AddWithValue("@SUBJECT_DETAIL_ID", .Item("SUBJECT_DETAIL_ID"))

                    'sqlCmd.Parameters.AddWithValue("@Value_Customer", .Item("Value_Customer"))
                    'sqlCmd.Parameters.AddWithValue("@VALUE_OLD", .Item("Value_Old"))
                    'sqlCmd.Parameters.AddWithValue("@VALUE", .Item("Value"))
                    'sqlCmd.Parameters.AddWithValue("@VALUE_APPROVE", .Item("Value_Approve"))

                    If .Item("Value_Customer").ToString = "" Then
                        sqlCmd.Parameters.AddWithValue("@Value_Customer", System.DBNull.Value)
                    Else
                        sqlCmd.Parameters.AddWithValue("@Value_Customer", CDec(.Item("Value_Customer")))
                    End If
                    If .Item("VALUE_OLD").ToString = "" Then
                        sqlCmd.Parameters.AddWithValue("@VALUE_OLD", System.DBNull.Value)
                    Else
                        sqlCmd.Parameters.AddWithValue("@VALUE_OLD", CDec(.Item("VALUE_OLD")))
                    End If
                    If .Item("VALUE").ToString = "" Then
                        sqlCmd.Parameters.AddWithValue("@VALUE", System.DBNull.Value)
                    Else
                        sqlCmd.Parameters.AddWithValue("@VALUE", CDec(.Item("VALUE")))
                    End If
                    If .Item("VALUE_APPROVE").ToString = "" Then
                        sqlCmd.Parameters.AddWithValue("@VALUE_APPROVE", System.DBNull.Value)
                    Else
                        sqlCmd.Parameters.AddWithValue("@VALUE_APPROVE", CDec(.Item("VALUE_APPROVE")))
                    End If

                    sqlCmd.Parameters.AddWithValue("@Others", .Item("Others"))
                    sqlCmd.Parameters.AddWithValue("@PROJECT_CODE", .Item("PROJECT_CODE"))
                    sqlCmd.Parameters.AddWithValue("@PRODUCT_CODE", .Item("PRODUCT_CODE"))
                    sqlCmd.Parameters.AddWithValue("@PROPOSAL_ID", .Item("PROPOSAL_ID"))  ' เพิ่มวันที่ 18 /03/2009
                    sqlCmd.Parameters.AddWithValue("@RM_ID", .Item("RM_ID"))  ' เพิ่มวันที่ 18 /03/2009

                    sqlCmd.Parameters.AddWithValue("@PROGRAM_ID", .Item("PROGRAM_ID"))
                    sqlCmd.Parameters.AddWithValue("@PROJECT_ID", .Item("PROJECT_ID"))
                    sqlCmd.Parameters.AddWithValue("@PRODUCT_ID", .Item("PRODUCT_ID"))


                    sqlCmd.ExecuteNonQuery()
                End With
            Next
            '  insert  cif ใน C/A
            sql = "DELETE FROM  ANNALS_CUS_CA WHERE ID=@ID"
            sqlCmd.CommandType = CommandType.Text
            sqlCmd.CommandText = sql
            sqlCmd.Parameters.Clear()
            sqlCmd.Parameters.AddWithValue("@ID", objAnnalsCredit.ID)
            sqlCmd.ExecuteNonQuery()

            Dim CifTable As DataTable = objCif
            For i As Integer = 0 To CifTable.Rows.Count - 1
                With CifTable.Rows(i)
                    sql = "INSERT INTO ANNALS_CUS_CA " _
                  & " (ID, CIF,RATING_KEY,RATING_DATE,BUSI_RISK1_ID) VALUES(@ID,@CIF,@RATING_KEY,@RATING_DATE,@BUSS_TYPE_ID) "
                    sqlCmd.CommandText = sql
                    sqlCmd.CommandType = CommandType.Text
                    sqlCmd.Parameters.Clear()
                    sqlCmd.Parameters.AddWithValue("@ID", objAnnalsCredit.ID)
                    sqlCmd.Parameters.AddWithValue("@CIF", CType(.Item("CIF"), Integer))
                    sqlCmd.Parameters.AddWithValue("@RATING_KEY", .Item("RATING_KEY"))
                    sqlCmd.Parameters.AddWithValue("@RATING_DATE", .Item("RATING_DATE"))
                    sqlCmd.Parameters.AddWithValue("@BUSS_TYPE_ID", .Item("BUSS_TYPE_ID"))

                    sqlCmd.ExecuteNonQuery()
                End With
            Next


            sqlCmd.Transaction.Commit()
        Catch ex As Exception
            sqlCmd.Transaction.Rollback()
            'MsgBox(ex.StackTrace)
            Throw New Exception(ex.Message & " : " & ex.StackTrace)
        Finally
            If (conn.State = ConnectionState.Open) Then
                conn.Close()
            End If
            conn = Nothing
        End Try
        Return objAnnalsCredit.ID
    End Function
    Public Function UpdateAnnalsCreditTransaction(ByVal objAnnalsCredit As AnnalsCredit, ByVal objAnnals As Annals, ByVal objAccount As DataTable, ByVal objProcess As DataTable, ByVal OldSender As String, ByVal OldReciver As String, ByVal objCif As DataTable) As String

        'declare connection
        Dim conn As SqlConnection = Nothing
        Dim sqlCmd As New SqlCommand()
        Dim sql As String = Nothing
        Try
            conn = ConnectionUtil.getSqlConnectionFromWebConfig()
            sqlCmd.Connection = conn
            sqlCmd.Transaction = sqlCmd.Connection.BeginTransaction()


            sql = "UPDATE ANNALS  SET " _
             & "  SENDER=@SENDER, " _
             & "  RECIVER=@RECIVER, " _
             & "  REFERENCE=@REFERENCE, " _
             & "  HEADER=@HEADER, " _
             & "  DETAIL=@DETAIL, " _
             & "  DATE_IN_ANNALS=@DATE_IN_ANNALS, " _
             & "  ANNALS_UPDATE_DATE=@ANNALS_UPDATE_DATE " _
             & "  WHERE ANNALS_TYPE=@ANNALS_TYPE" _
             & " AND ANNALS_SEQ_NO=@ANNALS_SEQ_NO" _
             & " AND ANNALS_YEAR=@ANNALS_YEAR "

            sqlCmd.CommandText = sql

            sqlCmd.Parameters.AddWithValue("@ANNALS_TYPE", objAnnals.ANNALS_TYPE)
            sqlCmd.Parameters.AddWithValue("@ANNALS_SEQ_NO", objAnnals.ANNALS_SEQ_NO)
            sqlCmd.Parameters.AddWithValue("@ANNALS_YEAR", objAnnals.ANNALS_YEAR)
            sqlCmd.Parameters.AddWithValue("@SENDER", objAnnals.SENDER)
            sqlCmd.Parameters.AddWithValue("@RECIVER", objAnnals.RECIVER)
            sqlCmd.Parameters.AddWithValue("@REFERENCE", objAnnals.REFERENCE)
            sqlCmd.Parameters.AddWithValue("@HEADER", objAnnals.HEADER)
            sqlCmd.Parameters.AddWithValue("@DETAIL", objAnnals.DETAIL)
            sqlCmd.Parameters.AddWithValue("@DATE_IN_ANNALS", objAnnals.DATE_IN_ANNALS)
            sqlCmd.Parameters.AddWithValue("@ANNALS_UPDATE_DATE", Date.Now)

            sqlCmd.ExecuteNonQuery()

            Dim bo As New AnnalsViewerBO

            '  insert  annals viewer 
            bo.InsertAnnalsViewerAfterUpdateAnnals(objAnnals.ANNALS_TYPE, objAnnals.ANNALS_SEQ_NO, objAnnals.ANNALS_YEAR, OldSender, OldReciver, objAnnals.SENDER, objAnnals.RECIVER, sqlCmd)

            'MsgBox("SEQ_NO_OUT = " & SEQ_NO_OUT & " year =" & YEAR_OUT)
            objAnnalsCredit.ID = objAnnals.ANNALS_TYPE & objAnnals.ANNALS_SEQ_NO & objAnnals.ANNALS_YEAR

            sql = "UPDATE ANNALS_CREDIT SET " _
                   & " ANNALS_TYPE=@ANNALS_TYPE, " _
                   & " ANNALS_SEQ_NO=@ANNALS_SEQ_NO, " _
                   & " ANNALS_YEAR=@ANNALS_YEAR, " _
                   & " ID_OUT=@ID_OUT, " _
                   & " EMP_APPROVE_ID=@EMP_APPROVE_ID, " _
                   & " EMP_REQUEST_ID=@EMP_REQUEST_ID, " _
                   & " EMP_APPROVE2_ID=@EMP_APPROVE2_ID, " _
                   & " Send_To_Board=@Send_To_Board, " _
                   & " BOARD_ID=@BOARD_ID, " _
                   & " RM_ID=@RM_ID, " _
                   & " BRANCH_ID=@BRANCH_ID, " _
                   & " DEP_ID=@DEP_ID, " _
                    & " Flag=@Flag, " _
                   & " REGION_ID=@REGION_ID, " _
                   & " Others=@Others, " _
                   & " Others2=@Others2, " _
                   & " Result=@Result, " _
                   & " Comment=@Comment, " _
                   & " CM_Judgement=@CM_Judgement, " _
                   & " CM_Judgement_Board=@CM_Judgement_Board, " _
                   & " CM_Remark=@CM_Remark, " _
                   & " Reason=@Reason, " _
                   & " Reason2=@Reason2, " _
                   & " Job_Type_Id=@Job_Type_Id, " _
                   & "  SME_Referral_No=@SME_Referral_No, " _
                   & " Customer_Size=@Customer_Size," _
                   & " EMP_APPROVE3_ID=@EMP_APPROVE3_ID," _
                   & " EMP_APPROVE4_ID=@EMP_APPROVE4_ID," _
                   & " COVENANT_FLAG=@COVENANT_FLAG," _
                   & " DO_KFS_FLAG=@DO_KFS_FLAG" _
                   & ",SUB_COMMITTEE_1=@SUB_COMMITTEE_1 " _
                   & ",SUB_COMMITTEE_2=@SUB_COMMITTEE_2 " _
                   & ",SUB_COMMITTEE_3=@SUB_COMMITTEE_3  " _
                   & ",OUT_OF_SCOPE_ID=@OUT_OF_SCOPE_ID  " _
                   & ",GROUP_EXPOSURE=@GROUP_EXPOSURE " _
                   & ",REVIEW_DATE=@REVIEW_DATE " _
                   & ",EMP_CONTROL=@EMP_CONTROL " _
                   & ",IS_FLOOD = @IS_FLOOD " _
                   & " WHERE ID=@ID "

            sqlCmd.CommandType = CommandType.Text
            sqlCmd.CommandText = sql
            sqlCmd.Parameters.Clear()

            sqlCmd.Parameters.AddWithValue("@ID", objAnnalsCredit.ID)
            sqlCmd.Parameters.AddWithValue("@ANNALS_TYPE", objAnnalsCredit.ANNALS_TYPE)
            sqlCmd.Parameters.AddWithValue("@ANNALS_SEQ_NO", objAnnalsCredit.ANNALS_SEQ_NO)
            sqlCmd.Parameters.AddWithValue("@ANNALS_YEAR", objAnnalsCredit.ANNALS_YEAR)
            sqlCmd.Parameters.AddWithValue("@ID_OUT", objAnnalsCredit.ID_OUT)
            sqlCmd.Parameters.AddWithValue("@EMP_APPROVE_ID", objAnnalsCredit.EMP_APPROVE_ID)
            sqlCmd.Parameters.AddWithValue("@EMP_REQUEST_ID", objAnnalsCredit.EMP_REQUEST_ID)
            sqlCmd.Parameters.AddWithValue("@EMP_APPROVE2_ID", objAnnalsCredit.EMP_APPROVE2_ID)
            sqlCmd.Parameters.AddWithValue("@Send_To_Board", objAnnalsCredit.Send_To_Board)
            sqlCmd.Parameters.AddWithValue("@BOARD_ID", objAnnalsCredit.BOARD_ID)
            sqlCmd.Parameters.AddWithValue("@RM_ID", objAnnalsCredit.RM_ID)
            sqlCmd.Parameters.AddWithValue("@BRANCH_ID", objAnnalsCredit.BRANCH_ID)
            sqlCmd.Parameters.AddWithValue("@DEP_ID", objAnnalsCredit.DEP_ID)
            sqlCmd.Parameters.AddWithValue("@Flag", objAnnalsCredit.Flag)
            sqlCmd.Parameters.AddWithValue("@REGION_ID", objAnnalsCredit.REGION_ID)
            sqlCmd.Parameters.AddWithValue("@Others", objAnnalsCredit.Others)
            sqlCmd.Parameters.AddWithValue("@Others2", objAnnalsCredit.Others2)
            sqlCmd.Parameters.AddWithValue("@Result", objAnnalsCredit.Result)
            sqlCmd.Parameters.AddWithValue("@Comment", objAnnalsCredit.Comment)
            sqlCmd.Parameters.AddWithValue("@CM_Judgement", objAnnalsCredit.CMJudgement)
            sqlCmd.Parameters.AddWithValue("@CM_Judgement_Board", objAnnalsCredit.CMJudgementBoard)
            sqlCmd.Parameters.AddWithValue("@CM_Remark", objAnnalsCredit.CMRemark)
            sqlCmd.Parameters.AddWithValue("@Reason", objAnnalsCredit.Reason)
            sqlCmd.Parameters.AddWithValue("@Reason2", objAnnalsCredit.Reason2)
            sqlCmd.Parameters.AddWithValue("@Job_Type_Id", objAnnalsCredit.Job_Type_Id)
            sqlCmd.Parameters.AddWithValue("@SME_Referral_No", objAnnalsCredit.SME_Referral_No)
            sqlCmd.Parameters.AddWithValue("@Customer_Size", objAnnalsCredit.Customer_Size)
            sqlCmd.Parameters.AddWithValue("@EMP_APPROVE3_ID", objAnnalsCredit.EMP_APPROVE3_ID)
            sqlCmd.Parameters.AddWithValue("@EMP_APPROVE4_ID", objAnnalsCredit.EMP_APPROVE4_ID)
            If objAnnalsCredit.COVENANT_FLAG = Nothing Then
                sqlCmd.Parameters.AddWithValue("@COVENANT_FLAG", System.DBNull.Value)
            Else
                sqlCmd.Parameters.AddWithValue("@COVENANT_FLAG", objAnnalsCredit.COVENANT_FLAG)
            End If
            If objAnnalsCredit.DO_KFS_FLAG = Nothing Then
                sqlCmd.Parameters.AddWithValue("@DO_KFS_FLAG", System.DBNull.Value)
            Else
                sqlCmd.Parameters.AddWithValue("@DO_KFS_FLAG", objAnnalsCredit.DO_KFS_FLAG)
            End If

            If objAnnalsCredit.SUB_COMMITTEE_1 = "" Then
                sqlCmd.Parameters.AddWithValue("@SUB_COMMITTEE_1", System.DBNull.Value)
            Else
                sqlCmd.Parameters.AddWithValue("@SUB_COMMITTEE_1", objAnnalsCredit.SUB_COMMITTEE_1)
            End If

            If objAnnalsCredit.SUB_COMMITTEE_2 = "" Then
                sqlCmd.Parameters.AddWithValue("@SUB_COMMITTEE_2", System.DBNull.Value)
            Else
                sqlCmd.Parameters.AddWithValue("@SUB_COMMITTEE_2", objAnnalsCredit.SUB_COMMITTEE_2)
            End If
            If objAnnalsCredit.SUB_COMMITTEE_3 = "" Then
                sqlCmd.Parameters.AddWithValue("@SUB_COMMITTEE_3", System.DBNull.Value)
            Else
                sqlCmd.Parameters.AddWithValue("@SUB_COMMITTEE_3", objAnnalsCredit.SUB_COMMITTEE_3)
            End If

            If objAnnalsCredit.OUT_OF_SCOPE_ID = "" Then
                sqlCmd.Parameters.AddWithValue("@OUT_OF_SCOPE_ID", System.DBNull.Value)
            Else
                sqlCmd.Parameters.AddWithValue("@OUT_OF_SCOPE_ID", objAnnalsCredit.OUT_OF_SCOPE_ID)
            End If

            If objAnnalsCredit.GROUP_EXPOSURE = -1 Then   ' ถ้ามีค่าติดลบมากำหนดให้บันทึกค่า null ใน db
                sqlCmd.Parameters.AddWithValue("@GROUP_EXPOSURE", System.DBNull.Value)
            Else
                sqlCmd.Parameters.AddWithValue("@GROUP_EXPOSURE", objAnnalsCredit.GROUP_EXPOSURE)
            End If
            If objAnnalsCredit.REVIEW_DATE = Nothing Then
                sqlCmd.Parameters.AddWithValue("@REVIEW_DATE", System.DBNull.Value)
            Else
                sqlCmd.Parameters.AddWithValue("@REVIEW_DATE", objAnnalsCredit.REVIEW_DATE)
            End If
            If objAnnalsCredit.EMP_CONTROL = "" Then
                sqlCmd.Parameters.AddWithValue("@EMP_CONTROL", System.DBNull.Value)
            Else
                sqlCmd.Parameters.AddWithValue("@EMP_CONTROL", objAnnalsCredit.EMP_CONTROL)
            End If
            If objAnnalsCredit.IS_FLOOD = -1 Then
                sqlCmd.Parameters.AddWithValue("@IS_FLOOD", System.DBNull.Value)
            Else
                sqlCmd.Parameters.AddWithValue("@IS_FLOOD", objAnnalsCredit.IS_FLOOD)
            End If


            sqlCmd.ExecuteNonQuery()


            sql = "DELETE FROM ANNALS_CREDIT_PROCESS WHERE ID=@ID"
            sqlCmd.CommandType = CommandType.Text
            sqlCmd.CommandText = sql
            'sqlCmd.Prepare()
            sqlCmd.Parameters.Clear()
            sqlCmd.Parameters.AddWithValue("@ID", objAnnalsCredit.ID)
            sqlCmd.ExecuteNonQuery()


            ' บันทึก process
            Dim Ptable As DataTable = objProcess
            For i As Integer = 0 To Ptable.Rows.Count - 1
                With Ptable.Rows(i)

                    sql = "INSERT INTO ANNALS_CREDIT_PROCESS " _
                              & " (ID, EMP_ID,USER_ID,PROCESS_ID, PROCESS_DATE,LEVEL_ID) " _
                              & " VALUES(@ID, @EMP_ID,@USER_ID,@PROCESS_ID, @PROCESS_DATE,@LEVEL_ID) "
                    sqlCmd.CommandType = CommandType.Text
                    sqlCmd.CommandText = sql
                    sqlCmd.Parameters.Clear()

                    sqlCmd.Parameters.AddWithValue("@ID", objAnnalsCredit.ID)
                    sqlCmd.Parameters.AddWithValue("@EMP_ID", .Item("Emp_id"))
                    sqlCmd.Parameters.AddWithValue("@USER_ID", .Item("User_id"))
                    sqlCmd.Parameters.AddWithValue("@PROCESS_ID", .Item("PROCESS_ID"))
                    sqlCmd.Parameters.AddWithValue("@PROCESS_DATE", .Item("PROCESS_DATE"))
                    sqlCmd.Parameters.AddWithValue("@LEVEL_ID", .Item("LEVEL_ID"))
                    sqlCmd.ExecuteNonQuery()

                    ' add annals viewer from process
                    ' update recieve  in annals  and  insert   in annals_viewer

                    If objAnnals.RECIVER.IndexOf(.Item("EMP_ID").ToString) < 0 Then
                        bo.addAnnalsReciverAndViewer(New AnnalsViewer(objAnnals.ANNALS_TYPE, objAnnals.ANNALS_SEQ_NO, objAnnals.ANNALS_YEAR, .Item("EMP_ID").ToString), .Item("EMPLOYEE").ToString + ":" + .Item("EMP_ID").ToString, sqlCmd)
                    End If
                End With
            Next

            sql = "DELETE FROM ANNALS_CREDIT_ACCOUNT WHERE ID=@ID"
            sqlCmd.CommandType = CommandType.Text
            sqlCmd.CommandText = sql
            sqlCmd.Parameters.Clear()
            sqlCmd.Parameters.AddWithValue("@ID", objAnnalsCredit.ID)
            sqlCmd.ExecuteNonQuery()

            ' บันทึกค่าใหม่ใน db 
            Dim dtable As DataTable = objAccount
            For i As Integer = 0 To dtable.Rows.Count - 1
                With dtable.Rows(i)
                    sql = "INSERT INTO ANNALS_CREDIT_ACCOUNT " _
                  & " (ID, CIF, ACCNO, NBRTHAI, DECB_RD_ID, SUMLIMIT, SUMPRIN, SUMACCRU, SUMSUSP, SUMAGING, SUBJECT_DETAIL_ID, Value_Customer, VALUE_OLD, VALUE, VALUE_APPROVE, Others ,PROJECT_CODE,PRODUCT_CODE,PROPOSAL_ID,RM_ID,PROGRAM_ID,PROJECT_ID,PRODUCT_ID) " _
                    & " VALUES(@ID, @CIF, @ACCNO, @NBRTHAI, @DECB_RD_ID, @SUMLIMIT, @SUMPRIN, @SUMACCRU, @SUMSUSP, @SUMAGING, @SUBJECT_DETAIL_ID, @Value_Customer, @VALUE_OLD, @VALUE, @VALUE_APPROVE, @Others ,@PROJECT_CODE,@PRODUCT_CODE,@PROPOSAL_ID,@RM_ID,@PROGRAM_ID,@PROJECT_ID,@PRODUCT_ID) "

                    sqlCmd.CommandType = CommandType.Text
                    sqlCmd.CommandText = sql
                    'sqlCmd.Prepare()
                    sqlCmd.Parameters.Clear()
                    sqlCmd.Parameters.AddWithValue("@ID", objAnnalsCredit.ID)
                    sqlCmd.Parameters.AddWithValue("@CIF", CType(.Item("Cif"), Integer))
                    sqlCmd.Parameters.AddWithValue("@ACCNO", .Item("ACCNO"))
                    sqlCmd.Parameters.AddWithValue("@NBRTHAI", "")
                    sqlCmd.Parameters.AddWithValue("@DECB_RD_ID", .Item("DECB_RD_ID"))
                    sqlCmd.Parameters.AddWithValue("@SUMLIMIT", 0)
                    sqlCmd.Parameters.AddWithValue("@SUMPRIN", 0)
                    sqlCmd.Parameters.AddWithValue("@SUMACCRU", 0)
                    sqlCmd.Parameters.AddWithValue("@SUMSUSP", 0)
                    sqlCmd.Parameters.AddWithValue("@SUMAGING", 0)
                    sqlCmd.Parameters.AddWithValue("@SUBJECT_DETAIL_ID", .Item("SUBJECT_DETAIL_ID"))

                    'sqlCmd.Parameters.AddWithValue("@Value_Customer", .Item("Value_Customer"))
                    'sqlCmd.Parameters.AddWithValue("@VALUE_OLD", .Item("Value_Old"))
                    'sqlCmd.Parameters.AddWithValue("@VALUE", .Item("Value"))
                    'sqlCmd.Parameters.AddWithValue("@VALUE_APPROVE", .Item("Value_Approve"))
                    If .Item("Value_Customer").ToString = "" Then
                        sqlCmd.Parameters.AddWithValue("@Value_Customer", System.DBNull.Value)
                    Else
                        sqlCmd.Parameters.AddWithValue("@Value_Customer", CDec(.Item("Value_Customer")))
                    End If
                    If .Item("VALUE_OLD").ToString = "" Then
                        sqlCmd.Parameters.AddWithValue("@VALUE_OLD", System.DBNull.Value)
                    Else
                        sqlCmd.Parameters.AddWithValue("@VALUE_OLD", CDec(.Item("VALUE_OLD")))
                    End If
                    If .Item("VALUE").ToString = "" Then
                        sqlCmd.Parameters.AddWithValue("@VALUE", System.DBNull.Value)
                    Else
                        sqlCmd.Parameters.AddWithValue("@VALUE", CDec(.Item("VALUE")))
                    End If
                    If .Item("VALUE_APPROVE").ToString = "" Then
                        sqlCmd.Parameters.AddWithValue("@VALUE_APPROVE", System.DBNull.Value)
                    Else
                        sqlCmd.Parameters.AddWithValue("@VALUE_APPROVE", CDec(.Item("VALUE_APPROVE")))
                    End If

                    sqlCmd.Parameters.AddWithValue("@Others", .Item("Others"))
                    sqlCmd.Parameters.AddWithValue("@PROJECT_CODE", .Item("PROJECT_CODE"))
                    sqlCmd.Parameters.AddWithValue("@PRODUCT_CODE", .Item("PRODUCT_CODE"))
                    sqlCmd.Parameters.AddWithValue("@PROPOSAL_ID", .Item("PROPOSAL_ID"))  ' เพิ่มวันที่ 18 /03/2009
                    sqlCmd.Parameters.AddWithValue("@RM_ID", .Item("RM_ID"))  ' เพิ่มวันที่ 10 /01/2011

                    sqlCmd.Parameters.AddWithValue("@PROGRAM_ID", .Item("PROGRAM_ID"))
                    sqlCmd.Parameters.AddWithValue("@PROJECT_ID", .Item("PROJECT_ID"))
                    sqlCmd.Parameters.AddWithValue("@PRODUCT_ID", .Item("PRODUCT_ID"))


                    sqlCmd.ExecuteNonQuery()
                End With
            Next

            '  insert  cif ใน C/A
            sql = "DELETE FROM  ANNALS_CUS_CA WHERE ID=@ID"
            sqlCmd.CommandType = CommandType.Text
            sqlCmd.CommandText = sql
            sqlCmd.Parameters.Clear()
            sqlCmd.Parameters.AddWithValue("@ID", objAnnalsCredit.ID)
            sqlCmd.ExecuteNonQuery()

            Dim CifTable As DataTable = objCif
            For i As Integer = 0 To CifTable.Rows.Count - 1
                With CifTable.Rows(i)
                    sql = "INSERT INTO ANNALS_CUS_CA " _
                  & " (ID, CIF,RATING_KEY,RATING_DATE,BUSI_RISK1_ID) VALUES(@ID,@CIF,@RATING_KEY,@RATING_DATE,@BUSS_TYPE_ID) "
                    sqlCmd.CommandText = sql
                    sqlCmd.CommandType = CommandType.Text
                    sqlCmd.Parameters.Clear()
                    sqlCmd.Parameters.AddWithValue("@ID", objAnnalsCredit.ID)
                    sqlCmd.Parameters.AddWithValue("@CIF", CType(.Item("CIF"), Integer))
                    sqlCmd.Parameters.AddWithValue("@RATING_KEY", .Item("RATING_KEY"))
                    sqlCmd.Parameters.AddWithValue("@RATING_DATE", .Item("RATING_DATE"))
                    sqlCmd.Parameters.AddWithValue("@BUSS_TYPE_ID", .Item("BUSS_TYPE_ID"))

                    sqlCmd.ExecuteNonQuery()
                End With
            Next
            sqlCmd.Transaction.Commit()
        Catch ex As Exception
            sqlCmd.Transaction.Rollback()
            'MsgBox(ex.StackTrace)
            Throw New Exception(ex.Message & " : " & ex.StackTrace)
        Finally
            If (conn.State = ConnectionState.Open) Then
                conn.Close()
            End If
            conn = Nothing
        End Try
        Return objAnnalsCredit.ID
    End Function
   
    Public Sub updateAnnalsCredit(ByVal objAnnalsCredit As AnnalsCredit)

        'declare connection
        Dim conn As SqlConnection = Nothing

        Try
            conn = ConnectionUtil.getSqlConnectionFromWebConfig()
            Dim sql As String = "UPDATE ANNALS_CREDIT SET " _
                & " ANNALS_TYPE=@ANNALS_TYPE, " _
                & " ANNALS_SEQ_NO=@ANNALS_SEQ_NO, " _
                & " ANNALS_YEAR=@ANNALS_YEAR, " _
                & " ID_OUT=@ID_OUT, " _
                & " EMP_APPROVE_ID=@EMP_APPROVE_ID, " _
                & " EMP_REQUEST_ID=@EMP_REQUEST_ID, " _
                & " EMP_APPROVE2_ID=@EMP_APPROVE2_ID, " _
                & " EMP_APPROVE3_ID=@EMP_APPROVE3_ID, " _
                & " EMP_APPROVE4_ID=@EMP_APPROVE4_ID, " _
                & " Send_To_Board=@Send_To_Board, " _
                & " BOARD_ID=@BOARD_ID, " _
                & " RM_ID=@RM_ID, " _
                & " BRANCH_ID=@BRANCH_ID, " _
                & " DEP_ID=@DEP_ID, " _
                 & " Flag=@Flag, " _
                & " REGION_ID=@REGION_ID, " _
                & " Others=@Others, " _
                & " Others2=@Others2, " _
                & " Result=@Result, " _
                & " Comment=@Comment, " _
                & " CM_Judgement=@CM_Judgement, " _
                & " CM_Judgement_Board=@CM_Judgement_Board, " _
                & " CM_Remark=@CM_Remark, " _
                & " Job_Type_Id=@Job_Type_Id, " _
                & " SME_Referral_No=@SME_Referral_No " _
                & " WHERE ID=@ID "

            Dim sqlCmd As New SqlCommand(sql, conn)
            sqlCmd.Prepare()

            sqlCmd.Parameters.AddWithValue("@ID", objAnnalsCredit.ID)
            sqlCmd.Parameters.AddWithValue("@ANNALS_TYPE", objAnnalsCredit.ANNALS_TYPE)
            sqlCmd.Parameters.AddWithValue("@ANNALS_SEQ_NO", objAnnalsCredit.ANNALS_SEQ_NO)
            sqlCmd.Parameters.AddWithValue("@ANNALS_YEAR", objAnnalsCredit.ANNALS_YEAR)
            sqlCmd.Parameters.AddWithValue("@ID_OUT", objAnnalsCredit.ID_OUT)
            sqlCmd.Parameters.AddWithValue("@EMP_APPROVE_ID", objAnnalsCredit.EMP_APPROVE_ID)
            sqlCmd.Parameters.AddWithValue("@EMP_REQUEST_ID", objAnnalsCredit.EMP_REQUEST_ID)
            sqlCmd.Parameters.AddWithValue("@EMP_APPROVE2_ID", objAnnalsCredit.EMP_APPROVE2_ID)
            sqlCmd.Parameters.AddWithValue("@EMP_APPROVE3_ID", objAnnalsCredit.EMP_APPROVE3_ID)  '  28/07/2009
            sqlCmd.Parameters.AddWithValue("@EMP_APPROVE4_ID", objAnnalsCredit.EMP_APPROVE4_ID)
            sqlCmd.Parameters.AddWithValue("@Send_To_Board", objAnnalsCredit.Send_To_Board)
            sqlCmd.Parameters.AddWithValue("@BOARD_ID", objAnnalsCredit.BOARD_ID)
            sqlCmd.Parameters.AddWithValue("@RM_ID", objAnnalsCredit.RM_ID)
            sqlCmd.Parameters.AddWithValue("@BRANCH_ID", objAnnalsCredit.BRANCH_ID)
            sqlCmd.Parameters.AddWithValue("@DEP_ID", objAnnalsCredit.DEP_ID)
            sqlCmd.Parameters.AddWithValue("@Flag", objAnnalsCredit.Flag)
            sqlCmd.Parameters.AddWithValue("@REGION_ID", objAnnalsCredit.REGION_ID)
            sqlCmd.Parameters.AddWithValue("@Others", objAnnalsCredit.Others)
            sqlCmd.Parameters.AddWithValue("@Others2", objAnnalsCredit.Others2)
            sqlCmd.Parameters.AddWithValue("@Result", objAnnalsCredit.Result)
            sqlCmd.Parameters.AddWithValue("@Comment", objAnnalsCredit.Comment)
            sqlCmd.Parameters.AddWithValue("@CM_Judgement", objAnnalsCredit.CMJudgement)
            sqlCmd.Parameters.AddWithValue("@CM_Judgement_Board", objAnnalsCredit.CMJudgementBoard)
            sqlCmd.Parameters.AddWithValue("@CM_Remark", objAnnalsCredit.CMRemark)
            sqlCmd.Parameters.AddWithValue("@Job_Type_Id", objAnnalsCredit.Job_Type_Id)
            sqlCmd.Parameters.AddWithValue("@SME_Referral_No", objAnnalsCredit.SME_Referral_No)

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

    Public Sub deleteAnnalsCredit(ByVal objAnnalsCredit As AnnalsCredit)

        'declare connection
        Dim conn As SqlConnection = Nothing

        Try
            conn = ConnectionUtil.getSqlConnectionFromWebConfig()
            Dim sql As String = "DELETE FROM ANNALS_CREDIT WHERE ID=@ID"

            Dim sqlCmd As New SqlCommand(sql, conn)
            sqlCmd.Prepare()

            sqlCmd.Parameters.AddWithValue("@ID", objAnnalsCredit.ID)

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
    Public Sub deleteAnnalsCredit(ByVal ID As String)

        'declare connection
        Dim conn As SqlConnection = Nothing

        Try
            conn = ConnectionUtil.getSqlConnectionFromWebConfig()
            Dim sql As String = "DELETE FROM ANNALS_CREDIT WHERE ID=@ID"

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
    Public Sub cancelAnnalsCredit(ByVal ID As String, ByVal Subject As String, ByVal Detail As String)

        'declare connection
        Dim conn As SqlConnection = Nothing

        Try
            conn = ConnectionUtil.getSqlConnectionFromWebConfig()

            Dim sqlCmd As New SqlCommand("Annals_Credit_Change_To_Annals_CA", conn)
            sqlCmd.CommandType = CommandType.StoredProcedure

            sqlCmd.Prepare()

            sqlCmd.Parameters.AddWithValue("@AnnalsID", ID)
            sqlCmd.Parameters.AddWithValue("@SUBJECT", Subject)
            sqlCmd.Parameters.AddWithValue("@DETAIL", Detail)

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
    Public Function bindingAnnalsCredit(ByVal reader As SqlDataReader) As AnnalsCredit

        Dim objAnnalsCredit As New AnnalsCredit

        objAnnalsCredit.ID = CType(ConvertUtil.getObjectValue(reader("ID"), ConvertUtil.ObjectValueEnum.StringValue), String)
        objAnnalsCredit.ANNALS_TYPE = CType(ConvertUtil.getObjectValue(reader("ANNALS_TYPE"), ConvertUtil.ObjectValueEnum.StringValue), String)
        objAnnalsCredit.ANNALS_SEQ_NO = CType(ConvertUtil.getObjectValue(reader("ANNALS_SEQ_NO"), ConvertUtil.ObjectValueEnum.StringValue), String)
        objAnnalsCredit.ANNALS_YEAR = CType(ConvertUtil.getObjectValue(reader("ANNALS_YEAR"), ConvertUtil.ObjectValueEnum.StringValue), String)
        objAnnalsCredit.ID_OUT = CType(ConvertUtil.getObjectValue(reader("ID_OUT"), ConvertUtil.ObjectValueEnum.StringValue), String)
        objAnnalsCredit.EMP_APPROVE_ID = CType(ConvertUtil.getObjectValue(reader("EMP_APPROVE_ID"), ConvertUtil.ObjectValueEnum.StringValue), String)
        objAnnalsCredit.EMP_REQUEST_ID = CType(ConvertUtil.getObjectValue(reader("EMP_REQUEST_ID"), ConvertUtil.ObjectValueEnum.StringValue), String)
        objAnnalsCredit.EMP_APPROVE2_ID = CType(ConvertUtil.getObjectValue(reader("EMP_APPROVE2_ID"), ConvertUtil.ObjectValueEnum.StringValue), String)
        objAnnalsCredit.Send_To_Board = CType(ConvertUtil.getObjectValue(reader("Send_To_Board"), ConvertUtil.ObjectValueEnum.StringValue), String)
        objAnnalsCredit.BOARD_ID = CType(ConvertUtil.getObjectValue(reader("BOARD_ID"), ConvertUtil.ObjectValueEnum.StringValue), String)
        objAnnalsCredit.RM_ID = CType(ConvertUtil.getObjectValue(reader("RM_ID"), ConvertUtil.ObjectValueEnum.StringValue), String)
        objAnnalsCredit.BRANCH_ID = CType(ConvertUtil.getObjectValue(reader("BRANCH_ID"), ConvertUtil.ObjectValueEnum.StringValue), String)
        objAnnalsCredit.DEP_ID = CType(ConvertUtil.getObjectValue(reader("DEP_ID"), ConvertUtil.ObjectValueEnum.StringValue), String)
        objAnnalsCredit.Flag = CType(ConvertUtil.getObjectValue(reader("Flag"), ConvertUtil.ObjectValueEnum.StringValue), String)
        objAnnalsCredit.REGION_ID = CType(ConvertUtil.getObjectValue(reader("REGION_ID"), ConvertUtil.ObjectValueEnum.StringValue), String)
        objAnnalsCredit.Others = CType(ConvertUtil.getObjectValue(reader("Others"), ConvertUtil.ObjectValueEnum.StringValue), String)
        objAnnalsCredit.Others2 = CType(ConvertUtil.getObjectValue(reader("Others2"), ConvertUtil.ObjectValueEnum.StringValue), String)
        objAnnalsCredit.Result = CType(ConvertUtil.getObjectValue(reader("Result"), ConvertUtil.ObjectValueEnum.StringValue), String)
        objAnnalsCredit.Comment = CType(ConvertUtil.getObjectValue(reader("Comment"), ConvertUtil.ObjectValueEnum.StringValue), String)
        objAnnalsCredit.CMJudgement = CType(ConvertUtil.getObjectValue(reader("CM_Judgement"), ConvertUtil.ObjectValueEnum.StringValue), String)
        objAnnalsCredit.CMJudgementBoard = CType(ConvertUtil.getObjectValue(reader("CM_Judgement_Board"), ConvertUtil.ObjectValueEnum.StringValue), String)
        objAnnalsCredit.CMRemark = CType(ConvertUtil.getObjectValue(reader("CM_Remark"), ConvertUtil.ObjectValueEnum.StringValue), String)
        objAnnalsCredit.Reason = CType(ConvertUtil.getObjectValue(reader("Reason"), ConvertUtil.ObjectValueEnum.StringValue), String)
        objAnnalsCredit.Reason2 = CType(ConvertUtil.getObjectValue(reader("Reason2"), ConvertUtil.ObjectValueEnum.StringValue), String)
        objAnnalsCredit.Job_Type_Id = CType(ConvertUtil.getObjectValue(reader("Job_Type_Id"), ConvertUtil.ObjectValueEnum.StringValue), String)
        objAnnalsCredit.SME_Referral_No = CType(ConvertUtil.getObjectValue(reader("SME_Referral_No"), ConvertUtil.ObjectValueEnum.StringValue), String)
        objAnnalsCredit.Customer_Size = CType(ConvertUtil.getObjectValue(reader("Customer_Size"), ConvertUtil.ObjectValueEnum.StringValue), String)
        objAnnalsCredit.EMP_APPROVE3_ID = CType(ConvertUtil.getObjectValue(reader("EMP_APPROVE3_ID"), ConvertUtil.ObjectValueEnum.StringValue), String)
        objAnnalsCredit.EMP_APPROVE4_ID = CType(ConvertUtil.getObjectValue(reader("EMP_APPROVE4_ID"), ConvertUtil.ObjectValueEnum.StringValue), String)
        objAnnalsCredit.COVENANT_FLAG = CType(ConvertUtil.getObjectValue(reader("COVENANT_FLAG"), ConvertUtil.ObjectValueEnum.StringValue), String)
        objAnnalsCredit.DO_KFS_FLAG = CType(ConvertUtil.getObjectValue(reader("DO_KFS_FLAG"), ConvertUtil.ObjectValueEnum.StringValue), String)
        objAnnalsCredit.SUB_COMMITTEE_1 = CType(ConvertUtil.getObjectValue(reader("SUB_COMMITTEE_1"), ConvertUtil.ObjectValueEnum.StringValue), String)
        objAnnalsCredit.SUB_COMMITTEE_2 = CType(ConvertUtil.getObjectValue(reader("SUB_COMMITTEE_2"), ConvertUtil.ObjectValueEnum.StringValue), String)
        objAnnalsCredit.SUB_COMMITTEE_3 = CType(ConvertUtil.getObjectValue(reader("SUB_COMMITTEE_3"), ConvertUtil.ObjectValueEnum.StringValue), String)
        objAnnalsCredit.OUT_OF_SCOPE_ID = CType(ConvertUtil.getObjectValue(reader("OUT_OF_SCOPE_ID"), ConvertUtil.ObjectValueEnum.StringValue), String)
        If IsDBNull(reader("GROUP_EXPOSURE")) = False Then
            objAnnalsCredit.GROUP_EXPOSURE = CType(ConvertUtil.getObjectValue(reader("GROUP_EXPOSURE"), ConvertUtil.ObjectValueEnum.DoubleValue), Decimal)
            ' MsgBox(objAnnalsCredit.GROUP_EXPOSURE)
        Else
            objAnnalsCredit.GROUP_EXPOSURE = -1
        End If
        If IsDBNull(reader("REVIEW_DATE")) = False Then
            objAnnalsCredit.REVIEW_DATE = CType(ConvertUtil.getObjectValue(reader("REVIEW_DATE"), ConvertUtil.ObjectValueEnum.DateValue), Date)
            ' MsgBox(objAnnalsCredit.GROUP_EXPOSURE)
        Else
            objAnnalsCredit.REVIEW_DATE = Nothing
        End If
        objAnnalsCredit.EMP_CONTROL = CType(ConvertUtil.getObjectValue(reader("EMP_CONTROL"), ConvertUtil.ObjectValueEnum.StringValue), String)
        If IsDBNull(reader("IS_FLOOD")) = False Then
            objAnnalsCredit.IS_FLOOD = CType(ConvertUtil.getObjectValue(reader("IS_FLOOD"), ConvertUtil.ObjectValueEnum.NumbericValue), Integer)
        Else
            objAnnalsCredit.IS_FLOOD = -1
        End If

        Return objAnnalsCredit

    End Function

End Class