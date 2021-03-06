Option Strict On
Option Explicit On

Partial Class aspx_customer_BusinessType
    Inherits System.Web.UI.Page

    Protected Sub keywordsTextBox_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles keywordsTextBox.Load
        If Not Me.IsPostBack Then
            DirectCast(sender, TextBox).Text = Request.QueryString("businessTypeDetail")
        End If

    End Sub

    Protected Sub keywordsField_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles keywordsField.Load
        If Not Me.IsPostBack Then
            'ต่อ string เพื่อใช้สำหรับ keyword like ใน sql
            DirectCast(sender, HiddenField).Value = "%" + Request.QueryString("businessTypeDetail") + "%"
        End If
    End Sub

    Protected Sub SearchButton_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles SearchButton.Click
        Response.Redirect(Page.ResolveUrl("~/smes/BusinessType.aspx?businessTypeDetail=") + keywordsTextBox.Text + "&returnIdTarget=" + Request.QueryString("returnIdTarget") + "&returnDetailTarget=" + Request.QueryString("returnDetailTarget"))
    End Sub

    'Protected Sub insertFirstItem(ByVal sender As Object)
    '    'เพิ่ม item แรกใน dropdown
    '    Dim ddl As DropDownList = DirectCast(sender, DropDownList)
    '    ddl.Items.Insert(0, New ListItem("โปรดเลือก", "0"))
    'End Sub

    Protected Sub BusinessType1List_DataBound(ByVal sender As Object, ByVal e As System.EventArgs) Handles BusinessType1List.DataBound
        'insertFirstItem(sender)
    End Sub

    Protected Sub BusinessType1List_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles BusinessType1List.SelectedIndexChanged
        If IsNumeric(DirectCast(sender, DropDownList).SelectedValue) Then
            BusinessType2List.DataBind()
            BusinessType2List_SelectedIndexChanged(BusinessType2List, New System.EventArgs)
        End If
    End Sub

    Protected Sub BusinessType2List_DataBound(ByVal sender As Object, ByVal e As System.EventArgs) Handles BusinessType2List.DataBound
        'insertFirstItem(sender)
    End Sub

    Protected Sub BusinessType2List_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles BusinessType2List.SelectedIndexChanged
        If IsNumeric(DirectCast(sender, DropDownList).SelectedValue) Then
            BusinessType3List.DataBind()
            BusinessType3List_SelectedIndexChanged(BusinessType3List, New System.EventArgs)
        End If
    End Sub




    Protected Sub BusinessType3List_DataBound(ByVal sender As Object, ByVal e As System.EventArgs) Handles BusinessType3List.DataBound
        'insertFirstItem(sender)
    End Sub

    Protected Sub BusinessType3List_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles BusinessType3List.SelectedIndexChanged
        If IsNumeric(DirectCast(sender, DropDownList).SelectedValue) Then
            BusinessType4List.DataBind()
            BusinessType4List_SelectedIndexChanged(BusinessType4List, New System.EventArgs)
        End If
    End Sub




    Protected Sub BusinessType4List_DataBound(ByVal sender As Object, ByVal e As System.EventArgs) Handles BusinessType4List.DataBound
        'insertFirstItem(sender)
    End Sub

    Protected Sub BusinessType4List_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles BusinessType4List.SelectedIndexChanged
        'เอา text จาก dropdown นี้ไปใส่ในช่องค้นหาเพื่อค้นหาให้ busiRiskDropdown2 มีค่าตรงกับ busiRiskDropdown1
        If DirectCast(sender, DropDownList).Items.Count > 0 Then
            keywordsTextBox.Text = DirectCast(sender, DropDownList).SelectedItem.Text
            SearchButton_Click(SearchButton, New System.EventArgs)
        Else
            keywordsTextBox.Text = String.Empty
        End If
    End Sub

    Protected Sub BusinessTypeKeyList_DataBound(ByVal sender As Object, ByVal e As System.EventArgs) Handles BusinessTypeKeyList.DataBound
        'ทำการ set ค่า index
        If BusinessTypeKeyList.Items.Count > 1 Then

            For i As Integer = 0 To BusinessTypeKeyList.Items.Count - 1
                Dim BusinessTypeKeyListText As String = BusinessTypeKeyList.Items(i).Text

                If keywordsTextBox.Text.Equals(BusinessTypeKeyListText) Then
                    'ถ้ามี businessType ตรงกับ textbox ทุกตัวอักษร
                    'เปลี่ยน SelectedIndex ให้ตรงกับค่าใน textbox
                    BusinessTypeKeyList.SelectedIndex = i
                    Exit For
                End If
            Next
        End If

        BusinessTypeKeyList_SelectedIndexChanged(sender, e)
    End Sub

    Protected Sub BusinessTypeKeyList_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles BusinessTypeKeyList.SelectedIndexChanged
        'Dim busiTypeId As String() = BusinessTypeKeyList.SelectedValue.Split(";"c)
        'เอาค่าจาก dropdown นี้ไปหาค่าของ dropdown หลักทั้ง4

        Dim dropdown As DropDownList = DirectCast(sender, DropDownList)
        If BusinessTypeKeyList.SelectedValue.Trim.Length > 0 Then
            BusinessType1List.SelectedValue = dropdown.SelectedValue.Substring(0, 1)

            BusinessType2List.DataBind()
            BusinessType2List.SelectedValue = dropdown.SelectedValue.Substring(0, 3)

            BusinessType3List.DataBind()
            BusinessType3List.SelectedValue = dropdown.SelectedValue.Substring(0, 5)

            BusinessType4List.DataBind()
            BusinessType4List.SelectedValue = dropdown.SelectedValue.Substring(0)
        End If
    End Sub

    Protected Function generateReturnScript(ByVal returnIdClientSelector As String, ByVal returnDetailClientSelector As String, ByVal returnId As String, ByVal returnDetail As String) As String
        'ใช้ function จากไฟล์ common.js และ jquery
        Dim scriptSrcDeclare As String = " var idDOM = getEleByClientSelector('" + returnIdClientSelector + "');" _
                                        + "var detailDOM = getEleByClientSelector('" + returnDetailClientSelector + "');"

        Dim scriptBindValue As String = "   if(idDOM){ " _
                                        + "     if(!isNaN(getPropertyValue(idDOM,'innerHTML'))){" _
                                        + "         setPropertyValueById('" + returnId + "','window.opener','value',getPropertyValue(idDOM,'innerHTML'));" _
                                        + "         setPropertyValueById('" + returnDetail + "','window.opener','value',getPropertyValue(detailDOM,'innerHTML'));" _
                                        + "         window.close();" _
                                        + "         return false;" _
                                        + "     }" _
                                        + " }"

        Return scriptSrcDeclare + scriptBindValue
    End Function

    'returnIdTarget คือ id ของ textbox ที่จะให้ส่งค่า id ของ dropdown กลับไป
    'returnDetailTarget คือ id ของ textbox ที่จะให้ส่งค่า id ของ dropdown กลับไป

    Protected Sub returnButton_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles returnButton.Load
        Dim bt As Button = DirectCast(sender, Button)
        bt.OnClientClick = generateReturnScript("TYPE4_ID_Label", "DESCRIPTION_Label", Request.QueryString("returnIdTarget"), Request.QueryString("returnDetailTarget"))
    End Sub

End Class
