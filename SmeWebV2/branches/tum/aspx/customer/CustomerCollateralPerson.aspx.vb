Option Strict On
Option Explicit On

Namespace aspx.customer
    Partial Class CustomerCollateralPerson
        Inherits aspx.MyPageClass

        Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
            If Not Me.IsPostBack Then
                setUpdateDateLabel()
            End If
        End Sub

        Private Sub setUpdateDateLabel()
            Dim debtDateObj As Debtdate = DirectCast(DirectCast(MyCacheFactory.getCache(MyCacheFactory.cacheKeyEnum.DebtDate).getObject, Hashtable)("BYCUSTOMER"), Debtdate)

            lblCID.Text = "????????ѡ??Сѹ ? ???͹ " + ClsDateFunctionsUtil.LongMonth_thai(debtDateObj.Upd_MONTH.ToString) _
                                    + " " + ClsDateFunctionsUtil.LongYear_thai(debtDateObj.Upd_YEAR.ToString)

        End Sub

    End Class
End Namespace
