Option Strict On
Option Explicit On

Imports System.Data.SqlClient

Namespace aspx.customer
    Partial Class SmeCustomerManagement
        Inherits aspx.MyPageClass

        Protected Sub DeleteButton_Load(ByVal sender As Object, ByVal e As System.EventArgs)
            'เมื่อโหลดปุ่มนี้ให้ทำการใส่ฟังก์ชั่นสำหรับ confirmDelete ที่ event onClientClick
            DirectCast(sender, Button).OnClientClick = "return confirm(""คุณต้องการลบข้อมูล?"");"
        End Sub

        Protected Sub SqlDataSource1_Deleted(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.SqlDataSourceStatusEventArgs) Handles FormView1DataSource.Deleted
            'initial url ที่จะ redirect
            Dim redirectUrl As String = "~/aspx/customer/SmeCustomerManagement.aspx"

            'Response.Redirect(redirectUrl)

            Dim script As String = "if (window.parent != window) {" _
                                + "     var SmeCusIframe1 = window.parent.frames['SmeCusIframe1'];" _
                                + "     var SmeCusIframe2 = window.parent.frames['SmeCusIframe2'];" _
                                + "" _
                                + "     if (SmeCusIframe1 != window){" _
                                + "         SmeCusIframe1.location.reload();" _
                                + "     }" _
                                + "" _
                                + "     if (SmeCusIframe2 != window){" _
                                + "         SmeCusIframe2.location.reload();" _
                                + "     }" _
                                + " }" _
                                + " setPropertyValueById('" + Request.QueryString("returnIdTarget") + "','window.parent','value','');" _
                                + " window.location.replace('" + Page.ResolveUrl(redirectUrl) + "');"

            Page.ClientScript.RegisterStartupScript(Me.GetType, "reload", script, True)
        End Sub

        Protected Sub SqlDataSource1_Inserted(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.SqlDataSourceStatusEventArgs) Handles FormView1DataSource.Inserted
            If IsNothing(e.Exception) Then

                'ดูพารามิเตอร์ได้ที่ sqlDatasource
                'initial url ที่จะ redirect
                Dim redirectUrl As String = "~/aspx/customer/SmeCustomerManagement.aspx?returnIdTarget=" + Request.QueryString("returnIdTarget") + "&cif=" + e.Command.Parameters(0).Value.ToString

                'แสดงผลลัพธ์ข้อมูลที่พึ่ง Insert
                'Response.Redirect(redirectUrl)

                Dim script As String = "setPropertyValueById('" + Request.QueryString("returnIdTarget") + "','window.parent','value','" + e.Command.Parameters(0).Value.ToString + "');" _
                                    + " window.location.replace('" + Page.ResolveUrl(redirectUrl) + "');"

                Page.ClientScript.RegisterStartupScript(Me.GetType, "reload", script, True)

            Else
                If e.Exception.Message.Equals("Violation of PRIMARY KEY constraint 'PK_CUSTOMER_SME'. Cannot insert duplicate key in object 'dbo.CUSTOMER_SME'.") Then
                    ErrorMessage.Text = "มีลูกค้ารายนี้อยู่แล้วในระบบ(CIF:" + e.Command.Parameters(0).Value.ToString + ") กรุณาทดลองค้นหาใหม่อีกครั้ง"
                    e.ExceptionHandled = True
                Else
                    ErrorMessage.Text = e.Exception.Message
                End If
            End If
        End Sub

        Protected Sub BUSI_RISK_PopupBt_Load(ByVal sender As Object, ByVal e As System.EventArgs)
            Dim popupBt As ImageButton = DirectCast(sender, ImageButton)

            Dim busiRiskPrefix As String = popupBt.ID.Substring(0, popupBt.ID.LastIndexOf("_"c))
            Dim busiRiskId As TextBox = DirectCast(popupBt.Parent.FindControl(busiRiskPrefix + "_ID"), TextBox)
            Dim busiRiskDetail As TextBox = DirectCast(popupBt.Parent.FindControl(busiRiskPrefix + "_Detail"), TextBox)

            Dim busiRiskDetailText As String = String.Empty

            If busiRiskDetail.Text.Length > 0 Then
                busiRiskDetailText = busiRiskDetail.Text
            End If
            'If Not IsNothing(FormView1.DataItem) Then
            '    busiRiskDetailText = DataBinder.Eval(FormView1.DataItem, "BUSI_RISK1_DETAIL").ToString
            'End If
            popupBt.OnClientClick = "var busiRiskPopup = window.open('" + Page.ResolveUrl("~/aspx/customer/BusinessType.aspx?businessTypeDetail=") + busiRiskDetailText + "&returnIdTarget=" + busiRiskId.ClientID + "&returnDetailTarget=" + busiRiskDetail.ClientID + "'" _
                                                                + ",'busiRiskPopup'" _
                                                                + ",'toolbar=No,width=1024,height=300,resizable=yes,scrollbars=yes');" _
                                    + "busiRiskPopup.focus();" _
                                    + "return false;"

        End Sub

        Protected Sub CM_CODE_PopupBt_Load(ByVal sender As Object, ByVal e As System.EventArgs)
            Dim popupBt As ImageButton = DirectCast(sender, ImageButton)

            Dim cmPrefix As String = popupBt.ID.Substring(0, popupBt.ID.LastIndexOf("_"c))
            Dim cmId As TextBox = DirectCast(popupBt.Parent.FindControl(cmPrefix + "_ID"), TextBox)
            Dim cmDetail As TextBox = DirectCast(popupBt.Parent.FindControl(cmPrefix + "_NAME"), TextBox)

            popupBt.OnClientClick = "var cmPopup = window.open('" + Page.ResolveUrl("~/aspx/employee/CMControllingTree.aspx") + "?returnIdTarget=" + cmId.ClientID + "&returnIdProp=value&returnDetailTarget=" + cmDetail.ClientID + "&returnDetailProp=value'" _
                                                                + ",'cmPopup'" _
                                                                + ",'toolbar=No,width=500,height=500,resizable=no,scrollbars=yes');" _
                                    + "cmPopup.focus();" _
                                    + "return false;"

        End Sub

        Protected Sub OLD_CM_CODE_PopupBt_Load(ByVal sender As Object, ByVal e As System.EventArgs)
            CM_CODE_PopupBt_Load(sender, e)
            validateControlRole(sender, e)
        End Sub

        Protected Sub UPDATE_BY_PopupBt_Load(ByVal sender As Object, ByVal e As System.EventArgs)
            CM_CODE_PopupBt_Load(sender, e)
            validateControlRole(sender, e)
        End Sub

        Protected Sub CalImageBt_Load(ByVal sender As Object, ByVal e As System.EventArgs)
            'check ว่ามี role admin หรือไม่ 
            If User.IsInRole(RoleIdConst.R_ADMIN) Then
                'If HttpCookieUtil.hasRolesId(Context.Request.Cookies(FormsAuthentication.FormsCookieName), RoleIdConst.R_ADMIN) Then
                'ถ้ามีให้แสดงปุ่มได้
                DirectCast(sender, ImageButton).Style.Item("display") = "line"
            Else
                DirectCast(sender, ImageButton).Style.Item("display") = "none"
            End If
        End Sub

        Protected Sub validateControlRole(ByVal sender As Object, ByVal e As System.EventArgs)
            'check ว่ามี role admin หรือไม่ 
            If User.IsInRole(RoleIdConst.R_ADMIN) Then
                'If HttpCookieUtil.hasRolesId(Context.Request.Cookies(FormsAuthentication.FormsCookieName), RoleIdConst.R_ADMIN) Then
                'ถ้ามีให้แสดงปุ่มได้
                'DirectCast(sender, Control).Visible = True
                DirectCast(sender, Control).Visible = False
            Else
                DirectCast(sender, Control).Visible = False
            End If
        End Sub

        Protected Sub CUSTOMER_PopupBt_Load(ByVal sender As Object, ByVal e As System.EventArgs)
            Dim popupBt As ImageButton = DirectCast(sender, ImageButton)

            Dim customerPrefix As String = popupBt.ID.Substring(0, popupBt.ID.LastIndexOf("_"c))
            Dim customerId As TextBox = DirectCast(popupBt.Parent.FindControl(customerPrefix + "_ID"), TextBox)
            Dim customerDetail As TextBox = DirectCast(popupBt.Parent.FindControl(customerPrefix + "_NAME"), TextBox)

            popupBt.OnClientClick = "var customerPopup = window.open('" + Page.ResolveUrl("~/aspx/customer/Customer.aspx") + "?returnIdTarget=" + customerId.ClientID + "&returnIdProp=value&returnDetailTarget=" + customerDetail.ClientID + "&returnDetailProp=value'" _
                                                                + ",'customerPopup'" _
                                                                + ",'toolbar=No,width=400,height=380,resizable=no,scrollbars=yes');" _
                                    + "customerPopup.focus();" _
                                    + "return false;"

        End Sub

        Protected Sub BRANCH_PopupBt_Load(ByVal sender As Object, ByVal e As System.EventArgs)
            Dim popupBt As ImageButton = DirectCast(sender, ImageButton)

            Dim branchPrefix As String = popupBt.ID.Substring(0, popupBt.ID.LastIndexOf("_"c))
            Dim branchId As TextBox = DirectCast(popupBt.Parent.FindControl(branchPrefix + "_ID"), TextBox)
            Dim branchDetail As TextBox = DirectCast(popupBt.Parent.FindControl(branchPrefix + "_NAME"), TextBox)

            popupBt.OnClientClick = "var branchPopup = window.open('" + Page.ResolveUrl("~/aspx/customer/Branch.aspx") + "?returnIdTarget=" + branchId.ClientID + "&returnIdProp=value&returnDetailTarget=" + branchDetail.ClientID + "&returnDetailProp=value'" _
                                                                + ",'branchPopup'" _
                                                                + ",'toolbar=No,width=430,height=380,resizable=no,scrollbars=yes');" _
                                    + "branchPopup.focus();" _
                                    + "return false;"

        End Sub

        Protected Sub FormView1_ItemInserting(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.FormViewInsertEventArgs) Handles FormView1.ItemInserting
            'ถ้าเป็น role admin จะสามารถเลือกได้ว่าใครเป็นคน Update ข้อมูล
            'ส่วน User ที่เลือกไม่ได้จะใช้รหัสพนักงานของตัวเองที่ Login เข้ามา
            If e.Values.Item("UPDATE_BY").Equals(String.Empty) Then
                e.Values.Item("UPDATE_BY") = User.Identity.Name
            End If

            'ถ้าเป็น role admin จะสามารถเลือกได้ว่าวันไหนเป็นวัน Update ข้อมูล
            'ส่วน User ที่เลือกวันที่ไม่ได้จะเอาวันที่ปัจจุบันเป็นวัน Update ข้อมูล
            If e.Values.Item("UPDATE_DATE").Equals(String.Empty) Then
                e.Values.Item("UPDATE_DATE") = Date.Now
            End If

            'เอาค่า rating จาก dropdown มาใช้
            Dim ddl = DirectCast(FormView1.FindControl("RatingDDL"), DropDownList)
            e.Values.Item("RATING_KEY") = ddl.SelectedValue

            If Not ddl.SelectedValue.Equals("1") Then
                If e.Values.Item("RATING_UPDATE_DATE").Equals(String.Empty) Then
                    e.Values.Item("RATING_UPDATE_DATE") = Date.Now
                End If
            End If

        End Sub

        Protected Sub FormView1_ItemUpdating(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.FormViewUpdateEventArgs) Handles FormView1.ItemUpdating
            'ถ้าเป็น role admin จะสามารถเลือกได้ว่าใครเป็นคน Update ข้อมูล
            'ส่วน User ที่เลือกไม่ได้จะใช้รหัสพนักงานของตัวเองที่ Login เข้ามา
            If e.OldValues.Item("UPDATE_BY").Equals(e.NewValues.Item("UPDATE_BY")) Then
                e.NewValues.Item("UPDATE_BY") = User.Identity.Name
            End If

            'ถ้าเป็น role admin จะสามารถเลือกได้ว่าวันไหนเป็นวัน Update ข้อมูล
            'ส่วน User ที่เลือกวันที่ไม่ได้จะเอาวันที่ปัจจุบันเป็นวัน Update ข้อมูล
            If e.OldValues.Item("UPDATE_DATE").Equals(e.NewValues.Item("UPDATE_DATE")) Then
                e.NewValues.Item("UPDATE_DATE") = Date.Now
            End If

            'ถ้า CM_CODE มีการเปลี่ยนแปลงให้ย้าย CM_CODE ไปเป็น OLD_CM_CODE
            If Not e.OldValues.Item("CM_CODE").Equals(e.NewValues.Item("CM_CODE")) Then
                'เอา รหัสพนักงานที่ดูแลคนเก่ามาเก็บไว้ใน OLD_CM_CODE
                e.NewValues.Item("OLD_CM_CODE") = e.OldValues.Item("CM_CODE")
            End If

            'เอาค่า rating จาก dropdown มาใช้
            Dim ddl = DirectCast(FormView1.FindControl("RatingDDL"), DropDownList)
            e.NewValues.Item("RATING_KEY") = ddl.SelectedValue

            If Not ddl.SelectedValue.Equals("1") Then
                If e.NewValues.Item("RATING_UPDATE_DATE").Equals(String.Empty) Then
                    e.NewValues.Item("RATING_UPDATE_DATE") = Date.Now
                End If
            End If

        End Sub

        Protected Sub FormView1_DataBound(ByVal sender As Object, ByVal e As System.EventArgs) Handles FormView1.DataBound
            Dim requestReadOnly As Boolean = Nothing

            Try
                requestReadOnly = CBool(Request.QueryString.Get("readonly"))
            Catch ex As Exception
                requestReadOnly = False
            End Try

            If requestReadOnly = False Then
                'ถ้าไม่มีข้อมูลหรือเป็น Empty data template ให้เปลี่ยน mode เป็น insert
                If DirectCast(sender, FormView).DataItemCount < 1 Then
                    DirectCast(sender, FormView).ChangeMode(FormViewMode.Insert)
                End If
            End If

            Dim hid As HiddenField = DirectCast(FormView1.FindControl("RatingHidd"), HiddenField)
            Dim ddl As DropDownList = DirectCast(FormView1.FindControl("RatingDDL"), DropDownList)

            If Not IsNothing(hid) Then
                ddl.SelectedValue = hid.Value
            End If
        End Sub

        Protected Sub CUSTOMER_ID_Load(ByVal sender As Object, ByVal e As System.EventArgs)
            If Not Me.IsPostBack Then
                'ถ้าเป็น mode insert ให้นำค่า cif จาก query string มาใส่ใน textbox
                If DirectCast(Page.Master.FindControl("ContentPlaceHolder2").FindControl("FormView1"), FormView).CurrentMode = FormViewMode.Insert Then
                    DirectCast(sender, TextBox).Text = Request.QueryString.Get("CIF")

                    If Not IsNothing(DirectCast(sender, TextBox).Text) And DirectCast(sender, TextBox).Text.Trim.Length > 0 Then
                        'ให้ script ทำงานหลังจาก page โหลดเสร็จ โดย script จะไปเรียก web service เพื่อค้นหาชื่อลูกค้า
                        Page.ClientScript.RegisterStartupScript(Me.GetType, "getName", "cusIdChange(getEleByClientSelector('CUSTOMER_ID'),'CUSTOMER_NAME');", True)
                    End If
                End If
            End If
        End Sub

        'ตัวอย่าง validate ฝั่ง server สำหรับ custom validate control
        Sub WeightValidate(ByVal sender As Object, ByVal e As ServerValidateEventArgs)
            MsgBox(sender.GetType.ToString)
            e.IsValid = False
        End Sub

        Protected Sub Ltv_PopupBt_Click(ByVal sender As Object, ByVal e As System.EventArgs)
            Dim popupBt As Button = DirectCast(sender, Button)

            Dim groupIdHid As HiddenField = DirectCast(popupBt.Parent.FindControl("GROUP_ID_HiddenField"), HiddenField)

            Response.Redirect(Page.ResolveUrl("~/aspx/customer/SmeGroupExposure.aspx") + "?groupId=" + groupIdHid.Value)


            'popupBt.OnClientClick = "var ltvPopup = window.open('" + Page.ResolveUrl("~/aspx/customer/SmeGroupExposure.aspx") + "?groupId=" + groupIdHid.Value + "'" _
            '                                                    + ",'ltvPopup'" _
            '                                                    + ",'toolbar=No,width=800,height=600,resizable=no,scrollbars=yes');" _
            '                        + "ltvPopup.focus();" _
            '                        + "return false;"

        End Sub

        Protected Sub Ltv_PopupBt_Load(ByVal sender As Object, ByVal e As System.EventArgs)
            validateControlRole(sender, e)
        End Sub

        Protected Sub Export_Bt_Load(ByVal sender As Object, ByVal e As System.EventArgs)
            If User.IsInRole(RoleIdConst.A_READ_ONLY) Then
                DirectCast(sender, WebControl).Enabled = False
            End If
        End Sub

        ' add by tam 5/11/2009  ค้นหาว่าในกลุ่ม มี covenant หรือไม่ ถ้ามีให้โชวปุ่ม ลิ้งไปหน้า covenant
        Protected Sub Butt_Covenant_Load(ByVal sender As Object, ByVal e As System.EventArgs)
            If Not Request.QueryString.Get("CIF") Is Nothing Then
                Dim dal As New VAnnalsCovenantDAL
                Dim Butt_Covenant As Button = DirectCast(sender, Button)
                ' MsgBox(Request("cif"))
                'MsgBox("show= " & dal.getFlagHaveCovenantFromCIF(CInt(Request.QueryString.Get("CIF"))))
                Butt_Covenant.Visible = dal.getFlagHaveCovenantFromCIF(CInt(Request.QueryString.Get("CIF")))
            End If
        End Sub

        Protected Sub DDL_CUSTOMER_SIZE_DataBinding(ByVal sender As Object, ByVal e As System.EventArgs)
            Dim DDL_CUSTOMER_SIZE As DropDownList = DirectCast(sender, DropDownList)

            If Not User.IsInRole("0000000001") Then
                If Not Eval("CM_CODE").Equals(User.Identity.Name) Then
                    DDL_CUSTOMER_SIZE.Enabled = False
                End If
            End If

        End Sub

        Protected Sub EditButton_PreRender(ByVal sender As Object, ByVal e As System.EventArgs)
            If User.IsInRole(RoleIdConst.A_READ_ONLY) Then
                DirectCast(sender, WebControl).Enabled = False
            End If
        End Sub

        Protected Sub DeleteButton_PreRender(ByVal sender As Object, ByVal e As System.EventArgs)
            If User.IsInRole(RoleIdConst.A_READ_ONLY) Then
                DirectCast(sender, WebControl).Enabled = False
            End If
        End Sub

        Protected Sub InsertButton_PreRender(ByVal sender As Object, ByVal e As System.EventArgs)
            If User.IsInRole(RoleIdConst.A_READ_ONLY) Then
                DirectCast(sender, WebControl).Enabled = False
            End If
        End Sub

        Protected Sub Butt_ManageRole_PreRender(ByVal sender As Object, ByVal e As System.EventArgs)
            If User.IsInRole(RoleIdConst.A_READ_ONLY) Then
                DirectCast(sender, WebControl).Enabled = False
            End If
        End Sub

    End Class
End Namespace
