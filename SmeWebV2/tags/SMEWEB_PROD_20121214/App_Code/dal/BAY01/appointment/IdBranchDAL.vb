Option Explicit On
Option Strict On

Imports Microsoft.VisualBasic
Imports System.Data
Imports System.Data.SqlClient
Imports System.Diagnostics
Imports System.Collections.Generic

Public Class IdBranchDAL

	Private Shared className As String = "IdBranchDAL"

	Public Function getIdBranchById_Branch(ByVal objIdBranch As IdBranch) As IdBranch

		'declare connection
		Dim conn As SqlConnection = Nothing
		'declare result
		Dim result As New IdBranch()

		Try
			conn = ConnectionUtil.getSqlConnectionFromWebConfig()
			Dim sql As String = "SELECT " _
				& "Id_Branch, Branch_T, Branch_E, Id_RegG, " _
				& "RegG_Name, RegG_NameE, Id_RegSub, Id_Region, " _
				& "Region_Name, Region_NameE, Id_Province, Province, " _
				& "Id_ProGDPE, Id_PartN, Part_NameN, Part_NameNE, " _
				& "Id_RegionOld, Region_NameOld, Region_NameEOld, Id_PartOld, " _
				& "Part_NameOld, Part_NameEOld, Id_Part1, Part1_Name, " _
				& "Id_Part2, Part2_Name, Part2_NameE, Id_Part3, " _
				& "Part3_Name, Id_Part4, Part4_Name, Addres, " _
				& "Post, Tel, DateOpen, Id_BCenter, " _
				& "Segment " _
				& "FROM Id_Branch " _
				& "WHERE Id_Branch=@Id_Branch " _
				& "ORDER BY Id_Branch"

			Dim sqlCmd As New SqlCommand(sql, conn)
			sqlCmd.Prepare()

			sqlCmd.Parameters.AddWithValue("@Id_Branch", objIdBranch.Id_Branch)

			Dim reader As SqlDataReader = sqlCmd.ExecuteReader()

			While reader.Read()
				result = bindingIdBranch(reader)
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

	Public Function getIdBranchById_Branch(ByVal Id_Branch As Integer) As IdBranch

		'declare connection
		Dim conn As SqlConnection = Nothing
		'declare result
		Dim result As New IdBranch()

		Try
			conn = ConnectionUtil.getSqlConnectionFromWebConfig()
			Dim sql As String = "SELECT " _
				& "Id_Branch, Branch_T, Branch_E, Id_RegG, " _
				& "RegG_Name, RegG_NameE, Id_RegSub, Id_Region, " _
				& "Region_Name, Region_NameE, Id_Province, Province, " _
				& "Id_ProGDPE, Id_PartN, Part_NameN, Part_NameNE, " _
				& "Id_RegionOld, Region_NameOld, Region_NameEOld, Id_PartOld, " _
				& "Part_NameOld, Part_NameEOld, Id_Part1, Part1_Name, " _
				& "Id_Part2, Part2_Name, Part2_NameE, Id_Part3, " _
				& "Part3_Name, Id_Part4, Part4_Name, Addres, " _
				& "Post, Tel, DateOpen, Id_BCenter, " _
				& "Segment " _
				& "FROM Id_Branch " _
				& "WHERE Id_Branch=@Id_Branch " _
				& "ORDER BY Id_Branch"

			Dim sqlCmd As New SqlCommand(sql, conn)
			sqlCmd.Prepare()

			sqlCmd.Parameters.AddWithValue("@Id_Branch", Id_Branch)

			Dim reader As SqlDataReader = sqlCmd.ExecuteReader()

			While reader.Read()
				result = bindingIdBranch(reader)
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

	Public Function getAllIdBranch() As List (Of IdBranch)

		'declare connection
		Dim conn As SqlConnection = Nothing
		'declare result
		Dim result As New List(Of IdBranch)

		Try
			conn = ConnectionUtil.getSqlConnectionFromWebConfig()
			Dim sql As String = "SELECT " _
				& "Id_Branch, Branch_T, Branch_E, Id_RegG, " _
				& "RegG_Name, RegG_NameE, Id_RegSub, Id_Region, " _
				& "Region_Name, Region_NameE, Id_Province, Province, " _
				& "Id_ProGDPE, Id_PartN, Part_NameN, Part_NameNE, " _
				& "Id_RegionOld, Region_NameOld, Region_NameEOld, Id_PartOld, " _
				& "Part_NameOld, Part_NameEOld, Id_Part1, Part1_Name, " _
				& "Id_Part2, Part2_Name, Part2_NameE, Id_Part3, " _
				& "Part3_Name, Id_Part4, Part4_Name, Addres, " _
				& "Post, Tel, DateOpen, Id_BCenter, " _
				& "Segment " _
				& "FROM Id_Branch " _
				& "ORDER BY Id_Branch"

			Dim sqlCmd As New SqlCommand(sql, conn)
			sqlCmd.Prepare()

			Dim reader As SqlDataReader = sqlCmd.ExecuteReader()

			While reader.Read()
				result.Add(bindingIdBranch(reader))
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

	Public Function getAllIdBranchBySQL(ByVal sql AS String) As List (Of IdBranch)

		'declare connection
		Dim conn As SqlConnection = Nothing
		'declare result
		Dim result As New List(Of IdBranch)

		Try
			conn = ConnectionUtil.getSqlConnectionFromWebConfig()
			Dim sqlCmd As New SqlCommand(sql, conn)
			sqlCmd.Prepare()

			Dim reader As SqlDataReader = sqlCmd.ExecuteReader()

			While reader.Read()
				result.Add(bindingIdBranch(reader))
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

	Public Sub insertIdBranch(ByVal objIdBranch As IdBranch)

		'declare connection
		Dim conn As SqlConnection = Nothing

		Try
			conn = ConnectionUtil.getSqlConnectionFromWebConfig()
			Dim sql As String = "INSERT INTO Id_Branch " _
							& " (Id_Branch, Branch_T, Branch_E, Id_RegG, RegG_Name, RegG_NameE, Id_RegSub, Id_Region, Region_Name, Region_NameE, Id_Province, Province, Id_ProGDPE, Id_PartN, Part_NameN, Part_NameNE, Id_RegionOld, Region_NameOld, Region_NameEOld, Id_PartOld, Part_NameOld, Part_NameEOld, Id_Part1, Part1_Name, Id_Part2, Part2_Name, Part2_NameE, Id_Part3, Part3_Name, Id_Part4, Part4_Name, Addres, Post, Tel, DateOpen, Id_BCenter, Segment) " _
							& " VALUES(@Id_Branch, @Branch_T, @Branch_E, @Id_RegG, @RegG_Name, @RegG_NameE, @Id_RegSub, @Id_Region, @Region_Name, @Region_NameE, @Id_Province, @Province, @Id_ProGDPE, @Id_PartN, @Part_NameN, @Part_NameNE, @Id_RegionOld, @Region_NameOld, @Region_NameEOld, @Id_PartOld, @Part_NameOld, @Part_NameEOld, @Id_Part1, @Part1_Name, @Id_Part2, @Part2_Name, @Part2_NameE, @Id_Part3, @Part3_Name, @Id_Part4, @Part4_Name, @Addres, @Post, @Tel, @DateOpen, @Id_BCenter, @Segment) "

			Dim sqlCmd As New SqlCommand(sql, conn)
			sqlCmd.Prepare()

			sqlCmd.Parameters.AddWithValue("@Id_Branch", objIdBranch.Id_Branch)
			sqlCmd.Parameters.AddWithValue("@Branch_T", objIdBranch.Branch_T)
			sqlCmd.Parameters.AddWithValue("@Branch_E", objIdBranch.Branch_E)
			sqlCmd.Parameters.AddWithValue("@Id_RegG", objIdBranch.Id_RegG)
			sqlCmd.Parameters.AddWithValue("@RegG_Name", objIdBranch.RegG_Name)
			sqlCmd.Parameters.AddWithValue("@RegG_NameE", objIdBranch.RegG_NameE)
			sqlCmd.Parameters.AddWithValue("@Id_RegSub", objIdBranch.Id_RegSub)
			sqlCmd.Parameters.AddWithValue("@Id_Region", objIdBranch.Id_Region)
			sqlCmd.Parameters.AddWithValue("@Region_Name", objIdBranch.Region_Name)
			sqlCmd.Parameters.AddWithValue("@Region_NameE", objIdBranch.Region_NameE)
			sqlCmd.Parameters.AddWithValue("@Id_Province", objIdBranch.Id_Province)
			sqlCmd.Parameters.AddWithValue("@Province", objIdBranch.Province)
			sqlCmd.Parameters.AddWithValue("@Id_ProGDPE", objIdBranch.Id_ProGDPE)
			sqlCmd.Parameters.AddWithValue("@Id_PartN", objIdBranch.Id_PartN)
			sqlCmd.Parameters.AddWithValue("@Part_NameN", objIdBranch.Part_NameN)
			sqlCmd.Parameters.AddWithValue("@Part_NameNE", objIdBranch.Part_NameNE)
			sqlCmd.Parameters.AddWithValue("@Id_RegionOld", objIdBranch.Id_RegionOld)
			sqlCmd.Parameters.AddWithValue("@Region_NameOld", objIdBranch.Region_NameOld)
			sqlCmd.Parameters.AddWithValue("@Region_NameEOld", objIdBranch.Region_NameEOld)
			sqlCmd.Parameters.AddWithValue("@Id_PartOld", objIdBranch.Id_PartOld)
			sqlCmd.Parameters.AddWithValue("@Part_NameOld", objIdBranch.Part_NameOld)
			sqlCmd.Parameters.AddWithValue("@Part_NameEOld", objIdBranch.Part_NameEOld)
			sqlCmd.Parameters.AddWithValue("@Id_Part1", objIdBranch.Id_Part1)
			sqlCmd.Parameters.AddWithValue("@Part1_Name", objIdBranch.Part1_Name)
			sqlCmd.Parameters.AddWithValue("@Id_Part2", objIdBranch.Id_Part2)
			sqlCmd.Parameters.AddWithValue("@Part2_Name", objIdBranch.Part2_Name)
			sqlCmd.Parameters.AddWithValue("@Part2_NameE", objIdBranch.Part2_NameE)
			sqlCmd.Parameters.AddWithValue("@Id_Part3", objIdBranch.Id_Part3)
			sqlCmd.Parameters.AddWithValue("@Part3_Name", objIdBranch.Part3_Name)
			sqlCmd.Parameters.AddWithValue("@Id_Part4", objIdBranch.Id_Part4)
			sqlCmd.Parameters.AddWithValue("@Part4_Name", objIdBranch.Part4_Name)
			sqlCmd.Parameters.AddWithValue("@Addres", objIdBranch.Addres)
			sqlCmd.Parameters.AddWithValue("@Post", objIdBranch.Post)
			sqlCmd.Parameters.AddWithValue("@Tel", objIdBranch.Tel)
			sqlCmd.Parameters.AddWithValue("@DateOpen", objIdBranch.DateOpen)
			sqlCmd.Parameters.AddWithValue("@Id_BCenter", objIdBranch.Id_BCenter)
			sqlCmd.Parameters.AddWithValue("@Segment", objIdBranch.Segment)

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

	Public Sub updateIdBranch(ByVal objIdBranch As IdBranch)

		'declare connection
		Dim conn As SqlConnection = Nothing

		Try
			conn = ConnectionUtil.getSqlConnectionFromWebConfig()
			Dim sql As String = "UPDATE Id_Branch SET " _
							& " Branch_T=@Branch_T, " _
							& " Branch_E=@Branch_E, " _
							& " Id_RegG=@Id_RegG, " _
							& " RegG_Name=@RegG_Name, " _
							& " RegG_NameE=@RegG_NameE, " _
							& " Id_RegSub=@Id_RegSub, " _
							& " Id_Region=@Id_Region, " _
							& " Region_Name=@Region_Name, " _
							& " Region_NameE=@Region_NameE, " _
							& " Id_Province=@Id_Province, " _
							& " Province=@Province, " _
							& " Id_ProGDPE=@Id_ProGDPE, " _
							& " Id_PartN=@Id_PartN, " _
							& " Part_NameN=@Part_NameN, " _
							& " Part_NameNE=@Part_NameNE, " _
							& " Id_RegionOld=@Id_RegionOld, " _
							& " Region_NameOld=@Region_NameOld, " _
							& " Region_NameEOld=@Region_NameEOld, " _
							& " Id_PartOld=@Id_PartOld, " _
							& " Part_NameOld=@Part_NameOld, " _
							& " Part_NameEOld=@Part_NameEOld, " _
							& " Id_Part1=@Id_Part1, " _
							& " Part1_Name=@Part1_Name, " _
							& " Id_Part2=@Id_Part2, " _
							& " Part2_Name=@Part2_Name, " _
							& " Part2_NameE=@Part2_NameE, " _
							& " Id_Part3=@Id_Part3, " _
							& " Part3_Name=@Part3_Name, " _
							& " Id_Part4=@Id_Part4, " _
							& " Part4_Name=@Part4_Name, " _
							& " Addres=@Addres, " _
							& " Post=@Post, " _
							& " Tel=@Tel, " _
							& " DateOpen=@DateOpen, " _
							& " Id_BCenter=@Id_BCenter, " _
							& " Segment=@Segment " _
							& " WHERE Id_Branch=@Id_Branch "

			Dim sqlCmd As New SqlCommand(sql, conn)
			sqlCmd.Prepare()

			sqlCmd.Parameters.AddWithValue("@Id_Branch", objIdBranch.Id_Branch)
			sqlCmd.Parameters.AddWithValue("@Branch_T", objIdBranch.Branch_T)
			sqlCmd.Parameters.AddWithValue("@Branch_E", objIdBranch.Branch_E)
			sqlCmd.Parameters.AddWithValue("@Id_RegG", objIdBranch.Id_RegG)
			sqlCmd.Parameters.AddWithValue("@RegG_Name", objIdBranch.RegG_Name)
			sqlCmd.Parameters.AddWithValue("@RegG_NameE", objIdBranch.RegG_NameE)
			sqlCmd.Parameters.AddWithValue("@Id_RegSub", objIdBranch.Id_RegSub)
			sqlCmd.Parameters.AddWithValue("@Id_Region", objIdBranch.Id_Region)
			sqlCmd.Parameters.AddWithValue("@Region_Name", objIdBranch.Region_Name)
			sqlCmd.Parameters.AddWithValue("@Region_NameE", objIdBranch.Region_NameE)
			sqlCmd.Parameters.AddWithValue("@Id_Province", objIdBranch.Id_Province)
			sqlCmd.Parameters.AddWithValue("@Province", objIdBranch.Province)
			sqlCmd.Parameters.AddWithValue("@Id_ProGDPE", objIdBranch.Id_ProGDPE)
			sqlCmd.Parameters.AddWithValue("@Id_PartN", objIdBranch.Id_PartN)
			sqlCmd.Parameters.AddWithValue("@Part_NameN", objIdBranch.Part_NameN)
			sqlCmd.Parameters.AddWithValue("@Part_NameNE", objIdBranch.Part_NameNE)
			sqlCmd.Parameters.AddWithValue("@Id_RegionOld", objIdBranch.Id_RegionOld)
			sqlCmd.Parameters.AddWithValue("@Region_NameOld", objIdBranch.Region_NameOld)
			sqlCmd.Parameters.AddWithValue("@Region_NameEOld", objIdBranch.Region_NameEOld)
			sqlCmd.Parameters.AddWithValue("@Id_PartOld", objIdBranch.Id_PartOld)
			sqlCmd.Parameters.AddWithValue("@Part_NameOld", objIdBranch.Part_NameOld)
			sqlCmd.Parameters.AddWithValue("@Part_NameEOld", objIdBranch.Part_NameEOld)
			sqlCmd.Parameters.AddWithValue("@Id_Part1", objIdBranch.Id_Part1)
			sqlCmd.Parameters.AddWithValue("@Part1_Name", objIdBranch.Part1_Name)
			sqlCmd.Parameters.AddWithValue("@Id_Part2", objIdBranch.Id_Part2)
			sqlCmd.Parameters.AddWithValue("@Part2_Name", objIdBranch.Part2_Name)
			sqlCmd.Parameters.AddWithValue("@Part2_NameE", objIdBranch.Part2_NameE)
			sqlCmd.Parameters.AddWithValue("@Id_Part3", objIdBranch.Id_Part3)
			sqlCmd.Parameters.AddWithValue("@Part3_Name", objIdBranch.Part3_Name)
			sqlCmd.Parameters.AddWithValue("@Id_Part4", objIdBranch.Id_Part4)
			sqlCmd.Parameters.AddWithValue("@Part4_Name", objIdBranch.Part4_Name)
			sqlCmd.Parameters.AddWithValue("@Addres", objIdBranch.Addres)
			sqlCmd.Parameters.AddWithValue("@Post", objIdBranch.Post)
			sqlCmd.Parameters.AddWithValue("@Tel", objIdBranch.Tel)
			sqlCmd.Parameters.AddWithValue("@DateOpen", objIdBranch.DateOpen)
			sqlCmd.Parameters.AddWithValue("@Id_BCenter", objIdBranch.Id_BCenter)
			sqlCmd.Parameters.AddWithValue("@Segment", objIdBranch.Segment)

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

	Public Sub deleteIdBranch(ByVal objIdBranch As IdBranch)

		'declare connection
		Dim conn As SqlConnection = Nothing

		Try
			conn = ConnectionUtil.getSqlConnectionFromWebConfig()
			Dim sql As String = "DELETE FROM Id_Branch WHERE Id_Branch=@Id_Branch"

			Dim sqlCmd As New SqlCommand(sql, conn)
			sqlCmd.Prepare()

			sqlCmd.Parameters.AddWithValue("@Id_Branch", objIdBranch.Id_Branch)

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

	Public Sub deleteIdBranch(ByVal Id_Branch As Integer)

		'declare connection
		Dim conn As SqlConnection = Nothing

		Try
			conn = ConnectionUtil.getSqlConnectionFromWebConfig()
			Dim sql As String = "DELETE FROM Id_Branch WHERE Id_Branch=@Id_Branch"

			Dim sqlCmd As New SqlCommand(sql, conn)
			sqlCmd.Prepare()

			sqlCmd.Parameters.AddWithValue("@Id_Branch", Id_Branch)

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

	Public Function bindingIdBranch(ByVal reader as SqlDataReader) As IdBranch

		Dim objIdBranch As New IdBranch

		objIdBranch.Id_Branch = CType(ConvertUtil.getObjectValue(reader("Id_Branch"), ConvertUtil.ObjectValueEnum.NumbericValue), Integer)
		objIdBranch.Branch_T = CType(ConvertUtil.getObjectValue(reader("Branch_T"), ConvertUtil.ObjectValueEnum.StringValue), String)
		objIdBranch.Branch_E = CType(ConvertUtil.getObjectValue(reader("Branch_E"), ConvertUtil.ObjectValueEnum.StringValue), String)
		objIdBranch.Id_RegG = CType(ConvertUtil.getObjectValue(reader("Id_RegG"), ConvertUtil.ObjectValueEnum.NumbericValue), Integer)
		objIdBranch.RegG_Name = CType(ConvertUtil.getObjectValue(reader("RegG_Name"), ConvertUtil.ObjectValueEnum.StringValue), String)
		objIdBranch.RegG_NameE = CType(ConvertUtil.getObjectValue(reader("RegG_NameE"), ConvertUtil.ObjectValueEnum.StringValue), String)
		objIdBranch.Id_RegSub = CType(ConvertUtil.getObjectValue(reader("Id_RegSub"), ConvertUtil.ObjectValueEnum.NumbericValue), Integer)
		objIdBranch.Id_Region = CType(ConvertUtil.getObjectValue(reader("Id_Region"), ConvertUtil.ObjectValueEnum.NumbericValue), Integer)
		objIdBranch.Region_Name = CType(ConvertUtil.getObjectValue(reader("Region_Name"), ConvertUtil.ObjectValueEnum.StringValue), String)
		objIdBranch.Region_NameE = CType(ConvertUtil.getObjectValue(reader("Region_NameE"), ConvertUtil.ObjectValueEnum.StringValue), String)
		objIdBranch.Id_Province = CType(ConvertUtil.getObjectValue(reader("Id_Province"), ConvertUtil.ObjectValueEnum.NumbericValue), Integer)
		objIdBranch.Province = CType(ConvertUtil.getObjectValue(reader("Province"), ConvertUtil.ObjectValueEnum.StringValue), String)
		objIdBranch.Id_ProGDPE = CType(ConvertUtil.getObjectValue(reader("Id_ProGDPE"), ConvertUtil.ObjectValueEnum.StringValue), String)
		objIdBranch.Id_PartN = CType(ConvertUtil.getObjectValue(reader("Id_PartN"), ConvertUtil.ObjectValueEnum.NumbericValue), Integer)
		objIdBranch.Part_NameN = CType(ConvertUtil.getObjectValue(reader("Part_NameN"), ConvertUtil.ObjectValueEnum.StringValue), String)
		objIdBranch.Part_NameNE = CType(ConvertUtil.getObjectValue(reader("Part_NameNE"), ConvertUtil.ObjectValueEnum.StringValue), String)
		objIdBranch.Id_RegionOld = CType(ConvertUtil.getObjectValue(reader("Id_RegionOld"), ConvertUtil.ObjectValueEnum.NumbericValue), Integer)
		objIdBranch.Region_NameOld = CType(ConvertUtil.getObjectValue(reader("Region_NameOld"), ConvertUtil.ObjectValueEnum.StringValue), String)
		objIdBranch.Region_NameEOld = CType(ConvertUtil.getObjectValue(reader("Region_NameEOld"), ConvertUtil.ObjectValueEnum.StringValue), String)
		objIdBranch.Id_PartOld = CType(ConvertUtil.getObjectValue(reader("Id_PartOld"), ConvertUtil.ObjectValueEnum.NumbericValue), Integer)
		objIdBranch.Part_NameOld = CType(ConvertUtil.getObjectValue(reader("Part_NameOld"), ConvertUtil.ObjectValueEnum.StringValue), String)
		objIdBranch.Part_NameEOld = CType(ConvertUtil.getObjectValue(reader("Part_NameEOld"), ConvertUtil.ObjectValueEnum.StringValue), String)
		objIdBranch.Id_Part1 = CType(ConvertUtil.getObjectValue(reader("Id_Part1"), ConvertUtil.ObjectValueEnum.NumbericValue), Integer)
		objIdBranch.Part1_Name = CType(ConvertUtil.getObjectValue(reader("Part1_Name"), ConvertUtil.ObjectValueEnum.StringValue), String)
		objIdBranch.Id_Part2 = CType(ConvertUtil.getObjectValue(reader("Id_Part2"), ConvertUtil.ObjectValueEnum.NumbericValue), Integer)
		objIdBranch.Part2_Name = CType(ConvertUtil.getObjectValue(reader("Part2_Name"), ConvertUtil.ObjectValueEnum.StringValue), String)
		objIdBranch.Part2_NameE = CType(ConvertUtil.getObjectValue(reader("Part2_NameE"), ConvertUtil.ObjectValueEnum.StringValue), String)
		objIdBranch.Id_Part3 = CType(ConvertUtil.getObjectValue(reader("Id_Part3"), ConvertUtil.ObjectValueEnum.NumbericValue), Integer)
		objIdBranch.Part3_Name = CType(ConvertUtil.getObjectValue(reader("Part3_Name"), ConvertUtil.ObjectValueEnum.StringValue), String)
		objIdBranch.Id_Part4 = CType(ConvertUtil.getObjectValue(reader("Id_Part4"), ConvertUtil.ObjectValueEnum.NumbericValue), Integer)
		objIdBranch.Part4_Name = CType(ConvertUtil.getObjectValue(reader("Part4_Name"), ConvertUtil.ObjectValueEnum.StringValue), String)
		objIdBranch.Addres = CType(ConvertUtil.getObjectValue(reader("Addres"), ConvertUtil.ObjectValueEnum.StringValue), String)
		objIdBranch.Post = CType(ConvertUtil.getObjectValue(reader("Post"), ConvertUtil.ObjectValueEnum.StringValue), String)
		objIdBranch.Tel = CType(ConvertUtil.getObjectValue(reader("Tel"), ConvertUtil.ObjectValueEnum.StringValue), String)
		objIdBranch.DateOpen = CType(ConvertUtil.getObjectValue(reader("DateOpen"), ConvertUtil.ObjectValueEnum.StringValue), String)
		objIdBranch.Id_BCenter = CType(ConvertUtil.getObjectValue(reader("Id_BCenter"), ConvertUtil.ObjectValueEnum.StringValue), String)
		objIdBranch.Segment = CType(ConvertUtil.getObjectValue(reader("Segment"), ConvertUtil.ObjectValueEnum.StringValue), String)

		Return objIdBranch

	End Function

End Class
