Imports System.Data
Imports System.Data.SqlClient
Imports System.Globalization
Partial Class smes_check_list
    Inherits System.Web.UI.Page
    Sub ShowCheckList()

        Dim result As String = ""
        Dim cnn As New SqlConnection
        cnn = ConnectionUtil.getSqlConnectionFromWebConfig()
        Dim cmd As SqlCommand = New SqlCommand()
        cmd.Connection = cnn
        Dim sql As String = "CHECKLIST.P_CHECK_LIST_SELECT"
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
           
            If dt.Rows(i).Item("QUEST_ID").ToString <> QT Then
                If i <> 0 Then  ' ป้องกันไม่ให้ปิด div ในแถวแรก
                    imgStr += "</div>"
                    If dt.Rows(i).Item("QUEST_GROUP_ID").ToString <> QG Then
                        imgStr += "</div>"
                    End If
                End If
            End If

            If dt.Rows(i).Item("QUEST_GROUP_ID").ToString <> QG Then
                imgStr += "<h3>"
                imgStr += "<a href='#'>" & dt.Rows(i).Item("QUEST_GROUP_DESC").ToString & "</a>"
                imgStr += "</h3>"
                imgStr += " <div class='ui-accordion-content ui-helper-reset ui-widget-content ui-corner-bottom ui-accordion-content-active'>"
            End If

            If dt.Rows(i).Item("QUEST_ID").ToString <> QT Then
                imgStr += "<h4>"
                imgStr += dt.Rows(i).Item("QUEST_DESC")
                imgStr += "</h4>"
                imgStr += "<div class='ui-widget-content'>"
            End If

            QG = dt.Rows(i).Item("QUEST_GROUP_ID").ToString
            QT = dt.Rows(i).Item("QUEST_ID").ToString

            imgStr += "<br><input type='radio' runat='server' name='Q" & dt.Rows(i).Item("QUEST_ID") & "' value='" & dt.Rows(i).Item("QUEST_DETAIL_ID") & "'>" & dt.Rows(i).Item("QUEST_DETAIL_DESC")

        Next


        imgStr += "</div>" ' accodian

        form1.Controls.Add(New LiteralControl(imgStr))

        imgStr = "<input type='submit' value='Save'>"
        form1.Controls.Add(New LiteralControl(imgStr))


    End Sub
    Sub ShowValue()

        Dim result As String = ""
        Dim cnn As New SqlConnection
        cnn = ConnectionUtil.getSqlConnectionFromWebConfig()
        Dim cmd As SqlCommand = New SqlCommand()
        cmd.Connection = cnn
        Dim sql As String = "CHECKLIST.P_CHECK_LIST_SELECT"
        cmd.CommandType = CommandType.StoredProcedure
        cmd.CommandText = sql
        Dim dt As DataTable = New DataTable()
        Try
            cmd.ExecuteNonQuery()
            Dim dr As SqlDataReader = cmd.ExecuteReader(CommandBehavior.CloseConnection)
            dt.Load(dr)
        Catch ex As Exception
            'result = ex.Message
        Finally
            cnn.Close()
        End Try
        Dim imgStr As String = Nothing
        Dim QT As String = Nothing
        For i = 0 To dt.Rows.Count - 1
            ' imgStr += "<a target='_blank'  href='FileUpload/Pictures/" & dt.Rows(i).Item("PATH_FILE_NAME") & "'><img class='thumbPic' src='FileUpload/Pictures/" & dt.Rows(i).Item("PATH_FILE_NAME") & "'></a>"
            If dt.Rows(i).Item("QUEST_ID") <> QT Then
                QT = dt.Rows(i).Item("QUEST_ID")
                imgStr += "<br>" & dt.Rows(i).Item("QUEST_DESC")
            End If
            imgStr += "<br><input type='radio' runat='server' name='Q" & dt.Rows(i).Item("QUEST_ID") & "' value='" & dt.Rows(i).Item("QUEST_DETAIL_ID") & "'>" & dt.Rows(i).Item("QUEST_DESC") & "-" & dt.Rows(i).Item("QUEST_DETAIL_DESC")
        Next
        form1.Controls.Add(New LiteralControl(imgStr))

        imgStr = "<br><br><input type='submit' value='Save'>"
        form1.Controls.Add(New LiteralControl(imgStr))


    End Sub

    Protected Sub form1_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles form1.Load
        ShowCheckList()
        If Page.IsPostBack = True Then
            MsgBox(Request.Form.Count)
            For i = 0 To Request.Form.Count - 1
                MsgBox(Request.Form(i))
            Next
        End If

    End Sub
End Class
