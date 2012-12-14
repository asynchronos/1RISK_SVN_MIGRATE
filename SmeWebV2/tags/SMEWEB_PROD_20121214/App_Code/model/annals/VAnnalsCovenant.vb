Option Explicit On
Option Strict On

Imports Microsoft.VisualBasic
Imports System.Diagnostics

Public Class VAnnalsCovenant

	Private Const CLSNAME As String = "Class VAnnalsCovenant"

	Private intIDEN As Integer
	Private intCIF As Integer
	Private strCifname As String
    Private intCOVENANT_TYPE_ID As String
	Private strCOVENANT_TYPE As String
	Private strDETAIL As String
	Private dtCREATE_DATE As Date
    Private dtDEADLINE_DATE As String
    Private strCOVENANT_ACTION_ID As String  '   กำหนดให้เป็น string เนื่องจากยังหาวิธีใส่ค่า null ใน type date ไม่ได้ และใช้วิธีส่งค่า null ไปใน database
	Private strCOVENANT_ACTION As String
	Private strREMARK As String
    Private dtACTION_DATE As String   '   กำหนดให้เป็น string เนื่องจากยังหาวิธีใส่ค่า null ใน type date ไม่ได้ และใช้วิธีส่งค่า null ไปใน database
	Private strUSER_ID As String
	Private dtUSER_UPDATE_DATE As Date
	Private strEMP_NAME As String
    Private strID As String
    Private intGROUP_ID As Integer
    Private strNEXT_COVENANT_ACTION_ID As String  '   กำหนดให้เป็น string เนื่องจากยังหาวิธีใส่ค่า null ใน type date ไม่ได้ และใช้วิธีส่งค่า null ไปใน database
    Private strNEXT_COVENANT_ACTION As String
    Private dtNEXT_ACTION_DATE As String   '   กำหนดให้เป็น string เนื่องจากยังหาวิธีใส่ค่า null ใน type date ไม่ได้ และใช้วิธีส่งค่า null ไปใน database
    Private dtBREACH_DATE As String
    Private strWAVE_FLAG As String
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

	Public Property Cifname As String
	Get
		Return strCifname
	End Get
	Set (ByVal Value As String)
		strCifname = Value
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

	Public Property COVENANT_TYPE As String
	Get
		Return strCOVENANT_TYPE
	End Get
	Set (ByVal Value As String)
		strCOVENANT_TYPE = Value
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

	Public Property COVENANT_ACTION As String
	Get
		Return strCOVENANT_ACTION
	End Get
	Set (ByVal Value As String)
		strCOVENANT_ACTION = Value
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

    Public Property NEXT_COVENANT_ACTION As String
        Get
            Return strNEXT_COVENANT_ACTION
        End Get
        Set(ByVal Value As String)
            strNEXT_COVENANT_ACTION = Value
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
    Public Property BREACH_DATE() As String
        Get
            Return dtBREACH_DATE
        End Get
        Set(ByVal Value As String)
            dtBREACH_DATE = Value
        End Set
    End Property
    Public Property WAVE_FLAG As String
        Get
            Return strWAVE_FLAG
        End Get
        Set(ByVal Value As String)
            strWAVE_FLAG = Value
        End Set
    End Property
    Public Property WAVE_DATE() As String
        Get
            Return dtWAVE_DATE
        End Get
        Set(ByVal Value As String)
            dtWAVE_DATE = Value
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

	Public Property EMP_NAME As String
	Get
		Return strEMP_NAME
	End Get
	Set (ByVal Value As String)
		strEMP_NAME = Value
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

    Public Property GROUP_ID() As Integer
        Get
            Return intGROUP_ID
        End Get
        Set(ByVal value As Integer)
            intGROUP_ID = value
        End Set
    End Property


End Class
