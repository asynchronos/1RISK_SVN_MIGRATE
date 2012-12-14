Option Explicit On
Option Strict On

Imports Microsoft.VisualBasic
Imports System.Diagnostics

Public Class StopCustomer

	Private Const CLSNAME As String = "Class StopCustomer"

	Private intCIF As Integer
	Private dblAGING_DPD_IN As Double
	Private dblAGING_DPD_C_IN As Double
	Private dblAGING_DPD_O_IN As Double
	Private strAGING_H_IN As String
	Private strHAS_OTHER_CLASS_IN As String
	Private strCLASS_H_IN As String
	Private strIS_TDR_IN As String
	Private dblOD_UTILIZE_IN As Double
	Private dblMOVEMENT_IN As Double
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
	Private strUPDATE_PAY_DETAIL_ID As String
	Private strUPDATE_DEPT_RESOLVE_ID As String
	Private dtUPDATE_TDR_DATE As Date
    Private strUPDATE_COMMENT As String
    Private strUPDATE_PROBLEM As String
    Private intSEQUENCE As Integer
    Private strUPDATE_PREDICT_NPL As String


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

	Public Property AGING_DPD_C_IN As Double
	Get
		Return dblAGING_DPD_C_IN
	End Get
	Set (ByVal Value As Double)
		dblAGING_DPD_C_IN = Value
	End Set
	End Property

	Public Property AGING_DPD_O_IN As Double
	Get
		Return dblAGING_DPD_O_IN
	End Get
	Set (ByVal Value As Double)
		dblAGING_DPD_O_IN = Value
	End Set
	End Property

	Public Property AGING_H_IN As String
	Get
		Return strAGING_H_IN
	End Get
	Set (ByVal Value As String)
		strAGING_H_IN = Value
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

	Public Property CLASS_H_IN As String
	Get
		Return strCLASS_H_IN
	End Get
	Set (ByVal Value As String)
		strCLASS_H_IN = Value
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

	Public Property MOVEMENT_IN As Double
	Get
		Return dblMOVEMENT_IN
	End Get
	Set (ByVal Value As Double)
		dblMOVEMENT_IN = Value
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

	Public Property UPDATE_PAY_DETAIL_ID As String
	Get
		Return strUPDATE_PAY_DETAIL_ID
	End Get
	Set (ByVal Value As String)
		strUPDATE_PAY_DETAIL_ID = Value
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

    Public Property SEQUENCE() As Integer
        Get
            Return intSEQUENCE
        End Get
        Set(ByVal Value As Integer)
            intSEQUENCE = Value
        End Set
    End Property

    Public Sub Print()
        Debug.Print("")
        Debug.Print("CIF : " & CIF)
        Debug.Print("AGING_DPD_IN : " & AGING_DPD_IN)
        Debug.Print("AGING_DPD_C_IN : " & AGING_DPD_C_IN)
        Debug.Print("AGING_DPD_O_IN : " & AGING_DPD_O_IN)
        Debug.Print("AGING_H_IN : " & AGING_H_IN)
        Debug.Print("HAS_OTHER_CLASS_IN : " & HAS_OTHER_CLASS_IN)
        Debug.Print("CLASS_H_IN : " & CLASS_H_IN)
        Debug.Print("IS_TDR_IN : " & IS_TDR_IN)
        Debug.Print("OD_UTILIZE_IN : " & OD_UTILIZE_IN)
        Debug.Print("MOVEMENT_IN : " & MOVEMENT_IN)
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
        Debug.Print("UPDATE_PAY_DETAIL_ID : " & UPDATE_PAY_DETAIL_ID)
        Debug.Print("UPDATE_DEPT_RESOLVE_ID : " & UPDATE_DEPT_RESOLVE_ID)
        Debug.Print("UPDATE_TDR_DATE : " & UPDATE_TDR_DATE)
        Debug.Print("UPDATE_COMMENT : " & UPDATE_COMMENT)
        Debug.Print("UPDATE_PROBLEM: " & UPDATE_PROBLEM)
        Debug.Print("UPDATE_PREDICT_NPL: " & UPDATE_PROBLEM)
        Debug.Print("SEQUENCE : " & SEQUENCE)
    End Sub

End Class
