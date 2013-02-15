Option Explicit On
Option Strict On

Imports Microsoft.VisualBasic
Imports System.Data
Imports System.Data.SqlClient
Imports System.Diagnostics
Imports System.Collections.Generic

Partial Class aspx_employee_ControllingLine
    Inherits System.Web.UI.Page

    Protected separate As String = ","

#Region "Custom Code"
    Private Sub bindTreeView()

        Dim ControllingList As List(Of ControllingLevel) = DirectCast(MyCacheFactory.getCache(MyCacheFactory.cacheKeyEnum.FullControllingLevelCache).getObject, List(Of ControllingLevel))

        'Dim xmlFile As System.Xml.XmlTextWriter = Nothing

        Try
            'xmlFile = New System.Xml.XmlTextWriter(Server.MapPath("~") + "\Test3.xml", System.Text.Encoding.UTF8)
            'xmlFile.WriteStartDocument()

            If ControllingList.Count > 0 Then

                Dim ControllingUnit As ControllingLevel = Nothing
                For i As Integer = 0 To ControllingList.Count - 1
                    'If (ControllingList(i).LEVEL_ROOT.Equals("ROOT")) Then
                    If (ControllingList(i).LEVEL_ROOT.Equals("1156")) Then
                        ControllingUnit = ControllingList(i)
                        Exit For
                    End If
                Next
                'xmlFile = writeElement(xmlFile, ControllingList, ControllingUnit)

                TreeView1.Nodes.Add(AddNodeAndDescendents(New TreeNode(), ControllingList, ControllingUnit))
            End If

            'xmlFile.WriteEndDocument()
        Catch ex As Exception
            System.Diagnostics.Debug.Print(ex.StackTrace)
        Finally
            'xmlFile.Flush()
            'xmlFile.Close()
        End Try

    End Sub

    Private Function AddNodeAndDescendents(ByVal parentNode As TreeNode, ByVal ControllingList As List(Of ControllingLevel), ByVal ControllingUnit As ControllingLevel) As TreeNode
        Dim node As New TreeNode(ControllingUnit.LEVEL_NAME, ControllingUnit.LEVEL_ID.ToString)

        Dim subControllingList As New List(Of ControllingLevel)
        For i As Integer = 0 To ControllingList.Count - 1
            If (ControllingList(i).LEVEL_ROOT = ControllingUnit.LEVEL_ID) Then
                subControllingList.Add(ControllingList(i))
            End If
        Next

        If (subControllingList.Count > 0) Then
            For i As Integer = 0 To subControllingList.Count - 1
                Dim child As TreeNode = AddNodeAndDescendents(node, ControllingList, subControllingList(i))
                node.ChildNodes.Add(child)
            Next
        End If

        Return node
    End Function

    Private Sub checkSeparateInTargetTextBox()
        If NAMETextBox.Text.Trim.Length <> 0 Then
            If Not NAMETextBox.Text.Chars(NAMETextBox.Text.Length - 1).Equals(separate) Then
                NAMETextBox.Text += separate
            End If
        End If
    End Sub

    Private Function IsDupInTargetTextBox(ByVal value As String) As Boolean
        Return NAMETextBox.Text.Contains(value)
    End Function
#End Region

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        'script นี้จะรันเมื่อปิด page เป็นการโยนค่ากลับไปยัง opener
        Dim script As String = "window.onunload = function(){" _
                            + "returnTarget();" _
                            + "};"

        Page.ClientScript.RegisterClientScriptBlock(Me.GetType, "unloadScript", script, True)
    End Sub

    Protected Sub TreeView1_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles TreeView1.Load
        If Not Me.IsPostBack Then
            bindTreeView()
        End If
    End Sub

    Protected Sub TreeView1_SelectedNodeChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles TreeView1.SelectedNodeChanged
        GridView1.Caption = Server.HtmlDecode("<b>" + TreeView1.SelectedNode.Text + "</b>")
    End Sub

    Protected Sub targetTextBox_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles NAMETextBox.Load
        If Not Page.IsPostBack Then
            Dim domSourceId As String = Request.QueryString("source_id")
            Dim script As String = "ele(""" + NAMETextBox.ClientID + """).value = ele(""" + domSourceId + """,window.opener).value;"

            Page.ClientScript.RegisterStartupScript(Me.GetType, "getNameTxtFromOpener", script, True)
        End If
    End Sub

    Protected Sub GridView1_RowCreated(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewRowEventArgs) Handles GridView1.RowCreated
        Dim cBox As CheckBox = Nothing

        If e.Row.RowType = DataControlRowType.Header Then
            cBox = DirectCast(e.Row.FindControl("GridCheckBoxAll"), CheckBox)
        End If

        If e.Row.RowType = DataControlRowType.DataRow Then
            cBox = DirectCast(e.Row.FindControl("GridCheckBox"), CheckBox)
        End If

        If Not IsNothing(cBox) Then
            cBox.Attributes.Add("onclick", "autoCheckBox('" + GridView1.ClientID + "_','ctl','_GridCheckBox','" + GridView1.ClientID + "_ctl01_GridCheckBoxAll',2);")
        End If

    End Sub

    Protected Sub Grid2TextButton_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles Grid2TextButton.Click
        For i As Integer = 0 To GridView1.Rows.Count - 1
            Dim row As GridViewRow = GridView1.Rows(i)

            If row.RowType = DataControlRowType.DataRow Then
                If DirectCast(row.Cells(0).FindControl("GridCheckBox"), CheckBox).Checked Then
                    If Not IsDupInTargetTextBox(row.Cells(1).Text) Then
                        checkSeparateInTargetTextBox()
                        NAMETextBox.Text += row.Cells(2).Text + ":" + row.Cells(1).Text
                    End If
                End If
            End If
        Next
    End Sub

End Class
