Imports FinancialSSLib
Partial Class aspx_smes_financial_ss
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(sender As Object, e As System.EventArgs) Handles Me.Load
        Dim financialSS As New FinancialSS
        With financialSS
            .CashBond = 10
            .BondDepositPledge = 20
        End With

        Response.Write(financialSS.GetCashBond)
        Response.Write("<br>")
        Response.Write(financialSS.GetTotalCurentAssets)
       
    End Sub
End Class
