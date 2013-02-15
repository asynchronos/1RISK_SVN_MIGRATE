Option Explicit On
Option Strict On

Imports Microsoft.VisualBasic
Imports System.Diagnostics

Public Class Customer

	Private Const CLSNAME As String = "Class Customer"

	Private intCIF As Integer
	Private strCUS_TITLE As String
	Private strCUS_FIRST As String
	Private strCUS_LAST As String
	Private strCUS1_TITLE As String
	Private strCUS1_FIRST As String
	Private strCUS1_LAST As String
	Private strCUS2_TITLE As String
	Private strCUS2_FIRST As String
	Private strCUS2_LAST As String
	Private strCUS3_TITLE As String
	Private strCUS3_FIRST As String
	Private strCUS3_LAST As String
	Private strCTITLE_E As String
	Private strCFIRST_E As String
	Private strCLAST_E As String
	Private strCifType As String
	Private intBOTID As Integer
	Private intMAIN_CUST As Integer
	Private strGROUP_CUST As String
	Private intGROUPCIF As Integer
	Private strBAYRATING As String
	Private strADDR1 As String
	Private strADDR2 As String
	Private strPROV As String
	Private intZIPCODE As Integer
	Private strTEL_HOME As String
	Private strTEL_OFF As String
	Private strTAX_NO As String
	Private strCUS_TYPE As String
	Private intBUSI_TYPE As Integer
	Private strCLASS As String
	Private strIDCARD As String
	Private sinOFFICR_ID As Single
	Private dtDATEFAS As Date
	Private dtBEINGCUST As Date
	Private dtBTHDATE As Date
	Private intDEPTFLAG As Integer
	Private intDEPTTRAN As Integer
	Private intCIF0 As Integer
	Private intCIF1 As Integer
	Private intCIF2 As Integer
	Private intPROVSHOP As Integer
	Private strSEX As String
	Private strADDRWORK1 As String
	Private strADDRWORK2 As String
	Private intZIPSHOP As Integer
	Private strCARDTYPE As String
	Private strCARDNO As String

	Public Property CIF As Integer
	Get
		Return intCIF
	End Get
	Set (ByVal Value As Integer)
		intCIF = Value
	End Set
	End Property

	Public Property CUS_TITLE As String
	Get
		Return strCUS_TITLE
	End Get
	Set (ByVal Value As String)
		strCUS_TITLE = Value
	End Set
	End Property

	Public Property CUS_FIRST As String
	Get
		Return strCUS_FIRST
	End Get
	Set (ByVal Value As String)
		strCUS_FIRST = Value
	End Set
	End Property

	Public Property CUS_LAST As String
	Get
		Return strCUS_LAST
	End Get
	Set (ByVal Value As String)
		strCUS_LAST = Value
	End Set
	End Property

	Public Property CUS1_TITLE As String
	Get
		Return strCUS1_TITLE
	End Get
	Set (ByVal Value As String)
		strCUS1_TITLE = Value
	End Set
	End Property

	Public Property CUS1_FIRST As String
	Get
		Return strCUS1_FIRST
	End Get
	Set (ByVal Value As String)
		strCUS1_FIRST = Value
	End Set
	End Property

	Public Property CUS1_LAST As String
	Get
		Return strCUS1_LAST
	End Get
	Set (ByVal Value As String)
		strCUS1_LAST = Value
	End Set
	End Property

	Public Property CUS2_TITLE As String
	Get
		Return strCUS2_TITLE
	End Get
	Set (ByVal Value As String)
		strCUS2_TITLE = Value
	End Set
	End Property

	Public Property CUS2_FIRST As String
	Get
		Return strCUS2_FIRST
	End Get
	Set (ByVal Value As String)
		strCUS2_FIRST = Value
	End Set
	End Property

	Public Property CUS2_LAST As String
	Get
		Return strCUS2_LAST
	End Get
	Set (ByVal Value As String)
		strCUS2_LAST = Value
	End Set
	End Property

	Public Property CUS3_TITLE As String
	Get
		Return strCUS3_TITLE
	End Get
	Set (ByVal Value As String)
		strCUS3_TITLE = Value
	End Set
	End Property

	Public Property CUS3_FIRST As String
	Get
		Return strCUS3_FIRST
	End Get
	Set (ByVal Value As String)
		strCUS3_FIRST = Value
	End Set
	End Property

	Public Property CUS3_LAST As String
	Get
		Return strCUS3_LAST
	End Get
	Set (ByVal Value As String)
		strCUS3_LAST = Value
	End Set
	End Property

	Public Property CTITLE_E As String
	Get
		Return strCTITLE_E
	End Get
	Set (ByVal Value As String)
		strCTITLE_E = Value
	End Set
	End Property

	Public Property CFIRST_E As String
	Get
		Return strCFIRST_E
	End Get
	Set (ByVal Value As String)
		strCFIRST_E = Value
	End Set
	End Property

	Public Property CLAST_E As String
	Get
		Return strCLAST_E
	End Get
	Set (ByVal Value As String)
		strCLAST_E = Value
	End Set
	End Property

	Public Property CifType As String
	Get
		Return strCifType
	End Get
	Set (ByVal Value As String)
		strCifType = Value
	End Set
	End Property

	Public Property BOTID As Integer
	Get
		Return intBOTID
	End Get
	Set (ByVal Value As Integer)
		intBOTID = Value
	End Set
	End Property

	Public Property MAIN_CUST As Integer
	Get
		Return intMAIN_CUST
	End Get
	Set (ByVal Value As Integer)
		intMAIN_CUST = Value
	End Set
	End Property

	Public Property GROUP_CUST As String
	Get
		Return strGROUP_CUST
	End Get
	Set (ByVal Value As String)
		strGROUP_CUST = Value
	End Set
	End Property

	Public Property GROUPCIF As Integer
	Get
		Return intGROUPCIF
	End Get
	Set (ByVal Value As Integer)
		intGROUPCIF = Value
	End Set
	End Property

	Public Property BAYRATING As String
	Get
		Return strBAYRATING
	End Get
	Set (ByVal Value As String)
		strBAYRATING = Value
	End Set
	End Property

	Public Property ADDR1 As String
	Get
		Return strADDR1
	End Get
	Set (ByVal Value As String)
		strADDR1 = Value
	End Set
	End Property

	Public Property ADDR2 As String
	Get
		Return strADDR2
	End Get
	Set (ByVal Value As String)
		strADDR2 = Value
	End Set
	End Property

	Public Property PROV As String
	Get
		Return strPROV
	End Get
	Set (ByVal Value As String)
		strPROV = Value
	End Set
	End Property

	Public Property ZIPCODE As Integer
	Get
		Return intZIPCODE
	End Get
	Set (ByVal Value As Integer)
		intZIPCODE = Value
	End Set
	End Property

	Public Property TEL_HOME As String
	Get
		Return strTEL_HOME
	End Get
	Set (ByVal Value As String)
		strTEL_HOME = Value
	End Set
	End Property

	Public Property TEL_OFF As String
	Get
		Return strTEL_OFF
	End Get
	Set (ByVal Value As String)
		strTEL_OFF = Value
	End Set
	End Property

	Public Property TAX_NO As String
	Get
		Return strTAX_NO
	End Get
	Set (ByVal Value As String)
		strTAX_NO = Value
	End Set
	End Property

	Public Property CUS_TYPE As String
	Get
		Return strCUS_TYPE
	End Get
	Set (ByVal Value As String)
		strCUS_TYPE = Value
	End Set
	End Property

	Public Property BUSI_TYPE As Integer
	Get
		Return intBUSI_TYPE
	End Get
	Set (ByVal Value As Integer)
		intBUSI_TYPE = Value
	End Set
	End Property

    Public Property CLASSES() As String
        Get
            Return strCLASS
        End Get
        Set(ByVal Value As String)
            strCLASS = Value
        End Set
    End Property

	Public Property IDCARD As String
	Get
		Return strIDCARD
	End Get
	Set (ByVal Value As String)
		strIDCARD = Value
	End Set
	End Property

	Public Property OFFICR_ID As Single
	Get
		Return sinOFFICR_ID
	End Get
	Set (ByVal Value As Single)
		sinOFFICR_ID = Value
	End Set
	End Property

	Public Property DATEFAS As Date
	Get
		Return dtDATEFAS
	End Get
	Set (ByVal Value As Date)
		dtDATEFAS = Value
	End Set
	End Property

	Public Property BEINGCUST As Date
	Get
		Return dtBEINGCUST
	End Get
	Set (ByVal Value As Date)
		dtBEINGCUST = Value
	End Set
	End Property

	Public Property BTHDATE As Date
	Get
		Return dtBTHDATE
	End Get
	Set (ByVal Value As Date)
		dtBTHDATE = Value
	End Set
	End Property

	Public Property DEPTFLAG As Integer
	Get
		Return intDEPTFLAG
	End Get
	Set (ByVal Value As Integer)
		intDEPTFLAG = Value
	End Set
	End Property

	Public Property DEPTTRAN As Integer
	Get
		Return intDEPTTRAN
	End Get
	Set (ByVal Value As Integer)
		intDEPTTRAN = Value
	End Set
	End Property

	Public Property CIF0 As Integer
	Get
		Return intCIF0
	End Get
	Set (ByVal Value As Integer)
		intCIF0 = Value
	End Set
	End Property

	Public Property CIF1 As Integer
	Get
		Return intCIF1
	End Get
	Set (ByVal Value As Integer)
		intCIF1 = Value
	End Set
	End Property

	Public Property CIF2 As Integer
	Get
		Return intCIF2
	End Get
	Set (ByVal Value As Integer)
		intCIF2 = Value
	End Set
	End Property

	Public Property PROVSHOP As Integer
	Get
		Return intPROVSHOP
	End Get
	Set (ByVal Value As Integer)
		intPROVSHOP = Value
	End Set
	End Property

	Public Property SEX As String
	Get
		Return strSEX
	End Get
	Set (ByVal Value As String)
		strSEX = Value
	End Set
	End Property

	Public Property ADDRWORK1 As String
	Get
		Return strADDRWORK1
	End Get
	Set (ByVal Value As String)
		strADDRWORK1 = Value
	End Set
	End Property

	Public Property ADDRWORK2 As String
	Get
		Return strADDRWORK2
	End Get
	Set (ByVal Value As String)
		strADDRWORK2 = Value
	End Set
	End Property

	Public Property ZIPSHOP As Integer
	Get
		Return intZIPSHOP
	End Get
	Set (ByVal Value As Integer)
		intZIPSHOP = Value
	End Set
	End Property

	Public Property CARDTYPE As String
	Get
		Return strCARDTYPE
	End Get
	Set (ByVal Value As String)
		strCARDTYPE = Value
	End Set
	End Property

	Public Property CARDNO As String
	Get
		Return strCARDNO
	End Get
	Set (ByVal Value As String)
		strCARDNO = Value
	End Set
	End Property

	Public Sub Print()
		Debug.print("")
		Debug.Print("CIF : " & CIF)
		Debug.Print("CUS_TITLE : " & CUS_TITLE)
		Debug.Print("CUS_FIRST : " & CUS_FIRST)
		Debug.Print("CUS_LAST : " & CUS_LAST)
		Debug.Print("CUS1_TITLE : " & CUS1_TITLE)
		Debug.Print("CUS1_FIRST : " & CUS1_FIRST)
		Debug.Print("CUS1_LAST : " & CUS1_LAST)
		Debug.Print("CUS2_TITLE : " & CUS2_TITLE)
		Debug.Print("CUS2_FIRST : " & CUS2_FIRST)
		Debug.Print("CUS2_LAST : " & CUS2_LAST)
		Debug.Print("CUS3_TITLE : " & CUS3_TITLE)
		Debug.Print("CUS3_FIRST : " & CUS3_FIRST)
		Debug.Print("CUS3_LAST : " & CUS3_LAST)
		Debug.Print("CTITLE_E : " & CTITLE_E)
		Debug.Print("CFIRST_E : " & CFIRST_E)
		Debug.Print("CLAST_E : " & CLAST_E)
		Debug.Print("CifType : " & CifType)
		Debug.Print("BOTID : " & BOTID)
		Debug.Print("MAIN_CUST : " & MAIN_CUST)
		Debug.Print("GROUP_CUST : " & GROUP_CUST)
		Debug.Print("GROUPCIF : " & GROUPCIF)
		Debug.Print("BAYRATING : " & BAYRATING)
		Debug.Print("ADDR1 : " & ADDR1)
		Debug.Print("ADDR2 : " & ADDR2)
		Debug.Print("PROV : " & PROV)
		Debug.Print("ZIPCODE : " & ZIPCODE)
		Debug.Print("TEL_HOME : " & TEL_HOME)
		Debug.Print("TEL_OFF : " & TEL_OFF)
		Debug.Print("TAX_NO : " & TAX_NO)
		Debug.Print("CUS_TYPE : " & CUS_TYPE)
		Debug.Print("BUSI_TYPE : " & BUSI_TYPE)
        Debug.Print("CLASS : " & CLASSES)
		Debug.Print("IDCARD : " & IDCARD)
		Debug.Print("OFFICR_ID : " & OFFICR_ID)
		Debug.Print("DATEFAS : " & DATEFAS)
		Debug.Print("BEINGCUST : " & BEINGCUST)
		Debug.Print("BTHDATE : " & BTHDATE)
		Debug.Print("DEPTFLAG : " & DEPTFLAG)
		Debug.Print("DEPTTRAN : " & DEPTTRAN)
		Debug.Print("CIF0 : " & CIF0)
		Debug.Print("CIF1 : " & CIF1)
		Debug.Print("CIF2 : " & CIF2)
		Debug.Print("PROVSHOP : " & PROVSHOP)
		Debug.Print("SEX : " & SEX)
		Debug.Print("ADDRWORK1 : " & ADDRWORK1)
		Debug.Print("ADDRWORK2 : " & ADDRWORK2)
		Debug.Print("ZIPSHOP : " & ZIPSHOP)
		Debug.Print("CARDTYPE : " & CARDTYPE)
		Debug.Print("CARDNO : " & CARDNO)
	End Sub

End Class