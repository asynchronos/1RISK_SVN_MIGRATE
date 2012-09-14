Option Explicit On
Option Strict On

Imports Microsoft.VisualBasic
Imports System.Diagnostics

Public Class AnnalsSubject

    Private Const CLSNAME As String = "Class AnnalsSubject"

    Private strSUBJECT_ID As String
    Private strSUBJECT As String
    Private strSUBJECT_ENG As String
    Private intPIORITY As Integer
    Private intHASVALUE As Integer

    Public Property SUBJECT_ID() As String
        Get
            Return strSUBJECT_ID
        End Get
        Set(ByVal Value As String)
            strSUBJECT_ID = Value
        End Set
    End Property

    Public Property SUBJECT() As String
        Get
            Return strSUBJECT
        End Get
        Set(ByVal Value As String)
            strSUBJECT = Value
        End Set
    End Property

    Public Property SUBJECT_ENG() As String
        Get
            Return strSUBJECT_ENG
        End Get
        Set(ByVal Value As String)
            strSUBJECT_ENG = Value
        End Set
    End Property

    Public Property PIORITY() As Integer
        Get
            Return intPIORITY
        End Get
        Set(ByVal Value As Integer)
            intPIORITY = Value
        End Set
    End Property

    Public Property HASVALUE() As Integer
        Get
            Return intHASVALUE
        End Get
        Set(ByVal Value As Integer)
            intHASVALUE = Value
        End Set
    End Property

    Public Sub Print()
        Debug.print("")
        Debug.Print("SUBJECT_ID : " & SUBJECT_ID)
        Debug.Print("SUBJECT : " & SUBJECT)
        Debug.Print("SUBJECT_ENG : " & SUBJECT_ENG)
        Debug.Print("PIORITY : " & PIORITY)
        Debug.Print("HASVALUE : " & HASVALUE)
    End Sub

End Class