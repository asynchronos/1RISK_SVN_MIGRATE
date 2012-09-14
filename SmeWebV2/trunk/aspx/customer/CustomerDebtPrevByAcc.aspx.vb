Option Strict On
Option Explicit On

Namespace aspx.customer
    Partial Class CustomerDebtPrevByAcc
        Inherits aspx.MyPageClass
#Region "Custom Code"

        Private Sub invokeQuery()
            YMHiddenField.Value = YearDropDownList.SelectedValue + MonthDropDownList.SelectedValue
            DebtPrevByAccDS.SelectCommand = "SELECT   YM, Branch, ACCGL, ACCNO, CONTNO, SEQNO, CLADJ, Principal, Accru, Susp, Pay_PRIN, Pay_INT, Pay_SUSP, Post_PRIN, Post_INT, Post_SUSP,  Yield, Rev_Accru,APP_ID FROM  ByAccount_" + YearDropDownList.SelectedValue + " WHERE CIF = @CIF AND  YM = @YM ORDER BY CONTNO,ACCGL,SEQNO"
            DebtPrevByAccDS.DataBind()
        End Sub

#End Region 'Custom Code

        Protected Sub SearchButton_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles SearchButton.Click
            invokeQuery()
        End Sub

        Protected Sub YearDropDownList_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles YearDropDownList.Load
            If Not Me.IsPostBack Then
                'Table ลงท้ายด้วยปี พ.ศ. ตลอด
                Dim thisYear As Integer = CInt(ConvertUtil.getDateFormatWithCulture(Date.Today, New System.Globalization.CultureInfo("th-TH"), "yyyy"))

                For i As Integer = 0 To 6
                    YearDropDownList.Items.Add((thisYear - i).ToString())
                Next

                YearDropDownList.SelectedValue = getQueryString("Year")
            End If
        End Sub

        Protected Sub MonthDropDownList_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles MonthDropDownList.Load
            If Not Me.IsPostBack Then
                MonthDropDownList.SelectedValue = getQueryString("Month")
            End If
        End Sub

        Protected Sub Page_LoadComplete(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.LoadComplete
            If Not Me.IsPostBack Then
                invokeQuery()
            End If
        End Sub

        'Protected Sub AccNoDataSource_Selecting(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.SqlDataSourceSelectingEventArgs) Handles AccNoDataSource.Selecting
        '    e.Command.CommandText = "SELECT   ACCNO FROM  ByAccount_" + YearDropDownList.SelectedValue + " where  CIF = @CIF AND  YM = @YM Group by ACCNO"
        '    'set YM
        '    'e.Command.Parameters.Item(1).Value = YearDropDownList.SelectedValue + MonthDropDownList.SelectedValue
        'End Sub
    End Class

End Namespace
