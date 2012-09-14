Option Explicit On
Option Strict On

Imports Microsoft.VisualBasic
Imports System.Diagnostics

Public Class TbEmptraning

	Private Const CLSNAME As String = "Class TbEmptraning"

	Private intID_NO As Integer
	Private strEMP_ID As String
	Private strNAMETRAIN As String
	Private strPLACE As String
	Private dtSTARTDATE As Date
	Private dtFINISHDATE As Date
	Private strIN_OUT As String
	Private dtUP_DT As Date

	Public Property ID_NO As Integer
	Get
		Return intID_NO
	End Get
	Set (ByVal Value As Integer)
		intID_NO = Value
	End Set
	End Property

	Public Property EMP_ID As String
	Get
		Return strEMP_ID
	End Get
	Set (ByVal Value As String)
		strEMP_ID = Value
	End Set
	End Property

	Public Property NAMETRAIN As String
	Get
		Return strNAMETRAIN
	End Get
	Set (ByVal Value As String)
		strNAMETRAIN = Value
	End Set
	End Property

	Public Property PLACE As String
	Get
		Return strPLACE
	End Get
	Set (ByVal Value As String)
		strPLACE = Value
	End Set
	End Property

	Public Property STARTDATE As Date
	Get
		Return dtSTARTDATE
	End Get
	Set (ByVal Value As Date)
		dtSTARTDATE = Value
	End Set
	End Property

	Public Property FINISHDATE As Date
	Get
		Return dtFINISHDATE
	End Get
	Set (ByVal Value As Date)
		dtFINISHDATE = Value
	End Set
	End Property

	Public Property IN_OUT As String
	Get
		Return strIN_OUT
	End Get
	Set (ByVal Value As String)
		strIN_OUT = Value
	End Set
	End Property

	Public Property UP_DT As Date
	Get
		Return dtUP_DT
	End Get
	Set (ByVal Value As Date)
		dtUP_DT = Value
	End Set
	End Property

	Public Sub Print()
		Debug.print("")
		Debug.Print("ID_NO : " & ID_NO)
		Debug.Print("EMP_ID : " & EMP_ID)
		Debug.Print("NAMETRAIN : " & NAMETRAIN)
		Debug.Print("PLACE : " & PLACE)
		Debug.Print("STARTDATE : " & STARTDATE)
		Debug.Print("FINISHDATE : " & FINISHDATE)
		Debug.Print("IN_OUT : " & IN_OUT)
		Debug.Print("UP_DT : " & UP_DT)
	End Sub

End Class
