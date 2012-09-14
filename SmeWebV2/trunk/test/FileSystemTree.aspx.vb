Option Explicit On
Option Strict On

Partial Class test_FileSystemTree
    Inherits System.Web.UI.Page

    Protected Sub TreeView1_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles TreeView1.Load
        If Not Me.IsPostBack Then
            DirectCast(sender, TreeView).Nodes.Add(FileSystemTreeUtil.createTree(Server, "~/download/Controling/", Page.ResolveUrl("~/download/Controling/")))
        End If

    End Sub
End Class
