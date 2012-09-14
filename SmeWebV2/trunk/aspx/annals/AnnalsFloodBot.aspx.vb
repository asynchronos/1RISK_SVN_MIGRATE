Imports System.Data
Partial Class aspx_annals_AnnalsFloodBot
    Inherits System.Web.UI.Page
    Shared BankTable As New DataTable

    Protected Sub SaveButton_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles SaveButton.Click

    End Sub

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Not Page.IsPostBack = True Then
            REFTextbox.Text = Request.QueryString("REFID")
            clearForm()
            bindTable()
            bindDropDown()
        End If

    End Sub
    Sub bindTable()
        'define the columns


        BankTable.Columns.Add(New DataColumn("BankID", GetType(String)))
        BankTable.Columns.Add(New DataColumn("BankName", GetType(String)))
        BankTable.Columns.Add(New DataColumn("BankValue", GetType(Integer)))
    


    End Sub
    Sub bindDropDown()
        BankIDDropDownList.Items.Add(New ListItem("ธนาคารกรุงศรี", "BAY"))
        BankIDDropDownList.Items.Add(New ListItem("ธนาคารกรุงเทพ", "BBL"))

    End Sub
    Protected Sub AddCustomerButton_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles AddCustomerButton.Click
        divFormCustomer.Visible = True
        divGridCustomer.Visible = False
        divHead.visible = False

    End Sub
    Sub clearForm()

        divFormCustomer.Visible = False
        divHead.Visible = True
    End Sub

    Protected Sub CancelButton_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles CancelButton.Click
        clearForm()
    End Sub

    Protected Sub AddBankButton_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles AddBankButton.Click
        Dim dr As DataRow = Nothing

        dr = BankTable.NewRow()
        dr("BankID") = BankIDDropDownList.Items(BankIDDropDownList.SelectedIndex).Value
        dr("BankName") = BankIDDropDownList.Items(BankIDDropDownList.SelectedIndex).Text
        dr("BankValue") = BankValueTextBox.Text

        BankTable.Rows.Add(dr)

        GridViewBank.DataSource = BankTable
        GridViewBank.DataBind()
    End Sub
End Class
