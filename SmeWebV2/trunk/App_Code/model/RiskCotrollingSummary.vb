Option Explicit On
Option Strict On

Imports Microsoft.VisualBasic
Imports System.Diagnostics

Public Class RiskCotrollingSummary

    Private Const CLSNAME As String = "Class RiskCotrollingSummary"

    Private intCountCIF As Integer
    Private strTdr As String
    Private strClass As String
    Private dblPrincipal As Double
    Private dblAccru As Double
    Private dblSusp As Double
    Private strAgingtxt As String
    Private strBranch_T As String
    Private strRegion_Name As String

    'ใช้แสดงในกรณีที่ filter ไม่มีค่า
    Private _NoValue As String = ""

    Public ReadOnly Property NoValue() As String
        Get
            Return _NoValue
        End Get
    End Property

    Public Property CountCIF() As Integer
        Get
            Return intCountCIF
        End Get
        Set(ByVal Value As Integer)
            intCountCIF = Value
        End Set
    End Property

    Public Property Tdr() As String
        Get
            Return strTdr
        End Get
        Set(ByVal Value As String)
            strTdr = Value
        End Set
    End Property

    Public Property ClassDebt() As String
        Get
            Return strClass
        End Get
        Set(ByVal Value As String)
            strClass = Value
        End Set
    End Property

    Public Property Principal() As Double
        Get
            Return dblPrincipal
        End Get
        Set(ByVal Value As Double)
            dblPrincipal = Value
        End Set
    End Property

    Public Property Accru() As Double
        Get
            Return dblAccru
        End Get
        Set(ByVal Value As Double)
            dblAccru = Value
        End Set
    End Property

    Public Property Susp() As Double
        Get
            Return dblSusp
        End Get
        Set(ByVal Value As Double)
            dblSusp = Value
        End Set
    End Property

    Public Property Agingtxt() As String
        Get
            Return strAgingtxt
        End Get
        Set(ByVal Value As String)
            strAgingtxt = Value
        End Set
    End Property

    Public Property Branch_T() As String
        Get
            Return strBranch_T
        End Get
        Set(ByVal Value As String)
            strBranch_T = Value
        End Set
    End Property

    Public Property Region_Name() As String
        Get
            Return strRegion_Name
        End Get
        Set(ByVal Value As String)
            strRegion_Name = Value
        End Set
    End Property

    Public Sub Print()
        Debug.Print("")
        Debug.Print("CountCIF : " & CountCIF)
        Debug.Print("Tdr : " & Tdr)
        Debug.Print("Class : " & ClassDebt)
        Debug.Print("Principal : " & Principal)
        Debug.Print("Accru : " & Accru)
        Debug.Print("Susp : " & Susp)
        Debug.Print("Agingtxt : " & Agingtxt)
        Debug.Print("Branch_T : " & Branch_T)
        Debug.Print("Region_Name : " & Region_Name)
    End Sub

End Class