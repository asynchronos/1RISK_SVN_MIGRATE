Option Explicit On
Option Strict On

Imports Microsoft.VisualBasic
Imports System.Diagnostics

Public Class AnnalsProposal

	Private Const CLSNAME As String = "Class AnnalsProposal"

	Private strPROPOSAL_ID As String
	Private strPROPOSAL_NAME As String
	Private intPRIORITY As Integer
	Private intSTATUS As Integer

	Public Property PROPOSAL_ID As String
	Get
		Return strPROPOSAL_ID
	End Get
	Set (ByVal Value As String)
		strPROPOSAL_ID = Value
	End Set
	End Property

	Public Property PROPOSAL_NAME As String
	Get
		Return strPROPOSAL_NAME
	End Get
	Set (ByVal Value As String)
		strPROPOSAL_NAME = Value
	End Set
	End Property

	Public Property PRIORITY As Integer
	Get
		Return intPRIORITY
	End Get
	Set (ByVal Value As Integer)
		intPRIORITY = Value
	End Set
	End Property

	Public Property STATUS As Integer
	Get
		Return intSTATUS
	End Get
	Set (ByVal Value As Integer)
		intSTATUS = Value
	End Set
	End Property

	Public Sub Print()
		Debug.print("")
		Debug.Print("PROPOSAL_ID : " & PROPOSAL_ID)
		Debug.Print("PROPOSAL_NAME : " & PROPOSAL_NAME)
		Debug.Print("PRIORITY : " & PRIORITY)
		Debug.Print("STATUS : " & STATUS)
	End Sub

End Class
