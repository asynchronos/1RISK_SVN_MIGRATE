Option Explicit On
Option Strict On

Imports Microsoft.VisualBasic
Imports System.Diagnostics

Public Class TbRiskControlSummaryFilter
    'Property NoValue() ห้ามลบ ใช้สำหรับแสดงค่าว่างในตาราง
    Public ReadOnly Property NoValue() As String
        Get
            Return ""
        End Get
    End Property

    Private Const CLSNAME As String = "Class TbRiskControlSummaryFilter"

    Private intFilterID As Integer
    Private strFilterDesc As String
    Private strPropertyInClass As String
    Private strFilterTable As String
    Private strFilterColumn As String

    Public Property FilterID() As Integer
        Get
            Return intFilterID
        End Get
        Set(ByVal Value As Integer)
            intFilterID = Value
        End Set
    End Property

    Public Property FilterDesc() As String
        Get
            Return strFilterDesc
        End Get
        Set(ByVal Value As String)
            strFilterDesc = Value
        End Set
    End Property

    Public Property PropertyInClass() As String
        Get
            Return strPropertyInClass
        End Get
        Set(ByVal Value As String)
            strPropertyInClass = Value
        End Set
    End Property

    Public Property FilterTable() As String
        Get
            Return strFilterTable
        End Get
        Set(ByVal Value As String)
            strFilterTable = Value
        End Set
    End Property

    Public Property FilterColumn() As String
        Get
            Return strFilterColumn
        End Get
        Set(ByVal Value As String)
            strFilterColumn = Value
        End Set
    End Property

    Public Sub Print()
        Debug.print("")
        Debug.Print("FilterID : " & FilterID)
        Debug.Print("FilterDesc : " & FilterDesc)
        Debug.Print("PropertyInClass : " & PropertyInClass)
        Debug.Print("FilterTable : " & FilterTable)
        Debug.Print("FilterColumn : " & FilterColumn)
    End Sub

End Class