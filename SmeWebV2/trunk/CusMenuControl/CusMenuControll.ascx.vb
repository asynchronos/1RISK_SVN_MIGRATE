
Partial Class CusMenuControl_CusMenuControll
    Inherits System.Web.UI.UserControl

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

        createCusDetailLink()
        createCusDebtLink()
        createCusDebtPrevLink()
        createCusClassDebtLink()
        createCusCollateralLink()
        createCusCollateralPersonLink()
        createCusLawLink()

        cifLabel.Text = Request.QueryString.Get("cif") 'Session.Item(SessionKeyConst.CIF)

        If cifLabel.Text.Trim.Length = 0 Then
            'เช็คเพื่อป้องกันการวนไม่รู้จบ 
            'ถ้า page ที่เรียกเป็น page เดียวกับ page ที่ถูกเรียก จะไม่ทำการ redirect
            If IsNothing(Session.Item(SessionKeyConst.CIF)) Then
                If Not Request.AppRelativeCurrentExecutionFilePath.Equals("~/aspx/customer/CustomerSearch.aspx") Then
                    Response.Redirect("~/aspx/customer/CustomerSearch.aspx")
                End If
            Else
                If Request.RawUrl.IndexOf("?") > -1 Then
                    Response.Redirect(Request.RawUrl + "&cif=" + Session.Item(SessionKeyConst.CIF))
                Else
                    Response.Redirect(Request.RawUrl + "?cif=" + Session.Item(SessionKeyConst.CIF))
                End If
            End If

        End If

        Dim wcfService As New webservice.wcf.service.CustomerWCFService()
        Dim result As webservice.wcf.result.WCFResutl = wcfService.GetCustomerFullNameByCif(cifLabel.Text)

        nameLabel.Text = result.detail 'Session.Item(SessionKeyConst.CUS_NAME)

    End Sub

    Private Sub createCusDetailLink()
        Dim navigateUrl As String = "~/aspx/customer/CustomerDetail.aspx" ' + "?CIF=" + CIF
        CusDetailLink.PostBackUrl = navigateUrl
    End Sub

    Private Sub createCusDebtLink()
        Dim navigateUrl As String = "~/aspx/customer/CustomerDebt.aspx" ' + "?CIF=" + CIF
        CusDebtLink.PostBackUrl = navigateUrl
    End Sub

    Private Sub createCusDebtPrevLink()
        Dim navigateUrl As String = "~/aspx/customer/CustomerDebtPrev.aspx" ' + "?CIF=" + CIF
        CusDebtPrevLink.PostBackUrl = navigateUrl
    End Sub

    Private Sub createCusClassDebtLink()
        Dim navigateUrl As String = "~/aspx/customer/CustomerClassDebt.aspx" ' + "?CIF=" + CIF
        CusClassDebtLink.PostBackUrl = navigateUrl
    End Sub

    Private Sub createCusCollateralLink()
        Dim navigateUrl As String = "~/aspx/customer/CustomerCollateral.aspx" ' + "?CIF=" + CIF
        CusCollateralLink.PostBackUrl = navigateUrl
    End Sub

    Private Sub createCusCollateralPersonLink()
        Dim navigateUrl As String = "~/aspx/customer/CustomerCollateralPerson.aspx" ' + "?CIF=" + CIF
        CusCollateralPersonLink.PostBackUrl = navigateUrl
    End Sub

    Private Sub createCusLawLink()
        Dim navigateUrl As String = "~/aspx/customer/CustomerLaw.aspx" ' + "?CIF=" + CIF
        CusLawLink.PostBackUrl = navigateUrl
    End Sub

End Class
