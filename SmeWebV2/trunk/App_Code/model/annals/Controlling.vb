Option Explicit On
Option Strict On

Imports Microsoft.VisualBasic
Imports System.Diagnostics

Public Class Controlling

    Private Const CLSNAME As String = "Class Controlling"

#Region "Member Variable"
    Private strLevel_Code As String
    Private intLevel_Root As String
    Private strLevel_Name As String
#End Region

#Region "Properties"

    Public Property Level_Code() As String
        Get
            Return strLevel_Code
        End Get
        Set(ByVal Value As String)
            strLevel_Code = Value
        End Set
    End Property

    Public Property Level_Root() As String
        Get
            Return intLevel_Root
        End Get
        Set(ByVal Value As String)
            intLevel_Root = Value
        End Set
    End Property

    Public Property Level_Name() As String
        Get
            Return strLevel_Name
        End Get
        Set(ByVal Value As String)
            strLevel_Name = Value
        End Set
    End Property

#End Region

#Region "Print"
    Public Sub Print()
        Debug.Print("")
        Debug.Print("Level_Code : " & Level_Code)
        Debug.Print("Level_Root : " & Level_Root)
        Debug.Print("Level_Name : " & Level_Name)
    End Sub

#End Region
End Class