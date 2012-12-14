Option Explicit On
Option Strict On

Imports Microsoft.VisualBasic
Imports System.IO

Public Class FileSystemTreeUtil

    Public Shared ReadOnly virtualImageRoot As String = "images/imageIcon/"
    Private Shared _httpPath As String = "~"

    ''' <summary>
    ''' 
    ''' </summary>
    ''' <param name="server">Server.mappath</param>
    ''' <param name="virtualRootPath"></param>
    ''' <returns></returns>
    ''' <remarks></remarks>
    Public Shared Function createTree(ByVal server As HttpServerUtility, ByVal virtualRootPath As String, ByVal httpPath As String) As TreeNode
        Dim result As TreeNode = Nothing
        _httpPath = httpPath

        If Directory.Exists(server.MapPath(virtualRootPath)) Then
            'Populate the tree based on the subfolders of the specified VirtualImageRoot
            Dim rootFolder As New DirectoryInfo(server.MapPath(virtualRootPath))
            result = addNodeAndDescendents(rootFolder, Nothing)
        Else
            Throw New Exception("Can not find path on server : " & virtualRootPath)
        End If

        Return result
    End Function

    Public Shared Function addNodeAndDescendents(ByVal rootFolder As DirectoryInfo, ByVal parentNode As TreeNode) As TreeNode
        Dim result As TreeNode = Nothing
        Dim virtualFolderRoot As String = Nothing

        If parentNode Is Nothing Then
            virtualFolderRoot = rootFolder.Name & "/"
        Else
            virtualFolderRoot = parentNode.Value & rootFolder.Name & "/"
        End If

        Dim branchNode As New TreeNode(rootFolder.Name, virtualFolderRoot)

        'เพิ่ม file ลงใน folder ของ Tree
        Dim subFiles As FileInfo() = rootFolder.GetFiles()
        If (subFiles.Length <> 0) Then
            For Each subFile As FileInfo In subFiles
                Dim leafNode As New TreeNode(subFile.Name, virtualFolderRoot & subFile.Name)
                leafNode.NavigateUrl = _httpPath + virtualFolderRoot + subFile.Name
                branchNode.ChildNodes.Add(leafNode)
            Next
        End If

        'Recurse through this folder's subfolders
        Dim subFolders As DirectoryInfo() = rootFolder.GetDirectories()
        If (subFolders.Length <> 0) Then
            For Each subFolder As DirectoryInfo In subFolders
                Dim subBranchNode As TreeNode = addNodeAndDescendents(subFolder, branchNode)
                branchNode.ChildNodes.Add(subBranchNode)
            Next
        End If

        result = branchNode

        Return result
    End Function

    Private Shared Function getExtensionImagesPath(ByVal extension As String) As String

        Return Nothing

    End Function

End Class
