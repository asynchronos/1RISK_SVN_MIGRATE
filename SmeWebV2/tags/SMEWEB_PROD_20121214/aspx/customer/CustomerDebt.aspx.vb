Option Explicit On
Option Strict On

Namespace aspx.customer
    Partial Class CustomerDebt
        Inherits aspx.MyPageClass

        'Protected monthlyHeaderLabel As String
        Protected dailyHeaderLabel As String

#Region "Custom Code"
        Private Sub getMonthlyHeaderLabel()
            Dim debtDateObj As Debtdate = DirectCast(DirectCast(MyCacheFactory.getCache(MyCacheFactory.cacheKeyEnum.DebtDate).getObject, Hashtable)("BYCUSTOMER"), Debtdate)

            monthlyHeaderLabel.Text = "ข้อมูลลูกค้า ณ เดือน " + ClsDateFunctionsUtil.LongMonth_thai(debtDateObj.Upd_MONTH.ToString) _
                                    + " " + ClsDateFunctionsUtil.LongYear_thai(debtDateObj.Upd_YEAR.ToString)
        End Sub

        Private Sub getDailyHeaderLabel()
            Dim tbdasofObj As Tbdasof = DirectCast(DirectCast(MyCacheFactory.getCache(MyCacheFactory.cacheKeyEnum.Tbdasof).getObject, Hashtable)("DETAIL"), Tbdasof)

            dailyHeaderLabel = "ข้อมูลลูกค้า ณ วันที่ " + Format(tbdasofObj.DAY_ASOF, "0#") _
                                    + " " + ClsDateFunctionsUtil.LongMonth_thai(tbdasofObj.MONTH_ASOF.ToString) _
                                    + " " + ClsDateFunctionsUtil.LongYear_thai(tbdasofObj.YEAR_ASOF.ToString)
        End Sub
#End Region

        Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
            If Not Me.IsPostBack Then
                getMonthlyHeaderLabel()
                getDailyHeaderLabel()
            End If
        End Sub

    End Class
End Namespace

