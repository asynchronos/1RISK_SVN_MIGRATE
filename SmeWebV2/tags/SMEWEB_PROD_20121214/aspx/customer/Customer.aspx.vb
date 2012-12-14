Option Strict On
Option Explicit On

Partial Class aspx_customer_Customer
    Inherits System.Web.UI.Page

#Region "Paging Code"
    Protected pageSize As Integer = 10

    Private Function currentPageTextValidate(ByVal currentPage As Integer) As Boolean
        Dim result As Boolean = True

        Dim totalPage As Integer

        totalPage = CType(TotalPageLabel.Text, Integer)

        If (currentPage <= 0) Or (currentPage > totalPage) Then
            currentPage = CType(CurrentPageLabel.Text, Integer)
            result = False
        End If

        CurrentPageLabel.Text = currentPage.ToString
        'clear CurrentPageText
        CurrentPageText.Text = ""

        Return result
    End Function

    Protected Sub Paging_Click(ByVal sender As Object, ByVal e As CommandEventArgs)
        Dim currentPage As Integer = Nothing

        Select Case (e.CommandName)
            Case "Next"
                currentPage = CType(CurrentPageLabel.Text, Integer) + 1
                Exit Select
            Case "Prev"
                currentPage = CType(CurrentPageLabel.Text, Integer) - 1
                Exit Select
            Case "Jump"
                If IsNumeric(CurrentPageText.Text) Then
                    currentPage = CType(CurrentPageText.Text, Integer)
                Else
                    currentPage = CType(CurrentPageLabel.Text, Integer)
                End If
                Exit Select
        End Select

        'ถ้า validate แล้ว true จึงเรียก store procedure
        If currentPageTextValidate(currentPage) Then
            displayCustomerGridView()
        End If

    End Sub
#End Region

#Region "Custom Code"
    Private Sub displayCustomerGridView()
        'get current page from CurrentPageLabel
        Dim currentPage As Integer = CType(CurrentPageLabel.Text, Integer)

        Dim dal As New TbCustomerRiskDAL()
        Dim hash As Hashtable = Nothing

        If FieldNameList.SelectedValue.Equals("CUSTOMER.CIF") Then
            hash = dal.getCustomerByFilter(FieldNameList.SelectedValue + " = ", ValueTextBox.Text, currentPage, pageSize)
        Else
            hash = dal.getCustomerByFilter(FieldNameList.SelectedValue + " LIKE ", "%" + ValueTextBox.Text + "%", currentPage, pageSize)
        End If
        'Dim hash As Hashtable = dal.getCustomerByFilter(FieldNameList.SelectedValue, "%" + ValueTextBox.Text + "%", currentPage, pageSize)

        CustomerGridView.DataSource = hash.Item("ROWS")
        CustomerGridView.DataBind()

        Dim totalPage As Integer = CType(Math.Ceiling(DirectCast(hash.Item("TOTAL_ROW"), Integer) / pageSize), Integer)
        If totalPage = 0 Then
            totalPage = 1
            PagingPanel.Visible = False
        Else
            PagingPanel.Visible = True
        End If
        TotalPageLabel.Text = CType(totalPage, String)

    End Sub

    Protected Function genReturnJScript(ByVal cifId As String, ByVal nameId As String) As String
        Dim script As String = ""

        If Not IsNothing(returnId) Then
            script += "setPropertyValueById('" + returnId.Id + "','" + returnId.Parent + "','" + returnId.Prop + "',getPropertyValueById('" + cifId + "','this','innerText'));"
        End If

        If Not IsNothing(returnDetail) Then
            script += "setPropertyValueById('" + returnDetail.Id + "','" + returnDetail.Parent + "','" + returnDetail.Prop + "',getPropertyValueById('" + nameId + "','this','innerText'));"
        End If

        script = encapsulateTryCatch(script, "genReturnJScript(cif,name)")

        Return script
    End Function

    Protected Function encapsulateTryCatch(ByVal script As String, ByVal functionName As String) As String
        Dim result As String = script

        If script.Length > 0 Then
            result = "try{ " + script + " }catch(err){ alert('Function " + functionName + " error on " + className + " \n\n'+err.description) }"
        End If

        Return result
    End Function
#End Region

#Region "Sever Validate"
    Protected Sub ValidateFilter(ByVal source As Object, ByVal args As ServerValidateEventArgs)
        Dim result As Boolean = True

        If FieldNameList.SelectedIndex = 0 Then
            Try
                Dim num As Integer = Integer.Parse(args.Value)
            Catch ex As Exception
                result = False
            End Try
        End If

        args.IsValid = result
    End Sub
#End Region

    Private className As String = "aspx_customer_Customer"
    Private returnId As DomDetail = Nothing
    Private returnDetail As DomDetail = Nothing

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Not IsNothing(Request.QueryString("returnIdTarget")) Then
            returnId = New DomDetail(Request.QueryString("returnIdTarget"), Request.QueryString("returnIdProp"))
        End If

        If Not IsNothing(Request.QueryString("returnDetailTarget")) Then
            returnDetail = New DomDetail(Request.QueryString("returnDetailTarget"), Request.QueryString("returnDetailProp"))
        End If
    End Sub

    Protected Sub CurrentPageText_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles CurrentPageText.Load
        DirectCast(sender, TextBox).Attributes.Add("onkeypress", "return numberOnly()")
    End Sub

    Protected Sub SearchButton_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles SearchButton.Click
        ' Display whether the page passed validation.
        If Page.IsValid Then
            displayCustomerGridView()
        End If
    End Sub

    Protected Sub SelectCIFLinkBt_Load(ByVal sender As Object, ByVal e As System.EventArgs)
        Dim linkBt As LinkButton = DirectCast(sender, LinkButton)

        linkBt.OnClientClick = genReturnJScript(DirectCast(linkBt.Parent.FindControl("CIF"), Label).ClientID, DirectCast(linkBt.Parent.FindControl("NAME"), Label).ClientID) + " window.close();"
    End Sub

End Class
