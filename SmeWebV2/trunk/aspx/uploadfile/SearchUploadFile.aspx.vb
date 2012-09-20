Imports System.Data
Imports System.Data.SqlClient
Partial Class SearchUploadFile

    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Not Page.IsPostBack Then
            BindDropDownSearch()

        End If
    End Sub
    Sub BindDropDownSearch()
        DDLSearch.Items.Add(New ListItem("CIF", "CIF"))
        DDLSearch.Items.Add(New ListItem("เลขที่รับเข้า", "REFERENCE"))
        DDLSearch.Items.Add(New ListItem("เลขที่ CA", "ANNALS_ID"))

    End Sub
    Protected Sub BtnSearch_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles BtnSearch.Click
        ShowData()
    End Sub
    Sub ShowData()
        'Try
        Dim conn = ConnectionUtil.getSqlConnectionFromWebConfig()

        Dim sql As String = Nothing
        Dim SearchValue As String = Nothing
        sql = "Select  distinct  *   from V_UPLOAD_FILE_CIF  "
        Dim sqlCmd As New SqlCommand(sql, conn)

        SearchValue = TBSearch.Text


        If DDLSearch.Items(DDLSearch.SelectedIndex).Value <> "" And TBSearch.Text <> "" Then
            If DDLSearch.Items(DDLSearch.SelectedIndex).Value = "ANNALS_ID" Then
                sql += "WHERE  substring(ANNALS_ID,2,5)  like  @SearchValue"
            Else
                sql += "WHERE " & DDLSearch.Items(DDLSearch.SelectedIndex).Value & "=@SearchValue"
                ' ถ้าเป็น rm เข้ามาให้ซ่อนไม่แสดง หมวดความเห็น
                If HttpCookieUtil.hasRolesId(Context.Request.Cookies(FormsAuthentication.FormsCookieName), RoleIdConst.R_RM_USER) = True Or _
                    HttpCookieUtil.hasRolesId(Context.Request.Cookies(FormsAuthentication.FormsCookieName), RoleIdConst.AUDIT_ATTACH) = True Then
                    sql += " AND   FILE_TYPE  <> 4 "
                End If

            End If
            sql += " order by process_date desc"
            '  MsgBox(sql)

            sqlCmd.Parameters.AddWithValue("SearchValue", SearchValue)

        End If


        Dim reader As SqlDataReader = sqlCmd.ExecuteReader()
        GridViewForm.DataSource = reader
        GridViewForm.DataBind()


        If TBSearch.Text = "" Then
            alert("กรุณาระบุข้อมูลที่ต้องการค้นหา")
            Exit Sub
        End If



        ' Catch ex As Exception
        ' alert(ex.Message)
        Exit Sub
        ' End Try
    End Sub

    Protected Sub GridViewForm_PageIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles GridViewForm.PageIndexChanged
        ShowData()
    End Sub
    Protected Sub alert(ByVal str As String)
        ' Response.Write("<script language=javascript>alert('" & str & "')</script>")
        str = "alert('" & str & "');"
        Page.ClientScript.RegisterStartupScript(Me.GetType(), "messagebox", str, True)
    End Sub
End Class
