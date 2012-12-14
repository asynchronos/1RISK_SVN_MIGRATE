Option Explicit On
Option Strict On

Imports Microsoft.VisualBasic
Imports System.Diagnostics

Public Class AnnalsBoard

	Private Const CLSNAME As String = "Class AnnalsBoard"

	Private strId As String
	Private strBoard As String
	Private strMaster_Id As String
	Private intPriority As Integer

	Public Property Id As String
	Get
		Return strId
	End Get
	Set (ByVal Value As String)
		strId = Value
	End Set
	End Property

	Public Property Board As String
	Get
		Return strBoard
	End Get
	Set (ByVal Value As String)
		strBoard = Value
	End Set
	End Property

	Public Property Master_Id As String
	Get
		Return strMaster_Id
	End Get
	Set (ByVal Value As String)
		strMaster_Id = Value
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
		Debug.Print("Id : " & Id)
		Debug.Print("Board : " & Board)
		Debug.Print("Master_Id : " & Master_Id)
		Debug.Print("Priority : " & Priority)
	End Sub

End Class
