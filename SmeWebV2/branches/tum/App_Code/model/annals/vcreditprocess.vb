Option Explicit On
Option Strict On

Imports Microsoft.VisualBasic
Imports System.Diagnostics

Public Class vcreditprocess

	Private Const CLSNAME As String = "Class vcreditprocess"

	Private strID As String
	Private strPROCESS As String
	Private dtprocess_date As Date

	Public Property ID As String
	Get
		Return strID
	End Get
	Set (ByVal Value As String)
		strID = Value
	End Set
	End Property

	Public Property PROCESS As String
	Get
		Return strPROCESS
	End Get
	Set (ByVal Value As String)
		strPROCESS = Value
	End Set
	End Property

	Public Property process_date As Date
	Get
		Return dtprocess_date
	End Get
	Set (ByVal Value As Date)
		dtprocess_date = Value
	End Set
	End Property

	Public Sub Print()
		Debug.print("")
		Debug.Print("ID : " & ID)
		Debug.Print("PROCESS : " & PROCESS)
		Debug.Print("process_date : " & process_date)
	End Sub

End Class