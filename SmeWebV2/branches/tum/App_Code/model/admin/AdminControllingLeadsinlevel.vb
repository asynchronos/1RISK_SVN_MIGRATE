Option Explicit On
Option Strict On

Imports Microsoft.VisualBasic
Imports System.Diagnostics

Public Class AdminControllingLeadsinlevel

	Private Const CLSNAME As String = "Class AdminControllingLeadsinlevel"

	Private strLEVEL_ID As String
    Private strEMP_ID As String
    Private strEMP_NAME As String  '  tam เพิ่มวันที่ 23/06/09


	Public Property LEVEL_ID As String
	Get
		Return strLEVEL_ID
	End Get
	Set (ByVal Value As String)
		strLEVEL_ID = Value
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
    Public Property EMP_NAME() As String  '  tam เพิ่มวันที่ 23/06/09
        Get
            Return strEMP_Name
        End Get
        Set(ByVal Value As String)
            strEMP_Name = Value
        End Set
    End Property
	Public Sub Print()
		Debug.print("")
		Debug.Print("LEVEL_ID : " & LEVEL_ID)
        Debug.Print("EMP_ID : " & EMP_ID)
        Debug.Print("EMP_NAME : " & EMP_NAME)
    End Sub

End Class
