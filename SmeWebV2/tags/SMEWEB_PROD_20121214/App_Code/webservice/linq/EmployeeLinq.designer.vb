﻿'------------------------------------------------------------------------------
' <auto-generated>
'     This code was generated by a tool.
'     Runtime Version:2.0.50727.3053
'
'     Changes to this file may cause incorrect behavior and will be lost if
'     the code is regenerated.
' </auto-generated>
'------------------------------------------------------------------------------

Option Strict On
Option Explicit On

Imports System
Imports System.Collections.Generic
Imports System.ComponentModel
Imports System.Data
Imports System.Data.Linq
Imports System.Data.Linq.Mapping
Imports System.Linq
Imports System.Linq.Expressions
Imports System.Reflection
Imports System.Runtime.Serialization

Namespace webservice.linq
	
    '<System.Data.Linq.Mapping.DatabaseAttribute(Name:="Bay01")> _
    Partial Public Class EmployeeLinqDataContext
        Inherits System.Data.Linq.DataContext

        Private Shared mappingSource As System.Data.Linq.Mapping.MappingSource = New AttributeMappingSource

#Region "Extensibility Method Definitions"
        Partial Private Sub OnCreated()
        End Sub
#End Region

        Public Sub New()
            MyBase.New(Global.System.Configuration.ConfigurationManager.ConnectionStrings("BAY01ConnectionString").ConnectionString, mappingSource)
            OnCreated()
        End Sub

        Public Sub New(ByVal connection As String)
            MyBase.New(connection, mappingSource)
            OnCreated()
        End Sub

        Public Sub New(ByVal connection As System.Data.IDbConnection)
            MyBase.New(connection, mappingSource)
            OnCreated()
        End Sub

        Public Sub New(ByVal connection As String, ByVal mappingSource As System.Data.Linq.Mapping.MappingSource)
            MyBase.New(connection, mappingSource)
            OnCreated()
        End Sub

        Public Sub New(ByVal connection As System.Data.IDbConnection, ByVal mappingSource As System.Data.Linq.Mapping.MappingSource)
            MyBase.New(connection, mappingSource)
            OnCreated()
        End Sub

        Public ReadOnly Property CONTROLLING_LINE_FULLs() As System.Data.Linq.Table(Of CONTROLLING_LINE_FULL)
            Get
                Return Me.GetTable(Of CONTROLLING_LINE_FULL)()
            End Get
        End Property

        <FunctionAttribute(Name:="dbo.EMPLOYEE_Get_Employee_By_EmpId")> _
        Public Function getEmployeeByEmpId(<Parameter(Name:="EMP_ID", DbType:="NVarChar(10)")> ByVal empId As String) As ISingleResult(Of employee.Employee)
            Dim result As IExecuteResult = Me.ExecuteMethodCall(Me, CType(MethodInfo.GetCurrentMethod, MethodInfo), empId)
            Return CType(result.ReturnValue, ISingleResult(Of employee.Employee))
        End Function
    End Class
	
	<Table(Name:="dbo.CONTROLLING_LINE_FULL"),  _
	 DataContract()>  _
	Partial Public Class CONTROLLING_LINE_FULL
		
		Private _LEVEL_ID As String
		
		Private _LEVEL_CODE As String
		
		Private _LEVEL_NAME As String
		
		Private _LEVEL_ROOT As String
		
		Private _EMP_ID As String
		
		Private _TITLE_NAME As String
		
		Private _EMPNAME As String
		
		Private _EMPSURNAME As String
		
		Private _LEAD_ID As String
		
		Private _LEAD_ID2 As String
		
		Public Sub New()
			MyBase.New
		End Sub
		
		<Column(Storage:="_LEVEL_ID", DbType:="NVarChar(5) NOT NULL", CanBeNull:=false),  _
		 DataMember(Order:=1)>  _
		Public Property LEVEL_ID() As String
			Get
				Return Me._LEVEL_ID
			End Get
			Set
				If (String.Equals(Me._LEVEL_ID, value) = false) Then
					Me._LEVEL_ID = value
				End If
			End Set
		End Property
		
		<Column(Storage:="_LEVEL_CODE", DbType:="NVarChar(10)"),  _
		 DataMember(Order:=2)>  _
		Public Property LEVEL_CODE() As String
			Get
				Return Me._LEVEL_CODE
			End Get
			Set
				If (String.Equals(Me._LEVEL_CODE, value) = false) Then
					Me._LEVEL_CODE = value
				End If
			End Set
		End Property
		
		<Column(Storage:="_LEVEL_NAME", DbType:="NVarChar(255)"),  _
		 DataMember(Order:=3)>  _
		Public Property LEVEL_NAME() As String
			Get
				Return Me._LEVEL_NAME
			End Get
			Set
				If (String.Equals(Me._LEVEL_NAME, value) = false) Then
					Me._LEVEL_NAME = value
				End If
			End Set
		End Property
		
		<Column(Storage:="_LEVEL_ROOT", DbType:="NVarChar(5)"),  _
		 DataMember(Order:=4)>  _
		Public Property LEVEL_ROOT() As String
			Get
				Return Me._LEVEL_ROOT
			End Get
			Set
				If (String.Equals(Me._LEVEL_ROOT, value) = false) Then
					Me._LEVEL_ROOT = value
				End If
			End Set
		End Property
		
		<Column(Storage:="_EMP_ID", DbType:="NVarChar(10)"),  _
		 DataMember(Order:=5)>  _
		Public Property EMP_ID() As String
			Get
				Return Me._EMP_ID
			End Get
			Set
				If (String.Equals(Me._EMP_ID, value) = false) Then
					Me._EMP_ID = value
				End If
			End Set
		End Property
		
		<Column(Storage:="_TITLE_NAME", DbType:="VarChar(20)"),  _
		 DataMember(Order:=6)>  _
		Public Property TITLE_NAME() As String
			Get
				Return Me._TITLE_NAME
			End Get
			Set
				If (String.Equals(Me._TITLE_NAME, value) = false) Then
					Me._TITLE_NAME = value
				End If
			End Set
		End Property
		
		<Column(Storage:="_EMPNAME", DbType:="VarChar(50)"),  _
		 DataMember(Order:=7)>  _
		Public Property EMPNAME() As String
			Get
				Return Me._EMPNAME
			End Get
			Set
				If (String.Equals(Me._EMPNAME, value) = false) Then
					Me._EMPNAME = value
				End If
			End Set
		End Property
		
		<Column(Storage:="_EMPSURNAME", DbType:="VarChar(50)"),  _
		 DataMember(Order:=8)>  _
		Public Property EMPSURNAME() As String
			Get
				Return Me._EMPSURNAME
			End Get
			Set
				If (String.Equals(Me._EMPSURNAME, value) = false) Then
					Me._EMPSURNAME = value
				End If
			End Set
		End Property
		
		<Column(Storage:="_LEAD_ID", DbType:="NVarChar(10)"),  _
		 DataMember(Order:=9)>  _
		Public Property LEAD_ID() As String
			Get
				Return Me._LEAD_ID
			End Get
			Set
				If (String.Equals(Me._LEAD_ID, value) = false) Then
					Me._LEAD_ID = value
				End If
			End Set
		End Property
		
		<Column(Storage:="_LEAD_ID2", DbType:="NVarChar(10)"),  _
		 DataMember(Order:=10)>  _
		Public Property LEAD_ID2() As String
			Get
				Return Me._LEAD_ID2
			End Get
			Set
				If (String.Equals(Me._LEAD_ID2, value) = false) Then
					Me._LEAD_ID2 = value
				End If
			End Set
		End Property
	End Class

    Namespace employee
        <DataContract()> _
        Partial Public Class Employee

            Private _EMP_ID As String

            Private _TITLE_NAME As String

            Private _EMPNAME As String

            Private _EMPSURNAME As String

            Private _TITLE_NAME_E As String

            Private _EMPNAME_E As String

            Private _EMPSURNAME_E As String

            Private _EMAIL As String

            Private _IDCARD As String

            Private _TAX_NO As String

            Private _ACCNO As String

            Private _ADDRESS As String

            Private _SOI As String

            Private _ROAD As String

            Private _LOCALITY As String

            Private _DISTRINCT As String

            Private _PROV_CODE As String

            Private _ZIPCODE As String

            Private _TEL_HOME As String

            Private _TEL_MOBILE As String

            Private _TEL_INDOOR As String

            Private _DATEOFBIRTH As System.Nullable(Of Date)

            Private _IMAGENAME As String

            Private _DATEOFSTART As System.Nullable(Of Date)

            Private _STATUS As System.Nullable(Of Char)

            Private _TEAM_ID As String

            Private _GROUP_HEAD As System.Nullable(Of Char)

            Private _ROLE As System.Nullable(Of Byte)

            Private _PERMIT As System.Nullable(Of Char)

            Private _USERNAME As String

            Private _PASSWD As String

            Private _UP_DT As System.Nullable(Of Date)

            Private _Dept As System.Nullable(Of Short)

            Private _Id_Region As System.Nullable(Of Short)

            Private _Id_Branch As System.Nullable(Of Short)

            Private _POSITION_CODE As String

            Private _Id_Region_Group As String

            Private _Id_Branch_Group As String

            Private _Id_Group_Group As String

            Public Sub New()
                MyBase.New()
            End Sub

            <Column(Storage:="_EMP_ID", DbType:="NVarChar(10) NOT NULL", CanBeNull:=False), _
             DataMember(Order:=1)> _
            Public Property EMP_ID() As String
                Get
                    Return Me._EMP_ID
                End Get
                Set(ByVal value As String)
                    If (String.Equals(Me._EMP_ID, value) = False) Then
                        Me._EMP_ID = value
                    End If
                End Set
            End Property

            <Column(Storage:="_TITLE_NAME", DbType:="VarChar(20) NOT NULL", CanBeNull:=False), _
             DataMember(Order:=2)> _
            Public Property TITLE_NAME() As String
                Get
                    Return Me._TITLE_NAME
                End Get
                Set(ByVal value As String)
                    If (String.Equals(Me._TITLE_NAME, value) = False) Then
                        Me._TITLE_NAME = value
                    End If
                End Set
            End Property

            <Column(Storage:="_EMPNAME", DbType:="VarChar(50)"), _
             DataMember(Order:=3)> _
            Public Property EMPNAME() As String
                Get
                    Return Me._EMPNAME
                End Get
                Set(ByVal value As String)
                    If (String.Equals(Me._EMPNAME, value) = False) Then
                        Me._EMPNAME = value
                    End If
                End Set
            End Property

            <Column(Storage:="_EMPSURNAME", DbType:="VarChar(50)"), _
             DataMember(Order:=4)> _
            Public Property EMPSURNAME() As String
                Get
                    Return Me._EMPSURNAME
                End Get
                Set(ByVal value As String)
                    If (String.Equals(Me._EMPSURNAME, value) = False) Then
                        Me._EMPSURNAME = value
                    End If
                End Set
            End Property

            <Column(Storage:="_TITLE_NAME_E", DbType:="VarChar(20)"), _
             DataMember(Order:=5)> _
            Public Property TITLE_NAME_E() As String
                Get
                    Return Me._TITLE_NAME_E
                End Get
                Set(ByVal value As String)
                    If (String.Equals(Me._TITLE_NAME_E, value) = False) Then
                        Me._TITLE_NAME_E = value
                    End If
                End Set
            End Property

            <Column(Storage:="_EMPNAME_E", DbType:="NVarChar(50)"), _
             DataMember(Order:=6)> _
            Public Property EMPNAME_E() As String
                Get
                    Return Me._EMPNAME_E
                End Get
                Set(ByVal value As String)
                    If (String.Equals(Me._EMPNAME_E, value) = False) Then
                        Me._EMPNAME_E = value
                    End If
                End Set
            End Property

            <Column(Storage:="_EMPSURNAME_E", DbType:="NVarChar(50)"), _
             DataMember(Order:=7)> _
            Public Property EMPSURNAME_E() As String
                Get
                    Return Me._EMPSURNAME_E
                End Get
                Set(ByVal value As String)
                    If (String.Equals(Me._EMPSURNAME_E, value) = False) Then
                        Me._EMPSURNAME_E = value
                    End If
                End Set
            End Property

            <Column(Storage:="_EMAIL", DbType:="Char(30)"), _
             DataMember(Order:=8)> _
            Public Property EMAIL() As String
                Get
                    Return Me._EMAIL
                End Get
                Set(ByVal value As String)
                    If (String.Equals(Me._EMAIL, value) = False) Then
                        Me._EMAIL = value
                    End If
                End Set
            End Property

            <Column(Storage:="_IDCARD", DbType:="VarChar(50)"), _
             DataMember(Order:=9)> _
            Public Property IDCARD() As String
                Get
                    Return Me._IDCARD
                End Get
                Set(ByVal value As String)
                    If (String.Equals(Me._IDCARD, value) = False) Then
                        Me._IDCARD = value
                    End If
                End Set
            End Property

            <Column(Storage:="_TAX_NO", DbType:="VarChar(50)"), _
             DataMember(Order:=10)> _
            Public Property TAX_NO() As String
                Get
                    Return Me._TAX_NO
                End Get
                Set(ByVal value As String)
                    If (String.Equals(Me._TAX_NO, value) = False) Then
                        Me._TAX_NO = value
                    End If
                End Set
            End Property

            <Column(Storage:="_ACCNO", DbType:="Char(16)"), _
             DataMember(Order:=11)> _
            Public Property ACCNO() As String
                Get
                    Return Me._ACCNO
                End Get
                Set(ByVal value As String)
                    If (String.Equals(Me._ACCNO, value) = False) Then
                        Me._ACCNO = value
                    End If
                End Set
            End Property

            <Column(Storage:="_ADDRESS", DbType:="VarChar(30)"), _
             DataMember(Order:=12)> _
            Public Property ADDRESS() As String
                Get
                    Return Me._ADDRESS
                End Get
                Set(ByVal value As String)
                    If (String.Equals(Me._ADDRESS, value) = False) Then
                        Me._ADDRESS = value
                    End If
                End Set
            End Property

            <Column(Storage:="_SOI", DbType:="VarChar(20)"), _
             DataMember(Order:=13)> _
            Public Property SOI() As String
                Get
                    Return Me._SOI
                End Get
                Set(ByVal value As String)
                    If (String.Equals(Me._SOI, value) = False) Then
                        Me._SOI = value
                    End If
                End Set
            End Property

            <Column(Storage:="_ROAD", DbType:="VarChar(30)"), _
             DataMember(Order:=14)> _
            Public Property ROAD() As String
                Get
                    Return Me._ROAD
                End Get
                Set(ByVal value As String)
                    If (String.Equals(Me._ROAD, value) = False) Then
                        Me._ROAD = value
                    End If
                End Set
            End Property

            <Column(Storage:="_LOCALITY", DbType:="VarChar(30)"), _
             DataMember(Order:=15)> _
            Public Property LOCALITY() As String
                Get
                    Return Me._LOCALITY
                End Get
                Set(ByVal value As String)
                    If (String.Equals(Me._LOCALITY, value) = False) Then
                        Me._LOCALITY = value
                    End If
                End Set
            End Property

            <Column(Storage:="_DISTRINCT", DbType:="VarChar(30)"), _
             DataMember(Order:=16)> _
            Public Property DISTRINCT() As String
                Get
                    Return Me._DISTRINCT
                End Get
                Set(ByVal value As String)
                    If (String.Equals(Me._DISTRINCT, value) = False) Then
                        Me._DISTRINCT = value
                    End If
                End Set
            End Property

            <Column(Storage:="_PROV_CODE", DbType:="Char(2)"), _
             DataMember(Order:=17)> _
            Public Property PROV_CODE() As String
                Get
                    Return Me._PROV_CODE
                End Get
                Set(ByVal value As String)
                    If (String.Equals(Me._PROV_CODE, value) = False) Then
                        Me._PROV_CODE = value
                    End If
                End Set
            End Property

            <Column(Storage:="_ZIPCODE", DbType:="Char(5)"), _
             DataMember(Order:=18)> _
            Public Property ZIPCODE() As String
                Get
                    Return Me._ZIPCODE
                End Get
                Set(ByVal value As String)
                    If (String.Equals(Me._ZIPCODE, value) = False) Then
                        Me._ZIPCODE = value
                    End If
                End Set
            End Property

            <Column(Storage:="_TEL_HOME", DbType:="VarChar(30)"), _
             DataMember(Order:=19)> _
            Public Property TEL_HOME() As String
                Get
                    Return Me._TEL_HOME
                End Get
                Set(ByVal value As String)
                    If (String.Equals(Me._TEL_HOME, value) = False) Then
                        Me._TEL_HOME = value
                    End If
                End Set
            End Property

            <Column(Storage:="_TEL_MOBILE", DbType:="VarChar(20)"), _
             DataMember(Order:=20)> _
            Public Property TEL_MOBILE() As String
                Get
                    Return Me._TEL_MOBILE
                End Get
                Set(ByVal value As String)
                    If (String.Equals(Me._TEL_MOBILE, value) = False) Then
                        Me._TEL_MOBILE = value
                    End If
                End Set
            End Property

            <Column(Storage:="_TEL_INDOOR", DbType:="VarChar(30)"), _
             DataMember(Order:=21)> _
            Public Property TEL_INDOOR() As String
                Get
                    Return Me._TEL_INDOOR
                End Get
                Set(ByVal value As String)
                    If (String.Equals(Me._TEL_INDOOR, value) = False) Then
                        Me._TEL_INDOOR = value
                    End If
                End Set
            End Property

            <Column(Storage:="_DATEOFBIRTH", DbType:="DateTime"), _
             DataMember(Order:=22)> _
            Public Property DATEOFBIRTH() As System.Nullable(Of Date)
                Get
                    Return Me._DATEOFBIRTH
                End Get
                Set(ByVal value As System.Nullable(Of Date))
                    If (Me._DATEOFBIRTH.Equals(value) = False) Then
                        Me._DATEOFBIRTH = value
                    End If
                End Set
            End Property

            <Column(Storage:="_IMAGENAME", DbType:="VarChar(20)"), _
             DataMember(Order:=23)> _
            Public Property IMAGENAME() As String
                Get
                    Return Me._IMAGENAME
                End Get
                Set(ByVal value As String)
                    If (String.Equals(Me._IMAGENAME, value) = False) Then
                        Me._IMAGENAME = value
                    End If
                End Set
            End Property

            <Column(Storage:="_DATEOFSTART", DbType:="DateTime"), _
             DataMember(Order:=24)> _
            Public Property DATEOFSTART() As System.Nullable(Of Date)
                Get
                    Return Me._DATEOFSTART
                End Get
                Set(ByVal value As System.Nullable(Of Date))
                    If (Me._DATEOFSTART.Equals(value) = False) Then
                        Me._DATEOFSTART = value
                    End If
                End Set
            End Property

            <Column(Storage:="_STATUS", DbType:="Char(1)"), _
             DataMember(Order:=25)> _
            Public Property STATUS() As System.Nullable(Of Char)
                Get
                    Return Me._STATUS
                End Get
                Set(ByVal value As System.Nullable(Of Char))
                    If (Me._STATUS.Equals(value) = False) Then
                        Me._STATUS = value
                    End If
                End Set
            End Property

            <Column(Storage:="_TEAM_ID", DbType:="NVarChar(10)"), _
             DataMember(Order:=26)> _
            Public Property TEAM_ID() As String
                Get
                    Return Me._TEAM_ID
                End Get
                Set(ByVal value As String)
                    If (String.Equals(Me._TEAM_ID, value) = False) Then
                        Me._TEAM_ID = value
                    End If
                End Set
            End Property

            <Column(Storage:="_GROUP_HEAD", DbType:="Char(1)"), _
             DataMember(Order:=27)> _
            Public Property GROUP_HEAD() As System.Nullable(Of Char)
                Get
                    Return Me._GROUP_HEAD
                End Get
                Set(ByVal value As System.Nullable(Of Char))
                    If (Me._GROUP_HEAD.Equals(value) = False) Then
                        Me._GROUP_HEAD = value
                    End If
                End Set
            End Property

            <Column(Storage:="_ROLE", DbType:="TinyInt"), _
             DataMember(Order:=28)> _
            Public Property ROLE() As System.Nullable(Of Byte)
                Get
                    Return Me._ROLE
                End Get
                Set(ByVal value As System.Nullable(Of Byte))
                    If (Me._ROLE.Equals(value) = False) Then
                        Me._ROLE = value
                    End If
                End Set
            End Property

            <Column(Storage:="_PERMIT", DbType:="Char(1)"), _
             DataMember(Order:=29)> _
            Public Property PERMIT() As System.Nullable(Of Char)
                Get
                    Return Me._PERMIT
                End Get
                Set(ByVal value As System.Nullable(Of Char))
                    If (Me._PERMIT.Equals(value) = False) Then
                        Me._PERMIT = value
                    End If
                End Set
            End Property

            <Column(Storage:="_USERNAME", DbType:="NVarChar(10)"), _
             DataMember(Order:=30)> _
            Public Property USERNAME() As String
                Get
                    Return Me._USERNAME
                End Get
                Set(ByVal value As String)
                    If (String.Equals(Me._USERNAME, value) = False) Then
                        Me._USERNAME = value
                    End If
                End Set
            End Property

            <Column(Storage:="_PASSWD", DbType:="NVarChar(20)"), _
             DataMember(Order:=31)> _
            Public Property PASSWD() As String
                Get
                    Return Me._PASSWD
                End Get
                Set(ByVal value As String)
                    If (String.Equals(Me._PASSWD, value) = False) Then
                        Me._PASSWD = value
                    End If
                End Set
            End Property

            <Column(Storage:="_UP_DT", DbType:="DateTime"), _
             DataMember(Order:=32)> _
            Public Property UP_DT() As System.Nullable(Of Date)
                Get
                    Return Me._UP_DT
                End Get
                Set(ByVal value As System.Nullable(Of Date))
                    If (Me._UP_DT.Equals(value) = False) Then
                        Me._UP_DT = value
                    End If
                End Set
            End Property

            <Column(Storage:="_Dept", DbType:="SmallInt"), _
             DataMember(Order:=33)> _
            Public Property Dept() As System.Nullable(Of Short)
                Get
                    Return Me._Dept
                End Get
                Set(ByVal value As System.Nullable(Of Short))
                    If (Me._Dept.Equals(value) = False) Then
                        Me._Dept = value
                    End If
                End Set
            End Property

            <Column(Storage:="_Id_Region", DbType:="SmallInt"), _
             DataMember(Order:=34)> _
            Public Property Id_Region() As System.Nullable(Of Short)
                Get
                    Return Me._Id_Region
                End Get
                Set(ByVal value As System.Nullable(Of Short))
                    If (Me._Id_Region.Equals(value) = False) Then
                        Me._Id_Region = value
                    End If
                End Set
            End Property

            <Column(Storage:="_Id_Branch", DbType:="SmallInt"), _
             DataMember(Order:=35)> _
            Public Property Id_Branch() As System.Nullable(Of Short)
                Get
                    Return Me._Id_Branch
                End Get
                Set(ByVal value As System.Nullable(Of Short))
                    If (Me._Id_Branch.Equals(value) = False) Then
                        Me._Id_Branch = value
                    End If
                End Set
            End Property

            <Column(Storage:="_POSITION_CODE", DbType:="Char(5)"), _
             DataMember(Order:=36)> _
            Public Property POSITION_CODE() As String
                Get
                    Return Me._POSITION_CODE
                End Get
                Set(ByVal value As String)
                    If (String.Equals(Me._POSITION_CODE, value) = False) Then
                        Me._POSITION_CODE = value
                    End If
                End Set
            End Property

            <Column(Storage:="_Id_Region_Group", DbType:="NVarChar(255)"), _
             DataMember(Order:=37)> _
            Public Property Id_Region_Group() As String
                Get
                    Return Me._Id_Region_Group
                End Get
                Set(ByVal value As String)
                    If (String.Equals(Me._Id_Region_Group, value) = False) Then
                        Me._Id_Region_Group = value
                    End If
                End Set
            End Property

            <Column(Storage:="_Id_Branch_Group", DbType:="NVarChar(255)"), _
             DataMember(Order:=38)> _
            Public Property Id_Branch_Group() As String
                Get
                    Return Me._Id_Branch_Group
                End Get
                Set(ByVal value As String)
                    If (String.Equals(Me._Id_Branch_Group, value) = False) Then
                        Me._Id_Branch_Group = value
                    End If
                End Set
            End Property

            <Column(Storage:="_Id_Group_Group", DbType:="NText", UpdateCheck:=UpdateCheck.Never), _
             DataMember(Order:=39)> _
            Public Property Id_Group_Group() As String
                Get
                    Return Me._Id_Group_Group
                End Get
                Set(ByVal value As String)
                    If (String.Equals(Me._Id_Group_Group, value) = False) Then
                        Me._Id_Group_Group = value
                    End If
                End Set
            End Property
        End Class
    End Namespace
    
End Namespace
