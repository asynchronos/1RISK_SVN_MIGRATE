Option Explicit On
Option Strict On

Imports Microsoft.VisualBasic
Imports System.Diagnostics

Public Class AnnalsCovenant

	Private Const CLSNAME As String = "Class AnnalsCovenant"

	Private intIDEN As Integer
	Private intCIF As Integer
    Private intCOVENANT_TYPE_ID As String
	Private strDETAIL As String
	Private dtCREATE_DATE As Date
    Private dtDEADLINE_DATE As String   '   กำหนดให้เป็น string เนื่องจากยังหาวิธีใส่ค่า null ใน type date ไม่ได้ และใช้วิธีส่งค่า string null แทน
	Private strCOVENANT_ACTION_ID As String
	Private strREMARK As String
    Private dtACTION_DATE As String   '   กำหนดให้เป็น string เนื่องจากยังหาวิธีใส่ค่า null ใน type date ไม่ได้ และใช้วิธีส่งค่า string null แทน
    Private strUSER_ID As String
	Private dtUSER_UPDATE_DATE As Date
    Private strID As String
    Private strCOVENANT_DETAIL_ID As String
    Private dtNEXT_ACTION_DATE As String   '   กำหนดให้เป็น string เนื่องจากยังหาวิธีใส่ค่า null ใน type date ไม่ได้ และใช้วิธีส่งค่า string null แทน
    Private strNEXT_COVENANT_ACTION_ID As String

    Private dtBREACH_DATE As String
    Private intWAVE_FLAG As String
    Private dtWAVE_DATE As String




	Public Property IDEN As Integer
	Get
		Return intIDEN
	End Get
	Set (ByVal Value As Integer)
		intIDEN = Value
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

    Public Property COVENANT_TYPE_ID() As String
        Get
            Return intCOVENANT_TYPE_ID
        End Get
        Set(ByVal Value As String)
            intCOVENANT_TYPE_ID = Value
        End Set
    End Property

	Public Property DETAIL As String
	Get
		Return strDETAIL
	End Get
	Set (ByVal Value As String)
		strDETAIL = Value
	End Set
	End Property

	Public Property CREATE_DATE As Date
	Get
		Return dtCREATE_DATE
	End Get
	Set (ByVal Value As Date)
		dtCREATE_DATE = Value
	End Set
	End Property

    Public Property DEADLINE_DATE() As String
        Get
            Return dtDEADLINE_DATE
        End Get
        Set(ByVal Value As String)
            dtDEADLINE_DATE = Value
        End Set
    End Property

	Public Property COVENANT_ACTION_ID As String
	Get
		Return strCOVENANT_ACTION_ID
	End Get
	Set (ByVal Value As String)
		strCOVENANT_ACTION_ID = Value
	End Set
	End Property
    Public Property NEXT_COVENANT_ACTION_ID As String
        Get
            Return strNEXT_COVENANT_ACTION_ID
        End Get
        Set(ByVal Value As String)
            strNEXT_COVENANT_ACTION_ID = Value
        End Set
    End Property
	Public Property REMARK As String
	Get
		Return strREMARK
	End Get
	Set (ByVal Value As String)
		strREMARK = Value
	End Set
	End Property

    Public Property ACTION_DATE() As String
        Get
            Return dtACTION_DATE
        End Get
        Set(ByVal Value As String)
            dtACTION_DATE = Value
        End Set
    End Property
    Public Property NEXT_ACTION_DATE() As String
        Get
            Return dtNEXT_ACTION_DATE
        End Get
        Set(ByVal Value As String)
            dtNEXT_ACTION_DATE = Value
        End Set
    End Property

	Public Property USER_ID As String
	Get
		Return strUSER_ID
	End Get
	Set (ByVal Value As String)
		strUSER_ID = Value
	End Set
	End Property

	Public Property USER_UPDATE_DATE As Date
	Get
		Return dtUSER_UPDATE_DATE
	End Get
	Set (ByVal Value As Date)
		dtUSER_UPDATE_DATE = Value
	End Set
	End Property

    Public Property ID() As String
        Get
            Return strID
        End Get
        Set(ByVal Value As String)
            strID = Value
        End Set
    End Property
    Public Property COVENANT_DETAIL_ID() As String
        Get
            Return strCOVENANT_DETAIL_ID
        End Get
        Set(ByVal Value As String)
            strCOVENANT_DETAIL_ID = Value
        End Set
    End Property

    Public Property BREACH_DATE As String
        Get
            Return dtBREACH_DATE
        End Get
        Set(ByVal Value As String)
            dtBREACH_DATE = Value
        End Set
    End Property
    Public Property WAVE_FLAG As String
        Get
            Return intWAVE_FLAG
        End Get
        Set(ByVal Value As String)
            intWAVE_FLAG = Value
        End Set
    End Property

    Public Property WAVE_DATE As String
        Get
            Return dtWAVE_DATE
        End Get
        Set(ByVal Value As String)
            dtWAVE_DATE = Value
        End Set
    End Property

    Public Sub Print()
        Debug.Print("")
        Debug.Print("IDEN : " & IDEN)
        Debug.Print("CIF : " & CIF)
        Debug.Print("COVENANT_TYPE_ID : " & COVENANT_TYPE_ID)
        Debug.Print("DETAIL : " & DETAIL)
        Debug.Print("CREATE_DATE : " & CREATE_DATE)
        Debug.Print("DEADLINE_DATE : " & DEADLINE_DATE)
        Debug.Print("COVENANT_ACTION_ID : " & COVENANT_ACTION_ID)
        Debug.Print("REMARK : " & REMARK)
        Debug.Print("ACTION_DATE : " & ACTION_DATE)
        Debug.Print("USER_ID : " & USER_ID)
        Debug.Print("USER_UPDATE_DATE : " & USER_UPDATE_DATE)
        Debug.Print("ID : " & ID)
        Debug.Print("COVENANT_DETAIL_ID :" & COVENANT_DETAIL_ID)
    End Sub

End Class
