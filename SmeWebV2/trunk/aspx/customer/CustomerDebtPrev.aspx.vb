Option Strict On
Option Explicit On

Namespace aspx.customer
    Partial Class CustomerDebtPrev
        Inherits aspx.MyPageClass

        Protected Sub DebtPrevDS_Selected(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.SqlDataSourceStatusEventArgs) Handles DebtPrevDS.Selected

            If Not IsNothing(e.Exception) Then
                'สั่งให้ handle exception
                e.ExceptionHandled = True

                If (e.Exception.Message.Contains("Invalid object name")) Then
                    ErrorLabel.Text = "ไม่พบข้อมูลปีที่ท่านเลือก"
                End If
            End If

        End Sub

        Protected Sub YearDropDownList_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles YearDropDownList.Load
            If Not Me.IsPostBack Then
                'Table ลงท้ายด้วยปี พ.ศ. ตลอด
                Dim thisYear As Integer = CInt(ConvertUtil.getDateFormatWithCulture(Date.Today, New System.Globalization.CultureInfo("th-TH"), "yyyy"))

                For i As Integer = 0 To 6
                    YearDropDownList.Items.Add((thisYear - i).ToString())
                Next

            End If
        End Sub

        Protected Sub SearchButton_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles SearchButton.Click
            DebtPrevDS.SelectCommand = "SELECT YM, Class, Principal, Accru, Susp, Pay_PRIN, Pay_INT, Pay_SUSP, Post_PRIN, Post_INT, Post_SUSP, Yield FROM ByCustomer_" + YearDropDownList.SelectedValue + " where  CIF=@CIF ORDER BY YM"
            DebtPrevDS.DataBind()
        End Sub
    End Class
End Namespace

