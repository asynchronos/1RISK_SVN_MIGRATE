Imports System.Data
Imports Oracle.DataAccess.Client
Imports System.IO

Partial Class aspx_report_ReportCustomerCimHightRisk
    Inherits System.Web.UI.Page
    Dim objConn As OracleConnection
    Dim objCmd As OracleCommand
    Dim dtAdapter As OracleDataAdapter
    Dim strSQL As String


    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

        Dim strConnString As String
        strConnString = ConfigurationManager.ConnectionStrings("EDWConnectionstring").ToString
        objConn = New OracleConnection(strConnString)
        objConn.Open()
        If Not Page.IsPostBack() Then
            '  BindData()
        End If
    End Sub
    Sub BindData()
        CIFGridView.Columns(12).Visible = True
        Dim strCif As String
        If FilterDropDownList.Items(FilterDropDownList.SelectedIndex).Value = "ALL" Then
            strCif = ""
        Else
            strCif = CIFTextBox.Text
        End If

        Dim strTable = "smeteam.cif_high_risk_his"

        Dim strSQL As String = String.Empty
        'strSQL += "select  "
        'strSQL += "CASE   "
        'strSQL += "WHEN d1.out_prin  =  d2.out_prin THEN  'NOT CHANGE' "
        'strSQL += "WHEN d1.out_prin  >  d2.out_prin THEN  'NEW/ROLL' "
        'strSQL += "WHEN d1.out_prin  <  d2.out_prin THEN  'DECREASE' "
        'strSQL += "WHEN d2.asof_date is null  THEN 'NEW/ROLL' "
        'strSQL += "End "
        'strSQL += "Flag,"
        'strSQL += "d1.out_prin-nvl(d2.out_prin,0) amount,"
        'strSQL += "c.cif,c.name_e,"
        'strSQL += "d1.*,"
        'strSQL += "d2.asof_date asof_date_d2,d2.out_prin out_prin_d2,d2.out_accru out_accru_d2  "
        'strSQL += "from ("
        'strSQL += "select cif,name_e from CIF_HIGH_RISK    "
        'strSQL += ")  c    "
        'strSQL += " left outer join "
        'strSQL += "( "
        'strSQL += "select cif_no,cif_name,APPL_ID,GL_CODE,ACCT,CONT,SEQ_NO,due_date,issu_date,out_prin,out_accru,asof_date "
        'strSQL += "from " & strTable & " t  "
        'strSQL += "where  (select to_char(to_date(max(asof_date),'YYYY-MM-DD'),'YYYY-MM-DD') from " & strTable & ")= asof_date "
        'strSQL += ") d1 "
        'strSQL += "on c.cif=d1.cif_no "
        'strSQL += " left outer join "
        'strSQL += "( "
        'strSQL += "select ASOF_DATE,cif_no,APPL_ID,GL_CODE,ACCT,CONT,SEQ_NO,due_date,issu_date,out_prin , out_accru   "
        'strSQL += "from " & strTable & "  t  "
        'strSQL += "where  (select to_char(to_date(max(asof_date),'YYYY-MM-DD')-1,'YYYY-MM-DD') from " & strTable & ")= asof_date "
        'strSQL += ") d2 "
        'strSQL += "on  d1.cif_no = d2.cif_no   "
        'strSQL += "and d1.gl_code= d2.gl_code "
        'strSQL += "and d1.acct   = d2.acct "
        'strSQL += "and d1.cont   = d2.cont "
        'strSQL += "and d1.seq_no = d2.seq_no "
        'strSQL += "where  d1.appl_id in ('ALS','PNS') "
        'If strCif = "" Then
        '    strSQL += ""
        'Else
        '    strSQL += " and  c.cif=" & strCif
        'End If
        'strSQL += " and d1.out_prin + d1.out_accru + d2.out_prin + d2.out_accru > 0"

        strSQL += " WITH"
        strSQL += " dte as ("
        strSQL += " select to_date(max(z.asof_date),'yyyy-mm-dd') mx_date from dwhadmin.lci_daily z"
        strSQL += "        ),"
        strSQL += " inp as ("
        strSQL += " select TO_CHAR(mx_date -(rownum-1), 'YYYY-MM-DD') currdte from dte connect by rownum<=2"
        strSQL += " ),"
        ' strSQL += " --inp as (select TO_CHAR(trunc(sysdate-(rownum-1)), 'YYYY-MM-DD') currdte from dual connect by rownum<=2),"
        strSQL += " q AS   ("
        strSQL += " select /*+parallel(a,2)*/"
        strSQL += " a.cif_no, a.cif_name, a.APPL_ID, a.GL_CODE, a.ACCT, a.CONT, a.SEQ_NO"
        strSQL += " , a.cif_no||a.cif_name||a.APPL_ID||a.GL_CODE||a.ACCT||a.CONT||a.SEQ_NO wd1"
        strSQL += " , a.due_date"
        strSQL += " , a.issu_date"
        strSQL += " , a.limit_value_app"
        strSQL += " , a.out_prin"
        strSQL += " , a.out_accru"
        strSQL += " , asof_date"
        strSQL += " , h.name_e "
        strSQL += " from dwhadmin.lci_daily a  "
        strSQL += " inner join smeteam.cif_high_risk h"
        strSQL += " on a.cif_no = h.cif"
        strSQL += " where "
        strSQL += " a.appl_id in ('ALS','PNS')"
        strSQL += " and a.asof_date in (select currdte from inp)"
        strSQL += " ),"
        strSQL += " q1 as   ("
        strSQL += " select a.cif_no,a.cif_name,a.name_e,a.APPL_ID,a.GL_CODE,a.ACCT,a.CONT,a.SEQ_NO"
        strSQL += " , a.due_date"
        'strSQL += " --, lead(a.due_date) over (partition by wd1 order by a.asof_date desc) yd_due_date"
        strSQL += " , a.issu_date"
        'strSQL += " --, lead(a.issu_date) over (partition by wd1 order by a.asof_date desc) yd_issu_date"
        strSQL += " , a.out_prin"
        strSQL += " , a.limit_value_app"
        strSQL += " , lead(a.out_prin) over (partition by wd1 order by a.asof_date desc) yd_out_prin"
        strSQL += " , a.out_accru"
        strSQL += " , lead(a.out_accru) over (partition by wd1 order by a.asof_date desc) yd_out_accru"
        strSQL += " , asof_date"
        strSQL += " , lead(a.asof_date) over (partition by wd1 order by a.asof_date desc) yd_asof_date"
        strSQL += " , row_number() over (partition by wd1 order by a.asof_date desc) rn"
        strSQL += " from q A"
        strSQL += " )"
        strSQL += " "
        'strSQL += " --Main"
        strSQL += " select"
        strSQL += " case"
        strSQL += " when q1.out_prin = q1.yd_out_prin then 'NOT CHANGE'"
        strSQL += " when q1.out_prin > q1.yd_out_prin then 'NEW/ROLL'"
        strSQL += " when q1.out_prin < q1.yd_out_prin then 'DECREASE'"
        strSQL += " when q1.yd_asof_date is null      then 'NEW/ROLL'"
        strSQL += " end flag,"
        strSQL += " (q1.out_prin-q1.yd_out_prin) amt,"
        strSQL += " q1.*"
        strSQL += " from q1"
        strSQL += " where rn = 1"
        If strCif = "" Then
            strSQL += ""
        Else
            strSQL += " and  q1.cif_no=" & strCif
        End If
        strSQL += " and q1.out_prin > 0 and q1.yd_out_prin > 0 and q1.out_accru > 0 and q1.yd_out_accru > 0"
        strSQL += " order by q1.cif_no,q1.APPL_ID, q1.ACCT,q1.SEQ_NO"

        ' Response.Write(strSQL)
        Dim ds = New DataSet()

        objCmd = New OracleCommand(strSQL, objConn)
        dtAdapter = New OracleDataAdapter

        objCmd.Connection = objConn
        objCmd.CommandText = strSQL
        objCmd.CommandType = CommandType.Text

        dtAdapter.SelectCommand = objCmd
        dtAdapter.Fill(ds)

        dtAdapter = Nothing

        '*** BindData to GridView ***'   
        CIFGridView.DataSource = ds
        CIFGridView.DataBind()

    End Sub

    Protected Sub CIFGridView_DataBound(ByVal sender As Object, ByVal e As System.EventArgs) Handles CIFGridView.DataBound
        If CIFGridView.Rows.Count > 1 Then
            ExcellExport.Visible = True
            ASOFLabel.Text = "Date : " & CIFGridView.Rows(1).Cells(12).Text
            CIFGridView.Columns(12).Visible = False
        Else
            ExcellExport.Visible = False
        End If
    End Sub

    Protected Sub CIFGridView_RowDataBound(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewRowEventArgs) Handles CIFGridView.RowDataBound
        If e.Row.RowType = DataControlRowType.DataRow Then
            ' Response.Write(e.Row.Cells(0).Text)
            If e.Row.Cells(0).Text <> "NOT CHANGE" Then
                e.Row.BackColor = Drawing.Color.YellowGreen
            End If
        End If

    End Sub

    Protected Sub CIFGridView_Sorting(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewSortEventArgs) Handles CIFGridView.Sorting
        BindData()
        Dim newDirection As String
        newDirection = Session("SortDirection")

        If newDirection = String.Empty Or newDirection = "" Or newDirection = Nothing Then
            'Response.Write("null")
            Session("SortDirection") = "ASC"
        Else
            newDirection = ConvertSortDirection(newDirection)
            Session("SortDirection") = newDirection
        End If

        Dim dView = CIFGridView.DataSource.Tables(0).DefaultView
        Dim dv As Data.DataView = dView
        dv.Sort = e.SortExpression + " " + newDirection
        'Response.Write(dv.Sort)

        CIFGridView.DataSource = dv
        CIFGridView.DataBind()

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

    Protected Sub SearchButton_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles SearchButton.Click
        BindData()
    End Sub

    Protected Sub FilterDropDownList_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles FilterDropDownList.SelectedIndexChanged
        If FilterDropDownList.Items(FilterDropDownList.SelectedIndex).Value = "ALL" Then
            CIFTextBox.Visible = False
            SearchButton.Visible = False
            BindData()
        Else
            CIFTextBox.Visible = True
            SearchButton.Visible = True
        End If

    End Sub

    Private Sub ExportData(ByVal _contentType As String, ByVal fileName As String)

        Response.ClearHeaders()
        Response.ContentType = _contentType
        'Response.AddHeader("Cache-control", "no-cache")
        HttpContext.Current.Response.AddHeader("Cache-Control", "")
        Response.AppendHeader("content-disposition", "attachment;filename=" + fileName)

        Dim sw As New StringWriter()
        Dim htw As New HtmlTextWriter(sw)
        Dim frm As New HtmlForm()


        frm.Attributes("runat") = "server"
        frm.Controls.Add(CIFGridView)
        CIFGridView.RenderControl(htw)
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

        PrepareGridViewForExport(CIFGridView)
        ExportData("application/vnd.xls", "ReportCreditByCustomer.xls")
    End Sub

    Protected Sub CIFGridView_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles CIFGridView.SelectedIndexChanged

    End Sub
End Class
