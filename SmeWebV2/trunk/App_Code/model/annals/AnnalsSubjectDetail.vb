Option Explicit On
Option Strict On

Imports Microsoft.VisualBasic
Imports System.Diagnostics

Public Class AnnalsSubjectDetail

    Private Const CLSNAME As String = "Class AnnalsSubjectDetail"

    Private strSUBJECT_DETAIL_ID As String
    Private strSUBJECT_DETAIL As String
    Private strSUBJECT_DETAIL_ENG As String
    Private strSUBJECT_ID As String
    Private intSUBJECT_ACTION As Integer
    Private intPRIORITY As Integer

    Public Property SUBJECT_DETAIL_ID() As String
        Get
            Return strSUBJECT_DETAIL_ID
        End Get
        Set(ByVal Value As String)
            strSUBJECT_DETAIL_ID = Value
        End Set
    End Property

    Public Property SUBJECT_DETAIL() As String
        Get
            Return strSUBJECT_DETAIL
        End Get
        Set(ByVal Value As String)
            strSUBJECT_DETAIL = Value
        End Set
    End Property

    Public Property SUBJECT_DETAIL_ENG() As String
        Get
            Return strSUBJECT_DETAIL_ENG
        End Get
        Set(ByVal Value As String)
            strSUBJECT_DETAIL_ENG = Value
        End Set
    End Property

    Public Property SUBJECT_ID() As String
        Get
            Return strSUBJECT_ID
        End Get
        Set(ByVal Value As String)
            strSUBJECT_ID = Value
        End Set
    End Property

    Public Property SUBJECT_ACTION() As Integer
        Get
            Return intSUBJECT_ACTION
        End Get
        Set(ByVal Value As Integer)
            intSUBJECT_ACTION = Value
        End Set
    End Property

    Public Property PRIORITY() As Integer
        Get
            Return intPRIORITY
        End Get
        Set(ByVal Value As Integer)
            intPRIORITY = Value
        End Set
    End Property

    Public Sub Print()
        Debug.print("")
        Debug.Print("SUBJECT_DETAIL_ID : " & SUBJECT_DETAIL_ID)
        Debug.Print("SUBJECT_DETAIL : " & SUBJECT_DETAIL)
        Debug.Print("SUBJECT_DETAIL_ENG : " & SUBJECT_DETAIL_ENG)
        Debug.Print("SUBJECT_ID : " & SUBJECT_ID)
        Debug.Print("SUBJECT_ACTION : " & SUBJECT_ACTION)
        Debug.Print("PRIORITY : " & PRIORITY)
    End Sub

End Class