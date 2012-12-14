Option Explicit On
Option Strict On

Imports Microsoft.VisualBasic
Imports System.Data
Imports System.Data.SqlClient
Imports System.Diagnostics
Imports System.Collections.Generic

Public Class DetailDAL

	Private Shared className As String = "DetailDAL"

	Public Function getDetailByCif(ByVal objDetail As Detail) As Detail

		'declare connection
		Dim conn As SqlConnection = Nothing
		'declare result
		Dim result As New Detail()

		Try
			conn = ConnectionUtil.getSqlConnectionFromWebConfig()
            Dim sql As String = "SELECT " _
             & "Cif, Name, BOTID, Tdr, " _
             & "Branch, Branch_T, Class, ByCustomer_AGING, " _
             & "ByCusDaily_AGING, AgingTxt, Principal, Accru, " _
             & "Susp, PAY_PRIN, PAY_INT, PAY_SUSP, " _
             & "Id_Group, [Group], Id_Part, Part_Name, " _
             & "Id_Region, Region_Name, CUS_DEPT_FLAG, CUS_DEPT_TRAN, " _
             & "Dep, OFFICR_ID, Office " _
             & "FROM Detail " _
             & "WHERE Cif=@Cif " _
             & "ORDER BY Cif"

			Dim sqlCmd As New SqlCommand(sql, conn)
			sqlCmd.Prepare()

			sqlCmd.Parameters.AddWithValue("@Cif", objDetail.Cif)

			Dim reader As SqlDataReader = sqlCmd.ExecuteReader()

			While reader.Read()
				result = bindingDetail(reader)
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
    Public Function getAllDetail() As List(Of Detail)

        'declare connection
        Dim conn As SqlConnection = Nothing
        'declare result
        Dim result As New List(Of Detail)

        Try
            conn = ConnectionUtil.getSqlConnectionFromWebConfig()
            Dim sql As String = "SELECT " _
             & "Cif, Name, BOTID, Tdr, " _
             & "Branch, Branch_T, Class, ByCustomer_AGING, " _
             & "ByCusDaily_AGING, AgingTxt, Principal, Accru, " _
             & "Susp, PAY_PRIN, PAY_INT, PAY_SUSP, " _
             & "Id_Group, [Group], Id_Part, Part_Name, " _
             & "Id_Region, Region_Name, CUS_DEPT_FLAG, CUS_DEPT_TRAN, " _
             & "Dep, OFFICR_ID, Office " _
             & "FROM Detail " _
             & "ORDER BY Cif"

            Dim sqlCmd As New SqlCommand(sql, conn)
            sqlCmd.Prepare()

            Dim reader As SqlDataReader = sqlCmd.ExecuteReader()

            While reader.Read()
                result.Add(bindingDetail(reader))
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

	Public Function getAllDetailBySQL(ByVal sql AS String) As List (Of Detail)

		'declare connection
		Dim conn As SqlConnection = Nothing
		'declare result
		Dim result As New List(Of Detail)

		Try
			conn = ConnectionUtil.getSqlConnectionFromWebConfig()
			Dim sqlCmd As New SqlCommand(sql, conn)
			sqlCmd.Prepare()

			Dim reader As SqlDataReader = sqlCmd.ExecuteReader()

			While reader.Read()
				result.Add(bindingDetail(reader))
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


	Public Function bindingDetail(ByVal reader as SqlDataReader) As Detail

		Dim objDetail As New Detail

		objDetail.Cif = CType(ConvertUtil.getObjectValue(reader("Cif"), ConvertUtil.ObjectValueEnum.NumbericValue), Integer)
		objDetail.Name = CType(ConvertUtil.getObjectValue(reader("Name"), ConvertUtil.ObjectValueEnum.StringValue), String)
		objDetail.BOTID = CType(ConvertUtil.getObjectValue(reader("BOTID"), ConvertUtil.ObjectValueEnum.NumbericValue), Integer)
		objDetail.Tdr = CType(ConvertUtil.getObjectValue(reader("Tdr"), ConvertUtil.ObjectValueEnum.StringValue), String)
		objDetail.Branch = CType(ConvertUtil.getObjectValue(reader("Branch"), ConvertUtil.ObjectValueEnum.NumbericValue), Integer)
		objDetail.Branch_T = CType(ConvertUtil.getObjectValue(reader("Branch_T"), ConvertUtil.ObjectValueEnum.StringValue), String)
        objDetail.ClassDebt = CType(ConvertUtil.getObjectValue(reader("Class"), ConvertUtil.ObjectValueEnum.StringValue), String)
		objDetail.ByCustomer_AGING = CType(ConvertUtil.getObjectValue(reader("ByCustomer_AGING"), ConvertUtil.ObjectValueEnum.DoubleValue), Double)
		objDetail.ByCusDaily_AGING = CType(ConvertUtil.getObjectValue(reader("ByCusDaily_AGING"), ConvertUtil.ObjectValueEnum.DoubleValue), Double)
		objDetail.AgingTxt = CType(ConvertUtil.getObjectValue(reader("AgingTxt"), ConvertUtil.ObjectValueEnum.StringValue), String)
		objDetail.Principal = CType(ConvertUtil.getObjectValue(reader("Principal"), ConvertUtil.ObjectValueEnum.DoubleValue), Double)
		objDetail.Accru = CType(ConvertUtil.getObjectValue(reader("Accru"), ConvertUtil.ObjectValueEnum.DoubleValue), Double)
		objDetail.Susp = CType(ConvertUtil.getObjectValue(reader("Susp"), ConvertUtil.ObjectValueEnum.DoubleValue), Double)
		objDetail.PAY_PRIN = CType(ConvertUtil.getObjectValue(reader("PAY_PRIN"), ConvertUtil.ObjectValueEnum.DoubleValue), Double)
		objDetail.PAY_INT = CType(ConvertUtil.getObjectValue(reader("PAY_INT"), ConvertUtil.ObjectValueEnum.DoubleValue), Double)
		objDetail.PAY_SUSP = CType(ConvertUtil.getObjectValue(reader("PAY_SUSP"), ConvertUtil.ObjectValueEnum.DoubleValue), Double)
		objDetail.Id_Group = CType(ConvertUtil.getObjectValue(reader("Id_Group"), ConvertUtil.ObjectValueEnum.NumbericValue), Integer)
		objDetail.Group = CType(ConvertUtil.getObjectValue(reader("Group"), ConvertUtil.ObjectValueEnum.StringValue), String)
		objDetail.Id_Part = CType(ConvertUtil.getObjectValue(reader("Id_Part"), ConvertUtil.ObjectValueEnum.NumbericValue), Integer)
		objDetail.Part_Name = CType(ConvertUtil.getObjectValue(reader("Part_Name"), ConvertUtil.ObjectValueEnum.StringValue), String)
		objDetail.Id_Region = CType(ConvertUtil.getObjectValue(reader("Id_Region"), ConvertUtil.ObjectValueEnum.NumbericValue), Integer)
		objDetail.Region_Name = CType(ConvertUtil.getObjectValue(reader("Region_Name"), ConvertUtil.ObjectValueEnum.StringValue), String)
		objDetail.CUS_DEPT_FLAG = CType(ConvertUtil.getObjectValue(reader("CUS_DEPT_FLAG"), ConvertUtil.ObjectValueEnum.NumbericValue), Integer)
		objDetail.CUS_DEPT_TRAN = CType(ConvertUtil.getObjectValue(reader("CUS_DEPT_TRAN"), ConvertUtil.ObjectValueEnum.NumbericValue), Integer)
		objDetail.Dep = CType(ConvertUtil.getObjectValue(reader("Dep"), ConvertUtil.ObjectValueEnum.StringValue), String)
		objDetail.OFFICR_ID = CType(ConvertUtil.getObjectValue(reader("OFFICR_ID"), ConvertUtil.ObjectValueEnum.NumbericValue), Integer)
		objDetail.Office = CType(ConvertUtil.getObjectValue(reader("Office"), ConvertUtil.ObjectValueEnum.StringValue), String)

		Return objDetail

	End Function

End Class
