Option Explicit On
Option Strict On

Imports Microsoft.VisualBasic
Imports System.Diagnostics

Public Class AdminControllingUsersinlevel

	Private Const CLSNAME As String = "Class AdminControllingUsersinlevel"

	Private strLEVEL_ID As String
	Private strEMP_ID As String

	Public Property LEVEL_ID As String
	Get
		Return strLEVEL_ID
	End Get
	Set (ByVal Value As String)
		strLEVEL_ID = Value
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

	Public Sub Print()
		Debug.print("")
		Debug.Print("LEVEL_ID : " & LEVEL_ID)
		Debug.Print("EMP_ID : " & EMP_ID)
	End Sub

End Class
