Option Explicit On
Option Strict On

Imports Microsoft.VisualBasic
Imports System.Diagnostics

Public Class AnnalsJudgement

	Private Const CLSNAME As String = "Class AnnalsJudgement"

	Private strID As String
	Private strJudgement As String

	Public Property ID As String
	Get
		Return strID
	End Get
	Set (ByVal Value As String)
		strID = Value
	End Set
	End Property

	Public Property Judgement As String
	Get
		Return strJudgement
	End Get
	Set (ByVal Value As String)
		strJudgement = Value
	End Set
	End Property

	Public Sub Print()
		Debug.print("")
		Debug.Print("ID : " & ID)
		Debug.Print("Judgement : " & Judgement)
	End Sub

End Class
