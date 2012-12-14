Option Explicit On
Option Strict On

Imports Microsoft.VisualBasic
Imports System.Diagnostics

Public Class AnnalsViewer

    Private Const CLSNAME As String = "Class AnnalsViewer"

#Region "Member Variable"
	Private strANNALS_TYPE As String
	Private strANNALS_SEQ_NO As String
	Private strANNALS_YEAR As String
    Private strEMP_ID As String
#End Region

    Public Sub New()
        MyBase.New()
    End Sub

    Public Sub New(ByVal strANNALS_TYPE As String, ByVal strANNALS_SEQ_NO As String, ByVal strANNALS_YEAR As String, ByVal strEMP_ID As String)
        Me.New()
        ANNALS_TYPE = strANNALS_TYPE
        ANNALS_SEQ_NO = strANNALS_SEQ_NO
        ANNALS_YEAR = strANNALS_YEAR
        EMP_ID = strEMP_ID
    End Sub


#Region "Properties"

	Public Property ANNALS_TYPE As String
	Get
		Return strANNALS_TYPE
	End Get
	Set (ByVal Value As String)
		strANNALS_TYPE = Value
	End Set
	End Property

	Public Property ANNALS_SEQ_NO As String
	Get
		Return strANNALS_SEQ_NO
	End Get
	Set (ByVal Value As String)
		strANNALS_SEQ_NO = Value
	End Set
	End Property

	Public Property ANNALS_YEAR As String
	Get
		Return strANNALS_YEAR
	End Get
	Set (ByVal Value As String)
		strANNALS_YEAR = Value
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

#End Region

#Region "Print"
	Public Sub Print()
		Debug.print("")
		Debug.Print("ANNALS_TYPE : " & ANNALS_TYPE)
		Debug.Print("ANNALS_SEQ_NO : " & ANNALS_SEQ_NO)
		Debug.Print("ANNALS_YEAR : " & ANNALS_YEAR)
        Debug.Print("EMP_ID : " & EMP_ID)
	End Sub

#End Region
End Class
