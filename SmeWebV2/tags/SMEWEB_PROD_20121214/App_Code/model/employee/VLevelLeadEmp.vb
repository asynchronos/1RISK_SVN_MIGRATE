Option Explicit On
Option Strict On

Imports Microsoft.VisualBasic
Imports System.Diagnostics

Public Class VLevelLeadEmp

	Private Const CLSNAME As String = "Class VLevelLeadEmp"

    Private intLevel_id As String
    Private intLevel_Root As String
	Private strLevel_Name As String
	Private strLevel_Code As String
	Private strEMP_ID As String
    Private strTITLE_NAME As String
    Private intTITLE_CODE As Integer
    Private strEMPNAME As String
	Private strEMPSURNAME As String

    Public Property Level_id() As String
        Get
            Return intLevel_id
        End Get
        Set(ByVal Value As String)
            intLevel_id = Value
        End Set
    End Property

    Public Property Level_Root() As String
        Get
            Return intLevel_Root
        End Get
        Set(ByVal Value As String)
            intLevel_Root = Value
        End Set
    End Property

	Public Property Level_Name As String
	Get
		Return strLevel_Name
	End Get
	Set (ByVal Value As String)
		strLevel_Name = Value
	End Set
	End Property

	Public Property Level_Code As String
	Get
		Return strLevel_Code
	End Get
	Set (ByVal Value As String)
		strLevel_Code = Value
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

	Public Property EMPNAME As String
	Get
		Return strEMPNAME
	End Get
	Set (ByVal Value As String)
		strEMPNAME = Value
	End Set
	End Property

	Public Property EMPSURNAME As String
	Get
		Return strEMPSURNAME
	End Get
	Set (ByVal Value As String)
		strEMPSURNAME = Value
	End Set
	End Property

    Public Property TITLE_NAME() As String
        Get
            Return strTITLE_NAME
        End Get
        Set(ByVal Value As String)
            strTITLE_NAME = Value
        End Set
    End Property

    Public Property TITLE_CODE() As Integer
        Get
            Return intTITLE_CODE
        End Get
        Set(ByVal Value As Integer)
            intTITLE_CODE = Value
        End Set
    End Property

    Public Sub Print()
        Debug.print("")
        Debug.Print("Level_id : " & Level_id)
        Debug.Print("Level_Root : " & Level_Root)
        Debug.Print("Level_Name : " & Level_Name)
        Debug.Print("Level_Code : " & Level_Code)
        Debug.Print("EMP_ID : " & EMP_ID)
        Debug.Print("EMPNAME : " & EMPNAME)
        Debug.Print("EMPSURNAME : " & EMPSURNAME)
        Debug.Print("TITLE_NAME : " & TITLE_NAME)
        Debug.Print("TITLE_CODE : " & TITLE_CODE)
    End Sub

End Class
