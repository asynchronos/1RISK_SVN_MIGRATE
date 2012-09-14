
Imports System.IO
Partial Class aspx_report_ReportAgingLCICustomerTdrNew
    Inherits System.Web.UI.Page

    Private Sub ExportData(ByVal _contentType As String, ByVal fileName As String)
        Response.ClearContent()
        Response.AddHeader("content-disposition", "attachment;filename=" + fileName)
        ' Response.Cache.SetCacheability(HttpCacheability.NoCache)
        HttpContext.Current.Response.AddHeader("Cache-Control", "") ' ทำให้ใช้ผ่าน ssl ได้
        Response.ContentType = _contentType
        Dim sw As New StringWriter()
        Dim htw As New HtmlTextWriter(sw)
        Dim frm As New HtmlForm()

        frm.Attributes("runat") = "server"
        frm.Controls.Add(GridView1)
        GridView1.AllowPaging = False
        GridView1.RenderControl(htw)
        Response.Write(sw.ToString())
        Response.End()

    End Sub

    Private Sub PrepareGridViewForExport(ByVal gv As Control)

        Dim lb As New LinkButton()
        Dim l As New Literal()
        Dim name As String = [String].Empty

        For i As Integer = 0 To gv.Controls.Count - 1
            'MsgBox(gv.Controls(i).GetType().ToString & ":" & GetType(LinkButtonControlBuilder).ToString)

            '  If gv.Controls(i).GetType().ToString = GetType(LinkButton).ToString Then
            If LCase(gv.Controls(i).GetType().ToString) = LCase("System.Web.UI.WebControls.DataControlLinkButton") Then
                l.Text = TryCast(gv.Controls(i), LinkButton).Text
                gv.Controls.Remove(gv.Controls(i))
                gv.Controls.AddAt(i, l)
            ElseIf gv.Controls(i).GetType() Is GetType(DropDownList) Then
                l.Text = TryCast(gv.Controls(i), DropDownList).SelectedItem.Text
                gv.Controls.Remove(gv.Controls(i))
                gv.Controls.AddAt(i, l)
            ElseIf gv.Controls(i).GetType() Is GetType(CheckBox) Then
                l.Text = If(TryCast(gv.Controls(i), CheckBox).Checked, "True", "False")
                gv.Controls.Remove(gv.Controls(i))
                gv.Controls.AddAt(i, l)
            End If
            If gv.Controls(i).HasControls() Then
                PrepareGridViewForExport(gv.Controls(i))
            End If
        Next
    End Sub


    Protected Sub ImageButton1_Click(ByVal sender As Object, ByVal e As System.Web.UI.ImageClickEventArgs) Handles ImageButton1.Click

        PrepareGridViewForExport(GridView1)
        ExportData("application/vnd.xls", "ReportLCItdr.xls")
    End Sub

    Protected Sub GridView1_PageIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles GridView1.PageIndexChanged
        FindData()
    End Sub


    Protected Sub GridView1_RowDataBound(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewRowEventArgs) Handles GridView1.RowDataBound
        If e.Row.RowType = DataControlRowType.DataRow Then
            Dim cif As String = e.Row.Cells(3).Text.Trim
            'Dim Sedw As String = Nothing
            'Sedw += "<a  href='#' onClick='window.open('../report/ReportEdwRiskMaxAgingDaily.aspx?cif=" & cif & "','pop', 'width=900, height=300,scrollbars=yes')'>" & cif & "</a>"
            'e.Row.Cells(3).Text = Sedw

            e.Row.Cells(3).Attributes.Add("onclick", " creditPopup = window.open('" + Page.ResolveUrl("../report/ReportEdwRiskMaxAgingDaily.aspx?cif=" & cif) + "','creditPopup','toolbar=No,width=800,height=550,resizable=yes,scrollbars=yes');" _
                                                 + " creditPopup.focus();")
            e.Row.Cells(3).Attributes.Add("tooltip", "แสดงภาระหนี้รายวันของ " & e.Row.Cells(4).Text.Trim)
            e.Row.Cells(3).Attributes.CssStyle("cursor") = "hand"
            e.Row.Cells(3).Attributes.CssStyle("text-decoration") = "underline"
        End If





    End Sub


    Protected Sub Page_PreRender(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.PreRender
        TreeSelectedLabel.Text = ControllingTree1.SelectedText
        Hidd_TreeSelectedEmpIds.Value = ControllingTree1.SelectedEmpIds
        Hidd_TreeSelectedValue.Value = ControllingTree1.SelectedValue
        Hidd_TreeSelectedValueType.Value = ControllingTree1.SelectedValueType
    End Sub

    Protected Sub ControllingTree1_Init(ByVal sender As Object, ByVal e As System.EventArgs) Handles ControllingTree1.Init
        DirectCast(sender, ControllingTree).EMP_ID_ROOT = User.Identity.Name
    End Sub

    Protected Sub ControllingTree1_SelectedNodeChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles ControllingTree1.SelectedNodeChanged
        Dim treeLine As ControllingTree = DirectCast(sender, ControllingTree)
        Hidd_TreeSelectedEmpIds.Value = treeLine.SelectedEmpIds
        Hidd_TreeSelectedValue.Value = treeLine.SelectedValue
        Hidd_TreeSelectedValueType.Value = treeLine.SelectedValueType
        '  MsgBox(Hidd_TreeSelectedEmpIds.Value)
        FindData()
    End Sub

    Sub FindData()

        Dim cri As String
        Dim emp_id As String
        Dim cri1 = 0.0
        Dim cri2 = 0.0

        cri = DropDownList1.Items(DropDownList1.SelectedIndex).Value

        If cri = "0" Then
            cri1 = 0.0
            cri2 = 0.08
        ElseIf cri = "1" Then
            cri1 = 0.07
            cri2 = 0.15
        ElseIf cri = "2" Then
            cri1 = 0.14
            cri2 = 1.01
        ElseIf cri = "3" Then
            cri1 = 1.0
            cri2 = 3.01
        ElseIf cri = "4" Then
            cri1 = 3.0
            cri2 = 200.0
        End If

        emp_id = Hidd_TreeSelectedEmpIds.Value
        If emp_id = "" Then
            emp_id = User.Identity.Name
        Else
            emp_id = Hidd_TreeSelectedEmpIds.Value
        End If
        SqlDataSource1.SelectParameters.Clear()
        SqlDataSource1.SelectParameters.Add("EMP_ID", emp_id)
        SqlDataSource1.SelectParameters.Add("StrCri1", cri1)
        SqlDataSource1.SelectParameters.Add("StrCri2", cri2)
        SqlDataSource1.SelectCommand = "REPORT_LCIDAILY_NEW"
        SqlDataSource1.SelectCommandType = SqlDataSourceCommandType.StoredProcedure
        DataBind()

    End Sub


    Protected Sub DropDownList1_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles DropDownList1.SelectedIndexChanged
        FindData()
    End Sub

    Protected Sub GridView1_Sorted(ByVal sender As Object, ByVal e As System.EventArgs) Handles GridView1.Sorted
        FindData()
    End Sub
End Class
