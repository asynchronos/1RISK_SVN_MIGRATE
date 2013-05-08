Imports System.Data
Imports System.Data.OracleClient

Partial Class ReportEdwRiskMaxAgingDaily
    Inherits System.Web.UI.Page

    Protected Sub FormView1_DataBound(ByVal sender As Object, ByVal e As System.EventArgs) Handles FormView1.DataBound

        Dim TDRLabel As Label = FormView1.FindControl("TDRLabel")
        If Not TDRLabel Is Nothing Then  ' ถ้ามีข้อมูลแสดงว่ามีการ bind ค่าแล้ว
            If TDRLabel.Text = "T" Then
                TDRLabel.Text = "Yes"
            End If
            If TDRLabel.Text = "F" Then
                TDRLabel.Text = "No"
            End If

            Dim CUS_FIRST As Label = DirectCast(FormView1.Row.FindControl("CUS_FIRST"), Label)
            Session("name") = CUS_FIRST.Text
            Dim CUS_LAST As Label = DirectCast(FormView1.Row.FindControl("CUS_LAST"), Label)
            Session("lastname") = CUS_LAST.Text
            If Session("lastname") = "" Then
                Session("lastname") = "%"
            End If

            ' 60 วัน
            Dim MAX_AGING_HIST_60DAYLabel As Label = DirectCast(FormView1.Row.FindControl("MAX_AGING_HIST"), Label)
            MAX_AGING_HIST_60DAYLabel.Text = FormatAgingHist(MAX_AGING_HIST_60DAYLabel.Text)
            Dim OD_AGING_HIST As Label = DirectCast(FormView1.Row.FindControl("OD_AGING_HIST"), Label)
            OD_AGING_HIST.Text = FormatAgingHist(OD_AGING_HIST.Text)
            Dim PN_AGING_HIST As Label = DirectCast(FormView1.Row.FindControl("PN_AGING_HIST"), Label)
            PN_AGING_HIST.Text = FormatAgingHist(PN_AGING_HIST.Text)
            Dim TL_COM_AGING_HIST As Label = DirectCast(FormView1.Row.FindControl("TL_COM_AGING_HIST"), Label)
            TL_COM_AGING_HIST.Text = FormatAgingHist(TL_COM_AGING_HIST.Text)
            Dim TL_HL_AGING_HIST As Label = DirectCast(FormView1.Row.FindControl("TL_HL_AGING_HIST"), Label)
            TL_HL_AGING_HIST.Text = FormatAgingHist(TL_HL_AGING_HIST.Text)
            Dim TRADE_AGING_HIST As Label = DirectCast(FormView1.Row.FindControl("TRADE_AGING_HIST"), Label)
            TRADE_AGING_HIST.Text = FormatAgingHist(TRADE_AGING_HIST.Text)
            Dim BD_AGING_HIST As Label = DirectCast(FormView1.Row.FindControl("BD_AGING_HIST"), Label)
            BD_AGING_HIST.Text = FormatAgingHist(BD_AGING_HIST.Text)
            Dim CLAIM_AGING_HIST As Label = DirectCast(FormView1.Row.FindControl("CLAIM_AGING_HIST"), Label)
            CLAIM_AGING_HIST.Text = FormatAgingHist(CLAIM_AGING_HIST.Text)
            Dim FNX_AGING_HIST As Label = DirectCast(FormView1.Row.FindControl("FNX_AGING_HIST"), Label)
            FNX_AGING_HIST.Text = FormatAgingHist(FNX_AGING_HIST.Text)

            ' 24 เดือน
            Dim class_hLabel As Label = DirectCast(FormView1.Row.FindControl("class_hLabel"), Label)
            class_hLabel.Text = FormatAgingHist(class_hLabel.Text)

            Dim M_OD_MAX_AGING_HIST_24M As Label = DirectCast(FormView1.Row.FindControl("M_OD_MAX_AGING_HIST_24M"), Label)
            M_OD_MAX_AGING_HIST_24M.Text = FormatAgingHist(M_OD_MAX_AGING_HIST_24M.Text)

            Dim M_PN_MAX_AGING_HIST_24M As Label = DirectCast(FormView1.Row.FindControl("M_PN_MAX_AGING_HIST_24M"), Label)
            M_PN_MAX_AGING_HIST_24M.Text = FormatAgingHist(M_PN_MAX_AGING_HIST_24M.Text)

            Dim M_TL_COM_MAX_AGING_HIST_24M As Label = DirectCast(FormView1.Row.FindControl("M_TL_COM_MAX_AGING_HIST_24M"), Label)
            M_TL_COM_MAX_AGING_HIST_24M.Text = FormatAgingHist(M_TL_COM_MAX_AGING_HIST_24M.Text)

            Dim M_TL_HL_PL_STF_MAX_AGING_24M As Label = DirectCast(FormView1.Row.FindControl("M_TL_HL_PL_STF_MAX_AGING_24M"), Label)
            M_TL_HL_PL_STF_MAX_AGING_24M.Text = FormatAgingHist(M_TL_HL_PL_STF_MAX_AGING_24M.Text)

            Dim M_TRADE_MAX_AGING_HIST_24M As Label = DirectCast(FormView1.Row.FindControl("M_TRADE_MAX_AGING_HIST_24M"), Label)
            M_TRADE_MAX_AGING_HIST_24M.Text = FormatAgingHist(M_TRADE_MAX_AGING_HIST_24M.Text)

            Dim M_BD_MAX_AGING_HIST_24M As Label = DirectCast(FormView1.Row.FindControl("M_BD_MAX_AGING_HIST_24M"), Label)
            M_BD_MAX_AGING_HIST_24M.Text = FormatAgingHist(M_BD_MAX_AGING_HIST_24M.Text)

            Dim M_CLAIM_MAX_AGING_HIST_24M As Label = DirectCast(FormView1.Row.FindControl("M_CLAIM_MAX_AGING_HIST_24M"), Label)
            M_CLAIM_MAX_AGING_HIST_24M.Text = FormatAgingHist(M_CLAIM_MAX_AGING_HIST_24M.Text)

            Dim M_FNX_MAX_AGING_HIST_24M As Label = DirectCast(FormView1.Row.FindControl("M_FNX_MAX_AGING_HIST_24M"), Label)
            M_FNX_MAX_AGING_HIST_24M.Text = FormatAgingHist(M_FNX_MAX_AGING_HIST_24M.Text)

            Dim M_MAX_AGING_HIST_24M As Label = DirectCast(FormView1.Row.FindControl("M_MAX_AGING_HIST_24M"), Label)
            M_MAX_AGING_HIST_24M.Text = FormatAgingHist(M_MAX_AGING_HIST_24M.Text)

            ' ทำการกำหนดให้ค่าว่าง เป็นคำว่าไม่พบข้อมูล
            Dim LabelTDR_COUNT As Label = DirectCast(FormView1.Row.FindControl("LabelTDR_COUNT"), Label)
            Dim LabelTDRDay As Label = DirectCast(FormView1.Row.FindControl("LabelTDRDay"), Label)
            Dim LabelDateCutOFF As Label = DirectCast(FormView1.Row.FindControl("LabelDateCutOFF"), Label)
            Dim LabelClass_Before As Label = DirectCast(FormView1.Row.FindControl("LabelClass_Before"), Label)
            Dim LabelClass_After As Label = DirectCast(FormView1.Row.FindControl("LabelClass_After"), Label)
            Dim LabelCLineS As Label = DirectCast(FormView1.Row.FindControl("LabelCLineS"), Label)
            Dim LabelBR2_Name As Label = DirectCast(FormView1.Row.FindControl("LabelBR2_Name"), Label)
            Dim LabelC3_New As Label = DirectCast(FormView1.Row.FindControl("LabelC3_New"), Label)
            Dim LabelC33 As Label = DirectCast(FormView1.Row.FindControl("LabelC33"), Label)
            Dim LabelC4_New As Label = DirectCast(FormView1.Row.FindControl("LabelC4_New"), Label)
            Dim LabelC44 As Label = DirectCast(FormView1.Row.FindControl("LabelC44"), Label)
            Dim LabelFUND As Label = DirectCast(FormView1.Row.FindControl("LabelFUND"), Label)
            Dim LabelChar2 As Label = DirectCast(FormView1.Row.FindControl("LabelChar2"), Label)
            Dim LabelNou As Label = DirectCast(FormView1.Row.FindControl("LabelNou"), Label)
            Dim LabelDara As Label = DirectCast(FormView1.Row.FindControl("LabelDara"), Label)
            Dim strnull As String = "ไม่พบข้อมูล"
            If LabelTDR_COUNT.Text = "" Then LabelTDR_COUNT.Text = strnull
            If LabelTDRDay.Text = "//" Then LabelTDRDay.Text = strnull
            If LabelDateCutOFF.Text = "" Then LabelDateCutOFF.Text = strnull
            If LabelClass_Before.Text = "" Then LabelClass_Before.Text = strnull
            If LabelClass_After.Text = "" Then LabelClass_After.Text = strnull
            If LabelCLineS.Text = "" Then LabelCLineS.Text = strnull
            If LabelBR2_Name.Text = "" Then LabelBR2_Name.Text = strnull
            If LabelC3_New.Text = "" Then LabelC3_New.Text = strnull
            If LabelC33.Text = "" Then LabelC33.Text = strnull
            If LabelC4_New.Text = "" Then LabelC4_New.Text = strnull
            If LabelC44.Text = "" Then LabelC44.Text = strnull
            If LabelFUND.Text = "" Then LabelFUND.Text = strnull
            If LabelChar2.Text = "" Then LabelChar2.Text = strnull
            If LabelNou.Text = "" Then LabelNou.Text = strnull
            If LabelDara.Text = "" Then LabelDara.Text = strnull

        End If


        '' เนื่องจากต้องการ format  data  aging history ให้อยู่ในรูป 10 วัน- 10 วัน - 10 วัน


    End Sub
    Function FormatAgingHist(ByVal str As String) As String
        Dim newStr As String = Nothing
        If str = "" Then
            newStr = "ไม่พบข้อมูล"
            Return newStr
        End If

        newStr += str.Substring(0, 10) & "-"
        newStr += str.Substring(10, 10) & "-"
        If str.Length > 30 Then
            newStr += str.Substring(20, 10) & "-"
            newStr += str.Substring(30, 10) & "-"
            newStr += str.Substring(40, 10) & "-"
            newStr += str.Substring(50, 10)
        Else
            newStr += str.Substring(20, 4)
        End If
        'newStr += "<span class='g1'>" & str.Substring(0, 10) & "</span>-"
        'newStr += "<span class='g2'>" & str.Substring(10, 10) & "</span>-"
        'If str.Length > 30 Then
        '    newStr += "<span class='g3'>" & str.Substring(20, 10) & "</span>-"
        '    newStr += "<span class='g4'>" & str.Substring(30, 10) & "</span>-"
        '    newStr += "<span class='g5'>" & str.Substring(40, 10) & "</span>-"
        '    newStr += "<span class='g6'>" & str.Substring(50, 10) & "</span>"
        'Else
        '    newStr += "<span class='g3'>" & str.Substring(20, 4) & "</span>"
        'End If


        newStr = newStr.Replace("0", "<span class='AH0'>0</span>")
        newStr = newStr.Replace("1", "<span class='AH0'>1</span>")
        newStr = newStr.Replace("2", "<span class='AH0'>2</span>")
        newStr = newStr.Replace("3", "<span class='AH1'>3</span>")
        newStr = newStr.Replace("4", "<span class='AH1'>4</span>")
        newStr = newStr.Replace("5", "<span class='AH1'>5</span>")
        newStr = newStr.Replace("6", "<span class='AH1'>6</span>")
        newStr = newStr.Replace("7", "<span class='AH2'>7</span>")
        newStr = newStr.Replace("8", "<span class='AH2'>8</span>")
        newStr = newStr.Replace("9", "<span class='AH2'>9</span>")

        Return newStr
    End Function


    Protected Sub Page_LoadComplete(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.LoadComplete
        If Request.QueryString("cif") <> "" Then
            'getALSdataFromWH(Request.QueryString("cif"))
            tbcif.Text = Request.QueryString("cif")

            ashowalscom.Visible = True
            PanelALSCOM.Visible = True

            PanelBlackList.Visible = True
        Else

            ashowalscom.Visible = False
            PanelALSCOM.Visible = False

            PanelBlackList.Visible = False
        End If
    End Sub
    'Protected Sub SqlDataSourceRISK_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles SqlDataSourceRISK.Load
    '    'If Request.QueryString("cif") = "" Then
    '    '    SqlDataSourceRISK.SelectCommand = ""
    '    'Else
    '    ' SqlDataSourceRISK.SelectCommand = "REPORT_EDW_RISK_MAXAGING_DAILY_FACT"
    '    'End If
    'End Sub

    Protected Sub tbsearch_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles tbsearch.Click
        If IsNumeric(tbcif.Text) = False Then
            Exit Sub
        End If
        Response.Redirect("ReportEdwRiskMaxAgingDaily.aspx?cif=" & tbcif.Text)
    End Sub
End Class
