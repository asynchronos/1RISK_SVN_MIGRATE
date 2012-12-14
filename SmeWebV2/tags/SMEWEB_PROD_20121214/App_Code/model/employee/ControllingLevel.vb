Option Explicit On
Option Strict On

Imports Microsoft.VisualBasic
Imports System.Diagnostics

Public Class ControllingLevel

	Private Const CLSNAME As String = "Class ControllingLevel"

#Region "Member Variable"
	Private strLEVEL_ID As String
	Private strLEVEL_CODE As String
	Private strLEVEL_NAME As String
	Private strLEVEL_ROOT As String
#End Region

    Public Sub New()
        MyBase.New()
    End Sub

    Public Sub New(ByVal level As ControllingLevel)
        Me.New(level.LEVEL_ID, level.LEVEL_CODE, level.LEVEL_NAME, level.LEVEL_ROOT)
    End Sub

    Public Sub New(ByVal strLEVEL_ID As String, ByVal strLEVEL_CODE As String, ByVal strLEVEL_NAME As String, ByVal strLEVEL_ROOT As String)
        Me.New()
        LEVEL_ID = strLEVEL_ID
        LEVEL_CODE = strLEVEL_CODE
        LEVEL_NAME = strLEVEL_NAME
        LEVEL_ROOT = strLEVEL_ROOT
    End Sub

    ''' <summary>
    ''' ใช้แปลงจาก dataTable มาเป็น data model
    ''' </summary>
    ''' <param name="levelLineTable">Data.DataTable</param>
    ''' <returns>Collections.Generic.List(Of ControllingLevel)</returns>
    ''' <remarks></remarks>
    Public Shared Function getControllingLevelList(ByVal levelLineTable As Data.DataTable) As Collections.Generic.List(Of ControllingLevel)
        Dim result As Collections.Generic.List(Of ControllingLevel) = New Collections.Generic.List(Of ControllingLevel)

        Dim levelId As String = Nothing
        Dim levelCode As String = Nothing
        Dim levelName As String = Nothing
        Dim levelRoot As String = Nothing

        For i As Integer = 0 To levelLineTable.Rows.Count - 1
            levelId = levelLineTable.Rows(i).Item("LEVEL_ID").ToString
            levelCode = levelLineTable.Rows(i).Item("LEVEL_CODE").ToString
            levelName = levelLineTable.Rows(i).Item("LEVEL_NAME").ToString
            levelRoot = levelLineTable.Rows(i).Item("LEVEL_ROOT").ToString

            result.Add(New ControllingLevel(levelId, levelCode, levelName, levelRoot))
        Next

        Return result
    End Function

#Region "Properties"

	Public Property LEVEL_ID As String
	Get
		Return strLEVEL_ID
	End Get
	Set (ByVal Value As String)
		strLEVEL_ID = Value
	End Set
	End Property

	Public Property LEVEL_CODE As String
	Get
		Return strLEVEL_CODE
	End Get
	Set (ByVal Value As String)
		strLEVEL_CODE = Value
	End Set
	End Property

	Public Property LEVEL_NAME As String
	Get
		Return strLEVEL_NAME
	End Get
	Set (ByVal Value As String)
		strLEVEL_NAME = Value
	End Set
	End Property

	Public Property LEVEL_ROOT As String
	Get
		Return strLEVEL_ROOT
	End Get
	Set (ByVal Value As String)
		strLEVEL_ROOT = Value
	End Set
	End Property

#End Region

#Region "Print"
	Public Sub Print()
		Debug.print("")
		Debug.Print("LEVEL_ID : " & LEVEL_ID)
		Debug.Print("LEVEL_CODE : " & LEVEL_CODE)
		Debug.Print("LEVEL_NAME : " & LEVEL_NAME)
		Debug.Print("LEVEL_ROOT : " & LEVEL_ROOT)
	End Sub

#End Region
End Class
