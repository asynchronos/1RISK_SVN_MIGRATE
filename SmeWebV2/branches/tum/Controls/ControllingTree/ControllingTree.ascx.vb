Option Explicit On
Option Strict On

Imports Microsoft.VisualBasic
Imports System.Data
Imports System.Data.SqlClient
Imports System.Diagnostics
Imports System.Collections.Generic

<ComponentModel.DefaultBindingProperty("SelectedValue")> _
Partial Class ControllingTree
    Inherits System.Web.UI.UserControl

    Private defaultText As String = Nothing

    Private returnId As DomDetail = Nothing
    Private returnDetail As DomDetail = Nothing

    'ใช้เก็บค่า levelList ที่ถูกใช้ add ลง tree ไปแล้ว
    Private levelListAdded As New List(Of ControllingLevel)

#Region "Properties"
    ''' <summary>
    ''' รหัสพนักงานที่ใช้เป็นตัวตั้งต้นของ Tree
    ''' </summary>
    ''' <value>String</value>
    ''' <returns>String</returns>
    ''' <remarks></remarks>
    <ComponentModel.Browsable(True), ComponentModel.Category("Data"), ComponentModel.Description("Root Of EMP_ID")> _
    Property EMP_ID_ROOT() As String
        Get
            Return EMP_ID_ROOT_HF.Value
        End Get
        Set(ByVal value As String)
            EMP_ID_ROOT_HF.Value = value
        End Set
    End Property

    ''' <summary>
    ''' TreeView ของ Control นี้
    ''' </summary>
    ''' <value>System.Web.UI.WebControls.TreeView</value>
    ''' <returns>System.Web.UI.WebControls.TreeView</returns>
    ''' <remarks></remarks>
    <ComponentModel.Browsable(False), ComponentModel.Category("TreeView"), ComponentModel.Description("TreeView Object")> _
    Property Tree() As System.Web.UI.WebControls.TreeView
        Get
            Return TreeView1
        End Get
        Set(ByVal value As System.Web.UI.WebControls.TreeView)
            TreeView1 = value
        End Set
    End Property

    ''' <summary>
    ''' ใช้ดูว่า node ที่ถูกเลือกเป็น node ประเภทไหน? เป็นกลุ่มงาน?พนักงาน?
    ''' </summary>
    ''' <value>String</value>
    ''' <returns>String</returns>
    ''' <remarks></remarks>
    <ComponentModel.Browsable(False), ComponentModel.Category("TreeView"), ComponentModel.Description("Selected Value Type")> _
    ReadOnly Property SelectedValueType() As String
        Get
            Return MyTreeValue.getValueType(Tree.SelectedValue)
        End Get
    End Property

    ''' <summary>
    ''' ใช้ดูว่า node ที่ถูกเลือกมีค่าเป็นอะไร(ต้องใช้งานคู่กับ SelectedValueType ในการระบุประเภท)
    ''' </summary>
    ''' <value>String</value>
    ''' <returns>String</returns>
    ''' <remarks></remarks>
    <ComponentModel.Browsable(False), ComponentModel.Category("TreeView"), ComponentModel.Description("Selected Value")> _
    ReadOnly Property SelectedValue() As String
        Get
            Return MyTreeValue.getValue(Tree.SelectedValue)
        End Get
    End Property

    ''' <summary>
    ''' ในกรณีที่ node ที่ถูกเลือกเป็นกลุ่มงาน function นี้จะหาว่าภายใต้กลุ่มงานนั้นมี empId อะไรอยู่บ้าง
    ''' โดยจะ return ค่ากลับมาในรูปแบบ empId1;empId2;empId3;...;
    ''' </summary>
    ''' <value>String</value>
    ''' <returns>String</returns>
    ''' <remarks></remarks>
    <ComponentModel.Browsable(False), ComponentModel.Category("TreeView"), ComponentModel.Description("Selected EmpIds")> _
    ReadOnly Property SelectedEmpIds() As String
        Get
            Dim result As String = Nothing

            If Not IsNothing(SelectedValueType) Then
                If SelectedValueType.Equals("LEVEL_ID") Then
                    'ถ้าเป็นรหัสกลุ่มต้องวนหารหัสพนักงานภายใต้กลุ่มทั้งหมดแล้ว return ไปใน format "empId1;empId2;empId3;..."
                    result = getValueRecursive(Tree.SelectedNode, String.Empty)
                Else
                    'ถ้า selected value ของ tree ไม่ใช่รหัสกลุ่มแสดงว่าเป็นรหัสพนักงาน
                    result = SelectedValue
                End If
            End If
            
            Return result
        End Get
    End Property

    <ComponentModel.Browsable(False), ComponentModel.Category("TreeView"), ComponentModel.Description("Selected Text")> _
    ReadOnly Property SelectedText() As String
        Get
            Dim result As String = Nothing

            If IsNothing(Tree.SelectedNode) Then
                result = String.Empty
            Else
                result = Tree.SelectedNode.Text()
            End If

            Return result
        End Get
    End Property
#End Region

#Region "delegate"
    Public Delegate Sub NodeChangedHandler(ByVal sender As Object, ByVal e As EventArgs)

    Public Event SelectedNodeChanged As NodeChangedHandler

    Protected Overridable Sub NodeChanged(ByVal e As EventArgs)

        RaiseEvent SelectedNodeChanged(Me, e)

    End Sub

    Private Sub Selected_NodeChanged(ByVal sender As Object, ByVal e As System.EventArgs)

        NodeChanged(e)

    End Sub


#End Region

#Region "Web Form Designer generated code"

    Protected Overloads Overrides Sub OnInit(ByVal e As EventArgs)

        InitializeComponent()

        MyBase.OnInit(e)

    End Sub

    Private Sub InitializeComponent()

        AddHandler Me.TreeView1.SelectedNodeChanged, AddressOf Me.Selected_NodeChanged
        AddHandler Me.Load, AddressOf Me.Page_Load

    End Sub

#End Region

#Region "Custom Code"
    Protected Function CreateXMLDoc() As System.Xml.XmlDocument

        Dim stream As System.IO.MemoryStream = Nothing
        Dim xmlFile As System.Xml.XmlTextWriter = Nothing

        Try
            xmlFile = New System.Xml.XmlTextWriter(stream, System.Text.Encoding.UTF8)
            xmlFile.WriteStartDocument()

            'CreateTree(xmlFile)
        Catch ex As Exception
            System.Diagnostics.Debug.Print(ex.StackTrace)
        Finally
            xmlFile.Flush()
            xmlFile.Close()
        End Try

        Return Nothing
    End Function

    'Private Sub CreateTree(ByVal xmlFile As System.Xml.XmlTextWriter)
    Private Sub CreateTree()

        'Dim levelList As List(Of ControllingLevel) = ControllingLevelDAL.getControllingLevelLineByEMP_ID(EMP_ID_ROOT)
        Dim levelList As List(Of ControllingLevel) = DirectCast(MyCacheFactory.getCache(MyCacheFactory.cacheKeyEnum.FullControllingLevelCache).getObject, List(Of ControllingLevel))

        'Dim xmlFile As System.Xml.XmlTextWriter = Nothing

        Try
            'xmlFile = New System.Xml.XmlTextWriter(Server.MapPath("~") + "\Test3.xml", System.Text.Encoding.UTF8)
            'xmlFile.WriteStartDocument()

            If levelList.Count > 0 Then

                Dim levelUnit As ControllingLevel = Nothing

                For i As Integer = 0 To levelList.Count - 1
                    levelUnit = levelList(i)

                    If i = 0 Then 'กรณีวนลูปเพื่อ add tree ครั้งแรก
                        TreeView1.Nodes.Add(AddNodeAndDescendents(New TreeNode(), levelList, levelUnit))
                        'xmlFile.WriteElementString(xmlFile, userList, ControllingUnit)
                    Else 'กรณีวนลูปครั้งที่สองขึ้นไป
                        Dim addedFlag As Boolean = False
                        Dim addedCount As Integer = 0

                        While addedCount < levelListAdded.Count
                            'เช็คว่า levelUnit นี้ถูก add หรือยัง
                            If levelListAdded.Item(addedCount).LEVEL_ID.Equals(levelUnit.LEVEL_ID) Then
                                addedFlag = True
                                Exit While
                            End If

                            'เพิ่มค่า loop running
                            addedCount += 1
                        End While

                        'ถ้ายังไม่เคยถูก add ลง tree
                        If Not addedFlag Then
                            'ให้ add ลง tree ได้
                            TreeView1.Nodes.Add(AddNodeAndDescendents(New TreeNode(), levelList, levelUnit))
                            'xmlFile = writeElement(xmlFile, userList, ControllingUnit)
                        End If
                    End If
                Next

            End If

            'xmlFile.WriteEndDocument()
        Catch ex As Exception
            System.Diagnostics.Debug.Print(ex.StackTrace)
        Finally
            'xmlFile.Flush()
            'xmlFile.Close()
        End Try

    End Sub

    Private Function AddNodeAndDescendents(ByVal parentNode As TreeNode, ByVal levelList As List(Of ControllingLevel), ByVal levelUnit As ControllingLevel) As TreeNode
        Dim node As TreeNode = Nothing

        'add สายงาน
        Dim tempNode = New TreeNode(levelUnit.LEVEL_NAME, "LEVEL_ID:" + levelUnit.LEVEL_ID)
        'tempNode.NavigateUrl = "javascript:void(0);"
        node = tempNode

        'add สายงานนี้ลงในรายการ levelListAdded
        levelListAdded.Add(levelUnit)

        'get all user
        'Dim userList As List(Of ControllingUserFullDesc) = ControllingLevelDAL.getControllingUserLineByEMP_ID(EMP_ID_ROOT)
        Dim userList As List(Of ControllingUserFullDesc) = DirectCast(MyCacheFactory.getCache(MyCacheFactory.cacheKeyEnum.AllControllingUser).getObject, List(Of ControllingUserFullDesc))

        For i As Integer = 0 To userList.Count - 1
            Dim userUnit As ControllingUserFullDesc = userList(i)
            If levelUnit.LEVEL_ID.Equals(userUnit.LEVEL_ID) Then
                'เช็คว่ามีค่า EMP_ID หรือไม่
                If userUnit.EMP_ID.Trim.Length <> 0 Then
                    tempNode = New TreeNode(genReturnJScript(userUnit), "EMP_ID:" + userUnit.EMP_ID)

                    'ถ้า node นี้เป็น node เดียวกันกับ root ที่ใช้ตั้งต้นให้ mark select ไว้
                    If EMP_ID_ROOT.Equals(userUnit.EMP_ID) Then
                        tempNode.Selected = True
                    End If

                    'เช็คว่าค่า EMP_ID = LEAD_ID หรือไม่
                    'If userUnit.EMP_ID.Equals(userUnit.LEAD_ID) Then
                    If userUnit.LEAD_ID.Equals(1) Then
                        'เท่ากันแสดงว่าเป็นหัวหน้า
                        node.ChildNodes.AddAt(0, tempNode)
                    Else
                        'เป็นลูกน้อง
                        node.ChildNodes.Add(tempNode)
                    End If
                End If

            End If
        Next

        Dim subLevelList As New List(Of ControllingLevel)
        For i As Integer = 0 To levelList.Count - 1
            If (levelList(i).LEVEL_ROOT = levelUnit.LEVEL_ID) Then
                subLevelList.Add(levelList(i))
            End If
        Next

        If (subLevelList.Count > 0) Then
            For i As Integer = 0 To subLevelList.Count - 1
                Dim child As TreeNode = AddNodeAndDescendents(node, levelList, subLevelList(i))
                node.ChildNodes.Add(child)
            Next
        End If

        Return node
    End Function

    Private Function getValueRecursive(ByVal node As TreeNode, ByVal result As String) As String
        Dim newResult As String = result

        For nodeCount As Integer = 0 To node.ChildNodes.Count - 1
            Dim subNode As TreeNode = node.ChildNodes.Item(nodeCount)

            If MyTreeValue.getValueType(subNode.Value).Equals("LEVEL_ID") Then
                newResult += getValueRecursive(subNode, result)
            Else
                newResult += MyTreeValue.getValue(subNode.Value) + ";"
            End If

        Next

        Return newResult
    End Function

    Protected Function genReturnJScript(ByVal userUnit As ControllingUserFullDesc) As String
        Dim result As String = Nothing

        Dim script As String = ""
        If Not IsNothing(returnId) Then
            script += "setPropertyValueById(&quot;" + returnId.Id + "&quot;,&quot;" + returnId.Parent + "&quot;,&quot;" + returnId.Prop + "&quot;,&quot;" + userUnit.EMP_ID + "&quot;);"
        End If

        If Not IsNothing(returnDetail) Then
            script += "setPropertyValueById(&quot;" + returnDetail.Id + "&quot;,&quot;" + returnDetail.Parent + "&quot;,&quot;" + returnDetail.Prop + "&quot;,&quot;" + userUnit.FULLNAME + "&quot;);"
        End If

        Dim spanId As String = userUnit.LEVEL_ID + "_" + userUnit.EMP_ID

        result = "<span id='" + spanId + "' onclick='" + encapsulateTryCatch(script) + "'>" + userUnit.EMP_ID + ":" + userUnit.FULLNAME + "</span>"

        Return result
    End Function

    Protected Function encapsulateTryCatch(ByVal script As String) As String
        Dim result As String = script

        If script.Length > 0 Then
            result = "try{ " + script + " }catch(err){ alert(&quot;Function genReturnJScript(userUnit) error on control ControllingTree.ascx \n\n&quot;+err.description); }"
        End If

        Return result
    End Function
#End Region

    Protected Sub TreeView1_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles TreeView1.Load
        If Not Me.IsPostBack Then
            TreeView1.Nodes.Clear()
            CreateTree()
        End If

    End Sub

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

    End Sub

    Protected Sub CollapseTd_PreRender(ByVal sender As Object, ByVal e As System.EventArgs) Handles CollapseTd.PreRender
        Dim CollapseTd As HtmlTableCell = DirectCast(sender, HtmlTableCell)
        If EMP_ID_ROOT_HF.Value.Trim.Length < 5 Then
            CollapseTd.InnerHtml = ""
        Else
            CollapseTd.InnerHtml = "<"
        End If
    End Sub

    Public Function test() As Boolean
        Return True
    End Function

End Class

#Region "Relate Class"

''' <summary>
''' Class ต้นแบบของ value ของ Tree สำหรับ control นี้
''' </summary>
''' <remarks></remarks>
Partial Class MyTreeValue
    Private _valueType As String = Nothing
    Private _value As String = Nothing

    Property ValueType() As String
        Get
            Return _valueType
        End Get
        Set(ByVal value As String)
            _valueType = value
        End Set
    End Property

    Property Value() As String
        Get
            Return _value
        End Get
        Set(ByVal value As String)
            _value = value
        End Set
    End Property

    Public Sub New()
        Me.New(String.Empty)
    End Sub

    Public Sub New(ByVal str As String)
        MyBase.New()

        If str.IndexOf(":"c) > -1 Then
            ValueType = getValueType(str)
            Value = getValue(str)
        End If
    End Sub

    Public Shared Function getValueType(ByVal str As String) As String
        Dim result As String = Nothing

        If str.IndexOf(":"c) > -1 Then
            result = str.Substring(0, str.IndexOf(":"c))
        End If

        Return result
    End Function

    Public Shared Function getValue(ByVal str As String) As String
        Dim result As String = Nothing

        If str.IndexOf(":"c) > -1 Then
            result = str.Substring(str.IndexOf(":"c) + 1)
        End If

        Return result
    End Function

End Class

#End Region

