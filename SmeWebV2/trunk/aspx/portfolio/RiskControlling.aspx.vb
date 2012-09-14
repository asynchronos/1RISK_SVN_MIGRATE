Option Strict On
Option Explicit On

Imports System.Diagnostics
Imports System.Collections.Generic

Namespace aspx.portfolio
    Partial Class RiskControlling
        Inherits aspx.MyPageClass

#Region "Paging Code"
        Protected pageSize As Integer = 20

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
                displayRiskControllingGridView()
            End If

        End Sub
#End Region


        Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

            If Not (Page.IsPostBack) Then
                'dispaly first page
                CurrentPageLabel.Text = "1"
                displayRiskControllingGridView()
            End If

        End Sub

        Private Sub displayRiskControllingGridView()
            'get current page from CurrentPageLabel
            Dim currentPage As Integer = CType(CurrentPageLabel.Text, Integer)

            Dim bo As New RiskControllingBO()

            'User.Identity.Name คือ Username ที่ใช้ login
            Dim hash As Hashtable = bo.getCustomerInControlling(Request.QueryString.Item("empId"), currentPage, pageSize, Request.QueryString.Item("condition"))

            RiskControllingGridView.DataSource = hash.Item("ROWS")
            RiskControllingGridView.DataBind()

            Dim totalPage As Integer = CType(Math.Ceiling(DirectCast(hash.Item("TOTAL_ROW"), Integer) / pageSize), Integer)
            TotalPageLabel.Text = CType(totalPage, String)

            PagingPanel.Visible = True

        End Sub

        Protected Sub DetailImageButton_Click(ByVal sender As Object, ByVal e As System.Web.UI.ImageClickEventArgs)
            Dim imgBt As ImageButton = DirectCast(sender, ImageButton)
            Dim gridRow As GridViewRow = DirectCast(DirectCast(imgBt.Parent, DataControlFieldCell).Parent, GridViewRow)

            'get CIF DataControlFieldCell
            Dim cifText As String = DirectCast(gridRow.Cells(0), DataControlFieldCell).Text
            'get Name DataControlFieldCell
            Dim cusNameText As String = DirectCast(gridRow.Cells(1), DataControlFieldCell).Text

            'redirect to next page
            Server.Transfer("~//aspx/portfolio/smeCustomerDetail.aspx?cif=" + cifText + "&menu=3")
        End Sub
    End Class

End Namespace

