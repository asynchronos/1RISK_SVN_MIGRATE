Option Explicit On
Option Strict On

Imports Microsoft.VisualBasic
Imports System.Diagnostics

'model for view "Controlling_Line_Full"
Public Class ControllingUserFullDesc
    Inherits ControllingLevel

    Private strEMP_ID As String
    Private strLEAD_ID As String
    Private strLEAD_ID2 As String
    Private strTITLE_NAME As String
    Private strEMPNAME As String
    Private strEMPSURNAME As String

#Region "Constructor"

    Public Sub New()
        MyBase.New()
    End Sub

    Public Sub New(ByVal emp As ControllingUserFullDesc)
        Me.New(emp.LEVEL_ID, emp.LEVEL_CODE, emp.LEVEL_NAME, emp.LEVEL_ROOT, emp.EMP_ID, emp.TITLE_NAME, emp.EMPNAME, emp.EMPSURNAME, emp.LEAD_ID, emp.LEAD_ID2)
    End Sub

    Public Sub New(ByVal strLEVEL_ID As String, ByVal strLEVEL_CODE As String, ByVal strLEVEL_NAME As String, ByVal strLEVEL_ROOT As String, ByVal strEMP_ID As String, ByVal strTITLE_NAME As String, ByVal strEMPNAME As String, ByVal strEMPSURNAME As String, ByVal strLEAD_ID As String, ByVal strLEAD_ID2 As String)
        Me.New()
        LEVEL_ID = strLEVEL_ID
        LEVEL_CODE = strLEVEL_CODE
        LEVEL_NAME = strLEVEL_NAME
        LEVEL_ROOT = strLEVEL_ROOT
        EMP_ID = strEMP_ID
        TITLE_NAME = strTITLE_NAME
        EMPNAME = strEMPNAME
        EMPSURNAME = strEMPSURNAME
        LEAD_ID = strLEAD_ID
        LEAD_ID2 = strLEAD_ID2
    End Sub

#End Region

#Region "Properties"
    Public Property EMP_ID() As String
        Get
            Return strEMP_ID
        End Get
        Set(ByVal Value As String)
            strEMP_ID = Value
        End Set
    End Property

    Public Property LEAD_ID() As String
        Get
            Return strLEAD_ID
        End Get
        Set(ByVal Value As String)
            strLEAD_ID = Value
        End Set
    End Property

    Public Property LEAD_ID2() As String
        Get
            Return strLEAD_ID2
        End Get
        Set(ByVal Value As String)
            strLEAD_ID2 = Value
        End Set
    End Property

    Public Property TITLE_NAME() As String
        Get
            Return strTITLE_NAME
        End Get
        Set(ByVal Value As String)
            strTITLE_NAME = Value
        End Set
    End Property

    Public Property EMPNAME() As String
        Get
            Return strEMPNAME
        End Get
        Set(ByVal Value As String)
            strEMPNAME = Value
        End Set
    End Property

    Public Property EMPSURNAME() As String
        Get
            Return strEMPSURNAME
        End Get
        Set(ByVal Value As String)
            strEMPSURNAME = Value
        End Set
    End Property

    Public ReadOnly Property FULLNAME() As String
        Get
            Return TITLE_NAME + " " + EMPNAME + " " + EMPSURNAME
        End Get
    End Property
#End Region

    Public Shared Function getControllingUserFullDescList(ByVal userLineTable As Data.DataTable) As Collections.Generic.List(Of ControllingUserFullDesc)
        Dim result As Collections.Generic.List(Of ControllingUserFullDesc) = New Collections.Generic.List(Of ControllingUserFullDesc)

        Dim levelId As String = Nothing
        Dim levelCode As String = Nothing
        Dim levelName As String = Nothing
        Dim levelRoot As String = Nothing
        Dim empId As String = Nothing
        Dim titleName As String = Nothing
        Dim empName As String = Nothing
        Dim empSurname As String = Nothing
        Dim leadId As String = Nothing
        Dim leadId2 As String = Nothing

        For i As Integer = 0 To userLineTable.Rows.Count - 1
            levelId = userLineTable.Rows(i).Item("LEVEL_ID").ToString
            levelCode = userLineTable.Rows(i).Item("LEVEL_CODE").ToString
            levelName = userLineTable.Rows(i).Item("LEVEL_NAME").ToString
            levelRoot = userLineTable.Rows(i).Item("LEVEL_ROOT").ToString
            empId = userLineTable.Rows(i).Item("EMP_ID").ToString
            titleName = userLineTable.Rows(i).Item("TITLE_NAME").ToString
            empName = userLineTable.Rows(i).Item("EMPNAME").ToString
            empSurname = userLineTable.Rows(i).Item("EMPSURNAME").ToString
            leadId = userLineTable.Rows(i).Item("LEAD_ID").ToString
            leadId2 = userLineTable.Rows(i).Item("LEAD_ID2").ToString

            result.Add(New ControllingUserFullDesc(levelId, levelCode, levelName, levelRoot, empId, titleName, empName, empSurname, leadId, leadId2))
        Next

        Return result
    End Function

    Public Overloads Sub Print()
        MyBase.Print()
        Debug.Print("EMP_ID : " & EMP_ID)
        Debug.Print("TITLE_NAME : " & TITLE_NAME)
        Debug.Print("EMPNAME : " & EMPNAME)
        Debug.Print("EMPSURNAME : " & EMPSURNAME)
        Debug.Print("LEAD_ID : " & LEAD_ID)
        Debug.Print("LEAD_ID2 : " & LEAD_ID2)
    End Sub

End Class
