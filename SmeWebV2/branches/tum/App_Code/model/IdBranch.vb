Option Explicit On
Option Strict On

Imports Microsoft.VisualBasic
Imports System.Diagnostics

Public Class IdBranch

	Private Const CLSNAME As String = "Class IdBranch"

	Private intId_Branch As Integer
	Private strBranch_T As String
	Private strBranch_E As String
	Private intId_RegG As Integer
	Private strRegG_Name As String
	Private strRegG_NameE As String
	Private intId_RegSub As Integer
	Private intId_Region As Integer
	Private strRegion_Name As String
	Private strRegion_NameE As String
	Private intId_Province As Integer
	Private strProvince As String
	Private strId_ProGDPE As String
	Private intId_PartN As Integer
	Private strPart_NameN As String
	Private strPart_NameNE As String
	Private intId_RegionOld As Integer
	Private strRegion_NameOld As String
	Private strRegion_NameEOld As String
	Private intId_PartOld As Integer
	Private strPart_NameOld As String
	Private strPart_NameEOld As String
	Private intId_Part1 As Integer
	Private strPart1_Name As String
	Private intId_Part2 As Integer
	Private strPart2_Name As String
	Private strPart2_NameE As String
	Private intId_Part3 As Integer
	Private strPart3_Name As String
	Private intId_Part4 As Integer
	Private strPart4_Name As String
	Private strAddres As String
	Private strPost As String
	Private strTel As String
	Private strDateOpen As String
	Private strId_BCenter As String
	Private strSegment As String

	Public Property Id_Branch As Integer
	Get
		Return intId_Branch
	End Get
	Set (ByVal Value As Integer)
		intId_Branch = Value
	End Set
	End Property

	Public Property Branch_T As String
	Get
		Return strBranch_T
	End Get
	Set (ByVal Value As String)
		strBranch_T = Value
	End Set
	End Property

	Public Property Branch_E As String
	Get
		Return strBranch_E
	End Get
	Set (ByVal Value As String)
		strBranch_E = Value
	End Set
	End Property

	Public Property Id_RegG As Integer
	Get
		Return intId_RegG
	End Get
	Set (ByVal Value As Integer)
		intId_RegG = Value
	End Set
	End Property

	Public Property RegG_Name As String
	Get
		Return strRegG_Name
	End Get
	Set (ByVal Value As String)
		strRegG_Name = Value
	End Set
	End Property

	Public Property RegG_NameE As String
	Get
		Return strRegG_NameE
	End Get
	Set (ByVal Value As String)
		strRegG_NameE = Value
	End Set
	End Property

	Public Property Id_RegSub As Integer
	Get
		Return intId_RegSub
	End Get
	Set (ByVal Value As Integer)
		intId_RegSub = Value
	End Set
	End Property

	Public Property Id_Region As Integer
	Get
		Return intId_Region
	End Get
	Set (ByVal Value As Integer)
		intId_Region = Value
	End Set
	End Property

	Public Property Region_Name As String
	Get
		Return strRegion_Name
	End Get
	Set (ByVal Value As String)
		strRegion_Name = Value
	End Set
	End Property

	Public Property Region_NameE As String
	Get
		Return strRegion_NameE
	End Get
	Set (ByVal Value As String)
		strRegion_NameE = Value
	End Set
	End Property

	Public Property Id_Province As Integer
	Get
		Return intId_Province
	End Get
	Set (ByVal Value As Integer)
		intId_Province = Value
	End Set
	End Property

	Public Property Province As String
	Get
		Return strProvince
	End Get
	Set (ByVal Value As String)
		strProvince = Value
	End Set
	End Property

	Public Property Id_ProGDPE As String
	Get
		Return strId_ProGDPE
	End Get
	Set (ByVal Value As String)
		strId_ProGDPE = Value
	End Set
	End Property

	Public Property Id_PartN As Integer
	Get
		Return intId_PartN
	End Get
	Set (ByVal Value As Integer)
		intId_PartN = Value
	End Set
	End Property

	Public Property Part_NameN As String
	Get
		Return strPart_NameN
	End Get
	Set (ByVal Value As String)
		strPart_NameN = Value
	End Set
	End Property

	Public Property Part_NameNE As String
	Get
		Return strPart_NameNE
	End Get
	Set (ByVal Value As String)
		strPart_NameNE = Value
	End Set
	End Property

	Public Property Id_RegionOld As Integer
	Get
		Return intId_RegionOld
	End Get
	Set (ByVal Value As Integer)
		intId_RegionOld = Value
	End Set
	End Property

	Public Property Region_NameOld As String
	Get
		Return strRegion_NameOld
	End Get
	Set (ByVal Value As String)
		strRegion_NameOld = Value
	End Set
	End Property

	Public Property Region_NameEOld As String
	Get
		Return strRegion_NameEOld
	End Get
	Set (ByVal Value As String)
		strRegion_NameEOld = Value
	End Set
	End Property

	Public Property Id_PartOld As Integer
	Get
		Return intId_PartOld
	End Get
	Set (ByVal Value As Integer)
		intId_PartOld = Value
	End Set
	End Property

	Public Property Part_NameOld As String
	Get
		Return strPart_NameOld
	End Get
	Set (ByVal Value As String)
		strPart_NameOld = Value
	End Set
	End Property

	Public Property Part_NameEOld As String
	Get
		Return strPart_NameEOld
	End Get
	Set (ByVal Value As String)
		strPart_NameEOld = Value
	End Set
	End Property

	Public Property Id_Part1 As Integer
	Get
		Return intId_Part1
	End Get
	Set (ByVal Value As Integer)
		intId_Part1 = Value
	End Set
	End Property

	Public Property Part1_Name As String
	Get
		Return strPart1_Name
	End Get
	Set (ByVal Value As String)
		strPart1_Name = Value
	End Set
	End Property

	Public Property Id_Part2 As Integer
	Get
		Return intId_Part2
	End Get
	Set (ByVal Value As Integer)
		intId_Part2 = Value
	End Set
	End Property

	Public Property Part2_Name As String
	Get
		Return strPart2_Name
	End Get
	Set (ByVal Value As String)
		strPart2_Name = Value
	End Set
	End Property

	Public Property Part2_NameE As String
	Get
		Return strPart2_NameE
	End Get
	Set (ByVal Value As String)
		strPart2_NameE = Value
	End Set
	End Property

	Public Property Id_Part3 As Integer
	Get
		Return intId_Part3
	End Get
	Set (ByVal Value As Integer)
		intId_Part3 = Value
	End Set
	End Property

	Public Property Part3_Name As String
	Get
		Return strPart3_Name
	End Get
	Set (ByVal Value As String)
		strPart3_Name = Value
	End Set
	End Property

	Public Property Id_Part4 As Integer
	Get
		Return intId_Part4
	End Get
	Set (ByVal Value As Integer)
		intId_Part4 = Value
	End Set
	End Property

	Public Property Part4_Name As String
	Get
		Return strPart4_Name
	End Get
	Set (ByVal Value As String)
		strPart4_Name = Value
	End Set
	End Property

	Public Property Addres As String
	Get
		Return strAddres
	End Get
	Set (ByVal Value As String)
		strAddres = Value
	End Set
	End Property

	Public Property Post As String
	Get
		Return strPost
	End Get
	Set (ByVal Value As String)
		strPost = Value
	End Set
	End Property

	Public Property Tel As String
	Get
		Return strTel
	End Get
	Set (ByVal Value As String)
		strTel = Value
	End Set
	End Property

	Public Property DateOpen As String
	Get
		Return strDateOpen
	End Get
	Set (ByVal Value As String)
		strDateOpen = Value
	End Set
	End Property

	Public Property Id_BCenter As String
	Get
		Return strId_BCenter
	End Get
	Set (ByVal Value As String)
		strId_BCenter = Value
	End Set
	End Property

	Public Property Segment As String
	Get
		Return strSegment
	End Get
	Set (ByVal Value As String)
		strSegment = Value
	End Set
	End Property

	Public Sub Print()
		Debug.print("")
		Debug.Print("Id_Branch : " & Id_Branch)
		Debug.Print("Branch_T : " & Branch_T)
		Debug.Print("Branch_E : " & Branch_E)
		Debug.Print("Id_RegG : " & Id_RegG)
		Debug.Print("RegG_Name : " & RegG_Name)
		Debug.Print("RegG_NameE : " & RegG_NameE)
		Debug.Print("Id_RegSub : " & Id_RegSub)
		Debug.Print("Id_Region : " & Id_Region)
		Debug.Print("Region_Name : " & Region_Name)
		Debug.Print("Region_NameE : " & Region_NameE)
		Debug.Print("Id_Province : " & Id_Province)
		Debug.Print("Province : " & Province)
		Debug.Print("Id_ProGDPE : " & Id_ProGDPE)
		Debug.Print("Id_PartN : " & Id_PartN)
		Debug.Print("Part_NameN : " & Part_NameN)
		Debug.Print("Part_NameNE : " & Part_NameNE)
		Debug.Print("Id_RegionOld : " & Id_RegionOld)
		Debug.Print("Region_NameOld : " & Region_NameOld)
		Debug.Print("Region_NameEOld : " & Region_NameEOld)
		Debug.Print("Id_PartOld : " & Id_PartOld)
		Debug.Print("Part_NameOld : " & Part_NameOld)
		Debug.Print("Part_NameEOld : " & Part_NameEOld)
		Debug.Print("Id_Part1 : " & Id_Part1)
		Debug.Print("Part1_Name : " & Part1_Name)
		Debug.Print("Id_Part2 : " & Id_Part2)
		Debug.Print("Part2_Name : " & Part2_Name)
		Debug.Print("Part2_NameE : " & Part2_NameE)
		Debug.Print("Id_Part3 : " & Id_Part3)
		Debug.Print("Part3_Name : " & Part3_Name)
		Debug.Print("Id_Part4 : " & Id_Part4)
		Debug.Print("Part4_Name : " & Part4_Name)
		Debug.Print("Addres : " & Addres)
		Debug.Print("Post : " & Post)
		Debug.Print("Tel : " & Tel)
		Debug.Print("DateOpen : " & DateOpen)
		Debug.Print("Id_BCenter : " & Id_BCenter)
		Debug.Print("Segment : " & Segment)
	End Sub

End Class
