Option Explicit On
Option Strict On

Imports Microsoft.VisualBasic
Imports System.Diagnostics

Public Class CustomerSme

    Private Const CLSNAME As String = "Class CustomerSme"

#Region "Member Variable"
    Private intCIF As Integer
    Private intNUMCIF As Integer
    Private intMCIF As Integer
    Private strCM_CODE As String
    Private intMAIN_BR As Integer
    Private intCUST_SIZE As Integer
    Private intBUSI_TYPE1 As Integer
    Private intBUSI_TYPE2 As Integer
    Private intBUSI_TYPE3 As Integer
    Private clsUPDATE_DATE As Date
    Private strUPDATE_BY As String
#End Region

#Region "Properties"

    Public Property CIF() As Integer
        Get
            Return intCIF
        End Get
        Set(ByVal Value As Integer)
            intCIF = Value
        End Set
    End Property

    Public Property NUMCIF() As Integer
        Get
            Return intNUMCIF
        End Get
        Set(ByVal Value As Integer)
            intNUMCIF = Value
        End Set
    End Property

    Public Property MCIF() As Integer
        Get
            Return intMCIF
        End Get
        Set(ByVal Value As Integer)
            intMCIF = Value
        End Set
    End Property

    Public Property CM_CODE() As String
        Get
            Return strCM_CODE
        End Get
        Set(ByVal Value As String)
            strCM_CODE = Value
        End Set
    End Property

    Public Property MAIN_BR() As Integer
        Get
            Return intMAIN_BR
        End Get
        Set(ByVal Value As Integer)
            intMAIN_BR = Value
        End Set
    End Property

    Public Property CUST_SIZE() As Integer
        Get
            Return intCUST_SIZE
        End Get
        Set(ByVal Value As Integer)
            intCUST_SIZE = Value
        End Set
    End Property

    Public Property BUSI_TYPE1() As Integer
        Get
            Return intBUSI_TYPE1
        End Get
        Set(ByVal Value As Integer)
            intBUSI_TYPE1 = Value
        End Set
    End Property

    Public Property BUSI_TYPE2() As Integer
        Get
            Return intBUSI_TYPE2
        End Get
        Set(ByVal Value As Integer)
            intBUSI_TYPE2 = Value
        End Set
    End Property

    Public Property BUSI_TYPE3() As Integer
        Get
            Return intBUSI_TYPE3
        End Get
        Set(ByVal Value As Integer)
            intBUSI_TYPE3 = Value
        End Set
    End Property

    Public Property UPDATE_DATE() As Date
        Get
            Return clsUPDATE_DATE
        End Get
        Set(ByVal Value As Date)
            clsUPDATE_DATE = Value
        End Set
    End Property

    Public Property UPDATE_BY() As String
        Get
            Return strUPDATE_BY
        End Get
        Set(ByVal Value As String)
            strUPDATE_BY = Value
        End Set
    End Property

#End Region

#Region "Print"
    Public Sub Print()
        Debug.Print("")
        Debug.Print("CIF : " & CIF)
        Debug.Print("NUMCIF : " & NUMCIF)
        Debug.Print("MCIF : " & MCIF)
        Debug.Print("CM_CODE : " & CM_CODE)
        Debug.Print("MAIN_BR : " & MAIN_BR)
        Debug.Print("CUST_SIZE : " & CUST_SIZE)
        Debug.Print("BUSI_TYPE1 : " & BUSI_TYPE1)
        Debug.Print("BUSI_TYPE2 : " & BUSI_TYPE2)
        Debug.Print("BUSI_TYPE3 : " & BUSI_TYPE3)
        Debug.Print("UPDATE_DATE : " & UPDATE_DATE)
        Debug.Print("UPDATE_BY : " & UPDATE_BY)
    End Sub

#End Region
End Class