Imports System.IO
Partial Class aspx_form_FormData
    Inherits System.Web.UI.Page
    Dim ConnString = ConfigurationManager.ConnectionStrings("MISConnectionString").ToString
    Dim DataKey As String
    Dim mode As String

    Protected Sub form1_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles form1.Load
        If Page.IsPostBack = False Then
            showForm()
        End If

    End Sub

    Sub showForm()
        BtnClose.Attributes.Add("onclick", "window.close();")
        ' ดึงข้อมูลจาก TB_FORM  เพื่อที่จะดึงข้อมูลว่า form นี้ต้องดึงข้อมูลจากแหล่งไหน

        Dim FormID As Integer = 0
        Dim strForm As String = ""
        Dim QeueryKey As String = ""
        Dim QeueryKeyValue As String = ""
        Dim FormType As Integer = 0  '  type 1 ฟอร์มเลือกแล้วบันทึก , type2 ฟอร์มเพิ่มข้อมูลได้


        If Request("FormID") <> "" Then FormID = Request("FormID")

        Dim stringForm As String = " SELECT  *   FROM  TB_FORM"
        stringForm += " WHERE  FORM_ID= " & FormID
        Dim SqlForm As New SqlDataSource
        SqlForm.ConnectionString = ConnString
        SqlForm.SelectCommand = stringForm
        SqlForm.SelectCommandType = SqlDataSourceCommandType.Text
        Dim DvForm As New Data.DataView
        DvForm = CType(SqlForm.Select(DataSourceSelectArguments.Empty), Data.DataView)
        Dim DtForm As System.Data.DataTable = DvForm.Table
        If DtForm.Rows.Count >= 1 Then

            ' ดูว่ามีชื่อตารางหรือชื่อ view มั้ย ถ้าไม่มีให้ไปดึงจาก TB_SQL
            If Not IsDBNull(DtForm.Rows(0).Item("FORM_NAME")) Then
                LabelName.Text = DtForm.Rows(0).Item("FORM_NAME")
            End If
            If Not IsDBNull(DtForm.Rows(0).Item("FORM_DESC")) Then
                LabelDesc.Text = DtForm.Rows(0).Item("FORM_DESC")
            End If

            If Not IsDBNull(DtForm.Rows(0).Item("TB_SQL")) Then
                strForm = DtForm.Rows(0).Item("TB_SQL")
            End If

            If Not IsDBNull(DtForm.Rows(0).Item("TB_NAME_KEY")) Then
                DataKey = DtForm.Rows(0).Item("TB_NAME_KEY")
            End If

            ' กรณีที่ต้องการแสดงข้อมูลเฉพาะบุคคล
            ' หรือมีการส่ง query มาจากภายนอก

            If Not IsDBNull(DtForm.Rows(0).Item("TB_QUERY_KEY")) Then
                QeueryKey = DtForm.Rows(0).Item("TB_QUERY_KEY")
            End If
            If Not IsDBNull(DtForm.Rows(0).Item("TB_QUERY_KEY_VALUE")) Then
                QeueryKeyValue = DtForm.Rows(0).Item("TB_QUERY_KEY_VALUE")
            End If

            If Not IsDBNull(DtForm.Rows(0).Item("FORM_TYPE_ID")) Then
                FormType = DtForm.Rows(0).Item("FORM_TYPE_ID")
            End If



        End If
        SqlForm.Dispose()



        Try
            Dim SqlData As New SqlDataSource
            SqlData.ConnectionString = ConnString

            '  กรณีที่เป็น form แบบแก้ไขข้อมูล คือมีข้อมูลตั้งต้นและเลือกข้อมูลที่แก้ไข 

            If QeueryKey <> "" Then
                ' กำหนดให้รับ query key มาจาก request หรือ session
                ' เช่นส่ง ?emp_id=249987  ก็ต้องมีค่า  QeueryKey  ใน form นั้น =  emp_id
                If Request(QeueryKey) <> "" Then
                    strForm = strForm & " Where " & QeueryKey & "='" & Request(QeueryKey) & "'"
                    Response.Write("Filter data: " & Request(QeueryKey))
                ElseIf Session(QeueryKey) <> "" Then
                    strForm = strForm & " Where " & QeueryKey & "='" & Session(QeueryKey) & "'"
                    Response.Write("Filter data: " & Session(QeueryKey))
                Else
                    Response.Write("<script type='text/javascript'>alert('Don \'t  have your data or  time out expired. \n please login again.');window.close();</script>")
                End If
            End If

            SqlData.SelectCommandType = SqlDataSourceCommandType.StoredProcedure
            SqlData.SelectParameters.Add("form_id", FormID)

            Dim CommandStore As String = ""

            If mode = "all" Then  ' ถ้าเป็น mode นี้จะแสดงทุกฟิว แต่จะทำให้ grid ยาวมากตามจำนวนฟิว
                CommandStore = "GetDataByFormIDJoinDataTest"
            ElseIf mode = "" Then
                CommandStore = "GetDataByFormIDJoinData"
            End If

            If FormType = 2 Then  ' ถ้าเป็น type form เพิ่มข้อมูล

                CommandStore = "GetDataByFormIDForFormInsert"   ' store procedure นี้จะไม่ดึงตารางเริ่มต้น จะดึงส่วนที่เป็นข้อมูลที่กรอกเท่านั้น
                LabelInsert.Attributes.Add("onclick", " creditPopup = window.open('" + Page.ResolveUrl("formCreate.aspx?admin=true&formid=" & FormID) + "','Popup','toolbar=No,width=800,height=550,resizable=yes,scrollbars=yes');" _
                             + " creditPopup.focus();")
                LabelInsert.Attributes.CssStyle("cursor") = "hand"
                LabelInsert.Attributes.CssStyle("text-decoration") = "underline"
            Else
                LabelInsert.Visible = False
            End If

            ' MsgBox(FormType)

            SqlData.SelectCommand = CommandStore

            Response.Write("<div title='" & strForm & "'></div>")

            Dim DvData As New Data.DataView
            DvData = CType(SqlData.Select(DataSourceSelectArguments.Empty), Data.DataView)

            Dim DtData As System.Data.DataTable = DvData.Table

            'Response.Write("rows=" & DtData.Rows.Count)
            'Session("DvData") = DvData

            GridForm.DataSource = DvData
            GridForm.DataBind()

            SqlData.Dispose()
        Catch ex As Exception
            form1.Controls.Add(New LiteralControl(ex.Message))
        End Try


    
        SqlForm.Dispose()
    End Sub

    Protected Sub GridForm_PageIndexChanging(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewPageEventArgs) Handles GridForm.PageIndexChanging
        GridForm.PageIndex = e.NewPageIndex
        GridForm.DataBind()
    End Sub

    Protected Sub GridForm_RowCreated(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewRowEventArgs) Handles GridForm.RowCreated

    End Sub

    Protected Sub GridForm_RowDataBound(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewRowEventArgs) Handles GridForm.RowDataBound
        If e.Row.RowType = DataControlRowType.DataRow Then
            Dim dataid As String = e.Row.Cells(0).Text.Trim
            Dim formid As String = Request("formid")
            'Dim Sedw As String = Nothing
            'Sedw += "<a  href='#' onClick='window.open('../report/ReportEdwRiskMaxAgingDaily.aspx?cif=" & cif & "','pop', 'width=900, height=300,scrollbars=yes')'>" & cif & "</a>"
            'e.Row.Cells(3).Text = Sedw
            If Request("admin") = "true" Then
                e.Row.Cells(0).Attributes.Add("onclick", " creditPopup = window.open('" + Page.ResolveUrl("formCreate.aspx?admin=true&formid=" & formid & "&dataid=" & dataid) + "','Popup','toolbar=No,width=800,height=550,resizable=yes,scrollbars=yes');" _
                                             + " creditPopup.focus();")
            Else
                e.Row.Cells(0).Attributes.Add("onclick", " creditPopup = window.open('" + Page.ResolveUrl("formCreate.aspx?formid=" & formid & "&dataid=" & dataid) + "','Popup','toolbar=No,width=800,height=550,resizable=yes,scrollbars=yes');" _
                                             + " creditPopup.focus();")
            End If
            e.Row.Cells(0).Attributes.CssStyle("cursor") = "hand"
            e.Row.Cells(0).Attributes.CssStyle("text-decoration") = "underline"

            e.Row.Attributes.Add("OnMouseOver", "this.style.backgroundColor = 'lightblue';")
            If e.Row.RowState = DataControlRowState.Alternate Then
                Dim alColor As String = System.Drawing.ColorTranslator.ToHtml(GridForm.AlternatingRowStyle.BackColor)
                e.Row.Attributes.Add("OnMouseOut", "this.style.backgroundColor ='" & alColor & "'")
            Else
                Dim bkColor As String = System.Drawing.ColorTranslator.ToHtml(GridForm.RowStyle.BackColor)
                e.Row.Attributes.Add("OnMouseOut", "this.style.backgroundColor ='" & bkColor & "'")
            End If
        End If
    End Sub

    Protected Sub GridForm_Sorting(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewSortEventArgs) Handles GridForm.Sorting
        showForm()

        Dim newDirection As String
        newDirection = Session("SortDirection")

        If newDirection = String.Empty Or newDirection = "" Or newDirection = Nothing Then
            'Response.Write("null")
            Session("SortDirection") = "ASC"
        Else
            newDirection = ConvertSortDirection(newDirection)
            Session("SortDirection") = newDirection
        End If

        Dim dv As Data.DataView = GridForm.DataSource
        dv.Sort = e.SortExpression + " " + newDirection
        'Response.Write(dv.Sort)

        GridForm.DataSource = dv
        GridForm.DataBind()


    End Sub

    Function ConvertSortDirection(ByVal SortDirection As String) As String
        Dim newSortDirection As String = String.Empty
        Select Case SortDirection
            Case "ASC"
                newSortDirection = "DESC"
            Case "DESC"
                newSortDirection = "ASC"
        End Select
        Return newSortDirection
    End Function

    Private Sub ExportData(ByVal _contentType As String, ByVal fileName As String)
        Response.Clear()
        Response.Buffer = True
        Response.ClearContent()
        Response.Charset = "windows-874"
        Response.ContentEncoding = System.Text.Encoding.UTF8
        'Me.EnableViewState = False

        Response.AddHeader("content-disposition", "attachment;filename=" + fileName)
        'Response.Cache.SetCacheability(HttpCacheability.NoCache)
        HttpContext.Current.Response.AddHeader("Cache-Control", "") ' ทำให้ใช้ผ่าน ssl ได้
        Response.ContentType = _contentType

        Dim sw As New StringWriter()
        Dim htw As New HtmlTextWriter(sw)
        Dim frm As New HtmlForm()


        frm.Attributes("runat") = "server"
        frm.Controls.Add(GridForm)
        GridForm.RenderControl(htw)
        Response.Write("ข้อมูลจากระบบ ") ' ถ้าไม่มีประโยคนี้ จะแสดงเป็นภาษาที่อ่านไม่ออก
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
        mode = "all"
        showForm()
        PrepareGridViewForExport(GridForm)
        ExportData("application/vnd.xls", LabelName.Text & ".xls")
    End Sub

End Class
