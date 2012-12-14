Option Explicit On
Option Strict On

Imports Microsoft.VisualBasic
Imports System.Diagnostics

Public Class VUploadfile

	Private Const CLSNAME As String = "Class VUploadfile"

	Private intID As Integer
	Private strUSER_ID As String
	Private strREMARK As String
	Private strTYPE As String
	Private strCOLL_ID As String
	Private strANNALS_ID As String
	Private strPATH As String
	Private dtCREATE_DATE As Date
    Private intFILE_TYPE As Integer
    Private intFILE_YEAR As Integer


	Public Property ID As Integer
	Get
		Return intID
	End Get
	Set (ByVal Value As Integer)
		intID = Value
	End Set
	End Property

	Public Property USER_ID As String
	Get
		Return strUSER_ID
	End Get
	Set (ByVal Value As String)
		strUSER_ID = Value
	End Set
	End Property

	Public Property REMARK As String
	Get
		Return strREMARK
	End Get
	Set (ByVal Value As String)
		strREMARK = Value
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

	Public Property COLL_ID As String
	Get
		Return strCOLL_ID
	End Get
	Set (ByVal Value As String)
		strCOLL_ID = Value
	End Set
	End Property

	Public Property ANNALS_ID As String
	Get
		Return strANNALS_ID
	End Get
	Set (ByVal Value As String)
		strANNALS_ID = Value
	End Set
	End Property

	Public Property PATH As String
	Get
		Return strPATH
	End Get
	Set (ByVal Value As String)
		strPATH = Value
	End Set
	End Property

	Public Property CREATE_DATE As Date
	Get
		Return dtCREATE_DATE
	End Get
	Set (ByVal Value As Date)
		dtCREATE_DATE = Value
	End Set
	End Property

    Public Property FILE_TYPE As Integer
        Get
            Return intFILE_TYPE
        End Get
        Set(ByVal Value As Integer)
            intFILE_TYPE = Value
        End Set
    End Property
    Public Property FILE_YEAR As Integer
        Get
            Return intFILE_YEAR
        End Get
        Set(ByVal Value As Integer)
            intFILE_YEAR = Value
        End Set
    End Property

	Public Sub Print()
		Debug.print("")
		Debug.Print("ID : " & ID)
		Debug.Print("USER_ID : " & USER_ID)
		Debug.Print("REMARK : " & REMARK)
		Debug.Print("TYPE : " & TYPE)
		Debug.Print("COLL_ID : " & COLL_ID)
		Debug.Print("ANNALS_ID : " & ANNALS_ID)
		Debug.Print("PATH : " & PATH)
		Debug.Print("CREATE_DATE : " & CREATE_DATE)
		Debug.Print("FILE_TYPE : " & FILE_TYPE)
	End Sub

End Class
