Option Explicit On
Option Strict On

Imports Microsoft.VisualBasic
Imports System.Diagnostics

Public Class TbLevel2
    Inherits TbLevel

    Private Const CLSNAME As String = "Class TbLevel2"

    Private intLevel_Rank As Integer

    Public Property Level_Rank() As Integer
        Get
            Return intLevel_Rank
        End Get
        Set(ByVal Value As Integer)
            intLevel_Rank = Value
        End Set
    End Property

    Public Overloads Sub Print()
        MyBase.Print()
        Debug.Print("Level_Rank : " & Level_Rank)
    End Sub

End Class
