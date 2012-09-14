Option Explicit On
Option Strict On

Imports Microsoft.VisualBasic
Imports System.Diagnostics

Public Class TbEmployee

    Private Const CLSNAME As String = "Class TbEmployee"

#Region "Member Variable"
    Private strEMP_ID As String
    Private intTITLE_CODE As Integer
    Private strEMPNAME As String
    Private strEMPSURNAME As String
    Private strEMPNAME_E As String
    Private strEMPSURNAME_E As String
    Private strEMAIL As String
    Private strIDCARD As String
    Private strTAX_NO As String
    Private strACCNO As String
    Private strADDRESS As String
    Private strSOI As String
    Private strROAD As String
    Private strLOCALITY As String
    Private strDISTRINCT As String
    Private strPROV_CODE As String
    Private strZIPCODE As String
    Private strTEL_HOME As String
    Private strTEL_MOBILE As String
    Private strTEL_INDOOR As String
    Private clsDATEOFBIRTH As Date
    Private strIMAGENAME As String
    Private clsDATEOFSTART As Date
    Private strSTATUS As String
    Private strTEAM_ID As String
    Private strGROUP_HEAD As String
    Private intROLE As Integer
    Private strPERMIT As String
    Private strUSERNAME As String
    Private strPASSWD As String
    Private clsUP_DT As Date
    Private intDept As Integer
    Private intId_Region As Integer
    Private intId_Branch As Integer
    Private strPOSITION_CODE As String
    Private strId_Region_Group As String
    Private strId_Branch_Group As String
    Private strId_Group_Group As String
    Private strLEVEL_ID As String
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

    Public Property TITLE_CODE() As Integer
        Get
            Return intTITLE_CODE
        End Get
        Set(ByVal Value As Integer)
            intTITLE_CODE = Value
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

    Public Property EMPNAME_E() As String
        Get
            Return strEMPNAME_E
        End Get
        Set(ByVal Value As String)
            strEMPNAME_E = Value
        End Set
    End Property

    Public Property EMPSURNAME_E() As String
        Get
            Return strEMPSURNAME_E
        End Get
        Set(ByVal Value As String)
            strEMPSURNAME_E = Value
        End Set
    End Property

    Public Property EMAIL() As String
        Get
            Return strEMAIL
        End Get
        Set(ByVal Value As String)
            strEMAIL = Value
        End Set
    End Property

    Public Property IDCARD() As String
        Get
            Return strIDCARD
        End Get
        Set(ByVal Value As String)
            strIDCARD = Value
        End Set
    End Property

    Public Property TAX_NO() As String
        Get
            Return strTAX_NO
        End Get
        Set(ByVal Value As String)
            strTAX_NO = Value
        End Set
    End Property

    Public Property ACCNO() As String
        Get
            Return strACCNO
        End Get
        Set(ByVal Value As String)
            strACCNO = Value
        End Set
    End Property

    Public Property ADDRESS() As String
        Get
            Return strADDRESS
        End Get
        Set(ByVal Value As String)
            strADDRESS = Value
        End Set
    End Property

    Public Property SOI() As String
        Get
            Return strSOI
        End Get
        Set(ByVal Value As String)
            strSOI = Value
        End Set
    End Property

    Public Property ROAD() As String
        Get
            Return strROAD
        End Get
        Set(ByVal Value As String)
            strROAD = Value
        End Set
    End Property

    Public Property LOCALITY() As String
        Get
            Return strLOCALITY
        End Get
        Set(ByVal Value As String)
            strLOCALITY = Value
        End Set
    End Property

    Public Property DISTRINCT() As String
        Get
            Return strDISTRINCT
        End Get
        Set(ByVal Value As String)
            strDISTRINCT = Value
        End Set
    End Property

    Public Property PROV_CODE() As String
        Get
            Return strPROV_CODE
        End Get
        Set(ByVal Value As String)
            strPROV_CODE = Value
        End Set
    End Property

    Public Property ZIPCODE() As String
        Get
            Return strZIPCODE
        End Get
        Set(ByVal Value As String)
            strZIPCODE = Value
        End Set
    End Property

    Public Property TEL_HOME() As String
        Get
            Return strTEL_HOME
        End Get
        Set(ByVal Value As String)
            strTEL_HOME = Value
        End Set
    End Property

    Public Property TEL_MOBILE() As String
        Get
            Return strTEL_MOBILE
        End Get
        Set(ByVal Value As String)
            strTEL_MOBILE = Value
        End Set
    End Property

    Public Property TEL_INDOOR() As String
        Get
            Return strTEL_INDOOR
        End Get
        Set(ByVal Value As String)
            strTEL_INDOOR = Value
        End Set
    End Property

    Public Property DATEOFBIRTH() As Date
        Get
            Return clsDATEOFBIRTH
        End Get
        Set(ByVal Value As Date)
            clsDATEOFBIRTH = Value
        End Set
    End Property

    Public Property IMAGENAME() As String
        Get
            Return strIMAGENAME
        End Get
        Set(ByVal Value As String)
            strIMAGENAME = Value
        End Set
    End Property

    Public Property DATEOFSTART() As Date
        Get
            Return clsDATEOFSTART
        End Get
        Set(ByVal Value As Date)
            clsDATEOFSTART = Value
        End Set
    End Property

    Public Property STATUS() As String
        Get
            Return strSTATUS
        End Get
        Set(ByVal Value As String)
            strSTATUS = Value
        End Set
    End Property

    Public Property TEAM_ID() As String
        Get
            Return strTEAM_ID
        End Get
        Set(ByVal Value As String)
            strTEAM_ID = Value
        End Set
    End Property

    Public Property GROUP_HEAD() As String
        Get
            Return strGROUP_HEAD
        End Get
        Set(ByVal Value As String)
            strGROUP_HEAD = Value
        End Set
    End Property

    Public Property ROLE() As Integer
        Get
            Return intROLE
        End Get
        Set(ByVal Value As Integer)
            intROLE = Value
        End Set
    End Property

    Public Property PERMIT() As String
        Get
            Return strPERMIT
        End Get
        Set(ByVal Value As String)
            strPERMIT = Value
        End Set
    End Property

    Public Property USERNAME() As String
        Get
            Return strUSERNAME
        End Get
        Set(ByVal Value As String)
            strUSERNAME = Value
        End Set
    End Property

    Public Property PASSWD() As String
        Get
            Return strPASSWD
        End Get
        Set(ByVal Value As String)
            strPASSWD = Value
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

    Public Property Dept() As Integer
        Get
            Return intDept
        End Get
        Set(ByVal Value As Integer)
            intDept = Value
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

    Public Property Id_Branch() As Integer
        Get
            Return intId_Branch
        End Get
        Set(ByVal Value As Integer)
            intId_Branch = Value
        End Set
    End Property

    Public Property POSITION_CODE() As String
        Get
            Return strPOSITION_CODE
        End Get
        Set(ByVal Value As String)
            strPOSITION_CODE = Value
        End Set
    End Property

    Public Property Id_Region_Group() As String
        Get
            Return strId_Region_Group
        End Get
        Set(ByVal Value As String)
            strId_Region_Group = Value
        End Set
    End Property

    Public Property Id_Branch_Group() As String
        Get
            Return strId_Branch_Group
        End Get
        Set(ByVal Value As String)
            strId_Branch_Group = Value
        End Set
    End Property

    Public Property Id_Group_Group() As String
        Get
            Return strId_Group_Group
        End Get
        Set(ByVal Value As String)
            strId_Group_Group = Value
        End Set
    End Property

    Public Property LEVEL_ID() As String
        Get
            Return strLEVEL_ID
        End Get
        Set(ByVal Value As String)
            strLEVEL_ID = Value
        End Set
    End Property

#End Region

#Region "Print"
    Public Sub Print()
        Debug.print("")
        Debug.Print("EMP_ID : " & EMP_ID)
        Debug.Print("TITLE_CODE : " & TITLE_CODE)
        Debug.Print("EMPNAME : " & EMPNAME)
        Debug.Print("EMPSURNAME : " & EMPSURNAME)
        Debug.Print("EMPNAME_E : " & EMPNAME_E)
        Debug.Print("EMPSURNAME_E : " & EMPSURNAME_E)
        Debug.Print("EMAIL : " & EMAIL)
        Debug.Print("IDCARD : " & IDCARD)
        Debug.Print("TAX_NO : " & TAX_NO)
        Debug.Print("ACCNO : " & ACCNO)
        Debug.Print("ADDRESS : " & ADDRESS)
        Debug.Print("SOI : " & SOI)
        Debug.Print("ROAD : " & ROAD)
        Debug.Print("LOCALITY : " & LOCALITY)
        Debug.Print("DISTRINCT : " & DISTRINCT)
        Debug.Print("PROV_CODE : " & PROV_CODE)
        Debug.Print("ZIPCODE : " & ZIPCODE)
        Debug.Print("TEL_HOME : " & TEL_HOME)
        Debug.Print("TEL_MOBILE : " & TEL_MOBILE)
        Debug.Print("TEL_INDOOR : " & TEL_INDOOR)
        Debug.Print("DATEOFBIRTH : " & DATEOFBIRTH)
        Debug.Print("IMAGENAME : " & IMAGENAME)
        Debug.Print("DATEOFSTART : " & DATEOFSTART)
        Debug.Print("STATUS : " & STATUS)
        Debug.Print("TEAM_ID : " & TEAM_ID)
        Debug.Print("GROUP_HEAD : " & GROUP_HEAD)
        Debug.Print("ROLE : " & ROLE)
        Debug.Print("PERMIT : " & PERMIT)
        Debug.Print("USERNAME : " & USERNAME)
        Debug.Print("PASSWD : " & PASSWD)
        Debug.Print("UP_DT : " & UP_DT)
        Debug.Print("Dept : " & Dept)
        Debug.Print("Id_Region : " & Id_Region)
        Debug.Print("Id_Branch : " & Id_Branch)
        Debug.Print("POSITION_CODE : " & POSITION_CODE)
        Debug.Print("Id_Region_Group : " & Id_Region_Group)
        Debug.Print("Id_Branch_Group : " & Id_Branch_Group)
        Debug.Print("Id_Group_Group : " & Id_Group_Group)
        Debug.Print("LEVEL_ID : " & LEVEL_ID)
    End Sub

#End Region
End Class