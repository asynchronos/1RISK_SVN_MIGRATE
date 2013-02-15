Option Explicit On
Option Strict On

Imports Microsoft.VisualBasic
Imports System.Data
Imports System.Data.SqlClient
Imports System.Diagnostics
Imports System.Collections.Generic

Public Class TbCustomerRiskDAL

    Private Shared className As String = "TbCustomerRiskDAL"

#Region "Custom Code"
    Public Function getAllTbCustomerRiskBySQL(ByVal sql As String) As List(Of TbCustomerRisk)

        'declare connection
        Dim conn As SqlConnection = Nothing
        'declare result
        Dim result As New List(Of TbCustomerRisk)

        Try
            conn = ConnectionUtil.getSqlConnectionFromWebConfig()
            Dim sqlCmd As New SqlCommand(sql, conn)
            sqlCmd.Prepare()

            Dim reader As SqlDataReader = sqlCmd.ExecuteReader()

            While reader.Read()
                result.Add(bindingTbCustomerRisk(reader))
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

    Public Function getCustomerByFilter(ByVal fieldName As String, ByVal value As String, _
                        ByVal currentPage As Integer, ByVal pageSize As Integer) As Hashtable

        'declare connection
        Dim conn As SqlConnection = Nothing
        'declare result
        Dim result As New Hashtable()
        Dim rows As New ArrayList()

        Try
            conn = ConnectionUtil.getSqlConnectionFromWebConfig()

            Dim sqlCmd As New SqlCommand("Customer_Search", conn)
            sqlCmd.CommandType = CommandType.StoredProcedure

            'Create a SqlParameter object to hold the output parameter value
            Dim totalRecords As New SqlParameter("@TOTAL_RECORDS", SqlDbType.Int)

            'IMPORTANT - must set Direction as ReturnValue
            totalRecords.Direction = ParameterDirection.InputOutput
            totalRecords.Value = 0

            'Finally, add the parameter to the Command's Parameters collection
            sqlCmd.Parameters.Add(totalRecords)

            'Add other parameter
            sqlCmd.Parameters.AddWithValue("@CURRENT_PAGE", currentPage)
            sqlCmd.Parameters.AddWithValue("@PAGE_SIZE", pageSize)
            sqlCmd.Parameters.AddWithValue("@FIELDNAME", fieldName)
            sqlCmd.Parameters.AddWithValue("@VALUE", value)

            Dim reader As SqlDataReader = sqlCmd.ExecuteReader()

            While reader.Read()
                Dim objTbCustomerRisk As New TbCustomerRisk

                objTbCustomerRisk.Cif = CType(ConvertUtil.getObjectValue(reader("Cif"), ConvertUtil.ObjectValueEnum.NumbericValue), Integer)
                objTbCustomerRisk.Name = CType(ConvertUtil.getObjectValue(reader("Name"), ConvertUtil.ObjectValueEnum.StringValue), String)

                rows.Add(objTbCustomerRisk)
            End While

            While reader.NextResult()

            End While

            'Next Result เป็น False ถึงจะ get output ได้
            Dim totalRow As Integer = CType(sqlCmd.Parameters("@TOTAL_RECORDS").Value, Integer)

            result.Add("TOTAL_ROW", totalRow)
            result.Add("ROWS", rows)

            reader.Close()
            conn.Close()
        Catch ex As Exception
            Throw New Exception(ex.Message & " : " & ex.StackTrace)
        Finally
            If (conn.State = ConnectionState.Open) Then
                conn.Close()
            End If
        End Try

        Return result
    End Function
#End Region

    Public Function getTbCustomerRiskByCif(ByVal objTbCustomerRisk As TbCustomerRisk) As TbCustomerRisk
        Return getTbCustomerRiskByCif(objTbCustomerRisk.Cif)
    End Function

    Public Function getTbCustomerRiskByCif(ByVal Cif As Integer) As TbCustomerRisk

        'declare connection
        Dim conn As SqlConnection = Nothing
        'declare result
        Dim result As New TbCustomerRisk()

        Try
            conn = ConnectionUtil.getSqlConnectionFromWebConfig()
            Dim sql As String = "SELECT " _
             & "Cif, Name, BOTID, GECustSize, " _
             & "GLGroup, PDGroup, Rating, Busi_Type, " _
             & "Tdr, Date_Report, Branch, BranchMaxPrin, " _
             & "Dept, DEPT_APPV, DEPT_TRAN, Class, " _
             & "ClassE, AGING, NPL, Limit, " _
             & "PrinResv, PrincipalFull, PrincipalG, Principal, " _
             & "Cont, CCF1, Contingent, AccruFull, " _
             & "Accru, SuspOri, Susp, UNEARNPRIN, " _
             & "UNEARNINT, UNCLEAPRIN, UNCLEAINT, DEFER, " _
             & "UseValue, BAfterC, TdrLoss, Reserve, " _
             & "PVLOSS, ExtraResv, BaySpresv, Totresv, " _
             & "Olddef_Exc, ResvExc, Coll_IAS39, ResvColIAS, " _
             & "Full_IAS39, ResvFull, BotClass, AddResv, " _
             & "BotColl, CUS_DEPT_FLAG, CUS_DEPT_TRAN, OFFICR_ID, " _
             & "NPLFLAG, StatusPAY, Affiliate, IMPORT_DATE " _
             & "FROM TB_CUSTOMER_RISK " _
             & "WHERE Cif=@Cif " _
             & "ORDER BY Cif"

            Dim sqlCmd As New SqlCommand(sql, conn)
            sqlCmd.Prepare()

            sqlCmd.Parameters.AddWithValue("@Cif", Cif)

            Dim reader As SqlDataReader = sqlCmd.ExecuteReader()

            While reader.Read()
                result = bindingTbCustomerRisk(reader)
            End While

            reader.Close()
        Catch ex As Exception
            Throw New Exception(ex.Message & " : " & ex.StackTrace)
        Finally
            'close connction & set to Nothing
            Try
                conn.Close()
            Catch ignore As Exception

            End Try
            conn = Nothing
        End Try

        Return result

    End Function

    Public Function getAllTbCustomerRisk() As List(Of TbCustomerRisk)

        'declare connection
        Dim conn As SqlConnection = Nothing
        'declare result
        Dim result As New List(Of TbCustomerRisk)

        Try
            conn = ConnectionUtil.getSqlConnectionFromWebConfig()
            Dim sql As String = "SELECT " _
             & "Cif, Name, BOTID, GECustSize, " _
             & "GLGroup, PDGroup, Rating, Busi_Type, " _
             & "Tdr, Date_Report, Branch, BranchMaxPrin, " _
             & "Dept, DEPT_APPV, DEPT_TRAN, Class, " _
             & "ClassE, AGING, NPL, Limit, " _
             & "PrinResv, PrincipalFull, PrincipalG, Principal, " _
             & "Cont, CCF1, Contingent, AccruFull, " _
             & "Accru, SuspOri, Susp, UNEARNPRIN, " _
             & "UNEARNINT, UNCLEAPRIN, UNCLEAINT, DEFER, " _
             & "UseValue, BAfterC, TdrLoss, Reserve, " _
             & "PVLOSS, ExtraResv, BaySpresv, Totresv, " _
             & "Olddef_Exc, ResvExc, Coll_IAS39, ResvColIAS, " _
             & "Full_IAS39, ResvFull, BotClass, AddResv, " _
             & "BotColl, CUS_DEPT_FLAG, CUS_DEPT_TRAN, OFFICR_ID, " _
             & "NPLFLAG, StatusPAY, Affiliate, IMPORT_DATE " _
             & "FROM TB_CUSTOMER_RISK " _
             & "ORDER BY Cif"

            Dim sqlCmd As New SqlCommand(sql, conn)
            sqlCmd.Prepare()

            Dim reader As SqlDataReader = sqlCmd.ExecuteReader()

            While reader.Read()
                result.Add(bindingTbCustomerRisk(reader))
            End While

            reader.Close()
        Catch ex As Exception
            Throw New Exception(ex.Message & " : " & ex.StackTrace)
        Finally
            'close connction & set to Nothing
            Try
                conn.Close()
            Catch ignore As Exception

            End Try
            conn = Nothing
        End Try

        Return result

    End Function

    Public Sub insertTbCustomerRisk(ByVal objTbCustomerRisk As TbCustomerRisk)

        'declare connection
        Dim conn As SqlConnection = Nothing

        Try
            conn = ConnectionUtil.getSqlConnectionFromWebConfig()
            Dim sql As String = "INSERT INTO TB_CUSTOMER_RISK " _
                & " (Cif, Name, BOTID, GECustSize, GLGroup, PDGroup, Rating, Busi_Type, Tdr, Date_Report, Branch, BranchMaxPrin, Dept, DEPT_APPV, DEPT_TRAN, Class, ClassE, AGING, NPL, Limit, PrinResv, PrincipalFull, PrincipalG, Principal, Cont, CCF1, Contingent, AccruFull, Accru, SuspOri, Susp, UNEARNPRIN, UNEARNINT, UNCLEAPRIN, UNCLEAINT, DEFER, UseValue, BAfterC, TdrLoss, Reserve, PVLOSS, ExtraResv, BaySpresv, Totresv, Olddef_Exc, ResvExc, Coll_IAS39, ResvColIAS, Full_IAS39, ResvFull, BotClass, AddResv, BotColl, CUS_DEPT_FLAG, CUS_DEPT_TRAN, OFFICR_ID, NPLFLAG, StatusPAY, Affiliate, IMPORT_DATE) " _
                & " VALUES(@Cif, @Name, @BOTID, @GECustSize, @GLGroup, @PDGroup, @Rating, @Busi_Type, @Tdr, @Date_Report, @Branch, @BranchMaxPrin, @Dept, @DEPT_APPV, @DEPT_TRAN, @Class, @ClassE, @AGING, @NPL, @Limit, @PrinResv, @PrincipalFull, @PrincipalG, @Principal, @Cont, @CCF1, @Contingent, @AccruFull, @Accru, @SuspOri, @Susp, @UNEARNPRIN, @UNEARNINT, @UNCLEAPRIN, @UNCLEAINT, @DEFER, @UseValue, @BAfterC, @TdrLoss, @Reserve, @PVLOSS, @ExtraResv, @BaySpresv, @Totresv, @Olddef_Exc, @ResvExc, @Coll_IAS39, @ResvColIAS, @Full_IAS39, @ResvFull, @BotClass, @AddResv, @BotColl, @CUS_DEPT_FLAG, @CUS_DEPT_TRAN, @OFFICR_ID, @NPLFLAG, @StatusPAY, @Affiliate, @IMPORT_DATE) "

            Dim sqlCmd As New SqlCommand(sql, conn)
            sqlCmd.Prepare()

            sqlCmd.Parameters.AddWithValue("@Cif", objTbCustomerRisk.Cif)
            sqlCmd.Parameters.AddWithValue("@Name", objTbCustomerRisk.Name)
            sqlCmd.Parameters.AddWithValue("@BOTID", objTbCustomerRisk.BOTID)
            sqlCmd.Parameters.AddWithValue("@GECustSize", objTbCustomerRisk.GECustSize)
            sqlCmd.Parameters.AddWithValue("@GLGroup", objTbCustomerRisk.GLGroup)
            sqlCmd.Parameters.AddWithValue("@PDGroup", objTbCustomerRisk.PDGroup)
            sqlCmd.Parameters.AddWithValue("@Rating", objTbCustomerRisk.Rating)
            sqlCmd.Parameters.AddWithValue("@Busi_Type", objTbCustomerRisk.Busi_Type)
            sqlCmd.Parameters.AddWithValue("@Tdr", objTbCustomerRisk.Tdr)
            sqlCmd.Parameters.AddWithValue("@Date_Report", objTbCustomerRisk.Date_Report)
            sqlCmd.Parameters.AddWithValue("@Branch", objTbCustomerRisk.Branch)
            sqlCmd.Parameters.AddWithValue("@BranchMaxPrin", objTbCustomerRisk.BranchMaxPrin)
            sqlCmd.Parameters.AddWithValue("@Dept", objTbCustomerRisk.Dept)
            sqlCmd.Parameters.AddWithValue("@DEPT_APPV", objTbCustomerRisk.DEPT_APPV)
            sqlCmd.Parameters.AddWithValue("@DEPT_TRAN", objTbCustomerRisk.DEPT_TRAN)
            sqlCmd.Parameters.AddWithValue("@Class", objTbCustomerRisk.ClassDebt)
            sqlCmd.Parameters.AddWithValue("@ClassE", objTbCustomerRisk.ClassE)
            sqlCmd.Parameters.AddWithValue("@AGING", objTbCustomerRisk.AGING)
            sqlCmd.Parameters.AddWithValue("@NPL", objTbCustomerRisk.NPL)
            sqlCmd.Parameters.AddWithValue("@Limit", objTbCustomerRisk.Limit)
            sqlCmd.Parameters.AddWithValue("@PrinResv", objTbCustomerRisk.PrinResv)
            sqlCmd.Parameters.AddWithValue("@PrincipalFull", objTbCustomerRisk.PrincipalFull)
            sqlCmd.Parameters.AddWithValue("@PrincipalG", objTbCustomerRisk.PrincipalG)
            sqlCmd.Parameters.AddWithValue("@Principal", objTbCustomerRisk.Principal)
            sqlCmd.Parameters.AddWithValue("@Cont", objTbCustomerRisk.Cont)
            sqlCmd.Parameters.AddWithValue("@CCF1", objTbCustomerRisk.CCF1)
            sqlCmd.Parameters.AddWithValue("@Contingent", objTbCustomerRisk.Contingent)
            sqlCmd.Parameters.AddWithValue("@AccruFull", objTbCustomerRisk.AccruFull)
            sqlCmd.Parameters.AddWithValue("@Accru", objTbCustomerRisk.Accru)
            sqlCmd.Parameters.AddWithValue("@SuspOri", objTbCustomerRisk.SuspOri)
            sqlCmd.Parameters.AddWithValue("@Susp", objTbCustomerRisk.Susp)
            sqlCmd.Parameters.AddWithValue("@UNEARNPRIN", objTbCustomerRisk.UNEARNPRIN)
            sqlCmd.Parameters.AddWithValue("@UNEARNINT", objTbCustomerRisk.UNEARNINT)
            sqlCmd.Parameters.AddWithValue("@UNCLEAPRIN", objTbCustomerRisk.UNCLEAPRIN)
            sqlCmd.Parameters.AddWithValue("@UNCLEAINT", objTbCustomerRisk.UNCLEAINT)
            sqlCmd.Parameters.AddWithValue("@DEFER", objTbCustomerRisk.DEFER)
            sqlCmd.Parameters.AddWithValue("@UseValue", objTbCustomerRisk.UseValue)
            sqlCmd.Parameters.AddWithValue("@BAfterC", objTbCustomerRisk.BAfterC)
            sqlCmd.Parameters.AddWithValue("@TdrLoss", objTbCustomerRisk.TdrLoss)
            sqlCmd.Parameters.AddWithValue("@Reserve", objTbCustomerRisk.Reserve)
            sqlCmd.Parameters.AddWithValue("@PVLOSS", objTbCustomerRisk.PVLOSS)
            sqlCmd.Parameters.AddWithValue("@ExtraResv", objTbCustomerRisk.ExtraResv)
            sqlCmd.Parameters.AddWithValue("@BaySpresv", objTbCustomerRisk.BaySpresv)
            sqlCmd.Parameters.AddWithValue("@Totresv", objTbCustomerRisk.Totresv)
            sqlCmd.Parameters.AddWithValue("@Olddef_Exc", objTbCustomerRisk.Olddef_Exc)
            sqlCmd.Parameters.AddWithValue("@ResvExc", objTbCustomerRisk.ResvExc)
            sqlCmd.Parameters.AddWithValue("@Coll_IAS39", objTbCustomerRisk.Coll_IAS39)
            sqlCmd.Parameters.AddWithValue("@ResvColIAS", objTbCustomerRisk.ResvColIAS)
            sqlCmd.Parameters.AddWithValue("@Full_IAS39", objTbCustomerRisk.Full_IAS39)
            sqlCmd.Parameters.AddWithValue("@ResvFull", objTbCustomerRisk.ResvFull)
            sqlCmd.Parameters.AddWithValue("@BotClass", objTbCustomerRisk.BotClass)
            sqlCmd.Parameters.AddWithValue("@AddResv", objTbCustomerRisk.AddResv)
            sqlCmd.Parameters.AddWithValue("@BotColl", objTbCustomerRisk.BotColl)
            sqlCmd.Parameters.AddWithValue("@CUS_DEPT_FLAG", objTbCustomerRisk.CUS_DEPT_FLAG)
            sqlCmd.Parameters.AddWithValue("@CUS_DEPT_TRAN", objTbCustomerRisk.CUS_DEPT_TRAN)
            sqlCmd.Parameters.AddWithValue("@OFFICR_ID", objTbCustomerRisk.OFFICR_ID)
            sqlCmd.Parameters.AddWithValue("@NPLFLAG", objTbCustomerRisk.NPLFLAG)
            sqlCmd.Parameters.AddWithValue("@StatusPAY", objTbCustomerRisk.StatusPAY)
            sqlCmd.Parameters.AddWithValue("@Affiliate", objTbCustomerRisk.Affiliate)
            sqlCmd.Parameters.AddWithValue("@IMPORT_DATE", objTbCustomerRisk.IMPORT_DATE)

            sqlCmd.ExecuteNonQuery()
        Catch ex As Exception
            Throw New Exception(ex.Message & " : " & ex.StackTrace)
        Finally
            'close connction & set to Nothing
            Try
                conn.Close()
            Catch ignore As Exception

            End Try
            conn = Nothing
        End Try

    End Sub

    Public Sub updateTbCustomerRisk(ByVal objTbCustomerRisk As TbCustomerRisk)

        'declare connection
        Dim conn As SqlConnection = Nothing

        Try
            conn = ConnectionUtil.getSqlConnectionFromWebConfig()
            Dim sql As String = "UPDATE TB_CUSTOMER_RISK SET " _
                & " Name=@Name, " _
                & " BOTID=@BOTID, " _
                & " GECustSize=@GECustSize, " _
                & " GLGroup=@GLGroup, " _
                & " PDGroup=@PDGroup, " _
                & " Rating=@Rating, " _
                & " Busi_Type=@Busi_Type, " _
                & " Tdr=@Tdr, " _
                & " Date_Report=@Date_Report, " _
                & " Branch=@Branch, " _
                & " BranchMaxPrin=@BranchMaxPrin, " _
                & " Dept=@Dept, " _
                & " DEPT_APPV=@DEPT_APPV, " _
                & " DEPT_TRAN=@DEPT_TRAN, " _
                & " Class=@Class, " _
                & " ClassE=@ClassE, " _
                & " AGING=@AGING, " _
                & " NPL=@NPL, " _
                & " Limit=@Limit, " _
                & " PrinResv=@PrinResv, " _
                & " PrincipalFull=@PrincipalFull, " _
                & " PrincipalG=@PrincipalG, " _
                & " Principal=@Principal, " _
                & " Cont=@Cont, " _
                & " CCF1=@CCF1, " _
                & " Contingent=@Contingent, " _
                & " AccruFull=@AccruFull, " _
                & " Accru=@Accru, " _
                & " SuspOri=@SuspOri, " _
                & " Susp=@Susp, " _
                & " UNEARNPRIN=@UNEARNPRIN, " _
                & " UNEARNINT=@UNEARNINT, " _
                & " UNCLEAPRIN=@UNCLEAPRIN, " _
                & " UNCLEAINT=@UNCLEAINT, " _
                & " DEFER=@DEFER, " _
                & " UseValue=@UseValue, " _
                & " BAfterC=@BAfterC, " _
                & " TdrLoss=@TdrLoss, " _
                & " Reserve=@Reserve, " _
                & " PVLOSS=@PVLOSS, " _
                & " ExtraResv=@ExtraResv, " _
                & " BaySpresv=@BaySpresv, " _
                & " Totresv=@Totresv, " _
                & " Olddef_Exc=@Olddef_Exc, " _
                & " ResvExc=@ResvExc, " _
                & " Coll_IAS39=@Coll_IAS39, " _
                & " ResvColIAS=@ResvColIAS, " _
                & " Full_IAS39=@Full_IAS39, " _
                & " ResvFull=@ResvFull, " _
                & " BotClass=@BotClass, " _
                & " AddResv=@AddResv, " _
                & " BotColl=@BotColl, " _
                & " CUS_DEPT_FLAG=@CUS_DEPT_FLAG, " _
                & " CUS_DEPT_TRAN=@CUS_DEPT_TRAN, " _
                & " OFFICR_ID=@OFFICR_ID, " _
                & " NPLFLAG=@NPLFLAG, " _
                & " StatusPAY=@StatusPAY, " _
                & " Affiliate=@Affiliate, " _
                & " IMPORT_DATE=@IMPORT_DATE " _
                & " WHERE Cif=@Cif "

            Dim sqlCmd As New SqlCommand(sql, conn)
            sqlCmd.Prepare()

            sqlCmd.Parameters.AddWithValue("@Cif", objTbCustomerRisk.Cif)
            sqlCmd.Parameters.AddWithValue("@Name", objTbCustomerRisk.Name)
            sqlCmd.Parameters.AddWithValue("@BOTID", objTbCustomerRisk.BOTID)
            sqlCmd.Parameters.AddWithValue("@GECustSize", objTbCustomerRisk.GECustSize)
            sqlCmd.Parameters.AddWithValue("@GLGroup", objTbCustomerRisk.GLGroup)
            sqlCmd.Parameters.AddWithValue("@PDGroup", objTbCustomerRisk.PDGroup)
            sqlCmd.Parameters.AddWithValue("@Rating", objTbCustomerRisk.Rating)
            sqlCmd.Parameters.AddWithValue("@Busi_Type", objTbCustomerRisk.Busi_Type)
            sqlCmd.Parameters.AddWithValue("@Tdr", objTbCustomerRisk.Tdr)
            sqlCmd.Parameters.AddWithValue("@Date_Report", objTbCustomerRisk.Date_Report)
            sqlCmd.Parameters.AddWithValue("@Branch", objTbCustomerRisk.Branch)
            sqlCmd.Parameters.AddWithValue("@BranchMaxPrin", objTbCustomerRisk.BranchMaxPrin)
            sqlCmd.Parameters.AddWithValue("@Dept", objTbCustomerRisk.Dept)
            sqlCmd.Parameters.AddWithValue("@DEPT_APPV", objTbCustomerRisk.DEPT_APPV)
            sqlCmd.Parameters.AddWithValue("@DEPT_TRAN", objTbCustomerRisk.DEPT_TRAN)
            sqlCmd.Parameters.AddWithValue("@Class", objTbCustomerRisk.ClassDebt)
            sqlCmd.Parameters.AddWithValue("@ClassE", objTbCustomerRisk.ClassE)
            sqlCmd.Parameters.AddWithValue("@AGING", objTbCustomerRisk.AGING)
            sqlCmd.Parameters.AddWithValue("@NPL", objTbCustomerRisk.NPL)
            sqlCmd.Parameters.AddWithValue("@Limit", objTbCustomerRisk.Limit)
            sqlCmd.Parameters.AddWithValue("@PrinResv", objTbCustomerRisk.PrinResv)
            sqlCmd.Parameters.AddWithValue("@PrincipalFull", objTbCustomerRisk.PrincipalFull)
            sqlCmd.Parameters.AddWithValue("@PrincipalG", objTbCustomerRisk.PrincipalG)
            sqlCmd.Parameters.AddWithValue("@Principal", objTbCustomerRisk.Principal)
            sqlCmd.Parameters.AddWithValue("@Cont", objTbCustomerRisk.Cont)
            sqlCmd.Parameters.AddWithValue("@CCF1", objTbCustomerRisk.CCF1)
            sqlCmd.Parameters.AddWithValue("@Contingent", objTbCustomerRisk.Contingent)
            sqlCmd.Parameters.AddWithValue("@AccruFull", objTbCustomerRisk.AccruFull)
            sqlCmd.Parameters.AddWithValue("@Accru", objTbCustomerRisk.Accru)
            sqlCmd.Parameters.AddWithValue("@SuspOri", objTbCustomerRisk.SuspOri)
            sqlCmd.Parameters.AddWithValue("@Susp", objTbCustomerRisk.Susp)
            sqlCmd.Parameters.AddWithValue("@UNEARNPRIN", objTbCustomerRisk.UNEARNPRIN)
            sqlCmd.Parameters.AddWithValue("@UNEARNINT", objTbCustomerRisk.UNEARNINT)
            sqlCmd.Parameters.AddWithValue("@UNCLEAPRIN", objTbCustomerRisk.UNCLEAPRIN)
            sqlCmd.Parameters.AddWithValue("@UNCLEAINT", objTbCustomerRisk.UNCLEAINT)
            sqlCmd.Parameters.AddWithValue("@DEFER", objTbCustomerRisk.DEFER)
            sqlCmd.Parameters.AddWithValue("@UseValue", objTbCustomerRisk.UseValue)
            sqlCmd.Parameters.AddWithValue("@BAfterC", objTbCustomerRisk.BAfterC)
            sqlCmd.Parameters.AddWithValue("@TdrLoss", objTbCustomerRisk.TdrLoss)
            sqlCmd.Parameters.AddWithValue("@Reserve", objTbCustomerRisk.Reserve)
            sqlCmd.Parameters.AddWithValue("@PVLOSS", objTbCustomerRisk.PVLOSS)
            sqlCmd.Parameters.AddWithValue("@ExtraResv", objTbCustomerRisk.ExtraResv)
            sqlCmd.Parameters.AddWithValue("@BaySpresv", objTbCustomerRisk.BaySpresv)
            sqlCmd.Parameters.AddWithValue("@Totresv", objTbCustomerRisk.Totresv)
            sqlCmd.Parameters.AddWithValue("@Olddef_Exc", objTbCustomerRisk.Olddef_Exc)
            sqlCmd.Parameters.AddWithValue("@ResvExc", objTbCustomerRisk.ResvExc)
            sqlCmd.Parameters.AddWithValue("@Coll_IAS39", objTbCustomerRisk.Coll_IAS39)
            sqlCmd.Parameters.AddWithValue("@ResvColIAS", objTbCustomerRisk.ResvColIAS)
            sqlCmd.Parameters.AddWithValue("@Full_IAS39", objTbCustomerRisk.Full_IAS39)
            sqlCmd.Parameters.AddWithValue("@ResvFull", objTbCustomerRisk.ResvFull)
            sqlCmd.Parameters.AddWithValue("@BotClass", objTbCustomerRisk.BotClass)
            sqlCmd.Parameters.AddWithValue("@AddResv", objTbCustomerRisk.AddResv)
            sqlCmd.Parameters.AddWithValue("@BotColl", objTbCustomerRisk.BotColl)
            sqlCmd.Parameters.AddWithValue("@CUS_DEPT_FLAG", objTbCustomerRisk.CUS_DEPT_FLAG)
            sqlCmd.Parameters.AddWithValue("@CUS_DEPT_TRAN", objTbCustomerRisk.CUS_DEPT_TRAN)
            sqlCmd.Parameters.AddWithValue("@OFFICR_ID", objTbCustomerRisk.OFFICR_ID)
            sqlCmd.Parameters.AddWithValue("@NPLFLAG", objTbCustomerRisk.NPLFLAG)
            sqlCmd.Parameters.AddWithValue("@StatusPAY", objTbCustomerRisk.StatusPAY)
            sqlCmd.Parameters.AddWithValue("@Affiliate", objTbCustomerRisk.Affiliate)
            sqlCmd.Parameters.AddWithValue("@IMPORT_DATE", objTbCustomerRisk.IMPORT_DATE)

            sqlCmd.ExecuteNonQuery()
        Catch ex As Exception
            Throw New Exception(ex.Message & " : " & ex.StackTrace)
        Finally
            'close connction & set to Nothing
            Try
                conn.Close()
            Catch ignore As Exception

            End Try
            conn = Nothing
        End Try

    End Sub

    Public Sub deleteTbCustomerRisk(ByVal objTbCustomerRisk As TbCustomerRisk)
        deleteTbCustomerRisk(objTbCustomerRisk.Cif)
    End Sub

    Public Sub deleteTbCustomerRisk(ByVal Cif As Integer)

        'declare connection
        Dim conn As SqlConnection = Nothing

        Try
            conn = ConnectionUtil.getSqlConnectionFromWebConfig()
            Dim sql As String = "DELETE FROM TB_CUSTOMER_RISK WHERE Cif=@Cif"

            Dim sqlCmd As New SqlCommand(sql, conn)
            sqlCmd.Prepare()

            sqlCmd.Parameters.AddWithValue("@Cif", Cif)

            sqlCmd.ExecuteNonQuery()
        Catch ex As Exception
            Throw New Exception(ex.Message & " : " & ex.StackTrace)
        Finally
            'close connction & set to Nothing
            Try
                conn.Close()
            Catch ignore As Exception

            End Try
            conn = Nothing
        End Try

    End Sub

    Public Function bindingTbCustomerRisk(ByVal reader As SqlDataReader) As TbCustomerRisk

        Dim objTbCustomerRisk As New TbCustomerRisk

        objTbCustomerRisk.Cif = CType(ConvertUtil.getObjectValue(reader("Cif"), ConvertUtil.ObjectValueEnum.NumbericValue), Integer)
        objTbCustomerRisk.Name = CType(ConvertUtil.getObjectValue(reader("Name"), ConvertUtil.ObjectValueEnum.StringValue), String)
        objTbCustomerRisk.BOTID = CType(ConvertUtil.getObjectValue(reader("BOTID"), ConvertUtil.ObjectValueEnum.NumbericValue), Integer)
        objTbCustomerRisk.GECustSize = CType(ConvertUtil.getObjectValue(reader("GECustSize"), ConvertUtil.ObjectValueEnum.StringValue), String)
        objTbCustomerRisk.GLGroup = CType(ConvertUtil.getObjectValue(reader("GLGroup"), ConvertUtil.ObjectValueEnum.StringValue), String)
        objTbCustomerRisk.PDGroup = CType(ConvertUtil.getObjectValue(reader("PDGroup"), ConvertUtil.ObjectValueEnum.StringValue), String)
        objTbCustomerRisk.Rating = CType(ConvertUtil.getObjectValue(reader("Rating"), ConvertUtil.ObjectValueEnum.StringValue), String)
        objTbCustomerRisk.Busi_Type = CType(ConvertUtil.getObjectValue(reader("Busi_Type"), ConvertUtil.ObjectValueEnum.NumbericValue), Integer)
        objTbCustomerRisk.Tdr = CType(ConvertUtil.getObjectValue(reader("Tdr"), ConvertUtil.ObjectValueEnum.StringValue), String)
        objTbCustomerRisk.Date_Report = CType(ConvertUtil.getObjectValue(reader("Date_Report"), ConvertUtil.ObjectValueEnum.NumbericValue), Integer)
        objTbCustomerRisk.Branch = CType(ConvertUtil.getObjectValue(reader("Branch"), ConvertUtil.ObjectValueEnum.NumbericValue), Integer)
        objTbCustomerRisk.BranchMaxPrin = CType(ConvertUtil.getObjectValue(reader("BranchMaxPrin"), ConvertUtil.ObjectValueEnum.NumbericValue), Integer)
        objTbCustomerRisk.Dept = CType(ConvertUtil.getObjectValue(reader("Dept"), ConvertUtil.ObjectValueEnum.NumbericValue), Integer)
        objTbCustomerRisk.DEPT_APPV = CType(ConvertUtil.getObjectValue(reader("DEPT_APPV"), ConvertUtil.ObjectValueEnum.NumbericValue), Integer)
        objTbCustomerRisk.DEPT_TRAN = CType(ConvertUtil.getObjectValue(reader("DEPT_TRAN"), ConvertUtil.ObjectValueEnum.NumbericValue), Integer)
        objTbCustomerRisk.ClassDebt = CType(ConvertUtil.getObjectValue(reader("Class"), ConvertUtil.ObjectValueEnum.StringValue), String)
        objTbCustomerRisk.ClassE = CType(ConvertUtil.getObjectValue(reader("ClassE"), ConvertUtil.ObjectValueEnum.StringValue), String)
        objTbCustomerRisk.AGING = CType(ConvertUtil.getObjectValue(reader("AGING"), ConvertUtil.ObjectValueEnum.DoubleValue), Double)
        objTbCustomerRisk.NPL = CType(ConvertUtil.getObjectValue(reader("NPL"), ConvertUtil.ObjectValueEnum.DoubleValue), Double)
        objTbCustomerRisk.Limit = CType(ConvertUtil.getObjectValue(reader("Limit"), ConvertUtil.ObjectValueEnum.DoubleValue), Double)
        objTbCustomerRisk.PrinResv = CType(ConvertUtil.getObjectValue(reader("PrinResv"), ConvertUtil.ObjectValueEnum.DoubleValue), Double)
        objTbCustomerRisk.PrincipalFull = CType(ConvertUtil.getObjectValue(reader("PrincipalFull"), ConvertUtil.ObjectValueEnum.DoubleValue), Double)
        objTbCustomerRisk.PrincipalG = CType(ConvertUtil.getObjectValue(reader("PrincipalG"), ConvertUtil.ObjectValueEnum.StringValue), String)
        objTbCustomerRisk.Principal = CType(ConvertUtil.getObjectValue(reader("Principal"), ConvertUtil.ObjectValueEnum.DoubleValue), Double)
        objTbCustomerRisk.Cont = CType(ConvertUtil.getObjectValue(reader("Cont"), ConvertUtil.ObjectValueEnum.DoubleValue), Double)
        objTbCustomerRisk.CCF1 = CType(ConvertUtil.getObjectValue(reader("CCF1"), ConvertUtil.ObjectValueEnum.DoubleValue), Double)
        objTbCustomerRisk.Contingent = CType(ConvertUtil.getObjectValue(reader("Contingent"), ConvertUtil.ObjectValueEnum.DoubleValue), Double)
        objTbCustomerRisk.AccruFull = CType(ConvertUtil.getObjectValue(reader("AccruFull"), ConvertUtil.ObjectValueEnum.DoubleValue), Double)
        objTbCustomerRisk.Accru = CType(ConvertUtil.getObjectValue(reader("Accru"), ConvertUtil.ObjectValueEnum.DoubleValue), Double)
        objTbCustomerRisk.SuspOri = CType(ConvertUtil.getObjectValue(reader("SuspOri"), ConvertUtil.ObjectValueEnum.DoubleValue), Double)
        objTbCustomerRisk.Susp = CType(ConvertUtil.getObjectValue(reader("Susp"), ConvertUtil.ObjectValueEnum.DoubleValue), Double)
        objTbCustomerRisk.UNEARNPRIN = CType(ConvertUtil.getObjectValue(reader("UNEARNPRIN"), ConvertUtil.ObjectValueEnum.DoubleValue), Double)
        objTbCustomerRisk.UNEARNINT = CType(ConvertUtil.getObjectValue(reader("UNEARNINT"), ConvertUtil.ObjectValueEnum.DoubleValue), Double)
        objTbCustomerRisk.UNCLEAPRIN = CType(ConvertUtil.getObjectValue(reader("UNCLEAPRIN"), ConvertUtil.ObjectValueEnum.DoubleValue), Double)
        objTbCustomerRisk.UNCLEAINT = CType(ConvertUtil.getObjectValue(reader("UNCLEAINT"), ConvertUtil.ObjectValueEnum.DoubleValue), Double)
        objTbCustomerRisk.DEFER = CType(ConvertUtil.getObjectValue(reader("DEFER"), ConvertUtil.ObjectValueEnum.DoubleValue), Double)
        objTbCustomerRisk.UseValue = CType(ConvertUtil.getObjectValue(reader("UseValue"), ConvertUtil.ObjectValueEnum.DoubleValue), Double)
        objTbCustomerRisk.BAfterC = CType(ConvertUtil.getObjectValue(reader("BAfterC"), ConvertUtil.ObjectValueEnum.DoubleValue), Double)
        objTbCustomerRisk.TdrLoss = CType(ConvertUtil.getObjectValue(reader("TdrLoss"), ConvertUtil.ObjectValueEnum.DoubleValue), Double)
        objTbCustomerRisk.Reserve = CType(ConvertUtil.getObjectValue(reader("Reserve"), ConvertUtil.ObjectValueEnum.DoubleValue), Double)
        objTbCustomerRisk.PVLOSS = CType(ConvertUtil.getObjectValue(reader("PVLOSS"), ConvertUtil.ObjectValueEnum.DoubleValue), Double)
        objTbCustomerRisk.ExtraResv = CType(ConvertUtil.getObjectValue(reader("ExtraResv"), ConvertUtil.ObjectValueEnum.DoubleValue), Double)
        objTbCustomerRisk.BaySpresv = CType(ConvertUtil.getObjectValue(reader("BaySpresv"), ConvertUtil.ObjectValueEnum.DoubleValue), Double)
        objTbCustomerRisk.Totresv = CType(ConvertUtil.getObjectValue(reader("Totresv"), ConvertUtil.ObjectValueEnum.DoubleValue), Double)
        objTbCustomerRisk.Olddef_Exc = CType(ConvertUtil.getObjectValue(reader("Olddef_Exc"), ConvertUtil.ObjectValueEnum.DoubleValue), Double)
        objTbCustomerRisk.ResvExc = CType(ConvertUtil.getObjectValue(reader("ResvExc"), ConvertUtil.ObjectValueEnum.DoubleValue), Double)
        objTbCustomerRisk.Coll_IAS39 = CType(ConvertUtil.getObjectValue(reader("Coll_IAS39"), ConvertUtil.ObjectValueEnum.DoubleValue), Double)
        objTbCustomerRisk.ResvColIAS = CType(ConvertUtil.getObjectValue(reader("ResvColIAS"), ConvertUtil.ObjectValueEnum.DoubleValue), Double)
        objTbCustomerRisk.Full_IAS39 = CType(ConvertUtil.getObjectValue(reader("Full_IAS39"), ConvertUtil.ObjectValueEnum.DoubleValue), Double)
        objTbCustomerRisk.ResvFull = CType(ConvertUtil.getObjectValue(reader("ResvFull"), ConvertUtil.ObjectValueEnum.DoubleValue), Double)
        objTbCustomerRisk.BotClass = CType(ConvertUtil.getObjectValue(reader("BotClass"), ConvertUtil.ObjectValueEnum.StringValue), String)
        objTbCustomerRisk.AddResv = CType(ConvertUtil.getObjectValue(reader("AddResv"), ConvertUtil.ObjectValueEnum.DoubleValue), Double)
        objTbCustomerRisk.BotColl = CType(ConvertUtil.getObjectValue(reader("BotColl"), ConvertUtil.ObjectValueEnum.DoubleValue), Double)
        objTbCustomerRisk.CUS_DEPT_FLAG = CType(ConvertUtil.getObjectValue(reader("CUS_DEPT_FLAG"), ConvertUtil.ObjectValueEnum.NumbericValue), Integer)
        objTbCustomerRisk.CUS_DEPT_TRAN = CType(ConvertUtil.getObjectValue(reader("CUS_DEPT_TRAN"), ConvertUtil.ObjectValueEnum.NumbericValue), Integer)
        objTbCustomerRisk.OFFICR_ID = CType(ConvertUtil.getObjectValue(reader("OFFICR_ID"), ConvertUtil.ObjectValueEnum.NumbericValue), Integer)
        objTbCustomerRisk.NPLFLAG = CType(ConvertUtil.getObjectValue(reader("NPLFLAG"), ConvertUtil.ObjectValueEnum.BooleanValue), Boolean)
        objTbCustomerRisk.StatusPAY = CType(ConvertUtil.getObjectValue(reader("StatusPAY"), ConvertUtil.ObjectValueEnum.NumbericValue), Integer)
        objTbCustomerRisk.Affiliate = CType(ConvertUtil.getObjectValue(reader("Affiliate"), ConvertUtil.ObjectValueEnum.BooleanValue), Boolean)
        objTbCustomerRisk.IMPORT_DATE = CType(ConvertUtil.getObjectValue(reader("IMPORT_DATE"), ConvertUtil.ObjectValueEnum.DateValue), Date)

        Return objTbCustomerRisk

    End Function

End Class