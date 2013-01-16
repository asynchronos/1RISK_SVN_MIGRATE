Imports System.Data
Imports System.Data.SqlClient
Imports System.Globalization
Partial Class aspx_smes_financial_ca_list
    Inherits System.Web.UI.Page
    Shared SField As String
    Shared SValue As String
    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        Dim strUsername As String = Session("EMP_ID")
        Session("User") = Session("EMP_ID")     '  กำหนดให้ session ที่ใช้ใน smes เป็นอันเดียวกับ leader1
        If strUsername = "" Then
            Response.Redirect("../mainpage.aspx")
 
        End If
        If Not Page.IsPostBack Then
            SField = ""
            SValue = ""
            showData(Session("User"), SField, SValue)
      
        End If

    End Sub


    Sub showData(EmpID As String, Field As String, Value As String)

        Dim conn As New SqlConnection
        conn.ConnectionString = ConfigurationManager.ConnectionStrings("BAY01ConnectionString").ConnectionString
        conn.Open()
        'Try
        conn = ConnectionUtil.getSqlConnectionFromWebConfig()
        Dim Sql As String = "[SME_S].[P_SS_FINANCIAL_CA_SELECT]"
        Dim sqlCmd As New SqlCommand(Sql, conn)
        sqlCmd.CommandType = CommandType.StoredProcedure
        sqlCmd.Prepare()
        sqlCmd.Parameters.AddWithValue("EMP_ID", EmpID)
        sqlCmd.Parameters.AddWithValue("FIELD", Field)
        sqlCmd.Parameters.AddWithValue("VALUE", Value)

        Dim reader As SqlDataReader = sqlCmd.ExecuteReader()

        ' ดูรายละเอียด status ใน ตาราง FINANCIAL_STATUS
        If reader.HasRows Then   ' ถ้ามี row แสดงว่ามีการเพิ่มแล้ว
            Dim ds As DataSet = New DataSet()
            Dim dt As DataTable = New DataTable()
            dt.Load(reader)
            ds.Tables.Add(dt)
            If Session("SortExpression") <> "" Then
                Dim dv As DataView = New DataView()
                dv = ds.Tables(0).DefaultView
                dv.Sort = Session("SortExpression") & " " & Session("SortDirection")
                GridView1.DataSource = dv

            Else
                GridView1.DataSource = ds
            End If
            GridView1.DataBind()
        End If


        reader.Close()
        sqlCmd.Dispose()
        conn.Close()
        SqlConnection.ClearPool(conn)




    End Sub


    Protected Sub GridView1_Sorting(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewSortEventArgs)

        Dim newDirection As String
        newDirection = Session("SortDirection")

        If newDirection = String.Empty Or newDirection = "" Or newDirection = Nothing Then
            'Response.Write("null")
            Session("SortDirection") = "ASC"
        Else
            newDirection = ConvertSortDirection(newDirection)
            Session("SortDirection") = newDirection
        End If

        Session("SortExpression") = e.SortExpression
        showData(Session("User"), "", "")

    End Sub

    Function ConvertSortDirection(ByVal SortDirection As String) As String
        Dim newSortDirection As String = String.Empty
        Select Case SortDirection
            Case "ASC"
                newSortDirection = "DESC"
            Case "DESC"
                newSortDirection = "ASC"
        End Select
        Return newSortDirection
    End Function
    Protected Sub GridView1_PageIndexChanging(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewPageEventArgs) Handles GridView1.PageIndexChanging
        GridView1.PageIndex = e.NewPageIndex
        showData(Session("User"), SField, SValue)
    End Sub

    Protected Sub GridView1_RowDataBound(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewRowEventArgs) Handles GridView1.RowDataBound
        If e.Row.RowType = DataControlRowType.DataRow Then
            e.Row.Attributes.Add("OnMouseOver", "this.style.backgroundColor = 'lightblue';")
            If e.Row.RowState = DataControlRowState.Alternate Then
                Dim alColor As String = System.Drawing.ColorTranslator.ToHtml(GridView1.AlternatingRowStyle.BackColor)
                e.Row.Attributes.Add("OnMouseOut", "this.style.backgroundColor ='" & alColor & "'")
            Else
                Dim bkColor As String = System.Drawing.ColorTranslator.ToHtml(GridView1.RowStyle.BackColor)
                e.Row.Attributes.Add("OnMouseOut", "this.style.backgroundColor ='" & bkColor & "'")
            End If
        End If
    End Sub

    Protected Sub SearchButton_Click(sender As Object, e As System.EventArgs) Handles SearchButton.Click
        If SearchDropDownList.SelectedValue = "CIF" Then
            SField = "CIF"
        ElseIf SearchDropDownList.SelectedValue = "ID" Then
            SField = "ID"
        ElseIf SearchDropDownList.SelectedValue = "EMP2" Then
            SField = "EMP2"
        Else
            SField = ""
        End If

        If SField <> "" Then
            SValue = SearchTextBox.Text
            showData(Session("User"), SField, SValue)
        End If
    End Sub

    Protected Sub AllButton_Click(sender As Object, e As System.EventArgs) Handles AllButton.Click
        SField = ""
        SValue = ""
        showData(Session("User"), SField, SValue)
    End Sub

End Class
