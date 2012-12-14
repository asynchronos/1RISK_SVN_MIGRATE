Imports System.Collections.Generic
Partial Class aspx_employee_SearchEmployee
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Not Page.IsPostBack Then
            BindData()
            populateTree()
        End If
    End Sub

    Private Sub BindData()
        'MsgBox(LevelTree.Nodes.Count)
        ' If IsNothing(Session("arrRoot")) = False Then Exit Sub ' if have node exit sub 
        '  get data
        Dim dal As New ControllingLevelDAL
        Dim arr As List(Of ControllingLevel)
        arr = dal.getListControllingLevelByLevel_Root("Root")
        Session("arrRoot") = arr

        Dim obj As New VLevelUserEmpDAL
        Dim arrUser As New List(Of VLevelUserEmp)
        If Request("showBoss") = "no" Then
            arrUser = obj.getListALLVLevelUserEmpNoBoss
        Else
            arrUser = obj.getListALLVLevelUserEmp
        End If
        Session("arrUser") = arrUser

        Dim dalLevel As New ControllingLevelDAL
        Dim arrLevel As New List(Of ControllingLevel)
        arrLevel = dalLevel.getAllControllingLevel
        Session("arrLevel") = arrLevel

    End Sub
    Sub populateTree()
        ' create  root node
        Dim arr = Session("arrRoot")
        Dim Rootnode As New TreeNode
        Rootnode.Text = arr(0).LEVEL_NAME
        Rootnode.Value = arr(0).LEVEL_ID
        Dim root As TreeNode = AddNodeAndDescendents(Rootnode)
        'Add the root to the TreeView
        LevelTree.Nodes.Clear()
        LevelTree.Nodes.Add(root)

    End Sub

    Private Function AddNodeAndDescendents(ByVal parentNode As TreeNode) As TreeNode

        Dim level_id = parentNode.Value
        Dim node As New TreeNode
        node.Text = parentNode.Text
        node.Value = parentNode.Value
        Dim arrLevel As List(Of ControllingLevel) = Session("arrLevel")
        Dim arrUser As List(Of VLevelUserEmp) = Session("arrUser")
        ' Find  user in this level
        Dim Atext As String   '  text for search 
        For u As Integer = 0 To arrUser.Count - 1
            Atext = arrUser(u).EMP_ID & ":" & arrUser(u).TITLE_NAME & arrUser(u).EMPNAME & " " & arrUser(u).EMPSURNAME

            'MsgBox(InStr(Atext, SearchText))
            If arrUser(u).LEVEL_ID = node.Value Then
                Dim cnode As New TreeNode
                cnode.Value = arrUser(u).EMP_ID
                cnode.Text = Atext
                cnode.ImageUrl = "picture/human.gif"
                node.ChildNodes.Add(cnode)
            End If
        Next
        ' Find  level  in  this  level
        Dim Ltext As String  '  text for search 
        For i As Integer = 0 To arrLevel.Count - 1
            Ltext = arrLevel(i).LEVEL_NAME
            If arrLevel(i).LEVEL_ROOT = node.Value Then
                Dim cnode As New TreeNode
                cnode.Value = arrLevel(i).LEVEL_ID
                cnode.Text = Ltext
                node.Expand()

                Dim ccnode As TreeNode = AddNodeAndDescendents(cnode)
                node.ChildNodes.Add(ccnode)
            End If
        Next
        Return node     'Return the new TreeNode
    End Function
    Private Function AddNodeBySearchUser(ByVal parentNode As TreeNode, ByVal SearchText As String) As TreeNode
        'SearchText = tbSearch.Text
        parentNode.ChildNodes.Clear()
        Dim arrUser As List(Of VLevelUserEmp) = Session("arrUser")
        ' Find  user in this level
        Dim Atext As String   '  text for search 
        For u As Integer = 0 To arrUser.Count - 1
            Atext = arrUser(u).EMP_ID & ":" & arrUser(u).TITLE_NAME & arrUser(u).EMPNAME & " " & arrUser(u).EMPSURNAME
            'MsgBox(InStr(Atext, SearchText))
            If LCase(Atext).IndexOf(LCase(SearchText)) >= 0 Then
                Dim cnode As New TreeNode
                cnode.Value = arrUser(u).EMP_ID
                cnode.Text = Atext
                parentNode.ChildNodes.Add(cnode)
            End If
        Next
        ' Find  level  in  this  level
        Return parentNode     'Return the new TreeNode
    End Function
    Protected Sub BtnSearch_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles BtnSearch.Click
        If tbSearch.Text = "" Then
            'populateTree()
        Else
            AddNodeBySearchUser(LevelTree.Nodes(0), tbSearch.Text)
        End If

    End Sub

    Protected Sub BtnShowall_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles BtnShowall.Click
        populateTree()
    End Sub

    Protected Sub LevelTree_SelectedNodeChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles LevelTree.SelectedNodeChanged
        Dim emp_id, emp_name As String

        Dim name = Split(LevelTree.SelectedNode.Text, ":")
        If UBound(name) > 0 Then  ' ถ้าเป็นการเลือกค้นให้ทำ
            emp_id = LevelTree.SelectedNode.Value
            emp_name = name(1)
            Dim S As String
            S += "<script language='javascript'>"
            S += "window.opener.document.getElementById('" & Request.QueryString("tbEmp_id") & "').value  ='" & emp_id & "';"
            S += "window.opener.document.getElementById('" & Request.QueryString("tbEmployee") & "').value  ='" & emp_name & "';"
            S += "window.close();"
            S += "</script>"
            'Page.ClientScript.RegisterStartupScript(Me.GetType, "test", S, True)
            Response.Write(S)
        End If

    End Sub
End Class
