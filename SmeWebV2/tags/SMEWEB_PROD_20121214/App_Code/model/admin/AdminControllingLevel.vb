Option Explicit On
Option Strict On

Imports Microsoft.VisualBasic
Imports System.Diagnostics

Public Class AdminControllingLevel

	Private Const CLSNAME As String = "Class AdminControllingLevel"

	Private strLEVEL_ID As String
	Private strLEVEL_CODE As String
	Private strLEVEL_NAME As String
	Private strLEVEL_ROOT As String

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

	Public Sub Print()
		Debug.print("")
		Debug.Print("LEVEL_ID : " & LEVEL_ID)
		Debug.Print("LEVEL_CODE : " & LEVEL_CODE)
		Debug.Print("LEVEL_NAME : " & LEVEL_NAME)
		Debug.Print("LEVEL_ROOT : " & LEVEL_ROOT)
	End Sub

End Class
