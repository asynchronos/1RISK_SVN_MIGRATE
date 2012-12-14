Option Explicit On
Option Strict On

Imports Microsoft.VisualBasic
Imports System.Diagnostics

Public Class AuthenUsersinroles

	Private Const CLSNAME As String = "Class AuthenUsersinroles"

	Private strUserId As String
	Private strRoleId As String

	Public Property UserId As String
	Get
		Return strUserId
	End Get
	Set (ByVal Value As String)
		strUserId = Value
	End Set
	End Property

	Public Property RoleId As String
	Get
		Return strRoleId
	End Get
	Set (ByVal Value As String)
		strRoleId = Value
	End Set
	End Property

	Public Sub Print()
		Debug.print("")
		Debug.Print("UserId : " & UserId)
		Debug.Print("RoleId : " & RoleId)
	End Sub

End Class
