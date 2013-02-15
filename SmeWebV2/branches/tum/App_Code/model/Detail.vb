Option Explicit On
Option Strict On

Imports Microsoft.VisualBasic
Imports System.Diagnostics

Public Class Detail

    Private Const CLSNAME As String = "Class Detail"

#Region "Member Variable"
    Private intCif As Integer
    Private strName As String
    Private intBOTID As Integer
    Private strTdr As String
    Private intBranch As Integer
    Private strBranch_T As String
    Private strClass As String
    Private dblByCustomer_AGING As Double
    Private dblByCusDaily_AGING As Double
    Private strAgingTxt As String
    Private dblPrincipal As Double
    Private dblAccru As Double
    Private dblSusp As Double
    Private dblPAY_PRIN As Double
    Private dblPAY_INT As Double
    Private dblPAY_SUSP As Double
    Private intId_Group As Integer
    Private strGroup As String
    Private intId_Part As Integer
    Private strPart_Name As String
    Private intId_Region As Integer
    Private strRegion_Name As String
    Private intCUS_DEPT_FLAG As Integer
    Private intCUS_DEPT_TRAN As Integer
    Private strDep As String
    Private intOFFICR_ID As Integer
    Private strOffice As String
#End Region

#Region "Properties"

    Public Property Cif() As Integer
        Get
            Return intCif
        End Get
        Set(ByVal Value As Integer)
            intCif = Value
        End Set
    End Property

    Public Property Name() As String
        Get
            Return strName
        End Get
        Set(ByVal Value As String)
            strName = Value
        End Set
    End Property

    Public Property BOTID() As Integer
        Get
            Return intBOTID
        End Get
        Set(ByVal Value As Integer)
            intBOTID = Value
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

    Public Property Branch() As Integer
        Get
            Return intBranch
        End Get
        Set(ByVal Value As Integer)
            intBranch = Value
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

    Public Property ClassDebt() As String
        Get
            Return strClass
        End Get
        Set(ByVal Value As String)
            strClass = Value
        End Set
    End Property

    Public Property ByCustomer_AGING() As Double
        Get
            Return dblByCustomer_AGING
        End Get
        Set(ByVal Value As Double)
            dblByCustomer_AGING = Value
        End Set
    End Property

    Public Property ByCusDaily_AGING() As Double
        Get
            Return dblByCusDaily_AGING
        End Get
        Set(ByVal Value As Double)
            dblByCusDaily_AGING = Value
        End Set
    End Property

    Public Property AgingTxt() As String
        Get
            Return strAgingTxt
        End Get
        Set(ByVal Value As String)
            strAgingTxt = Value
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

    Public Property PAY_PRIN() As Double
        Get
            Return dblPAY_PRIN
        End Get
        Set(ByVal Value As Double)
            dblPAY_PRIN = Value
        End Set
    End Property

    Public Property PAY_INT() As Double
        Get
            Return dblPAY_INT
        End Get
        Set(ByVal Value As Double)
            dblPAY_INT = Value
        End Set
    End Property

    Public Property PAY_SUSP() As Double
        Get
            Return dblPAY_SUSP
        End Get
        Set(ByVal Value As Double)
            dblPAY_SUSP = Value
        End Set
    End Property

    Public Property Id_Group() As Integer
        Get
            Return intId_Group
        End Get
        Set(ByVal Value As Integer)
            intId_Group = Value
        End Set
    End Property

    Public Property Group() As String
        Get
            Return strGroup
        End Get
        Set(ByVal Value As String)
            strGroup = Value
        End Set
    End Property

    Public Property Id_Part() As Integer
        Get
            Return intId_Part
        End Get
        Set(ByVal Value As Integer)
            intId_Part = Value
        End Set
    End Property

    Public Property Part_Name() As String
        Get
            Return strPart_Name
        End Get
        Set(ByVal Value As String)
            strPart_Name = Value
        End Set
    End Property

    Public Property Id_Region() As Integer
        Get
            Return intId_Region
        End Get
        Set(ByVal Value As Integer)
            intId_Region = Value
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

    Public Property CUS_DEPT_FLAG() As Integer
        Get
            Return intCUS_DEPT_FLAG
        End Get
        Set(ByVal Value As Integer)
            intCUS_DEPT_FLAG = Value
        End Set
    End Property

    Public Property CUS_DEPT_TRAN() As Integer
        Get
            Return intCUS_DEPT_TRAN
        End Get
        Set(ByVal Value As Integer)
            intCUS_DEPT_TRAN = Value
        End Set
    End Property

    Public Property Dep() As String
        Get
            Return strDep
        End Get
        Set(ByVal Value As String)
            strDep = Value
        End Set
    End Property

    Public Property OFFICR_ID() As Integer
        Get
            Return intOFFICR_ID
        End Get
        Set(ByVal Value As Integer)
            intOFFICR_ID = Value
        End Set
    End Property

    Public Property Office() As String
        Get
            Return strOffice
        End Get
        Set(ByVal Value As String)
            strOffice = Value
        End Set
    End Property

#End Region

#Region "Print"
    Public Sub Print()
        Debug.print("")
        Debug.Print("Cif : " & Cif)
        Debug.Print("Name : " & Name)
        Debug.Print("BOTID : " & BOTID)
        Debug.Print("Tdr : " & Tdr)
        Debug.Print("Branch : " & Branch)
        Debug.Print("Branch_T : " & Branch_T)
        Debug.Print("ClassDebt : " & ClassDebt)
        Debug.Print("ByCustomer_AGING : " & ByCustomer_AGING)
        Debug.Print("ByCusDaily_AGING : " & ByCusDaily_AGING)
        Debug.Print("AgingTxt : " & AgingTxt)
        Debug.Print("Principal : " & Principal)
        Debug.Print("Accru : " & Accru)
        Debug.Print("Susp : " & Susp)
        Debug.Print("PAY_PRIN : " & PAY_PRIN)
        Debug.Print("PAY_INT : " & PAY_INT)
        Debug.Print("PAY_SUSP : " & PAY_SUSP)
        Debug.Print("Id_Group : " & Id_Group)
        Debug.Print("Group : " & Group)
        Debug.Print("Id_Part : " & Id_Part)
        Debug.Print("Part_Name : " & Part_Name)
        Debug.Print("Id_Region : " & Id_Region)
        Debug.Print("Region_Name : " & Region_Name)
        Debug.Print("CUS_DEPT_FLAG : " & CUS_DEPT_FLAG)
        Debug.Print("CUS_DEPT_TRAN : " & CUS_DEPT_TRAN)
        Debug.Print("Dep : " & Dep)
        Debug.Print("OFFICR_ID : " & OFFICR_ID)
        Debug.Print("Office : " & Office)
    End Sub

#End Region
End Class