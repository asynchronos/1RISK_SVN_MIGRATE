Option Explicit On
Option Strict On

Imports Microsoft.VisualBasic
Imports System.Diagnostics

Public Class AnnalsCreditProcess

	Private Const CLSNAME As String = "Class AnnalsCreditProcess"

	Private strID As String
    Private strEMP_ID As String
    Private strUSER_ID As String
    Private strPROCESS_ID As String
	Private dtPROCESS_DATE As Date

	Public Property ID As String
	Get
		Return strID
	End Get
	Set (ByVal Value As String)
		strID = Value
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
    Public Property USER_ID() As String
        Get
            Return strUSER_ID
        End Get
        Set(ByVal Value As String)
            strUSER_ID = Value
        End Set
    End Property
	Public Property PROCESS_ID As String
	Get
		Return strPROCESS_ID
	End Get
	Set (ByVal Value As String)
		strPROCESS_ID = Value
	End Set
	End Property

	Public Property PROCESS_DATE As Date
	Get
		Return dtPROCESS_DATE
	End Get
	Set (ByVal Value As Date)
		dtPROCESS_DATE = Value
	End Set
	End Property

	Public Sub Print()
		Debug.print("")
		Debug.Print("ID : " & ID)
        Debug.Print("EMP_ID : " & EMP_ID)
        Debug.Print("USER_ID : " & USER_ID)
        Debug.Print("PROCESS_ID : " & PROCESS_ID)
		Debug.Print("PROCESS_DATE : " & PROCESS_DATE)
	End Sub

End Class
