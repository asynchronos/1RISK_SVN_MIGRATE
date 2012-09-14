Option Explicit On
Option Strict On

Imports Microsoft.VisualBasic
Imports System.Diagnostics

Public Class AnnalsCovenantDetail

	Private Const CLSNAME As String = "Class AnnalsCovenantDetail"

    Private intCOVENANT_DETAIL_ID As String
    Private strCOVENANT_DETAIL As String
    Private strCOVENANT_DETAIL_SHORT As String
    Private intPRIORITY As Integer
    Private intCOVENANT_TYPE_ID As String

    Public Property COVENANT_DETAIL_ID() As String
        Get
            Return intCOVENANT_DETAIL_ID
        End Get
        Set(ByVal Value As String)
            intCOVENANT_DETAIL_ID = Value
        End Set
    End Property

    Public Property COVENANT_DETAIL() As String
        Get
            Return strCOVENANT_DETAIL
        End Get
        Set(ByVal Value As String)
            strCOVENANT_DETAIL = Value
        End Set
    End Property
    Public Property COVENANT_DETAIL_SHORT() As String
        Get
            Return strCOVENANT_DETAIL_SHORT
        End Get
        Set(ByVal Value As String)
            strCOVENANT_DETAIL_SHORT = Value
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

    Public Property COVENANT_TYPE_ID() As String
        Get
            Return intCOVENANT_TYPE_ID
        End Get
        Set(ByVal Value As String)
            intCOVENANT_TYPE_ID = Value
        End Set
    End Property

	Public Sub Print()
		Debug.print("")
		Debug.Print("COVENANT_DETAIL_ID : " & COVENANT_DETAIL_ID)
		Debug.Print("COVENANT_DETAIL : " & COVENANT_DETAIL)
		Debug.Print("PRIORITY : " & PRIORITY)
		Debug.Print("COVENANT_TYPE_ID : " & COVENANT_TYPE_ID)
	End Sub

End Class
