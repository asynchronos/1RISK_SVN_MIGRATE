Option Explicit On
Option Strict On

Imports Microsoft.VisualBasic
Imports System.Diagnostics

Public Class StopPayDetail

	Private Const CLSNAME As String = "Class StopPayDetail"

	Private strPAY_DETAIL_ID As String
	Private strPAY_DETAIL As String

	Public Property PAY_DETAIL_ID As String
	Get
		Return strPAY_DETAIL_ID
	End Get
	Set (ByVal Value As String)
		strPAY_DETAIL_ID = Value
	End Set
	End Property

	Public Property PAY_DETAIL As String
	Get
		Return strPAY_DETAIL
	End Get
	Set (ByVal Value As String)
		strPAY_DETAIL = Value
	End Set
	End Property

	Public Sub Print()
		Debug.print("")
		Debug.Print("PAY_DETAIL_ID : " & PAY_DETAIL_ID)
		Debug.Print("PAY_DETAIL : " & PAY_DETAIL)
	End Sub

End Class
