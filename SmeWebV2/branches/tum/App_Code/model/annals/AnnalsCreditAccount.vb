Option Explicit On
Option Strict On

Imports Microsoft.VisualBasic
Imports System.Diagnostics

Public Class AnnalsCreditAccount

	Private Const CLSNAME As String = "Class AnnalsCreditAccount"

	Private strID As String
	Private intCIF As Integer
	Private strACCNO As String
	Private strNBRTHAI As String
	Private strDECB_RD_ID As String
	Private dblSUMLIMIT As Double
	Private dblSUMPRIN As Double
	Private dblSUMACCRU As Double
	Private dblSUMSUSP As Double
	Private dblSUMAGING As Double
    Private strSUBJECT_DETAIL_ID As String

    Private dblValue_Customer As String    ' ใช้เป็น string เพื่อให้สามารถ pass ค่า null ได้
    Private dblVALUE_OLD As String
    Private dblVALUE As String
    Private dblVALUE_APPROVE As String

    Private strOthers As String
    Private strPRODUCT_CODE As String
    Private strPROJECT_CODE As String


	Public Property ID As String
	Get
		Return strID
	End Get
	Set (ByVal Value As String)
		strID = Value
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

	Public Property ACCNO As String
	Get
		Return strACCNO
	End Get
	Set (ByVal Value As String)
		strACCNO = Value
	End Set
	End Property

	Public Property NBRTHAI As String
	Get
		Return strNBRTHAI
	End Get
	Set (ByVal Value As String)
		strNBRTHAI = Value
	End Set
	End Property

	Public Property DECB_RD_ID As String
	Get
		Return strDECB_RD_ID
	End Get
	Set (ByVal Value As String)
		strDECB_RD_ID = Value
	End Set
	End Property

	Public Property SUMLIMIT As Double
	Get
		Return dblSUMLIMIT
	End Get
	Set (ByVal Value As Double)
		dblSUMLIMIT = Value
	End Set
	End Property

	Public Property SUMPRIN As Double
	Get
		Return dblSUMPRIN
	End Get
	Set (ByVal Value As Double)
		dblSUMPRIN = Value
	End Set
	End Property

	Public Property SUMACCRU As Double
	Get
		Return dblSUMACCRU
	End Get
	Set (ByVal Value As Double)
		dblSUMACCRU = Value
	End Set
	End Property

	Public Property SUMSUSP As Double
	Get
		Return dblSUMSUSP
	End Get
	Set (ByVal Value As Double)
		dblSUMSUSP = Value
	End Set
	End Property

	Public Property SUMAGING As Double
	Get
		Return dblSUMAGING
	End Get
	Set (ByVal Value As Double)
		dblSUMAGING = Value
	End Set
	End Property

	Public Property SUBJECT_DETAIL_ID As String
	Get
		Return strSUBJECT_DETAIL_ID
	End Get
	Set (ByVal Value As String)
		strSUBJECT_DETAIL_ID = Value
	End Set
	End Property

    Public Property Value_Customer() As String
        Get
            Return dblValue_Customer
        End Get
        Set(ByVal Value As String)
            dblValue_Customer = Value
        End Set
    End Property

    Public Property VALUE_OLD() As String
        Get
            Return dblVALUE_OLD
        End Get
        Set(ByVal Value As String)
            dblVALUE_OLD = Value
        End Set
    End Property

    Public Property VALUE() As String
        Get
            Return dblVALUE
        End Get
        Set(ByVal Value As String)
            dblVALUE = Value
        End Set
    End Property

    Public Property VALUE_APPROVE() As String
        Get
            Return dblVALUE_APPROVE
        End Get
        Set(ByVal Value As String)
            dblVALUE_APPROVE = Value
        End Set
    End Property

	Public Property Others As String
	Get
		Return strOthers
	End Get
	Set (ByVal Value As String)
		strOthers = Value
	End Set
    End Property
    Public Property PRODUCT_CODE() As String
        Get
            Return strPRODUCT_CODE
        End Get
        Set(ByVal Value As String)
            strPRODUCT_CODE = Value
        End Set
    End Property
    Public Property PROJECT_CODE() As String
        Get
            Return strPROJECT_CODE
        End Get
        Set(ByVal Value As String)
            strPROJECT_CODE = Value
        End Set
    End Property

	Public Sub Print()
		Debug.print("")
		Debug.Print("ID : " & ID)
		Debug.Print("CIF : " & CIF)
		Debug.Print("ACCNO : " & ACCNO)
		Debug.Print("NBRTHAI : " & NBRTHAI)
		Debug.Print("DECB_RD_ID : " & DECB_RD_ID)
		Debug.Print("SUMLIMIT : " & SUMLIMIT)
		Debug.Print("SUMPRIN : " & SUMPRIN)
		Debug.Print("SUMACCRU : " & SUMACCRU)
		Debug.Print("SUMSUSP : " & SUMSUSP)
		Debug.Print("SUMAGING : " & SUMAGING)
		Debug.Print("SUBJECT_DETAIL_ID : " & SUBJECT_DETAIL_ID)
		Debug.Print("Value_Customer : " & Value_Customer)
		Debug.Print("VALUE_OLD : " & VALUE_OLD)
		Debug.Print("VALUE : " & VALUE)
		Debug.Print("VALUE_APPROVE : " & VALUE_APPROVE)
        Debug.Print("Others : " & Others)
        Debug.Print("PRODUCT_CODE : " & PRODUCT_CODE)
        Debug.Print("PROJECT_CODE : " & PROJECT_CODE)


	End Sub

End Class
