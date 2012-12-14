Option Explicit On
Option Strict On

Imports Microsoft.VisualBasic
Imports System.Diagnostics

Public Class TbPosition

	Private Const CLSNAME As String = "Class TbPosition"

	Private strPOSITION_CODE As String
	Private strPOSITON As String
	Private strPOSITION_ENG As String

	Public Property POSITION_CODE As String
	Get
		Return strPOSITION_CODE
	End Get
	Set (ByVal Value As String)
		strPOSITION_CODE = Value
	End Set
	End Property

	Public Property POSITON As String
	Get
		Return strPOSITON
	End Get
	Set (ByVal Value As String)
		strPOSITON = Value
	End Set
	End Property

	Public Property POSITION_ENG As String
	Get
		Return strPOSITION_ENG
	End Get
	Set (ByVal Value As String)
		strPOSITION_ENG = Value
	End Set
	End Property

	Public Sub Print()
		Debug.print("")
		Debug.Print("POSITION_CODE : " & POSITION_CODE)
		Debug.Print("POSITON : " & POSITON)
		Debug.Print("POSITION_ENG : " & POSITION_ENG)
	End Sub

End Class
