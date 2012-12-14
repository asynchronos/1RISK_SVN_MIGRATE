
Partial Class aspx_customer_CustomerSearch
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
            displayCustomerListGridView()
        End If

    End Sub
#End Region

#Region "Custom Code"
    Private Sub displayCustomerListGridView()
        'get current page from CurrentPageLabel
        Dim currentPage As Integer = CType(CurrentPageLabel.Text, Integer)

        Dim dal As New TbCustomerRiskDAL()
        Dim hash As Hashtable = Nothing

        If FieldNameList.SelectedValue.Equals("CIF") Then
            hash = dal.getCustomerByFilter(FieldNameList.SelectedValue + " = ", ValueTextBox.Text, currentPage, pageSize)
        Else
            hash = dal.getCustomerByFilter(FieldNameList.SelectedValue + " LIKE ", "%" + ValueTextBox.Text + "%", currentPage, pageSize)
        End If
        'Dim hash As Hashtable = dal.getCustomerByFilter(FieldNameList.SelectedValue, "%" + ValueTextBox.Text + "%", currentPage, pageSize)

        CustomerListGridView.DataSource = hash.Item("ROWS")
        CustomerListGridView.DataBind()

        Dim totalPage As Integer = CType(Math.Ceiling(DirectCast(hash.Item("TOTAL_ROW"), Integer) / pageSize), Integer)
        If totalPage = 0 Then
            totalPage = 1
            PagingPanel.Visible = False
        Else
            PagingPanel.Visible = True
        End If
        TotalPageLabel.Text = CType(totalPage, String)

    End Sub
#End Region

    Protected Sub SearchButton_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles SearchButton.Click
        'dispaly first page
        CurrentPageLabel.Text = "1"
        displayCustomerListGridView()
    End Sub

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Not (Page.IsPostBack) Then
            'dispaly first page
            CurrentPageLabel.Text = "1"
            'displayCustomerListGridView()
        End If
    End Sub

    Protected Sub CustomerListGridView_SelectedIndexChanging(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewSelectEventArgs) Handles CustomerListGridView.SelectedIndexChanging
        Dim GD As GridView = DirectCast(sender, GridView)
        Dim cifText As String = DirectCast(GD.Rows(e.NewSelectedIndex).Cells(0), DataControlFieldCell).Text
        Dim cusNameText As String = DirectCast(GD.Rows(e.NewSelectedIndex).Cells(1), DataControlFieldCell).Text

        'เก็บ CIF และ Name ลง Session
        Session.Add(SessionKeyConst.CIF, cifText)
        Session.Add(SessionKeyConst.CUS_NAME, cusNameText)

        'redirect to next page
        Response.Redirect("~/aspx/customer/CustomerDebt.aspx?cif=" + cifText)
    End Sub
End Class
