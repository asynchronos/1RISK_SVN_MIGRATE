Option Explicit On
Option Strict On

Imports Microsoft.VisualBasic
Imports System.Diagnostics

Public Class StopCustomerDescFull

	Private Const CLSNAME As String = "Class StopCustomerDescFull"

	Private dblPRINCIPAL As Double
	Private dblACCRU As Double
	Private dblAGING_DPD_C As Double
	Private dblAGING_DPD_O As Double
	Private strAGING_H As String
	Private strHAS_OTHER_CLASS As String
    Private strCLASS_H As String
    Private strCLASS_H_M As String
    Private strIS_TDR As String
	Private dblOD_UTILIZE As Double
	Private strBUSINESS_CIM_FLAG As String
	Private strBUSINESS_CODE As String
	Private strBUSINESS_DESC As String
	Private intCIF As Integer
	Private dblAGING_DPD_IN As Double
	Private strHAS_OTHER_CLASS_IN As String
	Private strIS_TDR_IN As String
	Private dblOD_UTILIZE_IN As Double
	Private strJUDGEMENT_ID_IN As String
	Private strBUSINESS_CIM_FLAG_IN As String
	Private strBUSINESS_CODE_IN As String
	Private strBUSINESS_DESC_IN As String
	Private strAGING_CRITERIA_IN As String
	Private strCLASS_CRITERIA_IN As String
	Private strTDR_CRITERIA_IN As String
	Private strOD_UTILIZE_CRITERIA_IN As String
	Private strJUDGEMENT_CRITERIA_IN As String
	Private strBUSINESS_CRITERIA_IN As String
	Private dtDATE_IN As Date
	Private strUPDATE_ACTION_ID As String
	Private dtUPDATE_ACTION_DATE As Date
	Private strUPDATE_ACTION_USER As String
	Private strUPDATE_PAY_ABILITY_ID As String
	Private strUPDATE_DEPT_RESOLVE_ID As String
	Private dtUPDATE_TDR_DATE As Date
	Private strCONTROLLING_UNIT As String
	Private strREGION_CONTROLLING_UNIT As String
	Private strCM_CODE As String
	Private strCM_NAME As String
	Private strCUSTOMER_NAME As String
	Private strLEVEL_NAME As String
	Private strLEVEL_NAME_2 As String
	Private intDEPTFLAG As Integer
	Private intDEPTTRAN As Integer
    Private strUPDATE_COMMENT As String
    Private strUPDATE_PROBLEM As String
    Private strJudgement As String
	Private strJudgement_in As String
	Private strACTION_DETAIL As String
	Private strPAY_ABILITY_DETAIL As String
	Private strDEPT_RESOLVE_DETAIL As String
	Private strUPDATE_PAY_DETAIL_ID As String
	Private strPAY_DETAIL As String
	Private dblSUSP As Double
	Private dblAGING_DPD As Double
	Private dblMOVEMENT As Double
    Private strJUDGEMENT_ID As String
    Private strID_StatusG As String
    Private strStatusG_Thai As String
    Private strPAY_STATUS_ID As String
    Private strPAY_STATUS_DETAIL As String
    Private dtOD_AS_OF As DateTime
    Private dtTDR_DATE_REPORT As DateTime
    Private dtJUDGEMENT_SNAPDATE As DateTime
    Private strUPDATE_PREDICT_NPL As String



	Public Property PRINCIPAL As Double
	Get
		Return dblPRINCIPAL
	End Get
	Set (ByVal Value As Double)
		dblPRINCIPAL = Value
	End Set
	End Property

	Public Property ACCRU As Double
	Get
		Return dblACCRU
	End Get
	Set (ByVal Value As Double)
		dblACCRU = Value
	End Set
	End Property

	Public Property AGING_DPD_C As Double
	Get
		Return dblAGING_DPD_C
	End Get
	Set (ByVal Value As Double)
		dblAGING_DPD_C = Value
	End Set
	End Property

	Public Property AGING_DPD_O As Double
	Get
		Return dblAGING_DPD_O
	End Get
	Set (ByVal Value As Double)
		dblAGING_DPD_O = Value
	End Set
	End Property

	Public Property AGING_H As String
	Get
		Return strAGING_H
	End Get
	Set (ByVal Value As String)
		strAGING_H = Value
	End Set
	End Property

	Public Property HAS_OTHER_CLASS As String
	Get
		Return strHAS_OTHER_CLASS
	End Get
	Set (ByVal Value As String)
		strHAS_OTHER_CLASS = Value
	End Set
	End Property

	Public Property CLASS_H As String
	Get
		Return strCLASS_H
	End Get
	Set (ByVal Value As String)
		strCLASS_H = Value
	End Set
	End Property
    Public Property CLASS_H_M() As String
        Get
            Return strCLASS_H_M
        End Get
        Set(ByVal Value As String)
            strCLASS_H_M = Value
        End Set
    End Property
	Public Property IS_TDR As String
	Get
		Return strIS_TDR
	End Get
	Set (ByVal Value As String)
		strIS_TDR = Value
	End Set
	End Property

	Public Property OD_UTILIZE As Double
	Get
		Return dblOD_UTILIZE
	End Get
	Set (ByVal Value As Double)
		dblOD_UTILIZE = Value
	End Set
	End Property

	Public Property BUSINESS_CIM_FLAG As String
	Get
		Return strBUSINESS_CIM_FLAG
	End Get
	Set (ByVal Value As String)
		strBUSINESS_CIM_FLAG = Value
	End Set
	End Property

	Public Property BUSINESS_CODE As String
	Get
		Return strBUSINESS_CODE
	End Get
	Set (ByVal Value As String)
		strBUSINESS_CODE = Value
	End Set
	End Property

	Public Property BUSINESS_DESC As String
	Get
		Return strBUSINESS_DESC
	End Get
	Set (ByVal Value As String)
		strBUSINESS_DESC = Value
	End Set
	End Property

	Public Property CIF As Integer
	Get
		Return intCIF
	End Get
	Set (ByVal Value As Integer)
		intCIF = Value
	End Set
	End Property

	Public Property AGING_DPD_IN As Double
	Get
		Return dblAGING_DPD_IN
	End Get
	Set (ByVal Value As Double)
		dblAGING_DPD_IN = Value
	End Set
	End Property

	Public Property HAS_OTHER_CLASS_IN As String
	Get
		Return strHAS_OTHER_CLASS_IN
	End Get
	Set (ByVal Value As String)
		strHAS_OTHER_CLASS_IN = Value
	End Set
	End Property

	Public Property IS_TDR_IN As String
	Get
		Return strIS_TDR_IN
	End Get
	Set (ByVal Value As String)
		strIS_TDR_IN = Value
	End Set
	End Property

	Public Property OD_UTILIZE_IN As Double
	Get
		Return dblOD_UTILIZE_IN
	End Get
	Set (ByVal Value As Double)
		dblOD_UTILIZE_IN = Value
	End Set
	End Property

	Public Property JUDGEMENT_ID_IN As String
	Get
		Return strJUDGEMENT_ID_IN
	End Get
	Set (ByVal Value As String)
		strJUDGEMENT_ID_IN = Value
	End Set
	End Property

	Public Property BUSINESS_CIM_FLAG_IN As String
	Get
		Return strBUSINESS_CIM_FLAG_IN
	End Get
	Set (ByVal Value As String)
		strBUSINESS_CIM_FLAG_IN = Value
	End Set
	End Property

	Public Property BUSINESS_CODE_IN As String
	Get
		Return strBUSINESS_CODE_IN
	End Get
	Set (ByVal Value As String)
		strBUSINESS_CODE_IN = Value
	End Set
	End Property

	Public Property BUSINESS_DESC_IN As String
	Get
		Return strBUSINESS_DESC_IN
	End Get
	Set (ByVal Value As String)
		strBUSINESS_DESC_IN = Value
	End Set
	End Property

	Public Property AGING_CRITERIA_IN As String
	Get
		Return strAGING_CRITERIA_IN
	End Get
	Set (ByVal Value As String)
		strAGING_CRITERIA_IN = Value
	End Set
	End Property

	Public Property CLASS_CRITERIA_IN As String
	Get
		Return strCLASS_CRITERIA_IN
	End Get
	Set (ByVal Value As String)
		strCLASS_CRITERIA_IN = Value
	End Set
	End Property

	Public Property TDR_CRITERIA_IN As String
	Get
		Return strTDR_CRITERIA_IN
	End Get
	Set (ByVal Value As String)
		strTDR_CRITERIA_IN = Value
	End Set
	End Property

	Public Property OD_UTILIZE_CRITERIA_IN As String
	Get
		Return strOD_UTILIZE_CRITERIA_IN
	End Get
	Set (ByVal Value As String)
		strOD_UTILIZE_CRITERIA_IN = Value
	End Set
	End Property

	Public Property JUDGEMENT_CRITERIA_IN As String
	Get
		Return strJUDGEMENT_CRITERIA_IN
	End Get
	Set (ByVal Value As String)
		strJUDGEMENT_CRITERIA_IN = Value
	End Set
	End Property

	Public Property BUSINESS_CRITERIA_IN As String
	Get
		Return strBUSINESS_CRITERIA_IN
	End Get
	Set (ByVal Value As String)
		strBUSINESS_CRITERIA_IN = Value
	End Set
	End Property

	Public Property DATE_IN As Date
	Get
		Return dtDATE_IN
	End Get
	Set (ByVal Value As Date)
		dtDATE_IN = Value
	End Set
	End Property

	Public Property UPDATE_ACTION_ID As String
	Get
		Return strUPDATE_ACTION_ID
	End Get
	Set (ByVal Value As String)
		strUPDATE_ACTION_ID = Value
	End Set
	End Property

	Public Property UPDATE_ACTION_DATE As Date
	Get
		Return dtUPDATE_ACTION_DATE
	End Get
	Set (ByVal Value As Date)
		dtUPDATE_ACTION_DATE = Value
	End Set
	End Property

	Public Property UPDATE_ACTION_USER As String
	Get
		Return strUPDATE_ACTION_USER
	End Get
	Set (ByVal Value As String)
		strUPDATE_ACTION_USER = Value
	End Set
	End Property

	Public Property UPDATE_PAY_ABILITY_ID As String
	Get
		Return strUPDATE_PAY_ABILITY_ID
	End Get
	Set (ByVal Value As String)
		strUPDATE_PAY_ABILITY_ID = Value
	End Set
	End Property

	Public Property UPDATE_DEPT_RESOLVE_ID As String
	Get
		Return strUPDATE_DEPT_RESOLVE_ID
	End Get
	Set (ByVal Value As String)
		strUPDATE_DEPT_RESOLVE_ID = Value
	End Set
	End Property

	Public Property UPDATE_TDR_DATE As Date
	Get
		Return dtUPDATE_TDR_DATE
	End Get
	Set (ByVal Value As Date)
		dtUPDATE_TDR_DATE = Value
	End Set
	End Property

	Public Property CONTROLLING_UNIT As String
	Get
		Return strCONTROLLING_UNIT
	End Get
	Set (ByVal Value As String)
		strCONTROLLING_UNIT = Value
	End Set
	End Property

	Public Property REGION_CONTROLLING_UNIT As String
	Get
		Return strREGION_CONTROLLING_UNIT
	End Get
	Set (ByVal Value As String)
		strREGION_CONTROLLING_UNIT = Value
	End Set
	End Property

	Public Property CM_CODE As String
	Get
		Return strCM_CODE
	End Get
	Set (ByVal Value As String)
		strCM_CODE = Value
	End Set
	End Property

	Public Property CM_NAME As String
	Get
		Return strCM_NAME
	End Get
	Set (ByVal Value As String)
		strCM_NAME = Value
	End Set
	End Property

	Public Property CUSTOMER_NAME As String
	Get
		Return strCUSTOMER_NAME
	End Get
	Set (ByVal Value As String)
		strCUSTOMER_NAME = Value
	End Set
	End Property

	Public Property LEVEL_NAME As String
	Get
		Return strLEVEL_NAME
	End Get
	Set (ByVal Value As String)
		strLEVEL_NAME = Value
	End Set
	End Property

	Public Property LEVEL_NAME_2 As String
	Get
		Return strLEVEL_NAME_2
	End Get
	Set (ByVal Value As String)
		strLEVEL_NAME_2 = Value
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

    Public Property UPDATE_COMMENT() As String
        Get
            Return strUPDATE_COMMENT
        End Get
        Set(ByVal Value As String)
            strUPDATE_COMMENT = Value
        End Set
    End Property
    Public Property UPDATE_PROBLEM() As String
        Get
            Return strUPDATE_PROBLEM
        End Get
        Set(ByVal Value As String)
            strUPDATE_PROBLEM = Value
        End Set
    End Property

    Public Property UPDATE_PREDICT_NPL() As String
        Get
            Return strUPDATE_PREDICT_NPL
        End Get
        Set(ByVal Value As String)
            strUPDATE_PREDICT_NPL = Value
        End Set
    End Property

    Public Property Judgement() As String
        Get
            Return strJudgement
        End Get
        Set(ByVal Value As String)
            strJudgement = Value
        End Set
    End Property

	Public Property Judgement_in As String
	Get
		Return strJudgement_in
	End Get
	Set (ByVal Value As String)
		strJudgement_in = Value
	End Set
	End Property

	Public Property ACTION_DETAIL As String
	Get
		Return strACTION_DETAIL
	End Get
	Set (ByVal Value As String)
		strACTION_DETAIL = Value
	End Set
	End Property

	Public Property PAY_ABILITY_DETAIL As String
	Get
		Return strPAY_ABILITY_DETAIL
	End Get
	Set (ByVal Value As String)
		strPAY_ABILITY_DETAIL = Value
	End Set
	End Property

	Public Property DEPT_RESOLVE_DETAIL As String
	Get
		Return strDEPT_RESOLVE_DETAIL
	End Get
	Set (ByVal Value As String)
		strDEPT_RESOLVE_DETAIL = Value
	End Set
	End Property

	Public Property UPDATE_PAY_DETAIL_ID As String
	Get
		Return strUPDATE_PAY_DETAIL_ID
	End Get
	Set (ByVal Value As String)
		strUPDATE_PAY_DETAIL_ID = Value
	End Set
	End Property

	Public Property PAY_DETAIL As String
	Get
		Return strPAY_DETAIL
	End Get
	Set (ByVal Value As String)
		strPAY_DETAIL = Value
	End Set
	End Property

	Public Property SUSP As Double
	Get
		Return dblSUSP
	End Get
	Set (ByVal Value As Double)
		dblSUSP = Value
	End Set
	End Property

	Public Property AGING_DPD As Double
	Get
		Return dblAGING_DPD
	End Get
	Set (ByVal Value As Double)
		dblAGING_DPD = Value
	End Set
	End Property

	Public Property MOVEMENT As Double
	Get
		Return dblMOVEMENT
	End Get
	Set (ByVal Value As Double)
		dblMOVEMENT = Value
	End Set
	End Property

    Public Property JUDGEMENT_ID() As String
        Get
            Return strJUDGEMENT_ID
        End Get
        Set(ByVal Value As String)
            strJUDGEMENT_ID = Value
        End Set
    End Property
    Public Property ID_StatusG() As String
        Get
            Return strID_StatusG
        End Get
        Set(ByVal Value As String)
            strID_StatusG = Value
        End Set
    End Property
    Public Property StatusG_Thai() As String
        Get
            Return strStatusG_Thai
        End Get
        Set(ByVal Value As String)
            strStatusG_Thai = Value
        End Set
    End Property
    Public Property PAY_STATUS_ID() As String
        Get
            Return strPAY_STATUS_ID
        End Get
        Set(ByVal Value As String)
            strPAY_STATUS_ID = Value
        End Set
    End Property
    Public Property PAY_STATUS_DETAIL() As String
        Get
            Return strPAY_STATUS_DETAIL
        End Get
        Set(ByVal Value As String)
            strPAY_STATUS_DETAIL = Value
        End Set
    End Property

    Public Property OD_AS_OF() As DateTime
        Get
            Return dtOD_AS_OF
        End Get
        Set(ByVal Value As DateTime)
            dtOD_AS_OF = Value
        End Set
    End Property
    Public Property TDR_DATE_REPORT() As DateTime
        Get
            Return dtTDR_DATE_REPORT
        End Get
        Set(ByVal Value As DateTime)
            dtTDR_DATE_REPORT = Value
        End Set
    End Property
    Public Property JUDGEMENT_SNAPDATE() As DateTime
        Get
            Return dtJUDGEMENT_SNAPDATE
        End Get
        Set(ByVal Value As DateTime)
            dtJUDGEMENT_SNAPDATE = Value
        End Set
    End Property

	Public Sub Print()
		Debug.print("")
		Debug.Print("PRINCIPAL : " & PRINCIPAL)
		Debug.Print("ACCRU : " & ACCRU)
		Debug.Print("AGING_DPD_C : " & AGING_DPD_C)
		Debug.Print("AGING_DPD_O : " & AGING_DPD_O)
		Debug.Print("AGING_H : " & AGING_H)
		Debug.Print("HAS_OTHER_CLASS : " & HAS_OTHER_CLASS)
        Debug.Print("CLASS_H : " & CLASS_H)
        Debug.Print("CLASS_H_M : " & CLASS_H_M)
        Debug.Print("IS_TDR : " & IS_TDR)
		Debug.Print("OD_UTILIZE : " & OD_UTILIZE)
		Debug.Print("BUSINESS_CIM_FLAG : " & BUSINESS_CIM_FLAG)
		Debug.Print("BUSINESS_CODE : " & BUSINESS_CODE)
		Debug.Print("BUSINESS_DESC : " & BUSINESS_DESC)
		Debug.Print("CIF : " & CIF)
		Debug.Print("AGING_DPD_IN : " & AGING_DPD_IN)
		Debug.Print("HAS_OTHER_CLASS_IN : " & HAS_OTHER_CLASS_IN)
		Debug.Print("IS_TDR_IN : " & IS_TDR_IN)
		Debug.Print("OD_UTILIZE_IN : " & OD_UTILIZE_IN)
		Debug.Print("JUDGEMENT_ID_IN : " & JUDGEMENT_ID_IN)
		Debug.Print("BUSINESS_CIM_FLAG_IN : " & BUSINESS_CIM_FLAG_IN)
		Debug.Print("BUSINESS_CODE_IN : " & BUSINESS_CODE_IN)
		Debug.Print("BUSINESS_DESC_IN : " & BUSINESS_DESC_IN)
		Debug.Print("AGING_CRITERIA_IN : " & AGING_CRITERIA_IN)
		Debug.Print("CLASS_CRITERIA_IN : " & CLASS_CRITERIA_IN)
		Debug.Print("TDR_CRITERIA_IN : " & TDR_CRITERIA_IN)
		Debug.Print("OD_UTILIZE_CRITERIA_IN : " & OD_UTILIZE_CRITERIA_IN)
		Debug.Print("JUDGEMENT_CRITERIA_IN : " & JUDGEMENT_CRITERIA_IN)
		Debug.Print("BUSINESS_CRITERIA_IN : " & BUSINESS_CRITERIA_IN)
		Debug.Print("DATE_IN : " & DATE_IN)
		Debug.Print("UPDATE_ACTION_ID : " & UPDATE_ACTION_ID)
		Debug.Print("UPDATE_ACTION_DATE : " & UPDATE_ACTION_DATE)
		Debug.Print("UPDATE_ACTION_USER : " & UPDATE_ACTION_USER)
		Debug.Print("UPDATE_PAY_ABILITY_ID : " & UPDATE_PAY_ABILITY_ID)
		Debug.Print("UPDATE_DEPT_RESOLVE_ID : " & UPDATE_DEPT_RESOLVE_ID)
		Debug.Print("UPDATE_TDR_DATE : " & UPDATE_TDR_DATE)
		Debug.Print("CONTROLLING_UNIT : " & CONTROLLING_UNIT)
		Debug.Print("REGION_CONTROLLING_UNIT : " & REGION_CONTROLLING_UNIT)
		Debug.Print("CM_CODE : " & CM_CODE)
		Debug.Print("CM_NAME : " & CM_NAME)
		Debug.Print("CUSTOMER_NAME : " & CUSTOMER_NAME)
		Debug.Print("LEVEL_NAME : " & LEVEL_NAME)
		Debug.Print("LEVEL_NAME_2 : " & LEVEL_NAME_2)
		Debug.Print("DEPTFLAG : " & DEPTFLAG)
		Debug.Print("DEPTTRAN : " & DEPTTRAN)
        Debug.Print("UPDATE_COMMENT : " & UPDATE_COMMENT)
        Debug.Print("UPDATE_PROBLEM : " & UPDATE_PROBLEM)   '  เพิ่มวันที่ 11/07/2009    แสดงวันนที่ในข้อมูล
        Debug.Print("UPDATE_PREDICT_NPL : " & UPDATE_PREDICT_NPL)   '  เพิ่มวันที่ 27/04/2553    แสดงวันนที่ในข้อมูล
        Debug.Print("Judgement : " & Judgement)
		Debug.Print("Judgement_in : " & Judgement_in)
		Debug.Print("ACTION_DETAIL : " & ACTION_DETAIL)
		Debug.Print("PAY_ABILITY_DETAIL : " & PAY_ABILITY_DETAIL)
		Debug.Print("DEPT_RESOLVE_DETAIL : " & DEPT_RESOLVE_DETAIL)
		Debug.Print("UPDATE_PAY_DETAIL_ID : " & UPDATE_PAY_DETAIL_ID)
		Debug.Print("PAY_DETAIL : " & PAY_DETAIL)
		Debug.Print("SUSP : " & SUSP)
		Debug.Print("AGING_DPD : " & AGING_DPD)
		Debug.Print("MOVEMENT : " & MOVEMENT)
        Debug.Print("JUDGEMENT_ID : " & JUDGEMENT_ID)
        Debug.Print("ID_StatusG : " & ID_StatusG)
        Debug.Print("StatusG_Thai : " & StatusG_Thai)
        Debug.Print("PAY_STATUS_ID : " & PAY_STATUS_ID)
        Debug.Print("PAY_STATUS_DETAIL : " & PAY_STATUS_DETAIL)
        Debug.Print("OD_AS_OF : " & OD_AS_OF)
        Debug.Print("TDR_DATE_REPORT : " & TDR_DATE_REPORT)
        Debug.Print("JUDGEMENT_SNAPDATE : " & JUDGEMENT_SNAPDATE)



    End Sub

End Class
