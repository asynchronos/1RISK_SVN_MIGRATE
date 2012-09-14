Option Explicit On
Option Strict On

Imports Microsoft.VisualBasic
Imports System.Data
Imports System.Data.SqlClient
Imports System.Diagnostics
Imports System.Collections.Generic

Public Class Branch_RegionDAL

	Private Shared className As String = "Branch_RegionDAL"

	Public Function getBranch_RegionById_Branch(ByVal objBranch_Region As Branch_Region) As Branch_Region

		'declare connection
		Dim conn As SqlConnection = Nothing
		'declare result
		Dim result As New Branch_Region()

		Try
            conn = ConnectionUtil.getSqlConnectionFromWebConfig()
            Dim sql As String = "SELECT   b.Id_Branch, b.Branch_T, b.Branch_E, r.Id_Region, r.Region_Name, r.Region_EName  "
            sql += " FROM  Id_Branch AS b  LEFT OUTER JOIN   Id_Region AS r ON b.Id_Region = r.Id_Region "
            sql += " Where b.Id_Branch = @Id_Branch "

            'MsgBox(sql)
            Dim sqlCmd As New SqlCommand(sql, conn)
			sqlCmd.Prepare()

			sqlCmd.Parameters.AddWithValue("@Id_Branch", objBranch_Region.Id_Branch)

			Dim reader As SqlDataReader = sqlCmd.ExecuteReader()

			While reader.Read()
				result = bindingBranch_Region(reader)
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

	Public Function getBranch_RegionById_Branch(ByVal Id_Branch As Integer) As Branch_Region

		'declare connection
		Dim conn As SqlConnection = Nothing
		'declare result
		Dim result As New Branch_Region()

		Try
            conn = ConnectionUtil.getSqlConnectionFromWebConfig()
            conn.Open()
            Dim sql As String = Nothing
            Sql += "SELECT  b.Id_Branch, b.Branch_T, b.Branch_E, r.Id_Region, r.Region_Name, r.Region_EName "
            Sql += " FROM  Id_Branch AS b  LEFT OUTER JOIN   Id_Region AS r ON b.Id_Region = r.Id_Region"
            sql += " Where b.Id_Branch = @Id_Branch "
			Dim sqlCmd As New SqlCommand(sql, conn)
			sqlCmd.Prepare()

			sqlCmd.Parameters.AddWithValue("@Id_Branch", Id_Branch)

			Dim reader As SqlDataReader = sqlCmd.ExecuteReader()

			While reader.Read()
				result = bindingBranch_Region(reader)
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

	Public Function getAllBranch_Region() As List (Of Branch_Region)

		'declare connection
		Dim conn As SqlConnection = Nothing
		'declare result
		Dim result As New List(Of Branch_Region)

		Try
            conn = ConnectionUtil.getSqlConnectionFromWebConfig()
            conn.Open()
            Dim sql As String = Nothing
            sql += "SELECT  b.Id_Branch, b.Branch_T, b.Branch_E, r.Id_Region, r.Region_Name, r.Region_EName "
            sql += " FROM  Id_Branch AS b  LEFT OUTER JOIN   Id_Region AS r ON b.Id_Region = r.Id_Region"

			Dim sqlCmd As New SqlCommand(sql, conn)
			sqlCmd.Prepare()

			Dim reader As SqlDataReader = sqlCmd.ExecuteReader()

			While reader.Read()
				result.Add(bindingBranch_Region(reader))
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


	Public Function bindingBranch_Region(ByVal reader as SqlDataReader) As Branch_Region

		Dim objBranch_Region As New Branch_Region
        objBranch_Region.Id_Branch = CType(ConvertUtil.getObjectValue(reader("Id_Branch"), ConvertUtil.ObjectValueEnum.NumbericValue), Integer)
		objBranch_Region.Branch_T = CType(ConvertUtil.getObjectValue(reader("Branch_T"), ConvertUtil.ObjectValueEnum.StringValue), String)
		objBranch_Region.Branch_E = CType(ConvertUtil.getObjectValue(reader("Branch_E"), ConvertUtil.ObjectValueEnum.StringValue), String)
        objBranch_Region.Id_Region = CType(ConvertUtil.getObjectValue(reader("Id_Region"), ConvertUtil.ObjectValueEnum.NumbericValue), Integer)
        objBranch_Region.Region_Name = CType(ConvertUtil.getObjectValue(reader("Region_Name"), ConvertUtil.ObjectValueEnum.StringValue), String)
        objBranch_Region.Region_EName = CType(ConvertUtil.getObjectValue(reader("Region_EName"), ConvertUtil.ObjectValueEnum.StringValue), String)
        Return objBranch_Region

	End Function

End Class
