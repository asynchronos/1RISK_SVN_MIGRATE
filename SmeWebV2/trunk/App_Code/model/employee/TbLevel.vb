Option Explicit On
Option Strict On

Imports Microsoft.VisualBasic
Imports System.Diagnostics

Public Class TbLevel

	Private Const CLSNAME As String = "Class TbLevel"

	Private intLevel_id As Integer
	Private strLevel_Code As String
	Private strLevel_Name As String
	Private intLevel_Root As Integer

	Public Property Level_id As Integer
	Get
		Return intLevel_id
	End Get
	Set (ByVal Value As Integer)
		intLevel_id = Value
	End Set
	End Property

	Public Property Level_Code As String
	Get
		Return strLevel_Code
	End Get
	Set (ByVal Value As String)
		strLevel_Code = Value
	End Set
	End Property

	Public Property Level_Name As String
	Get
		Return strLevel_Name
	End Get
	Set (ByVal Value As String)
		strLevel_Name = Value
	End Set
	End Property

	Public Property Level_Root As Integer
	Get
		Return intLevel_Root
	End Get
	Set (ByVal Value As Integer)
		intLevel_Root = Value
	End Set
	End Property

	Public Sub Print()
		Debug.print("")
		Debug.Print("Level_id : " & Level_id)
		Debug.Print("Level_Code : " & Level_Code)
		Debug.Print("Level_Name : " & Level_Name)
		Debug.Print("Level_Root : " & Level_Root)
	End Sub

End Class
