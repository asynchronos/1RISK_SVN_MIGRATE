Option Explicit On
Option Strict On

Imports Microsoft.VisualBasic
Imports System.Data
Imports System.Data.SqlClient
Imports System.Diagnostics
Imports System.Collections.Generic
Public Class ScheduleDAL

	Private Shared className As String = "Schedule"

	Public Function getScheduleByID(ByVal objSchedule As Schedule) As Schedule

		'declare connection
		Dim conn As SqlConnection = Nothing
		'declare result
		Dim result As New Schedule()

		Try
			conn = ConnectionUtil.getSqlConnectionFromWebConfig()
			Dim sql As String = "SELECT * FROM TB_SCHEDULE WHERE ID=@ID ORDER BY ID"

			Dim sqlCmd As New SqlCommand(sql, conn)
			sqlCmd.Prepare()

			sqlCmd.Parameters.AddWithValue("@ID", objSchedule.ID)

			Dim reader As SqlDataReader = sqlCmd.ExecuteReader()

			While reader.Read()
				result = bindingSchedule(reader)
			End While
		Catch ex As Exception
			Throw New Exception(ex.Message & " : " & ex.StackTrace)
		Finally
			'close connction & set to Nothing
			conn.Close()
			conn = Nothing
		End Try

		Return result

	End Function

	Public Function getAllSchedule() As List (Of Schedule)

		'declare connection
		Dim conn As SqlConnection = Nothing
		'declare result
		Dim result As New List(Of Schedule)

		Try
			conn = ConnectionUtil.getSqlConnectionFromWebConfig()
			Dim sql As String = "SELECT * FROM TB_SCHEDULE ORDER BY ID"

			Dim sqlCmd As New SqlCommand(sql, conn)
			sqlCmd.Prepare()

			Dim reader As SqlDataReader = sqlCmd.ExecuteReader()

			While reader.Read()
				result.Add(bindingSchedule(reader))
			End While
		Catch ex As Exception
			Throw New Exception(ex.Message & " : " & ex.StackTrace)
		Finally
			'close connction & set to Nothing
			conn.Close()
			conn = Nothing
		End Try

		Return result

	End Function
    Public Function getAllScheduleBySQL(ByVal sql As String) As List(Of Schedule)

        'declare connection
        Dim conn As SqlConnection = Nothing
        'declare result
        Dim result As New List(Of Schedule)

        Try
            conn = ConnectionUtil.getSqlConnectionFromWebConfig()


            Dim sqlCmd As New SqlCommand(Sql, conn)
            sqlCmd.Prepare()

            Dim reader As SqlDataReader = sqlCmd.ExecuteReader()

            While reader.Read()
                result.Add(bindingSchedule(reader))
            End While
        Catch ex As Exception
            Throw New Exception(ex.Message & " : " & ex.StackTrace)
        Finally
            'close connction & set to Nothing
            conn.Close()
            conn = Nothing
        End Try

        Return result

    End Function
	Public Sub insertSchedule(ByVal objSchedule As Schedule)

		'declare connection
		Dim conn As SqlConnection = Nothing

		Try
			conn = ConnectionUtil.getSqlConnectionFromWebConfig()
            Dim sql As String = "INSERT INTO TB_SCHEDULE " _
                & " (SDate,TimeBegin,TimeEnd, Employee, PersonName, PersonDep, PersonTel, Risk, RiskName, RiskTeam, RiskTel, Objective, Cif, CifName, ID_Branch, Depbranch, Location, Days, Rest, Office_chk, Home_chk, Shop_chk, Fac_chk, Col_chk, Other_chk, Attach_File, TranDate, UserName, IP) " _
                & " VALUES(@SDate,@TimeBegin,@TimeEnd, @Employee, @PersonName, @PersonDep, @PersonTel, @Risk, @RiskName, @RiskTeam, @RiskTel, @Objective, @Cif, @CifName, @ID_Branch, @Depbranch, @Location, @Days, @Rest, @Office_chk, @Home_chk, @Shop_chk, @Fac_chk, @Col_chk, @Other_chk, @Attach_File, @TranDate, @UserName, @IP) "

			Dim sqlCmd As New SqlCommand(sql, conn)
			sqlCmd.Prepare()

			sqlCmd.Parameters.AddWithValue("@ID", objSchedule.ID)
			sqlCmd.Parameters.AddWithValue("@SDate", objSchedule.SDate)
            sqlCmd.Parameters.AddWithValue("@TimeBegin", objSchedule.TimeBegin)
            sqlCmd.Parameters.AddWithValue("@TimeEnd", objSchedule.TimeEnd)
            sqlCmd.Parameters.AddWithValue("@Employee", objSchedule.Employee)
            sqlCmd.Parameters.AddWithValue("@PersonName", objSchedule.PersonName)
			sqlCmd.Parameters.AddWithValue("@PersonDep", objSchedule.PersonDep)
			sqlCmd.Parameters.AddWithValue("@PersonTel", objSchedule.PersonTel)
			sqlCmd.Parameters.AddWithValue("@Risk", objSchedule.Risk)
			sqlCmd.Parameters.AddWithValue("@RiskName", objSchedule.RiskName)
			sqlCmd.Parameters.AddWithValue("@RiskTeam", objSchedule.RiskTeam)
			sqlCmd.Parameters.AddWithValue("@RiskTel", objSchedule.RiskTel)
			sqlCmd.Parameters.AddWithValue("@Objective", objSchedule.Objective)
			sqlCmd.Parameters.AddWithValue("@Cif", objSchedule.Cif)
			sqlCmd.Parameters.AddWithValue("@CifName", objSchedule.CifName)
			sqlCmd.Parameters.AddWithValue("@ID_Branch", objSchedule.ID_Branch)
			sqlCmd.Parameters.AddWithValue("@Depbranch", objSchedule.Depbranch)
			sqlCmd.Parameters.AddWithValue("@Location", objSchedule.Location)
			sqlCmd.Parameters.AddWithValue("@Days", objSchedule.Days)
			sqlCmd.Parameters.AddWithValue("@Rest", objSchedule.Rest)
			sqlCmd.Parameters.AddWithValue("@Office_chk", objSchedule.Office_chk)
			sqlCmd.Parameters.AddWithValue("@Home_chk", objSchedule.Home_chk)
			sqlCmd.Parameters.AddWithValue("@Shop_chk", objSchedule.Shop_chk)
			sqlCmd.Parameters.AddWithValue("@Fac_chk", objSchedule.Fac_chk)
			sqlCmd.Parameters.AddWithValue("@Col_chk", objSchedule.Col_chk)
			sqlCmd.Parameters.AddWithValue("@Other_chk", objSchedule.Other_chk)
			sqlCmd.Parameters.AddWithValue("@Attach_File", objSchedule.Attach_File)
			sqlCmd.Parameters.AddWithValue("@TranDate", objSchedule.TranDate)
			sqlCmd.Parameters.AddWithValue("@UserName", objSchedule.UserName)
			sqlCmd.Parameters.AddWithValue("@IP", objSchedule.IP)

			sqlCmd.ExecuteNonQuery()
		Catch ex As Exception
			Throw New Exception(ex.Message & " : " & ex.StackTrace)
		Finally
			'close connction & set to Nothing
			conn.Close()
			conn = Nothing
		End Try

	End Sub

	Public Sub updateSchedule(ByVal objSchedule As Schedule)

		'declare connection
		Dim conn As SqlConnection = Nothing

		Try
			conn = ConnectionUtil.getSqlConnectionFromWebConfig()
            Dim sql As String = "UPDATE TB_SCHEDULE SET " _
                & " SDate=@SDate, " _
                & " Employee=@Employee, " _
                & " TimeBegin=@TimeBegin, " _
                & " TimeEnd=@TimeEnd, " _
                & " PersonName=@PersonName, " _
                & " PersonDep=@PersonDep, " _
                & " PersonTel=@PersonTel, " _
                & " Risk=@Risk, " _
                & " RiskName=@RiskName, " _
                & " RiskTeam=@RiskTeam, " _
                & " RiskTel=@RiskTel, " _
                & " Objective=@Objective, " _
                & " Cif=@Cif, " _
                & " CifName=@CifName, " _
                & " ID_Branch=@ID_Branch, " _
                & " Depbranch=@Depbranch, " _
                & " Location=@Location, " _
                & " Days=@Days, " _
                & " Rest=@Rest, " _
                & " Office_chk=@Office_chk, " _
                & " Home_chk=@Home_chk, " _
                & " Shop_chk=@Shop_chk, " _
                & " Fac_chk=@Fac_chk, " _
                & " Col_chk=@Col_chk, " _
                & " Other_chk=@Other_chk, " _
                & " Attach_File=@Attach_File, " _
                & " TranDate=@TranDate, " _
                & " UserName=@UserName, " _
                & " IP=@IP " _
                & " WHERE ID=@ID "

			Dim sqlCmd As New SqlCommand(sql, conn)
			sqlCmd.Prepare()

			sqlCmd.Parameters.AddWithValue("@ID", objSchedule.ID)
            sqlCmd.Parameters.AddWithValue("@SDate", objSchedule.SDate)
            sqlCmd.Parameters.AddWithValue("@TimeBegin", objSchedule.TimeBegin)
            sqlCmd.Parameters.AddWithValue("@TimeEnd", objSchedule.TimeEnd)
            sqlCmd.Parameters.AddWithValue("@Employee", objSchedule.Employee)
			sqlCmd.Parameters.AddWithValue("@PersonName", objSchedule.PersonName)
			sqlCmd.Parameters.AddWithValue("@PersonDep", objSchedule.PersonDep)
			sqlCmd.Parameters.AddWithValue("@PersonTel", objSchedule.PersonTel)
			sqlCmd.Parameters.AddWithValue("@Risk", objSchedule.Risk)
			sqlCmd.Parameters.AddWithValue("@RiskName", objSchedule.RiskName)
			sqlCmd.Parameters.AddWithValue("@RiskTeam", objSchedule.RiskTeam)
			sqlCmd.Parameters.AddWithValue("@RiskTel", objSchedule.RiskTel)
			sqlCmd.Parameters.AddWithValue("@Objective", objSchedule.Objective)
			sqlCmd.Parameters.AddWithValue("@Cif", objSchedule.Cif)
			sqlCmd.Parameters.AddWithValue("@CifName", objSchedule.CifName)
			sqlCmd.Parameters.AddWithValue("@ID_Branch", objSchedule.ID_Branch)
			sqlCmd.Parameters.AddWithValue("@Depbranch", objSchedule.Depbranch)
			sqlCmd.Parameters.AddWithValue("@Location", objSchedule.Location)
			sqlCmd.Parameters.AddWithValue("@Days", objSchedule.Days)
			sqlCmd.Parameters.AddWithValue("@Rest", objSchedule.Rest)
			sqlCmd.Parameters.AddWithValue("@Office_chk", objSchedule.Office_chk)
			sqlCmd.Parameters.AddWithValue("@Home_chk", objSchedule.Home_chk)
			sqlCmd.Parameters.AddWithValue("@Shop_chk", objSchedule.Shop_chk)
			sqlCmd.Parameters.AddWithValue("@Fac_chk", objSchedule.Fac_chk)
			sqlCmd.Parameters.AddWithValue("@Col_chk", objSchedule.Col_chk)
			sqlCmd.Parameters.AddWithValue("@Other_chk", objSchedule.Other_chk)
			sqlCmd.Parameters.AddWithValue("@Attach_File", objSchedule.Attach_File)
			sqlCmd.Parameters.AddWithValue("@TranDate", objSchedule.TranDate)
			sqlCmd.Parameters.AddWithValue("@UserName", objSchedule.UserName)
			sqlCmd.Parameters.AddWithValue("@IP", objSchedule.IP)

			sqlCmd.ExecuteNonQuery()
		Catch ex As Exception
			Throw New Exception(ex.Message & " : " & ex.StackTrace)
		Finally
			'close connction & set to Nothing
			conn.Close()
			conn = Nothing
		End Try

	End Sub

	Public Sub deleteSchedule(ByVal objSchedule As Schedule)

		'declare connection
		Dim conn As SqlConnection = Nothing

		Try
			conn = ConnectionUtil.getSqlConnectionFromWebConfig()
			Dim sql As String = "DELETE FROM TB_SCHEDULE WHERE ID=@ID"

			Dim sqlCmd As New SqlCommand(sql, conn)
			sqlCmd.Prepare()

			sqlCmd.Parameters.AddWithValue("@ID", objSchedule.ID)

			sqlCmd.ExecuteNonQuery()
		Catch ex As Exception
			Throw New Exception(ex.Message & " : " & ex.StackTrace)
		Finally
			'close connction & set to Nothing
			conn.Close()
			conn = Nothing
		End Try

	End Sub

	Public Function bindingSchedule(ByVal reader as SqlDataReader) As Schedule

		Dim objSchedule As New Schedule

		objSchedule.ID = CType(ConvertUtil.getObjectValue(reader("ID"), ConvertUtil.ObjectValueEnum.NumbericValue), Integer)
		objSchedule.SDate = CType(ConvertUtil.getObjectValue(reader("SDate"), ConvertUtil.ObjectValueEnum.DateValue), Date)
        objSchedule.TimeBegin = CType(ConvertUtil.getObjectValue(reader("TimeBegin"), ConvertUtil.ObjectValueEnum.StringValue), String)
        objSchedule.TimeEnd = CType(ConvertUtil.getObjectValue(reader("TimeEnd"), ConvertUtil.ObjectValueEnum.StringValue), String)
        objSchedule.Employee = CType(ConvertUtil.getObjectValue(reader("Employee"), ConvertUtil.ObjectValueEnum.StringValue), String)
        objSchedule.PersonName = CType(ConvertUtil.getObjectValue(reader("PersonName"), ConvertUtil.ObjectValueEnum.StringValue), String)
		objSchedule.PersonDep = CType(ConvertUtil.getObjectValue(reader("PersonDep"), ConvertUtil.ObjectValueEnum.StringValue), String)
		objSchedule.PersonTel = CType(ConvertUtil.getObjectValue(reader("PersonTel"), ConvertUtil.ObjectValueEnum.StringValue), String)
		objSchedule.Risk = CType(ConvertUtil.getObjectValue(reader("Risk"), ConvertUtil.ObjectValueEnum.StringValue), String)
		objSchedule.RiskName = CType(ConvertUtil.getObjectValue(reader("RiskName"), ConvertUtil.ObjectValueEnum.StringValue), String)
		objSchedule.RiskTeam = CType(ConvertUtil.getObjectValue(reader("RiskTeam"), ConvertUtil.ObjectValueEnum.StringValue), String)
		objSchedule.RiskTel = CType(ConvertUtil.getObjectValue(reader("RiskTel"), ConvertUtil.ObjectValueEnum.StringValue), String)
		objSchedule.Objective = CType(ConvertUtil.getObjectValue(reader("Objective"), ConvertUtil.ObjectValueEnum.StringValue), String)
		objSchedule.Cif = CType(ConvertUtil.getObjectValue(reader("Cif"), ConvertUtil.ObjectValueEnum.StringValue), String)
		objSchedule.CifName = CType(ConvertUtil.getObjectValue(reader("CifName"), ConvertUtil.ObjectValueEnum.StringValue), String)
		objSchedule.ID_Branch = CType(ConvertUtil.getObjectValue(reader("ID_Branch"), ConvertUtil.ObjectValueEnum.StringValue), String)
		objSchedule.Depbranch = CType(ConvertUtil.getObjectValue(reader("Depbranch"), ConvertUtil.ObjectValueEnum.StringValue), String)
		objSchedule.Location = CType(ConvertUtil.getObjectValue(reader("Location"), ConvertUtil.ObjectValueEnum.StringValue), String)
		objSchedule.Days = CType(ConvertUtil.getObjectValue(reader("Days"), ConvertUtil.ObjectValueEnum.NumbericValue), Integer)
		objSchedule.Rest = CType(ConvertUtil.getObjectValue(reader("Rest"), ConvertUtil.ObjectValueEnum.NumbericValue), Integer)
		objSchedule.Office_chk = CType(ConvertUtil.getObjectValue(reader("Office_chk"), ConvertUtil.ObjectValueEnum.BooleanValue), Boolean)
		objSchedule.Home_chk = CType(ConvertUtil.getObjectValue(reader("Home_chk"), ConvertUtil.ObjectValueEnum.BooleanValue), Boolean)
		objSchedule.Shop_chk = CType(ConvertUtil.getObjectValue(reader("Shop_chk"), ConvertUtil.ObjectValueEnum.BooleanValue), Boolean)
		objSchedule.Fac_chk = CType(ConvertUtil.getObjectValue(reader("Fac_chk"), ConvertUtil.ObjectValueEnum.BooleanValue), Boolean)
		objSchedule.Col_chk = CType(ConvertUtil.getObjectValue(reader("Col_chk"), ConvertUtil.ObjectValueEnum.BooleanValue), Boolean)
		objSchedule.Other_chk = CType(ConvertUtil.getObjectValue(reader("Other_chk"), ConvertUtil.ObjectValueEnum.StringValue), String)
		objSchedule.Attach_File = CType(ConvertUtil.getObjectValue(reader("Attach_File"), ConvertUtil.ObjectValueEnum.StringValue), String)
		objSchedule.TranDate = CType(ConvertUtil.getObjectValue(reader("TranDate"), ConvertUtil.ObjectValueEnum.DateValue), Date)
		objSchedule.UserName = CType(ConvertUtil.getObjectValue(reader("UserName"), ConvertUtil.ObjectValueEnum.StringValue), String)
		objSchedule.IP = CType(ConvertUtil.getObjectValue(reader("IP"), ConvertUtil.ObjectValueEnum.StringValue), String)

		Return objSchedule

	End Function

End Class
