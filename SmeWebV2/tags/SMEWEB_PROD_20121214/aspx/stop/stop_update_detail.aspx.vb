Imports System.Collections.Generic
Imports System.Globalization

Partial Class Stop_update_detail
    Inherits System.Web.UI.Page
    'Protected cul As New CultureInfo("th-TH") ' ปี ไทย  
    Protected cul As New CultureInfo("en-US") ' ปี eng 
    Protected Sub alert(ByVal str As String)
        Response.Write("<script language=""javascript"">alert(""" & str & """)</script>")
    End Sub
    Protected Sub BindDropDown()

        Dim dalJudgement As New AnnalsJudgementDAL
        Dim arrJudgement As New List(Of AnnalsJudgement)
        arrJudgement = dalJudgement.getAllAnnalsJudgement
        ddlJUDGEMENT_ID_IN.DataSource = arrJudgement
        ddlJUDGEMENT_ID_IN.DataValueField = "ID"
        ddlJUDGEMENT_ID_IN.DataTextField = "Judgement"
        ddlJUDGEMENT_ID_IN.DataBind()

        ddlJUDGEMENT_ID.DataSource = arrJudgement
        ddlJUDGEMENT_ID.DataValueField = "ID"
        ddlJUDGEMENT_ID.DataTextField = "Judgement"
        ddlJUDGEMENT_ID.DataBind()

        Dim dalUPDATE_PAY_ABILITY_ID As New StopPayAbilityDAL
        Dim arrUPDATE_PAY_ABILITY_ID As New List(Of StopPayAbility)
        arrUPDATE_PAY_ABILITY_ID = dalUPDATE_PAY_ABILITY_ID.getAllStopPayAbility
        ddlUPDATE_PAY_ABILITY_ID.DataSource = arrUPDATE_PAY_ABILITY_ID
        ddlUPDATE_PAY_ABILITY_ID.DataValueField = "PAY_ABILITY_ID"
        ddlUPDATE_PAY_ABILITY_ID.DataTextField = "PAY_ABILITY_DETAIL"
        ddlUPDATE_PAY_ABILITY_ID.DataBind()

        ddlUPDATE_PAY_ABILITY_IDSM.DataSource = arrUPDATE_PAY_ABILITY_ID
        ddlUPDATE_PAY_ABILITY_IDSM.DataValueField = "PAY_ABILITY_ID"
        ddlUPDATE_PAY_ABILITY_IDSM.DataTextField = "PAY_ABILITY_DETAIL"
        ddlUPDATE_PAY_ABILITY_IDSM.DataBind()



        Dim dalUPDATE_ACTION_ID As New StopActionDAL
        Dim arrUPDATE_ACTION_ID As New List(Of StopAction)
        arrUPDATE_ACTION_ID = dalUPDATE_ACTION_ID.getAllStopAction
        ddlUPDATE_ACTION_ID.DataSource = arrUPDATE_ACTION_ID
        ddlUPDATE_ACTION_ID.DataValueField = "ACTION_ID"
        ddlUPDATE_ACTION_ID.DataTextField = "ACTION_DETAIL"
        ddlUPDATE_ACTION_ID.DataBind()

        Dim dalUPDATE_DEPT_RESOLVE_ID As New StopDeptResolveProcessDAL
        Dim arrUPDATE_DEPT_RESOLVE_ID As New List(Of StopDeptResolveProcess)
        arrUPDATE_DEPT_RESOLVE_ID = dalUPDATE_DEPT_RESOLVE_ID.getAllStopDeptResolveProcess
        ddlUPDATE_DEPT_RESOLVE_ID.DataSource = arrUPDATE_DEPT_RESOLVE_ID
        ddlUPDATE_DEPT_RESOLVE_ID.DataValueField = "DEPT_RESOLVE_ID"
        ddlUPDATE_DEPT_RESOLVE_ID.DataTextField = "DEPT_RESOLVE_DETAIL"
        ddlUPDATE_DEPT_RESOLVE_ID.DataBind()

        ddlUPDATE_PREDICT_NPL.Items.Add(New ListItem("..โปรดระบุ..", ""))
        ddlUPDATE_PREDICT_NPL.Items.Add(New ListItem("คาดว่าไม่เป็น", "NO"))
        For i = 0 To 11
            Dim dayAdd As Date = DateAdd(DateInterval.Month, i, Now.Date)  ' เอาไว้หาวันที่ในเดือนที่กำหนด
            Dim yearVal = dayAdd.Year
            If yearVal > 2500 Then yearVal = yearVal - 543 ' ขี้เกียจคิดเอาแบบนี้ไปก่อน :<  เวลา debug ในเครื่องวันที่ format ไม่ตรง server  เลยบังคับให้เป็น คศ
            Dim strMonth As String = MonthName(dayAdd.Month) & " " & yearVal ' แสดงชื่อเดือน ปี ใน dropdwon
            Dim valMonth As String = yearVal & Right("00" & dayAdd.Month, 2)   ' กำหนดวันที่ใน dropdown 
            ddlUPDATE_PREDICT_NPL.Items.Add(New ListItem(strMonth, valMonth))
            'MsgBox(ddlUPDATE_PREDICT_NPL.Items(i).Value)
        Next


    End Sub
    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Page.IsPostBack = False Then

            PreSearch()
            BindDropDown()
            ClearText()
            SearchCif()
            btnDelete.Attributes.Add("onclick", "return confirm(' คุณต้องการย้ายข้อมูลออกหรือไม่ ? ');")
            btnDeleteToBMR.Attributes.Add("onclick", "return confirm(' คุณต้องการย้ายข้อมูลไปยัง บมร.หรือไม่ ? ');")
            HyperLink1.NavigateUrl = "~/aspx/customer/SmeCustomerManagement.aspx?cif=" & Request("cif")

            If Request.QueryString("type") = "sm" Then
                lblUPDATE_PAY_ABILITY_IDSM.Visible = True
                ddlUPDATE_PAY_ABILITY_IDSM.Visible = True
                ddlUPDATE_PAY_ABILITY_IDSM.Enabled = False
            ElseIf Request.QueryString("type") = "ss" Then
                lblUPDATE_PAY_ABILITY_IDSM.Visible = True
                ddlUPDATE_PAY_ABILITY_IDSM.Visible = True
                ddlUPDATE_PAY_ABILITY_IDSM.Enabled = False
            Else
                lblUPDATE_PAY_ABILITY_IDSM.Visible = False
                ddlUPDATE_PAY_ABILITY_IDSM.Visible = False
            End If
        End If
        ' กรณีที่มี role readonly กำหนดให้ไม่สามารถบันทึกข้อมูลหรือแก้ไขได้
        If HttpCookieUtil.hasRolesId(Context.Request.Cookies(FormsAuthentication.FormsCookieName), RoleIdConst.A_READ_ONLY) Then
            btnUpdate.Visible = False
            btnDelete.Visible = False
            btnDeleteToBMR.Visible = False
        Else
            btnUpdate.Visible = True
            btnDelete.Visible = True
            btnDeleteToBMR.Visible = True
        End If

    End Sub
    Protected Sub SearchCif()
        ' Code check input error. 

        Dim dal As New StopCustomerDescFullDAL ' Create object dal
        Dim obj As New StopCustomerDescFull ' Create object 

        If Request("cif") = Nothing Then
            tbCIF.Text = 0
        Else
            tbCIF.Text = Request("cif")
        End If
        obj.CIF = tbCIF.Text
        If Request("type") = "sm" Then
            obj = dal.getStopCustomerDescFullByCIF_SM(obj)
        ElseIf Request("type") = "ss" Then
            obj = dal.getStopCustomerDescFullByCIF_SS(obj)
        Else
            obj = dal.getStopCustomerDescFullByCIF(obj)
        End If


        If obj.CUSTOMER_NAME = "" Then
            alert("ไม่พบข้อมูล")
            closeWindow()
        End If
        tbCIF.Text = obj.CIF
        tbCUSTOMER_NAME.Text = obj.CUSTOMER_NAME
        tbCLASS_H.Text = obj.CLASS_H & "<br>(" & obj.CLASS_H_M & ")"


        'tbAGING_DPD.Text = String.Format("{0:#,#.##}", obj.AGING_DPD)
        tbAGING_DPD.Text = obj.AGING_DPD_IN
        '  tbACCRU.Text = String.Format("{0:#,#.##}", obj.ACCRU)
        tbPRINCIPAL.Text = String.Format("{0:#,#.##}", obj.PRINCIPAL)
        ' tbSUSP.Text = String.Format("{0:#,#.##}", obj.SUSP)

        tbAGING_DPD_IN.Text = obj.AGING_DPD_IN
        tbIS_TDR_IN.Text = obj.IS_TDR_IN
        tbOD_UTILIZE_IN.Text = obj.OD_UTILIZE_IN & "<br>(" & String.Format("{0:d}", obj.OD_AS_OF) & ")"
        tbBUSINESS_CIM_FLAG_IN.Text = obj.BUSINESS_CIM_FLAG_IN
        tbBUSINESS_CODE_IN.Text = obj.BUSINESS_CODE_IN
        tbBUSINESS_DESC_IN.Text = obj.BUSINESS_DESC_IN
        tbAGING_CRITERIA_IN.Text = obj.AGING_CRITERIA_IN
        tbCLASS_CRITERIA_IN.Text = obj.CLASS_CRITERIA_IN
        tbTDR_CRITERIA_IN.Text = obj.TDR_CRITERIA_IN
        tbOD_UTILIZE_CRITERIA_IN.Text = obj.OD_UTILIZE_CRITERIA_IN
        tbJUDGEMENT_CRITERIA_IN.Text = obj.JUDGEMENT_CRITERIA_IN
        tbBUSINESS_CRITERIA_IN.Text = obj.BUSINESS_CRITERIA_IN

        tbDATE_IN.Text = String.Format("{0:d}", obj.DATE_IN)
        ddlUPDATE_ACTION_ID.SelectedIndex = 0
        If obj.UPDATE_TDR_DATE <> Nothing Then tbUPDATE_TDR_DATE.Text = obj.UPDATE_TDR_DATE
        If obj.UPDATE_ACTION_DATE <> Nothing Then tbUPDATE_ACTION_DATE.Text = obj.UPDATE_ACTION_DATE
        tbUPDATE_ACTION_USER.Text = obj.UPDATE_ACTION_USER
        tbUPDATE_COMMENT.Text = obj.UPDATE_COMMENT
        tbUPDATE_PROBLEM.Text = obj.UPDATE_PROBLEM

        For i As Integer = 0 To ddlJUDGEMENT_ID_IN.Items.Count - 1
            If ddlJUDGEMENT_ID_IN.Items(i).Value = obj.JUDGEMENT_ID_IN Then
                ddlJUDGEMENT_ID_IN.SelectedIndex = i
                Exit For
            End If
        Next
        For i As Integer = 0 To ddlJUDGEMENT_ID.Items.Count - 1
            If ddlJUDGEMENT_ID.Items(i).Value = obj.JUDGEMENT_ID Then
                ddlJUDGEMENT_ID.SelectedIndex = i
                Exit For
            End If
        Next
        ' MsgBox(obj.PAY_STATUS_ID)
        ' ถ้าเป็น special mention หรือ tdr request
        If Request("type") = "sm" Or Request("type") = "ss" Then
            For i As Integer = 0 To ddlUPDATE_PAY_ABILITY_IDSM.Items.Count - 1
                If ddlUPDATE_PAY_ABILITY_IDSM.Items(i).Value = obj.PAY_STATUS_ID Then
                    ' กำหนดให้เลือกตามที่มาจาก sm
                    ddlUPDATE_PAY_ABILITY_IDSM.SelectedIndex = i
                    ' ddlUPDATE_PAY_ABILITY_ID.SelectedIndex = i
                    Exit For
                End If
            Next

            For i As Integer = 0 To ddlUPDATE_PAY_ABILITY_ID.Items.Count - 1
                If ddlUPDATE_PAY_ABILITY_ID.Items(i).Value = obj.UPDATE_PAY_ABILITY_ID Then
                    ddlUPDATE_PAY_ABILITY_ID.SelectedIndex = i
                    Exit For
                End If
            Next
            If Request("type") = "sm" Then
                ddlUPDATE_PAY_ABILITY_ID.SelectedIndex = ddlUPDATE_PAY_ABILITY_IDSM.SelectedIndex
                ddlUPDATE_PAY_ABILITY_ID.Enabled = False
            End If
        Else
            ' หา list ability จากการเลือก judgement
            FindListFromJudgement(ddlJUDGEMENT_ID.Items(ddlJUDGEMENT_ID.SelectedIndex).Value)
            For i As Integer = 0 To ddlUPDATE_PAY_ABILITY_ID.Items.Count - 1
                If ddlUPDATE_PAY_ABILITY_ID.Items(i).Value = obj.UPDATE_PAY_ABILITY_ID Then
                    ddlUPDATE_PAY_ABILITY_ID.SelectedIndex = i
                    Exit For
                End If
            Next

        End If

        ' หา list action จากการเลือก Pay
        FindListFromPayAblity(ddlUPDATE_PAY_ABILITY_ID.Items(ddlUPDATE_PAY_ABILITY_ID.SelectedIndex).Value)
        For i As Integer = 0 To ddlUPDATE_ACTION_ID.Items.Count - 1
            If ddlUPDATE_ACTION_ID.Items(i).Value = obj.UPDATE_ACTION_ID Then
                ddlUPDATE_ACTION_ID.SelectedIndex = i
                Exit For
            End If
        Next

        ' หา list deptresolve จาก action
        If ddlUPDATE_ACTION_ID.SelectedIndex > -1 Then
            FindListFromAction(ddlUPDATE_ACTION_ID.Items(ddlUPDATE_ACTION_ID.SelectedIndex).Value)
        End If

        For i As Integer = 0 To ddlUPDATE_DEPT_RESOLVE_ID.Items.Count - 1
            If ddlUPDATE_DEPT_RESOLVE_ID.Items(i).Value = obj.UPDATE_DEPT_RESOLVE_ID Then
                ddlUPDATE_DEPT_RESOLVE_ID.SelectedIndex = i
                Exit For
            End If
        Next

        ' field นี้มีค่าได้ 3 แบบ คือ null ยังไม่ได้ระบุ , NO คือไม่เป็น , YYYYMM  คือระบุเดือนที่คาดว่าเป็น npl
        'ค่าวันที่  201004   ถือว่าเป็น เดือน 4 / 2553  

        Dim S = False ' กำหนดตัวแปรในการค้นหาเดือนที่ระบุ npl
        For i As Integer = 0 To ddlUPDATE_PREDICT_NPL.Items.Count - 1
            If ddlUPDATE_PREDICT_NPL.Items(i).Value = obj.UPDATE_PREDICT_NPL Then
                ddlUPDATE_PREDICT_NPL.SelectedIndex = i
                S = True
                Exit For
            End If
        Next
        ' ถ้าหาไม่เจออาจเป็นกรณีที่ dropdown เดือนปัจจุบัน เกินเดือนที่ user เลือกมาแล้ว ให้ใส่ค่าลงไปใน dropdown ด้วย
        If S = False And obj.UPDATE_PREDICT_NPL <> "" And obj.UPDATE_PREDICT_NPL <> "NO" Then
            Dim strMonth As String = MonthName(CInt(obj.UPDATE_PREDICT_NPL.Substring(4, 2))) & " " & obj.UPDATE_PREDICT_NPL.Substring(0, 4)
            ddlUPDATE_PREDICT_NPL.Items.Insert(2, New ListItem(strMonth, obj.UPDATE_PREDICT_NPL))
            ddlUPDATE_PREDICT_NPL.SelectedIndex = 2
        End If



        ' กำหนดให้ update judement ไม่ได้
        ddlJUDGEMENT_ID.Enabled = False
        ddlJUDGEMENT_ID_IN.Enabled = False

        PreUpdate()
    End Sub

    Sub PreUpdate()

        btnUpdate.Visible = True
        btnDelete.Visible = True

    End Sub
    Sub PreSearch()
        ClearText()
        btnUpdate.Visible = True
        btnDelete.Visible = True

    End Sub
    Protected Sub btnUpdate_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnUpdate.Click
        If Session("EMP_ID") = Nothing Then
            alert("หมดเวลาบันทึกข้อมูลกรุณา login อีกครั้ง")
            closeWindow()
            Exit Sub

        End If
        Dim deptRedolveValue As String = ddlUPDATE_DEPT_RESOLVE_ID.SelectedValue
        If deptRedolveValue = String.Empty Then
            deptRedolveValue = "00"
        End If
        'Code check input error. 
        Dim ErrString As String = CheckErrINput()
        If ErrString <> "" Then
            alert(ErrString)
            Exit Sub
        End If
        Dim dal As New StopCustomerDAL ' Create object dal
        Dim obj As New StopCustomer ' Create object 

        obj.CIF = tbCIF.Text
        obj.UPDATE_ACTION_ID = ddlUPDATE_ACTION_ID.SelectedValue
        obj.DATE_IN = tbDATE_IN.Text
        obj.UPDATE_ACTION_DATE = Date.Now
        obj.UPDATE_ACTION_USER = Session("EMP_ID").ToString
        obj.UPDATE_PAY_ABILITY_ID = ddlUPDATE_PAY_ABILITY_ID.SelectedValue
        obj.UPDATE_DEPT_RESOLVE_ID = deptRedolveValue
        obj.UPDATE_COMMENT = tbUPDATE_COMMENT.Text
        obj.UPDATE_PROBLEM = tbUPDATE_PROBLEM.Text
        obj.UPDATE_PREDICT_NPL = ddlUPDATE_PREDICT_NPL.SelectedValue
        'obj.UPDATE_PAY_DETAIL_ID = ddlUPDATE_PAY_DETAIL_ID.SelectedValue

        dal.updateStopCustomer(obj)
        alert(" Update complete ")
        closeWindow()
    End Sub

    Sub ClearText()

        tbCIF.Text = ""
        tbAGING_DPD_IN.Text = ""
        tbCLASS_H.Text = ""
        tbIS_TDR_IN.Text = ""
        tbOD_UTILIZE_IN.Text = ""
        ddlJUDGEMENT_ID_IN.SelectedIndex = -1
        tbBUSINESS_CIM_FLAG_IN.Text = ""
        tbBUSINESS_CODE_IN.Text = ""
        tbBUSINESS_DESC_IN.Text = ""
        tbAGING_CRITERIA_IN.Text = ""
        tbCLASS_CRITERIA_IN.Text = ""
        tbTDR_CRITERIA_IN.Text = ""
        tbOD_UTILIZE_CRITERIA_IN.Text = ""
        tbJUDGEMENT_CRITERIA_IN.Text = ""
        tbBUSINESS_CRITERIA_IN.Text = ""
        tbDATE_IN.Text = ""
        ddlUPDATE_ACTION_ID.SelectedIndex = -1

        tbUPDATE_ACTION_USER.Text = ""
        ddlUPDATE_PAY_ABILITY_ID.SelectedIndex = -1
        ddlUPDATE_DEPT_RESOLVE_ID.SelectedIndex = -1

        tbCUSTOMER_NAME.Text = ""

        tbUPDATE_COMMENT.Text = ""

        ddlJUDGEMENT_ID.SelectedIndex = -1

    End Sub

    Function CheckErrINput() As String
        Dim str As String = ""

        'If tbUPDATE_COMMENT.Text = "" Then
        '    str += "Please input UPDATE_COMMENT.  \n"
        'End If
        If ddlUPDATE_PREDICT_NPL.SelectedValue = "" Then
            str += " กรุณาระบุข้อมูลการคาดเดาว่าลูกค้าจะเป็น NPL หรือไม่"
            ddlUPDATE_PREDICT_NPL.BackColor = Drawing.Color.Red
        Else
            ddlUPDATE_PREDICT_NPL.BackColor = Drawing.Color.White
        End If

        Return str
    End Function

    Protected Sub ddlJUDGEMENT_ID_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles ddlJUDGEMENT_ID.SelectedIndexChanged
        FindListFromJudgement(ddlJUDGEMENT_ID.Items(ddlJUDGEMENT_ID.SelectedIndex).Value)
    End Sub

    Sub FindListFromJudgement(ByVal Judgementid As String)

        ' หา list ของ dropdown ที่เป็นไปได้จากการเลือก judgement
        Dim sql As String = Nothing
        sql = "    select p.PAY_ABILITY_ID,p.PAY_ABILITY_DETAIL  FROM [STOP].[dbo].[STOP_RELATION_TABLE] s "
        sql = sql & "  inner join stop_pay_ability p on  s.Relation_target_column=p.pay_ability_id "
        sql = sql & " WHERE RELATION_TABLE='JUDGEMENT' and  RELATION_COLUMN='" & Judgementid & "'"

        Dim dalUPDATE_PAY_ABILITY_ID As New StopPayAbilityDAL
        Dim arrUPDATE_PAY_ABILITY_ID As New List(Of StopPayAbility)
        arrUPDATE_PAY_ABILITY_ID = dalUPDATE_PAY_ABILITY_ID.getAllStopPayAbilityBySQL(sql)
        'MsgBox(arrUPDATE_PAY_ABILITY_ID.Count)
        ddlUPDATE_PAY_ABILITY_ID.DataSource = arrUPDATE_PAY_ABILITY_ID
        ddlUPDATE_PAY_ABILITY_ID.DataValueField = "PAY_ABILITY_ID"
        ddlUPDATE_PAY_ABILITY_ID.DataTextField = "PAY_ABILITY_DETAIL"
        ddlUPDATE_PAY_ABILITY_ID.DataBind()

        ' หา list pay detail จาก pay ability
        If ddlUPDATE_PAY_ABILITY_ID.SelectedIndex > -1 Then
            FindListFromPayAblity(ddlUPDATE_PAY_ABILITY_ID.Items(ddlUPDATE_PAY_ABILITY_ID.SelectedIndex).Value)
        End If

    End Sub

    Protected Sub ddlUPDATE_PAY_ABILITY_ID_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles ddlUPDATE_PAY_ABILITY_ID.SelectedIndexChanged
        FindListFromPayAblity(ddlUPDATE_PAY_ABILITY_ID.Items(ddlUPDATE_PAY_ABILITY_ID.SelectedIndex).Value)
    End Sub

    Sub FindListFromPayAblity(ByVal PayAbilityID As String)

        ' หา list ของ dropdown ที่เป็นไปได้จากการเลือก judgement
        Dim sql As String = Nothing
        sql = "    select p.ACTION_ID,p.ACTION_DETAIL,p.ACTION_GROUP,p.ACTION_PRIORITY  FROM [STOP].[dbo].[STOP_RELATION_TABLE] s "
        sql = sql & "  inner join STOP_ACTION  p on  s.Relation_target_column=p.ACTION_ID "
        sql = sql & " WHERE RELATION_TABLE='ABILITY' and  RELATION_COLUMN='" & PayAbilityID & "' ORDER BY ACTION_PRIORITY ASC  "
        'MsgBox(sql)

        Dim dalUPDATE_ACTION_ID As New StopActionDAL
        Dim arrUPDATE_ACTION_ID As New List(Of StopAction)
        arrUPDATE_ACTION_ID = dalUPDATE_ACTION_ID.getAllStopActionBySQL(sql)
        ddlUPDATE_ACTION_ID.DataSource = arrUPDATE_ACTION_ID
        ddlUPDATE_ACTION_ID.DataValueField = "ACTION_ID"
        ddlUPDATE_ACTION_ID.DataTextField = "ACTION_DETAIL"
        ddlUPDATE_ACTION_ID.DataBind()

        If ddlUPDATE_ACTION_ID.SelectedIndex > -1 Then
            FindListFromAction(ddlUPDATE_ACTION_ID.Items(ddlUPDATE_ACTION_ID.SelectedIndex).Value)
        End If
    End Sub

    Sub FindListFromAction(ByVal ActionID As String)

        ' หา list ของ dropdown ที่เป็นไปได้จากการเลือก judgement
        Dim sql As String = Nothing
        sql = "    select p.DEPT_RESOLVE_ID,p.DEPT_RESOLVE_DETAIL  FROM [STOP].[dbo].[STOP_RELATION_TABLE] s "
        sql = sql & "  inner join STOP_DEPT_RESOLVE_PROCESS  p on  s.Relation_target_column=p.DEPT_RESOLVE_ID "
        sql = sql & " WHERE RELATION_TABLE='ACTION' and  RELATION_COLUMN='" & ActionID & "'"
        'MsgBox(sql)


        Dim dalUPDATE_DEPT_RESOLVE_ID As New StopDeptResolveProcessDAL
        Dim arrUPDATE_DEPT_RESOLVE_ID As New List(Of StopDeptResolveProcess)
        ' MsgBox(arrUPDATE_DEPT_RESOLVE_ID.Count)
        arrUPDATE_DEPT_RESOLVE_ID = dalUPDATE_DEPT_RESOLVE_ID.getAllStopDeptResolveProcessBySQL(sql)
        ddlUPDATE_DEPT_RESOLVE_ID.DataSource = arrUPDATE_DEPT_RESOLVE_ID
        ddlUPDATE_DEPT_RESOLVE_ID.DataValueField = "DEPT_RESOLVE_ID"
        ddlUPDATE_DEPT_RESOLVE_ID.DataTextField = "DEPT_RESOLVE_DETAIL"
        ddlUPDATE_DEPT_RESOLVE_ID.DataBind()

    End Sub

    Protected Sub ddlUPDATE_ACTION_ID_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles ddlUPDATE_ACTION_ID.SelectedIndexChanged
        FindListFromAction(ddlUPDATE_ACTION_ID.Items(ddlUPDATE_ACTION_ID.SelectedIndex).Value)
    End Sub

    Protected Sub btnDelete_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnDelete.Click
        Dim dal As New StopCustomerDescFullDAL ' Create object dal
        Dim obj As New StopCustomerDescFull ' Create object 

        Dim dalDel As New StopCustomerDAL

        Dim sErr As String = ""
        obj.CIF = tbCIF.Text
        If Request("type") = "sm" Then
            obj = dal.getStopCustomerDescFullByCIF_SM(obj)
        ElseIf Request("type") = "ss" Then
            obj = dal.getStopCustomerDescFullByCIF_SS(obj)
        Else
            obj = dal.getStopCustomerDescFullByCIF(obj)
        End If
        If obj.UPDATE_ACTION_ID <> "00" Then
            ' sErr = "y"
        End If
        If sErr = "" Then
            dalDel.deleteStopCustomer(tbCIF.Text)
            alert(" ย้ายข้อมูลออกเรียบร้อย")
            closeWindow()
        Else
            alert("ไม่สามารถย้ายข้อมูลออกได้")
        End If



    End Sub

    Protected Sub btnDeleteToBMR_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnDeleteToBMR.Click
        Dim dal As New StopCustomerDAL
        dal.moveToBMR(tbCIF.Text)
        alert(" ย้ายข้อมูลไปบมร.เรียบร้อย")
        closeWindow()
    End Sub
    Sub closeWindow()
        Dim S As String
        S += "<script language='javascript'>"
        S += "window.top.close();"
        S += "</script>"
        'Page.ClientScript.RegisterStartupScript(Me.GetType, "test", S, True)
        Response.Write(S)
    End Sub

    Protected Sub btnClose_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnClose.Click
        closeWindow()
    End Sub
End Class
