Option Explicit On
Option Strict On

Imports Microsoft.VisualBasic
Imports System.Diagnostics

Public Class StopPayAbility

	Private Const CLSNAME As String = "Class StopPayAbility"

	Private strPAY_ABILITY_ID As String
	Private strPAY_ABILITY_DETAIL As String

	Public Property PAY_ABILITY_ID As String
	Get
		Return strPAY_ABILITY_ID
	End Get
	Set (ByVal Value As String)
		strPAY_ABILITY_ID = Value
	End Set
	End Property

	Public Property PAY_ABILITY_DETAIL As String
	Get
		Return strPAY_ABILITY_DETAIL
	End Get
	Set (ByVal Value As String)
		strPAY_ABILITY_DETAIL = Value
	End Set
	End Property

	Public Sub Print()
		Debug.print("")
		Debug.Print("PAY_ABILITY_ID : " & PAY_ABILITY_ID)
		Debug.Print("PAY_ABILITY_DETAIL : " & PAY_ABILITY_DETAIL)
	End Sub

End Class
