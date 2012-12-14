Option Explicit On
Option Strict On

Imports Microsoft.VisualBasic
Imports System.Diagnostics

Public Class AnnalsCusNcbTypeDetail

	Private Const CLSNAME As String = "Class AnnalsCusNcbTypeDetail"

	Private intCUS_NCB_TYPE_DETAIL_ID As Integer
	Private intCUS_NCB_TYPE_ID As Integer
	Private strCUS_NCB_TYPE_DETAIL As String
	Private intPIORITY As Integer
	Private bolDEL_FLAG As Boolean

	Public Property CUS_NCB_TYPE_DETAIL_ID As Integer
	Get
		Return intCUS_NCB_TYPE_DETAIL_ID
	End Get
	Set (ByVal Value As Integer)
		intCUS_NCB_TYPE_DETAIL_ID = Value
	End Set
	End Property

	Public Property CUS_NCB_TYPE_ID As Integer
	Get
		Return intCUS_NCB_TYPE_ID
	End Get
	Set (ByVal Value As Integer)
		intCUS_NCB_TYPE_ID = Value
	End Set
	End Property

	Public Property CUS_NCB_TYPE_DETAIL As String
	Get
		Return strCUS_NCB_TYPE_DETAIL
	End Get
	Set (ByVal Value As String)
		strCUS_NCB_TYPE_DETAIL = Value
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

	Public Property DEL_FLAG As Boolean
	Get
		Return bolDEL_FLAG
	End Get
	Set (ByVal Value As Boolean)
		bolDEL_FLAG = Value
	End Set
	End Property

	Public Sub Print()
		Debug.print("")
		Debug.Print("CUS_NCB_TYPE_DETAIL_ID : " & CUS_NCB_TYPE_DETAIL_ID)
		Debug.Print("CUS_NCB_TYPE_ID : " & CUS_NCB_TYPE_ID)
		Debug.Print("CUS_NCB_TYPE_DETAIL : " & CUS_NCB_TYPE_DETAIL)
		Debug.Print("PIORITY : " & PIORITY)
		Debug.Print("DEL_FLAG : " & DEL_FLAG)
	End Sub

End Class
