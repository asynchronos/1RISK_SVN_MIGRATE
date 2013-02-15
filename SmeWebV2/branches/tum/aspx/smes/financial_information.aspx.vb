Imports System.Data
Imports System.Data.SqlClient
Imports System.Globalization
Partial Class smes_financial_information
    Inherits System.Web.UI.Page
    Shared CusDT As DataTable
    Sub ShowData(ByVal smes_id As Integer)

        Dim conn As SqlConnection = Nothing
        'Try
        conn = ConnectionUtil.getSqlConnectionFromWebConfig()
        Dim Sql As String = ""


        ' ต้องมีหลาย store เพราะมีการดึงข้อมูล business คนละที่กัน

        If Request.QueryString("TEMPLATE_ID") = "1" Then
            Sql = "SME_S.P_SS_FINANCIAL_MAIN_SELECT"
        ElseIf Request.QueryString("TEMPLATE_ID") = "2" Then
            Sql = "SME_S.P_SS_FINANCIAL_MAIN_SELECT_FOR_FLOOD"
        ElseIf Request.QueryString("TEMPLATE_ID") = "3" Then
            Sql = "SME_S.P_SS_FINANCIAL_MAIN_TEMPLATE_3_SELECT"
        ElseIf Request.QueryString("TEMPLATE_ID") = "4" Then
            Sql = "SME_S.P_SS_FINANCIAL_MAIN_TEMPLATE_3_SELECT"
        Else
            Sql = "SME_S.P_SS_FINANCIAL_MAIN_TEMPLATE_3_SELECT"
        End If

        Dim sqlCmd As New SqlCommand(Sql, conn)
        sqlCmd.CommandType = CommandType.StoredProcedure
        sqlCmd.Prepare()
        Dim SMES_ID_PARM As SqlParameter = sqlCmd.Parameters.AddWithValue("@SMES_ID", Request.QueryString("SMES_ID"))

        Dim reader As SqlDataReader = sqlCmd.ExecuteReader()

        While reader.Read()
            '   Console.WriteLine(String.Format("{0}, {1}", reader(0), reader(1)))
            If IsDBNull(reader("SMES_ID")) = False Then SMES_IDTextBox.Text = reader("SMES_ID").ToString()
            If IsDBNull(reader("REF_ID")) = False Then Session("REF_ID") = reader("REF_ID").ToString()
            If IsDBNull(reader("BUSINESS_ID_TABLE")) = False Then BUSINESS_ID_TABLETextBox.Text = reader("BUSINESS_ID_TABLE").ToString()
            If IsDBNull(reader("BUSINESS_NAME")) = False Then BUSINESS_NAME_TABLETextBox.Text = reader("BUSINESS_NAME").ToString()

            If IsDBNull(reader("BUSINESS_GROUP_NAME")) = False Then BUSINESS_GROUP_TABLETextBox.Text = reader("BUSINESS_GROUP_NAME").ToString()
            If IsDBNull(reader("BUSINESS_GROUP_ID")) = False Then BUSINESS_GROUP_ID_TABLETextBox.Text = (reader("BUSINESS_GROUP_ID")).ToString()
            If IsDBNull(reader("BUSINESS_GROUP_NAME")) = False Then BUSINESS_GROUPTextBox.Text = reader("BUSINESS_GROUP_NAME").ToString()
            If IsDBNull(reader("BUSINESS_GROUP_ID")) = False Then BUSINESS_GROUP_IDTextBox.Text = (reader("BUSINESS_GROUP_ID")).ToString()


            If IsDBNull(reader("BUSINESS_CODE")) = False Then BUSINESS_CODE_TABLETextBox.Text = reader("BUSINESS_CODE").ToString()

            If IsDBNull(reader("MARGIN_TABLE")) = False Then MARGIN_TABLETextBox.Text = String.Format("{0:n2}", reader("MARGIN_TABLE"))
            If IsDBNull(reader("DSCR_TABLE")) = False Then DSCR_TABLETextBox.Text = String.Format("{0:n2}", reader("DSCR_TABLE"))
            If IsDBNull(reader("AP_TABLE")) = False Then AP_TABLETextBox.Text = String.Format("{0:n2}", reader("AP_TABLE"))
            If IsDBNull(reader("AR_TABLE")) = False Then AR_TABLETextBox.Text = String.Format("{0:n2}", reader("AR_TABLE"))
            If IsDBNull(reader("STOCK_TABLE")) = False Then STOCK_TABLETextBox.Text = String.Format("{0:n2}", reader("STOCK_TABLE"))
            If IsDBNull(reader("LTV_TABLE")) = False Then LTV_TABLETextBox.Text = String.Format("{0:n2}", reader("LTV_TABLE"))
            If IsDBNull(reader("WORKING_CAPITAL_TABLE")) = False Then WORKING_CAPITAL_TABLETextBox.Text = String.Format("{0:n2}", reader("WORKING_CAPITAL_TABLE"))
            If IsDBNull(reader("RATE_TABLE")) = False Then RATE_TABLETextBox.Text = String.Format("{0:n2}", reader("RATE_TABLE"))
            If IsDBNull(reader("CONTRACT_TABLE")) = False Then CONTRACT_TABLETextBox.Text = String.Format("{0:n2}", reader("CONTRACT_TABLE"))
            If IsDBNull(reader("BUSINESS_GROUP_ID")) = False Then BUSINESS_GROUP_ID_TABLETextBox.Text = reader("BUSINESS_GROUP_ID")
            If IsDBNull(reader("PURPOSE_LIST_ID")) = False Then
                PurposeDropDownList.SelectedIndex = PurposeDropDownList.Items.IndexOf(PurposeDropDownList.Items.FindByValue(reader("PURPOSE_LIST_ID")))
            End If
            If IsDBNull(reader("INVEST_IN")) = False Then InvestInTextBox.Text = String.Format("{0:n0}", reader("INVEST_IN"))
            If IsDBNull(reader("TENOR_LIST_ID")) = False Then
                TenorDropDownList.SelectedIndex = TenorDropDownList.Items.IndexOf(TenorDropDownList.Items.FindByValue(reader("TENOR_LIST_ID")))
            End If
            If IsDBNull(reader("COLLATERAL_TYPE_LIST_ID")) = False Then
                CollateralDropDownList.SelectedIndex = CollateralDropDownList.Items.IndexOf(CollateralDropDownList.Items.FindByValue(reader("COLLATERAL_TYPE_LIST_ID")))
            End If
            If IsDBNull(reader("INDUS_WATH_LIST_ID")) = False Then
                WatchListDropDownList.SelectedIndex = WatchListDropDownList.Items.IndexOf(WatchListDropDownList.Items.FindByValue(reader("INDUS_WATH_LIST_ID")))
            End If
            If IsDBNull(reader("NET_PROFIT_LIST_ID")) = False Then
                NetProfitDropDownList.SelectedIndex = NetProfitDropDownList.Items.IndexOf(NetProfitDropDownList.Items.FindByValue(reader("NET_PROFIT_LIST_ID")))
            End If

            If IsDBNull(reader("LIMIT_DEBT")) = False Then LimitDebtTextBox.Text = String.Format("{0:n0}", reader("LIMIT_DEBT"))
            If IsDBNull(reader("TENOR")) = False Then TenorTextBox.Text = String.Format("{0:n0}", reader("TENOR"))



        End While
        reader.Close()
        conn.Close()
    End Sub
    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

        SMES_IDTextBox.Text = Request.QueryString("SMES_ID")



        If Not Page.IsPostBack Then
            If TemplateTextBox.Text = "1" Then
                labelHead.Text = labelHead.Text & " SS Project"
            End If
            If TemplateTextBox.Text = "2" Then
                labelHead.Text = labelHead.Text & " Flood Program"
            End If

            bindDropDown()
            ' MsgBox(Request.QueryString("SMES_ID"))
            If SMES_IDTextBox.Text = "undefined" Then
                SMES_IDTextBox.Text = ""
            End If
            If SMES_IDTextBox.Text <> "" Then
                'MsgBox(SMES_IDTextBox.Text)
                ShowData(SMES_IDTextBox.Text)
                InsertButton.Visible = False
                UpdateButton.Visible = True
            Else
                InsertButton.Visible = True
                UpdateButton.Visible = False
            End If


            TemplateTextBox.Text = Request.QueryString("TEMPLATE_ID")

        End If
    End Sub
    Sub bindDropDown()
        Dim template_id = Request.QueryString("TEMPLATE_ID")
        ' MsgBox(template_id)
        If template_id = "" Then
            Exit Sub
        End If
        ' ดึงข้อมูลใน list ของคำตอบมาใส่ใน drop down
        ' ดึงมาใส่ใน datatable ที่เดียวแล้วใช้ data table filter ไปใส่ใน dropdown
        Dim conn As SqlConnection = Nothing
        conn = ConnectionUtil.getSqlConnectionFromWebConfig()
        'Dim Sql As String = "SME_S.P_SS_LIST_SELECT_LIST_TYPE_TEMPLATE"
        Dim Sql As String = "SME_S.P_SS_LIST_SELECT_LIST_TYPE_ALL"
        Dim sqlCmd As New SqlCommand(Sql, conn)
        sqlCmd.CommandType = CommandType.StoredProcedure
        '  sqlCmd.Parameters.AddWithValue("TEMPLATE_ID", CInt(template_id))

        sqlCmd.Prepare()
        Dim reader As SqlDataReader = sqlCmd.ExecuteReader()
        Dim dt As DataTable = New DataTable()
        dt.Load(reader)

        Dim dr() As DataRow

        dr = dt.Select("LIST_TYPE='14'")
        For i = 0 To dr.GetUpperBound(0)
            Dim item As New ListItem(dr(i)(2), dr(i)(1))
            PurposeDropDownList.Items.Add(item)
        Next i
        PurposeDropDownList.Items.Insert(0, New ListItem("...โปรดเลือก...", ""))

        dr = dt.Select("LIST_TYPE='19'")
        For i = 0 To dr.GetUpperBound(0)
            Dim item2 As New ListItem(dr(i)(2), dr(i)(1))
            TenorDropDownList.Items.Add(item2)
        Next i
        TenorDropDownList.Items.Insert(0, New ListItem("...โปรดเลือก...", ""))

        dr = dt.Select("LIST_TYPE='4'")
        For i = 0 To dr.GetUpperBound(0)
            Dim item As New ListItem(dr(i)(2), dr(i)(1))
            CollateralDropDownList.Items.Add(item)
        Next i
        CollateralDropDownList.Items.Insert(0, New ListItem("...โปรดเลือก...", ""))

        dr = dt.Select("LIST_TYPE='20'")
        For i = 0 To dr.GetUpperBound(0)
            Dim item As New ListItem(dr(i)(2), dr(i)(1))
            WatchListDropDownList.Items.Add(item)
        Next i
        WatchListDropDownList.Items.Insert(0, New ListItem("...โปรดเลือก...", ""))

        dr = dt.Select("LIST_TYPE='13'")
        For i = 0 To dr.GetUpperBound(0)
            Dim item As New ListItem(dr(i)(2), dr(i)(1))
            NetProfitDropDownList.Items.Add(item)
        Next i
        NetProfitDropDownList.Items.Insert(0, New ListItem("...โปรดเลือก...", ""))


        reader.Close()


        conn.Close()

    End Sub
    Protected Sub Button1_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles InsertButton.Click
        SaveData("Insert")
    End Sub
    Sub SaveData(ByVal action As String)

        'declare connection
        Dim conn As SqlConnection = Nothing
        Dim sqlCmd As New SqlCommand()
        Dim sql As String = Nothing
        Dim NEW_SMES_ID As Integer
        Try
            conn = ConnectionUtil.getSqlConnectionFromWebConfig()

            sqlCmd.Connection = conn
            sqlCmd.Transaction = sqlCmd.Connection.BeginTransaction()

            If action = "Insert" Then
                sqlCmd.CommandText = "[SME_S].[P_SS_FINANCIAL_MAIN_INSERT]"
            Else
                sqlCmd.CommandText = "[SME_S].[P_SS_FINANCIAL_MAIN_UPDATE]"
            End If
            sqlCmd.CommandType = CommandType.StoredProcedure


            If REF_IDTextBox.Text = "" Then
                sqlCmd.Parameters.AddWithValue("REF_ID", System.DBNull.Value)
            Else
                sqlCmd.Parameters.AddWithValue("REF_ID", REF_IDTextBox.Text)
            End If


            If BUSINESS_ID_TABLETextBox.Text = "" Then
                sqlCmd.Parameters.AddWithValue("BUSINESS_ID_TABLE", System.DBNull.Value)
            Else
                sqlCmd.Parameters.AddWithValue("BUSINESS_ID_TABLE", BUSINESS_ID_TABLETextBox.Text)
            End If

            If MARGIN_TABLETextBox.Text = "" Then
                sqlCmd.Parameters.AddWithValue("MARGIN_TABLE", System.DBNull.Value)
            Else
                sqlCmd.Parameters.AddWithValue("MARGIN_TABLE", ToDecimal(MARGIN_TABLETextBox.Text))
            End If

            If DSCR_TABLETextBox.Text = "" Then
                sqlCmd.Parameters.AddWithValue("DSCR_TABLE", System.DBNull.Value)
            Else
                sqlCmd.Parameters.AddWithValue("DSCR_TABLE", ToDecimal(DSCR_TABLETextBox.Text))
            End If

            If AP_TABLETextBox.Text = "" Then
                sqlCmd.Parameters.AddWithValue("AP_TABLE", System.DBNull.Value)
            Else
                sqlCmd.Parameters.AddWithValue("AP_TABLE", ToDecimal(AP_TABLETextBox.Text))
            End If

            If AR_TABLETextBox.Text = "" Then
                sqlCmd.Parameters.AddWithValue("AR_TABLE", System.DBNull.Value)
            Else
                sqlCmd.Parameters.AddWithValue("AR_TABLE", ToDecimal(AR_TABLETextBox.Text))
            End If

            If STOCK_TABLETextBox.Text = "" Then
                sqlCmd.Parameters.AddWithValue("STOCK_TABLE", System.DBNull.Value)
            Else
                sqlCmd.Parameters.AddWithValue("STOCK_TABLE", ToDecimal(STOCK_TABLETextBox.Text))
            End If

            If LTV_TABLETextBox.Text = "" Then
                sqlCmd.Parameters.AddWithValue("LTV_TABLE", System.DBNull.Value)
            Else
                sqlCmd.Parameters.AddWithValue("LTV_TABLE", ToDecimal(LTV_TABLETextBox.Text))
            End If
            If WORKING_CAPITAL_TABLETextBox.Text = "" Then
                sqlCmd.Parameters.AddWithValue("WORKING_CAPITAL_TABLE", System.DBNull.Value)
            Else
                sqlCmd.Parameters.AddWithValue("WORKING_CAPITAL_TABLE", ToDecimal(LTV_TABLETextBox.Text))
            End If

            If RATE_TABLETextBox.Text = "" Then
                sqlCmd.Parameters.AddWithValue("RATE_TABLE", System.DBNull.Value)
            Else
                sqlCmd.Parameters.AddWithValue("RATE_TABLE", ToDecimal(RATE_TABLETextBox.Text))
            End If

            If CONTRACT_TABLETextBox.Text = "" Then
                sqlCmd.Parameters.AddWithValue("CONTRACT_TABLE", System.DBNull.Value)
            Else
                sqlCmd.Parameters.AddWithValue("CONTRACT_TABLE", ToDecimal(CONTRACT_TABLETextBox.Text))
            End If

            sqlCmd.Parameters.AddWithValue("BUSINESS_GROUP_ID", BUSINESS_GROUP_IDTextBox.Text)
            sqlCmd.Parameters.AddWithValue("PURPOSE_LIST_ID", PurposeDropDownList.Items(PurposeDropDownList.SelectedIndex).Value)
            sqlCmd.Parameters.AddWithValue("INVEST_IN", InvestInTextBox.Text)
            sqlCmd.Parameters.AddWithValue("TENOR_LIST_ID", TenorDropDownList.Items(TenorDropDownList.SelectedIndex).Value)
            sqlCmd.Parameters.AddWithValue("COLLATERAL_TYPE_LIST_ID", CollateralDropDownList.Items(CollateralDropDownList.SelectedIndex).Value)
            sqlCmd.Parameters.AddWithValue("INDUS_WATH_LIST_ID", WatchListDropDownList.Items(WatchListDropDownList.SelectedIndex).Value)
            sqlCmd.Parameters.AddWithValue("NET_PROFIT_LIST_ID", NetProfitDropDownList.Items(NetProfitDropDownList.SelectedIndex).Value)
            sqlCmd.Parameters.AddWithValue("TEMPLATE_ID", TemplateTextBox.Text)
            sqlCmd.Parameters.AddWithValue("LIMIT_DEBT", ToDecimal(LimitDebtTextBox.Text))
            If TenorTextBox.Text = "" Then
                sqlCmd.Parameters.AddWithValue("TENOR", System.DBNull.Value)
            Else
                sqlCmd.Parameters.AddWithValue("TENOR", ToDecimal(TenorTextBox.Text))
            End If

            If action = "Insert" Then
                Dim SMES_ID_OUT As New SqlParameter("@SMES_ID_OUT", SqlDbType.Int)
                SMES_ID_OUT.Direction = ParameterDirection.Output
                sqlCmd.Parameters.Add(SMES_ID_OUT)
                sqlCmd.Parameters.AddWithValue("CREATE_USER", USERTextBox.Text)
            Else
                sqlCmd.Parameters.AddWithValue("SMES_ID", SMES_IDTextBox.Text)
                sqlCmd.Parameters.AddWithValue("UPDATE_USER", USERTextBox.Text)
            End If

            sqlCmd.ExecuteNonQuery()

            If action = "Insert" Then
                NEW_SMES_ID = CType(sqlCmd.Parameters("@SMES_ID_OUT").Value, Integer)
                SMES_IDTextBox.Text = NEW_SMES_ID
            End If

            sqlCmd.Transaction.Commit()
        Catch ex As Exception
            ' sqlCmd.Transaction.Rollback()
            runScirpt("showErrorDialog('Cannot save data. \n " & ex.Message.ToString.Replace("'", "") & "');")
            Exit Sub
        Finally
            If (conn.State = ConnectionState.Open) Then
                conn.Close()
            End If
            conn = Nothing

            Dim jscript As String = ""
            'If action = "Insert" Then
            '    jscript = jscript & "changeMain('Insert Complete.',""" & SMES_IDTextBox.Text & """);"
            'Else
            '    jscript = jscript & "changeMain('Update Complete.',""" & SMES_IDTextBox.Text & """);"
            'End If

            If action = "Insert" Then
                InsertButton.Visible = False
                UpdateButton.Visible = True
                jscript = jscript & "showDialog('Insert Complete');"
                jscript = jscript & "changeMenu(" & SMES_IDTextBox.Text & "," & TemplateTextBox.Text & ");"
                'jscript = jscript & "alert('Insert Complete');"
            Else
                jscript = jscript & "showDialog('Update Complete');"
                'jscript = jscript & "alert('Insert Complete');"
            End If
            runScirpt(jscript)  ' เรียก javascript 
        End Try

    End Sub
    Private Function ToDecimal(ByVal Value As String) As Decimal

        If Value.Length = 0 Then
            Return 0
        ElseIf Value = "Nan" Then
            Return 0
        Else
            'Return [Decimal].Parse(Value.Replace(",", ""), NumberStyles.AllowThousands Or NumberStyles.AllowDecimalPoint Or NumberStyles.AllowCurrencySymbol)
            Return CDec(Value.Replace(",", ""))
        End If
    End Function

    Protected Sub runScirpt(ByVal str As String)
        str = " $(document).ready(function(){" & str & "});"
        Page.ClientScript.RegisterStartupScript(Me.GetType(), "", str, True)
    End Sub

    Protected Sub UpdateButton_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles UpdateButton.Click
        SaveData("Update")
    End Sub


End Class
