Option Explicit On
Option Strict On

Imports Microsoft.VisualBasic
Imports System.Diagnostics

Public Class CustomerSmeSize

	Private Const CLSNAME As String = "Class CustomerSmeSize"

	Private intSIZE_ID As Integer
	Private strSIZE_DETAIL As String
	Private intPRIORITY As Integer

	Public Property SIZE_ID As Integer
	Get
		Return intSIZE_ID
	End Get
	Set (ByVal Value As Integer)
		intSIZE_ID = Value
	End Set
	End Property

	Public Property SIZE_DETAIL As String
	Get
		Return strSIZE_DETAIL
	End Get
	Set (ByVal Value As String)
		strSIZE_DETAIL = Value
	End Set
	End Property

	Public Property PRIORITY As Integer
	Get
		Return intPRIORITY
	End Get
	Set (ByVal Value As Integer)
		intPRIORITY = Value
	End Set
	End Property

	Public Sub Print()
		Debug.print("")
		Debug.Print("SIZE_ID : " & SIZE_ID)
		Debug.Print("SIZE_DETAIL : " & SIZE_DETAIL)
		Debug.Print("PRIORITY : " & PRIORITY)
	End Sub

End Class
