Option Explicit On
Option Strict On

Imports Microsoft.VisualBasic
Imports System.Diagnostics

Public Class AnnalsSubCommittee

	Private Const CLSNAME As String = "Class AnnalsSubCommittee"

	Private intID As Integer
    Private strEMP_ID As String
    Private strEMP_NAME As String
    Private intPRIORITY As Integer
    Public Property ID() As Integer
        Get
            Return intID
        End Get
        Set(ByVal Value As Integer)
            intID = Value
        End Set
    End Property

    Public Property EMP_ID() As String
        Get
            Return strEMP_ID
        End Get
        Set(ByVal Value As String)
            strEMP_ID = Value
        End Set
    End Property

    Public Property EMP_NAME() As String
        Get
            Return strEMP_NAME
        End Get
        Set(ByVal Value As String)
            strEMP_NAME = Value
        End Set
    End Property

	Public Property PRIORITY As Integer
	Get
		Return intPRIORITY
	End Get
	Set (ByVal Value As Integer)
		intPRIORITY = Value
	End Set
	End Property

	Public Sub Print()
		Debug.print("")
		Debug.Print("ID : " & ID)
        Debug.Print("EMP_ID : " & EMP_ID)
        Debug.Print("EMP_NAME : " & EMP_NAME)
        Debug.Print("PRIORITY : " & PRIORITY)
	End Sub

End Class
