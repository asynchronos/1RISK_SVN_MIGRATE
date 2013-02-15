Option Explicit On
Option Strict On

Imports Microsoft.VisualBasic
Imports System.Diagnostics

Public Class Branch_Region

	Private Const CLSNAME As String = "Class Branch_Region"

	Private intId_Branch As Integer
	Private strBranch_T As String
	Private strBranch_E As String
    Private intId_Region As Integer
    Private strRegion_Name As String
    Private strRegion_EName As String


	Public Property Id_Branch As Integer
	Get
		Return intId_Branch
	End Get
	Set (ByVal Value As Integer)
		intId_Branch = Value
	End Set
	End Property

	Public Property Branch_T As String
	Get
		Return strBranch_T
	End Get
	Set (ByVal Value As String)
		strBranch_T = Value
	End Set
	End Property

	Public Property Branch_E As String
	Get
		Return strBranch_E
	End Get
	Set (ByVal Value As String)
		strBranch_E = Value
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

    Public Property Region_Name() As String
        Get
            Return strRegion_Name
        End Get
        Set(ByVal Value As String)
            strRegion_Name = Value
        End Set
    End Property

    Public Property Region_EName() As String
        Get
            Return strRegion_EName
        End Get
        Set(ByVal Value As String)
            strRegion_EName = Value
        End Set
    End Property

    Public Sub Print()

        Debug.Print("")
        Debug.Print("Id_Branch : " & Id_Branch)
        Debug.Print("Branch_T : " & Branch_T)
        Debug.Print("Branch_E : " & Branch_E)
        Debug.Print("Id_Region : " & Id_Region)
        Debug.Print("ADDRESS : " & Region_Name)
        Debug.Print("ZIPCODE : " & Region_EName)

    End Sub

End Class
