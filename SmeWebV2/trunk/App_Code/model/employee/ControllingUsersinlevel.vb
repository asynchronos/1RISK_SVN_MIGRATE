Option Explicit On
Option Strict On

Imports Microsoft.VisualBasic
Imports System.Diagnostics

Public Class ControllingUsersinlevel

    Private Const CLSNAME As String = "Class ControllingUsersinlevel"

#Region "Member Variable"
    Private strLEVEL_ID As String
    Private strEMP_ID As String
#End Region

#Region "Properties"

    Public Property LEVEL_ID() As String
        Get
            Return strLEVEL_ID
        End Get
        Set(ByVal Value As String)
            strLEVEL_ID = Value
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
        Debug.Print("LEVEL_ID : " & LEVEL_ID)
        Debug.Print("EMP_ID : " & EMP_ID)
    End Sub

#End Region
End Class
