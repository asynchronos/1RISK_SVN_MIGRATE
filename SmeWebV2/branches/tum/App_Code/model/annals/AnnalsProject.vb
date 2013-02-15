Option Explicit On
Option Strict On

Imports Microsoft.VisualBasic
Imports System.Diagnostics

Public Class AnnalsProject

	Private Const CLSNAME As String = "Class AnnalsProject"

	Private strProject_Code As String
	Private strProject_Name As String
	Private intPriority As Integer

	Public Property Project_Code As String
	Get
		Return strProject_Code
	End Get
	Set (ByVal Value As String)
		strProject_Code = Value
	End Set
	End Property

	Public Property Project_Name As String
	Get
		Return strProject_Name
	End Get
	Set (ByVal Value As String)
		strProject_Name = Value
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
		Debug.Print("Project_Code : " & Project_Code)
		Debug.Print("Project_Name : " & Project_Name)
		Debug.Print("Priority : " & Priority)
	End Sub

End Class
