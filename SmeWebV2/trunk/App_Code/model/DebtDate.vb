Option Explicit On
Option Strict On

Imports Microsoft.VisualBasic
Imports System.Diagnostics

Public Class Debtdate

    Private Const CLSNAME As String = "Class Debtdate"

    Private strUpd_TABLE As String
    Private clsASOF As Date
    Private intUpd_DAY As Integer
    Private intUpd_MONTH As Integer
    Private intUpd_YEAR As Integer
    Private strUp_DT As String

    Public Property Upd_TABLE() As String
        Get
            Return strUpd_TABLE
        End Get
        Set(ByVal Value As String)
            strUpd_TABLE = Value
        End Set
    End Property

    Public Property ASOF() As Date
        Get
            Return clsASOF
        End Get
        Set(ByVal Value As Date)
            clsASOF = Value
        End Set
    End Property

    Public Property Upd_DAY() As Integer
        Get
            Return intUpd_DAY
        End Get
        Set(ByVal Value As Integer)
            intUpd_DAY = Value
        End Set
    End Property

    Public Property Upd_MONTH() As Integer
        Get
            Return intUpd_MONTH
        End Get
        Set(ByVal Value As Integer)
            intUpd_MONTH = Value
        End Set
    End Property

    Public Property Upd_YEAR() As Integer
        Get
            Return intUpd_YEAR
        End Get
        Set(ByVal Value As Integer)
            intUpd_YEAR = Value
        End Set
    End Property

    Public Property Up_DT() As String
        Get
            Return strUp_DT
        End Get
        Set(ByVal Value As String)
            strUp_DT = Value
        End Set
    End Property

    Public Sub Print()
        Debug.print("")
        Debug.Print("Upd_TABLE : " & Upd_TABLE)
        Debug.Print("ASOF : " & ASOF)
        Debug.Print("Upd_DAY : " & Upd_DAY)
        Debug.Print("Upd_MONTH : " & Upd_MONTH)
        Debug.Print("Upd_YEAR : " & Upd_YEAR)
        Debug.Print("Up_DT : " & Up_DT)
    End Sub

End Class