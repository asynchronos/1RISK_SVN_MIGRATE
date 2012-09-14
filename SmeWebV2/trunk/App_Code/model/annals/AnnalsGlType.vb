Option Explicit On
Option Strict On

Imports Microsoft.VisualBasic
Imports System.Diagnostics

Public Class AnnalsGlType

	Private Const CLSNAME As String = "Class AnnalsGlType"

	Private strDECB_RD_ID As String
	Private strDECB_RD As String

	Public Property DECB_RD_ID As String
	Get
		Return strDECB_RD_ID
	End Get
	Set (ByVal Value As String)
		strDECB_RD_ID = Value
	End Set
	End Property

	Public Property DECB_RD As String
	Get
		Return strDECB_RD
	End Get
	Set (ByVal Value As String)
		strDECB_RD = Value
	End Set
	End Property

	Public Sub Print()
		Debug.print("")
		Debug.Print("DECB_RD_ID : " & DECB_RD_ID)
		Debug.Print("DECB_RD : " & DECB_RD)
	End Sub

End Class
