Imports System.Data.SqlClient
Imports System.Data
Partial Class aspx_customer_CustomerSpredSheet2
    Inherits System.Web.UI.Page

    Protected Sub GridView1_RowDataBound(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewRowEventArgs) Handles GridView1.RowDataBound
        If Not IsNothing(DataBinder.Eval(e.Row.DataItem, "Update_Date")) Then
            If Not IsDBNull(DataBinder.Eval(e.Row.DataItem, "Update_Date")) Then
                e.Row.BackColor = Drawing.Color.LightGreen
            End If
        End If

    End Sub

    Protected Sub GridView1_RowUpdating(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewUpdateEventArgs) Handles GridView1.RowUpdating



        'Dim cif, A, AP, P, C, Balance_Sheet_CIF, CIF_Balance_Sheet As String


        'cif = GridView1.Rows(e.RowIndex).FindControl("lblCif").ToString
        'MsgBox(cif)

        ' ================================ Connection code
        '      Dim sqlCmd As SqlCommand
        '      Dim sqlConn As SqlConnection
        '      Dim sqlReader As SqlDataReader

        '      sqlConn = ConnectionUtil.getSqlConnectionFromWebConfig()
        '      sqlCmd = New SqlCommand("ReportPerformance1", sqlConn)
        '      sqlCmd.CommandType = Data.CommandType.StoredProcedure
        '         @cif nvarchar(10)
        ',@A  bit
        ',@AP bit
        ',@P bit
        ',@C bit
        ',@Balance_Sheet_CIF nvarchar(2)
        ',@CIF_Balance_Sheet nvarchar(10)

        '      With sqlCmd
        '          .Parameters.Add("@cif", SqlDbType.NVarChar, 2).Value = strDay
        '          .Parameters.Add("@A", SqlDbType.NVarChar, 2).Value = strMonth
        '          .Parameters.Add("@AP", SqlDbType.NVarChar, 4).Value = strYear
        '          .Parameters.Add("@P", SqlDbType.NVarChar, 10).Value = strLead
        '          .Parameters.Add("@C", SqlDbType.Bit).Value = c
        '      End With

        '      sqlReader = sqlCmd.ExecuteReader
    End Sub

    Protected Sub GridView1_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles GridView1.SelectedIndexChanged

    End Sub

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

    End Sub
End Class
