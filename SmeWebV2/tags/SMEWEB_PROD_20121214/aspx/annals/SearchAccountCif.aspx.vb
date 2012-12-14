
Partial Class aspx_annals_SearchAccountCif
    Inherits System.Web.UI.Page

    Protected Sub DailyGridView_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles DailyGridView.SelectedIndexChanged
        Dim ACCNO, NBRTHAI, DECB_RD_ID As String  ' àÅ¢·ÕèºÑ­ªÕ" 
        Dim SUMLIMIT, SUMPRIN, SUMACCRU, SUMSUSP, SUMAGING As String
 
        ACCNO = HttpUtility.HtmlDecode(DailyGridView.Rows(DailyGridView.SelectedIndex).Cells(1).Text).Trim
        NBRTHAI = HttpUtility.HtmlDecode(DailyGridView.Rows(DailyGridView.SelectedIndex).Cells(2).Text).Trim
        ' ACCGL = HttpUtility.HtmlDecode(DailyGridView.Rows(DailyGridView.SelectedIndex).Cells(3).Text).Trim
        DECB_RD_ID = HttpUtility.HtmlDecode(DailyGridView.Rows(DailyGridView.SelectedIndex).Cells(3).Text).Trim
        SUMLIMIT = HttpUtility.HtmlDecode(DailyGridView.Rows(DailyGridView.SelectedIndex).Cells(4).Text).Trim
        SUMPRIN = HttpUtility.HtmlDecode(DailyGridView.Rows(DailyGridView.SelectedIndex).Cells(5).Text).Trim
        SUMACCRU = HttpUtility.HtmlDecode(DailyGridView.Rows(DailyGridView.SelectedIndex).Cells(6).Text).Trim
        SUMSUSP = HttpUtility.HtmlDecode(DailyGridView.Rows(DailyGridView.SelectedIndex).Cells(7).Text).Trim
        SUMAGING = HttpUtility.HtmlDecode(DailyGridView.Rows(DailyGridView.SelectedIndex).Cells(8).Text).Trim

        'Dim S As String = "" '"<script language='javascript'>"
        'S += "window.opener.document.getElementById('" & Request.QueryString("tbACCNO") & "').value  ='" & ACCNO & "';"
        'S += "window.opener.document.getElementById('" & Request.QueryString("tbNBRTHAI") & "').value  ='" & NBRTHAI & "';"
        ''S += "    document.getElementById(fieldId + "_year").selectedIndex = searchDropDownIndexByValue(fieldId + "_year",date.getUTCFullYear());
        ''S += "(e('form1').id);//e('" & Request.QueryString("tbDECB_RD_ID") & "',window.opener).selectedIndex = searchDropDownIndexByValue(e('" & Request.QueryString("tbDECB_RD_ID") & "',window.opener),'" & DECB_RD_ID & "');"
        'S += "window.opener.document.getElementById('" & Request.QueryString("tbDECB_RD_ID") & "').selectedIndex  = searchDropDownIndexByText(window.opener.document.getElementById('" & Request.QueryString("tbDECB_RD_ID") & "'),'" & DECB_RD_ID & "');"
        'S += "window.opener.document.getElementById('" & Request.QueryString("tbSUMLIMIT") & "').value  ='" & CDec(SUMLIMIT) & "';"
        'S += "window.opener.document.getElementById('" & Request.QueryString("tbSUMPRIN") & "').value  ='" & CDec(SUMPRIN) & "';"
        'S += "window.opener.document.getElementById('" & Request.QueryString("tbSUMACCRU") & "').value  ='" & CDec(SUMACCRU) & "';"
        'S += "window.opener.document.getElementById('" & Request.QueryString("tbSUMSUSP") & "').value  ='" & CDec(SUMSUSP) & "';"
        'S += "window.opener.document.getElementById('" & Request.QueryString("tbSUMAGING") & "').value  ='" & CDec(SUMAGING) & "';"
        'S += "window.close();" '</script>"
        '' S += " window.opener.setAccount('" & ACCNO & "','" & NBRTHAI & "','" & ACCGL & "','" & DECB_RD & "','" & SUMLIMIT & "','" & SUMPRIN & "','" & SUMACCRU & "','" & SUMSUSP & "','" & SUMAGING & "' );window.close();</script>"
        ''e("", window.opener).value = ""
        'Page.ClientScript.RegisterStartupScript(Me.GetType, "test", S, True)
        'Response.Write(S)

        Dim S As String = "" '"<script language='javascript'>"
        S += "window.opener.document.getElementById('" & Request.QueryString("tbACCNO") & "').value  ='" & ACCNO & "';"
        S += "window.opener.document.getElementById('" & Request.QueryString("tbDECB_RD_ID") & "').selectedIndex  = searchDropDownIndexByText(window.opener.document.getElementById('" & Request.QueryString("tbDECB_RD_ID") & "'),'" & DECB_RD_ID & "');"
        S += "window.close();" '</script>"
        Page.ClientScript.RegisterStartupScript(Me.GetType, "test", S, True)
        Response.Write(S)
    End Sub

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

    End Sub
End Class
