Option Explicit On
Option Strict On

Imports Microsoft.VisualBasic
Imports System.Diagnostics

Public Class StopAction

	Private Const CLSNAME As String = "Class StopAction"

	Private strACTION_ID As String
	Private strACTION_DETAIL As String
	Private strACTION_GROUP As String
	Private intACTION_PRIORITY As Integer

	Public Property ACTION_ID As String
	Get
		Return strACTION_ID
	End Get
	Set (ByVal Value As String)
		strACTION_ID = Value
	End Set
	End Property

	Public Property ACTION_DETAIL As String
	Get
		Return strACTION_DETAIL
	End Get
	Set (ByVal Value As String)
		strACTION_DETAIL = Value
	End Set
	End Property

	Public Property ACTION_GROUP As String
	Get
		Return strACTION_GROUP
	End Get
	Set (ByVal Value As String)
		strACTION_GROUP = Value
	End Set
	End Property

	Public Property ACTION_PRIORITY As Integer
	Get
		Return intACTION_PRIORITY
	End Get
	Set (ByVal Value As Integer)
		intACTION_PRIORITY = Value
	End Set
	End Property

	Public Sub Print()
		Debug.print("")
		Debug.Print("ACTION_ID : " & ACTION_ID)
		Debug.Print("ACTION_DETAIL : " & ACTION_DETAIL)
		Debug.Print("ACTION_GROUP : " & ACTION_GROUP)
		Debug.Print("ACTION_PRIORITY : " & ACTION_PRIORITY)
	End Sub

End Class
