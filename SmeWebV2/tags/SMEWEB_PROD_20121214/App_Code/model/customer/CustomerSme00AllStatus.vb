Option Explicit On
Option Strict On

Imports Microsoft.VisualBasic
Imports System.Diagnostics

Public Class CustomerSme00AllStatus

	Private Const CLSNAME As String = "Class CustomerSme00AllStatus"

	Private intCIF As Integer
	Private strCUSTOMER_NAME As String
	Private strCUSTOMER_NAME2 As String
	Private strCUSTOMER_NAME_E As String
	Private strCUSTOMER_NAME_E2 As String
	Private intGROUP_ID As Integer
	Private strCM_CODE As String
	Private strCM_NAME As String
	Private strCM_NAME_E As String
	Private strOLD_CM_CODE As String
	Private strOLD_CM_NAME As String
	Private strOLD_CM_NAME_E As String
	Private intBRANCH_ID As Integer
	Private strBRANCH_NAME As String
	Private intId_Region As Integer
	Private strRegion_Name As String
	Private strREGION_NAME2 As String
	Private intGROUP_SIZE_ID As Integer
	Private strGROUP_SIZE_DETAIL As String
	Private dblGROUP_EXPOSURE As Double
	Private dtNEXT_REVIEW_DATE As Date
	Private strJUDGEMENT_ID As String
	Private strJUDGEMENT_DETAIL As String
	Private strBUSI_RISK1_ID As String
	Private strBUSI_RISK1_DETAIL As String
	Private strBUSI_RISK2_ID As String
	Private strBUSI_RISK2_DETAIL As String
	Private strBUSI_RISK3_ID As String
	Private strBUSI_RISK3_DETAIL As String
	Private strUPDATE_BY As String
	Private strUPDATE_BY_NAME As String
	Private dtUPDATE_DATE As Date
	Private strBUSI_TYPE_CIM As String
	Private intDEPTFLAG As Integer
	Private intDEPTTRAN As Integer
	Private strOFFICR_ID As String
	Private strOFFICR_NAME As String
	Private strCONTROLLING_UNIT As String
	Private strCONTROLLING_UNIT_E As String
	Private strREGION_CONTROLLING_UNIT As String
	Private decBUSINESS_DESTINATION_ID As Decimal
	Private strBUSINESS_DESTINATION_DESC As String
	Private decEXPORT_WEIGHT As Decimal
	Private decLOCAL_WEIGHT As Decimal
	Private intSTATUS_ID As Integer
	Private strSTATUS_DETAIL As String
	Private intSIZE_ID As Integer
	Private strSIZE_DETAIL As String
	Private intRATING_TYPE_KEY As Integer
	Private intRATING_KEY As Integer
	Private dtRATING_UPDATE_DATE As Date
	Private strOLD_REGION_ID As String
	Private strOLD_REGION_NAME As String

	Public Property CIF As Integer
	Get
		Return intCIF
	End Get
	Set (ByVal Value As Integer)
		intCIF = Value
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

	Public Property CUSTOMER_NAME2 As String
	Get
		Return strCUSTOMER_NAME2
	End Get
	Set (ByVal Value As String)
		strCUSTOMER_NAME2 = Value
	End Set
	End Property

	Public Property CUSTOMER_NAME_E As String
	Get
		Return strCUSTOMER_NAME_E
	End Get
	Set (ByVal Value As String)
		strCUSTOMER_NAME_E = Value
	End Set
	End Property

	Public Property CUSTOMER_NAME_E2 As String
	Get
		Return strCUSTOMER_NAME_E2
	End Get
	Set (ByVal Value As String)
		strCUSTOMER_NAME_E2 = Value
	End Set
	End Property

	Public Property GROUP_ID As Integer
	Get
		Return intGROUP_ID
	End Get
	Set (ByVal Value As Integer)
		intGROUP_ID = Value
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

	Public Property CM_NAME_E As String
	Get
		Return strCM_NAME_E
	End Get
	Set (ByVal Value As String)
		strCM_NAME_E = Value
	End Set
	End Property

	Public Property OLD_CM_CODE As String
	Get
		Return strOLD_CM_CODE
	End Get
	Set (ByVal Value As String)
		strOLD_CM_CODE = Value
	End Set
	End Property

	Public Property OLD_CM_NAME As String
	Get
		Return strOLD_CM_NAME
	End Get
	Set (ByVal Value As String)
		strOLD_CM_NAME = Value
	End Set
	End Property

	Public Property OLD_CM_NAME_E As String
	Get
		Return strOLD_CM_NAME_E
	End Get
	Set (ByVal Value As String)
		strOLD_CM_NAME_E = Value
	End Set
	End Property

	Public Property BRANCH_ID As Integer
	Get
		Return intBRANCH_ID
	End Get
	Set (ByVal Value As Integer)
		intBRANCH_ID = Value
	End Set
	End Property

	Public Property BRANCH_NAME As String
	Get
		Return strBRANCH_NAME
	End Get
	Set (ByVal Value As String)
		strBRANCH_NAME = Value
	End Set
	End Property

	Public Property Id_Region As Integer
	Get
		Return intId_Region
	End Get
	Set (ByVal Value As Integer)
		intId_Region = Value
	End Set
	End Property

	Public Property Region_Name As String
	Get
		Return strRegion_Name
	End Get
	Set (ByVal Value As String)
		strRegion_Name = Value
	End Set
	End Property

	Public Property REGION_NAME2 As String
	Get
		Return strREGION_NAME2
	End Get
	Set (ByVal Value As String)
		strREGION_NAME2 = Value
	End Set
	End Property

	Public Property GROUP_SIZE_ID As Integer
	Get
		Return intGROUP_SIZE_ID
	End Get
	Set (ByVal Value As Integer)
		intGROUP_SIZE_ID = Value
	End Set
	End Property

	Public Property GROUP_SIZE_DETAIL As String
	Get
		Return strGROUP_SIZE_DETAIL
	End Get
	Set (ByVal Value As String)
		strGROUP_SIZE_DETAIL = Value
	End Set
	End Property

	Public Property GROUP_EXPOSURE As Double
	Get
		Return dblGROUP_EXPOSURE
	End Get
	Set (ByVal Value As Double)
		dblGROUP_EXPOSURE = Value
	End Set
	End Property

	Public Property NEXT_REVIEW_DATE As Date
	Get
		Return dtNEXT_REVIEW_DATE
	End Get
	Set (ByVal Value As Date)
		dtNEXT_REVIEW_DATE = Value
	End Set
	End Property

	Public Property JUDGEMENT_ID As String
	Get
		Return strJUDGEMENT_ID
	End Get
	Set (ByVal Value As String)
		strJUDGEMENT_ID = Value
	End Set
	End Property

	Public Property JUDGEMENT_DETAIL As String
	Get
		Return strJUDGEMENT_DETAIL
	End Get
	Set (ByVal Value As String)
		strJUDGEMENT_DETAIL = Value
	End Set
	End Property

	Public Property BUSI_RISK1_ID As String
	Get
		Return strBUSI_RISK1_ID
	End Get
	Set (ByVal Value As String)
		strBUSI_RISK1_ID = Value
	End Set
	End Property

	Public Property BUSI_RISK1_DETAIL As String
	Get
		Return strBUSI_RISK1_DETAIL
	End Get
	Set (ByVal Value As String)
		strBUSI_RISK1_DETAIL = Value
	End Set
	End Property

	Public Property BUSI_RISK2_ID As String
	Get
		Return strBUSI_RISK2_ID
	End Get
	Set (ByVal Value As String)
		strBUSI_RISK2_ID = Value
	End Set
	End Property

	Public Property BUSI_RISK2_DETAIL As String
	Get
		Return strBUSI_RISK2_DETAIL
	End Get
	Set (ByVal Value As String)
		strBUSI_RISK2_DETAIL = Value
	End Set
	End Property

	Public Property BUSI_RISK3_ID As String
	Get
		Return strBUSI_RISK3_ID
	End Get
	Set (ByVal Value As String)
		strBUSI_RISK3_ID = Value
	End Set
	End Property

	Public Property BUSI_RISK3_DETAIL As String
	Get
		Return strBUSI_RISK3_DETAIL
	End Get
	Set (ByVal Value As String)
		strBUSI_RISK3_DETAIL = Value
	End Set
	End Property

	Public Property UPDATE_BY As String
	Get
		Return strUPDATE_BY
	End Get
	Set (ByVal Value As String)
		strUPDATE_BY = Value
	End Set
	End Property

	Public Property UPDATE_BY_NAME As String
	Get
		Return strUPDATE_BY_NAME
	End Get
	Set (ByVal Value As String)
		strUPDATE_BY_NAME = Value
	End Set
	End Property

	Public Property UPDATE_DATE As Date
	Get
		Return dtUPDATE_DATE
	End Get
	Set (ByVal Value As Date)
		dtUPDATE_DATE = Value
	End Set
	End Property

	Public Property BUSI_TYPE_CIM As String
	Get
		Return strBUSI_TYPE_CIM
	End Get
	Set (ByVal Value As String)
		strBUSI_TYPE_CIM = Value
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

	Public Property OFFICR_ID As String
	Get
		Return strOFFICR_ID
	End Get
	Set (ByVal Value As String)
		strOFFICR_ID = Value
	End Set
	End Property

	Public Property OFFICR_NAME As String
	Get
		Return strOFFICR_NAME
	End Get
	Set (ByVal Value As String)
		strOFFICR_NAME = Value
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

	Public Property CONTROLLING_UNIT_E As String
	Get
		Return strCONTROLLING_UNIT_E
	End Get
	Set (ByVal Value As String)
		strCONTROLLING_UNIT_E = Value
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

	Public Property BUSINESS_DESTINATION_ID As Decimal
	Get
		Return decBUSINESS_DESTINATION_ID
	End Get
	Set (ByVal Value As Decimal)
		decBUSINESS_DESTINATION_ID = Value
	End Set
	End Property

	Public Property BUSINESS_DESTINATION_DESC As String
	Get
		Return strBUSINESS_DESTINATION_DESC
	End Get
	Set (ByVal Value As String)
		strBUSINESS_DESTINATION_DESC = Value
	End Set
	End Property

	Public Property EXPORT_WEIGHT As Decimal
	Get
		Return decEXPORT_WEIGHT
	End Get
	Set (ByVal Value As Decimal)
		decEXPORT_WEIGHT = Value
	End Set
	End Property

	Public Property LOCAL_WEIGHT As Decimal
	Get
		Return decLOCAL_WEIGHT
	End Get
	Set (ByVal Value As Decimal)
		decLOCAL_WEIGHT = Value
	End Set
	End Property

	Public Property STATUS_ID As Integer
	Get
		Return intSTATUS_ID
	End Get
	Set (ByVal Value As Integer)
		intSTATUS_ID = Value
	End Set
	End Property

	Public Property STATUS_DETAIL As String
	Get
		Return strSTATUS_DETAIL
	End Get
	Set (ByVal Value As String)
		strSTATUS_DETAIL = Value
	End Set
	End Property

	Public Property SIZE_ID As Integer
	Get
		Return intSIZE_ID
	End Get
	Set (ByVal Value As Integer)
		intSIZE_ID = Value
	End Set
	End Property

	Public Property SIZE_DETAIL As String
	Get
		Return strSIZE_DETAIL
	End Get
	Set (ByVal Value As String)
		strSIZE_DETAIL = Value
	End Set
	End Property

	Public Property RATING_TYPE_KEY As Integer
	Get
		Return intRATING_TYPE_KEY
	End Get
	Set (ByVal Value As Integer)
		intRATING_TYPE_KEY = Value
	End Set
	End Property

	Public Property RATING_KEY As Integer
	Get
		Return intRATING_KEY
	End Get
	Set (ByVal Value As Integer)
		intRATING_KEY = Value
	End Set
	End Property

	Public Property RATING_UPDATE_DATE As Date
	Get
		Return dtRATING_UPDATE_DATE
	End Get
	Set (ByVal Value As Date)
		dtRATING_UPDATE_DATE = Value
	End Set
	End Property

	Public Property OLD_REGION_ID As String
	Get
		Return strOLD_REGION_ID
	End Get
	Set (ByVal Value As String)
		strOLD_REGION_ID = Value
	End Set
	End Property

	Public Property OLD_REGION_NAME As String
	Get
		Return strOLD_REGION_NAME
	End Get
	Set (ByVal Value As String)
		strOLD_REGION_NAME = Value
	End Set
	End Property

	Public Sub Print()
		Debug.print("")
		Debug.Print("CIF : " & CIF)
		Debug.Print("CUSTOMER_NAME : " & CUSTOMER_NAME)
		Debug.Print("CUSTOMER_NAME2 : " & CUSTOMER_NAME2)
		Debug.Print("CUSTOMER_NAME_E : " & CUSTOMER_NAME_E)
		Debug.Print("CUSTOMER_NAME_E2 : " & CUSTOMER_NAME_E2)
		Debug.Print("GROUP_ID : " & GROUP_ID)
		Debug.Print("CM_CODE : " & CM_CODE)
		Debug.Print("CM_NAME : " & CM_NAME)
		Debug.Print("CM_NAME_E : " & CM_NAME_E)
		Debug.Print("OLD_CM_CODE : " & OLD_CM_CODE)
		Debug.Print("OLD_CM_NAME : " & OLD_CM_NAME)
		Debug.Print("OLD_CM_NAME_E : " & OLD_CM_NAME_E)
		Debug.Print("BRANCH_ID : " & BRANCH_ID)
		Debug.Print("BRANCH_NAME : " & BRANCH_NAME)
		Debug.Print("Id_Region : " & Id_Region)
		Debug.Print("Region_Name : " & Region_Name)
		Debug.Print("REGION_NAME2 : " & REGION_NAME2)
		Debug.Print("GROUP_SIZE_ID : " & GROUP_SIZE_ID)
		Debug.Print("GROUP_SIZE_DETAIL : " & GROUP_SIZE_DETAIL)
		Debug.Print("GROUP_EXPOSURE : " & GROUP_EXPOSURE)
		Debug.Print("NEXT_REVIEW_DATE : " & NEXT_REVIEW_DATE)
		Debug.Print("JUDGEMENT_ID : " & JUDGEMENT_ID)
		Debug.Print("JUDGEMENT_DETAIL : " & JUDGEMENT_DETAIL)
		Debug.Print("BUSI_RISK1_ID : " & BUSI_RISK1_ID)
		Debug.Print("BUSI_RISK1_DETAIL : " & BUSI_RISK1_DETAIL)
		Debug.Print("BUSI_RISK2_ID : " & BUSI_RISK2_ID)
		Debug.Print("BUSI_RISK2_DETAIL : " & BUSI_RISK2_DETAIL)
		Debug.Print("BUSI_RISK3_ID : " & BUSI_RISK3_ID)
		Debug.Print("BUSI_RISK3_DETAIL : " & BUSI_RISK3_DETAIL)
		Debug.Print("UPDATE_BY : " & UPDATE_BY)
		Debug.Print("UPDATE_BY_NAME : " & UPDATE_BY_NAME)
		Debug.Print("UPDATE_DATE : " & UPDATE_DATE)
		Debug.Print("BUSI_TYPE_CIM : " & BUSI_TYPE_CIM)
		Debug.Print("DEPTFLAG : " & DEPTFLAG)
		Debug.Print("DEPTTRAN : " & DEPTTRAN)
		Debug.Print("OFFICR_ID : " & OFFICR_ID)
		Debug.Print("OFFICR_NAME : " & OFFICR_NAME)
		Debug.Print("CONTROLLING_UNIT : " & CONTROLLING_UNIT)
		Debug.Print("CONTROLLING_UNIT_E : " & CONTROLLING_UNIT_E)
		Debug.Print("REGION_CONTROLLING_UNIT : " & REGION_CONTROLLING_UNIT)
		Debug.Print("BUSINESS_DESTINATION_ID : " & BUSINESS_DESTINATION_ID)
		Debug.Print("BUSINESS_DESTINATION_DESC : " & BUSINESS_DESTINATION_DESC)
		Debug.Print("EXPORT_WEIGHT : " & EXPORT_WEIGHT)
		Debug.Print("LOCAL_WEIGHT : " & LOCAL_WEIGHT)
		Debug.Print("STATUS_ID : " & STATUS_ID)
		Debug.Print("STATUS_DETAIL : " & STATUS_DETAIL)
		Debug.Print("SIZE_ID : " & SIZE_ID)
		Debug.Print("SIZE_DETAIL : " & SIZE_DETAIL)
		Debug.Print("RATING_TYPE_KEY : " & RATING_TYPE_KEY)
		Debug.Print("RATING_KEY : " & RATING_KEY)
		Debug.Print("RATING_UPDATE_DATE : " & RATING_UPDATE_DATE)
		Debug.Print("OLD_REGION_ID : " & OLD_REGION_ID)
		Debug.Print("OLD_REGION_NAME : " & OLD_REGION_NAME)
	End Sub

End Class
