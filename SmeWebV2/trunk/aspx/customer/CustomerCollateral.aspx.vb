Option Strict On
Option Explicit On

Namespace aspx.customer
    Partial Class CustomerCollateral
        Inherits aspx.MyPageClass

#Region "Custom Code"
        Protected sumCOLLVAL As Double
        Protected sumDISCVAL As Double
        Protected sumGUAR_AMT As Double

        Private Sub initSum()
            sumCOLLVAL = 0
            sumDISCVAL = 0
            sumGUAR_AMT = 0
        End Sub

        Private Sub setUpdateDateLabel()
            Dim debtDateObj As Debtdate = DirectCast(DirectCast(MyCacheFactory.getCache(MyCacheFactory.cacheKeyEnum.DebtDate).getObject, Hashtable)("BYCUSTOMER"), Debtdate)

            lblCID.Text = "ข้อมูลหลักประกัน ณ เดือน " + ClsDateFunctionsUtil.LongMonth_thai(debtDateObj.Upd_MONTH.ToString) _
                                    + " " + ClsDateFunctionsUtil.LongYear_thai(debtDateObj.Upd_YEAR.ToString)
        End Sub
#End Region

        Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
            'init ทุกครั้งที่โหลด เพื่อ reset ค่า sum
            initSum()

            If Not Me.IsPostBack Then
                setUpdateDateLabel()
            End If

        End Sub

        Protected Sub dtgCID_RowDataBound(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewRowEventArgs) Handles dtgCID.RowDataBound
            If e.Row.RowType = DataControlRowType.DataRow Then
                'ทำการ sum ค่าต่างๆเก็บไว้
                sumCOLLVAL += CType(DirectCast(e.Row.Cells(4).FindControl("COLLVALLabel"), Label).Text, Double)
                sumDISCVAL += CType(DirectCast(e.Row.Cells(6).FindControl("DISCVALLabel"), Label).Text, Double)
            End If
        End Sub

        Protected Sub dtgCID_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles dtgCID.SelectedIndexChanged
            lblAID.Text = "รหัสการประเมิน : " + dtgCID.SelectedValue.ToString()
        End Sub

        Protected Sub dtgPID_RowDataBound(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewRowEventArgs) Handles dtgPID.RowDataBound
            If e.Row.RowType = DataControlRowType.DataRow Then
                'ทำการ sum ค่าต่างๆเก็บไว้
                sumGUAR_AMT += CType(DirectCast(e.Row.Cells(2).FindControl("GUAR_AMTLabel"), Label).Text, Double)
            End If
        End Sub
    End Class
End Namespace
