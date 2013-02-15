Option Explicit On
Option Strict On

Imports Microsoft.VisualBasic
Imports System.Diagnostics

Public Class TbLead

	Private Const CLSNAME As String = "Class TbLead"

	Private intLevel_id As Integer
    Private strEmp_id As String



	Public Property Level_id As Integer
	Get
		Return intLevel_id
	End Get
	Set (ByVal Value As Integer)
		intLevel_id = Value
	End Set
	End Property

	Public Property Emp_id As String
	Get
		Return strEmp_id
	End Get
	Set (ByVal Value As String)
		strEmp_id = Value
	End Set
    End Property

	Public Sub Print()
		Debug.print("")
		Debug.Print("Level_id : " & Level_id)
        Debug.Print("Emp_id : " & Emp_id)

    End Sub

End Class
