Option Explicit On
Option Strict On

Imports Microsoft.VisualBasic
Imports System.Diagnostics

Public Class AnnalsCusNcbExceptType

	Private Const CLSNAME As String = "Class AnnalsCusNcbExceptType"

	Private intCUS_NCB_EXCEPT_TYPE_ID As Integer
	Private strCUS_NCB_EXCEPT_TYPE As String
	Private intPIORITY As Integer

	Public Property CUS_NCB_EXCEPT_TYPE_ID As Integer
	Get
		Return intCUS_NCB_EXCEPT_TYPE_ID
	End Get
	Set (ByVal Value As Integer)
		intCUS_NCB_EXCEPT_TYPE_ID = Value
	End Set
	End Property

	Public Property CUS_NCB_EXCEPT_TYPE As String
	Get
		Return strCUS_NCB_EXCEPT_TYPE
	End Get
	Set (ByVal Value As String)
		strCUS_NCB_EXCEPT_TYPE = Value
	End Set
	End Property

	Public Property PIORITY As Integer
	Get
		Return intPIORITY
	End Get
	Set (ByVal Value As Integer)
		intPIORITY = Value
	End Set
	End Property

	Public Sub Print()
		Debug.print("")
		Debug.Print("CUS_NCB_EXCEPT_TYPE_ID : " & CUS_NCB_EXCEPT_TYPE_ID)
		Debug.Print("CUS_NCB_EXCEPT_TYPE : " & CUS_NCB_EXCEPT_TYPE)
		Debug.Print("PIORITY : " & PIORITY)
	End Sub

End Class
