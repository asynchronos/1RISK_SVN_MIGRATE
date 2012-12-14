Option Explicit On
Option Strict On

Imports Microsoft.VisualBasic
Imports System.Diagnostics

Public Class TbCustomerRisk

    Private Const CLSNAME As String = "Class TbCustomerRisk"

    Private intCif As Integer
    Private strName As String
    Private intBOTID As Integer
    Private strGECustSize As String
    Private strGLGroup As String
    Private strPDGroup As String
    Private strRating As String
    Private intBusi_Type As Integer
    Private strTdr As String
    Private intDate_Report As Integer
    Private intBranch As Integer
    Private intBranchMaxPrin As Integer
    Private intDept As Integer
    Private intDEPT_APPV As Integer
    Private intDEPT_TRAN As Integer
    Private strClass As String
    Private strClassE As String
    Private dblAGING As Double
    Private dblNPL As Double
    Private dblLimit As Double
    Private dblPrinResv As Double
    Private dblPrincipalFull As Double
    Private strPrincipalG As String
    Private dblPrincipal As Double
    Private dblCont As Double
    Private dblCCF1 As Double
    Private dblContingent As Double
    Private dblAccruFull As Double
    Private dblAccru As Double
    Private dblSuspOri As Double
    Private dblSusp As Double
    Private dblUNEARNPRIN As Double
    Private dblUNEARNINT As Double
    Private dblUNCLEAPRIN As Double
    Private dblUNCLEAINT As Double
    Private dblDEFER As Double
    Private dblUseValue As Double
    Private dblBAfterC As Double
    Private dblTdrLoss As Double
    Private dblReserve As Double
    Private dblPVLOSS As Double
    Private dblExtraResv As Double
    Private dblBaySpresv As Double
    Private dblTotresv As Double
    Private dblOlddef_Exc As Double
    Private dblResvExc As Double
    Private dblColl_IAS39 As Double
    Private dblResvColIAS As Double
    Private dblFull_IAS39 As Double
    Private dblResvFull As Double
    Private strBotClass As String
    Private dblAddResv As Double
    Private dblBotColl As Double
    Private intCUS_DEPT_FLAG As Integer
    Private intCUS_DEPT_TRAN As Integer
    Private intOFFICR_ID As Integer
    Private bolNPLFLAG As Boolean
    Private intStatusPAY As Integer
    Private bolAffiliate As Boolean
    Private clsIMPORT_DATE As Date

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

    Public Property GECustSize() As String
        Get
            Return strGECustSize
        End Get
        Set(ByVal Value As String)
            strGECustSize = Value
        End Set
    End Property

    Public Property GLGroup() As String
        Get
            Return strGLGroup
        End Get
        Set(ByVal Value As String)
            strGLGroup = Value
        End Set
    End Property

    Public Property PDGroup() As String
        Get
            Return strPDGroup
        End Get
        Set(ByVal Value As String)
            strPDGroup = Value
        End Set
    End Property

    Public Property Rating() As String
        Get
            Return strRating
        End Get
        Set(ByVal Value As String)
            strRating = Value
        End Set
    End Property

    Public Property Busi_Type() As Integer
        Get
            Return intBusi_Type
        End Get
        Set(ByVal Value As Integer)
            intBusi_Type = Value
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

    Public Property Date_Report() As Integer
        Get
            Return intDate_Report
        End Get
        Set(ByVal Value As Integer)
            intDate_Report = Value
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

    Public Property BranchMaxPrin() As Integer
        Get
            Return intBranchMaxPrin
        End Get
        Set(ByVal Value As Integer)
            intBranchMaxPrin = Value
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

    Public Property DEPT_APPV() As Integer
        Get
            Return intDEPT_APPV
        End Get
        Set(ByVal Value As Integer)
            intDEPT_APPV = Value
        End Set
    End Property

    Public Property DEPT_TRAN() As Integer
        Get
            Return intDEPT_TRAN
        End Get
        Set(ByVal Value As Integer)
            intDEPT_TRAN = Value
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

    Public Property ClassE() As String
        Get
            Return strClassE
        End Get
        Set(ByVal Value As String)
            strClassE = Value
        End Set
    End Property

    Public Property AGING() As Double
        Get
            Return dblAGING
        End Get
        Set(ByVal Value As Double)
            dblAGING = Value
        End Set
    End Property

    Public Property NPL() As Double
        Get
            Return dblNPL
        End Get
        Set(ByVal Value As Double)
            dblNPL = Value
        End Set
    End Property

    Public Property Limit() As Double
        Get
            Return dblLimit
        End Get
        Set(ByVal Value As Double)
            dblLimit = Value
        End Set
    End Property

    Public Property PrinResv() As Double
        Get
            Return dblPrinResv
        End Get
        Set(ByVal Value As Double)
            dblPrinResv = Value
        End Set
    End Property

    Public Property PrincipalFull() As Double
        Get
            Return dblPrincipalFull
        End Get
        Set(ByVal Value As Double)
            dblPrincipalFull = Value
        End Set
    End Property

    Public Property PrincipalG() As String
        Get
            Return strPrincipalG
        End Get
        Set(ByVal Value As String)
            strPrincipalG = Value
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

    Public Property Cont() As Double
        Get
            Return dblCont
        End Get
        Set(ByVal Value As Double)
            dblCont = Value
        End Set
    End Property

    Public Property CCF1() As Double
        Get
            Return dblCCF1
        End Get
        Set(ByVal Value As Double)
            dblCCF1 = Value
        End Set
    End Property

    Public Property Contingent() As Double
        Get
            Return dblContingent
        End Get
        Set(ByVal Value As Double)
            dblContingent = Value
        End Set
    End Property

    Public Property AccruFull() As Double
        Get
            Return dblAccruFull
        End Get
        Set(ByVal Value As Double)
            dblAccruFull = Value
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

    Public Property SuspOri() As Double
        Get
            Return dblSuspOri
        End Get
        Set(ByVal Value As Double)
            dblSuspOri = Value
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

    Public Property UNEARNPRIN() As Double
        Get
            Return dblUNEARNPRIN
        End Get
        Set(ByVal Value As Double)
            dblUNEARNPRIN = Value
        End Set
    End Property

    Public Property UNEARNINT() As Double
        Get
            Return dblUNEARNINT
        End Get
        Set(ByVal Value As Double)
            dblUNEARNINT = Value
        End Set
    End Property

    Public Property UNCLEAPRIN() As Double
        Get
            Return dblUNCLEAPRIN
        End Get
        Set(ByVal Value As Double)
            dblUNCLEAPRIN = Value
        End Set
    End Property

    Public Property UNCLEAINT() As Double
        Get
            Return dblUNCLEAINT
        End Get
        Set(ByVal Value As Double)
            dblUNCLEAINT = Value
        End Set
    End Property

    Public Property DEFER() As Double
        Get
            Return dblDEFER
        End Get
        Set(ByVal Value As Double)
            dblDEFER = Value
        End Set
    End Property

    Public Property UseValue() As Double
        Get
            Return dblUseValue
        End Get
        Set(ByVal Value As Double)
            dblUseValue = Value
        End Set
    End Property

    Public Property BAfterC() As Double
        Get
            Return dblBAfterC
        End Get
        Set(ByVal Value As Double)
            dblBAfterC = Value
        End Set
    End Property

    Public Property TdrLoss() As Double
        Get
            Return dblTdrLoss
        End Get
        Set(ByVal Value As Double)
            dblTdrLoss = Value
        End Set
    End Property

    Public Property Reserve() As Double
        Get
            Return dblReserve
        End Get
        Set(ByVal Value As Double)
            dblReserve = Value
        End Set
    End Property

    Public Property PVLOSS() As Double
        Get
            Return dblPVLOSS
        End Get
        Set(ByVal Value As Double)
            dblPVLOSS = Value
        End Set
    End Property

    Public Property ExtraResv() As Double
        Get
            Return dblExtraResv
        End Get
        Set(ByVal Value As Double)
            dblExtraResv = Value
        End Set
    End Property

    Public Property BaySpresv() As Double
        Get
            Return dblBaySpresv
        End Get
        Set(ByVal Value As Double)
            dblBaySpresv = Value
        End Set
    End Property

    Public Property Totresv() As Double
        Get
            Return dblTotresv
        End Get
        Set(ByVal Value As Double)
            dblTotresv = Value
        End Set
    End Property

    Public Property Olddef_Exc() As Double
        Get
            Return dblOlddef_Exc
        End Get
        Set(ByVal Value As Double)
            dblOlddef_Exc = Value
        End Set
    End Property

    Public Property ResvExc() As Double
        Get
            Return dblResvExc
        End Get
        Set(ByVal Value As Double)
            dblResvExc = Value
        End Set
    End Property

    Public Property Coll_IAS39() As Double
        Get
            Return dblColl_IAS39
        End Get
        Set(ByVal Value As Double)
            dblColl_IAS39 = Value
        End Set
    End Property

    Public Property ResvColIAS() As Double
        Get
            Return dblResvColIAS
        End Get
        Set(ByVal Value As Double)
            dblResvColIAS = Value
        End Set
    End Property

    Public Property Full_IAS39() As Double
        Get
            Return dblFull_IAS39
        End Get
        Set(ByVal Value As Double)
            dblFull_IAS39 = Value
        End Set
    End Property

    Public Property ResvFull() As Double
        Get
            Return dblResvFull
        End Get
        Set(ByVal Value As Double)
            dblResvFull = Value
        End Set
    End Property

    Public Property BotClass() As String
        Get
            Return strBotClass
        End Get
        Set(ByVal Value As String)
            strBotClass = Value
        End Set
    End Property

    Public Property AddResv() As Double
        Get
            Return dblAddResv
        End Get
        Set(ByVal Value As Double)
            dblAddResv = Value
        End Set
    End Property

    Public Property BotColl() As Double
        Get
            Return dblBotColl
        End Get
        Set(ByVal Value As Double)
            dblBotColl = Value
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

    Public Property OFFICR_ID() As Integer
        Get
            Return intOFFICR_ID
        End Get
        Set(ByVal Value As Integer)
            intOFFICR_ID = Value
        End Set
    End Property

    Public Property NPLFLAG() As Boolean
        Get
            Return bolNPLFLAG
        End Get
        Set(ByVal Value As Boolean)
            bolNPLFLAG = Value
        End Set
    End Property

    Public Property StatusPAY() As Integer
        Get
            Return intStatusPAY
        End Get
        Set(ByVal Value As Integer)
            intStatusPAY = Value
        End Set
    End Property

    Public Property Affiliate() As Boolean
        Get
            Return bolAffiliate
        End Get
        Set(ByVal Value As Boolean)
            bolAffiliate = Value
        End Set
    End Property

    Public Property IMPORT_DATE() As Date
        Get
            Return clsIMPORT_DATE
        End Get
        Set(ByVal Value As Date)
            clsIMPORT_DATE = Value
        End Set
    End Property

    Public Sub Print()
        Debug.print("")
        Debug.Print("Cif : " & Cif)
        Debug.Print("Name : " & Name)
        Debug.Print("BOTID : " & BOTID)
        Debug.Print("GECustSize : " & GECustSize)
        Debug.Print("GLGroup : " & GLGroup)
        Debug.Print("PDGroup : " & PDGroup)
        Debug.Print("Rating : " & Rating)
        Debug.Print("Busi_Type : " & Busi_Type)
        Debug.Print("Tdr : " & Tdr)
        Debug.Print("Date_Report : " & Date_Report)
        Debug.Print("Branch : " & Branch)
        Debug.Print("BranchMaxPrin : " & BranchMaxPrin)
        Debug.Print("Dept : " & Dept)
        Debug.Print("DEPT_APPV : " & DEPT_APPV)
        Debug.Print("DEPT_TRAN : " & DEPT_TRAN)
        Debug.Print("Class : " & ClassDebt)
        Debug.Print("ClassE : " & ClassE)
        Debug.Print("AGING : " & AGING)
        Debug.Print("NPL : " & NPL)
        Debug.Print("Limit : " & Limit)
        Debug.Print("PrinResv : " & PrinResv)
        Debug.Print("PrincipalFull : " & PrincipalFull)
        Debug.Print("PrincipalG : " & PrincipalG)
        Debug.Print("Principal : " & Principal)
        Debug.Print("Cont : " & Cont)
        Debug.Print("CCF1 : " & CCF1)
        Debug.Print("Contingent : " & Contingent)
        Debug.Print("AccruFull : " & AccruFull)
        Debug.Print("Accru : " & Accru)
        Debug.Print("SuspOri : " & SuspOri)
        Debug.Print("Susp : " & Susp)
        Debug.Print("UNEARNPRIN : " & UNEARNPRIN)
        Debug.Print("UNEARNINT : " & UNEARNINT)
        Debug.Print("UNCLEAPRIN : " & UNCLEAPRIN)
        Debug.Print("UNCLEAINT : " & UNCLEAINT)
        Debug.Print("DEFER : " & DEFER)
        Debug.Print("UseValue : " & UseValue)
        Debug.Print("BAfterC : " & BAfterC)
        Debug.Print("TdrLoss : " & TdrLoss)
        Debug.Print("Reserve : " & Reserve)
        Debug.Print("PVLOSS : " & PVLOSS)
        Debug.Print("ExtraResv : " & ExtraResv)
        Debug.Print("BaySpresv : " & BaySpresv)
        Debug.Print("Totresv : " & Totresv)
        Debug.Print("Olddef_Exc : " & Olddef_Exc)
        Debug.Print("ResvExc : " & ResvExc)
        Debug.Print("Coll_IAS39 : " & Coll_IAS39)
        Debug.Print("ResvColIAS : " & ResvColIAS)
        Debug.Print("Full_IAS39 : " & Full_IAS39)
        Debug.Print("ResvFull : " & ResvFull)
        Debug.Print("BotClass : " & BotClass)
        Debug.Print("AddResv : " & AddResv)
        Debug.Print("BotColl : " & BotColl)
        Debug.Print("CUS_DEPT_FLAG : " & CUS_DEPT_FLAG)
        Debug.Print("CUS_DEPT_TRAN : " & CUS_DEPT_TRAN)
        Debug.Print("OFFICR_ID : " & OFFICR_ID)
        Debug.Print("NPLFLAG : " & NPLFLAG)
        Debug.Print("StatusPAY : " & StatusPAY)
        Debug.Print("Affiliate : " & Affiliate)
        Debug.Print("IMPORT_DATE : " & IMPORT_DATE)
    End Sub

End Class