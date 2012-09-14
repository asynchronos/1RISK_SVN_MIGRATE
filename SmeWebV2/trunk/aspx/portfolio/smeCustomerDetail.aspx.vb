Option Explicit On
Option Strict On

Namespace aspx.portfolio
    Partial Class smeCustomerDetail
        Inherits aspx.MyPageClass

        Protected Function getUrlByMenu() As String
            Dim url As String = CustomerMenuControl1.Menu1Url

            If hasQueryString("menu") Then
                Select Case Integer.Parse(getQueryString("menu"))
                    Case 1
                        url = CustomerMenuControl1.Menu1Url
                        Exit Select
                    Case 2
                        url = CustomerMenuControl1.Menu2Url
                        Exit Select
                    Case 3
                        url = CustomerMenuControl1.Menu3Url
                        Exit Select
                    Case 4
                        url = CustomerMenuControl1.Menu4Url
                        Exit Select
                    Case 5
                        url = CustomerMenuControl1.Menu5Url
                        Exit Select
                    Case 6
                        url = CustomerMenuControl1.Menu6Url
                        Exit Select
                    Case 7
                        url = CustomerMenuControl1.Menu7Url
                        Exit Select
                    Case 8
                        url = CustomerMenuControl1.Menu8Url
                        Exit Select
                    Case Else
                        url = CustomerMenuControl1.Menu1Url
                        Exit Select
                End Select
            End If

            Return url
        End Function

        Protected Sub CustomerMenuControl1_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles CustomerMenuControl1.Load
            'เรียกใช้  javascript function ที่อยู่ใน control
            CustomerMenuControl1.OnSearchClientClick = "changeIframeSrc('iframeMain','" + Page.ResolveUrl("~/IframeLoader.aspx?url=") + Page.ResolveUrl("~/aspx/customer/SmeCustomerManagement.aspx") + "','cif=' + Ext.fly('" + CustomerMenuControl1.TextBoxCif.ClientID + "').dom.value);"
        End Sub

        Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
            If Not Me.IsPostBack Then
                If hasQueryString("cif") Then
                    CustomerMenuControl1.CIF = getQueryString("cif")

                    Page.ClientScript.RegisterStartupScript(Me.GetType, "init", "<script type='text/javascript'>changeIframeSrc('iframeMain','" + Page.ResolveUrl("~/IframeLoader.aspx?url=") + Page.ResolveUrl(getUrlByMenu()) + "','cif=' + Ext.fly('" + CustomerMenuControl1.TextBoxCif.ClientID + "').dom.value);</script>")
                End If
            End If
        End Sub

    End Class
End Namespace
