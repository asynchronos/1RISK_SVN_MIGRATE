Imports System.Data
Imports System.Data.SqlClient
Imports System.Globalization
Partial Class smes_check_list
    Inherits System.Web.UI.Page
    Shared Result_A As Integer
    Shared Result_R As Integer
    Shared Result_O As Integer

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
            cmd2.CommandText = sql2
            Dim dt2 As DataTable = New DataTable()
            cmd2.ExecuteNonQuery()
            Dim dr2 As SqlDataReader = cmd2.ExecuteReader()
            dt2.Load(dr2)


            cnn.Close()

            'End Try
            Dim imgStr As String = Nothing
            Dim CG As String = Nothing
            Dim CD As String = Nothing
            Dim endQT As Boolean = False
            Dim endQG As Boolean = False

            Dim pkRA As Panel = Nothing
            Dim pkRO As Panel = Nothing
            Dim pkRR As Panel = Nothing
            Dim chkname As String = Nothing
            For i = 0 To dt.Rows.Count - 1


                If dt.Rows(i).Item("CK_ID").ToString <> CD Then   ' ตัวแปรเช็คชื่อข้อไม่เท่ากันแสดงว่าขึ้นข้อใหม่
                    'imgStr += "<h4>"
                    'imgStr += dt.Rows(i).Item("CK_NAME")
                    'imgStr += "</h4>"
                    Dim hl, Guarantor, Tenor As New LiteralControl
                    chkname = dt.Rows(i).Item("CK_ID").ToString
                    If chkname = "29" Then
                        Guarantor.Text = "<h3 class='data-header  ui-state-highlight ui-corner-all'>ผู้ค้ำประกัน (Guarantor)</h3>"
                        PanelForm.Controls.Add(Guarantor)
                    End If
                    If chkname = "31" Then
                        Tenor.Text = "<h3 class='data-header  ui-state-highlight ui-corner-all'> Tenor (ระยะเวลากู้)</h3>"
                        PanelForm.Controls.Add(Tenor)
                    End If
                    hl.Text += "<h3 class='ckName ui-state-highlight'><div>" & dt.Rows(i).Item("CK_NAME") & "</div></h3>"
                    PanelForm.Controls.Add(hl)

                    pkRA = New Panel
                    pkRO = New Panel
                    pkRR = New Panel

                    pkRA.CssClass = "divPKRA"
                    pkRO.CssClass = "divPKRO"
                    pkRR.CssClass = "divPKRR"

                    PanelForm.Controls.Add(pkRA)
                    PanelForm.Controls.Add(pkRO)
                    PanelForm.Controls.Add(pkRR)

                Else
                    '  Response.Write("ยังไม่ขึ้น")
                End If
                '' imgStr += "<a target='_blank'  href='FileUpload/Pictures/" & dt.Rows(i).Item("PATH_FILE_NAME") & "'><img class='thumbPic' src='FileUpload/Pictures/" & dt.Rows(i).Item("PATH_FILE_NAME") & "'></a>"
                'imgStr += "<br><input type='checkbox'  class='ckBox' onclick='checkResult(""" & dt.Rows(i).Item("RESULT") & """);'  name='nameCK" & dt.Rows(i).Item("CK_DETAIL_ID") & "' runat ='server' id='idCK" & dt.Rows(i).Item("CK_DETAIL_ID") & "' value='" & dt.Rows(i).Item("CK_DETAIL_NAME") & "' >" & dt.Rows(i).Item("CK_DETAIL_NAME")

                CD = dt.Rows(i).Item("CK_ID").ToString

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
                rk.Visible = False


                Dim lk As New LiteralControl
                lk.Text = dt.Rows(i).Item("CK_DETAIL_NAME")


                pk.Controls.Add(ck)
                pk.Controls.Add(rk)
                pk.Controls.Add(lk)

                'Response.Write(ck.ID & "-result=" & result & "<br>")

                If result = "A" Then
                    pkRA.Controls.Add(pk)
                ElseIf result = "O" Then
                    pkRO.Controls.Add(pk)
                ElseIf result = "R" Then
                    pkRR.Controls.Add(pk)
                End If

            Next

            'PanelForm.Controls.Add(New LiteralControl(imgStr))
            Dim en As New LiteralControl
            en.Text = "<h3 class='ckName ui-state-highlight'></h3>"
            PanelForm.Controls.Add(en)


            For y = 0 To dt2.Rows.Count - 1

                Dim DL As CheckBox = Me.FindControl("idCK" & dt2.Rows(y).Item("CK_DETAIL_ID"))
                DL.Checked = True
                Dim rk As Label = Me.FindControl("idRK" & dt2.Rows(y).Item("CK_DETAIL_ID"))
                rk.Visible = True


                If IsNothing(DL) = False Then


                    'countResult(dt2.Rows(y).Item("RESULT"))
                    result = dt2.Rows(y).Item("RESULT")
                    If result = "A" Then
                        Result_A = Result_A + 1
                        rk.CssClass = "ui-state-highlight"
                    ElseIf result = "R" Then
                        Result_R = Result_R + 1
                        rk.CssClass = "ui-state-error"
                    ElseIf result = "O" Then
                        Result_O = Result_O + 1
                        rk.CssClass = "ui-state-error"
                    End If
                Else
                    Response.Write("Cannot find :" & dt2.Rows(y).Item("CK_DETAIL_ID"))
                End If
            Next

            showResult()

        Catch ex As Exception
            Response.Write(ex.Message.ToString)
        End Try

    End Sub

    Sub showResult()

        ' เรียงตามความสำคัญของการกรองข้อมูลออก
        If Result_R > 0 Then
            ResultLabel.Text = "REJECT"
            ResultLabel.CssClass = "ui-state-error"
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
    Sub ShowCheckList2()

        Dim result As String = ""
        Dim cnn As New SqlConnection
        cnn = ConnectionUtil.getSqlConnectionFromWebConfig()
        Dim cmd As SqlCommand = New SqlCommand()
        cmd.Connection = cnn
        Dim sql As String = "SME_S.P_SS_CHECK_LIST_SELECT"
        cmd.CommandType = CommandType.StoredProcedure
        cmd.CommandText = sql
        Dim dt As DataTable = New DataTable()
        'Try
        cmd.ExecuteNonQuery()
        Dim dr As SqlDataReader = cmd.ExecuteReader(CommandBehavior.CloseConnection)
        dt.Load(dr)
        'Catch ex As Exception
        'result = ex.Message
        'Finally
        cnn.Close()
        'End Try
        Dim imgStr As String = Nothing
        Dim QG As String = Nothing
        Dim QT As String = Nothing
        Dim endQT As Boolean = False
        Dim endQG As Boolean = False
        imgStr += "<div id='accordion'>"
        For i = 0 To dt.Rows.Count - 1
            ' imgStr += "<a target='_blank'  href='FileUpload/Pictures/" & dt.Rows(i).Item("PATH_FILE_NAME") & "'><img class='thumbPic' src='FileUpload/Pictures/" & dt.Rows(i).Item("PATH_FILE_NAME") & "'></a>"

            If dt.Rows(i).Item("CK_DETAIL_ID").ToString <> QT Then
                If i <> 0 Then  ' ป้องกันไม่ให้ปิด div ในแถวแรก
                    imgStr += "</div>"
                    If dt.Rows(i).Item("CK_GROUP_ID").ToString <> QG Then
                        imgStr += "</div>"
                    End If
                End If
            End If

            If dt.Rows(i).Item("CK_GROUP_ID").ToString <> QG Then
                imgStr += "<h3>"
                imgStr += "<a href='#'>" & dt.Rows(i).Item("CK_DETAIL_NAME").ToString & "</a>"
                imgStr += "</h3>"
                imgStr += " <div class='ui-accordion-content ui-helper-reset ui-widget-content ui-corner-bottom ui-accordion-content-active'>"
            End If

            If dt.Rows(i).Item("CK_DETAIL_ID").ToString <> QT Then
                imgStr += "<h4>"
                imgStr += dt.Rows(i).Item("CK_DETAIL_NAME")
                imgStr += "</h4>"
                imgStr += "<div class='ui-widget-content'>"
            End If

            QG = dt.Rows(i).Item("CK_GROUP_ID").ToString
            QT = dt.Rows(i).Item("CK_DETAIL_ID").ToString

            imgStr += "<br><input type='radio' runat='server' name='Q" & dt.Rows(i).Item("CK_DETAIL_ID") & "' value='" & dt.Rows(i).Item("CK_DETAIL_ID") & "'>" & dt.Rows(i).Item("CK_DETAIL_NAME")

        Next


        imgStr += "</div>" ' accodian

        form1.Controls.Add(New LiteralControl(imgStr))

        imgStr = "<input type='submit' value='Save'>"
        form1.Controls.Add(New LiteralControl(imgStr))


    End Sub
    Sub SaveValue()
        ' ตัวแปรที่จำเป็นต้องมี
        Dim SMES_ID As String = SMES_IDTextBox.Text


        Dim result As String = ""
        Dim cnn As New SqlConnection
        cnn = ConnectionUtil.getSqlConnectionFromWebConfig()
        Dim cmd As SqlCommand = New SqlCommand()
        cmd.Connection = cnn
        Dim sql As String = "SME_S.P_SS_CHECK_LIST_SELECT"
        cmd.CommandType = CommandType.StoredProcedure
        cmd.CommandText = sql
        Dim dt As DataTable = New DataTable()

        cmd.ExecuteNonQuery()
        Dim dr As SqlDataReader = cmd.ExecuteReader()
        dt.Load(dr)


        Dim strInsert As String = ""
        ' ใส่ systax delete เพื่อลบของเก่าและinsert ของใหม่
        strInsert = " DELETE FROM SME_S.CHECK_LIST_VALUE WHERE SMES_ID=" & SMES_ID & ";"

        Dim idValue As String = ""
        Dim textValue As String = ""
        For i = 0 To dt.Rows.Count - 1

            textValue = Request.Form("idCK" & dt.Rows(i).Item("CK_DETAIL_ID").ToString)
            If textValue <> "" Then
                'Response.Write("<br>nameCK" & dt.Rows(i).Item("CK_DETAIL_ID") & "=" & Request.Form("nameCK" & dt.Rows(i).Item("CK_DETAIL_ID")))
                strInsert += " INSERT INTO  SME_S.CHECK_LIST_VALUE "
                strInsert += "  VALUES (" + SMES_ID + ","
                strInsert += dt.Rows(i).Item("CK_DETAIL_ID").ToString + ","
                strInsert += "'" + dt.Rows(i).Item("CK_DETAIL_NAME").ToString.Replace("'", "") + "',"
                strInsert += "'" + dt.Rows(i).Item("RESULT").ToString + "');"
            End If

        Next

        ' Response.Write(strInsert)

        Dim cmd2 As SqlCommand = New SqlCommand()
        cmd2.Connection = cnn
        Dim sql2 As String = strInsert
        cmd2.CommandType = CommandType.Text
        cmd2.CommandText = sql2
        cmd2.ExecuteNonQuery()

        cnn.Close()

        Response.Redirect("check_list.aspx?SMES_ID=" & SMES_ID)
    End Sub

    Protected Sub form1_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles form1.Load

        If Page.IsPostBack = True Then
            ''MsgBox(Request.Form.Count)
            'For i = 0 To Request.Form.Count - 1
            '    If Request.Form(i) <> "" Then
            '        MsgBox(Request.Form(i))

            '    End If

            'Next
        Else
            clearResult()
            SMES_IDTextBox.Text = Request.QueryString("SMES_ID")
            ShowCheckList()
        End If

    End Sub
    Sub clearResult()
        Result_A = 0
        Result_R = 0
        Result_O = 0

    End Sub

    Protected Sub ButtonSave_Click(sender As Object, e As System.EventArgs) Handles ButtonSave.Click
        SaveValue()
    End Sub

    Protected Sub ButtonSave2_Click(sender As Object, e As System.EventArgs) Handles ButtonSave2.Click
        SaveValue()
    End Sub
End Class
