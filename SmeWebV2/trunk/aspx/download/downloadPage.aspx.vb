Option Strict On
Option Explicit On

Imports System.IO

Namespace aspx.download
    Partial Class downloadPage
        Inherits aspx.MyPageClass

#Region "Constant"
        Private Const FOLDER_ICON_PATH As String = "~/images/imageIcon/folder.gif"
        Private Const EXCEL_ICON_PATH_1 As String = "~/images/imageIcon/excel.gif"
        Private Const EXCEL_ICON_PATH_2 As String = "~/images/imageIcon/Excel 6.ico"
        Private Const WORD_ICON_PATH As String = "~/images/imageIcon/Word 6.ico"
        Private Const PDF_ICON_PATH As String = "~/images/imageIcon/icon_pdf.gif"
        Private Const TXT_ICON_PATH As String = "~/images/imageIcon/txt.gif"

#End Region

#Region "My Code"
        Public Function createTree(ByVal page As System.Web.UI.Page, ByVal virtualRootPath As String) As TreeNode
            Dim result As TreeNode = Nothing

            If Directory.Exists(page.Server.MapPath(virtualRootPath)) Then
                'Populate the tree based on the subfolders of the specified VirtualImageRoot
                Dim rootFolder As New DirectoryInfo(page.Server.MapPath(virtualRootPath))
                result = addNodeAndDescendents(rootFolder, Nothing, virtualRootPath)
                'MsgBox(virtualRootPath + ":" + page.ResolveUrl(virtualRootPath))
            Else
                Throw New Exception("Can not find path on server : " & virtualRootPath)
            End If

            Return result
        End Function

        Public Function addNodeAndDescendents(ByVal rootFolder As DirectoryInfo, ByVal parentNode As TreeNode, ByVal _virtualRootPath As String) As TreeNode
            Dim result As TreeNode = Nothing
            Dim virtualFolderRoot As String = Nothing
            Dim new_virtualRootPath As String = _virtualRootPath

            If parentNode Is Nothing Then
                virtualFolderRoot = rootFolder.Name & "/"
            Else
                virtualFolderRoot = parentNode.Value & rootFolder.Name & "/"
                new_virtualRootPath += rootFolder.Name + "/"
            End If

            Dim branchNode As New TreeNode(rootFolder.Name, virtualFolderRoot)

            'เพิ่ม file ลงใน folder ของ Tree
            Dim subFiles As FileInfo() = rootFolder.GetFiles()
            If (subFiles.Length <> 0) Then
                For Each subFile As FileInfo In subFiles
                    Dim leafNode As New TreeNode(subFile.Name, virtualFolderRoot & subFile.Name)
                    'leafNode.NavigateUrl = new_virtualRootPath + subFile.Name
                    leafNode.NavigateUrl = "~/aspx/download/checkBeforeDownload.aspx?url=" + new_virtualRootPath + subFile.Name
                    leafNode.ImageUrl = getExtensionImagesPath(subFile.Extension)
                    branchNode.ChildNodes.Add(leafNode)
                Next
            End If

            'Recurse through this folder's subfolders
            Dim subFolders As DirectoryInfo() = rootFolder.GetDirectories()
            If (subFolders.Length <> 0) Then
                For Each subFolder As DirectoryInfo In subFolders
                    Dim subBranchNode As TreeNode = addNodeAndDescendents(subFolder, branchNode, new_virtualRootPath)
                    subBranchNode.ImageUrl = Page.ResolveUrl(FOLDER_ICON_PATH)
                    branchNode.ChildNodes.Add(subBranchNode)
                Next
            End If

            result = branchNode

            Return result
        End Function

        Private Function getExtensionImagesPath(ByVal extension As String) As String
            Dim result As String = Nothing

            If extension.Equals(".xls") Then
                result = Page.ResolveUrl(EXCEL_ICON_PATH_2)
            ElseIf extension.Equals(".doc") Then
                result = Page.ResolveUrl(WORD_ICON_PATH)
            ElseIf extension.Equals(".pdf") Then
                result = Page.ResolveUrl(PDF_ICON_PATH)
            Else
                result = Page.ResolveUrl(TXT_ICON_PATH)
            End If

            Return result
        End Function
#End Region

        Protected Sub TreeView1_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles TreeView1.Load
            If Not Me.IsPostBack Then
                DirectCast(sender, TreeView).Nodes.Add(createTree(Page, "~/download/STOP_CUSTOMER/"))
            End If
        End Sub

        Protected Sub TreeView2_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles TreeView2.Load
            If Not Me.IsPostBack Then
                DirectCast(sender, TreeView).Nodes.Add(createTree(Page, "~/download/STOP_CUSTOMER_ย้อนหลัง/"))
            End If
        End Sub

        Protected Sub TreeView3_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles TreeView3.Load
            If Not Me.IsPostBack Then
                DirectCast(sender, TreeView).Nodes.Add(createTree(Page, "~/download/KFS/"))
            End If
        End Sub

        Protected Sub TreeView4_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles TreeView4.Load
            If Not Me.IsPostBack Then
                DirectCast(sender, TreeView).Nodes.Add(createTree(Page, "~/download/Form_Register_TDR/"))
            End If
        End Sub

        Protected Sub TreeView5_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles TreeView5.Load
            If Not Me.IsPostBack Then
                DirectCast(sender, TreeView).Nodes.Add(createTree(Page, "~/download/smerisk/"))
            End If
        End Sub

        Protected Sub TreeView6_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles TreeView6.Load
            If Not Me.IsPostBack Then
                DirectCast(sender, TreeView).Nodes.Add(createTree(Page, "~/download/NPL/"))
            End If
        End Sub

        Protected Sub TreeView7_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles TreeView7.Load
            If Not Me.IsPostBack Then
                DirectCast(sender, TreeView).Nodes.Add(createTree(Page, "~/download/DSS_Manual/"))
            End If
        End Sub

        Protected Sub TreeView8_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles TreeView8.Load
            If Not Me.IsPostBack Then
                DirectCast(sender, TreeView).Nodes.Add(createTree(Page, "~/download/CreditRatingNewModel20110221/"))
            End If
        End Sub
    End Class
End Namespace
