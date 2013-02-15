Option Explicit On
Option Strict On

Imports Microsoft.VisualBasic
Imports System.Diagnostics

Public Class CusOfficeDep

	Private Const CLSNAME As String = "Class CusOfficeDep"

	Private intCif As Integer
	Private strName As String
	Private strGECustSize As String
	Private strClassE As String
    Private strClassT As String
	Private dblPrincipal As Double
	Private strOname As String
	Private strDepTranT As String
	Private strRISK_ID As String

	Public Property Cif As Integer
	Get
		Return intCif
	End Get
	Set (ByVal Value As Integer)
		intCif = Value
	End Set
	End Property

	Public Property Name As String
	Get
		Return strName
	End Get
	Set (ByVal Value As String)
		strName = Value
	End Set
	End Property

	Public Property GECustSize As String
	Get
		Return strGECustSize
	End Get
	Set (ByVal Value As String)
		strGECustSize = Value
	End Set
	End Property

	Public Property ClassE As String
	Get
		Return strClassE
	End Get
	Set (ByVal Value As String)
		strClassE = Value
	End Set
	End Property

    Public Property ClassT() As String
        Get
            Return strClassT
        End Get
        Set(ByVal Value As String)
            strClassT = Value
        End Set
    End Property

	Public Property Principal As Double
	Get
		Return dblPrincipal
	End Get
	Set (ByVal Value As Double)
		dblPrincipal = Value
	End Set
	End Property

	Public Property Oname As String
	Get
		Return strOname
	End Get
	Set (ByVal Value As String)
		strOname = Value
	End Set
	End Property

	Public Property DepTranT As String
	Get
		Return strDepTranT
	End Get
	Set (ByVal Value As String)
		strDepTranT = Value
	End Set
	End Property

	Public Property RISK_ID As String
	Get
		Return strRISK_ID
	End Get
	Set (ByVal Value As String)
		strRISK_ID = Value
	End Set
	End Property

	Public Sub Print()
		Debug.print("")
		Debug.Print("Cif : " & Cif)
		Debug.Print("Name : " & Name)
		Debug.Print("GECustSize : " & GECustSize)
		Debug.Print("ClassE : " & ClassE)
        Debug.Print("ClassT : " & ClassT)
		Debug.Print("Principal : " & Principal)
		Debug.Print("Oname : " & Oname)
		Debug.Print("DepTranT : " & DepTranT)
		Debug.Print("RISK_ID : " & RISK_ID)
	End Sub

End Class
