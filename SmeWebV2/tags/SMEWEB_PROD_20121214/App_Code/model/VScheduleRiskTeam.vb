Option Explicit On
Option Strict On

Imports Microsoft.VisualBasic
Imports System.Diagnostics

Public Class VScheduleRiskTeam

	Private Const CLSNAME As String = "Class VScheduleRiskTeam"

	Private strID As String
	Private strName As String
	Private strTeam_name As String
	Private strTel As String

	Public Property ID As String
	Get
		Return strID
	End Get
	Set (ByVal Value As String)
		strID = Value
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

	Public Property Team_name As String
	Get
		Return strTeam_name
	End Get
	Set (ByVal Value As String)
		strTeam_name = Value
	End Set
	End Property

	Public Property Tel As String
	Get
		Return strTel
	End Get
	Set (ByVal Value As String)
		strTel = Value
	End Set
	End Property

	Public Sub Print()
		Debug.print("")
		Debug.Print("ID : " & ID)
		Debug.Print("Name : " & Name)
		Debug.Print("Team_name : " & Team_name)
		Debug.Print("Tel : " & Tel)
	End Sub

End Class
