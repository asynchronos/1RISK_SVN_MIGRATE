Option Explicit On
Option Strict On

Imports Microsoft.VisualBasic
Imports System.Diagnostics

Public Class UserDetail

    Private Const CLSNAME As String = "Class UserDetail"

#Region "Member Variable"
    Private strUSERNAME As String
    Private _roleList As ArrayList
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

    Public Property RoleIDList() As ArrayList
        Get
            Return _roleList
        End Get
        Set(ByVal Value As ArrayList)
            _roleList = Value
        End Set
    End Property

    Public Property Role(ByVal i As Integer) As String
        Get
            Dim listObjSize As Integer = RoleIDList.Count

            'check if object exists at specified index
            If (i + 1 > listObjSize) Then
                'add objects
                For j As Integer = listObjSize To i + 1
                    RoleIDList.Add("")
                Next
                Return Nothing
            End If

            Return DirectCast(RoleIDList.Item(i), String)
        End Get
        Set(ByVal Value As String)
            RoleIDList.Item(i) = Value
        End Set
    End Property
#End Region

#Region "Print"
    Public Sub Print()
        Debug.print("")
        Debug.Print("USERNAME : " & USERNAME)
    End Sub

#End Region
End Class