Option Explicit On
Option Strict On

Imports Microsoft.VisualBasic
Imports System.Diagnostics

Public Class TbTitle

	Private Const CLSNAME As String = "Class TbTitle"

	Private intTITLE_CODE As Integer
	Private strTITLE_NAME As String
	Private strTITLE_NAME_E As String

	Public Property TITLE_CODE As Integer
	Get
		Return intTITLE_CODE
	End Get
	Set (ByVal Value As Integer)
		intTITLE_CODE = Value
	End Set
	End Property

	Public Property TITLE_NAME As String
	Get
		Return strTITLE_NAME
	End Get
	Set (ByVal Value As String)
		strTITLE_NAME = Value
	End Set
	End Property

	Public Property TITLE_NAME_E As String
	Get
		Return strTITLE_NAME_E
	End Get
	Set (ByVal Value As String)
		strTITLE_NAME_E = Value
	End Set
	End Property

	Public Sub Print()
		Debug.print("")
		Debug.Print("TITLE_CODE : " & TITLE_CODE)
		Debug.Print("TITLE_NAME : " & TITLE_NAME)
		Debug.Print("TITLE_NAME_E : " & TITLE_NAME_E)
	End Sub

End Class
