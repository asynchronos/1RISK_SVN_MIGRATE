Option Explicit On
Option Strict On

Imports Microsoft.VisualBasic
Imports System.Diagnostics

Public Class AuthenRoles

	Private Const CLSNAME As String = "Class AuthenRoles"

	Private strRoleId As String
	Private strRoleName As String
	Private strDescription As String
	Private strAppId As String

	Public Property RoleId As String
	Get
		Return strRoleId
	End Get
	Set (ByVal Value As String)
		strRoleId = Value
	End Set
	End Property

	Public Property RoleName As String
	Get
		Return strRoleName
	End Get
	Set (ByVal Value As String)
		strRoleName = Value
	End Set
	End Property

	Public Property Description As String
	Get
		Return strDescription
	End Get
	Set (ByVal Value As String)
		strDescription = Value
	End Set
	End Property

	Public Property AppId As String
	Get
		Return strAppId
	End Get
	Set (ByVal Value As String)
		strAppId = Value
	End Set
	End Property

	Public Sub Print()
		Debug.print("")
		Debug.Print("RoleId : " & RoleId)
		Debug.Print("RoleName : " & RoleName)
		Debug.Print("Description : " & Description)
		Debug.Print("AppId : " & AppId)
	End Sub

End Class
