Option Strict On
Option Explicit On

Namespace aspx.annals
    Partial Class CASearch
        Inherits aspx.MyPageClass

#Region "Custom"
        Private Sub resetFilterPanel(ByVal FilterValueText As TextBox, ByVal FilterValueDDL As DropDownList)
            FilterValueText.Visible = False
            FilterValueText.Text = String.Empty
            FilterValueDDL.Visible = False
            FilterValueDDL.DataSourceID = String.Empty
            FilterValueDDL.DataTextField = String.Empty
            FilterValueDDL.DataValueField = String.Empty
            FilterValueDDL.DataBind()
        End Sub

        Private Function getFilterValue(ByVal FilterColumnDDL As DropDownList, ByVal FilterValueText As TextBox, ByVal FilterValueDDL As DropDownList) As String
            Dim result As String = String.Empty

            Select Case FilterColumnDDL.SelectedIndex
                Case 0 'เลขที่หนังสือ
                    If FilterValueText.Text.Trim.Length <> 0 Then
                        'แยกเลขที่หนังสือกับปีออก(ปีที่รับมาจะเป็นปี พ.ศ. ส่วนปีที่ใช้ค้นหาจริงๆจะเป็น ค.ศ.)
                        Dim strSplit As String() = FilterValueText.Text.Split("/"c)
                        If strSplit.Length > 1 Then
                            Dim seq As Integer = 0
                            Dim year As Integer = 0

                            Try
                                seq = CInt(strSplit(0))
                            Catch ex As Exception
                                seq = 0
                            End Try

                            Try
                                year = CInt(strSplit(1)) - 543
                            Catch ex As Exception
                                year = 0
                            End Try

                            result = FilterColumnDDL.SelectedValue + " = '" + seq.ToString() + year.ToString() + "'"
                            'FilterValueText.Text = seq.ToString + "/" + year.ToString
                        ElseIf strSplit.Length = 1 Then
                            result = "LEFT(ID,6) LIKE '%" + strSplit(0) + "%'"
                            result = "(" + result + " AND ANNALS_YEAR = " + FilterValueDDL.SelectedValue + ")"
                        End If
                    End If

                    Exit Select
                Case 1 'CIF
                    If FilterValueText.Text.Trim.Length <> 0 Then
                        result = FilterColumnDDL.SelectedValue + " = '" + FilterValueText.Text + "'"
                    End If

                    Exit Select
                Case 2 'ผู้รับผิดชอบ
                    If FilterValueText.Text.Trim.Length <> 0 Then
                        result = FilterColumnDDL.SelectedValue + " = '" + FilterValueText.Text + "'"
                    End If

                    Exit Select
                Case 3 'BRANCH_ID
                    If FilterValueText.Text.Trim.Length <> 0 Then
                        result = FilterColumnDDL.SelectedValue + " = '" + FilterValueText.Text + "'"
                    End If

                    Exit Select
                Case 4 'BRANCH
                    result = FilterColumnDDL.SelectedValue + "_ID = '" + FilterValueDDL.SelectedValue + "'"

                    Exit Select
                Case 5 'REGION_ID
                    If FilterValueText.Text.Trim.Length <> 0 Then
                        result = FilterColumnDDL.SelectedValue + " = '" + FilterValueText.Text + "'"
                    End If

                    Exit Select
                Case 6 'REGION
                    result = FilterColumnDDL.SelectedValue + "_ID = '" + FilterValueDDL.SelectedValue + "'"

                    Exit Select
                Case 7 'PROCESS
                    result = FilterColumnDDL.SelectedValue + " = '" + FilterValueDDL.SelectedValue + "'"

                    Exit Select
                Case 8 'PROCESS GROUP
                    result = FilterColumnDDL.SelectedValue + " = '" + FilterValueDDL.SelectedValue + "'"

                    Exit Select
                Case Else
                    Exit Select
            End Select

            If result = String.Empty Then
                result = " "
            End If

            Return result
        End Function

        Private Sub FilterColumnDDL_SelectedIndexChanged(ByVal FilterColumnDDL As DropDownList, ByVal FilterValueText As TextBox, ByVal FilterValueDDL As DropDownList)
            resetFilterPanel(FilterValueText, FilterValueDDL)

            Select Case FilterColumnDDL.SelectedIndex
                Case 0 'เลขที่หนังสือ
                    FilterValueText.Visible = True
                    FilterValueDDL.Visible = True
                    FilterValueDDL.DataSourceID = "CAYearDataSource"
                    FilterValueDDL.DataTextField = "ANNALS_YEAR_TH"
                    FilterValueDDL.DataValueField = "ANNALS_YEAR"

                    Exit Select
                Case 1 'CIF
                    FilterValueText.Visible = True

                    Exit Select
                Case 2 'ผู้รับผิดชอบ
                    FilterValueText.Visible = True

                    Exit Select
                Case 3 'BRANCH_ID
                    FilterValueText.Visible = True

                    Exit Select
                Case 4 'BRANCH
                    FilterValueDDL.Visible = True
                    FilterValueDDL.DataSourceID = "BranchDataSource"
                    FilterValueDDL.DataTextField = "Branch_T"
                    FilterValueDDL.DataValueField = "Id_Branch"

                    Exit Select
                Case 5 'REGION_ID
                    FilterValueText.Visible = True

                    Exit Select
                Case 6 'REGION
                    FilterValueDDL.Visible = True
                    FilterValueDDL.DataSourceID = "RegionDataSource"
                    FilterValueDDL.DataTextField = "Region_Name"
                    FilterValueDDL.DataValueField = "Id_Region"

                    Exit Select
                Case 7 'PROCESS
                    FilterValueDDL.Visible = True
                    FilterValueDDL.DataSourceID = "ProcessDataSource"
                    FilterValueDDL.DataTextField = "PROCESS"
                    FilterValueDDL.DataValueField = "PROCESS_ID"

                    Exit Select
                Case 8 'PROCESS GROUP
                    FilterValueDDL.Visible = True
                    FilterValueDDL.DataSourceID = "ProcessGroupDataSource"
                    FilterValueDDL.DataTextField = "PEOCESS_HEAD"
                    FilterValueDDL.DataValueField = "PROCESS_GROUP"
                    Exit Select
                Case Else
                    Exit Select
            End Select
        End Sub

        Private Function ConcatFilterValue() As String
            Dim result As String = " "

            Dim prefixId As String = "FilterColumnDDL"
            Dim maxDDL As Integer = 5

            Dim filterList As New ArrayList()
            Dim filteredFlag(maxDDL) As Boolean

            'ถ้าเพิ่มช่อง filter อย่าลืมเพิ่ม maxDDL ด้วย
            Dim filterValue(maxDDL) As String
            filterValue(1) = getFilterValue(FilterColumnDDL1, FilterValueText1, FilterValueDDL1)
            filterValue(2) = getFilterValue(FilterColumnDDL2, FilterValueText2, FilterValueDDL2)
            filterValue(3) = getFilterValue(FilterColumnDDL3, FilterValueText3, FilterValueDDL3)
            filterValue(4) = getFilterValue(FilterColumnDDL4, FilterValueText4, FilterValueDDL4)

            For i As Integer = 1 To maxDDL - 1
                'ถ้า dropdown นี้ยังไม่ได้ใส่ลงใน filterList
                If Not filteredFlag(i) Then
                    result += filterValue(i)

                    ''ถ้า filter PROCESS_ID มากกว่าหนึ่งครั้งจะรวมเงื่อนไขเป็น OR

                    Select Case getFilterColumnDDLControl(prefixId, i).SelectedIndex
                        Case Else
                            mergeFilter(i, maxDDL, filteredFlag, filterValue, prefixId, result)

                            Exit Select
                    End Select

                    filterList.Add(result)
                    filteredFlag(i) = True 'ทำเครื่องหมายว่า add ลง filterList แล้ว

                    result = " "
                End If
            Next

            For i As Integer = 0 To filterList.Count - 1
                If DirectCast(filterList(i), String).Trim.Length <> 0 Then
                    result = result + " AND (" + DirectCast(filterList(i), String) + ")"
                End If

            Next

            Return result
        End Function

        Private Function getFilterColumnDDLControl(ByVal prefixId As String, ByVal dropdownIndex As Integer) As DropDownList
            Return DirectCast(FilterPanel.FindControl(prefixId + dropdownIndex.ToString), DropDownList)
        End Function

        'ใช้สำหรับรวม filter ที่เหมือนกันด้วย operation 'OR'
        Private Sub mergeFilter(ByRef i As Integer, ByRef maxDDL As Integer, ByRef filteredFlag As Boolean(), ByRef filterValue As String(), ByRef prefixId As String, ByRef result As String)
            'วนลูป dropdown ที่อยู่ลำดับต่อๆไป
            For j As Integer = i + 1 To maxDDL - 1
                'ถ้า dropdown นี้ยังไม่ได้ใส่ลงใน filterList และ filterValue ไม่เป็นtextว่าง
                If Not filteredFlag(j) And filterValue(j).Trim.Length <> 0 Then
                    'ถ้า filter column เดียวกัน
                    If getFilterColumnDDLControl(prefixId, i).SelectedValue.Equals(getFilterColumnDDLControl(prefixId, j).SelectedValue) Then
                        result += " OR " + filterValue(j)

                        filteredFlag(j) = True
                    End If
                End If
            Next
        End Sub



#End Region

        Protected Sub Button1_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles Button1.Click
            FilterHiddenField.Value = ConcatFilterValue()
        End Sub

        Protected Sub FilterColumnDDL1_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles FilterColumnDDL1.SelectedIndexChanged
            FilterColumnDDL_SelectedIndexChanged(FilterColumnDDL1, FilterValueText1, FilterValueDDL1)
        End Sub

        Protected Sub FilterColumnDDL2_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles FilterColumnDDL2.SelectedIndexChanged
            FilterColumnDDL_SelectedIndexChanged(FilterColumnDDL2, FilterValueText2, FilterValueDDL2)
        End Sub

        Protected Sub FilterColumnDDL3_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles FilterColumnDDL3.SelectedIndexChanged
            FilterColumnDDL_SelectedIndexChanged(FilterColumnDDL3, FilterValueText3, FilterValueDDL3)
        End Sub

        Protected Sub FilterColumnDDL4_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles FilterColumnDDL4.SelectedIndexChanged
            FilterColumnDDL_SelectedIndexChanged(FilterColumnDDL4, FilterValueText4, FilterValueDDL4)
        End Sub

        ' ใช้กำหนดให้แสดง หรือไม่แสดง link covenant 01/10/2552
        Protected Sub CA_GRID_RowDataBound(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewRowEventArgs) Handles CA_GRID.RowDataBound
            Dim imgCov As ImageButton = CType(e.Row.Cells(0).FindControl("ImgCov"), ImageButton)
            Dim imgCov2 As ImageButton = CType(e.Row.Cells(0).FindControl("ImgCov2"), ImageButton)

            If Not DataBinder.Eval(e.Row.DataItem, "COVENANT_FLAG") Is Nothing Then
                ' MsgBox(DataBinder.Eval(e.Row.DataItem, "COVENANT_FLAG").ToString)
                If DataBinder.Eval(e.Row.DataItem, "COVENANT_FLAG").ToString = "1" Then
                    imgCov.Visible = True
                Else
                    imgCov.Visible = False
                End If
                If DataBinder.Eval(e.Row.DataItem, "COVENANT_FLAG").ToString = "2" Then
                    imgCov2.Visible = True
                 Else
                    imgCov2.Visible = False

                End If

            End If
        End Sub

    End Class
End Namespace

