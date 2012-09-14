Option Explicit On
Option Strict On

Imports Microsoft.VisualBasic
Imports System.Diagnostics

Public Class AnnalsCovenantAction

	Private Const CLSNAME As String = "Class AnnalsCovenantAction"

	Private intCOVENANT_ACTION_ID As Integer
	Private strCOVENANT_ACTION As String
	Private intPRIORITY As Integer

	Public Property COVENANT_ACTION_ID As Integer
	Get
		Return intCOVENANT_ACTION_ID
	End Get
	Set (ByVal Value As Integer)
		intCOVENANT_ACTION_ID = Value
	End Set
	End Property

	Public Property COVENANT_ACTION As String
	Get
		Return strCOVENANT_ACTION
	End Get
	Set (ByVal Value As String)
		strCOVENANT_ACTION = Value
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
		Debug.Print("COVENANT_ACTION_ID : " & COVENANT_ACTION_ID)
		Debug.Print("COVENANT_ACTION : " & COVENANT_ACTION)
		Debug.Print("PRIORITY : " & PRIORITY)
	End Sub

End Class
