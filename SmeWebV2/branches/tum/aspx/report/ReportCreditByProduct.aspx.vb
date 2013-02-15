'  สิ่งที่ต้องทำเมื่อ หน้านี้ ( รายงาน ) ต้องการแสดงฟิวเพิ่ม
'  1.  เพิ่มฟิวใน view  เริ่มต้น  v_Credit_Account_Process
'  2.  เพิ่มฟิวใน view   V_Report_Product  ( ฟิวในรายงานขึ้นอยู่กับการแสดงฟิวใน view นี้ )
'  3.  ทดลองรัน store procedure     CreateTempReport_ByCreditApproveSelectGroupRegionEmpLevel  เพื่อสร้าง temp ข้อมูล
'  4.  report นี้จะ run ด้วย store procedure   ReportByCreditApproveSelectGroupRegionEmpLevel
'  5.  เพิ่มฟิว แสดงในหน้า  ReportCreditByProduct.aspx 
'  6.   เพิ่มจำนวนตัวเลขใน  GridView1_RowCreated   ตรงคำสั่ง   For i As Integer = 0 To 42  ' ถ้าเพิ่มฟิวมาเพิ่มจำนวนตรงนี้ด้วย

Option Explicit On
Option Strict On

Imports System.Globalization
Imports System.Data.SqlClient
Imports System.Data
Imports System.IO
Partial Class aspx_report_ReportCreditByProduct
    Inherits System.Web.UI.Page
    'Protected cul As New CultureInfo("th-TH") ' ปี ไทย  
    Protected cul As New CultureInfo("en-US") ' ปี eng
    Dim intC, int11, int12, int13, int14, int15, int16 As New Double
    Dim int17, int18, int19, int20, int21, int22, int23, int24, int25, int26, int27, int28, int29, int30, int31, int32, int33 As Double
    Dim m As String = Nothing


    Protected Sub GridView1_RowCreated(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewRowEventArgs) Handles GridView1.RowCreated
        If (e.Row.RowType = DataControlRowType.Header) Then

            '//Build custom header.
            'GridView oGridView = (GridView)sender;
            Dim oGridView As GridView = DirectCast(sender, GridView)
            ' GridViewRow oGridViewRow = new GridViewRow(0, 0, DataControlRowType.Header, DataControlRowState.Insert);
            Dim oGridViewRow As GridViewRow = New GridViewRow(0, 0, DataControlRowType.Header, DataControlRowState.Insert)
            'Dim oGridViewRowOld As GridViewRow = oGridView.Rows(0)
            'TableCell oTableCell = new TableCell();
            Dim oTableCell As TableCell = Nothing
            For i As Integer = 0 To e.Row.Cells.Count - 1
                oTableCell = New TableCell()
                ' oTableCell.Text = e.Row.Cells(i).Text
                oTableCell.Text = e.Row.Cells(i).Text
                oGridViewRow.Cells.Add(oTableCell)
            Next i

            oGridView.Controls(0).Controls.Add(oGridViewRow)

            For i As Integer = 0 To 43  ' ถ้าเพิ่มฟิวมาเพิ่มจำนวนตรงนี้ด้วย
                If i >= 0 And i < 12 Then
                    e.Row.Cells.RemoveAt(0)
                    oGridViewRow.Cells(i).RowSpan = 2
                End If
                If i = 12 Or (i > 15 And i < 22) Then
                    oGridViewRow.Cells(i).ColumnSpan = 2
                    oGridViewRow.Style.Add("text-align", "center")
                    oGridViewRow.Cells.RemoveAt(i + 1)
                End If
                If i = 13 Or i = 14 Or i = 15 Then
                    e.Row.Cells.RemoveAt(2)
                    oGridViewRow.Cells(i).RowSpan = 2
                End If
                If i >= 22 Then
                    e.Row.Cells.RemoveAt(e.Row.Cells.Count - 1)
                    oGridViewRow.Cells(i).RowSpan = 2
                End If

            Next



            'e.Row.Cells(12).Text = e.Row.Cells(12).Text
            'oGridViewRow.Cells(12).ColumnSpan = 2
            oGridViewRow.Cells(12).Text = "Type"
            e.Row.Cells(2).Text = "+"
            e.Row.Cells(3).Text = "-"
            e.Row.Cells(4).Text = "+"
            e.Row.Cells(5).Text = "-"
            e.Row.Cells(6).Text = "+"
            e.Row.Cells(7).Text = "-"
            e.Row.Cells(8).Text = "+"
            e.Row.Cells(9).Text = "-"
            e.Row.Cells(10).Text = "+"
            e.Row.Cells(11).Text = "-"
            e.Row.Cells(12).Text = "+"
            e.Row.Cells(13).Text = "-"

        End If
    End Sub

    Protected Sub GridView1_RowDataBound(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewRowEventArgs) Handles GridView1.RowDataBound

        '  Select(1) |ID(2)| REG-DATE(3) | APP-DATE(4) | CIF(5) |CUSTOMER(5) | EMP-ID(6) |EMPLOYEE(7) |BRANCH-ID(8) BRANCH-NAME(9) REGION-ID(10) REGION-NAME(11)  
        'NEW(12) OLD(13) REVIEW(14) EXCEPTION(15) O-D (O-D) F-L (F-L) L-G (L-G) STL-PN (STL-PN) TRADE-FIN (TRADE-FIN) OTHERS (OTHERS) 
        If e.Row.RowType = DataControlRowType.Header Then

        ElseIf e.Row.RowType = DataControlRowType.DataRow Then


            'If User.Identity.Name = e.Row.Cells(6).Text Or User.Identity.Name = "000001" Then
            e.Row.Cells(0).Attributes.Add("onclick", " creditPopup = window.open('" + Page.ResolveUrl("~/aspx/annals/annalscredit.aspx") + "?annals_id=" + e.Row.Cells(1).Text + "','creditPopup','toolbar=No,width=650,height=550,resizable=yes,scrollbars=yes');" _
                                                    + " creditPopup.focus();")
            'Else
            '   e.Row.Cells(0).Text = ""
            'End If
            intC += 1
            If e.Row.Cells(12).Text = "1" Then int12 += 1
            If e.Row.Cells(13).Text = "1" Then int13 += 1
            If e.Row.Cells(14).Text = "1" Then int14 += 1
            If e.Row.Cells(15).Text = "1" Then int15 += 1
            If e.Row.Cells(16).Text = "1" Then int16 += 1


            int17 += CDbl(e.Row.Cells(17).Text)
            int18 += CDbl(e.Row.Cells(18).Text)
            int19 += CDbl(e.Row.Cells(19).Text)
            int20 += CDbl(e.Row.Cells(20).Text)
            int21 += CDbl(e.Row.Cells(21).Text)
            int22 += CDbl(e.Row.Cells(22).Text)
            int23 += CDbl(e.Row.Cells(23).Text)
            int24 += CDbl(e.Row.Cells(24).Text)
            int25 += CDbl(e.Row.Cells(25).Text)
            int26 += CDbl(e.Row.Cells(26).Text)
            int27 += CDbl(e.Row.Cells(27).Text)
            int28 += CDbl(e.Row.Cells(28).Text)
            int29 += CDbl(e.Row.Cells(29).Text)
            int30 += CDbl(e.Row.Cells(30).Text)
            int31 += CDbl(e.Row.Cells(31).Text)
            int32 += CDbl(e.Row.Cells(32).Text)
            int33 += CDbl(e.Row.Cells(33).Text)

            ' Dim unitsInStock As Int16 = Convert.ToInt32(System.Web.UI.DataBinder.Eval(e.Row.DataItem, "UnitsInStock"))
            Dim CheckF As Boolean = False ' ตรวจสอบว่ามีการใส่ค่า Approve value หรือไม่

            For i As Integer = 17 To 28
                If CDbl(e.Row.Cells(i).Text) <> 0 Then
                    CheckF = True
                End If
                If e.Row.Cells(14).Text = "1" Then CheckF = True
                If e.Row.Cells(15).Text = "1" Then CheckF = True
            Next

            If CheckF = False Then
                e.Row.BackColor = System.Drawing.Color.Pink
                '// highlight the row that the mouse is over
                '// save the original attribute in a custom attribute
                '// so that you can restore it later
            End If
            'e.Row.Attributes.Add("onmouseover", "this.originalcolor=this.style.backgroundColor;" + " this.style.backgroundColor='Silver';")
            'e.Row.Attributes.Add("onmouseout", "this.style.backgroundColor=this.originalcolor;")
            e.Row.Attributes.Add("onclick", "this.originalcolor=this.style.backgroundColor;" + " this.style.backgroundColor='Silver';")
            'e.Row.Attributes.Add("onDblClick", "this.style.backgroundColor=this.originalcolor;alert(this.originalcolor);")

        ElseIf e.Row.RowType = DataControlRowType.Footer Then

            e.Row.Cells(5).Text = "Total ( " & intC.ToString & ")"
            e.Row.Cells(12).Text = int12.ToString
            e.Row.Cells(13).Text = int13.ToString
            e.Row.Cells(14).Text = int14.ToString
            e.Row.Cells(15).Text = int15.ToString
            e.Row.Cells(16).Text = int16.ToString

            e.Row.Cells(17).Text = FormatNumber(int17.ToString, 0)
            e.Row.Cells(18).Text = FormatNumber(int18.ToString, 0)
            e.Row.Cells(19).Text = FormatNumber(int19.ToString, 0)
            e.Row.Cells(20).Text = FormatNumber(int20.ToString, 0)
            e.Row.Cells(21).Text = FormatNumber(int21.ToString, 0)
            e.Row.Cells(22).Text = FormatNumber(int22.ToString, 0)
            e.Row.Cells(23).Text = FormatNumber(int23.ToString, 0)
            e.Row.Cells(24).Text = FormatNumber(int24.ToString, 0)
            e.Row.Cells(25).Text = FormatNumber(int25.ToString, 0)
            e.Row.Cells(26).Text = FormatNumber(int26.ToString, 0)
            e.Row.Cells(27).Text = FormatNumber(int27.ToString, 0)
            e.Row.Cells(28).Text = FormatNumber(int28.ToString, 0)
            e.Row.Cells(29).Text = FormatNumber(int29.ToString, 0)
            e.Row.Cells(30).Text = FormatNumber(int30.ToString, 0)
            e.Row.Cells(31).Text = FormatNumber(int31.ToString, 0)
            e.Row.Cells(32).Text = FormatNumber(int32.ToString, 0)
            e.Row.Cells(33).Text = FormatNumber(int33.ToString, 0)


        End If

    End Sub

    Private Sub ExportData(ByVal _contentType As String, ByVal fileName As String)
        Response.ClearContent()
        Response.AddHeader("content-disposition", "attachment;filename=" + fileName)
        ' Response.Cache.SetCacheability(HttpCacheability.NoCache)
        HttpContext.Current.Response.AddHeader("Cache-Control", "")
        Response.ContentType = _contentType



        Dim sw As New StringWriter()
        Dim htw As New HtmlTextWriter(sw)
        Dim frm As New HtmlForm()


        frm.Attributes("runat") = "server"
        frm.Controls.Add(GridView1)
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
        ExportData("application/vnd.xls", "ReportCreditByProduct.xls")
    End Sub


    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

    End Sub
End Class
