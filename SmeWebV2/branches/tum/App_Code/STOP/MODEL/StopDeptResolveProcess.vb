Option Explicit On
Option Strict On

Imports Microsoft.VisualBasic
Imports System.Diagnostics

Public Class StopDeptResolveProcess

	Private Const CLSNAME As String = "Class StopDeptResolveProcess"

	Private strDEPT_RESOLVE_ID As String
	Private strDEPT_RESOLVE_DETAIL As String

	Public Property DEPT_RESOLVE_ID As String
	Get
		Return strDEPT_RESOLVE_ID
	End Get
	Set (ByVal Value As String)
		strDEPT_RESOLVE_ID = Value
	End Set
	End Property

	Public Property DEPT_RESOLVE_DETAIL As String
	Get
		Return strDEPT_RESOLVE_DETAIL
	End Get
	Set (ByVal Value As String)
		strDEPT_RESOLVE_DETAIL = Value
	End Set
	End Property

	Public Sub Print()
		Debug.print("")
		Debug.Print("DEPT_RESOLVE_ID : " & DEPT_RESOLVE_ID)
		Debug.Print("DEPT_RESOLVE_DETAIL : " & DEPT_RESOLVE_DETAIL)
	End Sub

End Class
