Option Explicit On
Option Strict On

Namespace aspx.customer
    Partial Class SmeGroupManagement
        Inherits aspx.MyPageClass

        Protected Sub SmeCusIframe1_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles SmeCusIframe1.Load
            DirectCast(sender, HtmlGenericControl).Attributes.Item("src") = Page.ResolveUrl("~/aspx/customer/SmeCustomerManagement.aspx?returnIdTarget=" + CIFTextBox1.ClientID + "&cif=" + CIFTextBox1.Text)
        End Sub

        Protected Sub SmeCusIframe2_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles SmeCusIframe2.Load
            DirectCast(sender, HtmlGenericControl).Attributes.Item("src") = Page.ResolveUrl("~/aspx/customer/SmeCustomerManagement.aspx?returnIdTarget=" + CIFTextBox2.ClientID + "&cif=" + CIFTextBox2.Text)
        End Sub

        Protected Sub Button1_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles SearchCIFButton1.Load
            DirectCast(sender, Button).OnClientClick = "ele(""" + SmeCusIframe1.ClientID + """).src = """ + Page.ResolveUrl("~/aspx/customer/SmeCustomerManagement.aspx?returnIdTarget=" + CIFTextBox1.ClientID + "&cif=") + """ + ele(""CIFTextBox1"").value;return false;"
        End Sub

        Protected Sub Button2_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles SearchCIFButton2.Load
            DirectCast(sender, Button).OnClientClick = "ele(""" + SmeCusIframe2.ClientID + """).src = """ + Page.ResolveUrl("~/aspx/customer/SmeCustomerManagement.aspx?returnIdTarget=" + CIFTextBox2.ClientID + "&cif=") + """ + ele(""CIFTextBox2"").value;return false;"
        End Sub

        Protected Sub MergeCIFButton1_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles MergeCIFButton1.Click
            MergeCIFButton2_Click(sender, e)
        End Sub

        Protected Sub MergeCIFButton2_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles MergeCIFButton2.Click
            SMECustomerBO.mergeCIFGroup(CInt(CIFTextBox1.Text), CInt(CIFTextBox2.Text), User.Identity.Name)
            Response.Redirect(Page.ResolveUrl("~/aspx/customer/SmeGroupManagement.aspx?CIF=") + CIFTextBox1.Text)
        End Sub

        Protected Sub CIFTextBox1_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles CIFTextBox1.Load
            If Not Me.IsPostBack Then
                DirectCast(sender, TextBox).Text = Request.QueryString.Get("CIF")
            End If
        End Sub
    End Class
End Namespace

