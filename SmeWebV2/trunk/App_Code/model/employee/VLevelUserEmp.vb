Option Explicit On
Option Strict On

Imports Microsoft.VisualBasic
Imports System.Diagnostics

Public Class VLevelUserEmp

	Private Const CLSNAME As String = "Class VLevelUserEmp"

	Private strLEVEL_ID As String
	Private strLEVEL_CODE As String
	Private strLEVEL_NAME As String
	Private strLEVEL_ROOT As String
	Private strEMP_ID As String
	Private strTITLE_NAME As String
	Private intTITLE_CODE As Integer
	Private strEMPNAME As String
	Private strEMPSURNAME As String

	Public Property LEVEL_ID As String
	Get
		Return strLEVEL_ID
	End Get
	Set (ByVal Value As String)
		strLEVEL_ID = Value
	End Set
	End Property

	Public Property LEVEL_CODE As String
	Get
		Return strLEVEL_CODE
	End Get
	Set (ByVal Value As String)
		strLEVEL_CODE = Value
	End Set
	End Property

	Public Property LEVEL_NAME As String
	Get
		Return strLEVEL_NAME
	End Get
	Set (ByVal Value As String)
		strLEVEL_NAME = Value
	End Set
	End Property

	Public Property LEVEL_ROOT As String
	Get
		Return strLEVEL_ROOT
	End Get
	Set (ByVal Value As String)
		strLEVEL_ROOT = Value
	End Set
	End Property

	Public Property EMP_ID As String
	Get
		Return strEMP_ID
	End Get
	Set (ByVal Value As String)
		strEMP_ID = Value
	End Set
	End Property

	Public Property TITLE_NAME As String
	Get
		Return strTITLE_NAME
	End Get
	Set (ByVal Value As String)
		strTITLE_NAME = Value
	End Set
	End Property

	Public Property TITLE_CODE As Integer
	Get
		Return intTITLE_CODE
	End Get
	Set (ByVal Value As Integer)
		intTITLE_CODE = Value
	End Set
	End Property

	Public Property EMPNAME As String
	Get
		Return strEMPNAME
	End Get
	Set (ByVal Value As String)
		strEMPNAME = Value
	End Set
	End Property

	Public Property EMPSURNAME As String
	Get
		Return strEMPSURNAME
	End Get
	Set (ByVal Value As String)
		strEMPSURNAME = Value
	End Set
	End Property

	Public Sub Print()
		Debug.print("")
		Debug.Print("LEVEL_ID : " & LEVEL_ID)
		Debug.Print("LEVEL_CODE : " & LEVEL_CODE)
		Debug.Print("LEVEL_NAME : " & LEVEL_NAME)
		Debug.Print("LEVEL_ROOT : " & LEVEL_ROOT)
		Debug.Print("EMP_ID : " & EMP_ID)
		Debug.Print("TITLE_NAME : " & TITLE_NAME)
		Debug.Print("TITLE_CODE : " & TITLE_CODE)
		Debug.Print("EMPNAME : " & EMPNAME)
		Debug.Print("EMPSURNAME : " & EMPSURNAME)
	End Sub

End Class
