Imports System.Collections
Imports System.Collections.Generic
Imports System.Data.SqlClient

Partial Class managecust

    Inherits System.Web.UI.Page

    Dim level_id As String
    Dim level_name As String

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Page.IsPostBack = False Then
            findPosition()  ' 1 หาตำแหน่งของคนนี้อยู่ในสายงานใด
            bindCustRoot()  ' 2 หาลูกค้าที่คนนี้ถืออยู่ ( โดยตรง )
            populateTree()  ' 3 หาสายงานภายใต้คนนี้
        End If


    End Sub
    Sub findPosition()
        Dim risk_id As String
        risk_id = User.Identity.Name
        EmpIDlbl.Text = risk_id

        'Dim obj As New TbLeadDAL
        'Dim arr As New List(Of TbLead)
        'arr = obj.getLevel_idByEmp_id(risk_id)
        'level_id = arr(0).Level_id

        'Dim obj2 As New TbLevelDAL
        'Dim arr2 As New List(Of TbLevel)
        'arr2 = obj2.getListTbLevelByLevel_id(level_id)
        'level_name = arr2(0).Level_Name
        'Root_namelbl.Text = "Customers in " & level_name


        'Dim obj As New VLevelLeadEmpDAL
        'Dim arr As New List(Of VLevelLeadEmp)
        'arr = obj.getListVLevelLeadEmpByEmp_id(risk_id)
        'If arr.Count > 0 Then
        '    level_id = arr(0).Level_id
        '    level_name = arr(0).Level_Name
        '    Root_namelbl.Text = "Customers in " & level_name
        '    emprootlbl.Text = arr(0).TITLE_NAME & arr(0).EMPNAME & " " & arr(0).EMPSURNAME
        'Else
        '    Response.Write("")
        'End If
        Dim obj As New VLevelUserEmpDAL
        Dim arr As New List(Of VLevelUserEmp)
        arr = obj.getListVLevelUserEmpByEMP_ID(risk_id)
        If arr.Count > 0 Then
            level_id = arr(0).Level_id
            level_name = arr(0).Level_Name
            Root_namelbl.Text = "Customers in " & level_name
            emprootlbl.Text = arr(0).TITLE_NAME & arr(0).EMPNAME & " " & arr(0).EMPSURNAME
        Else
            Response.Write("")
        End If
    End Sub

    Sub bindCustRoot(Optional ByVal CurrentPage As Double = 1)

        Dim risk_id As String = EmpIDlbl.Text.ToString

        Dim obj As New CusOfficeDepDAL
        Dim PageSizes As Double = 5
        'CustRootGrid.DataSource = obj.getCusOfficeDepByRisk(risk_id)
        'Session("custroot") = CustRootGrid.DataSource
        CustRootGrid.DataSource = obj.getPageCusOfficeDepByRisk(risk_id, CurrentPage, PageSizes)
        CustRootGrid.DataBind()
        If CustRootGrid.Rows.Count > 0 Then
            nodatalbl.Visible = False
            SendBtn.Visible = True


            Dim ddl As DropDownList = Me.DropDownList1
            Dim pagecount As Double = obj.getRecordCount(risk_id)
            ddl.Items.Clear()
            For i As Integer = 1 To Math.Ceiling(pagecount / PageSizes)
                ddl.Items.Add(i.ToString())
            Next

            ' ddl.SelectedValue = (CustRootGrid.PageIndex + 1).ToString()
            If ddl.Items.Count > 0 Then
                ddl.SelectedIndex = CurrentPage - 1
            End If
            ddl.Visible = True

        Else
            nodatalbl.Text = " Don't have a customer "
            nodatalbl.Visible = True
            SendBtn.Visible = False
            DropDownList1.Visible = False
        End If


    End Sub
    Sub bindCust(ByVal risk_id As String, Optional ByVal CurrentPage As Double = 1)
        'If risk_id = EmpIDlbl.Text Then Exit Sub ' ถ้าเป็นคนเดียวกันไม่ทำ
        If risk_id = "" Then
            risk_id = Session("r_id")
        Else
            Session("r_id") = risk_id
        End If

        Dim obj As New CusOfficeDepDAL
        Dim PageSizes As Double = 5
        ' LevelCustGrid.DataSource = obj.getCusOfficeDepByRisk(risk_id)
        ' Session("cust") = LevelCustGrid.DataSource
        LevelCustGrid.DataSource = obj.getPageCusOfficeDepByRisk(risk_id, CurrentPage, PageSizes)
        LevelCustGrid.DataBind()
        If LevelCustGrid.Rows.Count > 0 Then
            nodatalbl2.Visible = False
            RemoveBtn.Visible = True

            'Dim ddl As DropDownList = e.Row.FindControl("DropDownList2")
            Dim ddl As DropDownList = Me.DropDownList2

            Dim pagecount As Double = obj.getRecordCount(risk_id)
            ddl.Items.Clear()
            For i As Integer = 1 To Math.Ceiling(pagecount / PageSizes)
                ddl.Items.Add(i.ToString())
            Next

            ' ddl.SelectedValue = (CustRootGrid.PageIndex + 1).ToString()
            If ddl.Items.Count > 0 Then
                ddl.SelectedIndex = CurrentPage - 1
            End If
            ddl.Visible = True

        Else
            nodatalbl2.Text = " Don't have a customer "
            nodatalbl2.Visible = True
            DropDownList2.Visible = False
            RemoveBtn.Visible = False
        End If


    End Sub
    Sub populateTree()
        ' create  root node
        Dim obj As New VLevelUserEmpDAL
        Dim arrUser As New List(Of VLevelUserEmp)
        arrUser = obj.getListALLVLevelUserEmp
        Session("arrUser") = arrUser

        Dim dalLevel As New ControllingLevelDAL
        Dim arrLevel As New List(Of ControllingLevel)
        arrLevel = dalLevel.getAllControllingLevel
        Session("arrLevel") = arrLevel


        Dim Rootnode As New TreeNode
        Rootnode.Text = level_name
        Rootnode.Value = level_id
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
                cnode.ImageUrl = "employee/picture/human.gif"
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
    'Sub bindRootTree()
    '    If EmpIDlbl.Text = "" Then
    '        Exit Sub
    '    End If
    '    Dim obj As New VLevelLeadEmpDAL
    '    Dim arr As New List(Of VLevelLeadEmp)
    '    arr = obj.getListVLevelLeadEmpByEmp_id(EmpIDlbl.Text)
    '    For i As Integer = 0 To arr.Count - 1

    '        Dim node As New TreeNode
    '        node.Text = arr(i).Level_Name
    '        node.Value = arr(i).Level_id
    '        node.PopulateOnDemand = True
    '        node.SelectAction = TreeNodeSelectAction.SelectExpand
    '        'Add the root to the TreeView
    '        LevelTree.Nodes.Add(node)

    '    Next

    'End Sub
    'Protected Sub TreeNodePopulate(ByVal sender As Object, ByVal e As TreeNodeEventArgs)
    '    fillLevel(e.Node)
    'End Sub
    'Sub fillLevel(ByVal Parant As TreeNode)
    '    ID = Parant.Value



    '    '  แสดง user ใน สาย
    '    Dim obj As New VLevelUserEmpDAL
    '    Dim arr As New List(Of VLevelUserEmp)
    '    arr = obj.getListVLevelUserEmpByRootID(ID)

    '    For i As Integer = 0 To arr.Count - 1
    '        Dim node As New TreeNode
    '        node.Text = arr(i).EMP_ID & ":" & arr(i).TITLE_NAME & arr(i).EMPNAME & "  " & arr(i).EMPSURNAME
    '        node.Value = arr(i).EMP_ID
    '        node.Collapse()
    '        Parant.ChildNodes.Add(node)
    '    Next
    '    'Dim l As String
    '    'For i As Integer = 0 To arr.Count - 1
    '    '    If l <> arr(i).LEVEL_ID Then
    '    '        l = arr(i).LEVEL_ID
    '    '        Dim node As New TreeNode
    '    '        node.Text = arr(i).LEVEL_NAME
    '    '        node.Value = arr(i).LEVEL_ID
    '    '        node.PopulateOnDemand = True
    '    '        Parant.ChildNodes.Add(node)
    '    '    End If
    '    'Next

    '    ' แสดงสายงาน
    '    Dim dalLevel As New ControllingLevelDAL
    '    Dim arrlevel As New List(Of ControllingLevel)
    '    arrlevel = dalLevel.getListControllingLevelByLevel_Root(ID)

    '    For i As Integer = 0 To arrlevel.Count - 1
    '        Dim node As New TreeNode
    '        node.Text = arrlevel(i).LEVEL_NAME
    '        node.Value = arrlevel(i).LEVEL_ID
    '        node.PopulateOnDemand = True
    '        Parant.ChildNodes.Add(node)
    '    Next


    'End Sub

    Protected Sub LevelTree_SelectedNodeChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles LevelTree.SelectedNodeChanged

        Dim emp_id = LevelTree.SelectedNode.Value
        Dim obj As New VLevelUserEmpDAL
        Dim arr As New List(Of VLevelUserEmp)
        arr = obj.getListVLevelUserEmpByEMP_ID(emp_id)
        If arr.Count > 0 Then
            level_namelbl.Text = "Customers in " & arr(0).LEVEL_NAME
            emplbl.Text = "ID:" & arr(0).EMP_ID & " " & arr(0).TITLE_NAME & arr(0).EMPNAME & " " & arr(0).EMPSURNAME
            bindCust(arr(0).EMP_ID)
        Else
            'Dim obj1 As New TbLevelDAL
            'Dim arr1 As New List(Of TbLevel)

            'arr1 = obj1.getListTbLevelByLevel_id(level_id)
            'If arr1.Count > 0 Then
            level_namelbl.Text = ""
            emplbl.Text = ""
            bindCust(0)
            'End If
        End If

    End Sub
    Protected Sub LevelCustGrid_PageIndexChanging(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewPageEventArgs) Handles LevelCustGrid.PageIndexChanging
        'LevelCustGrid.PageIndex = e.NewPageIndex
        'LevelCustGrid.DataSource = Session("cust")
        'LevelCustGrid.DataBind()
    End Sub
    Protected Sub CustRootGrid_PageIndexChanging(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewPageEventArgs) Handles CustRootGrid.PageIndexChanging
        'CustRootGrid.PageIndex = e.NewPageIndex
        'CustRootGrid.DataSource = Session("custroot")
        'CustRootGrid.DataBind()
    End Sub

    Protected Sub SendBtn_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles SendBtn.Click

        If LevelTree.SelectedValue = "" Then Exit Sub ' ถ้าไม่มีค่า level_id ให้หลุด
        Dim obj As New VLevelUserEmpDAL
        Dim arr As List(Of VLevelUserEmp)
        arr = obj.getListVLevelUserEmpByEMP_ID(LevelTree.SelectedNode.Value)

        If arr.Count < 1 Then Exit Sub '  ถ้าไม่มี  emp_id  ให้หลุด
        Dim Conn = ConnectionUtil.getSqlConnectionFromWebConfig()
        Dim i As Integer
        For i = 0 To CustRootGrid.Rows.Count - 1
            Dim row As GridViewRow = CustRootGrid.Rows(i)
            Dim isChecked As Boolean
            Dim CheckBox As CheckBox = row.FindControl("chkSelect")
            If CheckBox.Checked Then
                ' MsgBox(GridView1.Rows(i).Cells(1).Text)
                Dim sql As String = "update tb_risk_manage set assign_date=getdate(),risk_id=@risk_id where cif=@cif"
                Dim cmds As New SqlCommand(sql, Conn)
                cmds.Parameters.AddWithValue("@risk_id", arr(0).EMP_ID)
                cmds.Parameters.AddWithValue("@cif", CustRootGrid.Rows(i).Cells(1).Text)
                cmds.ExecuteNonQuery()
            End If
        Next
        bindCust(arr(0).EMP_ID)
        bindCustRoot()
    End Sub
    Protected Sub RemoveBtn_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles RemoveBtn.Click

        If EmpIDlbl.Text = "" Then Exit Sub ' ถ้าไม่มีค่า emp_id ให้หลุด
        If LevelCustGrid.Rows.Count < 1 Then Exit Sub
        Dim Conn = ConnectionUtil.getSqlConnectionFromWebConfig()
        Dim i As Integer
        For i = 0 To LevelCustGrid.Rows.Count - 1
            Dim row As GridViewRow = LevelCustGrid.Rows(i)
            Dim isChecked As Boolean
            Dim CheckBox As CheckBox = row.FindControl("chkSelect")
            If CheckBox.Checked Then
                ' MsgBox(GridView1.Rows(i).Cells(1).Text)
                Dim sql As String = "update tb_risk_manage set assign_date=getdate(),risk_id=@risk_id where cif=@cif"
                Dim cmds As New SqlCommand(sql, Conn)
                cmds.Parameters.AddWithValue("@risk_id", Trim(EmpIDlbl.Text))
                cmds.Parameters.AddWithValue("@cif", LevelCustGrid.Rows(i).Cells(1).Text)
                cmds.ExecuteNonQuery()
            End If
        Next
        Dim obj As New VLevelUserEmpDAL
        Dim arr As List(Of VLevelUserEmp)
        arr = obj.getListVLevelUserEmpByEMP_ID(LevelTree.SelectedNode.Value)
        If arr.Count > 0 Then
            bindCust(arr(0).EMP_ID)
            bindCustRoot()
        End If


    End Sub

    Protected Sub DropDownList1_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs)
        Dim index As Integer = CInt(sender.SelectedValue)
        Session("ddl1") = index - 1
        bindCustRoot(index)
    End Sub
    Protected Sub DropDownList2_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles DropDownList2.SelectedIndexChanged

        Dim index As Integer = CInt(sender.SelectedValue)
        Session("ddl2") = index - 1
        bindCust("", index)
    End Sub

End Class
