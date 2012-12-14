Option Explicit On
Option Strict On

Imports Microsoft.VisualBasic
Imports System.Diagnostics

Public Class TbProvince

	Private Const CLSNAME As String = "Class TbProvince"

	Private intPROV_CODE As Integer
	Private strPROV_NAME As String
	Private strPROV_NAME_E As String
	Private strZONE_CODE As String
	Private strAREA_CODE As String

	Public Property PROV_CODE As Integer
	Get
		Return intPROV_CODE
	End Get
	Set (ByVal Value As Integer)
		intPROV_CODE = Value
	End Set
	End Property

	Public Property PROV_NAME As String
	Get
		Return strPROV_NAME
	End Get
	Set (ByVal Value As String)
		strPROV_NAME = Value
	End Set
	End Property

	Public Property PROV_NAME_E As String
	Get
		Return strPROV_NAME_E
	End Get
	Set (ByVal Value As String)
		strPROV_NAME_E = Value
	End Set
	End Property

	Public Property ZONE_CODE As String
	Get
		Return strZONE_CODE
	End Get
	Set (ByVal Value As String)
		strZONE_CODE = Value
	End Set
	End Property

	Public Property AREA_CODE As String
	Get
		Return strAREA_CODE
	End Get
	Set (ByVal Value As String)
		strAREA_CODE = Value
	End Set
	End Property

	Public Sub Print()
		Debug.print("")
		Debug.Print("PROV_CODE : " & PROV_CODE)
		Debug.Print("PROV_NAME : " & PROV_NAME)
		Debug.Print("PROV_NAME_E : " & PROV_NAME_E)
		Debug.Print("ZONE_CODE : " & ZONE_CODE)
		Debug.Print("AREA_CODE : " & AREA_CODE)
	End Sub

End Class
