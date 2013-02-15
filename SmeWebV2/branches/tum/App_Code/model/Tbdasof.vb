Option Explicit On
Option Strict On

Imports Microsoft.VisualBasic
Imports System.Diagnostics

Public Class Tbdasof

    Private Const CLSNAME As String = "Class Tbdasof"

    Private strTB_TABLE As String
    Private clsOLDDASOF As Date
    Private clsDASOF As Date
    Private intDAY_ASOF As Integer
    Private intMONTH_ASOF As Integer
    Private intYEAR_ASOF As Integer
    Private clsUP_DT As Date

    Public Property TB_TABLE() As String
        Get
            Return strTB_TABLE
        End Get
        Set(ByVal Value As String)
            strTB_TABLE = Value
        End Set
    End Property

    Public Property OLDDASOF() As Date
        Get
            Return clsOLDDASOF
        End Get
        Set(ByVal Value As Date)
            clsOLDDASOF = Value
        End Set
    End Property

    Public Property DASOF() As Date
        Get
            Return clsDASOF
        End Get
        Set(ByVal Value As Date)
            clsDASOF = Value
        End Set
    End Property

    Public Property DAY_ASOF() As Integer
        Get
            Return intDAY_ASOF
        End Get
        Set(ByVal Value As Integer)
            intDAY_ASOF = Value
        End Set
    End Property

    Public Property MONTH_ASOF() As Integer
        Get
            Return intMONTH_ASOF
        End Get
        Set(ByVal Value As Integer)
            intMONTH_ASOF = Value
        End Set
    End Property

    Public Property YEAR_ASOF() As Integer
        Get
            Return intYEAR_ASOF
        End Get
        Set(ByVal Value As Integer)
            intYEAR_ASOF = Value
        End Set
    End Property

    Public Property UP_DT() As Date
        Get
            Return clsUP_DT
        End Get
        Set(ByVal Value As Date)
            clsUP_DT = Value
        End Set
    End Property

    Public Sub Print()
        Debug.print("")
        Debug.Print("TB_TABLE : " & TB_TABLE)
        Debug.Print("OLDDASOF : " & OLDDASOF)
        Debug.Print("DASOF : " & DASOF)
        Debug.Print("DAY_ASOF : " & DAY_ASOF)
        Debug.Print("MONTH_ASOF : " & MONTH_ASOF)
        Debug.Print("YEAR_ASOF : " & YEAR_ASOF)
        Debug.Print("UP_DT : " & UP_DT)
    End Sub

End Class