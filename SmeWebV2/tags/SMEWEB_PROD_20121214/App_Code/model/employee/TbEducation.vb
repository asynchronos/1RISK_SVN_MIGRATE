Option Explicit On
Option Strict On

Imports Microsoft.VisualBasic
Imports System.Diagnostics

Public Class TbEducation

	Private Const CLSNAME As String = "Class TbEducation"

	Private intID As Integer
	Private strEMP_ID As String
	Private intDEGREE_CODE As Integer
	Private strU_NAME As String
	Private strMAJOR As String
	Private dtDATEOFGRADUAT As Date
	Private dtUP_DT As Date
    Private strDELE As String
    Private strDEGREE_NAME As String

	Public Property ID As Integer
	Get
		Return intID
	End Get
	Set (ByVal Value As Integer)
		intID = Value
	End Set
	End Property

	Public Property EMP_ID As String
	Get
		Return strEMP_ID
	End Get
	Set (ByVal Value As String)
		strEMP_ID = Value
	End Set
	End Property

	Public Property DEGREE_CODE As Integer
	Get
		Return intDEGREE_CODE
	End Get
	Set (ByVal Value As Integer)
		intDEGREE_CODE = Value
	End Set
	End Property

    Public Property DEGREE_NAME() As String
        Get
            Return strDEGREE_NAME
        End Get
        Set(ByVal Value As String)
            strDEGREE_NAME = Value
        End Set
    End Property
    Public Property U_NAME() As String
        Get
            Return strU_NAME
        End Get
        Set(ByVal Value As String)
            strU_NAME = Value
        End Set
    End Property

	Public Property MAJOR As String
	Get
		Return strMAJOR
	End Get
	Set (ByVal Value As String)
		strMAJOR = Value
	End Set
	End Property

	Public Property DATEOFGRADUAT As Date
	Get
		Return dtDATEOFGRADUAT
	End Get
	Set (ByVal Value As Date)
		dtDATEOFGRADUAT = Value
	End Set
	End Property

	Public Property UP_DT As Date
	Get
		Return dtUP_DT
	End Get
	Set (ByVal Value As Date)
		dtUP_DT = Value
	End Set
	End Property

	Public Property DELE As String
	Get
		Return strDELE
	End Get
	Set (ByVal Value As String)
		strDELE = Value
	End Set
	End Property

	Public Sub Print()
		Debug.print("")
		Debug.Print("ID : " & ID)
		Debug.Print("EMP_ID : " & EMP_ID)
		Debug.Print("DEGREE_CODE : " & DEGREE_CODE)
		Debug.Print("U_NAME : " & U_NAME)
		Debug.Print("MAJOR : " & MAJOR)
		Debug.Print("DATEOFGRADUAT : " & DATEOFGRADUAT)
		Debug.Print("UP_DT : " & UP_DT)
        Debug.Print("DELE : " & DELE)
        Debug.Print("DEGREE_NAME : " & DEGREE_NAME)
	End Sub

End Class
