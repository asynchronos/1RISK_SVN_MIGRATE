Option Explicit On
Option Strict On

Imports Microsoft.VisualBasic
Imports System.Diagnostics

Public Class AnnalsCovenantType

	Private Const CLSNAME As String = "Class AnnalsCovenantType"

    Private intCOVENANT_TYPE_ID As String
	Private strCOVENANT_TYPE As String
	Private intPRIORITY As Integer

    Public Property COVENANT_TYPE_ID() As String
        Get
            Return intCOVENANT_TYPE_ID
        End Get
        Set(ByVal Value As String)
            intCOVENANT_TYPE_ID = Value
        End Set
    End Property

	Public Property COVENANT_TYPE As String
	Get
		Return strCOVENANT_TYPE
	End Get
	Set (ByVal Value As String)
		strCOVENANT_TYPE = Value
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
		Debug.Print("COVENANT_TYPE_ID : " & COVENANT_TYPE_ID)
		Debug.Print("COVENANT_TYPE : " & COVENANT_TYPE)
		Debug.Print("PRIORITY : " & PRIORITY)
	End Sub

End Class
