Option Explicit On
Option Strict On

Imports Microsoft.VisualBasic
Imports System.Diagnostics

Public Class CustomerInfo

	Private Const CLSNAME As String = "Class CustomerInfo"

	Private intCIF As Integer
	Private strCifname As String
	Private strCifType As String
	Private intBOTID As Integer
	Private strCUS_TYPE As String
	Private strBUSI_TYPE As String
	Private strBusi_name As String
    Private strCLASS As String
	Private strIDCARD As String
	Private sinOFFICR_ID As Single
	Private intDEPTFLAG As Integer
	Private intDEPTTRAN As Integer
	Private strDepartName As String
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

	Public Property Cifname As String
	Get
		Return strCifname
	End Get
	Set (ByVal Value As String)
		strCifname = Value
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

	Public Property CUS_TYPE As String
	Get
		Return strCUS_TYPE
	End Get
	Set (ByVal Value As String)
		strCUS_TYPE = Value
	End Set
	End Property

	Public Property BUSI_TYPE As String
	Get
		Return strBUSI_TYPE
	End Get
	Set (ByVal Value As String)
		strBUSI_TYPE = Value
	End Set
	End Property

	Public Property Busi_name As String
	Get
		Return strBusi_name
	End Get
	Set (ByVal Value As String)
		strBusi_name = Value
	End Set
	End Property

    Public Property CCLASS() As String  '  class §” ß«π
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

	Public Property DepartName As String
	Get
		Return strDepartName
	End Get
	Set (ByVal Value As String)
		strDepartName = Value
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
		Debug.Print("Cifname : " & Cifname)
		Debug.Print("CifType : " & CifType)
		Debug.Print("BOTID : " & BOTID)
		Debug.Print("CUS_TYPE : " & CUS_TYPE)
		Debug.Print("BUSI_TYPE : " & BUSI_TYPE)
		Debug.Print("Busi_name : " & Busi_name)
        Debug.Print("CCLASS : " & CCLASS)
		Debug.Print("IDCARD : " & IDCARD)
		Debug.Print("OFFICR_ID : " & OFFICR_ID)
		Debug.Print("DEPTFLAG : " & DEPTFLAG)
		Debug.Print("DEPTTRAN : " & DEPTTRAN)
		Debug.Print("DepartName : " & DepartName)
		Debug.Print("CARDTYPE : " & CARDTYPE)
		Debug.Print("CARDNO : " & CARDNO)
	End Sub

End Class
