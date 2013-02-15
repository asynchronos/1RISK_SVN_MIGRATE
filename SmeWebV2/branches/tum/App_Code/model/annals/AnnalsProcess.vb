Option Explicit On
Option Strict On

Imports Microsoft.VisualBasic
Imports System.Diagnostics

<System.Runtime.Serialization.DataContract()> _
Public Class AnnalsProcess

    Private Const CLSNAME As String = "Class AnnalsProcess"

    Private strPROCESS_ID As String
    Private strPEOCESS_HEAD As String
    Private strPROCESS As String
    Private strPROCESS_GROUP As String
    <Runtime.Serialization.DataMember(Order:=1)> _
    Public Property PROCESS_ID() As String
        Get
            Return strPROCESS_ID
        End Get
        Set(ByVal Value As String)
            strPROCESS_ID = Value
        End Set
    End Property
    <Runtime.Serialization.DataMember(Order:=2)> _
    Public Property PEOCESS_HEAD() As String
        Get
            Return strPEOCESS_HEAD
        End Get
        Set(ByVal Value As String)
            strPEOCESS_HEAD = Value
        End Set
    End Property
    <Runtime.Serialization.DataMember(Order:=3)> _
    Public Property PROCESS() As String
        Get
            Return strPROCESS
        End Get
        Set(ByVal Value As String)
            strPROCESS = Value
        End Set
    End Property
    <Runtime.Serialization.DataMember(Order:=4)> _
    Public Property PROCESS_GROUP() As String
        Get
            Return strPROCESS_GROUP
        End Get
        Set(ByVal Value As String)
            strPROCESS_GROUP = Value
        End Set
    End Property

    Public Sub Print()
        Debug.Print("")
        Debug.Print("PROCESS_ID : " & PROCESS_ID)
        Debug.Print("PEOCESS_HEAD : " & PEOCESS_HEAD)
        Debug.Print("PROCESS : " & PROCESS)
        Debug.Print("PROCESS_GROUP : " & PROCESS_GROUP)
    End Sub

End Class
