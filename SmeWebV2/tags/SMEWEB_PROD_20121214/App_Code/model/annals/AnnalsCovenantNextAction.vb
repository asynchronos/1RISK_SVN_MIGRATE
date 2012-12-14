Option Explicit On
Option Strict On

Imports Microsoft.VisualBasic
Imports System.Diagnostics

Public Class AnnalsCovenantNextAction

	Private Const CLSNAME As String = "Class AnnalsCovenantNextAction"

	Private intNEXT_COVENANT_ACTION_ID As Integer
	Private strNEXT_COVENANT_ACTION As String
	Private intPRIORITY As Integer

	Public Property NEXT_COVENANT_ACTION_ID As Integer
	Get
		Return intNEXT_COVENANT_ACTION_ID
	End Get
	Set (ByVal Value As Integer)
		intNEXT_COVENANT_ACTION_ID = Value
	End Set
	End Property

	Public Property NEXT_COVENANT_ACTION As String
	Get
		Return strNEXT_COVENANT_ACTION
	End Get
	Set (ByVal Value As String)
		strNEXT_COVENANT_ACTION = Value
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
		Debug.Print("NEXT_COVENANT_ACTION_ID : " & NEXT_COVENANT_ACTION_ID)
		Debug.Print("NEXT_COVENANT_ACTION : " & NEXT_COVENANT_ACTION)
		Debug.Print("PRIORITY : " & PRIORITY)
	End Sub

End Class
