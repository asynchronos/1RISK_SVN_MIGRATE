Option Explicit On
Option Strict On

Imports Microsoft.VisualBasic
Imports System.Diagnostics

Public Class UploadFileType

	Private Const CLSNAME As String = "Class UploadFileType"

	Private strID As String
	Private strTYPE As String

	Public Property ID As String
	Get
		Return strID
	End Get
	Set (ByVal Value As String)
		strID = Value
	End Set
	End Property

	Public Property TYPE As String
	Get
		Return strTYPE
	End Get
	Set (ByVal Value As String)
		strTYPE = Value
	End Set
	End Property

	Public Sub Print()
		Debug.print("")
		Debug.Print("ID : " & ID)
		Debug.Print("TYPE : " & TYPE)
	End Sub

End Class
