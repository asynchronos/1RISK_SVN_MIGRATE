Option Explicit On
Option Strict On

Imports Microsoft.VisualBasic
Imports System.Data
Imports System.Data.SqlClient
Imports System.Diagnostics
Imports System.Collections.Generic

Partial Class employee_CMControllingTree
    Inherits System.Web.UI.Page

#Region "Custom Code"
    Private Sub bindTreeView()

        Dim levelList As List(Of ControllingLevel) = DirectCast(MyCacheFactory.getCache(MyCacheFactory.cacheKeyEnum.FullControllingLevelCache).getObject, List(Of ControllingLevel))
        'Dim userList As List(Of ControllingUserFullDesc) = DirectCast(MyCacheFactory.getCache(MyCacheFactory.cacheKeyEnum.AllControllingUser).getObject, List(Of ControllingUserFullDesc))

        'Dim cloneList As New List(Of ControllingLevelFullDesc)(userList)
        'Dim xmlFile As System.Xml.XmlTextWriter = Nothing

        Try
            'xmlFile = New System.Xml.XmlTextWriter(Server.MapPath("~") + "\Test3.xml", System.Text.Encoding.UTF8)
            'xmlFile.WriteStartDocument()000001

            If levelList.Count > 0 Then

                Dim levelUnit As ControllingLevel = Nothing

                For i As Integer = 0 To levelList.Count - 1
                    'If (levelList(i).LEVEL_ROOT.Equals("ROOT")) Then
                    If (i = 0) Then
                        levelUnit = levelList(i)
                        Exit For
                    End If
                Next
                'xmlFile = writeElement(xmlFile, userList, ControllingUnit)

                TreeView1.Nodes.Add(AddNodeAndDescendents(New TreeNode(), levelList, levelUnit))
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
        Dim tempNode = New TreeNode(levelUnit.LEVEL_NAME, levelUnit.LEVEL_ID)
        tempNode.NavigateUrl = "javascript:void(0);"
        node = tempNode

        'get all user
        Dim userList As List(Of ControllingUserFullDesc) = DirectCast(MyCacheFactory.getCache(MyCacheFactory.cacheKeyEnum.AllControllingUser).getObject, List(Of ControllingUserFullDesc))

        For i As Integer = 0 To userList.Count - 1
            Dim userUnit As ControllingUserFullDesc = userList(i)
            If levelUnit.LEVEL_ID.Equals(userUnit.LEVEL_ID) Then
                'If userUnit.EMP_ID.Equals(userUnit.LEAD_ID) And (userUnit.EMP_ID.Trim.Length <> 0) Then
                If userUnit.EMP_ID.Trim.Length <> 0 And userUnit.LEAD_ID.Equals("1") Then
                    'add หัวหน้า
                    tempNode = New TreeNode(genReturnJScript(userUnit), userUnit.EMP_ID)
                    tempNode.NavigateUrl = "javascript:void(0);"
                    node.ChildNodes.AddAt(0, tempNode)
                ElseIf userUnit.EMP_ID.Trim.Length <> 0 Then
                    'add ลูกน้อง
                    tempNode = New TreeNode(genReturnJScript(userUnit), userUnit.EMP_ID)
                    tempNode.NavigateUrl = "javascript:void(0);"
                    node.ChildNodes.Add(tempNode)
                Else
                    'Nothing
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

        result = "<span id='" + spanId + "' onclick='" + encapsulateTryCatch(script) + "window.close();'>" + userUnit.EMP_ID + ":" + userUnit.FULLNAME + "</span>"

        Return result
    End Function

    Protected Function encapsulateTryCatch(ByVal script As String) As String
        Dim result As String = script

        If script.Length > 0 Then
            result = "try{ " + script + " }catch(err){ alert(&quot;Function genReturnJScript(userUnit) error on CMControllingTree.aspx \n\n&quot;+err.description); }"
        End If

        Return result
    End Function

#End Region

    Private returnId As DomDetail = Nothing
    Private returnDetail As DomDetail = Nothing

    Protected Sub TreeView1_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles TreeView1.Load
        If Not Me.IsPostBack Then
            bindTreeView()
        End If
    End Sub

    Protected Sub Button1_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles Button1.Click
        TreeView1.Nodes.Clear()

        If TextBox1.Text.Trim.Length <> 0 Then
            Dim userList As List(Of ControllingUserFullDesc) = New ControllingLevelDAL().getControllingUserByFilter(TextBox1.Text)
            Dim headNode As TreeNode = New TreeNode("Search Result")
            headNode.NavigateUrl = "javascript:void(0);"
            TreeView1.Nodes.Add(headNode)

            'search ไม่พบข้อมูล
            If (userList.Count < 1) Then
                TreeView1.Nodes(0).ChildNodes.Add(New TreeNode("No Data"))
                TreeView1.Nodes(0).Expand()
            End If

            For i As Integer = 0 To userList.Count - 1
                Dim node As TreeNode = New TreeNode(userList(i).LEVEL_NAME, userList(i).LEVEL_ID)
                node.NavigateUrl = "javascript:void(0);"

                Dim tempNode As TreeNode = New TreeNode(genReturnJScript(userList(i)), userList(i).EMP_ID)
                tempNode.NavigateUrl = "javascript:void(0);"
                node.ChildNodes.Add(tempNode)

                For j As Integer = i + 1 To userList.Count - 1
                    If userList(i).LEVEL_ID.Equals(userList(j).LEVEL_ID) Then
                        tempNode = New TreeNode(genReturnJScript(userList(j)), userList(j).EMP_ID)
                        tempNode.NavigateUrl = "javascript:void(0);"
                        node.ChildNodes.Add(tempNode)
                        i = j
                    Else
                        'nothing
                    End If
                Next
                TreeView1.Nodes(0).ChildNodes.Add(node)
                TreeView1.Nodes(0).Expand()
            Next
        Else
            'redirect กลับมายัง page เดิม
            Response.Redirect(Request.RawUrl)
        End If

    End Sub

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Not IsNothing(Request.QueryString("returnIdTarget")) Then
            returnId = New DomDetail(Request.QueryString("returnIdTarget"), Request.QueryString("returnIdProp"))
        End If

        If Not IsNothing(Request.QueryString("returnDetailTarget")) Then
            returnDetail = New DomDetail(Request.QueryString("returnDetailTarget"), Request.QueryString("returnDetailProp"))
        End If
    End Sub
End Class
