Option Explicit On
Option Strict On

Imports Microsoft.VisualBasic
Imports System.Diagnostics

Public Class AnnalsCusNcb

	Private Const CLSNAME As String = "Class AnnalsCusNcb"

	Private strID As String
	Private intCIF As Integer
	Private strCUS_NCB_TYPE_ID As String
	Private dtCUS_NCB_DATE As Date
	Private intCUS_NCB_TYPE_DETAIL_ID As Integer
	Private strDETAIL As String
	Private intDEPT_ID As Integer
	Private intCUS_TYPE_ID As Integer
	Private strAUTH_1_ID As String
	Private strAUTH_2_ID As String

	Public Property ID As String
	Get
		Return strID
	End Get
	Set (ByVal Value As String)
		strID = Value
	End Set
	End Property

	Public Property CIF As Integer
	Get
		Return intCIF
	End Get
	Set (ByVal Value As Integer)
		intCIF = Value
	End Set
	End Property

	Public Property CUS_NCB_TYPE_ID As String
	Get
		Return strCUS_NCB_TYPE_ID
	End Get
	Set (ByVal Value As String)
		strCUS_NCB_TYPE_ID = Value
	End Set
	End Property

	Public Property CUS_NCB_DATE As Date
	Get
		Return dtCUS_NCB_DATE
	End Get
	Set (ByVal Value As Date)
		dtCUS_NCB_DATE = Value
	End Set
	End Property

	Public Property CUS_NCB_TYPE_DETAIL_ID As Integer
	Get
		Return intCUS_NCB_TYPE_DETAIL_ID
	End Get
	Set (ByVal Value As Integer)
		intCUS_NCB_TYPE_DETAIL_ID = Value
	End Set
	End Property

	Public Property DETAIL As String
	Get
		Return strDETAIL
	End Get
	Set (ByVal Value As String)
		strDETAIL = Value
	End Set
	End Property

	Public Property DEPT_ID As Integer
	Get
		Return intDEPT_ID
	End Get
	Set (ByVal Value As Integer)
		intDEPT_ID = Value
	End Set
	End Property

	Public Property CUS_TYPE_ID As Integer
	Get
		Return intCUS_TYPE_ID
	End Get
	Set (ByVal Value As Integer)
		intCUS_TYPE_ID = Value
	End Set
	End Property

	Public Property AUTH_1_ID As String
	Get
		Return strAUTH_1_ID
	End Get
	Set (ByVal Value As String)
		strAUTH_1_ID = Value
	End Set
	End Property

	Public Property AUTH_2_ID As String
	Get
		Return strAUTH_2_ID
	End Get
	Set (ByVal Value As String)
		strAUTH_2_ID = Value
	End Set
	End Property

	Public Sub Print()
		Debug.print("")
		Debug.Print("ID : " & ID)
		Debug.Print("CIF : " & CIF)
		Debug.Print("CUS_NCB_TYPE_ID : " & CUS_NCB_TYPE_ID)
		Debug.Print("CUS_NCB_DATE : " & CUS_NCB_DATE)
		Debug.Print("CUS_NCB_TYPE_DETAIL_ID : " & CUS_NCB_TYPE_DETAIL_ID)
		Debug.Print("DETAIL : " & DETAIL)
		Debug.Print("DEPT_ID : " & DEPT_ID)
		Debug.Print("CUS_TYPE_ID : " & CUS_TYPE_ID)
		Debug.Print("AUTH_1_ID : " & AUTH_1_ID)
		Debug.Print("AUTH_2_ID : " & AUTH_2_ID)
	End Sub

End Class
