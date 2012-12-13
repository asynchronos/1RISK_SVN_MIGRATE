Imports System.Data
Imports System.Data.SqlClient
Imports System.Globalization
Partial Class Login
    Inherits System.Web.UI.Page

    Protected Sub LoginButton_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles LoginButton.Click
        If UsernameTextBox.Text = "" Or PasswordTextBox.Text = "" Then
            Exit Sub
        End If

        Dim conn As New SqlConnection
        conn.ConnectionString = ConfigurationManager.ConnectionStrings("BAY01ConnectionString").ConnectionString
        conn.Open()
        Dim reader As SqlDataReader
        Try
            conn = ConnectionUtil.getSqlConnectionFromWebConfig()
            Dim Sql As String = "SME_S.P_SS_EMPLOYEE_LOGIN"
            Dim sqlCmd As New SqlCommand(Sql, conn)
            sqlCmd.CommandType = CommandType.StoredProcedure
            sqlCmd.Prepare()
            sqlCmd.Parameters.AddWithValue("EMP_ID", UsernameTextBox.Text)
            sqlCmd.Parameters.AddWithValue("PASSWORD", PasswordTextBox.Text)

            reader = sqlCmd.ExecuteReader()

            ' ดูรายละเอียด status ใน ตาราง FINANCIAL_STATUS
            If reader.HasRows Then   ' ถ้ามี row แสดงว่ามีการเพิ่มแล้ว
                While reader.Read

                    Session("User") = reader("EMP_ID")
                    Session("Name") = reader("EMPNAME") & " " & reader("EMPSURNAME")
                End While
          
                Response.Redirect("financial_ca_list.aspx")
            Else

            End If
        Catch

        Finally
            reader.Close()
            conn.Close()
        End Try


    End Sub
End Class
