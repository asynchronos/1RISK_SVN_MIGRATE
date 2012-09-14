Namespace aspx.stop
    Partial Class stop_in
        Inherits aspx.MyPageClass

        Protected Sub GridView1_PageIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles GridView1.PageIndexChanged
            If HcommandType.Value = "search" Then
                ShowData("search")
            Else
                ShowData("all")
            End If
            'If Session("cmd") = "search" Then
            '    ShowData("search")
            'Else
            '    ShowData("all")
            'End If
        End Sub
        Protected Sub GridView1_RowDataBound(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewRowEventArgs) Handles GridView1.RowDataBound
            If e.Row.RowType = DataControlRowType.Header Then
                For i As Integer = 8 To 13
                    e.Row.Cells(i).BackColor = Drawing.Color.CadetBlue

                Next
                For i As Integer = 14 To 23
                    e.Row.Cells(i).BackColor = Drawing.Color.BlueViolet
                Next
                For i As Integer = 24 To GridView1.Columns.Count - 1
                    e.Row.Cells(i).BackColor = Drawing.Color.MidnightBlue
                    If Request("type") = "ss" Or Request("type") = "sm" Then
                        If e.Row.Cells(i).Text = "รายละเอียดการชำระ" Then
                            e.Row.Cells(i).Text = "รายละเอียดการชำระของ RM "
                        End If
                    End If
                Next
            End If

            If e.Row.RowType = DataControlRowType.Header _
             Or e.Row.RowType = DataControlRowType.DataRow Then
                ' กำหนดให้ fix column ไม่ให้เลื่อนขวาตาม scroll
                e.Row.Cells(0).Style("position") = "relative"
                e.Row.Cells(1).Style("position") = "relative"
                e.Row.Cells(2).Style("position") = "relative"

            End If
            If e.Row.RowType = DataControlRowType.Pager Then
                ' e.Row.Cells(0).Style("position") = "relative"
                ' e.Row.Cells(0).BackColor = Drawing.Color.White
            End If
            If e.Row.RowType = DataControlRowType.DataRow Then


                'e.Row.Attributes.Add("onclick", "this.originalcolor=this.style.backgroundColor;" + " this.style.backgroundColor='Silver';")
                ' Dim BtnOut As Button = e.Row.FindControl("BtnOut")
                '  BtnOut.Attributes.Add("onclick", "javscript:return confirm('คุณต้องการย้ายข้อมูลออกจากรายการหรือไม่');")


                ' Dim BtnReject As Button = e.Row.FindControl("BtnReject")
                '  BtnReject.Attributes.Add("onclick", "javscript:return confirm('คุณต้องการย้ายข้อมูลออกจากรายการถาวรหรือไม่');")

                Dim Btn As HyperLink = e.Row.FindControl("ImgEdit")
                Dim hf As HiddenField = e.Row.FindControl("HCIF")
                Dim s1 As String = String.Empty
                If e.Row.FindControl("HCIF") Is Nothing <> True Then
                    s1 += "window.open('stop_update.aspx"
                    s1 += "?cif=" & hf.Value
                    s1 += "&type=" & Request("type")
                    Btn.Attributes.Add("onclick", s1 & "','pop', 'width=800, height=600');")
                    Btn.Style("cursor") = "pointer"   ' auto,crosshair ,default,pointer,help,move,Text,wait, e(-resize, w - resize, n - resize, s - resize, ne - resize, nw - resize, se - resize, sw - resize)
                End If

            End If
        End Sub
        Protected Sub BtnSearch_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles BtnSearch.Click
            'MsgBox("click search")
            ShowData("search")
            'HcommandType.Value = "search"
        End Sub
        Protected Sub DDLSEARCH_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles DDLSEARCH.Load
            If Not Page.IsPostBack Then
                Dim list1 As New ListItem("CIF ", "CIF")
                DDLSEARCH.Items.Add(list1)
                Dim list2 As New ListItem("รหัสพนักงาน", "CM_CODE")
                DDLSEARCH.Items.Add(list2)
                Dim list3 As New ListItem("ชื่อพนักงาน", "CM_NAME")
                DDLSEARCH.Items.Add(list3)
                Dim list4 As New ListItem("ภาค", "REGION_NAME")
                DDLSEARCH.Items.Add(list4)
                Dim list5 As New ListItem("รายละเอียดการชำระ ", "PAY_STATUS_DETAIL")
                DDLSEARCH.Items.Add(list5)
                Dim list6 As New ListItem("การดำเนินการ ", "ACTION_DETAIL")
                DDLSEARCH.Items.Add(list6)

                DDLSEARCH.Attributes.Add("onchange", "ShowDropDownRegion(this)")

            End If
            ' ใส่ style หลังจาก postpack ด้วย
            TBSearch.Style("display") = "none"
            DDLregion.Style("display") = "none"
            DDLaction.Style("display") = "none"
            DDLpay.Style("display") = "none"

            If DDLSEARCH.Items(DDLSEARCH.SelectedIndex).Value = "REGION_CONTROLLING_UNIT" Then
                DDLregion.Style("display") = "inline"
            ElseIf DDLSEARCH.Items(DDLSEARCH.SelectedIndex).Value = "ACTION_DETAIL" Then
                DDLaction.Style("display") = "inline"
            ElseIf DDLSEARCH.Items(DDLSEARCH.SelectedIndex).Value = "PAY_STATUS_DETAIL" Then
                DDLpay.Style("display") = "inline"
            Else
                TBSearch.Style("display") = "inline"


            End If
        End Sub
        Sub alert(ByVal str1 As String)

            Dim str = "alert(""" & str1 & """);"
            Page.ClientScript.RegisterStartupScript(Me.GetType(), "messagebox", str, True)

        End Sub
        Protected Sub BtnShowAll_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles BtnShowAll.Click

            ShowData("all")
            'HcommandType.Value = "all"
            'Session("cmd") = "all"
        End Sub
        Sub ShowData(ByVal mode As String)
            On Error Resume Next

            Dim strValue As String = Nothing
            Dim strOper As String = Nothing
            Dim strField As String = Nothing
            HcommandType.Value = mode
            If mode = "search" Then
                strField = DDLSEARCH.Items(DDLSEARCH.SelectedIndex).Value

                If strField = "CIF" Then
                    If IsNumeric(TBSearch.Text) = False Then
                        alert("กรุณากรอก cif ด้วยตัวเลข")
                        TBSearch.Text = ""
                        Exit Sub
                    End If
                End If

                If strField = "REGION_NAME" Then
                    strOper = "="
                    strValue = DDLregion.Items(DDLregion.SelectedIndex).Value
                    strValue = "'" & strValue & "'"
                ElseIf strField = "ACTION_DETAIL" Then
                    strOper = "="
                    strValue = DDLaction.Items(DDLaction.SelectedIndex).Value
                    strValue = "'" & strValue & "'"
                ElseIf strField = "PAY_STATUS_DETAIL" Then
                    strOper = "="
                    strValue = DDLpay.Items(DDLpay.SelectedIndex).Value
                    strValue = "'" & strValue & "'"
                ElseIf strField = "CM_NAME" Then
                    strOper = "like"
                    strValue = TBSearch.Text.Replace("'", "")
                    strValue = "'%" & strValue & "%'"

                Else
                    strOper = "="
                    strValue = TBSearch.Text.Replace("'", "")
                End If

                '   MsgBox(strValue)
            Else  '   if mode  <>  search

                strField = " "
                strOper = " "
                strValue = " "

            End If       '  -------------------------    If mode = "search" Then

            SqlDataSource1.SelectParameters.Clear()

            Dim strType As String = Request("type").ToString
            Dim strEmp_ID As String = Session("emp_id")
            Dim strNew As String = CheckBox1.Checked

            If strType = "" Then strType = "st"
            If strEmp_ID = "" Then strEmp_ID = "000001"

            'If User.IsInRole("0000000001") Or User.IsInRole("0000000002") Or User.IsInRole("0000000005") Then
            '    strEmp_ID = "000001"
            'End If


            Dim parameter1 = New Parameter("SField", TypeCode.String, strField)
            Dim parameter2 = New Parameter("SOper", TypeCode.String, strOper)
            Dim parameter3 = New Parameter("SValue", TypeCode.String, strValue)
            Dim parameter4 = New Parameter("SType", TypeCode.String, strType)
            Dim parameter5 = New Parameter("EMP_ID", TypeCode.String, strEmp_ID)
            Dim parameter6 = New Parameter("Snew", TypeCode.String, strNew)


            SqlDataSource1.SelectParameters.Add(parameter1)
            SqlDataSource1.SelectParameters.Add(parameter2)
            SqlDataSource1.SelectParameters.Add(parameter3)
            SqlDataSource1.SelectParameters.Add(parameter4)
            SqlDataSource1.SelectParameters.Add(parameter5)
            SqlDataSource1.SelectParameters.Add(parameter6)

            'Dim sql As String = Nothing
            'sql = "SELECT * FROM [STOP_CUSTOMER_DESC]  "
            'sql = sql & " WHERE @SField = @SValue "
            'sql = sql & " ORDER  BY CIF"

            SqlDataSource1.SelectCommandType = SqlDataSourceCommandType.StoredProcedure

            SqlDataSource1.SelectCommand = "S10_SELECT_STOP_CUSTOMER_FILTER"

            If Err.Description <> "" Then
                alert(Err.Description)
                Err.Clear()
            End If

        End Sub
        Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
            If Not Page.IsPostBack Then
                ShowData("all")
                BindDropdownRegion()
                BindDropdownAction()
                BindDropdownPay()

                If Request("type") = "sm" Then
                    LblHead.Text = "TDR REQUEST CUSTOMERS"
                ElseIf Request("type") = "ss" Then
                    LblHead.Text = "SPECIAL MENTION CUSTOMERS"
                Else '  type="st"
                    LblHead.Text = "STOP CUSTOMERS"
                End If
                ' กำหนดชื่อไฟล์ excell ให้กับ control

                ' แสดงวันที่อัพเดทข้อมูล
                Dim dv As Data.DataView

                dv = CType(SqlDataSource5.Select(DataSourceSelectArguments.Empty), Data.DataView)
                lblmaxday.Text += " (" + CType(dv.Table.Rows(0)(0), Date) + ")"
                lblmaxmonth.Text += " (" + CType(dv.Table.Rows(0)(1), Date) + ")"

            Else
                'MsgBox(HcommandType.Value)
                ' กำหนดให้ export control ดึงค่า

                If HcommandType.Value = "search" Then
                    'MsgBox("showexport")
                    ShowData("search")
                End If
                If HcommandType.Value = "all" Then
                    ShowData("all")
                End If
                ExportControl1.Filename = LblHead.Text.Replace(" ", "_")



            End If


        End Sub
        Sub BindDropdownRegion()

            '  ----------  ดึงค่าใส่ dropdown region
            Dim selectCommand As String
            Dim emp_id As String = Session("emp_id")
            'If emp_id = "" Then emp_id = "000001"
            If User.IsInRole("0000000001") Or User.IsInRole("0000000002") Or User.IsInRole("0000000005") Then
                'emp_id = "000001"
            End If

            If Request("type") = "sm" Then
                selectCommand = "  SELECT  REGION_NAME  FROM [STOP_CUSTOMER_DESC_FULL_DUP_SM_G4]  C"
            ElseIf Request("type") = "ss" Then
                selectCommand = "  SELECT  REGION_NAME  FROM [STOP_CUSTOMER_DESC_FULL_DUP_SM_NOT_G4]  C"
            Else  ' type='st'
                selectCommand = "  SELECT  REGION_NAME  FROM [STOP_CUSTOMER_DESC_FULL_NO_DUP_SM]  C "
            End If
            If emp_id = "000001" Then ' ไม่ต้องหาลูกค้าเพราะว่าเห็นหมด
                selectCommand += "  WHERE  EXISTS (SELECT EMP_ID FROM [Bay01].[dbo].[FControllingLineFullDescByEMP_ID_SHOW_REGION]('" & emp_id & "') E WHERE C.CM_CODE=E.EMP_ID ) "
            End If
            selectCommand += " GROUP BY  REGION_NAME "
            selectCommand += " ORDER BY  REGION_NAME"
            'MsgBox(selectCommand)
            SqlDataSource2.SelectCommand = selectCommand

        End Sub
        Sub BindDropdownAction()

            '  ----------  ดึงค่าใส่ dropdown region
            Dim selectCommand As String
            Dim emp_id As String = Session("emp_id")
            If emp_id = "" Then emp_id = "000001"

            If User.IsInRole("0000000001") Or User.IsInRole("0000000002") Or User.IsInRole("0000000005 ") Then
                emp_id = "000001"
            End If

            If Request("type") = "sm" Then
                selectCommand = "  SELECT  ACTION_DETAIL  FROM [STOP_CUSTOMER_DESC_FULL_DUP_SM_G4]  C"
            ElseIf Request("type") = "ss" Then
                selectCommand = "  SELECT  ACTION_DETAIL  FROM [STOP_CUSTOMER_DESC_FULL_DUP_SM_NOT_G4]  C"
            Else  ' type='st'
                selectCommand = "  SELECT  ACTION_DETAIL  FROM [STOP_CUSTOMER_DESC_FULL_NO_DUP_SM]  C "
            End If
            If emp_id = "000001" Then ' ไม่ต้องหาลูกค้าเพราะว่าเห็นหมด
                selectCommand += "  WHERE  EXISTS (SELECT EMP_ID FROM [Bay01].[dbo].[FControllingLineFullDescByEMP_ID]('" & emp_id & "') E WHERE C.CM_CODE=E.EMP_ID ) "
            End If
            selectCommand += " GROUP BY  ACTION_DETAIL "
            selectCommand += " ORDER BY  ACTION_DETAIL"
            SqlDataSource3.SelectCommand = selectCommand

        End Sub
        Sub BindDropdownPay()

            '  ----------  ดึงค่าใส่ dropdown region
            Dim selectCommand As String
            Dim emp_id As String = Session("emp_id")
            If emp_id = "" Then emp_id = "000001"

            If User.IsInRole("0000000001") Or User.IsInRole("0000000002") Or User.IsInRole("0000000005") Then
                emp_id = "000001"
            End If
            '   PAY_STATUS_DETAIL  เกิดจาก ฟิว idstatusG_thai ใน กรณ๊ที่เป็น sm และ  pay_ability_detail กรณีที่เป็น st
            '  สร้างขึ้นเพื่อทำให้ค้นหาได้จากหลายวิว ที่มีข้อมูลจากคนละแหล่ง
            '  และเพื่อรอให้ต้น แก้ไขข้อมูลใน dropdown ให้ตรงกับใน st
            If Request("type") = "sm" Then
                selectCommand = "  SELECT  PAY_STATUS_DETAIL  FROM [STOP_CUSTOMER_DESC_FULL_DUP_SM_G4]  C"
            ElseIf Request("type") = "ss" Then
                selectCommand = "  SELECT  PAY_STATUS_DETAIL  FROM [STOP_CUSTOMER_DESC_FULL_DUP_SM_NOT_G4]  C"
            Else  ' type='st'
                selectCommand = "  SELECT  PAY_STATUS_DETAIL  FROM [STOP_CUSTOMER_DESC_FULL_NO_DUP_SM]  C "
            End If
            If emp_id = "000001" Then ' ไม่ต้องหาลูกค้าเพราะว่าเห็นหมด
                selectCommand += "  WHERE  EXISTS (SELECT EMP_ID FROM [Bay01].[dbo].[FControllingLineFullDescByEMP_ID]('" & emp_id & "') E WHERE C.CM_CODE=E.EMP_ID ) "
            End If
            selectCommand += " GROUP BY  PAY_STATUS_DETAIL "
            selectCommand += " ORDER BY  PAY_STATUS_DETAIL"
            SqlDataSource4.SelectCommand = selectCommand

        End Sub

    End Class

End Namespace