Option Explicit On
Option Strict On

Imports Microsoft.VisualBasic
Imports System.Diagnostics

Public Class AnnalsAuthority

	Private Const CLSNAME As String = "Class AnnalsAuthority"

	Private strAuthority_id As String
	Private strAuthority As String
	Private intPriority As Integer

	Public Property Authority_id As String
	Get
		Return strAuthority_id
	End Get
	Set (ByVal Value As String)
		strAuthority_id = Value
	End Set
	End Property

	Public Property Authority As String
	Get
		Return strAuthority
	End Get
	Set (ByVal Value As String)
		strAuthority = Value
	End Set
	End Property

	Public Property Priority As Integer
	Get
		Return intPriority
	End Get
	Set (ByVal Value As Integer)
		intPriority = Value
	End Set
	End Property

	Public Sub Print()
		Debug.print("")
		Debug.Print("Authority_id : " & Authority_id)
		Debug.Print("Authority : " & Authority)
		Debug.Print("Priority : " & Priority)
	End Sub

End Class
