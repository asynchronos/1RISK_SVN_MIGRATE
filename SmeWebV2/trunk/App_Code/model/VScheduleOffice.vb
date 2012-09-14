Option Explicit On
Option Strict On

Imports Microsoft.VisualBasic
Imports System.Diagnostics

Public Class VScheduleOffice

	Private Const CLSNAME As String = "Class VScheduleOffice"

	Private intID As Integer
	Private strName As String
	Private strDept_Name As String
	Private strtel As String

	Public Property ID As Integer
	Get
		Return intID
	End Get
	Set (ByVal Value As Integer)
		intID = Value
	End Set
	End Property

	Public Property Name As String
	Get
		Return strName
	End Get
	Set (ByVal Value As String)
		strName = Value
	End Set
	End Property

	Public Property Dept_Name As String
	Get
		Return strDept_Name
	End Get
	Set (ByVal Value As String)
		strDept_Name = Value
	End Set
	End Property

	Public Property tel As String
	Get
		Return strtel
	End Get
	Set (ByVal Value As String)
		strtel = Value
	End Set
	End Property

	Public Sub Print()
		Debug.print("")
		Debug.Print("ID : " & ID)
		Debug.Print("Name : " & Name)
		Debug.Print("Dept_Name : " & Dept_Name)
		Debug.Print("tel : " & tel)
	End Sub

End Class
