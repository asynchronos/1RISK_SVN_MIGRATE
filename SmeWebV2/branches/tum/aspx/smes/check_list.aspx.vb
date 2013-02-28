Imports System.Data
Imports System.Data.SqlClient
Imports System.Globalization
Imports log4net

Partial Class smes_check_list
    Inherits System.Web.UI.Page
    Shared Result_A As Integer
    Shared Result_R As Integer
    Shared Result_O As Integer
    Shared Result_S As Integer
    Private Shared ReadOnly log As ILog = LogManager.GetLogger(System.Reflection.MethodBase.GetCurrentMethod().DeclaringType)
    Private Shared ReadOnly isDebugEnabled As Boolean = log.IsDebugEnabled

    Sub ShowCheckList()

        Try

            Dim result As String = ""
            Dim cnn As New SqlConnection
            cnn = ConnectionUtil.getSqlConnectionFromWebConfig()

            ' ส่วนแรกดึงข้อมูล check list เพื่อ สร้าง control

            Dim cmd As SqlCommand = New SqlCommand()
            cmd.Connection = cnn
            Dim sql As String = "SME_S.P_SS_CHECK_LIST_SELECT"
            cmd.CommandType = CommandType.StoredProcedure
            cmd.Parameters.AddWithValue("TEMPLATE_ID", Request.QueryString("TEMPLATE_ID"))
            cmd.CommandText = sql
            Dim dt As DataTable = New DataTable()
            cmd.ExecuteNonQuery()
            Dim dr As SqlDataReader = cmd.ExecuteReader()
            dt.Load(dr)



            ' ส่วนที่ 2 ดึงค่าเก่าที่เคยตอบไปแล้ว
            '' ดึงข้อมูลถ้าเคยมีการกรอกในใน smes_id นี้
            Dim cmd2 As SqlCommand = New SqlCommand()
            cmd2.Connection = cnn
            Dim sql2 As String = "SME_S.P_SS_CHECK_LIST_SELECT_VALUE"
            cmd2.CommandType = CommandType.StoredProcedure
            cmd2.Parameters.AddWithValue("SMES_ID", Request.QueryString("SMES_ID"))
            cmd2.Parameters.AddWithValue("SMES_TYPE", Request.QueryString("SMES_TYPE"))

            cmd2.CommandText = sql2
            Dim dt2 As DataTable = New DataTable()
            cmd2.ExecuteNonQuery()
            Dim dr2 As SqlDataReader = cmd2.ExecuteReader()
            dt2.Load(dr2)


            cnn.Close()




            Dim CG As String = Nothing
            Dim CD As String = Nothing

            Dim endQT As Boolean = False
            Dim endQG As Boolean = False

            Dim pkRA As Panel = Nothing
            Dim pkRO As Panel = Nothing
            Dim pkRR As Panel = Nothing
            Dim pkRS As Panel = Nothing
            Dim chkname As String = Nothing

            For i = 0 To dt.Rows.Count - 1

                If dt.Rows(i).Item("CK_GROUP_ID").ToString <> CG Then          ' ตัวแปรเช็คชื่อ Group ถ้าไม่เท่ากันแสดงว่าขึ้น Group ใหม่
                    Dim hl As New LiteralControl
                    hl.Text += "<h3 class='clear ckGroupName ui-widget-header2'><div>" & dt.Rows(i).Item("CK_GROUP_NAME") & "</div></h3>"
                    PanelForm.Controls.Add(hl)
                End If


                If dt.Rows(i).Item("CK_ID").ToString <> CD Then   ' ตัวแปรเช็คชื่อข้อไม่เท่ากันแสดงว่าขึ้นข้อใหม่

                    Dim hl As New LiteralControl
                    hl.Text += "<h4 class='clear ckName ui-widget-contentChk'><div>&nbsp;&nbsp;&nbsp;&nbsp;" & dt.Rows(i).Item("CK_NAME") & "</div></h3>"
                    PanelForm.Controls.Add(hl)

                    pkRA = New Panel
                    Dim resultA As New LiteralControl
                    resultA.Text += "<div class='divResultHead ui-state-a'><i class='icon-ok icon-white'></i>&nbsp;SME-SS (In scope)</div>"
                    pkRA.Controls.Add(resultA)

                    pkRO = New Panel
                    Dim resultO As New LiteralControl
                    resultO.Text += "<div class='divResultHead ui-state-o'><i class='icon-share-alt icon-white'></i>&nbsp;SME-SS (Out of scope)</div>"
                    pkRO.Controls.Add(resultO)

                    pkRS = New Panel
                    Dim resultS As New LiteralControl
                    resultS.Text += "<div class='divResultHead ui-state-s'><i class='icon-share-alt icon-white'></i>&nbsp;SME-S</div>"
                    pkRS.Controls.Add(resultS)


                    pkRR = New Panel
                    Dim resultR As New LiteralControl
                    resultR.Text += "<div class='divResultHead ui-state-error ui-corner-all'><i class='icon-remove icon-white'></i>&nbsp;Reject</div>"
                    pkRR.Controls.Add(resultR)

                    pkRA.CssClass = "divResult ui-widget-content"
                    pkRO.CssClass = "divResult ui-widget-content"
                    pkRS.CssClass = "divResult ui-widget-content"
                    pkRR.CssClass = "divResult ui-widget-content"



                Else
                    '  Response.Write("ยังไม่ขึ้น")
                End If

                CG = dt.Rows(i).Item("CK_GROUP_ID").ToString  ' กำหนดค่า group id เพื่อใช้เปรียบเทียบการขึ้น group ใหม่
                CD = dt.Rows(i).Item("CK_ID").ToString ' กำหนดค่า ck list id เพื่อใช้เปรียบเทียบการขึ้น check list ใหม่

                Dim pk As New Panel
                pk.CssClass = "divCK"


                Dim ck As New CheckBox
                ck.ID = "idCK" & dt.Rows(i).Item("CK_DETAIL_ID")

                If IsDBNull(dt.Rows(i).Item("RESULT")) = False Then
                    result = dt.Rows(i).Item("RESULT")
                Else
                    result = ""
                End If

                Dim rk As New Label
                rk.ID = "idRK" & dt.Rows(i).Item("CK_DETAIL_ID")
                rk.Text = result
                'rk.Visible = False


                Dim lk As New LiteralControl
                lk.Text = dt.Rows(i).Item("CK_DETAIL_NAME")


                pk.Controls.Add(ck)
                'pk.Controls.Add(rk)
                pk.Controls.Add(lk)

                'Response.Write(ck.ID & "-result=" & result & "<br>")

                If result = "A" Then
                    pkRA.Controls.Add(pk)
                    PanelForm.Controls.Add(pkRA)
                ElseIf result = "O" Then
                    pkRO.Controls.Add(pk)
                    PanelForm.Controls.Add(pkRO)
                ElseIf result = "S" Then
                    pkRS.Controls.Add(pk)
                    PanelForm.Controls.Add(pkRS)
                ElseIf result = "R" Then
                    pkRR.Controls.Add(pk)
                    PanelForm.Controls.Add(pkRR)
                End If










            Next

            'PanelForm.Controls.Add(New LiteralControl(imgStr))
            Dim en As New LiteralControl
            en.Text = ""
            PanelForm.Controls.Add(en)


            For y = 0 To dt2.Rows.Count - 1

                Dim DL As CheckBox = Me.FindControl("idCK" & dt2.Rows(y).Item("CK_DETAIL_ID"))
                DL.Checked = True
                'Dim rk As Label = Me.FindControl("idRK" & dt2.Rows(y).Item("CK_DETAIL_ID"))
                'rk.Visible = True


                If IsNothing(DL) = False Then


                    'countResult(dt2.Rows(y).Item("RESULT"))
                    result = dt2.Rows(y).Item("RESULT")
                    If result = "A" Then
                        Result_A = Result_A + 1
                        'rk.CssClass = "ui-state-highlight"
                    ElseIf result = "O" Then
                        Result_O = Result_O + 1
                        'rk.CssClass = "ui-state-error" 
                    ElseIf result = "S" Then
                        Result_S = Result_S + 1
                        'rk.CssClass = "ui-state-error"

                    ElseIf result = "R" Then
                        Result_R = Result_R + 1
                        'rk.CssClass = "ui-state-error"
                    End If
                Else
                    Response.Write("Cannot find :" & dt2.Rows(y).Item("CK_DETAIL_ID"))
                End If
            Next

            showResult()

        Catch ex As Exception
            log.Error(ex.Message, ex)
        End Try

    End Sub

    Sub showResult()

        ' เรียงตามความสำคัญของการกรองข้อมูลออก
        If Result_R > 0 Then
            ResultLabel.Text = "REJECT"
            ResultLabel.CssClass = "ui-state-error"
        ElseIf Result_S > 0 Then
            ResultLabel.Text = "Go to SME-S"
            ResultLabel.CssClass = "ui-state-s"
        ElseIf Result_O > 0 Then
            ResultLabel.Text = "OUT OF SCOPE"
            ResultLabel.CssClass = "ui-state-error"
        ElseIf Result_A > 0 Then
            ResultLabel.Text = "ACCEPTABLE"
            ResultLabel.CssClass = "ui-state-highlight"
        End If
        'Dim score As String = "<br>R=" & Result_R & "O=" & Result_O & "A=" & Result_A
        'ResultLabel.Text += score
    End Sub
    'Sub ShowCheckList2()

    '    Dim result As String = ""
    '    Dim cnn As New SqlConnection
    '    cnn = ConnectionUtil.getSqlConnectionFromWebConfig()
    '    Dim cmd As SqlCommand = New SqlCommand()
    '    cmd.Connection = cnn
    '    Dim sql As String = "SME_S.P_SS_CHECK_LIST_SELECT"
    '    cmd.CommandType = CommandType.StoredProcedure
    '    cmd.CommandText = sql
    '    Dim dt As DataTable = New DataTable()
    '    'Try
    '    cmd.ExecuteNonQuery()
    '    Dim dr As SqlDataReader = cmd.ExecuteReader(CommandBehavior.CloseConnection)
    '    dt.Load(dr)
    '    'Catch ex As Exception
    '    'result = ex.Message
    '    'Finally
    '    cnn.Close()
    '    'End Try

    '    Dim imgStr As String = Nothing
    '    Dim QG As String = Nothing
    '    Dim QT As String = Nothing
    '    Dim endQT As Boolean = False
    '    Dim endQG As Boolean = False
    '    imgStr += "<div id='accordion'>"
    '    For i = 0 To dt.Rows.Count - 1
    '        ' imgStr += "<a target='_blank'  href='FileUpload/Pictures/" & dt.Rows(i).Item("PATH_FILE_NAME") & "'><img class='thumbPic' src='FileUpload/Pictures/" & dt.Rows(i).Item("PATH_FILE_NAME") & "'></a>"

    '        If dt.Rows(i).Item("CK_DETAIL_ID").ToString <> QT Then
    '            If i <> 0 Then  ' ป้องกันไม่ให้ปิด div ในแถวแรก
    '                imgStr += "</div>"
    '                If dt.Rows(i).Item("CK_GROUP_ID").ToString <> QG Then
    '                    imgStr += "</div>"
    '                End If
    '            End If
    '        End If

    '        If dt.Rows(i).Item("CK_GROUP_ID").ToString <> QG Then
    '            imgStr += "<h3>"
    '            imgStr += "<a href='#'>" & dt.Rows(i).Item("CK_DETAIL_NAME").ToString & "</a>"
    '            imgStr += "</h3>"
    '            imgStr += " <div class='ui-accordion-content ui-helper-reset ui-widget-content ui-corner-bottom ui-accordion-content-active'>"
    '        End If

    '        If dt.Rows(i).Item("CK_DETAIL_ID").ToString <> QT Then
    '            imgStr += "<h4>"
    '            imgStr += dt.Rows(i).Item("CK_DETAIL_NAME")
    '            imgStr += "</h4>"
    '            imgStr += "<div class='ui-widget-content'>"
    '        End If

    '        QG = dt.Rows(i).Item("CK_GROUP_ID").ToString
    '        QT = dt.Rows(i).Item("CK_DETAIL_ID").ToString

    '        imgStr += "<br><input type='radio' runat='server' name='Q" & dt.Rows(i).Item("CK_DETAIL_ID") & "' value='" & dt.Rows(i).Item("CK_DETAIL_ID") & "'>" & dt.Rows(i).Item("CK_DETAIL_NAME")

    '    Next


    '    imgStr += "</div>" ' accodian

    '    form1.Controls.Add(New LiteralControl(imgStr))

    '    imgStr = "<input type='submit' value='Save'>"
    '    form1.Controls.Add(New LiteralControl(imgStr))


    'End Sub
    Sub SaveValue()
        ' ตัวแปรที่จำเป็นต้องมี
        Dim SMES_ID As String = SMES_IDTextBox.Text
        Dim TEMPLATE_ID As String = TemplateTextBox.Text
        Dim SMES_TYPE As String = SMES_TYPETextBox.Text

        Dim result As String = ""
        Dim cnn As New SqlConnection
        cnn = ConnectionUtil.getSqlConnectionFromWebConfig()
        Dim cmd As SqlCommand = New SqlCommand()
        cmd.Connection = cnn
        Dim sql As String = "SME_S.P_SS_CHECK_LIST_SELECT"
        cmd.CommandType = CommandType.StoredProcedure
        cmd.Parameters.AddWithValue("TEMPLATE_ID", Request.QueryString("TEMPLATE_ID"))
        cmd.CommandText = sql
        Dim dt As DataTable = New DataTable()

        cmd.ExecuteNonQuery()
        Dim dr As SqlDataReader = cmd.ExecuteReader()
        dt.Load(dr)


        Dim strInsert As String = ""
        ' ใส่ systax delete เพื่อลบของเก่าและinsert ของใหม่
        strInsert = " DELETE  FROM SME_S.CHECK_LIST_VALUE WHERE SMES_ID=" & SMES_ID & " AND SMES_TYPE=" & SMES_TYPE & ";"

        Dim idValue As String = ""
        Dim textValue As String = ""
        For i = 0 To dt.Rows.Count - 1

            textValue = Request.Form("idCK" & dt.Rows(i).Item("CK_DETAIL_ID").ToString)
            If textValue <> "" Then
                'Response.Write("<br>nameCK" & dt.Rows(i).Item("CK_DETAIL_ID") & "=" & Request.Form("nameCK" & dt.Rows(i).Item("CK_DETAIL_ID")))
                strInsert += " INSERT INTO  SME_S.CHECK_LIST_VALUE "
                strInsert += "  VALUES (" + SMES_ID + ","
                strInsert += SMES_TYPE + ","
                strInsert += dt.Rows(i).Item("CK_DETAIL_ID").ToString + ","
                strInsert += "'" + dt.Rows(i).Item("RESULT").ToString + "');"
            End If

        Next

        'Response.Write(strInsert)

        Dim cmd2 As SqlCommand = New SqlCommand()
        cmd2.Connection = cnn
        Dim sql2 As String = strInsert
        cmd2.CommandType = CommandType.Text
        cmd2.CommandText = sql2
        cmd2.ExecuteNonQuery()

        cnn.Close()

        Response.Redirect("check_list.aspx?SMES_ID=" & SMES_ID & "&TEMPLATE_ID=" & TEMPLATE_ID & "&SMES_TYPE=" & SMES_TYPE)
    End Sub

    Protected Sub form1_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles form1.Load

        SMES_IDTextBox.Text = Request.QueryString("SMES_ID")
        TemplateTextBox.Text = Request.QueryString("TEMPLATE_ID")
        SMES_TYPETextBox.Text = Request.QueryString("SMES_TYPE")

        If Page.IsPostBack = True Then
            ''MsgBox(Request.Form.Count)
            'For i = 0 To Request.Form.Count - 1
            '    If Request.Form(i) <> "" Then
            '        MsgBox(Request.Form(i))

            '    End If

            'Next
            clearResult()
            ShowCheckList()
        Else
            clearResult()
            ShowCheckList()
        End If

    End Sub
    Sub clearResult()
        Result_A = 0
        Result_R = 0
        Result_O = 0
        Result_S = 0
    End Sub

    Protected Sub ButtonSave_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles ButtonSave.Click
        SaveValue()
    End Sub

    Protected Sub ButtonSave2_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles ButtonSave2.Click
        SaveValue()
    End Sub

    
   
    Protected Sub Button1_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles Button1.Click


        Dim queryString As String = "check_list.aspx?SMES_ID=" & Request.QueryString("SMES_ID") & "&TEMPLATE_ID=" & Request.QueryString("TEMPLATE_ID") & "&SMES_TYPE=" & Request.QueryString("SMES_TYPE")

        Dim newWin As String = "window.open('" & queryString & "');"
        ClientScript.RegisterStartupScript(Me.GetType(), "pop", newWin, True)
        
     
    End Sub

    
 
End Class
