Option Explicit On
Option Strict On

Imports Microsoft.VisualBasic
Imports System.Data
Imports System.Data.SqlClient
Imports System.Diagnostics
Imports System.Collections.Generic

Partial Class CAControlling
    Inherits System.Web.UI.Page

#Region "Custom Code"
    Private Sub bindTreeView()

        Dim levelList As List(Of ControllingLevel) = DirectCast(MyCacheFactory.getCache(MyCacheFactory.cacheKeyEnum.FullControllingLevelCache).getObject, List(Of ControllingLevel))
        Dim userList As List(Of ControllingUserFullDesc) = DirectCast(MyCacheFactory.getCache(MyCacheFactory.cacheKeyEnum.AllControllingUser).getObject, List(Of ControllingUserFullDesc))

        'Dim cloneList As New List(Of ControllingLevelFullDesc)(userList)
        'Dim xmlFile As System.Xml.XmlTextWriter = Nothing

        Try
            'xmlFile = New System.Xml.XmlTextWriter(Server.MapPath("~") + "\Test3.xml", System.Text.Encoding.UTF8)
            'xmlFile.WriteStartDocument()

            If levelList.Count > 0 Then

                Dim levelUnit As ControllingLevel = Nothing

                For i As Integer = 0 To levelList.Count - 1
                    If (levelList(i).LEVEL_ROOT.Equals("ROOT")) Then
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

        node = New TreeNode(levelUnit.LEVEL_NAME, levelUnit.LEVEL_ID)

        'get all user
        Dim userList As List(Of ControllingUserFullDesc) = DirectCast(MyCacheFactory.getCache(MyCacheFactory.cacheKeyEnum.AllControllingUser).getObject, List(Of ControllingUserFullDesc))

        For i As Integer = 0 To userList.Count - 1
            Dim userUnit As ControllingUserFullDesc = userList(i)
            If levelUnit.LEVEL_ID.Equals(userUnit.LEVEL_ID) Then
                If userUnit.EMP_ID.Trim.Length <> 0 Then
                    node.ChildNodes.Add(New TreeNode(userUnit.EMP_ID + ":" + userUnit.FULLNAME, userUnit.EMP_ID, "", "./CAList.aspx", "_parent_SummaryIframe"))
                ElseIf userUnit.LEAD_ID.Trim.Length <> 0 Then
                    node.ChildNodes.Add(New TreeNode(userUnit.LEAD_ID + ":" + userUnit.FULLNAME, userUnit.LEAD_ID, "", "./CAList.aspx", "_parent_SummaryIframe"))
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

#End Region


    Protected Sub TreeView1_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles TreeView1.Load
        If Not Me.IsPostBack Then
            bindTreeView()
        End If
    End Sub
End Class
