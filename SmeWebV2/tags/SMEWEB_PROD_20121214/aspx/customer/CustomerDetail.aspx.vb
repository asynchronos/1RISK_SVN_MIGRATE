
Partial Class aspx_CustomerDetail
    Inherits System.Web.UI.Page

#Region "Custom Code"
    Private Sub regisConfirmScript(ByVal key As String, ByVal message As String)
        Dim script As String = "function confirm" & key & "(){" & vbCrLf _
                            & vbTab & "return confirm(""" & message & """);" & vbCrLf _
                            & "}" & vbCrLf
        Page.ClientScript.RegisterClientScriptBlock(Me.GetType, key, script, True)
    End Sub

    'event onbinding BEINGCUSTLabel
    Protected Sub changeBeginCustFormat(ByVal sender As Object, ByVal e As System.EventArgs)
        Dim myLabel As Label = DirectCast(sender, Label)

        Try
            Dim dt As Date = DirectCast(Eval("BEINGCUST"), Date)
            myLabel.Text = ConvertUtil.getDateFormatWithCulture(dt, Application.Item(ApplicationKeyConst.App_Culture), "dd/MM/yyyy")
        Catch ex As Exception
            myLabel.Text = ""
        End Try
    End Sub
#End Region

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        regisConfirmScript("Delete", "คุณต้องการลบข้อมูล?")

        If Not Me.IsPostBack Then
            If Not IsNothing(Request.QueryString.Get("cif")) Then
                If IsNothing(Session.Item(SessionKeyConst.CIF)) Then
                    Session.Add(SessionKeyConst.CIF, Request.QueryString.Get("cif"))
                Else
                    Session.Item(SessionKeyConst.CIF) = Request.QueryString.Get("cif")
                End If
            End If
        End If
    End Sub

    Protected Sub ContactDetailsView_DataBound(ByVal sender As Object, ByVal e As System.EventArgs) Handles ContactDetailsView.DataBound
        If (ContactDetailsView.CurrentMode = DetailsViewMode.Insert) Then
            Dim CIFTextBox As TextBox = CType(ContactDetailsView.Rows(0).Cells(1).Controls(0), TextBox)
            CIFTextBox.Text = Request.QueryString("CIF")
            CIFTextBox.Enabled = False
        End If
    End Sub

    Protected Sub ContactDetailsView_ItemInserted(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.DetailsViewInsertedEventArgs) Handles ContactDetailsView.ItemInserted
        'bind grid ใหม่หลัง insert
        ContactGridView.DataBind()
    End Sub

End Class
