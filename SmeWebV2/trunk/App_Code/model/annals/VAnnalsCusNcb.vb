Option Explicit On
Option Strict On

Imports Microsoft.VisualBasic
Imports System.Diagnostics

Public Class VAnnalsCusNcb

    Private Const CLSNAME As String = "Class VAnnalsCusNcb"

    Private strID As String
    Private intCIF As Integer
    Private strCifname As String
    Private strCUS_NCB_TYPE_ID As String
    Private strCUS_NCB_TYPE As String
    Private intCUS_NCB_TYPE_DETAIL_ID As Integer
    Private strCUS_NCB_TYPE_DETAIL As String
    Private dtCUS_NCB_DATE As String
    Private strDETAIL As String
    Private intDEPT_ID As Integer
    Private strDEPT As String
    Private intCUS_TYPE_ID As Integer
    Private strCUS_TYPE As String
    Private strAUTH_1_ID As String
    Private strAUTH_1_NAME As String
    Private strAUTH_2_ID As String
    Private strAUTH_2_NAME As String

    Public Property ID As String
        Get
            Return strID
        End Get
        Set(ByVal Value As String)
            strID = Value
        End Set
    End Property

    Public Property CIF As Integer
        Get
            Return intCIF
        End Get
        Set(ByVal Value As Integer)
            intCIF = Value
        End Set
    End Property

    Public Property Cifname As String
        Get
            Return strCifname
        End Get
        Set(ByVal Value As String)
            strCifname = Value
        End Set
    End Property

    Public Property CUS_NCB_TYPE_ID As String
        Get
            Return strCUS_NCB_TYPE_ID
        End Get
        Set(ByVal Value As String)
            strCUS_NCB_TYPE_ID = Value
        End Set
    End Property

    Public Property CUS_NCB_TYPE As String
        Get
            Return strCUS_NCB_TYPE
        End Get
        Set(ByVal Value As String)
            strCUS_NCB_TYPE = Value
        End Set
    End Property

    Public Property CUS_NCB_TYPE_DETAIL_ID As Integer
        Get
            Return intCUS_NCB_TYPE_DETAIL_ID
        End Get
        Set(ByVal Value As Integer)
            intCUS_NCB_TYPE_DETAIL_ID = Value
        End Set
    End Property

    Public Property CUS_NCB_TYPE_DETAIL As String
        Get
            Return strCUS_NCB_TYPE_DETAIL
        End Get
        Set(ByVal Value As String)
            strCUS_NCB_TYPE_DETAIL = Value
        End Set
    End Property

    Public Property CUS_NCB_DATE As String
        Get
            Return dtCUS_NCB_DATE
        End Get
        Set(ByVal Value As String)
            dtCUS_NCB_DATE = Value
        End Set
    End Property

    Public Property DETAIL As String
        Get
            Return strDETAIL
        End Get
        Set(ByVal Value As String)
            strDETAIL = Value
        End Set
    End Property

    Public Property DEPT_ID As Integer
        Get
            Return intDEPT_ID
        End Get
        Set(ByVal Value As Integer)
            intDEPT_ID = Value
        End Set
    End Property

    Public Property DEPT As String
        Get
            Return strDEPT
        End Get
        Set(ByVal Value As String)
            strDEPT = Value
        End Set
    End Property

    Public Property CUS_TYPE_ID As Integer
        Get
            Return intCUS_TYPE_ID
        End Get
        Set(ByVal Value As Integer)
            intCUS_TYPE_ID = Value
        End Set
    End Property

    Public Property CUS_TYPE As String
        Get
            Return strCUS_TYPE
        End Get
        Set(ByVal Value As String)
            strCUS_TYPE = Value
        End Set
    End Property

    Public Property AUTH_1_ID As String
        Get
            Return strAUTH_1_ID
        End Get
        Set(ByVal Value As String)
            strAUTH_1_ID = Value
        End Set
    End Property

    Public Property AUTH_1_NAME As String
        Get
            Return strAUTH_1_NAME
        End Get
        Set(ByVal Value As String)
            strAUTH_1_NAME = Value
        End Set
    End Property

    Public Property AUTH_2_ID As String
        Get
            Return strAUTH_2_ID
        End Get
        Set(ByVal Value As String)
            strAUTH_2_ID = Value
        End Set
    End Property

    Public Property AUTH_2_NAME As String
        Get
            Return strAUTH_2_NAME
        End Get
        Set(ByVal Value As String)
            strAUTH_2_NAME = Value
        End Set
    End Property

    Public Sub Print()
        Debug.Print("")
        Debug.Print("ID : " & ID)
        Debug.Print("CIF : " & CIF)
        Debug.Print("Cifname : " & Cifname)
        Debug.Print("CUS_NCB_TYPE_ID : " & CUS_NCB_TYPE_ID)
        Debug.Print("CUS_NCB_TYPE : " & CUS_NCB_TYPE)
        Debug.Print("CUS_NCB_TYPE_DETAIL_ID : " & CUS_NCB_TYPE_DETAIL_ID)
        Debug.Print("CUS_NCB_TYPE_DETAIL : " & CUS_NCB_TYPE_DETAIL)
        Debug.Print("CUS_NCB_DATE : " & CUS_NCB_DATE)
        Debug.Print("DETAIL : " & DETAIL)
        Debug.Print("DEPT_ID : " & DEPT_ID)
        Debug.Print("DEPT : " & DEPT)
        Debug.Print("CUS_TYPE_ID : " & CUS_TYPE_ID)
        Debug.Print("CUS_TYPE : " & CUS_TYPE)
        Debug.Print("AUTH_1_ID : " & AUTH_1_ID)
        Debug.Print("AUTH_1_NAME : " & AUTH_1_NAME)
        Debug.Print("AUTH_2_ID : " & AUTH_2_ID)
        Debug.Print("AUTH_2_NAME : " & AUTH_2_NAME)
    End Sub

End Class
