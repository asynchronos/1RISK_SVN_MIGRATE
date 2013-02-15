Option Explicit On
Option Strict On

Imports Microsoft.VisualBasic
Imports System.Diagnostics

Public Class TbDegree

	Private Const CLSNAME As String = "Class TbDegree"

	Private intDEGREE_CODE As Integer
	Private strDEGREE_NAME As String

	Public Property DEGREE_CODE As Integer
	Get
		Return intDEGREE_CODE
	End Get
	Set (ByVal Value As Integer)
		intDEGREE_CODE = Value
	End Set
	End Property

	Public Property DEGREE_NAME As String
	Get
		Return strDEGREE_NAME
	End Get
	Set (ByVal Value As String)
		strDEGREE_NAME = Value
	End Set
	End Property

	Public Sub Print()
		Debug.print("")
		Debug.Print("DEGREE_CODE : " & DEGREE_CODE)
		Debug.Print("DEGREE_NAME : " & DEGREE_NAME)
	End Sub

End Class
