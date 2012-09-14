
Partial Class aspx_stop_stopin
    Inherits System.Web.UI.Page

    Protected Sub GridView1_RowDataBound(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewRowEventArgs) Handles GridView1.RowDataBound
        If e.Row.RowType = DataControlRowType.Header Then
            For i As Integer = 0 To 16
                e.Row.Cells(i).BackColor = Drawing.Color.CadetBlue
            Next
            For i As Integer = 17 To 24
                e.Row.Cells(i).BackColor = Drawing.Color.BlueViolet
            Next
            For i As Integer = 25 To 30
                e.Row.Cells(i).BackColor = Drawing.Color.BurlyWood
            Next

        End If

        If e.Row.RowType = DataControlRowType.Header _
         Or e.Row.RowType = DataControlRowType.DataRow Then
            ' กำหนดให้ fix column
            e.Row.Cells(0).Style("position") = "relative"
            e.Row.Cells(1).Style("position") = "relative"

        End If
        If e.Row.RowType = DataControlRowType.Pager Then
            ' e.Row.Cells(0).Style("position") = "relative"
            ' e.Row.Cells(0).BackColor = Drawing.Color.White
        End If
        If e.Row.RowType = DataControlRowType.DataRow Then
        

            e.Row.Attributes.Add("onclick", "this.originalcolor=this.style.backgroundColor;" + " this.style.backgroundColor='Silver';")
            Dim BtnOut As Button = e.Row.FindControl("BtnOut")
            BtnOut.Attributes.Add("onclick", "javscript:return confirm('คุณต้องการย้ายข้อมูลออกจากรายการหรือไม่');")


            Dim BtnReject As Button = e.Row.FindControl("BtnReject")
            BtnReject.Attributes.Add("onclick", "javscript:return confirm('คุณต้องการย้ายข้อมูลออกจากรายการถาวรหรือไม่');")

            If e.Row.DataItem("HAS_OTHER_CLASS_IN") = "Y" Then
                e.Row.Cells(9).Text = "YES"
            Else
                e.Row.Cells(9).Text = "NO"
            End If
            If e.Row.DataItem("IS_TDR_IN") = "Y" Then
                e.Row.Cells(11).Text = "YES"
            Else
                e.Row.Cells(11).Text = "NO"
            End If

            If e.Row.DataItem("aging_criteria_in") = "Y" Then
                e.Row.Cells(18).BackColor = Drawing.Color.Pink
            End If
            If e.Row.DataItem("class_criteria_in") = "Y" Then
                e.Row.Cells(19).BackColor = Drawing.Color.Pink
                e.Row.Cells(19).Text = "YES"
            End If
            If e.Row.DataItem("tdr_criteria_in") = "Y" Then
                e.Row.Cells(20).BackColor = Drawing.Color.Pink
                e.Row.Cells(20).Text = "YES"
            End If
            If e.Row.DataItem("od_utilize_criteria_in") = "Y" Then
                e.Row.Cells(21).BackColor = Drawing.Color.Pink
            End If
            If e.Row.DataItem("judgement_criteria_in") = "Y" Then
                e.Row.Cells(22).BackColor = Drawing.Color.Pink
            End If
            If e.Row.DataItem("business_criteria_in") = "Y" Then
                e.Row.Cells(23).BackColor = Drawing.Color.Pink
                e.Row.Cells(24).BackColor = Drawing.Color.Pink
            End If


        End If
    End Sub


    Protected Sub GridView1_RowUpdated(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewUpdatedEventArgs) Handles GridView1.RowUpdated
        alert("บันทึกข้อมูลเรียบร้อยแล้ว")

    End Sub

    Protected Sub BtnSearch_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles BtnSearch.Click
        'Dim sql As String = Nothing
        'sql = "SELECT * FROM [STOP_CUSTOMER_DESC]  "
        'sql = sql & " WHERE " & DDLSEARCH.Items(DDLSEARCH.SelectedIndex).Value & " = '" & TBSearch.Text & "'"
        'sql = sql & " ORDER  BY CIF"

        'SqlDataSource1.SelectCommand = sql
        Dim strValue As String = Nothing
        Dim strOper As String = Nothing

        If DDLSEARCH.Items(DDLSEARCH.SelectedIndex).Value = "CIF" Then
            If IsNumeric(TBSearch.Text) = False Then
                alert("กรุณากรอก cif ด้วยตัวเลข")
                TBSearch.Text = ""
                Exit Sub
            End If
        End If


        If DDLSEARCH.Items(DDLSEARCH.SelectedIndex).Value = "REGION_CONTROLLING_UNIT" Then
            strOper = "="
            strValue = DDLregion.Items(DDLregion.SelectedIndex).Value
            strValue = "'" & strValue & "'"
        ElseIf DDLSEARCH.Items(DDLSEARCH.SelectedIndex).Value = "CM_NAME" Then
            strOper = "like"
            strValue = TBSearch.Text.Replace("'", "")
            strValue = "'%" & strValue & "%'"

        Else
            strOper = "="
            strValue = TBSearch.Text.Replace("'", "")
        End If


        SqlDataSource1.SelectParameters.Clear()


        Dim parameter1 = New Parameter("SField", TypeCode.String, DDLSEARCH.Items(DDLSEARCH.SelectedIndex).Value)
        Dim parameter2 = New Parameter("SOper", TypeCode.String, strOper)
        Dim parameter3 = New Parameter("SValue", TypeCode.String, strValue)

        SqlDataSource1.SelectParameters.Add(parameter1)
        SqlDataSource1.SelectParameters.Add(parameter2)
        SqlDataSource1.SelectParameters.Add(parameter3)


        'Dim sql As String = Nothing
        'sql = "SELECT * FROM [STOP_CUSTOMER_DESC]  "
        'sql = sql & " WHERE @SField = @SValue "
        'sql = sql & " ORDER  BY CIF"

        SqlDataSource1.SelectCommandType = SqlDataSourceCommandType.StoredProcedure
        SqlDataSource1.SelectCommand = "S10_SELECT_STOP_CUSTOMER_FILTER"

        'SqlDataSource1.SelectCommandType = SqlDataSourceCommandType.Text

    End Sub

    Protected Sub DDLSEARCH_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles DDLSEARCH.Load
        If Not Page.IsPostBack Then
            Dim list1 As New ListItem("CIF (ลูกค้า)", "CIF")
            DDLSEARCH.Items.Add(list1)
            Dim list2 As New ListItem("CM CODE (รหัสพนักงาน)", "CM_CODE")
            DDLSEARCH.Items.Add(list2)
            Dim list3 As New ListItem("CM NAME (ชื่อพนักงาน)", "CM_NAME")
            DDLSEARCH.Items.Add(list3)
            Dim list4 As New ListItem("REGION CONTROLLING (ภาค)", "REGION_CONTROLLING_UNIT")
            DDLSEARCH.Items.Add(list4)
            DDLSEARCH.Attributes.Add("onchange", "ShowDropDownRegion(this)")

        End If

        If DDLSEARCH.Items(DDLSEARCH.SelectedIndex).Value = "REGION_CONTROLLING_UNIT" Then
            TBSearch.Style("display") = "none"
            DDLregion.Style("display") = "inline"
        Else
            TBSearch.Style("display") = "inline"
            DDLregion.Style("display") = "none"
        End If
    End Sub

    Sub alert(ByVal str1 As String)

        Dim str = "alert(""" & str1 & """);"
        Page.ClientScript.RegisterStartupScript(Me.GetType(), "messagebox", str, True)

    End Sub
    Protected Sub BtnShowAll_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles BtnShowAll.Click
        Dim sql As String = Nothing
        sql = "SELECT * FROM [STOP_CUSTOMER_DESC]  "
        sql = sql & " ORDER  BY CIF"
        Session("sql") = sql
        SqlDataSource1.SelectCommandType = SqlDataSourceCommandType.Text
        SqlDataSource1.SelectCommand = Session("sql")

    End Sub

    Protected Sub reject(ByVal sender As Object, ByVal e As System.EventArgs)
        Dim BtnReject As Button = DirectCast(sender, Button)
        Dim hf As HiddenField = BtnReject.Parent.FindControl("HCIF")

        SqlDataSource1.UpdateParameters.Clear()

        Dim parameter1 = New Parameter("CIF", TypeCode.String, hf.Value.ToString)
        Dim parameter2 = New Parameter("COMMENT", TypeCode.String, "")

        SqlDataSource1.UpdateParameters.Add(parameter1)
        SqlDataSource1.UpdateParameters.Add(parameter2)

        SqlDataSource1.UpdateCommandType = SqlDataSourceCommandType.StoredProcedure
        SqlDataSource1.UpdateCommand = "S15_MOVE_2_STOP_CUSTOMER_EXCEPTION"
        SqlDataSource1.Update()


        SqlDataSource1.SelectCommandType = SqlDataSourceCommandType.Text
        SqlDataSource1.SelectParameters.Clear()
        SqlDataSource1.SelectCommand = Session("sql")


    End Sub

    Protected Sub SqlDataSource1_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles SqlDataSource1.Load
        Session("sql") = SqlDataSource1.SelectCommand
    End Sub

End Class
