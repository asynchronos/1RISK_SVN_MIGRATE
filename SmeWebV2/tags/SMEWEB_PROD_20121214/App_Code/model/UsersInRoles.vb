Option Explicit On
Option Strict On

Imports Microsoft.VisualBasic
Imports System.Diagnostics

Public Class UsersInRoles

    Private Const CLSNAME As String = "Class UsersInRoles"

#Region "Member Variable"
    Private strUSERNAME As String
    Private strROLENAME As String
    Private strROLEID As String
#End Region

#Region "Properties"
    Public Property USERNAME() As String
        Get
            Return strUSERNAME
        End Get
        Set(ByVal Value As String)
            strUSERNAME = Value
        End Set
    End Property

    Public Property ROLENAME() As String
        Get
            Return strROLENAME
        End Get
        Set(ByVal Value As String)
            strROLENAME = Value
        End Set
    End Property

    Public Property ROLEID() As String
        Get
            Return strROLEID
        End Get
        Set(ByVal Value As String)
            strROLEID = Value
        End Set
    End Property
#End Region

#Region "Print"
    Public Sub Print()
        Debug.Print("")
        Debug.Print("USERNAME : " & USERNAME)
        Debug.Print("ROLENAME : " & ROLENAME)
        Debug.Print("ROLEID : " & ROLEID)
    End Sub

#End Region
End Class