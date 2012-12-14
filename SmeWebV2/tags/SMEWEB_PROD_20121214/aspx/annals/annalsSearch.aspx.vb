Option Strict On
Option Explicit On

Namespace aspx.annals
    Partial Class AnnalsSearch
        Inherits aspx.MyPageClass

#Region "Custom Code"

        ''' <summary>
        ''' ใช้สำหรับแปลงเงื่อนไขที่กรอกเพื่อนำไปใช้ใน database
        ''' </summary>
        ''' <remarks></remarks>
        Private Sub prepareFilterHiddenField()
            'reset value
            FilterHiddenField.Value = String.Empty

            If (ColumnValueTextBox.Text.Trim.Length <> 0) Then
                'A เป็นชื่อ alias ของ Table ANNALS (ดูรายละเอียดใน store procedure ชื่อ Annals_Search_Filter)
                FilterHiddenField.Value = " AND A." + ColumnNameDropDownList.SelectedValue + " LIKE '%" + ColumnValueTextBox.Text + "%'"
            End If

            If (ColumnDateValueTextBox.Text.Trim.Length <> 0) Then
                'วันที่ที่รับมาต้องเป็น format dd/MM/yyyy
                Dim dateText As String = ColumnDateValueTextBox.Text

                Dim cul As System.Globalization.CultureInfo = DirectCast(Application.Item(ApplicationKeyConst.App_Culture), System.Globalization.CultureInfo)

                If cul.Name.StartsWith("th") Then
                    'แปลงปี 12/02/2551 ---> 12/02/2008
                    dateText = dateText.Substring(0, dateText.LastIndexOf("/") + 1) + (CInt(dateText.Substring(dateText.LastIndexOf("/") + 1)) - 543).ToString
                End If

                If TheOperatorDDL.SelectedValue.Equals("=") Then
                    'convert(datetime,'12/02/2008',103), 103 คือ format ของวันที่แบบ dd/MM/yyyy ใน sql server
                    FilterHiddenField.Value = " AND CONVERT(NVARCHAR(10),A." + ColumnNameDropDownList.SelectedValue + ",103) " + TheOperatorDDL.SelectedValue + " '" + dateText + "' "
                ElseIf TheOperatorDDL.SelectedValue.Equals("<=") Then
                    'DATEADD(DAY,1,convert(datetime,'18/1/2008',103)) เป็นการเพิ่มวัน 1 วัน เพื่อใช้ในการค้นหาวันที่ที่น้อยกว่าที่ระบุไว้
                    FilterHiddenField.Value = " AND A." + ColumnNameDropDownList.SelectedValue + " " + TheOperatorDDL.SelectedValue + " " + "DATEADD(DAY,1,CONVERT(DATETIME,'" + dateText + "',103)) "
                ElseIf TheOperatorDDL.SelectedValue.Equals(">=") Then
                    'DATEADD(DAY,-1,convert(datetime,'18/1/2008',103)) เป็นการลดวัน 1 วัน เพื่อใช้ในการค้นหาวันที่ที่มากกว่าที่ระบุไว้
                    FilterHiddenField.Value = " AND A." + ColumnNameDropDownList.SelectedValue + " " + TheOperatorDDL.SelectedValue + " " + "DATEADD(DAY,-1,CONVERT(DATETIME,'" + dateText + "',103)) "
                End If

            End If
        End Sub

#End Region

        ''ไม่ได้ใช้ ใช้ฝัง javascript ที่ page แทน
        'Private Sub regisShowPanelScript(ByVal targetId As String)
        '    Dim script As String = "function showDetail(detailURL){" & vbCrLf _
        '                        & vbTab & "var DetailIframe = document.getElementById(""" + targetId + """);" & vbCrLf _
        '                        & vbTab & "if(DetailIframe){DetailIframe.src = detailURL;}" & vbCrLf _
        '                        & "}" & vbCrLf
        '    Page.ClientScript.RegisterClientScriptBlock(Me.GetType, "showDetail", script, True)
        'End Sub

        Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

        End Sub

        Protected Sub ColumnNameDropDownList_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles ColumnNameDropDownList.Load
            Dim columnDDL As DropDownList = DirectCast(sender, DropDownList)

            If columnDDL.SelectedValue.Equals("DATE_IN_ANNALS") Or _
                columnDDL.SelectedValue.Equals("ANNALS_CREATE_DATE") Or _
                columnDDL.SelectedValue.Equals("ANNALS_UPDATE_DATE") Then

                ColumnValueTextBox.Text = String.Empty

                ColumnValueTextBox.Visible = False
                ColumnDateValueTextBox.Visible = True
                TheOperatorDDL.Visible = True
            Else
                ColumnDateValueTextBox.Text = String.Empty

                ColumnValueTextBox.Visible = True
                ColumnDateValueTextBox.Visible = False
                TheOperatorDDL.Visible = False
            End If
        End Sub

        Protected Sub ColumnNameDropDownList_PreRender(ByVal sender As Object, ByVal e As System.EventArgs) Handles ColumnNameDropDownList.PreRender
            'disable ANNALS_TYPE in dropdown
            DirectCast(sender, DropDownList).Items(0).Enabled = False
        End Sub

        Protected Sub SearchButton_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles SearchButton.Click
            AnnalsSearchGridView.SelectedIndex = -1
            prepareFilterHiddenField()
        End Sub

        Protected Sub AnnalsSearchGridView_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles AnnalsSearchGridView.Load
            Dim type As String = Nothing

            Try
                type = ANNALS_TYPEFilter.Items(ANNALS_TYPEFilter.SelectedIndex).Text
            Catch ex As Exception
                type = String.Empty
            End Try

            If type.Equals("OUT") Then
                AnnalsSearchGridView.Columns(6).Visible = False
            Else
                AnnalsSearchGridView.Columns(6).Visible = False
            End If

        End Sub

        Protected Sub AnnalsSearchGridView_PageIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles AnnalsSearchGridView.PageIndexChanged
            AnnalsSearchGridView.SelectedIndex = -1
        End Sub

        Protected Sub ColumnNameDropDownList_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles ColumnNameDropDownList.SelectedIndexChanged
            Dim columnDDL As DropDownList = DirectCast(sender, DropDownList)

            Dim initLabel As String = String.Empty

            Select Case (columnDDL.SelectedIndex)
                Case 0  'ANNALS_TYPE
                    DetailLabel.Text = initLabel
                    Exit Select
                Case 1  'ANNALS_SEQ_NO
                    DetailLabel.Text = "ใส่เฉพาะเลขหนังสือตรงกลาง เช่น 1000<u>40</u>/2551 ใส่40"
                    Exit Select
                Case 2  'ANNALS_YEAR
                    DetailLabel.Text = initLabel
                    Exit Select
                Case 3  'SENDER
                    DetailLabel.Text = initLabel
                    Exit Select
                Case 4  'RECIEVER
                    DetailLabel.Text = initLabel
                    Exit Select
                Case 5  'REFERENCE
                    DetailLabel.Text = initLabel
                    Exit Select
                Case 6  'HEADER
                    DetailLabel.Text = initLabel
                    Exit Select
                Case 7  'DETAIL
                    DetailLabel.Text = initLabel
                    Exit Select
                Case 8  'DATE_IN_ANNALS
                    DetailLabel.Text = initLabel
                    Exit Select
                Case 9  'ANNALS_CREATE_DATE
                    DetailLabel.Text = initLabel
                    Exit Select
                Case 10 'ANNALS_UPDATE_DATE
                    DetailLabel.Text = initLabel
                    Exit Select
                Case 11 'DEPART_REFER
                    DetailLabel.Text = initLabel
                    Exit Select
                Case Else
                    DetailLabel.Text = initLabel
                    Exit Select
            End Select

        End Sub
    End Class
End Namespace
