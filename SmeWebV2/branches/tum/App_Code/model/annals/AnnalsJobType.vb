Option Explicit On
Option Strict On

Imports Microsoft.VisualBasic
Imports System.Diagnostics

Public Class AnnalsJobType

	Private Const CLSNAME As String = "Class AnnalsJobType"

	Private strJob_Type_Id As String
	Private strJob_Type As String

	Public Property Job_Type_Id As String
	Get
		Return strJob_Type_Id
	End Get
	Set (ByVal Value As String)
		strJob_Type_Id = Value
	End Set
	End Property

	Public Property Job_Type As String
	Get
		Return strJob_Type
	End Get
	Set (ByVal Value As String)
		strJob_Type = Value
	End Set
	End Property

	Public Sub Print()
		Debug.print("")
		Debug.Print("Job_Type_Id : " & Job_Type_Id)
		Debug.Print("Job_Type : " & Job_Type)
	End Sub

End Class
