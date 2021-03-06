Imports System.Collections.Generic
Imports System.Data
Imports System.Data.SqlClient
Imports System.Globalization
Imports System.IO
Partial Class _AnnalsCredit
    ' Protected cul = CultureInfo("th-TH") ' ปี ไทย  
    'Protected cul As New CultureInfo("en-US") ' ปี eng 
    Inherits System.Web.UI.Page
    '  Implements System.Web.UI.ICallbackEventHandler
    Public idByRef As String = Nothing

    Public isDuplcateCallback As String = Nothing
    Public VirtualImageRoot As String = "images/COLLET_PIC/"

#Region "WebMethod"
    <System.Web.Script.Services.ScriptMethod()> _
    <System.Web.Services.WebMethod()> _
    Public Shared Function findRef(ByVal ref As String) As String
        Dim strJson As String = ""
        Dim Refdal As New AnnalsDAL()
        'Dim idByRef = Refdal.getIdByReference(REFERENCETextBox.Text)
        Dim arrayID As ArrayList = Refdal.getAnnalsProcessByReference(ref)
        If arrayID.Count > 1 Then
            strJson = " { 'id':'" & arrayID.Item(0) & "','process_group':'" & arrayID.Item(1) & "'}"
        Else
            strJson = " {}"
        End If
        Return strJson
    End Function
    <System.Web.Script.Services.ScriptMethod()> _
 <System.Web.Services.WebMethod()> _
    Public Shared Function findEMPLOYEE(ByVal empID As String) As String
        Dim strJson As String = ""
        Dim empDAL As New TbEmployeeDAL
        Dim objEmp As TbEmployee = empDAL.getTbEmployeeByEMP_ID(empID)
        If Not objEmp Is Nothing Then
            If objEmp.EMPNAME <> "" Then
                strJson = " { 'empid':'" & objEmp.EMP_ID & "','empname':'" & objEmp.EMPNAME & " " & objEmp.EMPSURNAME & "'}"
            End If
        Else
            strJson = " {'empid':'','empname':'ไม่พบข้อมูล'}"
        End If

        Return strJson
    End Function



#End Region

#Region "Search"

    Protected Sub btnCancel_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnCancel.Click
        Search_Annals(tbID.Text)
    End Sub
    Protected Sub Search_Annals(ByVal Annals_id As String)
        If Annals_id = "" Then
            PreAdd()
        Else
            '==========เริ่มค้นหา
            Dim dal As New AnnalsCreditDAL ' Create object dal
            Dim obj As New AnnalsCredit ' Create object 

            tbID.Text = Annals_id
            LblAnnalsid.Text = Mid(Annals_id, 1, 6) & "/" & CInt(Mid(Annals_id, 7, 4)) + 543
            LblAnnalsid.ToolTip = Annals_id
            obj.ID = tbID.Text
            obj = dal.getAnnalsCreditByID(obj)

            If obj.ANNALS_TYPE <> "" Then  ' มีเลขหนังสือแต่ยังไม่มีหนังสือสินเชื่อให้สร้างใหม่

                Dim dalAnnals As New AnnalsDAL
                Dim objAnnals As New Annals
                objAnnals.ANNALS_TYPE = 1
                objAnnals.ANNALS_SEQ_NO = Mid(Annals_id, 2, 5)
                objAnnals.ANNALS_YEAR = CInt(Mid(Annals_id, 7, 4))
                objAnnals = dalAnnals.getAnnalsByPK(objAnnals)

                'MsgBox(objAnnals.ToString)
                REFERENCETextBox.Text = objAnnals.REFERENCE
                OLDREFERENCE.Value = objAnnals.REFERENCE
                lblRefid.Text = objAnnals.REFERENCE

                SENDERTextBox.Text = objAnnals.SENDER
                'RECIVERTextBox.Text = objAnnals.RECIVER
                Session("OldSender") = objAnnals.SENDER  ' เก็บค่าก่อนการเปลี่ยนแปลง
                Session("OldReciever") = objAnnals.RECIVER
                DATE_IN_ANNALS_TextBox.Text = objAnnals.DATE_IN_ANNALS


                tbID.Text = obj.ID
                tbANNALS_TYPE.Text = obj.ANNALS_TYPE
                tbANNALS_SEQ_NO.Text = obj.ANNALS_SEQ_NO
                tbANNALS_YEAR.Text = obj.ANNALS_YEAR
                tbID_OUT.Text = obj.ID_OUT
                btnIDOUT.Enabled = True
                If tbID_OUT.Text = "" Then
                    ' ImageButton2.Attributes.Add("onclick", "return confirm('คุณต้องการสร้างหนังสือออกใช่หรือไม่?\n\n!!! อย่าลืมใส่ค่า Credit Approve หลังออกหนังสือ !!!');")                           btnIDOUT.Attributes.Add("onclick", "return confirm('คุณต้องการสร้างหนังสือออกใช่หรือไม่?\n\n!!! อย่าลืมใส่ค่า Credit Approve หลังออกหนังสือ !!!');")
                Else
                    ' ImageButton2.Attributes.Remove("onclick")
                    btnIDOUT.Attributes.Remove("onclick")
                End If

                DDLApprove1.SelectedIndex = 0
                For i As Integer = 0 To DDLApprove1.Items.Count - 1
                    If DDLApprove1.Items(i).Value = obj.EMP_APPROVE_ID Then
                        DDLApprove1.SelectedIndex = i
                        Exit For
                    End If
                Next
                DDLApprove2.SelectedIndex = 0
                For i As Integer = 0 To DDLApprove2.Items.Count - 1
                    If DDLApprove2.Items(i).Value = obj.EMP_APPROVE2_ID Then
                        DDLApprove2.SelectedIndex = i
                        Exit For
                    End If
                Next
                DDLApprove3.SelectedIndex = 0
                For i As Integer = 0 To DDLApprove3.Items.Count - 1
                    If DDLApprove3.Items(i).Value = obj.EMP_APPROVE3_ID Then
                        DDLApprove3.SelectedIndex = i
                        Exit For
                    End If
                Next
                DDLApprove4.SelectedIndex = 0
                For i As Integer = 0 To DDLApprove4.Items.Count - 1
                    If DDLApprove4.Items(i).Value = obj.EMP_APPROVE4_ID Then
                        DDLApprove4.SelectedIndex = i
                        Exit For
                    End If
                Next

                DDLRequestApprove.SelectedIndex = 0
                For i As Integer = 0 To DDLRequestApprove.Items.Count - 1
                    If DDLRequestApprove.Items(i).Value = obj.EMP_REQUEST_ID Then
                        DDLRequestApprove.SelectedIndex = i
                        Exit For
                    End If
                Next


                ddlBOARD_ID.SelectedIndex = 0
                For i As Integer = 0 To ddlBOARD_ID.Items.Count - 1
                    If ddlBOARD_ID.Items(i).Value = obj.BOARD_ID Then
                        ddlBOARD_ID.SelectedIndex = i
                        Exit For
                    End If
                Next
                For i As Integer = 0 To ddlResult.Items.Count - 1
                    If ddlResult.Items(i).Value = obj.Result Then
                        ddlResult.SelectedIndex = i
                        Exit For
                    End If
                Next
                For i As Integer = 0 To ddlComment.Items.Count - 1
                    If ddlComment.Items(i).Value = obj.Comment Then
                        ddlComment.SelectedIndex = i
                        Exit For
                    End If
                Next
                'For i As Integer = 0 To ddlCMJudgement.Items.Count - 1
                '    If ddlCMJudgement.Items(i).Value = obj.CMJudgement Then
                '        ddlCMJudgement.SelectedIndex = i
                '        Exit For
                '    End If
                'Next
                'For i As Integer = 0 To ddlCMJudgementBoard.Items.Count - 1
                'If ddlCMJudgementBoard.Items(i).Value = obj.CMJudgementBoard Then
                '    ddlCMJudgementBoard.SelectedIndex = i
                '    Exit For
                'End If
                'Next




                '   tbRM_ID.Text = obj.RM_ID
                '  tbDep_ID.Text = obj.DEP_ID
                ' tbFlag.Text = obj.Flag

                tbBranch_ID.Text = obj.BRANCH_ID
                tbRegion_ID.Text = obj.REGION_ID
                tbOthers.Text = obj.Others
                tbOthers2.Text = obj.Others2
                tbReason.Text = obj.Reason
                tbReason2.Text = obj.Reason2
                ' MsgBox(obj.SME_Referral_No.Substring(7, 4))
                If Len(obj.SME_Referral_No) = 11 Then
                    tbSME_Referral_No.Text = obj.SME_Referral_No.Substring(0, 6)
                    DDLReferalYear.SelectedIndex = DDLReferalYear.Items.IndexOf(DDLReferalYear.Items.FindByValue(obj.SME_Referral_No.Substring(7, 4)))
                End If
                For i As Integer = 0 To DDLJobTypeId.Items.Count - 1
                    If DDLJobTypeId.Items(i).Value.ToString = obj.Job_Type_Id.ToString Then
                        DDLJobTypeId.SelectedIndex = i
                        'MsgBox(i)
                        Exit For
                    End If
                Next
                ' เพิ่ม 29/06/2009
                For i As Integer = 0 To DDLCustomer_Size.Items.Count - 1
                    If DDLCustomer_Size.Items(i).Value.ToString = obj.Customer_Size.ToString Then
                        DDLCustomer_Size.SelectedIndex = i
                        'MsgBox(i)
                        Exit For
                    End If
                Next


                For i As Integer = 0 To ddlSendToBoard.Items.Count - 1
                    'MsgBox(ddlSendToBoard.Items(i).Value.ToString.ToLower & "'" & i & "'")
                    'MsgBox(obj.Send_To_Board.ToString.ToLower)
                    If ddlSendToBoard.Items(i).Value.ToString.ToLower = obj.Send_To_Board.ToString.ToLower Then
                        ddlSendToBoard.SelectedIndex = i
                        '   MsgBox(i)
                        Exit For
                    End If
                Next

                'MsgBox(obj.COVENANT_FLAG)

                RadioCovenant.Checked = False
                RadioOldCovenant.Checked = False
                RadioNoCovenant.Checked = False
                ImgAddCovenant.Visible = False
                lblAddCovenant.Visible = False


                If obj.COVENANT_FLAG = "1" Then ' มี covenant
                    RadioCovenant.Checked = True  ' เพิ่มวันที่ 29/09/2009
                    ImgAddCovenant.Visible = True
                    lblAddCovenant.Visible = True
                End If
                If obj.COVENANT_FLAG = "0" Then   ' ไม่มี covenant
                    RadioNoCovenant.Checked = True  ' เพิ่มวันที่ 29/09/2009
                End If
                If obj.COVENANT_FLAG = "2" Then   ' ใช้ covenant เดิม
                    RadioOldCovenant.Checked = True ' เพิ่มวันที่ 20/07/2010
                End If

                PanelCheckNcb.BackColor = Drawing.Color.White
                LabelStatusCheckNcb.BackColor = Drawing.Color.White


                'MsgBox(checkConcernFlood(tbID.Text))


                If obj.IS_FLOOD = 1 Then
                    RadioFloodBot.Checked = True
                    ImageAddFloodBOT.Visible = True
                    LabelAddFloodBOT.Visible = True

                ElseIf obj.IS_FLOOD = 0 Then
                    RadioNoFlood.Checked = True
                    ImageAddFloodBOT.Visible = False
                    LabelAddFloodBOT.Visible = False
                End If


                ' เพิ่มวันที่ 18/02/2010
                If obj.DO_KFS_FLAG = "1" Then
                    RadioButtonKFS.Checked = True
                Else
                    RadioButtonKFS.Checked = False
                End If
                If obj.DO_KFS_FLAG = "0" Then
                    RadioButtonNoKFS.Checked = True
                Else
                    RadioButtonNoKFS.Checked = False
                End If

                ' ค่า null ใน database จะมีค่าใน class เท่ากับ ค่าว่าง
                ' กำหนดให้มีค่า เท่ากับ  คำว่า null เพื่อให้ตรงกับค่าใน dropdown
                'If obj.SUB_COMMITTEE_1 = "" Then
                '    obj.SUB_COMMITTEE_1 = "null"
                'End If
                'If obj.SUB_COMMITTEE_2 = "" Then
                '    obj.SUB_COMMITTEE_2 = "null"
                'End If
                'If obj.SUB_COMMITTEE_3 = "" Then
                '    obj.SUB_COMMITTEE_3 = "null"
                'End If



                DDLSubcommittee1.SelectedIndex = 0
                For i As Integer = 0 To DDLSubcommittee1.Items.Count - 1
                    If DDLSubcommittee1.Items(i).Value.ToString = obj.SUB_COMMITTEE_1.ToString Then
                        DDLSubcommittee1.SelectedIndex = i
                        Exit For
                    End If
                Next


                DDLSubcommittee2.SelectedIndex = 0
                For i As Integer = 0 To DDLSubcommittee2.Items.Count - 1
                    If DDLSubcommittee2.Items(i).Value.ToString = obj.SUB_COMMITTEE_2.ToString Then
                        DDLSubcommittee2.SelectedIndex = i
                        Exit For
                    End If
                Next


                DDLSubcommittee3.SelectedIndex = 0
                For i As Integer = 0 To DDLSubcommittee3.Items.Count - 1
                    If DDLSubcommittee3.Items(i).Value.ToString = obj.SUB_COMMITTEE_3.ToString Then
                        DDLSubcommittee3.SelectedIndex = i
                        Exit For
                    End If
                Next



                DDLoutofscope.SelectedIndex = 0

                For i As Integer = 0 To DDLoutofscope.Items.Count - 1
                    '  MsgBox(DDLoutofscope.Items(i).Value)
                    If obj.OUT_OF_SCOPE_ID <> Nothing Then
                        If DDLoutofscope.Items(i).Value.ToString = obj.OUT_OF_SCOPE_ID.ToString Then
                            DDLoutofscope.SelectedIndex = i
                            Exit For
                        End If
                    End If

                Next
                If obj.GROUP_EXPOSURE = -1 Then
                    tbGroupExposure.Text = ""
                Else
                    'MsgBox(obj.GROUP_EXPOSURE)
                    tbGroupExposure.Text = Format(obj.GROUP_EXPOSURE, "##,###.000")
                End If

                If obj.REVIEW_DATE = Nothing Then
                    ReveiwDateTextBox.Text = ""
                Else
                    ReveiwDateTextBox.Text = obj.REVIEW_DATE
                End If

                If obj.EMP_CONTROL = Nothing Then
                    TextBoxCMControl.Text = ""
                    LabelCMControlDetail.Text = ""
                Else
                    TextBoxCMControl.Text = obj.EMP_CONTROL
                    searchCM()
                End If

                ' Remark เมื่อวันที่ 12/02/2010  ไม่ต้องเช็คค่า confirm เนื่องจากสามารถเก็บค่า null ใน credit account 

                'If obj.CONFIRMVALUE_FLAG = "1" Then
                '    CheckConfirmApproveValue.Checked = True
                '    PanelConfirmApproveValue.Visible = True
                'ElseIf obj.CONFIRMVALUE_FLAG = "0" Then
                '    CheckConfirmApproveValue.Checked = False
                '    PanelConfirmApproveValue.Visible = True
                'Else
                '    CheckConfirmApproveValue.Checked = False
                '    PanelConfirmApproveValue.Visible = False
                'End If


                CheckChangePanelBoard()
                tbcm_remark.Text = obj.CMRemark




                Dim ds1 As DataSet = Session("ds1")
                ds1.Tables.Remove("acc")  '  ลบของเดิมออก จาก sub create เริ่มต้น
                ds1.Tables.Remove("process")
                ds1.Tables.Remove("customer")

                ' MsgBox(ds1.Tables("acc").Rows.Count)

                Dim conn As New SqlConnection
                conn = ConnectionUtil.getSqlConnectionFromWebConfig
                Dim sql As String = "select  *  from  v_annals_account "
                sql += " where  id='" & tbID.Text & "' order by iden asc "
                Dim da1 As SqlDataAdapter = New SqlDataAdapter(sql, conn)
                da1.Fill(ds1, "acc")

                If IsNothing(ds1.Tables("acc")) = False And ds1.Tables("acc").Rows.Count > 0 Then
                    'SearchCif(ds1.Tables("acc").Rows(0).Item("cif"), "add")
                End If
                'MsgBox(ds1.Tables("acc").Rows.Count)

                Dim sql2 As String = "select  *  from v_annals_process"
                sql2 += " where id='" & tbID.Text & "' order by process_date"
                Dim da2 As SqlDataAdapter = New SqlDataAdapter(sql2, conn)
                da2.Fill(ds1, "process")

                Dim sql3 As String = "select  *  from v_annals_cus_ca"
                sql3 += " where id='" & tbID.Text & "' order by cif"
                Dim da3 As SqlDataAdapter = New SqlDataAdapter(sql3, conn)
                da3.Fill(ds1, "customer")

                conn.Close()
                conn = Nothing

                Session("ds1") = ds1
                bindGridDetail(-1, "acc")
                bindGridProcessDetail(-1, "process")
                bindgridCustomer(-1, "customer")
                BindListCA()
                PreUpdate()


            End If



            '======= สิ้นสุดค้นหา




        End If
    End Sub
    Protected Sub SearchCif(ByVal cif As String, ByVal mode As String)
        ' เอา remark ที้ง sub ออก1 ครั้ง

        Dim ddlGridCif As DropDownList = GridAnnalsCreditAccount.Rows(GridAnnalsCreditAccount.SelectedIndex).FindControl("ddlGridCif")

        Dim TBCifName As TextBox = GridAnnalsCreditAccount.Rows(GridAnnalsCreditAccount.SelectedIndex).FindControl("TBCifName")
        Dim tbRM_ID As TextBox = GridAnnalsCreditAccount.Rows(GridAnnalsCreditAccount.SelectedIndex).FindControl("tbRM_ID")
        Dim lblRmName As Label = GridAnnalsCreditAccount.Rows(GridAnnalsCreditAccount.SelectedIndex).FindControl("lblRmName")
        Dim tbFlag As TextBox = GridAnnalsCreditAccount.Rows(GridAnnalsCreditAccount.SelectedIndex).FindControl("tbFlag")
        Dim tbDep_ID As TextBox = GridAnnalsCreditAccount.Rows(GridAnnalsCreditAccount.SelectedIndex).FindControl("tbDep_ID")
        Dim lblDepName As Label = GridAnnalsCreditAccount.Rows(GridAnnalsCreditAccount.SelectedIndex).FindControl("lblDepName")
        Dim spanCIFWatchListByCIF As Label = GridAnnalsCreditAccount.Rows(GridAnnalsCreditAccount.SelectedIndex).FindControl("spanCIFWatchListByCIFFORM")

        If cif = "" Or IsNumeric(cif) = False Then
            'alert("Please insert cif.")
            TBCifName.Text = "ไม่พบข้อมูล กรุณาระบุ CIF ใน C/A"
            tbRM_ID.Text = ""
            lblRmName.Text = ""
            tbDep_ID.Text = ""
            lblDepName.Text = ""
            tbFlag.Text = ""
            Exit Sub
        End If



        'add by big
        'เคลียร์ค่า label ก่อน search

        'เพิ่ม service การเช็ค load review watch list
        Dim service As New webservice.wcf.service.CAWCFService()

        If Boolean.Parse(service.IsCIFInWatchListByCIF(cif).detail) Then
            spanCIFWatchListByCIF.Text = "CIF:" + cif + " ต้อง Approve โดย CRO."
            spanCIFWatchListByCIF.BackColor = Drawing.Color.Red
            spanCIFWatchListByCIF.ForeColor = Drawing.Color.White
            spanCIFWatchListByCIF.Font.Bold = True
        Else
            spanCIFWatchListByCIF.Text = String.Empty
        End If


        ' หาชื่อ cif จาก customer 

        Dim dalCus As New CustomerInfoDAL
        Dim objCus As New CustomerInfo
        objCus.CIF = cif
        objCus = dalCus.getCustomerInfoByCIF(objCus)
        If objCus.Cifname = String.Empty Then
            TBCifName.Text = objCus.Cifname
            Exit Sub
        Else
            TBCifName.Text = objCus.Cifname
            ' เพิ่มวันที่ 9 เมษายน 2553  กำหนดให้ ชื่อ cif สามารถลิ้งไปหน้า  ภาระหนี้ได้
            'TBCifName.Attributes.Add("onclick", "../report/ReportEdwRiskMaxAgingDaily.aspx?cif=" & cif)
            Dim Sedw As String = Nothing
            Sedw += "window.open('../report/ReportEdwRiskMaxAgingDaily.aspx?cif=" & cif
            TBCifName.Attributes.Add("onclick", Sedw & "','pop', 'width=900, height=300,scrollbars=yes');")
            TBCifName.Attributes.Add("title", TBCifName.Text)
            TBCifName.BorderWidth = 0
            tbRM_ID.Text = objCus.OFFICR_ID

            If tbRM_ID.Text <> String.Empty Then
                Dim dalEmp As New TbEmployeeDAL
                Dim objEmp As New TbEmployee
                objEmp.EMP_ID = tbRM_ID.Text
                objEmp = dalEmp.getTbEmployeeByEMP_ID(objEmp)

                If Not objEmp Is Nothing Then
                    lblRmName.Text = objEmp.EMPNAME + " " + objEmp.EMPSURNAME
                End If
            End If


            tbFlag.Text = objCus.DEPTFLAG
            tbDep_ID.Text = objCus.DEPTTRAN
            lblDepName.Text = objCus.DepartName
        End If

        'Dim dal1 As New CustomerDAL
        'Dim obj1 As New Customer
        'obj1.CIF = cif
        'obj1 = dal1.getCustomerByCIF(obj1)
        'If obj1.CUS_FIRST = "" Then
        '    TBCifName.Text = " ไม่พบข้อมูล CIF:" & cif
        '    Exit Sub
        'Else
        '    TBCifName.Text = obj1.CUS_TITLE & " " & obj1.CUS_FIRST & " " & obj1.CUS_LAST
        '    ' เพิ่มวันที่ 9 เมษายน 2553  กำหนดให้ ชื่อ cif สามารถลิ้งไปหน้า  ภาระหนี้ได้
        '    'TBCifName.Attributes.Add("onclick", "../report/ReportEdwRiskMaxAgingDaily.aspx?cif=" & cif)
        '    Dim Sedw As String = Nothing
        '    Sedw += "window.open('../report/ReportEdwRiskMaxAgingDaily.aspx?cif=" & cif
        '    TBCifName.Attributes.Add("onclick", Sedw & "','pop', 'width=900, height=300,scrollbars=yes');")
        '    TBCifName.Attributes.Add("title", TBCifName.Text)
        '    TBCifName.BorderWidth = 0

        'End If


        'Dim dal As New DetailDAL
        'Dim obj As New Detail
        'obj.Cif = cif
        'obj = dal.getDetailByCif(obj)
        'If IsNothing(obj) Then
        '    'alert(" Don 't have customer data.")
        '    TBCifName.Text = "ไม่พบข้อมูล CIF:" & cif
        '    Exit Sub
        'End If
        ''TBCifName.Text = obj.Name
        ''TBCif.Text = cif
        'tbRM_ID.Text = obj.OFFICR_ID
        'lblRmName.Text = obj.Office
        'tbFlag.Text = obj.CUS_DEPT_FLAG
        'tbDep_ID.Text = obj.CUS_DEPT_TRAN
        'lblDepName.Text = obj.Dep

        'If obj.Branch <> "0" Or obj.Branch.ToString <> "" Then
        '    tbBranch_ID.Text = obj.Branch
        '    lblBranchName.Text = obj.Branch_T
        '    tbRegion_ID.Text = obj.Id_Region
        '    lblRegName.Text = obj.Region_Name
        'End If

        If mode = "add" Then  ' ถ้า serch จากที่ add ให้ออกได้เลย
            Exit Sub
        End If
        bindDropDownAccount(cif)
        'FindRMbyCif(CInt(TBCif.Text))

    End Sub

    Protected Sub SearchBranchBtn_Click(ByVal sender As Object, ByVal e As System.Web.UI.ImageClickEventArgs) Handles SearchBranchBtn.Click
        searchBranch()
    End Sub
    Protected Sub searchBranch()
        If tbBranch_ID.Text = "" Then Exit Sub
        If IsNumeric(tbBranch_ID.Text) = False Then Exit Sub
        Dim obj As New Branch_Region
        Dim dal As New Branch_RegionDAL
        obj.Id_Branch = tbBranch_ID.Text
        obj = dal.getBranch_RegionById_Branch(obj)

        lblBranchName.Text = obj.Branch_T
        tbRegion_ID.Text = obj.Id_Region
        lblRegName.Text = obj.Region_Name

    End Sub
    Protected Sub searchCM()
        If TextBoxCMControl.Text = "" Then
            LabelCMControlDetail.Text = ""
            Exit Sub
        End If

        If IsNumeric(TextBoxCMControl.Text) = False Then
            TextBoxCMControl.Text = ""
            LabelCMControlDetail.Text = ""
            Exit Sub
        End If

        Dim obj As New TbEmployee
        Dim dal As New TbEmployeeDAL

        obj = dal.getTbEmployeeByEMP_ID(TextBoxCMControl.Text)

        If Not obj Is Nothing Then
            If obj.EMPNAME <> "" Then
                LabelCMControlDetail.Text = obj.EMPNAME & " " & obj.EMPSURNAME
            End If
        Else
            LabelCMControlDetail.Text = "ไม่พบข้อมูล CM"
        End If

    End Sub

#End Region

#Region "Grid Customer"

    Protected Sub BtnAddCustomerDetail_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles BtnAddCustomerDetail.Click
        PreAddCustomerDetail()
    End Sub
    Sub PreAddCustomerDetail()
        Session("eventcustomer") = "addCustomer"
        bindgridCustomer(0, "addCtable")
    End Sub
    Protected Sub GridCustomer_PageIndexChanging(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewPageEventArgs) Handles GridCustomer.PageIndexChanging
        Dim ds1 As DataSet = Session("ds1")
        GridCustomer.EditIndex = -1
        GridCustomer.PageIndex = e.NewPageIndex
        GridCustomer.DataSource = ds1.Tables("customer")
        GridCustomer.DataBind()
    End Sub
    Sub CancelEditCustomer()
        Dim ds1 As DataSet = Session("ds1")
        GridCustomer.EditIndex = -1
        GridCustomer.DataSource = ds1.Tables("customer")
        GridCustomer.DataBind()
    End Sub
    Protected Sub GridCustomer_RowCancelingEdit(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewCancelEditEventArgs) Handles GridCustomer.RowCancelingEdit
        CancelEditCustomer()
    End Sub
    Protected Sub GridCustomer_RowDataBound(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewRowEventArgs) Handles GridCustomer.RowDataBound
        If e.Row.RowType = DataControlRowType.DataRow Then
            e.Row.Attributes.Add("OnMouseOver", "this.style.backgroundColor = 'lightblue';")
            If e.Row.RowState = DataControlRowState.Alternate Then
                Dim alColor As String = System.Drawing.ColorTranslator.ToHtml(GridCustomer.AlternatingRowStyle.BackColor)
                e.Row.Attributes.Add("OnMouseOut", "this.style.backgroundColor ='" & alColor & "'")
            Else
                Dim bkColor As String = System.Drawing.ColorTranslator.ToHtml(GridCustomer.RowStyle.BackColor)
                e.Row.Attributes.Add("OnMouseOut", "this.style.backgroundColor ='" & bkColor & "'")
            End If
        End If
    End Sub
    Protected Sub GridCustomer_RowDeleting(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewDeleteEventArgs) Handles GridCustomer.RowDeleting
        Dim ds1 As DataSet = Session("ds1")
        Dim Nrow = GridCustomer.PageIndex * GridCustomer.PageSize ' หา reccord ปัจจุบันของ grid
        For i As Integer = Nrow + 0 To ds1.Tables("customer").Rows.Count - 1
            If i = Nrow + e.RowIndex Then
                ds1.Tables("customer").Rows(i).Delete()
            End If
        Next
        ds1.AcceptChanges()
        GridCustomer.EditIndex = -1
        GridCustomer.DataSource = ds1.Tables("customer")
        GridCustomer.DataBind()
    End Sub
    Protected Sub GridCustomer_RowEditing(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewEditEventArgs) Handles GridCustomer.RowEditing
        Session("eventcustomer") = "editCustomer"
        bindgridCustomer(e.NewEditIndex, "customer")
    End Sub
    Protected Sub GridCustomer_RowUpdating(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewUpdateEventArgs) Handles GridCustomer.RowUpdating

        Dim ds1 As DataSet = Session("ds1")
        Dim EditRow = GridCustomer.SelectedIndex

        Dim tbCIFSearch As TextBox = GridCustomer.Rows(EditRow).FindControl("tbCIFSearch")
        Dim lblGridCifCustomer As Label = GridCustomer.Rows(EditRow).FindControl("lblGridCifCustomer")
        Dim tbBusinessTypeID As TextBox = GridCustomer.Rows(EditRow).FindControl("tbBusinessTypeID")
        Dim LabelBusinessTypeDetail As TextBox = GridCustomer.Rows(EditRow).FindControl("LabelBusinessTypeDetail")

        If lblGridCifCustomer.Text = "" Then
            lblGridCifCustomer.Text = "กรุณาค้นหา CIF รายนี้ก่อน"
            lblGridCifCustomer.ForeColor = Drawing.Color.Red
            Exit Sub
        End If
        If tbCIFSearch.Text = String.Empty Then
            tbCIFSearch.BackColor = Drawing.Color.Red
            Exit Sub
        End If
        ' check  duplicate customer  , do only adding data.

        'If tbBusinessTypeID.Text = "" Then
        '    tbBusinessTypeID.BackColor = Drawing.Color.Red
        '    Exit Sub
        'End If

        Dim strErr As Boolean
        If Not ds1.Tables("customer") Is Nothing Then
            For i As Integer = 0 To ds1.Tables("customer").Rows.Count - 1
                If tbCIFSearch.Text = ds1.Tables("customer").Rows(i).Item("CIF") Then
                    If Session("eventcustomer") = "addCustomer" Then
                        strErr = True
                    End If
                    If Session("eventcustomer") = "editCustomer" Then
                        If EditRow <> i Then   '  IF  CIF  same  as  other rows   set  cif   error.
                            strErr = True
                        End If
                    End If

                End If
            Next

            '  If  have  error
            If strErr = True Then
                tbCIFSearch.BackColor = Drawing.Color.Red
                lblGridCifCustomer.Text = "มีข้อมูล CIF รายนี้แล้ว"
                lblGridCifCustomer.ForeColor = Drawing.Color.Red
                Exit Sub
            Else
                tbCIFSearch.BackColor = Drawing.Color.White
                lblGridCifCustomer.ForeColor = Drawing.Color.Black
            End If
        End If


        'Dim ddlRatingType As DropDownList = GridCustomer.Rows(EditRow).FindControl("ddlRatingType")
        'Dim ddlRating As DropDownList = GridCustomer.Rows(EditRow).FindControl("ddlRating")
        'Dim tbRatingDate As TextBox = GridCustomer.Rows(EditRow).FindControl("tbRatingDate")
        'Dim Svalue = ddlRating.Items(ddlRating.SelectedIndex).Value.ToString
        ''  lblMsgErrCustomerGrid.Text = Svalue

        'If Svalue <> "1" And Svalue <> "24" And Svalue <> "25" Then
        '    If tbRatingDate.Text = "" Then
        '        tbRatingDate.BackColor = Drawing.Color.Red
        '        Exit Sub
        '    End If
        'End If
        'If tbRatingDate.Text <> "" Then
        '    If Svalue = "1" Or Svalue = "24" Or Svalue = "25" Then
        '        ddlRating.BackColor = Drawing.Color.Red
        '        Exit Sub
        '    End If
        'End If
        'If Svalue = "1" Or Svalue = "24" Or Svalue = "25" Then
        '    tbRatingDate.Text = ""
        'End If

        Dim Nrow = GridCustomer.PageIndex * GridCustomer.PageSize ' หา reccord ปัจจุบันของ grid

        Dim dtable As DataTable
        Dim row As DataRow
        dtable = ds1.Tables("customer")

        If Session("eventcustomer") = "addCustomer" Then
            row = dtable.NewRow()
        Else
            row = dtable.Rows(e.RowIndex + Nrow)
        End If


        'Dim rating_key As Integer
        'Dim rating_desc As String
        'If ddlRating.SelectedValue = "" Then
        '    rating_key = 1
        '    rating_desc = "...ยังไม่ระบุ..."
        'Else
        '    rating_key = ddlRating.Items(ddlRating.SelectedIndex).Value
        '    rating_desc = ddlRating.Items(ddlRating.SelectedIndex).Text
        'End If


        row("CIF") = tbCIFSearch.Text
        row("CIFNAME") = lblGridCifCustomer.Text
        row("RATING_KEY") = System.DBNull.Value
        row("RATING_DESC") = System.DBNull.Value
        row("RATING_DATE") = System.DBNull.Value
        row("BUSS_TYPE_ID") = tbBusinessTypeID.Text
        row("BUSS_TYPE_DETAIL") = LabelBusinessTypeDetail.Text

        If Session("eventcustomer") = "addCustomer" Then
            dtable.Rows.Add(row)
        End If
        dtable.AcceptChanges()
        Session("event") = "updatecustomer"
        bindgridCustomer(-1, "customer")
        'If Err.Description <> "" Then
        '    createAlert(Err.Description)
        '    Err.Clear()
        'End If

    End Sub
    Sub bindgridCustomer(ByVal EditRow As Integer, ByVal EditTable As String)

        Dim UserID As String = Nothing

        Dim ds1 As DataSet = Session("ds1")
        GridCustomer.EditIndex = EditRow
        GridCustomer.DataSource = ds1.Tables(EditTable)
        GridCustomer.DataBind()

        If GridCustomer.Rows.Count < 1 Or EditRow < 0 Then Exit Sub
        GridCustomer.SelectedIndex = EditRow


        ResetGridTDCustomer()

        ' find control in grid 

        ' Dim ddlRatingType As DropDownList = GridCustomer.Rows(EditRow).FindControl("ddlRatingType")
        'Dim ddlRating As DropDownList = GridCustomer.Rows(GridCustomer.SelectedIndex).FindControl("ddlRating")
        Dim tbCIFSearch As TextBox = GridCustomer.Rows(EditRow).FindControl("tbCIFSearch")
        Dim lblGridCifCustomer As Label = GridCustomer.Rows(EditRow).FindControl("lblGridCifCustomer")
        ' Dim tbRatingDate As TextBox = GridCustomer.Rows(EditRow).FindControl("tbRatingDate")
        Dim BtnAddCusTemp As Image = GridCustomer.Rows(EditRow).FindControl("BtnAddCusTemp")
        Dim btnPopUpBusinessType As Image = GridCustomer.Rows(EditRow).FindControl("btnPopUpBusinessType")
        Dim tbBusinessTypeID As TextBox = GridCustomer.Rows(EditRow).FindControl("tbBusinessTypeID")
        Dim LabelBusinessTypeDetail As TextBox = GridCustomer.Rows(EditRow).FindControl("LabelBusinessTypeDetail")


        ' tbRatingDate.Attributes.Add("onkeypress", "this.blur();")


        Dim Scust As String = Nothing
        Scust += "window.open('InsertTempCustomer.aspx"
        BtnAddCusTemp.Attributes.Add("onclick", Scust & "','pop', 'width=500, height=300');")
        BtnAddCusTemp.Style("cursor") = "pointer"   ' auto,crosshair ,default,pointer,help,move,Text,wait, e(-resize, w - resize, n - resize, s - resize, ne - resize, nw - resize, se - resize, sw - resize)

        Dim Buss As String = Nothing
        Buss += "window.open('../customer/BusinessType.aspx?returnIdTarget=" & tbBusinessTypeID.ClientID & "&returnDetailTarget=" & LabelBusinessTypeDetail.ClientID
        btnPopUpBusinessType.Attributes.Add("onclick", Buss & "','pop', 'width=900, height=400');")
        btnPopUpBusinessType.Style("cursor") = "pointer"   ' auto,crosshair ,default,pointer,help,move,Text,wait, e(-resize, w - resize, n - resize, s - resize, ne - resize, nw - resize, se - resize, sw - resize)
        tbBusinessTypeID.Attributes.Add("onclick", Buss & "','pop', 'width=900, height=400');")

        ' create  connection 

        Dim conn = ConnectionUtil.getSqlConnectionFromWebConfig()
        Dim sqlCmd As New SqlCommand
        sqlCmd.Connection = conn
        sqlCmd.CommandType = CommandType.Text


        'sqlCmd.CommandText = "SELECT  *  FROM  CUSTOMER_SME_RATING_TYPE ORDER BY  PRIORITY ASC"
        'Dim readerRatingType As SqlDataReader = sqlCmd.ExecuteReader()
        'While readerRatingType.Read()
        '    Dim listItem As New ListItem
        '    listItem.Value = readerRatingType("RATING_TYPE_KEY")
        '    listItem.Text = CStr(readerRatingType("RATING_TYPE_DESC"))
        '    ddlRatingType.Items.Add(listItem)
        'End While
        'readerRatingType.Close()


        ' Set  data in dataset  to  control in grid customer

        Dim Nrow = GridCustomer.PageIndex * GridCustomer.PageSize ' หา reccord ปัจจุบันของ grid

        With ds1.Tables(EditTable).Rows(EditRow + Nrow)

            tbCIFSearch.Text = .Item("CIF")
            If IsDBNull(.Item("CIFNAME")) = False Then
                lblGridCifCustomer.Text = .Item("CIFNAME")
            End If
            ''  if  have rating key  bind dropdown with  rating
            'If Not IsDBNull(.Item("RATING_KEY")) Then
            '    If .Item("RATING_KEY") <> 1.0 Or .Item("RATING_KEY") <> 24.0 Or .Item("RATING_KEY") <> 25.0 Then
            '        sqlCmd.CommandText = "SELECT  *  FROM  CUSTOMER_SME_RATING  ORDER BY  PRIORITY ASC"
            '        'sqlCmd.CommandText = "SELECT  *  FROM  CUSTOMER_SME_RATING  WHERE  RATING_TYPE_KEY= " & RATING_TYPE_KEY & " ORDER BY  PRIORITY ASC"
            '        Dim readerRating As SqlDataReader = sqlCmd.ExecuteReader()
            '        While readerRating.Read()
            '            Dim listItem As New ListItem
            '            listItem.Value = readerRating("RATING_KEY")
            '            listItem.Text = CStr(readerRating("RATING_DESC"))
            '            ddlRating.Items.Add(listItem)
            '        End While
            '        readerRating.Close()
            '    End If
            'End If

            'ddlRating.Enabled = False
            'For i As Integer = 0 To ddlRating.Items.Count - 1
            '    If ddlRating.Items(i).Value = .Item("RATING_KEY") Then
            '        ddlRating.SelectedIndex = i
            '        Exit For
            '    End If
            'Next

            'For i As Integer = 0 To ddlRatingType.Items.Count - 1
            '    If ddlRatingType.Items(i).Value = .Item("RATING_TYPE_KEY") Then
            '        ddlRatingType.SelectedIndex = i
            '        Exit For
            '    End If
            'Next
            'If .Item("RATING_DATE").ToString <> "" Then
            '    tbRatingDate.Text = Convert.ToDateTime(.Item("RATING_DATE")).ToString("d")
            'End If
            If .Item("BUSS_TYPE_ID").ToString <> "" Then
                tbBusinessTypeID.Text = .Item("BUSS_TYPE_ID").ToString
            End If
            If .Item("BUSS_TYPE_DETAIL").ToString <> "" Then
                LabelBusinessTypeDetail.Text = .Item("BUSS_TYPE_DETAIL").ToString
            End If


        End With

        conn.Close()

    End Sub
    Sub SearchRating()
        ResetGridTDCustomer()
        Dim ddlRatingType As DropDownList = GridCustomer.Rows(GridCustomer.SelectedIndex).FindControl("ddlRatingType")
        Dim RATING_TYPE_KEY As Integer = ddlRatingType.SelectedValue

        Dim conn = ConnectionUtil.getSqlConnectionFromWebConfig()
        Dim sqlCmd As New SqlCommand
        sqlCmd.Connection = conn
        sqlCmd.CommandType = CommandType.Text

        sqlCmd.CommandText = "SELECT  *  FROM  CUSTOMER_SME_RATING  WHERE  RATING_TYPE_KEY= " & RATING_TYPE_KEY & " ORDER BY  PRIORITY ASC"
        Dim readerRating As SqlDataReader = sqlCmd.ExecuteReader()

        Dim ddlRating As DropDownList = GridCustomer.Rows(GridCustomer.SelectedIndex).FindControl("ddlRating")
        ddlRating.Enabled = True
        ddlRating.Items.Clear()
        While readerRating.Read()
            Dim listItem As New ListItem
            listItem.Value = readerRating("RATING_KEY")
            listItem.Text = CStr(readerRating("RATING_DESC"))
            ddlRating.Items.Add(listItem)
        End While
        readerRating.Close()
        conn.Close()

    End Sub
    Protected Sub SearchCifCA()
        ResetGridTDCustomer()
        Dim tbCIFSearch As TextBox = GridCustomer.Rows(GridCustomer.SelectedIndex).FindControl("tbCIFSearch")
        Dim lblGridCifCustomer As Label = GridCustomer.Rows(GridCustomer.SelectedIndex).FindControl("lblGridCifCustomer")
        Dim tbBusinessTypeID As TextBox = GridCustomer.Rows(GridCustomer.SelectedIndex).FindControl("tbBusinessTypeID")
        Dim LabelBusinessTypeDetail As TextBox = GridCustomer.Rows(GridCustomer.SelectedIndex).FindControl("LabelBusinessTypeDetail")


        If tbCIFSearch.Text = "" Then
            lblGridCifCustomer.Text = "กรุณาระบุ CIF"
            lblGridCifCustomer.ForeColor = Drawing.Color.Red
            Exit Sub
        Else
            If IsNumeric(tbCIFSearch.Text) = False Then
                lblGridCifCustomer.Text = "กรุณาระบุ CIF ด้วยตัวเลข"
                lblGridCifCustomer.ForeColor = Drawing.Color.Red
                Exit Sub
            Else
                lblGridCifCustomer.ForeColor = Drawing.Color.Black
            End If

        End If

        Dim CIF As String = tbCIFSearch.Text
        Dim dalCus As New CustomerInfoDAL
        Dim objCus As New CustomerInfo
        objCus.CIF = CIF
        objCus = dalCus.getCustomerInfoByCIF(objCus)

        If objCus.Cifname = String.Empty Then
            lblGridCifCustomer.Text = ""
            Exit Sub
        Else

            lblGridCifCustomer.Text = objCus.Cifname
            lblGridCifCustomer.ForeColor = Drawing.Color.Black
            tbCIFSearch.Enabled = False
            tbCIFSearch.BackColor = Drawing.Color.White

            Dim dalCusSme As New CustomerSme00AllStatusDAL
            Dim objCusSme As New CustomerSme00AllStatus
            objCusSme = dalCusSme.getCustomerSme00AllStatusByCIF(CInt(CIF))
            tbBusinessTypeID.Text = objCusSme.BUSI_RISK1_ID
            LabelBusinessTypeDetail.Text = objCusSme.BUSI_RISK1_DETAIL

        End If




    End Sub
    Sub ResetRatingDate()
        ResetGridTDCustomer()
        Dim tbRatingDate As TextBox = GridCustomer.Rows(GridCustomer.SelectedIndex).FindControl("tbRatingDate")
        tbRatingDate.Text = ""
    End Sub
    Sub ResetBuss()
        ResetGridTDCustomer()
        Dim tbBusinessTypeID As TextBox = GridCustomer.Rows(GridCustomer.SelectedIndex).FindControl("tbBusinessTypeID")
        Dim LabelBusinessTypeDetail As TextBox = GridCustomer.Rows(GridCustomer.SelectedIndex).FindControl("LabelBusinessTypeDetail")
        tbBusinessTypeID.Text = ""
        LabelBusinessTypeDetail.Text = ""

    End Sub
    Sub ResetGridTDCustomer()

        GridCustomer.Rows(GridCustomer.SelectedIndex).Cells(0).ColumnSpan = 4
        GridCustomer.Rows(GridCustomer.SelectedIndex).Cells(0).BackColor = Drawing.Color.Snow
        ' ลบ td ที่เกินมาเนื่องจากใช้ update panel  แล้ว ทำให้ตารางมีการสร้าง td เกินมา
        For i = 0 To 2
            GridCustomer.Rows(GridCustomer.SelectedIndex).Cells.Remove(GridCustomer.Rows(GridCustomer.SelectedIndex).Cells(1))
        Next i
    End Sub

#End Region

#Region "Grid Process"

    Protected Sub BtnAddProcessDetail_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles BtnAddProcessDetail.Click
        PreAddProcessDetail()
    End Sub
    Protected Sub PreAddProcessDetail()
        Session("eventprocess") = "addProcess"
        bindGridProcessDetail(0, "addPtable")
    End Sub
    Protected Sub GridProcess_PageIndexChanging(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewPageEventArgs) Handles GridProcess.PageIndexChanging
        Dim ds1 As DataSet = Session("ds1")
        GridProcess.EditIndex = -1
        GridProcess.PageIndex = e.NewPageIndex
        GridProcess.DataSource = ds1.Tables("process")
        GridProcess.DataBind()
    End Sub
    Protected Sub GridProcess_RowCancelingEdit(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewCancelEditEventArgs) Handles GridProcess.RowCancelingEdit
        CancelEditProcess()
    End Sub
    Protected Sub CancelEditProcess()
        Dim ds1 As DataSet = Session("ds1")
        GridProcess.EditIndex = -1
        GridProcess.DataSource = ds1.Tables("process")
        GridProcess.DataBind()
    End Sub
    Protected Sub GridProcess_RowDataBound(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewRowEventArgs) Handles GridProcess.RowDataBound
        Dim UserID As String = Nothing
        If User.Identity.Name = "" Then ' ถ้า  session user.identity ไม่มีให้ เอาค่าจาก lbl แทน
            UserID = lblUserID.Text
        Else
            UserID = User.Identity.Name
        End If
        Dim BtnEdit As Image = e.Row.FindControl("BtnEdit")

        If IsNothing(BtnEdit) = False Then
            Dim ds1 As DataSet = Session("ds1")
            If IsDBNull(ds1.Tables("process").Rows(e.Row.RowIndex).Item("User_id")) = False Then
                If ds1.Tables("process").Rows(e.Row.RowIndex).Item("User_id") = UserID Then
                    BtnEdit.Visible = True
                Else
                    BtnEdit.Visible = False
                End If
            End If

            'check ว่ามี role admin หรือไม่
            'add by big, 3 jun 2008
            If HttpCookieUtil.hasRolesId(Context.Request.Cookies(FormsAuthentication.FormsCookieName), RoleIdConst.R_ADMIN) Then
                BtnEdit.Visible = True
            End If
        End If
        If e.Row.RowType = DataControlRowType.DataRow Then
            e.Row.Attributes.Add("OnMouseOver", "this.style.backgroundColor = 'lightblue';")
            If e.Row.RowState = DataControlRowState.Alternate Then
                Dim alColor As String = System.Drawing.ColorTranslator.ToHtml(GridProcess.AlternatingRowStyle.BackColor)
                e.Row.Attributes.Add("OnMouseOut", "this.style.backgroundColor ='" & alColor & "'")
            Else
                Dim bkColor As String = System.Drawing.ColorTranslator.ToHtml(GridProcess.RowStyle.BackColor)
                e.Row.Attributes.Add("OnMouseOut", "this.style.backgroundColor ='" & bkColor & "'")
            End If
        End If

    End Sub
    Protected Sub GridProcess_RowDeleting(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewDeleteEventArgs) Handles GridProcess.RowDeleting
        Dim ds1 As DataSet = Session("ds1")
        Dim Nrow = GridProcess.PageIndex * GridProcess.PageSize ' หา reccord ปัจจุบันของ grid
        For i As Integer = Nrow + 0 To ds1.Tables("process").Rows.Count - 1
            If i = Nrow + e.RowIndex Then
                ds1.Tables("process").Rows(i).Delete()
            End If
        Next
        ds1.AcceptChanges()
        GridProcess.EditIndex = -1
        GridProcess.DataSource = ds1.Tables("process")
        GridProcess.DataBind()

    End Sub
    Protected Sub GridProcess_RowEditing(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewEditEventArgs) Handles GridProcess.RowEditing
        Session("eventprocess") = "editProcess"
        bindGridProcessDetail(e.NewEditIndex, "process")
    End Sub
    Protected Sub GridProcess_RowUpdating(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewUpdateEventArgs) Handles GridProcess.RowUpdating

        Dim ds1 As DataSet = Session("ds1")

        ' check error ก่อนการบันทึก 
        Dim tbEmp_id As TextBox = GridProcess.Rows(e.RowIndex).Cells(0).FindControl("tbEmp_id")
        Dim ddlEMP_ID As DropDownList = GridProcess.Rows(e.RowIndex).Cells(0).FindControl("ddlEMP_ID")

        If ddlEMP_ID.SelectedValue = "" Then
            Label8.Text = " Please insert  employee id. "
            Label8.ForeColor = Drawing.Color.Red
            Exit Sub
        Else
            Label8.ForeColor = Drawing.Color.Black
        End If
        Dim tbEmployee As TextBox = GridProcess.Rows(e.RowIndex).Cells(0).FindControl("tbEmployee")
        ' Dim ddlDayProcess_date As DropDownList = GridProcess.Rows(e.RowIndex).Cells(0).FindControl("ddlDayProcess_date")
        ' Dim ddlMonthProcess_date As DropDownList = GridProcess.Rows(e.RowIndex).Cells(0).FindControl("ddlMonthProcess_date")
        ' Dim ddlYearProcess_date As DropDownList = GridProcess.Rows(e.RowIndex).Cells(0).FindControl("ddlYearProcess_date")
        Dim ddlPROCESS_ID As DropDownList = GridProcess.Rows(e.RowIndex).Cells(0).FindControl("ddlPROCESS_ID")

        If Session("eventprocess") = "addProcess" Then ' ในกรณีที่เป็นการเพิ่ม process ต้องมีการเช็คต่อไปนี้


            If ddlPROCESS_ID.Items(ddlPROCESS_ID.SelectedIndex).Value.ToString.Substring(0, 1).ToLower = "c" And ddlSendToBoard.Items(ddlSendToBoard.SelectedIndex).Value.ToString = "1" Then

                ''Label8.ForeColor = Drawing.Color.Red
                ''Exit Sub
                'ddlSendToBoard.SelectedIndex = 1
                'PanelCMResutl.Visible = True
                'PanelBoarResutl.Visible = False

            ElseIf ddlPROCESS_ID.Items(ddlPROCESS_ID.SelectedIndex).Value = "B070" Then  ' ถ้าเลือก process รอพิจราณาเสนอบอร์ด ต้องมีการ check sendto board
                If ddlSendToBoard.Items(ddlSendToBoard.SelectedIndex).Value.ToString = "0" Then
                    Label8.Text = "กรุณาเลือก ประเภทอำนาจเสนออำนาจอนุมัติ  "
                    Label8.ForeColor = Drawing.Color.Red
                    Exit Sub
                End If
            ElseIf ddlPROCESS_ID.Items(ddlPROCESS_ID.SelectedIndex).Value = "A010" Then
                If CheckProcess("A010", 1) = True Then
                    Label8.Text = " ไม่สามารถเพิ่มได้ มีการรับเรื่องเข้าแล้ว "
                    Label8.ForeColor = Drawing.Color.Red
                    Exit Sub
                End If
            End If

        End If


        'Dim str As String
        'If DirectCast(Application.Item(ApplicationKeyConst.App_Culture), CultureInfo).Name.StartsWith("en") Then   ' ตรวจสอบ culture
        '    If IsDate(ddlMonthProcess_date.SelectedValue & "/" & ddlDayProcess_date.SelectedValue & "/" & ddlYearProcess_date.SelectedValue) = False Then
        '        str += "Please input Approve date with correct date. \n\n "
        '    End If
        'Else
        '    If IsDate(ddlDayProcess_date.SelectedValue & "/" & ddlMonthProcess_date.SelectedValue & "/" & CInt(ddlYearProcess_date.SelectedValue) + 543) = False Then
        '        str += "Please input Approve date with correct date. \n\n "
        '    End If
        'End If

        'If str <> "" Then
        '    str = " Can not input data. \n\n " & str
        '    alert(str)
        '    Exit Sub
        'End If

        Dim Nrow = GridProcess.PageIndex * GridProcess.PageSize ' หา reccord ปัจจุบันของ grid

        Dim dtable As DataTable
        Dim row As DataRow

        If Session("eventprocess") = "addProcess" Then

            dtable = ds1.Tables("process")
            row = dtable.NewRow()
            Dim cul As Calendar = DirectCast(Application.Item(ApplicationKeyConst.App_Culture), CultureInfo).Calendar
            row("Process_date") = New Date(cul.GetYear(Date.Now), Date.Now.Month, Date.Now.Day, Date.Now.Hour, Date.Now.Minute, Date.Now.Second, cul)
        Else
            dtable = ds1.Tables("process")
            row = dtable.Rows(e.RowIndex + Nrow)
        End If
        row("Emp_id") = ddlEMP_ID.Items(ddlEMP_ID.SelectedIndex).Value
        row("User_id") = User.Identity.Name
        row("Employee") = ddlEMP_ID.Items(ddlEMP_ID.SelectedIndex).Text
        'row("Process_date") = New Date(ddlYearProcess_date.SelectedValue, ddlMonthProcess_date.SelectedValue, ddlDayProcess_date.SelectedValue, 0, 0, 0)     ' วันที่ Process
        'row("Process_date") = Date.SpecifyKind(Date.Now, DateTimeKind.Local)
        row("Process_id") = ddlPROCESS_ID.Items(ddlPROCESS_ID.SelectedIndex).Value
        row("Process") = ddlPROCESS_ID.Items(ddlPROCESS_ID.SelectedIndex).Text
        Dim dallevel As New ControllingUsersinlevelDAL
        row("Level_ID") = getCategoryKey(ddlEMP_ID.SelectedValue, 14)

        If Session("eventprocess") = "addProcess" Then
            dtable.Rows.Add(row)
        End If
        dtable.AcceptChanges()

        Session("eventprocess") = "updateprocess"

        GridProcess.EditIndex = -1
        GridProcess.DataSource = ds1.Tables("process")
        GridProcess.DataBind()
        If tbID.Text <> String.Empty Then
            PanelCovenant.Visible = CheckProcess("D", -1, True)  ' กำหนดให้แสดงหรือไม่แสดง covenant
            If RadioCovenant.Checked Then
                lblAddCovenant.Visible = True
                ImgAddCovenant.Visible = True
            Else
                lblAddCovenant.Visible = False
                ImgAddCovenant.Visible = False
            End If

            If (CheckProcess("C", -1, True) = True Or CheckProcess("D", -1, True) = True Or CheckProcess("E", -1, True) = True) Or CheckProcess("B070", -1) = True Then

            Else   ' ถ้าเป็นการเพิ่ม
                'PanelCheckNcb.Visible = False
                If ds1.Tables("process").Rows.Count > 0 Then
                    BtnAddProcessDetail.Enabled = False
                    Label8.Text = " กรุณาบันทึกข้อมูล (Update all data) "
                    Label8.ForeColor = Drawing.Color.Red
                    Exit Sub
                Else
                    BtnAddProcessDetail.Enabled = True
                End If
            End If
            If (CheckProcess("C", -1, True) = True Or CheckProcess("D", -1, True) = True Or CheckProcess("E", -1, True) = True) Or CheckProcess("B070", -1) = True Then
                PanelFlood.Visible = True
                If RadioFloodBot.Checked Then
                    LabelAddFloodBOT.Visible = True
                    ImageAddFloodBOT.Visible = True
                Else
                    LabelAddFloodBOT.Visible = False
                    ImageAddFloodBOT.Visible = False
                End If
            Else
                PanelFlood.Visible = False
            End If

        End If
    End Sub
    Protected Sub bindGridProcessDetail(ByVal EditRow As Integer, ByVal EditTable As String)

        '  หน้านี้ใช้กรณี ที่ เป็นการ add และ edit  ในการ add จะดึง table 'addtable'  ถ้าเป็นแก้ไขดึง  'acc'
        'If tbID.Text <> "" Then
        '    PanelCovenant.Visible = CheckProcess("D", -1, True)  ' กำหนดให้แสดงหรือไม่แสดง panel covenant  / ถ้ามี process อนุมัติ ให้โชว
        '    If (CheckProcess("C", -1, True) = True Or CheckProcess("D", -1, True) = True Or CheckProcess("E", -1, True) = True) Or CheckProcess("B070", -1) = True Then
        '        'If CheckAccountCredit() = True Then   ' เช็คว่าเป็นเรื่องเกียวกับวงเงินให้ทำต่อ
        '        '    PanelCheckNcb.Visible = True
        '        'End If
        '    Else
        '        PanelCheckNcb.Visible = False
        '    End If

        'End If



        Dim UserID As String = Nothing

        Dim ds1 As DataSet = Session("ds1")
        GridProcess.EditIndex = EditRow
        GridProcess.DataSource = ds1.Tables(EditTable)
        GridProcess.DataBind()

        If GridProcess.Rows.Count < 1 Or EditRow < 0 Then Exit Sub
        ' ===============หา control
        Dim BtnSearchEmp As Image = GridProcess.Rows(EditRow).Cells(0).FindControl("BtnSearchEmp")
        Dim tbEmp_id As TextBox = GridProcess.Rows(EditRow).Cells(0).FindControl("tbEmp_id")
        Dim tbEmployee As TextBox = GridProcess.Rows(EditRow).Cells(0).FindControl("tbEmployee")
        'Dim ddlDayProcess_date As DropDownList = GridProcess.Rows(EditRow).Cells(0).FindControl("ddlDayProcess_date")
        'Dim ddlMonthProcess_date As DropDownList = GridProcess.Rows(EditRow).Cells(0).FindControl("ddlMonthProcess_date")
        'Dim ddlYearProcess_date As DropDownList = GridProcess.Rows(EditRow).Cells(0).FindControl("ddlYearProcess_date")
        Dim lbldate As Label = GridProcess.Rows(EditRow).Cells(0).FindControl("lbldate")
        Dim ddlPROCESS_ID As DropDownList = GridProcess.Rows(EditRow).Cells(0).FindControl("ddlPROCESS_ID")
        ddlPROCESS_ID.DataSource = Session("arrPROCESS_ID")
        ddlPROCESS_ID.DataValueField = "process_id"
        ddlPROCESS_ID.DataTextField = "process"
        ddlPROCESS_ID.DataBind()


        Dim ddlEmp_ID As DropDownList = GridProcess.Rows(EditRow).Cells(0).FindControl("ddlEmp_ID")
        ddlEmp_ID.DataSource = Session("sqlCM")
        ddlEmp_ID.DataValueField = "EMP_ID"
        ddlEmp_ID.DataTextField = "EMP_NAME"
        ddlEmp_ID.DataBind()
        Dim itemC As New ListItem
        itemC.Value = ""
        itemC.Text = "...โปรดเลือก..."
        ddlEmp_ID.Items.Insert(0, itemC)


        If EditTable = "addPtable" And ds1.Tables("process").Rows.Count = 0 Then
            ddlPROCESS_ID.SelectedIndex = 0
            ddlPROCESS_ID.Enabled = False
        ElseIf EditTable = "process" And EditRow = 0 Then
            ddlPROCESS_ID.SelectedIndex = 0
            ddlPROCESS_ID.Enabled = False
        End If


        'Dim s1 As String = String.Empty
        's1 += "window.open('../employee/SearchEmployee.aspx"
        's1 += "?tbEmp_id=" & tbEmp_id.ClientID
        's1 += "&tbEmployee=" & tbEmployee.ClientID
        's1 += "&showBoss=no"
        'BtnSearchEmp.Attributes.Add("onclick", s1 & "','pop', 'width=700, height=500');")
        'tbEmp_id.Attributes.Add("onfocus", "this.blur();")  ' set textbox to readonly       
        ''Response.Write("dataset " & EditRow + Nrow)

        '====== กำหนดค่าที่เลือกลงใน control และ dropdown  โดยดึงค่าจาก dataset แถวที่เลือก
        Dim Nrow = GridProcess.PageIndex * GridProcess.PageSize ' หา reccord ปัจจุบันของ grid

        With ds1.Tables(EditTable).Rows(EditRow + Nrow)

            'Response.Write("dataset " & EditRow + Nrow)
            ' tbEmp_id.Text = .Item("Emp_id")
            For i As Integer = 0 To ddlEmp_ID.Items.Count - 1
                If ddlEmp_ID.Items(i).Value = .Item("Emp_id") Then
                    ddlEmp_ID.SelectedIndex = i
                    Exit For
                End If
            Next

            '  tbEmployee.Text = .Item("Employee")

            ddlPROCESS_ID.SelectedIndex = 0
            For i As Integer = 0 To ddlPROCESS_ID.Items.Count - 1
                If ddlPROCESS_ID.Items(i).Value = .Item("PROCESS_ID") Then
                    ddlPROCESS_ID.SelectedIndex = i
                    Exit For
                End If
            Next
            lbldate.Text = .Item("PROCESS_DATE")
        End With



    End Sub

#End Region

#Region "Grid Credit Account "
    Protected Sub BtnAddDetail_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles BtnAddDetail.Click
        PreAddDetail()
    End Sub
    Protected Sub PreAddDetail()
        Dim ds1 As DataSet = Session("ds1")
        If ds1.Tables("customer").Rows.Count < 1 Then
            lblSubjectMsg.Text = " กรุณาเพิ่ม cif ใน C/A "
            Exit Sub
        Else
            lblSubjectMsg.Text = ""
        End If
        Session("event") = "add"
        If IsNothing(Session("ds1")) = True Then
            lblSubjectMsg.Text = "Can not update file. Please login again"
        End If
        bindGridDetail(0, "addtable")
        GridAnnalsCreditAccount.SelectedIndex = 0
    End Sub
    Protected Sub GridAnnalsCreditAccount_DataBound(ByVal sender As Object, ByVal e As System.EventArgs) Handles GridAnnalsCreditAccount.DataBound


        '  สร้าง SUB Total
        Dim oGridView As GridView = DirectCast(sender, GridView)

        If oGridView.Rows.Count < 1 Then  ' ถ้าไม่มีแถวข้อมูลไม่ต้องทำ
            Exit Sub
        End If
        Dim sumOldValue As Double = 0
        Dim sumValue As Double = 0
        Dim sumCMValue As Double = 0
        Dim sumAPPValue As Double = 0
        Dim dalSD As New AnnalsSubjectDetailDAL
        Dim objSD As New AnnalsSubjectDetail



        ' สร้าง sumary
        For i = 0 To oGridView.Rows.Count - 1
            Dim lbl1 As Label = oGridView.Rows(i).FindControl("lblValue_Old")
            Dim lbl2 As Label = oGridView.Rows(i).FindControl("lblValue_Customer")
            Dim lbl3 As Label = oGridView.Rows(i).FindControl("lblValue")
            Dim lbl4 As Label = oGridView.Rows(i).FindControl("lblValue_Approve")
            Dim hd As HiddenField = oGridView.Rows(i).FindControl("HdSubject_Detail_ID")
            Dim NN As Integer = 1
            objSD.SUBJECT_DETAIL_ID = hd.Value
            objSD = dalSD.getAnnalsSubjectDetailBySUBJECT_DETAIL_ID(objSD)
            If IsNothing(objSD.SUBJECT_ACTION) = False Then
                NN = objSD.SUBJECT_ACTION
            End If

            'MsgBox(lbl1.Text)
            If lbl1.Text <> "" Then
                sumOldValue += CDbl(lbl1.Text)
            End If
            If lbl2.Text <> "" Then
                sumValue += CDbl(lbl2.Text) * NN
            End If
            If lbl3.Text <> "" Then
                sumCMValue += CDbl(lbl3.Text) * NN
            End If
            If lbl4.Text <> "" Then
                sumAPPValue += CDbl(lbl4.Text) * NN
            End If

        Next


        ' สร้าง Grand Total
        Dim gRow = New GridViewRow(0, 0, DataControlRowType.DataRow, DataControlRowState.Normal)
        Dim newCell As New TableCell
        newCell.Text = " NET  "
        newCell.ColumnSpan = 6
        newCell.HorizontalAlign = HorizontalAlign.Right
        gRow.Cells.Add(newCell)

        Dim OldValCell As New TableCell
        OldValCell.Text = Format(sumOldValue, "#,##0")
        OldValCell.HorizontalAlign = HorizontalAlign.Right
        gRow.Cells.Add(OldValCell)

        Dim ValCell As New TableCell
        ValCell.Text = Format(sumValue, "#,##0")
        ValCell.HorizontalAlign = HorizontalAlign.Right
        gRow.Cells.Add(ValCell)

        Dim CMValCell As New TableCell
        CMValCell.Text = Format(sumCMValue, "#,##0")
        CMValCell.HorizontalAlign = HorizontalAlign.Right
        gRow.Cells.Add(CMValCell)

        Dim AppValCell As New TableCell
        AppValCell.Text = Format(sumAPPValue, "#,##0")
        AppValCell.HorizontalAlign = HorizontalAlign.Right
        gRow.Cells.Add(AppValCell)

        gRow.Cells.Add(CreateNewCell(""))

        gRow.ForeColor = Drawing.Color.White
        gRow.Font.Bold = True
        gRow.BackColor = Drawing.Color.CadetBlue

        'oGridView.Controls(0).Controls.Add(oGridViewRow)
        oGridView.Controls(0).Controls.Add(gRow)




    End Sub
    Function CreateNewCell(ByVal text As String) As TableCell

        Dim newCell As New TableCell
        newCell.Text = text
        Return newCell

    End Function
    Protected Sub GridAnnalsCreditAccount_PageIndexChanging(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewPageEventArgs) Handles GridAnnalsCreditAccount.PageIndexChanging
        Dim ds1 As DataSet = Session("ds1")
        GridAnnalsCreditAccount.EditIndex = -1
        GridAnnalsCreditAccount.PageIndex = e.NewPageIndex

        GridAnnalsCreditAccount.DataSource = ds1.Tables("acc")
        GridAnnalsCreditAccount.DataBind()

    End Sub
    Protected Sub GridAnnalsCreditAccount_RowCancelingEdit(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewCancelEditEventArgs) Handles GridAnnalsCreditAccount.RowCancelingEdit
        CancelEditAccount()
    End Sub
    Protected Sub CancelEditAccount()
        Dim ds1 As DataSet = Session("ds1")
        GridAnnalsCreditAccount.EditIndex = -1
        GridAnnalsCreditAccount.DataSource = ds1.Tables("acc")
        GridAnnalsCreditAccount.DataBind()
    End Sub
    Protected Sub GridAnnalsCreditAccount_RowDataBound(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewRowEventArgs) Handles GridAnnalsCreditAccount.RowDataBound
        If e.Row.RowType = DataControlRowType.DataRow Then

            Dim lblValue_Old As Label = e.Row.FindControl("lblValue_Old")
            Dim lblValue_Customer As Label = e.Row.FindControl("lblValue_Customer")
            Dim lblValue As Label = e.Row.FindControl("lblValue")
            Dim lblValue_Approve As Label = e.Row.FindControl("lblValue_Approve")


            If lblValue_Old.Text <> String.Empty Or lblValue_Old.Text <> "" Then
                lblValue_Old.Text = Format(CDbl(lblValue_Old.Text), "#,##0")
            Else
                lblValue_Old.Text = ""
            End If
            If lblValue_Customer.Text <> String.Empty Or lblValue_Customer.Text <> "" Then
                lblValue_Customer.Text = Format(CDbl(lblValue_Customer.Text), "#,##0")
            Else
                lblValue_Customer.Text = ""
            End If
            If lblValue.Text <> String.Empty Or lblValue.Text <> "" Then
                lblValue.Text = Format(CDbl(lblValue.Text), "#,##0")
            Else
                lblValue.Text = ""
            End If
            If lblValue_Approve.Text <> String.Empty Or lblValue_Approve.Text <> "" Then
                lblValue_Approve.Text = Format(CDbl(lblValue_Approve.Text), "#,##0")
            Else
                lblValue_Approve.Text = ""
            End If
            'lblValue_Old.Text = Format("#,##0", lblValue_Old.Text)  'String.Format("{0:F0}", lblValue_Old.Text)

        End If
        If e.Row.RowType = DataControlRowType.DataRow Then
            e.Row.Attributes.Add("OnMouseOver", "this.style.backgroundColor = 'lightblue';")
            If e.Row.RowState = DataControlRowState.Alternate Then
                Dim alColor As String = System.Drawing.ColorTranslator.ToHtml(GridAnnalsCreditAccount.AlternatingRowStyle.BackColor)
                e.Row.Attributes.Add("OnMouseOut", "this.style.backgroundColor ='" & alColor & "'")
            Else
                Dim bkColor As String = System.Drawing.ColorTranslator.ToHtml(GridAnnalsCreditAccount.RowStyle.BackColor)
                e.Row.Attributes.Add("OnMouseOut", "this.style.backgroundColor ='" & bkColor & "'")
            End If
        End If
    End Sub
    Protected Sub GridAnnalsCreditAccount_RowDeleting(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewDeleteEventArgs) Handles GridAnnalsCreditAccount.RowDeleting
        Dim ds1 As DataSet = Session("ds1")
        Dim Nrow = GridAnnalsCreditAccount.PageIndex * GridAnnalsCreditAccount.PageSize ' หา reccord ปัจจุบันของ grid
        For i As Integer = Nrow + 0 To ds1.Tables("acc").Rows.Count - 1
            If i = Nrow + e.RowIndex Then
                ds1.Tables("acc").Rows(i).Delete()
            End If
        Next

        ds1.AcceptChanges()
        GridAnnalsCreditAccount.EditIndex = -1
        GridAnnalsCreditAccount.DataSource = ds1.Tables("acc")
        GridAnnalsCreditAccount.DataBind()
    End Sub
    Protected Sub GridAnnalsCreditAccount_RowEditing(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewEditEventArgs) Handles GridAnnalsCreditAccount.RowEditing
        Session("event") = "edit"
        bindGridDetail(e.NewEditIndex, "acc")
        GridAnnalsCreditAccount.SelectedIndex = e.NewEditIndex
    End Sub
    Protected Sub GridAnnalsCreditAccount_RowUpdating(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewUpdateEventArgs) Handles GridAnnalsCreditAccount.RowUpdating
        'On Error Resume Next

        Dim ds1 As DataSet = Session("ds1")
        'GridAnnalsCreditAccount.EditIndex = e.RowIndex
        'Dim EditTable As String
        'If Session("event") = "add" Then
        '    EditTable = "addtable"
        'Else
        '    EditTable = "acc"
        'End If
        'GridAnnalsCreditAccount.DataSource = ds1.Tables(EditTable)
        'GridAnnalsCreditAccount.DataBind()




        ' Dim tbGridcif As TextBox = GridAnnalsCreditAccount.Rows(e.RowIndex).Cells(0).FindControl("tbGridcif")
        Dim ddlGridCIF As DropDownList = GridAnnalsCreditAccount.Rows(e.RowIndex).Cells(0).FindControl("ddlGridCIF")

        Dim TBCifName As TextBox = GridAnnalsCreditAccount.Rows(e.RowIndex).Cells(0).FindControl("TBCifName")
        Dim tbACCNO As TextBox = GridAnnalsCreditAccount.Rows(e.RowIndex).Cells(0).FindControl("tbACCNO")

        'Dim tbNBRTHAI As TextBox = GridAnnalsCreditAccount.Rows(e.RowIndex).Cells(ColNo.NBRTHAI).FindControl("tbNBRTHAI")
        Dim ddlProposal_ID As DropDownList = GridAnnalsCreditAccount.Rows(e.RowIndex).Cells(0).FindControl("ddlProposal_ID")
        Dim ddlDECB_RD_ID As DropDownList = GridAnnalsCreditAccount.Rows(e.RowIndex).FindControl("ddlDECB_RD_ID")
        ' Dim tbSumLimit As TextBox = GridAnnalsCreditAccount.Rows(e.RowIndex).Cells(ColNo.SUMLIMIT).FindControl("tbSumLimit")
        '  Dim tbSumPrin As TextBox = GridAnnalsCreditAccount.Rows(e.RowIndex).Cells(ColNo.SUMPRIN).FindControl("tbSumPrin")
        ' Dim tbSumAccru As TextBox = GridAnnalsCreditAccount.Rows(e.RowIndex).Cells(ColNo.SUMACCRU).FindControl("tbSumAccru")
        '  Dim tbSumSusp As TextBox = GridAnnalsCreditAccount.Rows(e.RowIndex).Cells(ColNo.SUMSUSP).FindControl("tbSumSusp")
        ' Dim tbSumAging As TextBox = GridAnnalsCreditAccount.Rows(e.RowIndex).Cells(ColNo.SUMAGING).FindControl("tbSumAging")
        Dim tbValue_Customer As TextBox = GridAnnalsCreditAccount.Rows(e.RowIndex).FindControl("tbValue_Customer")
        Dim tbValue_Old As TextBox = GridAnnalsCreditAccount.Rows(e.RowIndex).FindControl("tbValue_Old")
        Dim tbValue As TextBox = GridAnnalsCreditAccount.Rows(e.RowIndex).FindControl("tbValue")
        Dim tbValue_Approve As TextBox = GridAnnalsCreditAccount.Rows(e.RowIndex).FindControl("tbValue_Approve")
        'Dim ddlDayApprove_date As DropDownList = GridAnnalsCreditAccount.Rows(e.RowIndex).Cells(ColNo.Approve_date).FindControl("ddlDayApprove_date")
        'Dim ddlMonthApprove_date As DropDownList = GridAnnalsCreditAccount.Rows(e.RowIndex).Cells(ColNo.Approve_date).FindControl("ddlMonthApprove_date")
        'Dim ddlYearApprove_date As DropDownList = GridAnnalsCreditAccount.Rows(e.RowIndex).Cells(ColNo.Approve_date).FindControl("ddlYearApprove_date")
        Dim ddlSUBJECT_DETAIL_ID As DropDownList = GridAnnalsCreditAccount.Rows(e.RowIndex).FindControl("ddlSUBJECT_DETAIL_ID")
        Dim ddlSUBJECT As DropDownList = GridAnnalsCreditAccount.Rows(e.RowIndex).FindControl("ddlSUBJECT")

        Dim ddlPROGRAM As DropDownList = GridAnnalsCreditAccount.Rows(e.RowIndex).FindControl("ddlPROGRAM")
        Dim ddlPROJECT As DropDownList = GridAnnalsCreditAccount.Rows(e.RowIndex).Cells(0).FindControl("ddlPROJECT")
        Dim ddlPRODUCT As DropDownList = GridAnnalsCreditAccount.Rows(e.RowIndex).FindControl("ddlPRODUCT")
        Dim ddlPRODUCT_CODE As DropDownList = GridAnnalsCreditAccount.Rows(e.RowIndex).Cells(0).FindControl("ddlPRODUCT_CODE")



        'Dim ddlPROCESS_ID As DropDownList = GridAnnalsCreditAccount.Rows(e.RowIndex).Cells(ColNo.PROCESS_ID).FindControl("ddlPROCESS_ID")
        Dim tbOthers As TextBox = GridAnnalsCreditAccount.Rows(e.RowIndex).FindControl("tbOthers")
        Dim tbRM_ID As TextBox = GridAnnalsCreditAccount.Rows(e.RowIndex).FindControl("tbRM_ID")
        Dim str = String.Empty
        Dim strAccount = String.Empty
        Dim strGL As String = String.Empty


        'Dim strSubjectID As String = Nothing    ' ตัวแปรที่ subject ที่เป็นตัวกำหนดให้กริตแสดงกี่ช่อง

        ''***** กรณีเป็นการแก้ไขให้สร้าง dropdown subject detail  ที่ตรงกับ ค่าจริง ๆ ใน dataset
        'Dim sdal As New AnnalsSubjectDetailDAL
        'Dim sobj = sdal.getAnnalsSubjectDetailBySUBJECT_DETAIL_ID(ddlSUBJECT_DETAIL_ID.Items(ddlSUBJECT_DETAIL_ID.SelectedIndex).Value)
        'If sobj.SUBJECT_ID <> "" Then
        '    strSubjectID = sobj.SUBJECT_ID.Trim.ToString
        'End If
        '' เช็คถ้าเป็น เกียวกับวงเงิน และดอกเบี้ยให้ทำ
        ''MsgBox(ddlSubject.Items(ddlSubject.SelectedIndex).Value)
        '' Exit Sub
        ''MsgBox(strSubjectID)
        '' ค้นหาว่าในแต่ละ subject ต้องมีการระบุค่าใน value หรือไม่
        'Dim SMDAL As New AnnalsSubjectDAL
        'Dim SMOBJ As New AnnalsSubject
        'SMOBJ = SMDAL.getAnnalsSubjectBySUBJECT_ID(strSubjectID)
        'If SMOBJ.HASVALUE = "0" Then
        '    tbACCNO.Text = ""
        '    '  tbNBRTHAI.Text = ""
        '    ' tbSumLimit.Text = 0
        '    '   tbSumPrin.Text = 0
        '    '   tbSumAccru.Text = 0
        '    '    tbSumSusp.Text = 0
        '    '    tbSumAging.Text = 0
        '    tbValue_Customer.Text = ""
        '    tbValue_Old.Text = ""
        '    tbValue.Text = ""
        '    tbValue_Approve.Text = ""
        'End If
        'If tbACCNO.Text = "" Then tbACCNO.Text = " "

        '    If tbNBRTHAI.Text = "" Then tbNBRTHAI.Text = " "
        '    If tbSumLimit.Text = "" Then
        '   tbSumLimit.Text = 0
        'Else
        'If IsNumeric(tbSumLimit.Text) = False Then
        '    str += "Please input  limit with number. \n\n"
        'End If
        'End If

        'If tbSumPrin.Text = "" Then
        '    tbSumPrin.Text = 0
        'Else
        'If IsNumeric(tbSumPrin.Text) = False Then
        'str += "Please input principle  with number. \n\n"
        'End If
        'End If

        'If tbSumAccru.Text = "" Then
        'tbSumAccru.Text = 0
        'Else
        'If IsNumeric(tbSumAccru.Text) = False Then
        'str += "Please input  accru  with number. \n\n"
        'End If
        'End If

        'If tbSumSusp.Text = "" Then
        'tbSumSusp.Text = 0
        'Else
        'If IsNumeric(tbSumSusp.Text) = False Then
        'str += "Please input  susp  with number. \n\n"
        'End If
        'End If

        'If tbSumAging.Text = "" Then
        'tbSumAging.Text = 0
        'Else
        'If IsNumeric(tbSumAging.Text) = False Then
        'str += "Please input  aging  with number. \n\n"
        'End If
        'End If

        ' ========= แก้ไขเมื่อวันที่ 8 กุมภาพันธ์

        'If tbValue_Customer.Text = "" Then tbValue_Customer.Text = 0
        'If tbValue.Text = "" Then tbValue.Text = 0
        'If tbValue_Old.Text = "" Then tbValue_Old.Text = 0
        'If tbValue_Approve.Text = "" Then tbValue_Approve.Text = 0


        'If DirectCast(Application.Item(ApplicationKeyConst.App_Culture), CultureInfo).Name.StartsWith("en") Then   ' ตรวจสอบ culture
        '    If IsDate(ddlMonthApprove_date.SelectedValue & "/" & ddlDayApprove_date.SelectedValue & "/" & ddlYearApprove_date.SelectedValue) = False Then
        '        str += "Please input Approve date with correct date. \n\n "
        '    End If
        'Else
        '    If IsDate(ddlDayApprove_date.SelectedValue & "/" & ddlMonthApprove_date.SelectedValue & "/" & CInt(ddlYearApprove_date.SelectedValue) + 543) = False Then
        '        str += "Please input Approve date with correct date. \n\n "
        '    End If
        'End If
        If ddlGridCIF.SelectedValue = "" Then
            str += " Please insert  CIF"
            ddlGridCIF.BackColor = Drawing.Color.Red
        Else
            ddlGridCIF.BackColor = Drawing.Color.White
        End If


        'Dim dal1 As New CustomerDAL
        'Dim obj1 As New Customer
        'obj1.CIF = ddlGridCIF.SelectedValue
        'obj1 = dal1.getCustomerByCIF(obj1)
        'If obj1.CUS_FIRST = "" Then
        '    ddlGridCIF.BackColor = Drawing.Color.Red
        '    TBCifName.Text = "ไม่พบข้อมูลลูกค้ารายนี้"
        '    TBCifName.BackColor = Drawing.Color.Red
        '    Exit Sub
        'Else
        '    ddlGridCIF.BackColor = Drawing.Color.White
        '    TBCifName.BackColor = Drawing.Color.White
        'End If

        If ddlProposal_ID.SelectedIndex < 0 Then
            str += " Please insert  proposal ( วัตถุประสงค์ )"
            ddlProposal_ID.BackColor = Drawing.Color.Red
        Else
            If ddlProposal_ID.Items(ddlProposal_ID.SelectedIndex).Value = "00" Then
                str += " Please insert  proposal ( วัตถุประสงค์ )"
                ddlProposal_ID.BackColor = Drawing.Color.Red
            Else
                ddlProposal_ID.BackColor = Drawing.Color.White
            End If
        End If



        If ddlSUBJECT.SelectedValue.Length = 0 Then
            str += " Please insert  Subject "
            ddlSUBJECT.BackColor = Drawing.Color.Red
        Else
            ddlSUBJECT.BackColor = Drawing.Color.White
        End If


        If ddlSUBJECT_DETAIL_ID.SelectedValue.Length = 0 Then
            str += " Please insert  Subject "
            ddlSUBJECT_DETAIL_ID.BackColor = Drawing.Color.Red
        Else
            ddlSUBJECT_DETAIL_ID.BackColor = Drawing.Color.White
        End If


        If ddlPROJECT.SelectedIndex < 0 Then
            str += " Please insert  Program."
            ddlPROGRAM.BackColor = Drawing.Color.Red
            ddlPROJECT.BackColor = Drawing.Color.Red
        Else
            ddlPROGRAM.BackColor = Drawing.Color.White
            ddlPROJECT.BackColor = Drawing.Color.White
        End If



        If str <> "" Then
            Exit Sub
        End If

        Dim Nrow = GridAnnalsCreditAccount.PageIndex * GridAnnalsCreditAccount.PageSize ' หา reccord ปัจจุบันของ grid

        Dim dtable As DataTable
        Dim row As DataRow

        If Session("event") = "add" Then
            dtable = ds1.Tables("acc")
            row = dtable.NewRow()
        Else
            dtable = ds1.Tables("acc")
            row = dtable.Rows(e.RowIndex + Nrow)
        End If
        row("Cif") = ddlGridCIF.SelectedValue
        row("ACCNO") = tbACCNO.Text

        ' เปลี่ยนจาก textbox เป็น dropdownlist

        row("DECB_RD_ID") = ddlDECB_RD_ID.Items(ddlDECB_RD_ID.SelectedIndex).Value
        row("DECB_RD") = ddlDECB_RD_ID.Items(ddlDECB_RD_ID.SelectedIndex).Text
        'row("NBRTHAI") = tbNBRTHAI.Text
        'row("SUMLIMIT") = tbSumLimit.Text
        ' row("SUMPRIN") = tbSumPrin.Text
        ' row("SUMACCRU") = tbSumAccru.Text
        'row("SUMSUSP") = tbSumSusp.Text
        'row("SUMAGING") = tbSumAging.Text

        row("PROPOSAL_ID") = ddlProposal_ID.Items(ddlProposal_ID.SelectedIndex).Value
        row("PROPOSAL_NAME") = ddlProposal_ID.Items(ddlProposal_ID.SelectedIndex).Text
        row("SUBJECT_DETAIL_ID") = ddlSUBJECT_DETAIL_ID.Items(ddlSUBJECT_DETAIL_ID.SelectedIndex).Value
        row("SUBJECT_DETAIL") = ddlSUBJECT_DETAIL_ID.Items(ddlSUBJECT_DETAIL_ID.SelectedIndex).Text

        row("Value_Old") = tbValue_Old.Text
        row("Value_Customer") = tbValue_Customer.Text
        row("Value") = tbValue.Text
        row("Value_Approve") = tbValue_Approve.Text



        row("PROGRAM_ID") = ddlPROGRAM.Items(ddlPROGRAM.SelectedIndex).Value
        row("PROGRAM_NAME") = ddlPROGRAM.Items(ddlPROGRAM.SelectedIndex).Text

        If ddlPROJECT.SelectedIndex > -1 Then
            row("PROJECT_ID") = ddlPROJECT.Items(ddlPROJECT.SelectedIndex).Value
            row("PROJECT_NAME") = ddlPROJECT.Items(ddlPROJECT.SelectedIndex).Text
        Else
            row("PROJECT_ID") = " "
            row("PROJECT_NAME") = " "
        End If



        If ddlPRODUCT.SelectedIndex > -1 Then
            row("PRODUCT_ID") = ddlPRODUCT.Items(ddlPRODUCT.SelectedIndex).Value
            row("PRODUCT_NAME") = ddlPRODUCT.Items(ddlPRODUCT.SelectedIndex).Text
        Else
            row("PRODUCT_ID") = " "
            row("PRODUCT_NAME") = " "
        End If

        If ddlPRODUCT_CODE.SelectedIndex > -1 Then
            row("PRODUCT_CODE") = ddlPRODUCT_CODE.Items(ddlPRODUCT_CODE.SelectedIndex).Value
            row("PROJECT_CODE") = ddlPRODUCT_CODE.Items(ddlPRODUCT_CODE.SelectedIndex).Text
        Else
            row("PRODUCT_CODE") = " "
            row("PROJECT_CODE") = " "
        End If


        'row("Approve_Date") = New Date(ddlYearApprove_date.SelectedValue, ddlMonthApprove_date.SelectedValue, ddlDayApprove_date.SelectedValue, 0, 0, 0)     ' วันที่ approve
        'row("PROCESS_ID") = ddlPROCESS_ID.Items(ddlPROCESS_ID.SelectedIndex).Value
        'row("PROCESS") = ddlPROCESS_ID.Items(ddlPROCESS_ID.SelectedIndex).Text
        row("Others") = tbOthers.Text
        row("RM_ID") = tbRM_ID.Text



        If Session("event") = "add" Then
            dtable.Rows.Add(row)
        End If
        dtable.AcceptChanges()
        Session("event") = "updateprocess"
        bindGridDetail(-1, "acc")
        'If Err.Description <> "" Then
        '    createAlert(Err.Description)
        '    Err.Clear()
        'End If

    End Sub
    Protected Sub bindGridDetail(ByVal EditRow As Integer, ByVal EditTable As String)

        ' Try

        '  หน้านี้ใช้กรณี ที่ เป็นการ add และ edit  ในการ add จะดึง table 'addtable'  และใช้คำสั่ง   bindGridDetail(0, "addtable")
        ' ถ้าเป็นแก้ไขดึง()  'acc'
        '  If IsNothing(Session("ds1")) = True Or IsNothing(User.Identity.Name) Then
        Dim UserID As String = Nothing
        If User.Identity.Name = "" Then ' ถ้า  session user.identity ไม่มีให้ เอาค่าจาก lbl แทน
            UserID = lblUserID.Text
        Else
            UserID = User.Identity.Name
        End If

        Dim ds1 As DataSet = Session("ds1")
        GridAnnalsCreditAccount.EditIndex = EditRow
        GridAnnalsCreditAccount.DataSource = ds1.Tables(EditTable)

        'MsgBox(ds1.Tables("acc").Rows.Count )

        GridAnnalsCreditAccount.DataBind()

        ' Dim Nrow = GridAnnalsCreditAccount.PageIndex * GridAnnalsCreditAccount.PageSize ' หา reccord ปัจจุบันของ grid
        Dim nrow = 0  ' ไม่ต้องมีตัวแปร paging แล่้วยกเลิก

        If GridAnnalsCreditAccount.Rows.Count < 1 Or EditRow < 0 Then  ' ถ้าเป็นการค้นหา  หรือสั่ง bind เฉย ๆ  ให้ออกเลยและซ่อนบาง column
            '    GridAnnalsCreditAccount.Columns(ColNo.ACCNO + 1).Visible = False
            '    GridAnnalsCreditAccount.Columns(ColNo.PROJECT_CODE + 1).Visible = False
            Exit Sub

        End If


        Dim strSubjectID As String = Nothing    ' ตัวแปรที่ subject ที่เป็นตัวกำหนดให้กริตแสดงกี่ช่อง


        ' ===============หา control ใน grid


        'Dim tbGridCif As TextBox = GridAnnalsCreditAccount.Rows(EditRow).FindControl("tbGridCif")
        Dim ddlGridCIF As DropDownList = GridAnnalsCreditAccount.Rows(EditRow).FindControl("ddlGridCIF")
        Dim btnSearchAccount As Image = GridAnnalsCreditAccount.Rows(EditRow).FindControl("btnSearchAccount")
        Dim tbACCNO As TextBox = GridAnnalsCreditAccount.Rows(EditRow).FindControl("tbACCNO")
        Dim ddlPROPOSAL_ID As DropDownList = GridAnnalsCreditAccount.Rows(EditRow).FindControl("ddlPROPOSAL_ID")        ' ----- เพิ่มวันที่ 17/03/2009
        Dim ddlDECB_RD_ID As DropDownList = GridAnnalsCreditAccount.Rows(EditRow).FindControl("ddlDECB_RD_ID")
        Dim tbValue_Customer As TextBox = GridAnnalsCreditAccount.Rows(EditRow).FindControl("tbValue_Customer")
        Dim tbValue_Old As TextBox = GridAnnalsCreditAccount.Rows(EditRow).FindControl("tbValue_Old")
        Dim tbValue As TextBox = GridAnnalsCreditAccount.Rows(EditRow).FindControl("tbValue")
        Dim tbValue_Approve As TextBox = GridAnnalsCreditAccount.Rows(EditRow).FindControl("tbValue_Approve")
        Dim ddlSUBJECT As DropDownList = GridAnnalsCreditAccount.Rows(EditRow).FindControl("ddlSUBJECT")
        Dim ddlSUBJECT_DETAIL_ID As DropDownList = GridAnnalsCreditAccount.Rows(EditRow).FindControl("ddlSUBJECT_DETAIL_ID")
        Dim tbOthers As TextBox = GridAnnalsCreditAccount.Rows(EditRow).FindControl("tbOthers")
        Dim TableAccountForm As Table = GridAnnalsCreditAccount.Rows(EditRow).FindControl("TableAccountForm")

        Dim ddlPROGRAM As DropDownList = GridAnnalsCreditAccount.Rows(EditRow).FindControl("ddlPROGRAM")
        Dim ddlPROJECT As DropDownList = GridAnnalsCreditAccount.Rows(EditRow).FindControl("ddlPROJECT")
        Dim ddlPRODUCT As DropDownList = GridAnnalsCreditAccount.Rows(EditRow).FindControl("ddlPRODUCT")
        Dim ddlPRODUCT_CODE As DropDownList = GridAnnalsCreditAccount.Rows(EditRow).FindControl("ddlPRODUCT_CODE")


        ddlPROGRAM.DataSource = Session("PROGRAM")
        ddlPROGRAM.DataValueField = "PROGRAM_ID"
        ddlPROGRAM.DataTextField = "PROGRAM_NAME"
        ddlPROGRAM.DataBind()
        ddlPROGRAM.Items.Insert(0, New ListItem("...โปรดเลือก...", ""))

        ddlSUBJECT.DataSource = Session("arrSUBJECT")
        ddlSUBJECT.DataValueField = "SUBJECT_ID"
        ddlSUBJECT.DataTextField = "SUBJECT"
        ddlSUBJECT.DataBind()
        ddlSUBJECT.Items.Insert(0, New ListItem("...โปรดเลือก...", ""))


        ddlGridCIF.Items.Clear()
        ddlGridCIF.Items.Add((New ListItem("...โปรดเลือก...", "")))

        For i = 0 To ds1.Tables("customer").Rows.Count - 1
            ddlGridCIF.Items.Add(ds1.Tables("customer").Rows(i).Item("CIF"))
        Next


        If Session("event") = "edit" Then

       
            '***** กรณีเป็นการแก้ไขให้สร้าง dropdown subject detail  ที่ตรงกับ ค่าจริง ๆ ใน dataset
            Dim sdal As New AnnalsSubjectDetailDAL
            Dim sobj = sdal.getAnnalsSubjectDetailBySUBJECT_DETAIL_ID(ds1.Tables(EditTable).Rows(EditRow + Nrow).Item("SUBJECT_DETAIL_ID").ToString)
            If sobj.SUBJECT_ID <> "" Then
                strSubjectID = sobj.SUBJECT_ID.Trim.ToString
                bindSubjectDetail(strSubjectID)



            End If

            GridAnnalsCreditAccount.SelectedIndex = EditRow


        ElseIf Session("event") = "add" Then
            strSubjectID = ddlSUBJECT.Items(ddlSUBJECT.SelectedIndex).Value
        End If



        'Dim tbSUMLIMIT As TextBox = GridAnnalsCreditAccount.Rows(EditRow).FindControl("tbSUMLIMIT")
        'Dim tbSUMPRIN As TextBox = GridAnnalsCreditAccount.Rows(EditRow).FindControl("tbSUMPRIN")
        'Dim tbSUMACCRU As TextBox = GridAnnalsCreditAccount.Rows(EditRow).FindControl("tbSUMACCRU")
        ' Dim tbSUMSUSP As TextBox = GridAnnalsCreditAccount.Rows(EditRow).FindControl("tbSUMSUSP")
        '  Dim tbSUMAGING As TextBox = GridAnnalsCreditAccount.Rows(EditRow).FindControl("tbSUMAGING")
        ' MsgBox(tbValue_Old.Text)


        ' อันเดิมโชวหมด
        'Dim s As String
        's += "window.open('SearchAccountCif.aspx"
        's += "?cif=" & tbGridCif.Text
        's += "&tbACCNO=" & tbACCNO.ClientID
        's += "&tbNBRTHAI=" & tbNBRTHAI.ClientID
        's += "&tbDECB_RD_ID=" & ddlDECB_RD_ID.ClientID
        's += "&tbSUMLIMIT=" & tbSUMLIMIT.ClientID
        's += "&tbSUMPRIN=" & tbSUMPRIN.ClientID
        's += "&tbSUMACCRU=" & tbSUMACCRU.ClientID
        's += "&tbSUMSUSP=" & tbSUMSUSP.ClientID
        's += "&tbSUMAGING=" & tbSUMAGING.ClientID
        ''MsgBox(s)
        'btnSearchAccount.Attributes.Add("onclick", s & "','pop', 'width=780, height=300');")
        ' อันใหม่โชวแต่ acc
        Dim s As String = String.Empty
        s += "window.open('SearchAccountCif.aspx"
        s += "?cif=" & ddlGridCIF.Items(ddlGridCIF.SelectedIndex).Value
        s += "&tbACCNO=" & tbACCNO.ClientID
        s += "&tbDECB_RD_ID=" & ddlDECB_RD_ID.ClientID
        'MsgBox(s)
        btnSearchAccount.Attributes.Add("onclick", s & "','pop', 'width=780, height=300');")


        ' =======  bind ค่าให้  dropdown ต่าง ๆ 


        ddlDECB_RD_ID.DataSource = Session("arrDECB_RD_ID")
        ddlDECB_RD_ID.DataValueField = "DECB_RD_ID"
        ddlDECB_RD_ID.DataTextField = "DECB_RD"
        ddlDECB_RD_ID.DataBind()




        ddlSUBJECT_DETAIL_ID.DataSource = Session("arrSUBJECT_DETAIL_ID")
        ddlSUBJECT_DETAIL_ID.DataValueField = "SUBJECT_DETAIL_ID"
        ddlSUBJECT_DETAIL_ID.DataTextField = "SUBJECT_DETAIL"
        ddlSUBJECT_DETAIL_ID.DataBind()


        '--------เพิ่มวันที่---17032009

        ddlPROPOSAL_ID.DataSource = Session("arrPROPOSAL")
        ddlPROPOSAL_ID.DataValueField = "PROPOSAL_ID"
        ddlPROPOSAL_ID.DataTextField = "PROPOSAL_NAME"
        ddlPROPOSAL_ID.DataBind()




        '====== กำหนดค่าที่เลือกลงใน control และ dropdown  โดยดึงค่าจาก dataset แถวที่เลือก


        Dim StringSubject As String = Nothing
        With ds1.Tables(EditTable).Rows(EditRow + Nrow)
            'Response.Write("dataset " & EditRow + Nrow)
            If Not IsDBNull(.Item("cif")) Then
                ddlGridCIF.SelectedIndex = ddlGridCIF.Items.IndexOf(ddlGridCIF.Items.FindByValue(.Item("cif")))
                If Session("event") = "edit" Then  ' ถ้าเป็นการแก้ไขให้หาข้อมูล cif ด้วย
                    If .Item("cif").ToString <> String.Empty Then
                        SearchCif(ddlGridCIF.Items(ddlGridCIF.SelectedIndex).Value, "edit")
                    End If
                End If
            End If

            If IsDBNull(.Item("ACCNO")) = False Then tbACCNO.Text = .Item("ACCNO")
            '   If IsDBNull(.Item("NBRTHAI")) = False Then tbNBRTHAI.Text = .Item("NBRTHAI")
            ' เปลี่ยนจาก text เป็น dropdown   20/08/2009


            'ddlDECB_RD_ID.SelectedIndex = 0
            'For i As Integer = 0 To ddlDECB_RD_ID.Items.Count - 1
            '    If ddlDECB_RD_ID.Items(i).Value = .Item("DECB_RD_ID") Then
            '        ddlDECB_RD_ID.SelectedIndex = i
            '        Exit For
            '    End If
            'Next

            ddlDECB_RD_ID.SelectedIndex = ddlDECB_RD_ID.Items.IndexOf(ddlDECB_RD_ID.Items.FindByValue(.Item("DECB_RD_ID")))

            If IsDBNull(.Item("PROPOSAL_ID")) = False Then ddlPROPOSAL_ID.SelectedIndex = ddlPROPOSAL_ID.Items.IndexOf(ddlPROPOSAL_ID.Items.FindByValue(.Item("PROPOSAL_ID")))
            ' If IsDBNull(.Item("SUMLIMIT")) = False Then tbSUMLIMIT.Text = Format(.Item("SUMLIMIT"), "##,###.00")
            '  If IsDBNull(.Item("SUMPRIN")) = False Then tbSUMPRIN.Text = Format(.Item("SUMPRIN"), "##,###.00")
            '   If IsDBNull(.Item("SUMACCRU")) = False Then tbSUMACCRU.Text = Format(.Item("SUMACCRU"), "##,###.00")
            '   If IsDBNull(.Item("SUMSUSP")) = False Then tbSUMSUSP.Text = Format(.Item("SUMSUSP"), "##,###.00")
            '   If IsDBNull(.Item("SUMAGING")) = False Then tbSUMAGING.Text = Format(.Item("SUMAGING"), "##,###.00")

            'ddlSUBJECT_DETAIL_ID.SelectedIndex = 0
            'For i As Integer = 0 To ddlSUBJECT_DETAIL_ID.Items.Count - 1
            '    If ddlSUBJECT_DETAIL_ID.Items(i).Value = .Item("SUBJECT_DETAIL_ID") Then
            '        ddlSUBJECT_DETAIL_ID.SelectedIndex = i
            '        Exit For
            '    End If
            'Next


            If IsDBNull(.Item("SUBJECT_DETAIL_ID")) = False Then
                ddlSUBJECT_DETAIL_ID.SelectedIndex = ddlSUBJECT_DETAIL_ID.Items.IndexOf(ddlSUBJECT_DETAIL_ID.Items.FindByValue(.Item("SUBJECT_DETAIL_ID")))
                StringSubject = .Item("SUBJECT_DETAIL_ID") ' เอาไว้เช็คค่าเพื่อกำหนด coloumn ใน grid


            End If


            If Not IsDBNull(.Item("Value_Customer")) Then
                If .Item("Value_Customer") <> String.Empty Or .Item("Value_Customer") <> "" Then
                    tbValue_Customer.Text = Format(CDbl(.Item("Value_Customer")), "#,##0")
                End If
            Else
                tbValue_Customer.Text = ""
            End If

            If Not IsDBNull(.Item("Value_Old")) Then
                If .Item("Value_Old") <> String.Empty Or .Item("Value_Old") <> "" Then
                    tbValue_Old.Text = Format(CDbl(.Item("Value_Old")), "#,##0")
                End If
            Else
                tbValue_Old.Text = ""
            End If

            If Not IsDBNull(.Item("Value")) Then
                If .Item("Value") <> String.Empty Or .Item("Value") <> "" Then
                    tbValue.Text = Format(CDbl(.Item("Value")), "#,##0")
                End If
            Else
                tbValue.Text = ""
            End If

            If Not IsDBNull(.Item("Value_Approve")) Then
                If .Item("Value_Approve") <> String.Empty Or .Item("Value_Approve") <> "" Then
                    tbValue_Approve.Text = Format(CDbl(.Item("Value_Approve")), "#,##0")
                End If
            Else
                tbValue_Approve.Text = ""
            End If

            tbOthers.Text = .Item("Others")



            If IsDBNull(.Item("PROGRAM_ID")) = False Then
                ddlPROGRAM.SelectedIndex = ddlPROGRAM.Items.IndexOf(ddlPROGRAM.Items.FindByValue(.Item("PROGRAM_ID")))
                If ddlPROGRAM.SelectedValue <> "" Then
                    ChangeProject()
                End If
            End If


            If IsDBNull(.Item("PROJECT_ID")) = False Then

                ddlPROJECT.SelectedIndex = ddlPROJECT.Items.IndexOf(ddlPROJECT.Items.FindByValue(.Item("PROJECT_ID")))

            End If

            ddlDECB_RD_ID.SelectedIndex = ddlDECB_RD_ID.Items.IndexOf(ddlDECB_RD_ID.Items.FindByValue(.Item("DECB_RD_ID")))

            If ddlPROJECT.SelectedValue <> "" Then
                ChangeProduct()
            End If

            If IsDBNull(.Item("PRODUCT_ID")) = False Then

                If ddlPRODUCT.Items.Count > 0 Then
                    ddlPRODUCT.SelectedIndex = ddlPRODUCT.Items.IndexOf(ddlPRODUCT.Items.FindByValue(.Item("PRODUCT_ID")))
                End If
                If ddlPRODUCT_CODE.Items.Count > 0 And ddlPRODUCT_CODE.Items.Count > 0 Then
                    ddlPRODUCT_CODE.SelectedIndex = ddlPRODUCT.SelectedIndex
                End If

            End If



        End With




        Dim SMSUBJECTDAL As New AnnalsSubjectDAL
        Dim OBJSUBJECT As New AnnalsSubject

        '     If strSubjectID Is Nothing Then
        'MsgBox(strSubjectID)
        OBJSUBJECT = SMSUBJECTDAL.getAnnalsSubjectBySUBJECT_ID(strSubjectID)

        ddlSUBJECT.SelectedIndex = ddlSUBJECT.Items.IndexOf(ddlSUBJECT.Items.FindByValue(strSubjectID))

        '     If strSubjectID Is Nothing Then
        ' Else
        '         OBJSUBJECT.HASVALUE = 1
        '    End If


        ' ---- กำหนดค่า grid ให้แสดงตามประเภท
        With GridAnnalsCreditAccount
            Select Case OBJSUBJECT.HASVALUE
                'Select Case Mid(StringSubject, 1, 1)
                Case 1, 2  ' case ที่เกี่ยวกับวงเงิน
                    'Case "1", "2", "3", "4"
                    tbACCNO.Enabled = True   ' ColNo.ACCNO
                    btnSearchAccount.Enabled = True
                    tbACCNO.BackColor = Drawing.Color.White
                    tbValue_Old.Enabled = True
                    tbValue_Old.BackColor = Drawing.Color.White
                    tbValue_Customer.Enabled = True
                    tbValue_Customer.BackColor = Drawing.Color.White
                    tbValue.Enabled = True
                    tbValue.BackColor = Drawing.Color.White
                    tbValue_Approve.Enabled = True
                    tbValue_Approve.BackColor = Drawing.Color.White

                Case Else  ' เรื่องอื่น ๆ
                    tbACCNO.Enabled = False   ' ColNo.ACCNO
                    btnSearchAccount.Enabled = False
                    tbACCNO.BackColor = Drawing.Color.Gray
                    tbValue_Old.Enabled = False
                    tbValue_Old.BackColor = Drawing.Color.Gray
                    tbValue_Customer.Enabled = False
                    tbValue_Customer.BackColor = Drawing.Color.Gray
                    tbValue.Enabled = False
                    tbValue.BackColor = Drawing.Color.Gray
                    tbValue_Approve.Enabled = False
                    tbValue_Approve.BackColor = Drawing.Color.Gray
            End Select
        End With



        GridAnnalsCreditAccount.Rows(EditRow).Cells(0).ColumnSpan = 13
        GridAnnalsCreditAccount.Rows(EditRow).Cells(0).BackColor = Drawing.Color.Snow


        'For i = 0 To GridAnnalsCreditAccount.Rows.Count - 1
        '    GridAnnalsCreditAccount.Rows(EditRow).Cells.Remove(GridAnnalsCreditAccount.Rows(EditRow).Cells(1))
        'Next i



        'Catch ex As Exception

        'End Try
    End Sub
    Protected Sub ShowGridAccount()
        Dim ds1 As DataSet = Session("ds1")
        GridAnnalsCreditAccount.EditIndex = -1
        GridAnnalsCreditAccount.DataSource = ds1.Tables("acc")
        GridAnnalsCreditAccount.DataBind()
    End Sub
    Protected Sub ChangeProject()

        Dim gINdex As Integer = 0
        If Session("event") = "add" Then
            gINdex = 0
        Else
            gINdex = GridAnnalsCreditAccount.SelectedIndex
        End If


        Dim ddlPROGRAM As DropDownList = GridAnnalsCreditAccount.Rows(gINdex).Cells(0).FindControl("ddlPROGRAM")
        Dim ddlPROJECT As DropDownList = GridAnnalsCreditAccount.Rows(gINdex).Cells(0).FindControl("ddlPROJECT")
        Dim ddlPRODUCT As DropDownList = GridAnnalsCreditAccount.Rows(gINdex).Cells(0).FindControl("ddlPRODUCT")
        Dim ddlPRODUCT_CODE As DropDownList = GridAnnalsCreditAccount.Rows(gINdex).Cells(0).FindControl("ddlPRODUCT_CODE")

        Dim PROGRAM_ID As String = ddlPROGRAM.SelectedValue



        Dim conn As SqlConnection = Nothing
        conn = ConnectionUtil.getSqlConnectionFromWebConfig()
        Dim sqlProgram As String = "SELECT * FROM ANNALS_PROJECT WHERE PROGRAM_ID = '" & PROGRAM_ID & "' AND DEL_FLAG <> 1 ORDER BY PROJECT_ID"
        Dim sqlCmd As New SqlCommand(sqlProgram, conn)

        Dim dr = sqlCmd.ExecuteReader(CommandBehavior.CloseConnection)
        Dim dt As New DataTable
        dt.Load(dr)

        ddlPROJECT.Items.Clear()

        ddlPROJECT.DataSource = dt
        ddlPROJECT.DataValueField = "PROJECT_ID"
        ddlPROJECT.DataTextField = "PROJECT_NAME"
        ddlPROJECT.DataBind()

        ChangeGL()

        ' เคลียโปรดัก
        If ddlPROJECT.Items.Count > 0 Then
            ChangeProduct()
        Else
            ddlPRODUCT.Items.Clear()
            ddlPRODUCT_CODE.Items.Clear()
        End If





    End Sub
    Protected Sub ChangeProductIndex()
        Dim gINdex As Integer = 0
        If Session("event") = "add" Then
            gINdex = 0
        Else
            gINdex = GridAnnalsCreditAccount.SelectedIndex
        End If

        Dim ddlPRODUCT As DropDownList = GridAnnalsCreditAccount.Rows(gINdex).Cells(0).FindControl("ddlPRODUCT")
        Dim ddlPRODUCT_CODE As DropDownList = GridAnnalsCreditAccount.Rows(gINdex).Cells(0).FindControl("ddlPRODUCT_CODE")

        ddlPRODUCT_CODE.SelectedIndex = ddlPRODUCT.SelectedIndex


    End Sub
    Protected Sub ChangeProduct()

        Dim gINdex As Integer = 0
        If Session("event") = "add" Then
            gINdex = 0
        Else
            gINdex = GridAnnalsCreditAccount.SelectedIndex
        End If

        Dim ddlDECB_RD_ID As DropDownList = GridAnnalsCreditAccount.Rows(gINdex).Cells(0).FindControl("ddlDECB_RD_ID")
        Dim ddlPROJECT As DropDownList = GridAnnalsCreditAccount.Rows(gINdex).Cells(0).FindControl("ddlPROJECT")
        Dim ddlPRODUCT As DropDownList = GridAnnalsCreditAccount.Rows(gINdex).Cells(0).FindControl("ddlPRODUCT")
        Dim ddlPRODUCT_CODE As DropDownList = GridAnnalsCreditAccount.Rows(gINdex).Cells(0).FindControl("ddlPRODUCT_CODE")


        If ddlDECB_RD_ID.Items.Count > 0 Then
            If ddlDECB_RD_ID.SelectedIndex < 0 Then
                ddlDECB_RD_ID.SelectedIndex = 0
            End If
        End If

        Dim DECB_RD_ID As String = ddlDECB_RD_ID.SelectedValue
        Dim PROJECT_ID As String = ddlPROJECT.SelectedValue

        If PROJECT_ID = "" Or DECB_RD_ID = "" Or DECB_RD_ID = "0000" Then
            Exit Sub
        End If

        Dim conn As SqlConnection = Nothing
        conn = ConnectionUtil.getSqlConnectionFromWebConfig()
        Dim sqlProgram As String = "SELECT * FROM ANNALS_PRODUCT WHERE  PROJECT_ID = " & PROJECT_ID & " AND DECB_RD_ID='" & DECB_RD_ID & "' AND DEL_FLAG <> 1 "
        Dim sqlCmd As New SqlCommand(sqlProgram, conn)

        Dim dr = sqlCmd.ExecuteReader(CommandBehavior.CloseConnection)
        Dim dt As New DataTable
        dt.Load(dr)


        ddlPRODUCT.Items.Clear()

        ddlPRODUCT.DataSource = dt
        ddlPRODUCT.DataValueField = "PRODUCT_ID"
        ddlPRODUCT.DataTextField = "PRODUCT_NAME"
        ddlPRODUCT.DataBind()



        ddlPRODUCT_CODE.Items.Clear()
        ddlPRODUCT_CODE.DataSource = dt
        ddlPRODUCT_CODE.DataValueField = "PRODUCT_CODE"
        ddlPRODUCT_CODE.DataTextField = "PROJECT_CODE"
        ddlPRODUCT_CODE.DataBind()


    End Sub
    Protected Sub ChangeGL()

        Dim gINdex As Integer = 0
        If Session("event") = "add" Then
            gINdex = 0
        Else
            gINdex = GridAnnalsCreditAccount.SelectedIndex
        End If

        Dim ddlDECB_RD_ID As DropDownList = GridAnnalsCreditAccount.Rows(gINdex).Cells(0).FindControl("ddlDECB_RD_ID")
        Dim ddlPROGRAM As DropDownList = GridAnnalsCreditAccount.Rows(gINdex).Cells(0).FindControl("ddlPROGRAM")
        Dim PROGRAM_ID As String = ddlPROGRAM.SelectedValue

        Dim conn As SqlConnection = Nothing
        conn = ConnectionUtil.getSqlConnectionFromWebConfig()

        If PROGRAM_ID = 0 Or PROGRAM_ID = "" Then
            ' ถ้าไม่มีโปรแกรมไม่ต้องหา
        Else


            Dim sqlProgram As String = ""

            sqlProgram += "   SELECT DISTINCT G.* FROM ANNALS_GL_TYPE G"
            sqlProgram += "   INNER JOIN ANNALS_PRODUCT D ON G.DECB_RD_ID= D.DECB_RD_ID"
            sqlProgram += "   INNER JOIN  ANNALS_PROJECT J  ON  D.PROJECT_ID=J.PROJECT_ID"
            sqlProgram += "   INNER JOIN  ANNALS_PROGRAM P ON P.PROGRAM_ID = J.PROGRAM_ID"
            sqlProgram += "   WHERE  P.PROGRAM_ID = " & PROGRAM_ID & " AND  P.DEL_FLAG <> 1 "

            Dim sqlCmd As New SqlCommand(sqlProgram, conn)

            Dim dr = sqlCmd.ExecuteReader()
            Dim dt As New DataTable
            dt.Load(dr)

            ddlDECB_RD_ID.Items.Clear()

            ddlDECB_RD_ID.DataSource = dt
            ddlDECB_RD_ID.DataValueField = "DECB_RD_ID"
            ddlDECB_RD_ID.DataTextField = "DECB_RD"
            ddlDECB_RD_ID.DataBind()
        End If


        Dim findAgain As Boolean = False
        If ddlDECB_RD_ID.Items.Count = 0 Then
            findAgain = True
        End If
        If PROGRAM_ID = 0 Then
            findAgain = True
        End If
        If findAgain = True Then
            ' ถ้าเป็น 0 ให้แสดง product ทั้งหมด
            Dim sqlProgram As String
            sqlProgram = "   SELECT DISTINCT * FROM ANNALS_GL_TYPE G"
            Dim sqlCmd2 As New SqlCommand(sqlProgram, conn)

            Dim dr2 = sqlCmd2.ExecuteReader(CommandBehavior.CloseConnection)
            Dim dt2 As New DataTable
            dt2.Load(dr2)

            ddlDECB_RD_ID.Items.Clear()
            ddlDECB_RD_ID.DataSource = dt2
            ddlDECB_RD_ID.DataValueField = "DECB_RD_ID"
            ddlDECB_RD_ID.DataTextField = "DECB_RD"
            ddlDECB_RD_ID.DataBind()

        End If
    End Sub
    Protected Sub ChangeSubjectDetail()

        Dim gINdex As Integer = 0
        If Session("event") = "add" Then
            gINdex = 0
        Else
            gINdex = GridAnnalsCreditAccount.SelectedIndex
        End If


        Dim ddlSubject As DropDownList = GridAnnalsCreditAccount.Rows(gINdex).Cells(0).FindControl("ddlSubject")
        Dim btnSearchAccount As Image = GridAnnalsCreditAccount.Rows(gINdex).Cells(0).FindControl("btnSearchAccount")
        Dim ddlSUBJECT_DETAIL_ID As DropDownList = GridAnnalsCreditAccount.Rows(gINdex).Cells(0).FindControl("ddlSUBJECT_DETAIL_ID")
        Dim tbACCNO As TextBox = GridAnnalsCreditAccount.Rows(gINdex).FindControl("tbACCNO")
        Dim tbPRODUCT_CODE As TextBox = GridAnnalsCreditAccount.Rows(gINdex).FindControl("tbPRODUCT_CODE")
        Dim tbValue_Customer As TextBox = GridAnnalsCreditAccount.Rows(gINdex).FindControl("tbValue_Customer")
        Dim tbValue_Old As TextBox = GridAnnalsCreditAccount.Rows(gINdex).FindControl("tbValue_Old")
        Dim tbValue As TextBox = GridAnnalsCreditAccount.Rows(gINdex).FindControl("tbValue")
        Dim tbValue_Approve As TextBox = GridAnnalsCreditAccount.Rows(gINdex).FindControl("tbValue_Approve")


        If ddlSubject.Items(ddlSubject.SelectedIndex).Value <> "" Then

            Dim dal As New AnnalsSubjectDetailDAL
            Dim arrSUBJECT_DETAIL_ID As New List(Of AnnalsSubjectDetail)

            arrSUBJECT_DETAIL_ID = dal.getAllAnnalsSubjectDetailBySubjectID(ddlSubject.SelectedValue)
            ddlSUBJECT_DETAIL_ID.DataSource = arrSUBJECT_DETAIL_ID
            ddlSUBJECT_DETAIL_ID.DataValueField = "SUBJECT_DETAIL_ID"
            ddlSUBJECT_DETAIL_ID.DataTextField = "SUBJECT_DETAIL"
            ddlSUBJECT_DETAIL_ID.DataBind()
            ddlSUBJECT_DETAIL_ID.Items.Insert(0, New ListItem("...โปรดเลือก...", ""))
            ddlSUBJECT_DETAIL_ID.BackColor = Drawing.Color.LightYellow

        End If



        Dim SMSUBJECTDAL As New AnnalsSubjectDAL
        Dim OBJSUBJECT As New AnnalsSubject
        OBJSUBJECT = SMSUBJECTDAL.getAnnalsSubjectBySUBJECT_ID(ddlSubject.Items(ddlSubject.SelectedIndex).Value)
        'MsgBox(ddlSubject.SelectedIndex)
        ' ---- กำหนดค่า grid ให้แสดงตามประเภท
        With GridAnnalsCreditAccount
            Select Case OBJSUBJECT.HASVALUE
                'Select Case Mid(StringSubject, 1, 1)
                Case 1, 2  ' case ที่เกี่ยวกับวงเงิน
                    'Case "1", "2", "3", "4"
                    tbACCNO.Enabled = True   ' ColNo.ACCNO
                    btnSearchAccount.Enabled = True
                    tbACCNO.BackColor = Drawing.Color.White
                    tbPRODUCT_CODE.Enabled = False ' PRODUCT_CODE
                    tbPRODUCT_CODE.BackColor = Drawing.Color.White
                    tbValue_Old.Enabled = True
                    tbValue_Old.BackColor = Drawing.Color.White
                    tbValue_Customer.Enabled = True
                    tbValue_Customer.BackColor = Drawing.Color.White
                    tbValue.Enabled = True
                    tbValue.BackColor = Drawing.Color.White
                    tbValue_Approve.Enabled = True
                    tbValue_Approve.BackColor = Drawing.Color.White

                Case Else  ' เรื่องอื่น ๆ
                    tbACCNO.Enabled = False   ' ColNo.ACCNO
                    btnSearchAccount.Enabled = False
                    tbACCNO.BackColor = Drawing.Color.Gray
                    tbPRODUCT_CODE.Enabled = False ' PRODUCT_CODE
                    tbPRODUCT_CODE.BackColor = Drawing.Color.Gray
                    tbValue_Old.Enabled = False
                    tbValue_Old.BackColor = Drawing.Color.Gray
                    tbValue_Customer.Enabled = False
                    tbValue_Customer.BackColor = Drawing.Color.Gray
                    tbValue.Enabled = False
                    tbValue.BackColor = Drawing.Color.Gray
                    tbValue_Approve.Enabled = False
                    tbValue_Approve.BackColor = Drawing.Color.Gray
            End Select
        End With

    End Sub


#End Region

#Region " Save all"

    Protected Sub btnUpdate_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnUpdate.Click
        Save_Annals()
    End Sub
    Protected Sub Save_Annals()
        Dim ds1 As DataSet = Session("ds1")

        If Session("ds1") Is Nothing Then
            createAlert("ไม่สามารถบันทึกข้อมูลได้ \n\n  หมดเวลาบันทึกข้อมูล กรุณาปิดแล้วเข้าหน้านี้ใหม่) ")
            Exit Sub
        End If


        CancelEditCustomer()
        CancelEditAccount()
        CancelEditProcess()

        Dim UserID As String = Nothing
        Dim dupIDFlag As Boolean = False
        Dim msgDup As String = Nothing
        If User.Identity.Name = "" Then ' ถ้า  session user.identity ไม่มีให้ เอาค่าจาก lbl แทน
            UserID = lblUserID.Text
        Else
            UserID = User.Identity.Name
        End If

        If DATE_IN_ANNALS_TextBox.Text = "" Then
            createAlert("ไม่สามารถบันทึกข้อมูลได้ \n\n  กรุณากรอกวันที่ในหนังสือ ")
            DATE_IN_ANNALS_TextBox.BackColor = Drawing.Color.Red
            Exit Sub
        Else
            DATE_IN_ANNALS_TextBox.BackColor = Drawing.Color.White
        End If
        ' 3/7/2009    เปลี่ยนแปลงเงื่อนไขการเช็ค reference จากเดิมไม่ยอมให้มีค่าซ้ำ  เป็นสามารถใส่เลขซ้ำเลขเดิมได้  โดยให้แจ้งข้อความเหมือนเดิม แต่ยอมให้ใส่เลขซ้ำได้

        If DDLJobTypeId.Items(DDLJobTypeId.SelectedIndex).Value.ToString = "" Then  '  ถ้าเป็นเรื่องไม่เข้าบอรด
            createAlert("ไม่สามารถบันทึกข้อมูลได้ \n\n  Please insert Job Type.(กรุณาใส่ประเภทงาน) ")
            DDLJobTypeId.BackColor = Drawing.Color.Red
            Exit Sub
        Else
            DDLJobTypeId.BackColor = Drawing.Color.White
        End If

        ' ตรวจสอบว่าประเภทงานนี้ต้องตรวจสอบหรือไม่
        Dim jobTypeID = DDLJobTypeId.Items(DDLJobTypeId.SelectedIndex).Value
        'If ValidateResultLabel.Text.Trim.Length > 0 Or REFERENCETextBox.Text.Trim.Length <= 0 Then
        If REFERENCETextBox.Text.Trim.Length <= 0 And (jobTypeID <> "05" And jobTypeID <> "06") Then
            createAlert("ไม่สามารถบันทึกข้อมูลได้ \n\n  กรุณากรอก Reference(อ้างถึงหนังสือเลขที่) ")
            REFERENCETextBox.BackColor = Drawing.Color.Red
            REFERENCETextBox.Text = lblRefid.Text
            Exit Sub

        Else

            Dim idByRef As String = String.Empty
            Dim processByRef As String = String.Empty

            ' 12/05/2010  ดึงข้อมูล process ของหนังสือ จาก เลข reference
            ' ถ้ามีเลขนี้แล้ว เช็คดูว่าเรื่องจบหรือยัง  process  c,d,e หรือไม่  ถ้ายังไม่ให้บันทึก 
            Dim Refdal As New AnnalsDAL()
            'Dim idByRef = Refdal.getIdByReference(REFERENCETextBox.Text)
            Dim arrayID As ArrayList = Refdal.getAnnalsProcessByReference(REFERENCETextBox.Text)
            If arrayID.Count > 1 Then
                idByRef = arrayID.Item(0)
                processByRef = arrayID.Item(1)
            End If
            'MsgBox(processByRef)

            'ถ้า idByRef ไม่มีค่าแสดงว่า ไม่เคยมี reference นี้มาก่อน
            If idByRef.Equals(String.Empty) Then
                ' ถ้าไม่เจอเลขที่หนังสือนี้
                REFERENCETextBox.BackColor = Drawing.Color.White
            Else
                Dim idByRefShow As String = idByRef.Substring(1, 5) & "/" & idByRef.Substring(6, 4)
                ' กรณีถ้าเจอเลขที่หนังสือ
                If tbID.Text = "" Then
                    ' ถ้าเป็นการสร้างหนังสือใหม่ ( ยังไม่มีเลขหนังสือ ) เช็คดูว่าหนังสือที่แล้วจบหรือไม่ 
                    ' ถ้าไม่เป็น process จบ
                    If processByRef = "A" Or processByRef = "B" Then
                        REFERENCETextBox.BackColor = Drawing.Color.Red
                        createAlert("ไม่สามารถบันทึกข้อมูลได้ \n\n มี Reference(อ้างถึงหนังสือเลขที่นี้แล้ว) \n\n  ในหนังสือเลขที่:" & idByRefShow & "")
                        Exit Sub
                    End If
                    'If processByRef = "C" Or processByRef = "D" Or processByRef = "E" Then
                    '    REFERENCETextBox.BackColor = Drawing.Color.White
                    '    dupIDFlag = True
                    '    msgDup = " มี Reference(อ้างถึงหนังสือเลขที่นี้แล้ว) \n\n  ในหนังสือเลขที่:" & idByRefShow
                    'End If
                Else
                    ' ถ้าเป็นการแก้ไข หรือเพิ่ม process
                    If idByRef = tbID.Text Then
                        ' ถ้าเป็นหนังสือเดิม ไม่เป็นไร
                        REFERENCETextBox.BackColor = Drawing.Color.White
                    Else
                        '  ****  ถ้าเลขนี้ไปตรงกับหนังสืออื่น
                        If REFERENCETextBox.Text <> OLDREFERENCE.Value Then
                            If processByRef = "A" Or processByRef = "B" Then
                                ' ถ้าค่า reference ไม่ตรงกันแสดงว่ามีการเปลี่ยน reference ให้เช็คว่าไปซ้ำกับเลขใดที่มีแล้วหรือไม่
                                REFERENCETextBox.BackColor = Drawing.Color.Red
                                createAlert("ไม่สามารถบันทึกข้อมูลได้ \n\n  มี Reference(อ้างถึงหนังสือเลขที่นี้แล้ว)  \n\n ในหนังสือเลขที่: " & idByRefShow)
                                Exit Sub
                            End If
                        Else
                            REFERENCETextBox.BackColor = Drawing.Color.White
                        End If

                    End If
                End If
            End If
        End If



        If tbSME_Referral_No.Text <> "" Then
            If Len(tbSME_Referral_No.Text) <> 6 Or Len(DDLReferalYear.SelectedValue) <> 4 Then
                createAlert("ไม่สามารถบันทึกข้อมูลได้ \n\n  กรุณากรอก Referral no  ให้ถูกต้อง  (xxxxxx/255x) ")
                tbSME_Referral_No.BackColor = Drawing.Color.Red
                Exit Sub
            End If
        Else
            tbSME_Referral_No.BackColor = Drawing.Color.White
        End If





        If DDLCustomer_Size.Items(DDLCustomer_Size.SelectedIndex).Value.ToString = "1" Then  '  ถ้ายังไม่ระบุ
            createAlert("ไม่สามารถบันทึกข้อมูลได้ \n\n  Please insert Customer Size.(กรุณาใส่ประเภทลูกค้า) ")
            DDLCustomer_Size.BackColor = Drawing.Color.Red
            Exit Sub
        Else
            DDLCustomer_Size.BackColor = Drawing.Color.White
        End If

        searchBranch()

        If lblBranchName.Text = "" Or lblRegName.Text = "" Then
            createAlert("ไม่สามารถบันทึกข้อมูลได้ \n\n  Please insert Branch ID.(กรุณาใส่รหัสสาขา) ")
            tbBranch_ID.BackColor = Drawing.Color.Red
            Exit Sub
        Else
            tbBranch_ID.BackColor = Drawing.Color.White
        End If


        If (CheckProcess("D", -1, True) = True Or CheckProcess("E", -1, True) = True) And (jobTypeID <> "05" And jobTypeID <> "06") Then ' ถ้ามี process จบ

            If DDLoutofscope.Items(DDLoutofscope.SelectedIndex).Value.ToString = "" Then  '  ถ้ายังไม่ระบุ out of scope
                createAlert("ไม่สามารถบันทึกข้อมูลได้ \n\n  Please insert Out of  scope data.(กรุณาระบุขัอมูล Out of scope) ")
                DDLoutofscope.BackColor = Drawing.Color.Red
                Exit Sub
            Else
                DDLoutofscope.BackColor = Drawing.Color.White
            End If
            If tbGroupExposure.Text = "" Then
                createAlert("ไม่สามารถบันทึกข้อมูลได้ \n\n  กรุณาระบุข้อมูล Group Exposure ให้ครบถ้วน")
                tbGroupExposure.BackColor = Drawing.Color.Red
                Exit Sub
            Else
                tbGroupExposure.BackColor = Drawing.Color.White
            End If

        End If

        If CheckProcess("D", -1, True) = True And (jobTypeID <> "05") Then ' ถ้ามี process อนุมัต 

            If ReveiwDateTextBox.Text = "" Then
                createAlert("ไม่สามารถบันทึกข้อมูลได้ \n\n  กรุณาระบุข้อมูล วันที่ Reveiw ลูกค้าครั้งต่อไป ให้ครบถ้วน")
                ReveiwDateTextBox.BackColor = Drawing.Color.Red
                Exit Sub
            Else
                ReveiwDateTextBox.BackColor = Drawing.Color.White
            End If

            If TextBoxCMControl.Text = "" Then
                createAlert("ไม่สามารถบันทึกข้อมูลได้ \n\n  กรุณาระบุข้อมูล CM ที่ดูแล ให้ครบถ้วน")
                TextBoxCMControl.BackColor = Drawing.Color.Red
                Exit Sub
            Else
                Dim dalE As New TbEmployeeDAL
                Dim objE As New TbEmployee
                objE = dalE.getTbEmployeeByEMP_ID(TextBoxCMControl.Text)
                If Not objE Is Nothing Then
                    TextBoxCMControl.BackColor = Drawing.Color.White
                Else
                    createAlert("ไม่สามารถบันทึกข้อมูลได้ \n\n  กรุณาระบุข้อมูล CM ที่ดูแล ให้ครบถ้วน")
                    TextBoxCMControl.BackColor = Drawing.Color.Red
                    Exit Sub
                End If
            End If
        End If

        If ds1.Tables("customer").Rows.Count <= 0 Then
            createAlert("ไม่สามารถบันทึกข้อมูลได้ \n\n  กรุณาระบุ CIF ใน C/A")
            Exit Sub
        Else
            ' if have cif  but  approve  process  must check  rating value
            If CheckProcess("D", -1, True) = True And (jobTypeID <> "05" And jobTypeID <> "06") Then ' ถ้ามี process อนุมัต
                'Dim errRating As Boolean
                Dim errBuss As Boolean
                For i = 0 To ds1.Tables("customer").Rows.Count - 1
                    'Dim rvalue = ds1.Tables("customer").Rows(i).Item("RATING_KEY").ToString
                    'If rvalue = "" Or rvalue = "1" Or rvalue = "24" Or rvalue = "25" Then
                    '    errRating = True
                    '    GridCustomer.Rows(i).Cells(3).BackColor = Drawing.Color.Red
                    'End If

                    'Dim dvalue = ds1.Tables("customer").Rows(i).Item("RATING_DATE").ToString
                    'If dvalue = "" Then
                    '    errRating = True
                    '    GridCustomer.Rows(i).Cells(4).BackColor = Drawing.Color.Red
                    'End If
                    ' ตรวจสอบว่า group exposure เป็น 0 หรือไม่ ถ้าเป็น 0 rating ไม่ erorr



                    ' ตรวจสอบว่าเป็นการยกเลิกวงเงินหรือไม่ถ้าเป็นการยกเลิกวงเงินไม่ต้องใส่ rating ( กำหนดให้ rating ไม่ erorr )
                    ' ตรวจสอบทุก account ว่ามีการเลือกยกเลิกหรือไม่ ถ้า cif ใดเลือกยกเลิกไม่จำเป็นต่องใส่ rating 
                    Dim strCheck As Boolean = True
                    If ds1.Tables("acc").Rows.Count >= 1 Then
                        For y = 0 To ds1.Tables("acc").Rows.Count - 1
                            If ds1.Tables("customer").Rows(i).Item("cif") = ds1.Tables("acc").Rows(y).Item("cif") Then
                                Select Case ds1.Tables("acc").Rows(y).Item("SUBJECT_DETAIL_ID").ToString
                                    Case Is <> "104"  ' แสดงว่าเป็นการยกเลิกวงเงินของ cif นี้
                                        strCheck = False
                                End Select
                            End If
                        Next
                    End If
                    If strCheck = True Then   ' ถ้าเป็นเรื่องยกเลิกวงเงิน 104 ทุก record ใน account
                        '  errRating = False
                        '  GridCustomer.Rows(i).Cells(3).BackColor = Drawing.Color.White
                    End If

                    Dim bvalue = ds1.Tables("customer").Rows(i).Item("BUSS_TYPE_ID").ToString
                    If bvalue = "" Then
                        ' errRating = True
                        GridCustomer.Rows(i).Cells(3).BackColor = Drawing.Color.Red
                    End If

                Next

                'If errRating = True Then
                '    createAlert("ไม่สามารถบันทึกข้อมูลได้ \n\n  กรุณาระบุข้อมูล RATING ให้ครบถ้วน")
                '    Exit Sub
                'End If
                If errBuss = True Then
                    createAlert("ไม่สามารถบันทึกข้อมูลได้ \n\n  กรุณาระบุข้อมูล Bussiness Type ให้ครบถ้วน")
                    Exit Sub
                End If


            End If


        End If


        ' ส่วนนี้เป็นการเช็คว่าใส่ค่าใน credit value ครบหรือไม่ 
        ' เช็คในแต่ละแถวว่าใส่ค่าครบมั้ย เฉพาะเรื่องที่ต้องใส่วงเงิน
        ' เช็คเรื่องนี้ว่าต้องใส่วงเงินหรือไม่ ให้ดูใน database  annals_subject  จะมี field hasvalue ระบุ 1 ถ้ามี 0 ไม่มี
        ' ถ้ายังไม่ใช่ process จบ a , b   ต้องใส่ old value และ rm value
        ' ถ้าเป็น process จบ c,d,e  ต้องใส่ให้ครบ
        ' ถ้าเป็นโปรเซสเสนอบอร์ด  B070  ต้องใส่ให้  old value,rm value ,cm value (ยกเว้นบอรด)

        Dim dalSD As New AnnalsSubjectDetailDAL
        Dim objSD As New AnnalsSubjectDetail
        Dim dalSS As New AnnalsSubjectDAL
        Dim objSS As New AnnalsSubject

        If IsNothing(ds1.Tables("acc")) = False And ds1.Tables("acc").Rows.Count > 0 Then
            For i As Integer = 0 To ds1.Tables("acc").Rows.Count - 1
                Dim accMsg As String = ""
                Dim errOldValue As Integer = 0
                Dim errRMValue As Integer = 0
                Dim errCMValue As Integer = 0
                Dim errAPValue As Integer = 0

                With ds1.Tables("acc").Rows(i)
                    'MsgBox(IsDBNull(.Item("Value_Old")))
                    'MsgBox(.Item("Value_Old").GetType.ToString)
                    '  If IsDBNull(.Item("Value_Old")) = True Then
                    If .Item("SUBJECT_DETAIL_ID") <> "" Then
                        ' หาว่า subject detail นี้มี subject หลักอะไรและ ดูว่ามี hasValue ที่จะต้องเช้คค่าให้ครบหรือไม่
                        objSD = dalSD.getAnnalsSubjectDetailBySUBJECT_DETAIL_ID(.Item("SUBJECT_DETAIL_ID"))
                        objSS = dalSS.getAnnalsSubjectBySUBJECT_ID(objSD.SUBJECT_ID)
                        If objSS.HASVALUE = 2 Then    '  ถ้าเป็นเรื่องที่ต้องมีการกรอก Value   (=1)
                            If .Item("Value_Old").ToString = "" Then
                                errOldValue = 1
                                accMsg = "\n\n  กรุณาใส่ข้อมูล OLD  VALUE  ในข้อมูลเครดิตให้ครบถ้วน "
                            End If
                            If .Item("Value_Customer").ToString = "" Then
                                errRMValue = 1
                                accMsg += "\n\n  กรุณาใส่ข้อมูล  RM VALUE ในข้อมูลเครดิตให้ครบถ้วน"
                            End If
                            If CheckProcess("B070", -1) = True Then
                                If .Item("Value").ToString = "" Then
                                    errCMValue = 1
                                    accMsg += "\n\n  กรุณาใส่ข้อมูล CM VALUE  ในข้อมูลเครดิตให้ครบถ้วน"
                                End If
                            End If
                            If CheckProcess("C", -1, True) = True Or CheckProcess("D", -1, True) = True Or CheckProcess("E", -1, True) = True Then ' ถ้ามี process จบ
                                If .Item("Value").ToString = "" Then
                                    errCMValue = 1
                                    accMsg += "\n\n  กรุณาใส่ข้อมูล CM VALUE  ในข้อมูลเครดิตให้ครบถ้วน"
                                End If
                                If .Item("Value_Approve").ToString = "" Then
                                    errAPValue = 1
                                    accMsg += "\n\n  กรุณาใส่ข้อมูล  APPROVE VALUE ในข้อมูลเครดิตให้ครบถ้วน"
                                End If
                            End If
                            If accMsg.ToString.Length > 1 Then
                                accMsg = " ไม่สามารถบันทึกข้อมูลได้ " & accMsg
                                createAlert(accMsg)


                                ' Session("event") = "edit"
                                ' เอาโคดส่วนนี้ออกเนื่องจาก เมื่อทำการแสดง reccord ที่ใส่ข้อมูลผิดพลาดแล้ว มี error ที่ไม่สามารถหาเจอในตอนนี้จึงยังไม่ทำการแสดง grid ใน mode edit  ทำเพียงแค่แสดงสีที่ record
                                ' GridAnnalsCreditAccount.SelectedIndex = i
                                ' bindGridDetail(i, "acc")  

                                Dim nCell As Integer = 0  ' ตัวแปรนับในการเลื่อน cell

                                If errOldValue = 1 Then
                                    'Dim tbValue_Old As TextBox = GridAnnalsCreditAccount.Rows(i).FindControl("tbValue_Old")
                                    'tbValue_Old.BackColor = Drawing.Color.Red
                                    GridAnnalsCreditAccount.Rows(i).Cells(7).BackColor = Drawing.Color.Red
                                End If
                                If errRMValue = 1 Then
                                    'Dim tbValue_Customer As TextBox = GridAnnalsCreditAccount.Rows(i).FindControl("tbValue_Customer")
                                    'tbValue_Customer.BackColor = Drawing.Color.Red
                                    GridAnnalsCreditAccount.Rows(i).Cells(8).BackColor = Drawing.Color.Red
                                End If
                                If errCMValue = 1 Then
                                    'Dim tbValue As TextBox = GridAnnalsCreditAccount.Rows(i).FindControl("tbValue")
                                    'tbValue.BackColor = Drawing.Color.Red
                                    GridAnnalsCreditAccount.Rows(i).Cells(9).BackColor = Drawing.Color.Red
                                End If
                                If errAPValue = 1 Then
                                    'Dim tbValue_Approve As TextBox = GridAnnalsCreditAccount.Rows(i).FindControl("tbValue_Approve")
                                    'tbValue_Approve.BackColor = Drawing.Color.Red
                                    GridAnnalsCreditAccount.Rows(i).Cells(10).BackColor = Drawing.Color.Red
                                End If

                                Exit Sub
                            End If '          If accMsg <> "" Then
                        End If   '    If objSS.HASVALUE = 1 Then    '  ถ้าเป็นเรื่องที่ต้องมีการกรอก Value   (=1)   
                    End If '  If .Item("SUBJECT_DETAIL_ID") <> "" Then
                End With
            Next
        End If

        If ds1.Tables("acc").Rows.Count < 1 Then
            createAlert("ไม่สามารถบันทึกข้อมูลได้ \n\n   กรุณาใส่ข้อมูลเครดิต ")
            Exit Sub
        End If

        If CheckProcess("A010", 1) = False Then
            createAlert(" ไม่สามารถบันทึกข้อมูลได้ \n\n  กรุณาใส่ข้อมูลรับเรื่องเข้าในแถวแรก ")
            Exit Sub
        End If



        If ddlSendToBoard.Items(ddlSendToBoard.SelectedIndex).Value.ToString = "1" And (jobTypeID <> "05" And jobTypeID <> "06") Then ' ถ้าเป็นเรื่องเข้าบอร์ด และมีเลขหนังสือออกแล้ว
            If tbID_OUT.Text <> "" Then       '  ถ้ามีเลขหนังสือออกแล้ว
                If (CheckProcess("B070", 0)) = False And (CheckProcess("C", -1, True) = False) Then  ' เช็คว่ามีหรือไม่
                    createAlert("ไม่สามารถบันทึกข้อมูลได้ \n\n กรุณาใส่ข้อมูลขั้นตอน  สุดท้ายเป็นคืนเรื่อง หรือ อยู่ระหว่างขั้นตอนพิจรณาเสนอบอร์ด  ")
                    Exit Sub
                End If
            End If
            If CheckProcess("D", -1, True) = True Then  ' เช็คว่าเป็น process จบ               
                If tbID_OUT.Text <> "" And (DDLRequestApprove.SelectedValue = "" Or ddlComment.Items(ddlComment.SelectedIndex).Value = "") Then
                    createAlert("ไม่สามารถบันทึกข้อมูลได้ \n\n  กรุณาใส่ข้อมูลข้อมูล ผู้ขออนุมัติ ,ความเห็นผู้เสนอ ")
                    Exit Sub
                End If
            End If
        End If

        If ddlSendToBoard.Items(ddlSendToBoard.SelectedIndex).Value.ToString <> "1" And (jobTypeID <> "05" And jobTypeID <> "06") Then  '  ถ้าเป็นเรื่องไม่เข้าบอรด
            If tbID_OUT.Text <> "" Then         '  ถ้ามีเลขหนังสือออกแล้ว
                If CheckProcess("C", -1, True) = False And CheckProcess("D", -1, True) = False And CheckProcess("E", -1, True) = False Then  ' เช็คว่ามีหรือไม่               
                    createAlert("ไม่สามารถบันทึกข้อมูลได้ \n\n  กรุณาใส่ข้อมูลขั้นตอน อนุมัต,ไม่อนุมัติ,คืนเรื่อง  ")
                    Exit Sub
                End If
            End If
            If CheckProcess("D", -1, True) = True Then  ' เช็คว่าเป็น process อนุมัติหรือไม่     
                If tbID_OUT.Text <> "" And (DDLApprove1.SelectedValue = "") Then  ' ถ้ามีเลขหนังสือ แล้วไม่ใส่ emp ที่อนุมัต
                    createAlert("ไม่สามารถบันทึกข้อมูลได้ \n\n  กรุณาใส่ข้อมูลผู้อนุมัติ ")
                    Exit Sub
                End If
            End If
        End If

        If ddlSendToBoard.Items(ddlSendToBoard.SelectedIndex).Value = "" And (jobTypeID <> "05" And jobTypeID <> "06") Then
            createAlert("ไม่สามารถบันทึกข้อมูลได้ \n\n  Please select Type of approval authority (เลือกประเภทอำนาจอนุมัติ) ")
            REFERENCETextBox.Text = lblRefid.Text
            ddlSendToBoard.BackColor = Drawing.Color.Red
            Exit Sub
        Else
            ddlSendToBoard.BackColor = Drawing.Color.White
        End If


        If tbID.Text <> "" Then  ' กำหนดให้แสดงตัวเลือก covanant เฉพาะการ update เท่านั้น เพราะต้องอาศัยเลข id ของ ca

            If CheckProcess("D", -1, True) = True And (jobTypeID <> "05" And jobTypeID <> "06") Then ' ถ้ามี process อนุมัต
                If RadioCovenant.Checked = False And RadioNoCovenant.Checked = False And RadioOldCovenant.Checked = False Then
                    Flasher(PanelCovenant.ClientID)
                    createAlert("ไม่สามารถบันทึกข้อมูลได้ \n\n   กรุณาตอบเรื่อง Covenant ก่อน")
                    PanelCovenant.BackColor = Drawing.Color.Pink
                    PanelCovenant.Visible = True

                    Exit Sub
                Else
                    PanelCovenant.BackColor = Drawing.Color.White
                End If
            Else
                ' ถ้าไม่มี process อนุมัตกำหนดให้ radio covenant ไม่เช็ค
                RadioNoCovenant.Checked = False
                RadioCovenant.Checked = False
                Dim dalChC As New AnnalsCovenantDAL
                dalChC.deleteAnnalsCovenantByID(tbID.Text)
            End If

        End If


        If RadioNoCovenant.Checked Or RadioCovenant.Checked Then
            Dim dalChC As New AnnalsCovenantDAL
            Dim arrChc As New List(Of AnnalsCovenant)
            Dim sql As String = "Select  *   from  ANNALS_COVENANT  where  id='" & tbID.Text & "'  and  COVENANT_ACTION_ID <> 4"  ' อย่าลืมแก้ด้วยให้เป็น  STORE
            arrChc = dalChC.getAllAnnalsCovenantBySQL(sql)
            ' MsgBox(sql)
            If RadioNoCovenant.Checked Then  ' ถ้าเลือกไม่มี covenant 
                If arrChc.Count > 0 Then
                    createAlert("  ไม่สามารถบันทึกข้อมูลได้ \n\n  ท่านมีการกำหนด convenant ไว้ ต้องยกเลิก covenant ก่อน")
                    PanelCovenant.BackColor = Drawing.Color.Pink
                    Exit Sub
                End If
            End If

            If RadioCovenant.Checked Then   ' ถ้าเลือกมี convenat
                If arrChc.Count <= 0 Then
                    createAlert("  ไม่สามารถบันทึกข้อมูลได้ \n\n  ท่านยังไม่ได้กำหนด covenant ต้องกำหนด covenant ก่อน")
                    PanelCovenant.BackColor = Drawing.Color.Pink
                    RadioNoCovenant.Checked = True
                    Exit Sub
                End If
            End If
        End If


        If RadioOldCovenant.Checked Then  ' ถ้าเลือกให้ใช้ covenant เดิม  ต้องเช็คว่า cif ใน list มี covenant หรือไม่
            Dim strCIF As String = ""  ' เอาไว้ส่งค่า cif ไปหน้า convenant ในรูป (18,45,60)
            If Session("ds1").Tables("acc").Rows.Count > 0 Then    ' เช็คว่ามี cif
                Dim r As Integer = 0
                For i = 0 To Session("ds1").Tables("acc").Rows.Count - 1
                    'MsgBox(Session("ds1").Tables("acc").Rows(i).Item("cif"))
                    'MsgBox(strCIF)
                    If strCIF.LastIndexOf(Session("ds1").Tables("acc").Rows(i).Item("cif")) < 0 Then  ' ถ้าค้นหาแล้วยังไม่มีใน stringCIF ให้ เพิ่มเข้าไป
                        strCIF = strCIF & Session("ds1").Tables("acc").Rows(i).Item("cif")
                        strCIF = strCIF & ","
                    End If
                Next
                strCIF = strCIF.Remove(strCIF.Length - 1, 1)
                Dim dalChC As New AnnalsCovenantDAL
                Dim arrChc As New List(Of AnnalsCovenant)
                Dim sql As String = "Select  *   from  ANNALS_COVENANT  where  ( CIF  in (" & strCIF & ") and   id <> '" & tbID.Text & "'    ) and  COVENANT_ACTION_ID <> 4"  ' อย่าลืมแก้ด้วยให้เป็น  STORE
                arrChc = dalChC.getAllAnnalsCovenantBySQL(sql)
                If arrChc.Count <= 0 Then
                    createAlert("  ไม่สามารถบันทึกข้อมูลได้ \n\n   เนื่องลูกค้ายังไม่มี Covenant  เดิม")
                    PanelCovenant.BackColor = Drawing.Color.Pink
                    RadioNoCovenant.Checked = True
                    Exit Sub
                End If

            End If
        End If

        If (CheckProcess("D", 0, True) = True Or CheckProcess("B070", 0) = True) And (jobTypeID <> "05" And jobTypeID <> "06") Then  ' เช็คว่ามีเรื่องจบหรือไม่           

            PanelCheckNcb.Visible = True
            If CheckCusNcb() Then
                createAlert("  ไม่สามารถบันทึกข้อมูลได้ \n\n  เนื่องจากระบุข้อมูลการตรวจสอบ NCB ไม่ครบถ้วน")
                PanelCheckNcb.BackColor = Drawing.Color.Pink
                LabelStatusCheckNcb.Text = "ยังไม่ระบุข้อมูล"
                LabelStatusCheckNcb.BackColor = Drawing.Color.Red
                Exit Sub
            Else
                PanelCheckNcb.BackColor = Drawing.Color.White
                LabelStatusCheckNcb.Text = "ระบุข้อมูลเรียบร้อยแล้ว"
                LabelStatusCheckNcb.BackColor = Drawing.Color.White
            End If

        End If

        If (CheckProcess("D", 0, True)) = True And (jobTypeID <> "05" And jobTypeID <> "06") Then
            If RadioFloodBot.Checked = False And RadioNoFlood.Checked = False Then
                createAlert("ไม่สามารถบันทึกข้อมูลได้ \n\n  กรุณาระบุข้อมูลว่าเกี่ยวกับน้ำท่วมหรือไม่")
                Exit Sub
            End If
        End If
        If RadioFloodBot.Checked = True And checkConcernFlood(tbID.Text) = False Then ' ถ้าเลือกเกี่ยวกับ flood แต่ไม่พบข้อมูล flood
            createAlert("ไม่สามารถบันทึกข้อมูลได้ \n\n  เรื่องขาดข้อมูลเรื่องเกี่ยวกับน้ำท่วม")
            Exit Sub
        End If


        If ddlSendToBoard.Items(ddlSendToBoard.SelectedIndex).Value.ToString = "1" And (jobTypeID <> "05" And jobTypeID <> "06") Then ' ถ้าเป็นเรื่องเข้าบอร์ด  เลือกคณะกรรมการ
            If (CheckProcess("B070", 0) = True Or CheckProcess("D", 0, True) = True) Then  ' เช็คว่ามีเรื่องจบหรือไม่               
                If RadioButtonNoKFS.Checked = False And RadioButtonKFS.Checked = False Then  ' ถ้าไม่มีการระบุว่ามีเอกสาร kfs หรือไม่
                    createAlert("ไม่สามารถบันทึกข้อมูลได้ \n\n  กรุณาใส่ข้อมูลการทำ C/A บน KFS  ")
                    ' LabelMDoKFSFLAG.BackColor = Drawing.Color.Red
                    Exit Sub
                End If
            End If
            If CheckProcess("D", 0, True) = True Or CheckProcess("E", 0, True) = True Then  ' เช็คว่ามีเรื่องจบหรือไม่           
                'MsgBox(DropDownListSubCommittee1.Items(DropDownListSubCommittee1.SelectedIndex).Value)
                If DDLSubcommittee1.Items(DDLSubcommittee1.SelectedIndex).Value = "" Then
                    createAlert("  ไม่สามารถบันทึกข้อมูลได้ \n\n  ท่านยังไม่ได้กำหนด Sub committee 1 ")
                    DDLSubcommittee1.BackColor = Drawing.Color.Red
                    Exit Sub
                Else
                    DDLSubcommittee1.BackColor = Drawing.Color.White
                End If

                If DDLSubcommittee2.Items(DDLSubcommittee2.SelectedIndex).Value = "" Then
                    createAlert("  ไม่สามารถบันทึกข้อมูลได้ \n\n  ท่านยังไม่ได้กำหนด Sub committee 2 ")
                    DDLSubcommittee2.BackColor = Drawing.Color.Red
                    Exit Sub
                Else
                    DDLSubcommittee2.BackColor = Drawing.Color.White
                End If

                If DDLSubcommittee3.Items(DDLSubcommittee3.SelectedIndex).Value = "" Then
                    createAlert("  ไม่สามารถบันทึกข้อมูลได้ \n\n  ท่านยังไม่ได้กำหนด Sub committee 3 ")
                    DDLSubcommittee3.BackColor = Drawing.Color.Red
                    Exit Sub
                Else
                    DDLSubcommittee3.BackColor = Drawing.Color.White
                End If
            End If '      If CheckProcess("D", -1, True) = True Then ' ถ้ามี process อนุมัต
        End If  '        If ddlSendToBoard.Items(ddlSendToBoard.SelectedIndex).Value.ToString = "1" Then ' ถ้าเป็นเรื่องเข้าบอร์ด  เลือกคณะกรรมการ



        ' ============= 05/01/2010  หลังจากการอนุมัตให้เช็คว่าค่าที่ approve น้อยกว่าค่าที่เสนอหรือไม่ ถ้า น้อยกว่าให้ user  confirm ด้วย
        '============= REMARK วันที่ 12/02/2010 เนื่องจากใช้การบังคับให้ใส่ค่าใน value 

        'If tbID.Text <> "" Then
        '    Dim FlagAppValueLess As Boolean = False  ' ตั้งค่าเริ่มต้นให้ตัวแปร
        '    If CheckProcess("D", -1, True) = True Then ' ถ้ามี process อนุมัต
        '        If IsNothing(ds1.Tables("acc")) = False And ds1.Tables("acc").Rows.Count > 0 Then
        '            For i As Integer = 0 To ds1.Tables("acc").Rows.Count - 1
        '                If IsDBNull(ds1.Tables("acc").Rows(i).Item("Value_Approve")) = False Then
        '                    If IsDBNull(ds1.Tables("acc").Rows(i).Item("Value_Customer")) = True Then  ' ถ้าไม่มีการใส่ value customer 
        '                        FlagAppValueLess = True  ' กำหนดให้ตัวแปรที่เช็ค approve value ว่าน้อยกว่าหรือไม่มีค่าเป็น true
        '                    Else
        '                        If IsDBNull(ds1.Tables("acc").Rows(i).Item("Value_Approve")) = False And IsDBNull(ds1.Tables("acc").Rows(i).Item("Value_Customer")) = False Then
        '                            If ds1.Tables("acc").Rows(i).Item("Value_Approve") < ds1.Tables("acc").Rows(i).Item("Value_Customer") Then
        '                                FlagAppValueLess = True  ' กำหนดให้ตัวแปรที่เช็ค approve value ว่าน้อยกว่าหรือไม่มีค่าเป็น true
        '                            End If
        '                        End If
        '                    End If
        '                End If
        '            Next
        '        End If
        '        MsgBox(FlagAppValueLess)
        '        If FlagAppValueLess = True Then   ' ถ้ามีตัวที่น้อยกว่า
        '            If CheckConfirmApproveValue.Checked = False Then  ' ถ้ายังไม่มีการ confirm
        '                createAlert("  ไม่สามารถบันทึกข้อมูลได้ \n\n  จำนวนที่ Approve น้อยกว่าจำนวนที่เสนอ   \n\n กรุณายืนยันข้อมูล หรือ แก้ไขข้อมูลให้ถูกต้อง")
        '                PanelConfirmApproveValue.BackColor = Drawing.Color.Pink
        '                PanelConfirmApproveValue.Visible = True
        '                Exit Sub
        '            End If
        '        Else
        '            PanelConfirmApproveValue.BackColor = Drawing.Color.White
        '            PanelConfirmApproveValue.Visible = False
        '        End If
        '    End If
        'End If
        'Code check input error. 

        'If tbID_OUT.Text <> "" Then
        '    Replace(tbID_OUT.Text, "/", "")
        'End If



        Dim dalAnnals As New AnnalsDAL
        dalAnnals.getAllAnnals()

        Dim dal As New AnnalsCreditDAL ' Create object dal

        Dim objAnnals As New Annals
        objAnnals.ANNALS_TYPE = 1
        objAnnals.ANNALS_SEQ_NO = tbANNALS_SEQ_NO.Text
        objAnnals.ANNALS_YEAR = tbANNALS_YEAR.Text
        objAnnals.DATE_IN_ANNALS = DATE_IN_ANNALS_TextBox.Text
        objAnnals.REFERENCE = REFERENCETextBox.Text
        'objAnnals.RECIVER = RECIVERTextBox.Text
        objAnnals.RECIVER = " "
        objAnnals.SENDER = SENDERTextBox.Text
        objAnnals.HEADER = "เรื่องเกี่ยวกับสินเชื่อ"

        ' นำเอา reccored แรก บันทึก detail

        If IsNothing(ds1.Tables("acc")) = False And ds1.Tables("acc").Rows.Count > 0 Then
            ' SearchCif(ds1.Tables("acc").Rows(0).Item("cif"), "add")
        End If

        objAnnals.DETAIL = ""

        Dim obj As New AnnalsCredit ' Create object 
        obj.ID = tbID.Text
        obj.ANNALS_TYPE = tbANNALS_TYPE.Text
        obj.ANNALS_SEQ_NO = tbANNALS_SEQ_NO.Text
        obj.ANNALS_YEAR = tbANNALS_YEAR.Text
        obj.ID_OUT = tbID_OUT.Text
        obj.EMP_APPROVE_ID = DDLApprove1.SelectedValue
        obj.EMP_APPROVE2_ID = DDLApprove2.SelectedValue

        obj.EMP_APPROVE3_ID = DDLApprove3.SelectedValue    ' เพิ่มวันที่ 28/07/2009
        obj.EMP_APPROVE4_ID = DDLApprove4.SelectedValue     ' เพิ่มวันที่ 28/07/2009

        obj.EMP_REQUEST_ID = DDLRequestApprove.SelectedValue
        obj.BOARD_ID = ddlBOARD_ID.Items(ddlBOARD_ID.SelectedIndex).Value
        obj.Result = ddlResult.Items(ddlResult.SelectedIndex).Value
        obj.RM_ID = ""
        obj.DEP_ID = ""
        obj.Flag = ""
        obj.BRANCH_ID = tbBranch_ID.Text
        obj.REGION_ID = tbRegion_ID.Text
        obj.Others = tbOthers.Text
        obj.Others2 = tbOthers2.Text
        obj.Send_To_Board = ddlSendToBoard.Items(ddlSendToBoard.SelectedIndex).Value
        obj.Comment = ddlComment.Items(ddlComment.SelectedIndex).Value
        obj.CMJudgement = "0"  ' เอาออกไปอยู่ในส่วน  customer manage แทน
        obj.CMJudgementBoard = "0"
        obj.CMRemark = tbcm_remark.Text
        obj.Reason = tbReason.Text
        obj.Reason2 = tbReason2.Text
        obj.Job_Type_Id = DDLJobTypeId.Items(DDLJobTypeId.SelectedIndex).Value
        obj.SME_Referral_No = tbSME_Referral_No.Text & "/" & DDLReferalYear.SelectedValue
        obj.Customer_Size = DDLCustomer_Size.Items(DDLCustomer_Size.SelectedIndex).Value  ' เพิ่มวันที่ 29/06/2009

        If RadioCovenant.Checked = True Then
            obj.COVENANT_FLAG = "1"  ' เพิ่มวันที่ 29/09/2009
        End If
        If RadioNoCovenant.Checked = True Then
            obj.COVENANT_FLAG = "0"  ' เพิ่มวันที่ 29/09/2009
        End If
        If RadioOldCovenant.Checked = True Then
            obj.COVENANT_FLAG = "2"  ' เพิ่มวันที่ 20/07/2010
        End If


        If RadioButtonKFS.Checked = True Then
            obj.DO_KFS_FLAG = "1"  ' เพิ่มวันที่ 18/02/2010
        End If
        If RadioButtonNoKFS.Checked = True Then
            obj.DO_KFS_FLAG = "0"   ' เพิ่มวันที่ 18/02/2010
        End If



        obj.SUB_COMMITTEE_1 = DDLSubcommittee1.Items(DDLSubcommittee1.SelectedIndex).Value
        obj.SUB_COMMITTEE_2 = DDLSubcommittee2.Items(DDLSubcommittee2.SelectedIndex).Value
        obj.SUB_COMMITTEE_3 = DDLSubcommittee3.Items(DDLSubcommittee3.SelectedIndex).Value

        obj.OUT_OF_SCOPE_ID = DDLoutofscope.Items(DDLoutofscope.SelectedIndex).Value

        If tbGroupExposure.Text = "" Then
            obj.GROUP_EXPOSURE = -1
        Else
            obj.GROUP_EXPOSURE = ToDecimal(tbGroupExposure.Text)
        End If

        If ReveiwDateTextBox.Text = "" Then
            obj.REVIEW_DATE = Nothing
        Else
            obj.REVIEW_DATE = CDate(ReveiwDateTextBox.Text)
            '  obj.REVIEW_DATE = Convert.ToDateTime(ReveiwDateTextBox.Text).ToString("d")
        End If

        If TextBoxCMControl.Text = "" Then
            obj.EMP_CONTROL = ""
        Else
            obj.EMP_CONTROL = TextBoxCMControl.Text
        End If

        If RadioFloodBot.Checked = True Then
            obj.IS_FLOOD = 1
        ElseIf RadioNoFlood.Checked = True Then
            obj.IS_FLOOD = 0
        Else
            obj.IS_FLOOD = -1
        End If
        'MsgBox(obj.GROUP_EXPOSURE)
        'Dim cifDT As New DataTable
        'If ds1.Tables("customer").Rows.Count > 0 Then

        '    cifDT.Columns.Add("ID")
        '    cifDT.Columns.Add("CIF")
        '    cifDT.Columns.Add("RATING_KEY")
        '    cifDT.Columns.Add("RATING_DATE")


        '    For i = 0 To ds1.Tables("customer").Rows.Count - 1
        '        Dim newRow = cifDT.NewRow()
        '        newRow("ID") = tbID.Text
        '        newRow("CIF") = ds1.Tables("customer").Rows(i).Item("CIF")
        '        newRow("RATING_KEY") = ds1.Tables("customer").Rows(i).Item("RATING_KEY")
        '        newRow("RATING_DATE") = ds1.Tables("customer").Rows(i).Item("RATING_DATE")
        '        cifDT.Rows.Add(newRow)
        '    Next
        'End If



        'If CheckConfirmApproveValue.Checked = True Then
        '    obj.CONFIRMVALUE_FLAG = "1"  ' เพิ่มวันที่ 06/01/2010
        '    obj.CONFIRMVALUE_EMP = User.Identity.Name
        'Else
        '    obj.CONFIRMVALUE_FLAG = "0"  ' เพิ่มวันที่ 06/01/2010
        '    obj.CONFIRMVALUE_EMP = User.Identity.Name
        'End If

        Dim annals_id As String = ""
        Dim annals_id_show As String = ""
        Dim msg As String = ""
        'MsgBox(Session("eventMaster"))
        ' Try
        If Session("eventMaster") = "Add annals" Then
            annals_id = dal.InsertAnnalsCreditTransaction(obj, objAnnals, ds1.Tables("acc"), ds1.Tables("process"), ds1.Tables("customer"))
            annals_id_show = annals_id.Substring(1, 5) & "/" & annals_id.Substring(6, 4)
            msg = "  เพิ่มข้อมูลเรียบร้อยแล้ว   \n\n  หมายเลขหนังสือคือ : " & annals_id_show
            Dim log As New ClsLog
            log.InsertLog(3, Request.UserHostAddress, User.Identity.Name, annals_id)
        ElseIf Session("eventMaster") = "Update annals" Then
            'ทำการเช็คกรณีที่ระบุไม่เกี่ยวกับน้ำท่วม ถ้ายังไม่มี record ให้เพิ่ม record ที่มีข้อมูลไม่เกี่ยวกับน้ำท่วม
            'MsgBox(checkConcernFlood(tbID.Text))
            annals_id = dal.UpdateAnnalsCreditTransaction(obj, objAnnals, ds1.Tables("acc"), ds1.Tables("process"), Session("OldSender"), Session("OldReciever"), ds1.Tables("customer"))
            msg = "  บันทึกข้อมูลเรียบร้อยแล้ว  "
            Dim log As New ClsLog
            log.InsertLog(4, Request.UserHostAddress, User.Identity.Name, annals_id)
        End If
        'Catch sqlEx As SqlException
        '    If sqlEx.Number = -2 Then
        '        createAlert("เนื่องจากมี User ใช้งานระบบต่างๆบนเครื่อง Server Leader1 เป็นจำนวนมาก" _
        '            & vbCrLf & "ทำให้ไม่สามารถบันทึกข้อมูลได้ในขณะนี้" _
        '            & vbCrLf & "กรุณากดปุ่มบันทึกข้อมูลใหม่อีกครั้ง")
        '    Else
        '        createAlert(sqlEx.StackTrace)
        '    End If
        ' Catch ex As Exception
        'msg = ex.Message
        ' createAlert(msg)
        'Finally

        ClearGridDataset()
        Session("even") = Nothing
        Session("eventprocess") = Nothing
        Session("eventMaster") = Nothing
        If dupIDFlag = True Then
            ' ถ้าการเพิ่มเรียบร้อยและเป็นเรื่องที่เคยเข้ามาแล้ว
            createConfirm(msgDup, msg)
        Else
            createAlert(msg)
        End If

        'comment by big
        Search_Annals(annals_id)

        'Response.Redirect(Request.Url.AbsolutePath + "?annals_id=" + annals_id)
        'End Try

    End Sub
    Private Function ToDecimal(ByVal Value As String) As Decimal
        If Value.Length = 0 Then
            Return 0
        Else
            Return [Decimal].Parse(Value.Replace(",", ""), NumberStyles.AllowThousands Or NumberStyles.AllowDecimalPoint Or NumberStyles.AllowCurrencySymbol)

        End If
    End Function
    Protected Sub BtnCancelAnnals_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles BtnCancelAnnals.Click
        ' ยกเลิกหนังสือนี้
        Dim dal As New AnnalsCreditDAL
        dal.cancelAnnalsCredit(Request("annals_id").ToString, "เรื่องอื่นๆ", "เปลี่ยนจากหนังสือสินเชื่อเป็นหนังสือทั่วไป")

    End Sub

#End Region

#Region "Bind Dropdown Controls "

    Protected Sub BindDropDown2()


        Dim item As New ListItem
        item.Value = ""
        item.Text = "...โปรดเลือก..."
        'ddlSubject.Items.Insert(0, item)

        Dim dalBOARD_ID As New AnnalsBoardDAL
        Dim arrBOARD_ID As New List(Of AnnalsBoard)
        arrBOARD_ID = dalBOARD_ID.getAllAnnalsBoard
        ddlBOARD_ID.DataSource = arrBOARD_ID
        ddlBOARD_ID.DataValueField = "Id"
        ddlBOARD_ID.DataTextField = "Board"
        ddlBOARD_ID.DataBind()




        Dim dalProc As New AnnalsProcessDAL
        ddlResult.DataSource = dalProc.getListAnnalsProcessByGroupBoard
        ddlResult.DataValueField = "Process_id"
        ddlResult.DataTextField = "Process"
        ddlResult.DataBind()
        Dim itemR As New ListItem
        itemR.Value = ""
        itemR.Text = "...โปรดเลือก..."
        ddlResult.Items.Insert(0, itemR)

        Dim dalComment As New AnnalsProcessDAL
        ddlComment.DataSource = dalComment.getListAnnalsProcessByGroupComment
        ddlComment.DataValueField = "Process_id"
        ddlComment.DataTextField = "Process"
        ddlComment.DataBind()
        Dim itemC As New ListItem
        itemC.Value = ""
        itemC.Text = "...โปรดเลือก..."
        ddlComment.Items.Insert(0, itemC)

        Dim dalSubject As New AnnalsSubjectDAL
        Session("arrSubject") = dalSubject.getAllAnnalsSubject


        'Dim dalCmAdjudegment As New AnnalsJudgementDAL
        'ddlCMJudgement.DataSource = dalCmAdjudegment.getAllAnnalsJudgement
        ''ddlCMJudgement.DataValueField = "ID"
        'ddlCMJudgement.DataTextField = "Judgement"
        'ddlCMJudgement.DataBind()

        'ddlCMJudgementBoard.DataSource = dalCmAdjudegment.getAllAnnalsJudgement
        'ddlCMJudgementBoard.DataValueField = "ID"
        'ddlCMJudgementBoard.DataTextField = "Judgement"
        'ddlCMJudgementBoard.DataBind()

        ' ----- remark วันที่ 8/12/2008
        ''Dim itemCM1 As ListItem = New ListItem("...โปรดเลือก... ", "")
        ''Dim itemCM2 As ListItem = New ListItem("  สินเชื่อในอำนาจบุคคล  ", "False")
        ''Dim itemCM3 As ListItem = New ListItem("  สินเชื่อในอำนาจคณะกรรมการ กสช.  ", "True")

        ''ddlSendToBoard.Items.Insert(0, itemCM1)
        ''ddlSendToBoard.Items.Insert(1, itemCM2)
        ''ddlSendToBoard.Items.Insert(2, itemCM3)


        '----- เพิ่มวันที่ 8/12/2008
        '---- แก้ไขวันที่ 24 /02/2552   เพิ่ม status ใน annalsAuthority  เพื่อบอกว่าอำนาจใหนยกเลิก
        '------ 1 ใช้อยู่  0  ยกเลิก
        '------  ถ้าเป็นเข้าใหม่ยังไม่มี ID ให้แสดงเฉพาะยังไม่ยกเลิก =1 

        Dim DalAuthority As New AnnalsAuthorityDAL
        If Request.QueryString("Annals_id") = Nothing Then  ' เป็นของใหม่ไม่มี id
            Dim sql As String = "SELECT " _
             & "Authority_id, Authority, Priority " _
             & "FROM ANNALS_AUTHORITY " _
             & "WHERE Status=1" _
             & "ORDER BY Priority "
            ddlSendToBoard.DataSource = DalAuthority.getAllAnnalsAuthorityBySQL(sql)
        Else
            ddlSendToBoard.DataSource = DalAuthority.getAllAnnalsAuthority
        End If
        ddlSendToBoard.DataValueField = "Authority_id"
        ddlSendToBoard.DataTextField = "Authority"
        ddlSendToBoard.DataBind()

        Dim itemA As New ListItem
        itemA.Value = ""
        itemA.Text = "...โปรดเลือก..."
        ddlSendToBoard.Items.Insert(0, itemA)





        Dim dalPROCESS_ID As New AnnalsProcessDAL
        'Dim arrPROCESS_ID As New List(Of AnnalsProcess)
        Session("arrPROCESS_ID") = dalPROCESS_ID.getAllAnnalsProcess

        Dim dalDECB_RD_ID As New AnnalsGlTypeDAL
        'Dim arrDECB_RD_ID As New List(Of AnnalsGlType)
        Session("arrDECB_RD_ID") = dalDECB_RD_ID.getAllAnnalsGlType



        '----- เพิ่มวันที่ 26/11/2008
        Dim DalJobTypeId As New AnnalsJobTypeDAL
        DDLJobTypeId.DataSource = DalJobTypeId.getAllAnnalsJobType
        DDLJobTypeId.DataValueField = "Job_Type_Id"
        DDLJobTypeId.DataTextField = "Job_Type"
        DDLJobTypeId.DataBind()

        Dim itemJ As New ListItem
        itemJ.Value = ""
        itemJ.Text = "...โปรดเลือก..."
        DDLJobTypeId.Items.Insert(0, itemJ)


        ' ---- เพิ่มวันที่ 17/03/2009
        Dim dalProposal As New AnnalsProposalDAL
        'Dim arrDECB_RD_ID As New List(Of AnnalsGlType)
        Dim obP As New AnnalsProposal
        obP.PROPOSAL_ID = "00"
        obP.PROPOSAL_NAME = "...โปรดเลือก.."
        Dim arrP As New List(Of AnnalsProposal)
        arrP = dalProposal.getAllAnnalsProposal
        arrP.Insert(0, obP)
        Session("arrProposal") = arrP

        Dim intYear As Integer = Date.Now.Year
        If intYear > 2500 Then
            intYear = intYear - 543
        End If
        DDLReferalYear.Items.Insert(0, "")
        Dim CAYEAR As Integer = 2008
        For i = 0 To intYear - CAYEAR
            DDLReferalYear.Items.Insert(i + 1, intYear - i)
        Next

        ' ---- เพิ่มวันที่ 29/06/2009 
        ' เพิ่ม size ใน c/a
        ' ก่อนเพิ่มตรงนี้ ต้องไปเพิ่ม class dal และ model ใน appcode  รวมทั้งสร้าง table มารองรับด้วย

        Dim dalCustomerSmeSize As New CustomerSmeSizeDAL
        'Dim arrDECB_RD_ID As New List(Of AnnalsGlType)
        Dim obC As New CustomerSmeSize
        obC.SIZE_DETAIL = "...โปรดเลือก.."
        Dim arrC As New List(Of CustomerSmeSize)
        arrC = dalCustomerSmeSize.getAllCustomerSmeSize
        DDLCustomer_Size.DataSource = arrC
        DDLCustomer_Size.DataValueField = "Size_id"
        DDLCustomer_Size.DataTextField = "Size_Detail"
        DDLCustomer_Size.DataBind()



        Dim conn As SqlConnection = Nothing
        conn = ConnectionUtil.getSqlConnectionFromWebConfig()
        Dim sqlProgram As String = "SELECT * FROM ANNALS_PROGRAM  WHERE DEL_FLAG <> 1 ORDER BY PRIORITY DESC"
        Dim sqlCmd As New SqlCommand(sqlProgram, conn)

        Dim dr = sqlCmd.ExecuteReader(CommandBehavior.CloseConnection)
        Dim dt As New DataTable
        dt.Load(dr)
        Session("PROGRAM") = dt


    End Sub
    Protected Sub bindSubjectDetail(ByVal StrSubject As String)

        Dim dalSUBJECT_DETAIL_ID As New AnnalsSubjectDetailDAL
        'Dim arrSUBJECT_DETAIL_ID As New List(Of AnnalsSubjectDetail)
        Session("arrSUBJECT_DETAIL_ID") = dalSUBJECT_DETAIL_ID.getAllAnnalsSubjectDetailBySubjectID(StrSubject)

    End Sub
    Protected Sub bindDropDownAccount(ByVal CIF As String)

        Dim sql As String
        sql = "   SELECT Detail_ByAcc.ACCNO + '-' + convert(nvarchar(10),Detail_ByAcc.AccGL) + '-' + CIMfms.DECB_RD    as 'ACCNO_DESC' "
        sql += " , Detail_ByAcc.ACCNO + '-' + convert(nvarchar(10),Detail_ByAcc.AccGL)  as 'ACCNO' "
        sql += "  FROM   Detail_ByAcc  LEFT OUTER JOIN CIMfms ON Detail_ByAcc.AccGL = CIMfms.ACCGL "
        sql += "  WHERE Detail_ByAcc.cif = " & CIF
        sql += "  group by Detail_ByAcc.ACCNO + '-' + convert(nvarchar(10),Detail_ByAcc.AccGL) + '-' + CIMfms.DECB_RD  "
        sql += " , Detail_ByAcc.ACCNO + '-' + convert(nvarchar(10),Detail_ByAcc.AccGL) "

        ' Response.Write(sql)      
        Dim ds1 As DataSet = Session("ds1")
        Dim conn As System.Data.SqlClient.SqlConnection = Nothing
        Try
            Dim da As SqlDataAdapter = Nothing
            conn = ConnectionUtil.getSqlConnectionFromWebConfig()

            da = New SqlDataAdapter(sql, conn)

            Dim ds2 As New DataSet
            If IsNothing(ds1.Tables("ByAcc")) = False Then
                ds1.Tables.Remove("ByAcc")
            End If
            da.Fill(ds1, "ByAcc")

        Catch ex As Exception
        Finally
            conn.Close()
            conn = Nothing
        End Try
        Session("ds1") = ds1

    End Sub
    Protected Sub BindListCA()
        ' out of date

    End Sub
    Protected Sub BindAuthorized()


        Dim SqlRequest As New SqlDataSource
        SqlRequest.ConnectionString = ConfigurationManager.ConnectionStrings("Bay01ConnectionString").ToString
        SqlRequest.SelectCommand = "CLASSIFY.P_GET_LIST_AUTH_BY_KEY"
        SqlRequest.SelectCommandType = SqlDataSourceCommandType.StoredProcedure
        SqlRequest.SelectParameters.Add("CATE_KEY", "1203")

        DDLRequestApprove.DataSource = SqlRequest
        DDLRequestApprove.DataValueField = "EMP_ID"
        DDLRequestApprove.DataTextField = "EMP_NAME"
        DDLRequestApprove.DataBind()
        DDLRequestApprove.Items.Insert(0, New ListItem("...โปรดเลือก...", ""))

        Dim SqlApprove As New SqlDataSource
        SqlApprove.ConnectionString = ConfigurationManager.ConnectionStrings("Bay01ConnectionString").ToString
        SqlApprove.SelectCommand = "CLASSIFY.P_GET_LIST_AUTH_BY_KEY"
        SqlApprove.SelectCommandType = SqlDataSourceCommandType.StoredProcedure
        SqlApprove.SelectParameters.Add("CATE_KEY", "1204")

        DDLApprove1.DataSource = SqlApprove
        DDLApprove1.DataValueField = "EMP_ID"
        DDLApprove1.DataTextField = "EMP_NAME"
        DDLApprove1.DataBind()
        DDLApprove1.Items.Insert(0, New ListItem("...โปรดเลือก...", ""))

        DDLApprove2.DataSource = SqlApprove
        DDLApprove2.DataValueField = "EMP_ID"
        DDLApprove2.DataTextField = "EMP_NAME"
        DDLApprove2.DataBind()
        DDLApprove2.Items.Insert(0, New ListItem("...โปรดเลือก...", ""))

        DDLApprove3.DataSource = SqlApprove
        DDLApprove3.DataValueField = "EMP_ID"
        DDLApprove3.DataTextField = "EMP_NAME"
        DDLApprove3.DataBind()
        DDLApprove3.Items.Insert(0, New ListItem("...โปรดเลือก...", ""))

        DDLApprove4.DataSource = SqlApprove
        DDLApprove4.DataValueField = "EMP_ID"
        DDLApprove4.DataTextField = "EMP_NAME"
        DDLApprove4.DataBind()
        DDLApprove4.Items.Insert(0, New ListItem("...โปรดเลือก...", ""))


        Dim SqlSubcommittee As New SqlDataSource
        SqlSubcommittee.ConnectionString = ConfigurationManager.ConnectionStrings("Bay01ConnectionString").ToString
        SqlSubcommittee.SelectCommand = "CLASSIFY.P_GET_LIST_AUTH_BY_KEY"
        SqlSubcommittee.SelectCommandType = SqlDataSourceCommandType.StoredProcedure
        SqlSubcommittee.SelectParameters.Add("CATE_KEY", "1205")

        DDLSubcommittee1.DataSource = SqlSubcommittee
        DDLSubcommittee1.DataValueField = "EMP_ID"
        DDLSubcommittee1.DataTextField = "EMP_NAME"
        DDLSubcommittee1.DataBind()
        DDLSubcommittee1.Items.Insert(0, New ListItem("...โปรดเลือก...", ""))
        DDLSubcommittee1.Items.Add(New ListItem("ไม่มี", "0"))

        DDLSubcommittee2.DataSource = SqlSubcommittee
        DDLSubcommittee2.DataValueField = "EMP_ID"
        DDLSubcommittee2.DataTextField = "EMP_NAME"
        DDLSubcommittee2.DataBind()
        DDLSubcommittee2.Items.Insert(0, New ListItem("...โปรดเลือก...", ""))
        DDLSubcommittee2.Items.Add(New ListItem("ไม่มี", "0"))

        DDLSubcommittee3.DataSource = SqlSubcommittee
        DDLSubcommittee3.DataValueField = "EMP_ID"
        DDLSubcommittee3.DataTextField = "EMP_NAME"
        DDLSubcommittee3.DataBind()
        DDLSubcommittee3.Items.Insert(0, New ListItem("...โปรดเลือก...", ""))
        DDLSubcommittee3.Items.Add(New ListItem("ไม่มี", "0"))


        Dim SqlCM As New SqlDataSource
        SqlCM.ConnectionString = ConfigurationManager.ConnectionStrings("Bay01ConnectionString").ToString
        SqlCM.SelectCommand = "CLASSIFY.P_GET_LIST_EMP_RISK"
        SqlCM.SelectCommandType = SqlDataSourceCommandType.StoredProcedure
        Session("SqlCM") = SqlCM


    End Sub
    Protected Sub BindOutofScope()

        Dim SqlOut As New SqlDataSource
        SqlOut.ConnectionString = ConfigurationManager.ConnectionStrings("Bay01ConnectionString").ToString
        SqlOut.SelectCommand = "SELECT  * FROM  ANNALS_OUT_OF_SCOPE ORDER BY  PRIORITY"
        SqlOut.SelectCommandType = SqlDataSourceCommandType.Text


        DDLoutofscope.DataSource = SqlOut
        DDLoutofscope.DataValueField = "OUT_OF_SCOPE_ID"
        DDLoutofscope.DataTextField = "OUT_OF_SCOPE"
        DDLoutofscope.DataBind()
        DDLoutofscope.Items.Insert(0, New ListItem("...โปรดเลือก...", ""))



    End Sub


#End Region

#Region " Data set"

    Protected Sub CreateGridDataset()
        Dim ds1 As New DataSet()

        '--------- สร้าง table สำหรับ show 

        Dim dtable As New DataTable("acc")
        With dtable.Columns
            ' .Add("ID", System.Type.GetType("System.String"))
            .Add("Cif", System.Type.GetType("System.String"))
            .Add("ACCNO", System.Type.GetType("System.String"))
            .Add("PRODUCT_CODE", System.Type.GetType("System.String"))
            .Add("PROJECT_CODE", System.Type.GetType("System.String"))
            .Add("PROJECT_NAME", System.Type.GetType("System.String"))
            '.Add("NBRTHAI", System.Type.GetType("System.String"))
            .Add("PROPOSAL_ID", System.Type.GetType("System.String"))
            .Add("PROPOSAL_NAME", System.Type.GetType("System.String"))
            .Add("DECB_RD_ID", System.Type.GetType("System.String"))
            .Add("DECB_RD", System.Type.GetType("System.String"))
            '.Add("SUMLIMIT")
            ' .Add("SUMPRIN")
            ' .Add("SUMACCRU")
            ' .Add("SUMSUSP")
            '.Add("SUMAGING")
            .Add("SUBJECT_DETAIL_ID", System.Type.GetType("System.String"))
            .Add("SUBJECT_DETAIL", System.Type.GetType("System.String"))
            .Add("Value_Customer", System.Type.GetType("System.String"))
            .Add("Value_Old", System.Type.GetType("System.String"))
            .Add("Value", System.Type.GetType("System.String"))
            .Add("Value_Approve", System.Type.GetType("System.String"))
            .Add("Others", System.Type.GetType("System.String"))
            .Add("RM_ID", System.Type.GetType("System.String"))
            .Add("PROGRAM_ID", System.Type.GetType("System.String"))
            .Add("PROGRAM_NAME", System.Type.GetType("System.String"))
            .Add("PROJECT_ID", System.Type.GetType("System.String"))
            .Add("PRODUCT_ID", System.Type.GetType("System.String"))
            .Add("PRODUCT_NAME", System.Type.GetType("System.String"))

        End With
        ds1.Tables.Add(dtable)


        Dim addtable As New DataTable("addtable")
        With addtable.Columns
            ' .Add("ID", System.Type.GetType("System.String"))
            .Add("Cif", System.Type.GetType("System.String"))
            .Add("ACCNO", System.Type.GetType("System.String"))
            .Add("PRODUCT_CODE", System.Type.GetType("System.String"))
            .Add("PROJECT_CODE", System.Type.GetType("System.String"))
            .Add("PROJECT_NAME", System.Type.GetType("System.String"))
            '.Add("NBRTHAI", System.Type.GetType("System.String"))
            .Add("PROPOSAL_ID", System.Type.GetType("System.String"))
            .Add("PROPOSAL_NAME", System.Type.GetType("System.String"))
            .Add("DECB_RD_ID", System.Type.GetType("System.String"))
            .Add("DECB_RD", System.Type.GetType("System.String"))
            '.Add("SUMLIMIT", System.Type.GetType("System.Double"))
            '.Add("SUMPRIN", System.Type.GetType("System.Double"))
            '.Add("SUMACCRU", System.Type.GetType("System.Double"))
            ' .Add("SUMSUSP", System.Type.GetType("System.Double"))
            '.Add("SUMAGING", System.Type.GetType("System.Double"))
            .Add("SUBJECT_DETAIL_ID", System.Type.GetType("System.String"))
            .Add("SUBJECT_DETAIL", System.Type.GetType("System.String"))
            .Add("Value_Customer", System.Type.GetType("System.String"))
            .Add("Value_Old", System.Type.GetType("System.String"))
            .Add("Value", System.Type.GetType("System.String"))
            .Add("Value_Approve", System.Type.GetType("System.String"))
            .Add("Others", System.Type.GetType("System.String"))
            .Add("RM_ID", System.Type.GetType("System.String"))
            .Add("PROGRAM_ID", System.Type.GetType("System.String"))
            .Add("PROGRAM_NAME", System.Type.GetType("System.String"))
            .Add("PROJECT_ID", System.Type.GetType("System.String"))
            .Add("PRODUCT_ID", System.Type.GetType("System.String"))
            .Add("PRODUCT_NAME", System.Type.GetType("System.String"))


        End With

        Dim Addrow As DataRow = addtable.NewRow()
        Addrow("Cif") = ""
        Addrow("ACCNO") = ""
        Addrow("PRODUCT_CODE") = ""
        Addrow("PROJECT_CODE") = ""
        ' Addrow("NBRTHAI") = ""
        Addrow("PROPOSAL_ID") = ""
        Addrow("PROPOSAL_NAME") = ""
        Addrow("DECB_RD_ID") = ""
        Addrow("DECB_RD") = ""
        'Addrow("SUMLIMIT") = 0
        'Addrow("SUMPRIN") = 0
        'Addrow("SUMACCRU") = 0
        'Addrow("SUMSUSP") = 0
        'Addrow("SUMAGING") = 0
        Addrow("SUBJECT_DETAIL_ID") = ""
        Addrow("SUBJECT_DETAIL") = ""
        Addrow("Value_Customer") = ""
        Addrow("Value_Old") = ""
        Addrow("Value") = ""
        Addrow("Value_Approve") = ""
        Addrow("Others") = ""
        Addrow("RM_ID") = ""
        Addrow("PROGRAM_ID") = ""
        Addrow("PROGRAM_NAME") = ""
        Addrow("PROJECT_ID") = ""
        Addrow("PRODUCT_ID") = ""
        Addrow("PRODUCT_NAME") = ""


        addtable.Rows.Add(Addrow)
        ds1.Tables.Add(addtable)

        ' สร้าง dataset ของ process
        Dim Ptable As New DataTable("process")
        With Ptable.Columns
            .Add("User_id", System.Type.GetType("System.String"))
            .Add("Emp_id", System.Type.GetType("System.String"))
            .Add("Employee", System.Type.GetType("System.String"))
            .Add("Process_id", System.Type.GetType("System.String"))
            .Add("Process", System.Type.GetType("System.String"))
            .Add("Process_date", System.Type.GetType("System.DateTime"))
            .Add("Level_ID", System.Type.GetType("System.String"))

        End With
        ds1.Tables.Add(Ptable)

        Dim addPTable As New DataTable("addPtable")
        With addPTable.Columns
            .Add("User_id", System.Type.GetType("System.String"))
            .Add("Emp_id", System.Type.GetType("System.String"))
            .Add("Employee", System.Type.GetType("System.String"))
            .Add("Process_id", System.Type.GetType("System.String"))
            .Add("Process", System.Type.GetType("System.String"))
            .Add("Process_date", System.Type.GetType("System.DateTime"))
            .Add("Level_ID", System.Type.GetType("System.String"))

        End With
        Dim addProw As DataRow = addPTable.NewRow()
        addProw(0) = ""
        addProw(1) = ""
        addProw(2) = ""
        addProw(3) = ""
        addProw(4) = ""
        addProw(5) = Date.Now
        addProw(6) = ""

        addPTable.Rows.Add(addProw)
        ds1.Tables.Add(addPTable)

        ' สร้าง datatable ของ Customer information

        ' สร้าง dataset ของ process
        Dim CusTable As New DataTable("customer")
        With CusTable.Columns
            .Add("CIF", System.Type.GetType("System.String"))
            .Add("CIFNAME", System.Type.GetType("System.String"))
            .Add("RATING_KEY", System.Type.GetType("System.String"))
            .Add("RATING_DESC", System.Type.GetType("System.String"))
            .Add("RATING_DATE", System.Type.GetType("System.DateTime"))
            .Add("BUSS_TYPE_ID", System.Type.GetType("System.String"))
            .Add("BUSS_TYPE_DETAIL", System.Type.GetType("System.String"))

        End With

        ds1.Tables.Add(CusTable)

        Dim addCustTable As New DataTable("addCtable")
        With addCustTable.Columns
            .Add("CIF", System.Type.GetType("System.String"))
            .Add("CIFNAME", System.Type.GetType("System.String"))
            .Add("RATING_KEY", System.Type.GetType("System.String"))
            .Add("RATING_DESC", System.Type.GetType("System.String"))
            .Add("RATING_DATE", System.Type.GetType("System.DateTime"))
            .Add("BUSS_TYPE_ID", System.Type.GetType("System.String"))
            .Add("BUSS_TYPE_DETAIL", System.Type.GetType("System.String"))
        End With
        Dim addCustRow As DataRow = addCustTable.NewRow()
        addCustRow(0) = ""
        addCustRow(1) = ""
        addCustRow(2) = 0.0
        addCustRow(3) = ""

        addCustRow(5) = ""
        addCustRow(6) = ""

        addCustTable.Rows.Add(addCustRow)
        ds1.Tables.Add(addCustTable)

        ds1.AcceptChanges()
        Session("ds1") = ds1

    End Sub



    Protected Sub ClearGridDataset()

        Dim ds1 As DataSet = Session("ds1")

        ds1.Tables("acc").Rows.Clear()
        '   ds1.Tables("addtable").Rows.Clear()
        ds1.Tables("process").Rows.Clear()
        '   ds1.Tables("addPtable").Rows.Clear()
        ds1.Tables("customer").Rows.Clear()
        '   ds1.Tables("addPtable").Rows.Clear()


        ds1.AcceptChanges()
        Session("ds1") = ds1

    End Sub

#End Region

#Region "Pre"

    Protected Sub PreAdd()
        Label10.Text = " * * Add  all data  * *  "
        btnUpdate.Text = Label10.Text
        btnCancel.Enabled = False
        Session("eventMaster") = "Add annals"
        linkupload.Visible = False
        lblUpload.Visible = False
        SENDERTextBox.Text = Session.Item(SessionKeyConst.EMP_NAME) + ":" + Session.Item(SessionKeyConst.EMP_ID)
        btnIDOUT.Enabled = False
        PanelCovenant.Visible = False
        PanelFlood.Visible = False
        PanelCheckNcb.Visible = False
    End Sub
    Protected Sub PreUpdate()
        Label10.Text = " * * Update  all data  * *  "
        btnUpdate.Text = Label10.Text
        btnUpdate.Enabled = True
        btnCancel.Enabled = True
        Session("eventMaster") = "Update annals"
        linkupload.Visible = True
        lblUpload.Visible = True
        Dim s1 As String = String.Empty
        s1 += "window.open('../uploadfile/UploadFile.aspx"
        s1 += "?annals_id=" & tbID.Text
        linkupload.Attributes.Add("onclick", s1 & "','pop', 'width=1000, height=500,scrollbar=yes');")

        ' เช็คว่าเป็น admin เพื่อกำหนดสิทธ์ต่าง ๆ 

        If HttpCookieUtil.hasRolesId(Context.Request.Cookies(FormsAuthentication.FormsCookieName), RoleIdConst.A_ADMIN) = True Or _
           HttpCookieUtil.hasRolesId(Context.Request.Cookies(FormsAuthentication.FormsCookieName), RoleIdConst.R_ADMIN) = True Then
        Else
            If CheckProcessEndTimeOut() = True Then ' เช็คว่าหนังสือนี้หมดเวลาที่แก้ไขหรือยัง
                btnUpdate.Enabled = False
            Else
                btnUpdate.Enabled = True
            End If
            ' เช็คว่ามี process จบหรือไม่ หรือไม่    ถ้าจบแล้วให้เลือก อำนาจไม่ได้
            If CheckProcess("C", -1, True) = True Or CheckProcess("D", -1, True) = True Or CheckProcess("E", -1, True) = True Then
                ddlSendToBoard.Enabled = False
            Else
                ddlSendToBoard.Enabled = True
            End If
        End If

        ' MsgBox(" chekncb  search " & checkCusNcb())
        '  หน้านี้ใช้กรณี ที่ เป็นการ add และ edit  ในการ add จะดึง table 'addtable'  ถ้าเป็นแก้ไขดึง  'acc'
        If tbID.Text <> "" Then
            'PanelCovenant.Visible = CheckProcess("D", -1, True)  ' กำหนดให้แสดงหรือไม่แสดง panel covenant  / ถ้ามี process อนุมัติ ให้โชว
            If (CheckProcess("C", -1, True) = True Or CheckProcess("D", -1, True) = True Or CheckProcess("E", -1, True) = True) Or CheckProcess("B070", -1) = True Then
                ' MsgBox("show")
                PanelCheckNcb.Visible = True
                If CheckCusNcb() Then
                    PanelCheckNcb.BackColor = Drawing.Color.Pink
                    LabelStatusCheckNcb.Text = "ยังไม่ระบุข้อมูล"
                    LabelStatusCheckNcb.BackColor = Drawing.Color.Red
                Else
                    PanelCheckNcb.BackColor = Drawing.Color.White
                    LabelStatusCheckNcb.Text = "ระบุข้อมูลเรียบร้อยแล้ว"
                    LabelStatusCheckNcb.BackColor = Drawing.Color.White
                End If
            Else

            End If
        End If


        'MsgBox(CheckProcess("D", 0, True))


        ' MsgBox(PanelCheckNcb.Visible)

        ' ทำ Remark ไว้ 29/06/2009
        'check ว่ามี role admin หรือไม่

        'add by tam,5/08/ 2008

        'If HttpCookieUtil.hasRolesId(Context.Request.Cookies(FormsAuthentication.FormsCookieName), RoleIdConst.R_ADMIN) Then
        '    btnUpdate.Enabled = True
        'Else
        '    ddlSendToBoard.Enabled = False
        'End If



    End Sub
    Protected Sub ClearText()
        tbID.Text = ""
        tbANNALS_TYPE.Text = ""
        tbANNALS_SEQ_NO.Text = ""
        tbANNALS_YEAR.Text = ""

    End Sub


#End Region

#Region "Load "

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        ' check reference ที่ user กรอกว่ามีในหนังสือ ca หรือไม่  ถ้ามี  แสดง idและ process ล่าสุดกลับไป

        PanelMsg.Visible = False  ' ซ่อนไว้ก่อนยังไม่อยากเอาออก
        If Not IsPostBack Then
            If User.Identity.Name = "" Then  ' ถ้าเข้ามาครั้งแรกแล้วไม่มี user ให้ออกเลย
                'createAlert(" Don 't have user login or this is timeout.")
                'Response.Redirect(Page.ResolveUrl("~/aspx/account/LoginWithAD.aspx"))
                Response.Write("<script type='text/javascript'>window.close();</script>")
                Exit Sub
            Else
                lblUserID.Text = User.Identity.Name
            End If
            CreateGridDataset()
            BindDropDown2()
            BindAuthorized()
            BindOutofScope()
            Search_Annals(Request.QueryString("Annals_id"))
            'bindgridAcc() 




            'ReciverSearchImage.Attributes.Add("onclick", " var textValue= ele(""" + RECIVERTextBox.ClientID + """).value;" _
            '                                + " conLinePopup = window.open('" + Page.ResolveUrl("~/aspx/employee/controllingLine.aspx") + "?return_target_id=" + RECIVERTextBox.ClientID + "&source_id=" + RECIVERTextBox.ClientID + "','conLinePopup','toolbar=No,width=650,height=500,resizable=no,scrollbars=yes');" _
            '                                + " conLinePopup.focus();")


            SenderSearchImage.Attributes.Add("onclick", " conLinePopup = window.open('" + Page.ResolveUrl("~/aspx/appointment/searchRisk.aspx") + "?return_target_id=[""" + SENDERTextBox.ClientID + """]','conLinePopup','toolbar=No,width=650,height=500,resizable=no,scrollbars=yes');" _
                                            + " conLinePopup.focus();")



            DATE_IN_ANNALS_TextBox.Attributes.Add("onkeypress", "this.blur();")  ' set textbox to readonly       
            ReveiwDateTextBox.Attributes.Add("onkeypress", "this.blur();")
            'DATE_IN_ANNALS_TextBox.Style("cursor") = "pointer"
            'ReveiwDateTextBox.Style("cursor") = "pointer"

            imgClearReviewDate.Style("cursor") = "pointer"
            imgClearAnnalsDate.Style("cursor") = "pointer"

            ' กำหนดให้แสดงเลือกสายงาน
            Dim SCM As String = Nothing
            SCM += "window.open('../employee/CMControllingTree.aspx"
            SCM += "?returnIdTarget=" & TextBoxCMControl.ClientID & "&returnIdProp=value"
            SCM += "&returnDetailTarget=" & LabelCMControlDetail.ClientID & "&returnDetailProp=value"
            ImageButtonCMControl.Attributes.Add("onclick", SCM & "','pop', 'width=500,height=500,resizable=yes,status=1,scrollbars=1');")
            ImageButtonCMControl.Style("cursor") = "pointer"   ' auto,crosshair ,default,pointer,help,move,Text,wait, e(-resize, w - resize, n - resize, s - resize, ne - resize, nw - resize, se - resize, sw - resize)
            'ImageButtonCMControl.Attributes.Add("onfocus", "this.blur();")  ' set textbox to readonly

            'CMControllingTree.aspx?returnIdTarget=ctl00_ContentPlaceHolder2_FormView1_CM_CODE_ID&returnIdProp=value&returnDetailTarget=ctl00_ContentPlaceHolder2_FormView1_CM_CODE_NAME&returnDetailProp=value



            'RadioNoCovenant.Attributes.Add("onclick", "alert(this);")
            'RadioCovenant.Attributes.Add("onclick", "alert(this);")




            ' ============================================= ** * *  ส่วนการเช็คสิทของ USER
            If User.IsInRole(RoleIdConst.R_ADMIN) Then
                BtnCancelAnnals.Visible = True
                BtnCancelAnnals.Attributes.Add("onclick", "return confirm('Are you sure?');")

            Else
                BtnCancelAnnals.Visible = False
            End If

            BtnClose.Attributes.Add("onclick", "window.close();")

            If HttpCookieUtil.hasRolesId(Context.Request.Cookies(FormsAuthentication.FormsCookieName), RoleIdConst.A_READ_ONLY) Then
                btnUpdate.Visible = False
                btnIDOUT.Visible = False
            Else
                btnUpdate.Visible = True
                btnIDOUT.Visible = True
            End If

            'preAddDetail()
            ' showdata()
            ' btnDelete.Attributes.Add("onclick", "return confirm('Do you want to delete this data?');")
            'TBCif.Attributes.Add("OnKeyUp", "updateText(this,'TBCifName')")
            'Button2.OnClientClick = "return false"
            ' Button2.Attributes.Add("Onclick", "updateText('TBCif','TBCifName');updateDDL('TBCif','ddlAccount');return false;")
        Else   ' ถ้าครั้งที่สองขึ้นไปแล้ว ds1 หายให้แจ้งเตือน
            If IsNothing(Session("ds1")) = True Then
                Response.Write("<script type='text/javascript'>alert('Server time out. Please login again.');</script>")
                Response.Write("<script type='text/javascript'>window.close();</script>")
            End If
        End If

        ' สร้าง link ปุ่มบันทึก covenant

        If IsNothing(Session("ds1")) = True Then
            Exit Sub
        End If

        ' สร้าง link ไปเพิ่ม covenant โดย ส่ง query string cif  ทุก  cif  ไปยังหน้า covenant ด้วย  
        ' sub นี้ทำทุกครั้งที่มีค่าใน grid 
        ' เพิ่มการเช็คว่า ข้อมูลการตรวจสอบ ncb ในแต่ละรายครบหรือยัง

        Dim strCIF As String = ""  ' เอาไว้ส่งค่า cif ไปหน้า convenant ในรูป (18,45,60)
        Dim cif As String = ""
        If Session("ds1").Tables("acc").Rows.Count > 0 Then
            Dim r As Integer = 0
            For i = 0 To Session("ds1").Tables("acc").Rows.Count - 1
                'MsgBox(Session("ds1").Tables("acc").Rows(i).Item("cif"))
                'MsgBox(strCIF)
                cif = Session("ds1").Tables("acc").Rows(i).Item("cif")
                If strCIF.LastIndexOf(Session("ds1").Tables("acc").Rows(i).Item("cif")) < 0 Then  ' ถ้าค้นหาแล้วยังไม่มีใน stringCIF ให้ เพิ่มเข้าไป
                    strCIF = strCIF & cif
                    strCIF = strCIF & ","
                End If

            Next
            Dim strID As String = tbID.Text
            If strID = "" Then
                If Request("id") <> "" Then
                    strID = Request("id")
                End If
            End If


            strCIF = strCIF.Remove(strCIF.Length - 1)
            Dim SCov As String = Nothing
            SCov += "window.open('AnnalsCovenant.aspx"
            SCov += "?cif=" & strCIF
            SCov += "&id=" & strID
            SCov += "&update=true"
            ImgAddCovenant.Attributes.Add("onclick", SCov & "','pop', 'width=1000,resizable=yes,status=1,scrollbars=1');")
            ImgAddCovenant.Style("cursor") = "pointer"   ' auto,crosshair ,default,pointer,help,move,Text,wait, e(-resize, w - resize, n - resize, s - resize, ne - resize, nw - resize, se - resize, sw - resize)


            Dim Sncb As String = Nothing
            Sncb += "window.open('AnnalsCusNCB.aspx"
            Sncb += "?id=" & strID
            ImgAddCheckNcb.Attributes.Add("onclick", Sncb & "','pop', 'width=900,height=500,resizable=yes,status=1,scrollbars=1');")
            ImgAddCheckNcb.Style("cursor") = "pointer"   ' auto,crosshair ,default,pointer,help,move,Text,wait, e(-resize, w - resize, n - resize, s - resize, ne - resize, nw - resize, se - resize, sw - resize)


            'Dim Sflood As String = Nothing
            'Sflood += "window.open('AnnalsCreditFlood.aspx"
            'Sflood += "?ID=" & strID
            'Sflood += "&EMP_ID=" & Session("EMP_ID")
            'ImageAddFlood.Attributes.Add("onclick", Sflood & "','pop', 'width=600,height=200,resizable=yes,status=1,scrollbars=1');")
            'ImageAddFlood.Style("cursor") = "pointer"   ' auto,crosshair ,default,pointer,help,move,Text,wait, e(-resize, w - resize, n - resize, s - resize, ne - resize, nw - resize, se - resize, sw - resize)


            Dim SfloodBot As String = Nothing
            SfloodBot += "window.open('AnnalsCreditFloodBOT.aspx"
            SfloodBot += "?ID=" & strID
            SfloodBot += "&EMP_ID=" & Session("EMP_ID")
            ImageAddFloodBOT.Attributes.Add("onclick", SfloodBot & "','pop', 'width=1100,height=400,resizable=yes,status=1,scrollbars=1');")
            ImageAddFloodBOT.Style("cursor") = "pointer"   ' auto,crosshair ,default,pointer,help,move,Text,wait, e(-resize, w - resize, n - resize, s - resize, ne - resize, nw - resize, se - resize, sw - resize)


        End If


    End Sub
    Public Enum ColNo  ' ต้องมี column ให้ตรงกับ dataset  gridaccount ( ดูใน #dataset )
        Cif
        ACCNO
        PRODUCT_CODE
        PROJECT_CODE
        PROJECT_NAME
        'NBRTHAI
        PROPOSAL_ID
        DECB_RD_ID
        'SUMLIMIT
        'SUMPRIN
        'SUMACCRU
        'SUMSUSP
        'SUMAGING
        SUBJECT_DETAIL_ID
        Value_Customer
        Value_Old
        Value
        Value_Approve
        Others
        SUBJECT_DETAIL
        DECB_RD
        RM_ID
        PRODUCT_NAME
        PROGRAM_ID
        PROGRAM_NAME

    End Enum
    Protected Sub tbID_OUT_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles tbID_OUT.Load
        tbID_OUT.Attributes.Add("onfocus", "this.blur();")  ' set textbox to readonly
    End Sub
    Protected Sub tbGridCif_Load(ByVal sender As Object, ByVal e As System.EventArgs)
        If User.IsInRole(RoleIdConst.R_ADMIN) Then
            DirectCast(sender, TextBox).Enabled = True
        End If
    End Sub
#End Region

#Region "Other"

    Protected Sub createAlert(ByVal str As String)

        ' Response.Write("<script language=""javascript"">alert(""" & str & """)</script>")
        str = "alert(""" & str & """);"
        Page.ClientScript.RegisterStartupScript(Me.GetType(), "messagebox", str, True)

    End Sub
    Protected Sub createConfirm(ByVal strConfirm As String, ByVal strAlert As String)

        ' Response.Write("<script language=""javascript"">alert(""" & str & """)</script>")
        Dim Str As String = "alert(""" & strConfirm & """);"
        Str += "alert(""" & strAlert & """);"
        Page.ClientScript.RegisterStartupScript(Me.GetType(), "messagebox", Str, True)

    End Sub



    Protected Sub Flasher(ByVal objid As String)

        Dim Str As String = " timerId = setInterval(flasher,1000);"

        Page.ClientScript.RegisterStartupScript(Me.GetType(), "flasher", Str, True)

    End Sub

#End Region

    '#Region "check reference"

    '    Private Sub regisReferenceValidate()
    '        regisIsDuplcateKeyCallback()
    '        regisIsDuplcateKeyHandle()
    '        regisIsDuplcateKeyErrorHandle()
    '    End Sub

    '    Private Sub regisIsDuplcateKeyHandle()
    '        Dim script As String = "function IsDuplcateKeyHandle(result, context){" _
    '                                    & "var ele = document.getElementById(context);" _
    '                                    & "if (result=='false'){" _
    '                                        & "ele.innerText = '' ;" _
    '                                    & "}else{" _
    '                                        & "ele.innerText = 'เลขที่อ้างอิงนี้เคยถูกอ้างถึงแล้วใน ca:'+result;" _
    '                                        & "var chk = confirm('ยืนยันการใช้เลขที่อ้างอิงนี้');" _
    '                                        & "if (chk){" _
    '                                            & "document.getElementById('ValidateResultLabel').innerText = '';" _
    '                                        & "}" _
    '                                    & "}" _
    '                                & "}"

    '        Page.ClientScript.RegisterClientScriptBlock(Me.GetType(), "IsDuplcateKeyHandle", script, True)
    '    End Sub

    '    Private Sub regisIsDuplcateKeyErrorHandle()
    '        Dim script As String = "function IsDuplcateKeyErrorHandle(result, context){" _
    '                                    & "alert('IsDuplcateKeyHandleErrorHandle : ' + result);" _
    '                                & "}"

    '        Page.ClientScript.RegisterClientScriptBlock(Me.GetType(), "IsDuplcateKeyErrorHandle", script, True)
    '    End Sub

    '    ''' <summary>
    '    ''' Callback นี้ต้อง regis หลังจาก REFERENCETextBox ถูกสร้างแล้วเท่านั้น
    '    ''' </summary>
    '    ''' <remarks></remarks>
    '    Private Sub regisIsDuplcateKeyCallback()
    '        REFERENCETextBox.Attributes.Add("onblur", "IsDuplcateKey(this.value,'" & ValidateResultLabel.ClientID & "');")
    '        Dim callBack As String = Page.ClientScript.GetCallbackEventReference(Me, "arg", "IsDuplcateKeyHandle", "context", "IsDuplcateKeyErrorHandle", True)
    '        Dim clientFunction As String = "function IsDuplcateKey(arg, context){ " & callBack & "; }"
    '        Page.ClientScript.RegisterClientScriptBlock(Me.GetType(), "IsDuplcateKey", clientFunction, True)
    '    End Sub

    '    Public Sub RaiseCallbackEvent(ByVal eventArgument As String) Implements System.Web.UI.ICallbackEventHandler.RaiseCallbackEvent
    '        Dim dal As New AnnalsDAL()

    '        Dim idByRef = dal.getIdByReference(eventArgument)

    '        'ถ้า idByRef ไม่มีค่าแสดงว่า ไม่เคยมี reference นี้มาก่อน
    '        If idByRef.Equals(String.Empty) Then
    '            isDuplcateCallback = "false"
    '            Exit Sub
    '        End If

    '        'ถ้า idByRef มีค่าต้องเช็คว่ามีค่าตรงกับ ID หรือไม่
    '        'ถ้าไม่ตรงแสดงว่า dup
    '        If tbID.Text.Trim.Length > 0 Then
    '            If tbID.Text.Equals(idByRef) Then
    '                isDuplcateCallback = "false"
    '            Else
    '                isDuplcateCallback = idByRef

    '            End If
    '        Else
    '            'ถ้า tbID ไม่มีค่า แสดงว่าเป็นการ new
    '            isDuplcateCallback = idByRef
    '        End If


    '    End Sub

    '    Public Function GetCallbackResult() As String Implements System.Web.UI.ICallbackEventHandler.GetCallbackResult
    '        Return isDuplcateCallback
    '    End Function
    '#End Region

    '#Region "ReferenceTextBox Evet"
    '    Protected Sub REFERENCETextBox_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles REFERENCETextBox.Load
    '        ' If Not Page.IsPostBack Then
    '        'regisReferenceValidate()   '  remark เมื่อวันที่ 29/01/2010  ไม่ต้องเช็คค่าซ้ำ
    '        'End If
    '    End Sub
    '    Protected Sub btnUpdate_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnUpdate.Load
    '        ' DirectCast(sender, Button).OnClientClick = "if(e('" + ValidateResultLabel.ClientID + "').innerText  == ''){} else {alert('เลขที่หนังสือนี้เคยถูกอ้างถึงแล้ว');return false;}"
    '        ' Remark  January 10 , 2010
    '    End Sub
    '#End Region

#Region "CheckProcess"

    Function CheckProcess(ByVal StrProcess As String, ByVal IntPoint As Integer, Optional ByVal SubFirstChar As Boolean = False) As Boolean
        ' เช็คค่า process ว่ามีหรือไม่ โดย  strProcess แทน id ของ process นั้น และ intPoint คือตำแหน่งที่ต้องการเช็ค
        ' ถ้า intpoint เป็น 0 คือ มีที่ตำแหน่งใดก็ได้ ถ้าเป็นเลขอื่นต้อง มีตามตำแหน่งที่ระบุ
        ' ถ้า intpoint เป็น -1 คือ เช็ค โปรเซสสุดท้าย
        ' ถ้าเป็น false ไม่มี  True มีแล้ว

        If Session("ds1") Is Nothing Then Exit Function
        Dim ds1 As DataSet = Session("ds1")
        Dim str As String = False
        If ds1.Tables("process").Rows.Count >= 1 Then
            If IntPoint = 0 Then

                If SubFirstChar = True Then
                    For i As Integer = 0 To ds1.Tables("process").Rows.Count - 1
                        'MsgBox("process=" & ds1.Tables("process").Rows(i).Item("PROCESS_ID").ToString.Substring(0, 1) & ":" & "check=" & StrProcess.Substring(0, 1))
                        If ds1.Tables("process").Rows(i).Item("PROCESS_ID").ToString.Substring(0, 1) = StrProcess.Substring(0, 1) Then
                            str = True
                            Exit For
                        End If
                    Next
                Else
                    For i As Integer = 0 To ds1.Tables("process").Rows.Count - 1
                        'MsgBox(ds1.Tables("process").Rows(i).Item("PROCESS_ID"))
                        If ds1.Tables("process").Rows(i).Item("PROCESS_ID") = StrProcess Then
                            str = True
                            Exit For
                        End If
                    Next
                End If
            ElseIf IntPoint = -1 Then

                If SubFirstChar = False Then
                    If ds1.Tables("process").Rows(ds1.Tables("process").Rows.Count - 1).Item("PROCESS_ID") = StrProcess Then
                        str = True
                    End If
                Else
                    ' MsgBox(ds1.Tables("process").Rows(ds1.Tables("process").Rows.Count - 1).Item("PROCESS_ID").ToString.Substring(0, 1))
                    If ds1.Tables("process").Rows(ds1.Tables("process").Rows.Count - 1).Item("PROCESS_ID").ToString.Substring(0, 1) = StrProcess.ToString.Substring(0, 1) Then
                        str = True
                    End If
                End If
            Else

                If SubFirstChar = False Then
                    If ds1.Tables("process").Rows(IntPoint - 1).Item("PROCESS_ID") = StrProcess Then
                        str = True
                    End If
                Else
                    If ds1.Tables("process").Rows(IntPoint - 1).Item("PROCESS_ID").ToString.Substring(0, 1) = StrProcess.Substring(0, 1) Then
                        str = True
                    End If
                End If
            End If
        End If
        '  MsgBox(StrProcess & " " & str)
        Return CBool(str)
    End Function
    Function CheckProcessEndTimeOut() As Boolean
        Dim ds1 As DataSet = Session("ds1")
        Dim str As String = False
        If ds1.Tables("process").Rows.Count >= 1 Then
            If (CheckProcess("C", -1, True) = True Or CheckProcess("D", -1, True) = True Or CheckProcess("E", -1, True) = True) And (Month(Date.Now) - Month(ds1.Tables("process").Rows(ds1.Tables("process").Rows.Count - 1).Item("PROCESS_DATE")) > 1) Then
                Return True
            Else
                Return False
            End If
        End If
    End Function

#End Region

    Function CheckCusNcb() As Boolean
        ' เพิ่มการเช็คว่ามีการระบุการตรวจสอบ ncb ในแต่ละ cif หรือยัง  7/09/2010
        Dim objNcb As New VAnnalsCusNcb
        Dim dalNcb As New VAnnalsCusNcbDAL
        Dim errCheckNcb As Boolean = False
        If tbID.Text <> "" Then  ' ถ้ามีเลข id แล้ว

            If Session("ds1").Tables("acc").Rows.Count > 0 Then    ' เช็คว่ามี cif  จาร dataset
                For i = 0 To Session("ds1").Tables("acc").Rows.Count - 1

                    objNcb.CIF = Session("ds1").Tables("acc").Rows(i).Item("cif")
                    objNcb.ID = tbID.Text
                    'MsgBox("cif=" & objNcb.CIF & ",id=" & objNcb.ID & ",detail=" & objNcb.CUS_NCB_TYPE_DETAIL_ID)
                    Dim objSerch As New VAnnalsCusNcb
                    objSerch = dalNcb.getVAnnalsCusNcbByID(objNcb)
                    'MsgBox("cif=" & objSerch.CIF & ",id=" & objSerch.ID & ",detail=" & objSerch.CUS_NCB_TYPE_DETAIL_ID)
                    'MsgBox(objSerch.CUS_NCB_TYPE_DETAIL_ID)
                    If objSerch.CUS_NCB_TYPE = "" Then
                        errCheckNcb = True   '  ถ้ายังไม่ระบุข้อมูล ncb ให้กำหนดค่า error
                    End If
                    objSerch = Nothing
                Next
            End If

            'If GridAnnalsCreditAccount.Rows.Count >= 1 Then
            '    For i = 0 To GridAnnalsCreditAccount.Rows.Count - 1
            '        Dim lblGridCif As Label = GridAnnalsCreditAccount.Rows(i).FindControl("lblGridCif")
            '        MsgBox(lblGridCif.Text)
            '    Next
            'End If

        Else
        End If

        Return errCheckNcb
    End Function

    Function CheckAccountCredit() As Boolean
        Dim strCheck As Boolean = False
        If Session("ds1") Is Nothing Then Exit Function
        Dim ds1 As DataSet = Session("ds1")
        If ds1.Tables("acc").Rows.Count >= 1 Then
            For i = 0 To ds1.Tables("acc").Rows.Count - 1
                Select Case ds1.Tables("acc").Rows(i).Item("SUBJECT_DETAIL_ID").ToString
                    Case "101", "102", "103", "104", "105", "114", "115", "701"
                        strCheck = True
                End Select
            Next
        End If
        'MsgBox(strCheck)
        Return strCheck
    End Function

#Region "ID out"
    Protected Sub btnIDOUT_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnIDOUT.Click
        ' MsgBox(Session("event"))
        If Session("eventprocess") = "updateprocess" Then
            createAlert(" ไม่สามารถออกเลขหนังสือได้ \n\n   มีการเปลี่ยนแปลงข้อมูล process  \n\n  กรุณาเลือก Update ข้อมูลก่อนการออกเลขหนังสือ")
            Exit Sub
        End If

        ' เช็คว่ามีข้อมูล credit account หรือไม่

        If Session("ds1") Is Nothing Then Exit Sub
        Dim ds1 As DataSet = Session("ds1")
        If IsNothing(ds1.Tables("acc")) = False And ds1.Tables("acc").Rows.Count <= 0 Then
            'SearchCif(ds1.Tables("acc").Rows(0).Item("cif"), "add")
            createAlert(" ไม่สามารถออกเลขหนังสือได้ \n\n   กรุณาใส่ข้อมูลเครดิตให้ครบถ้วน")
            Exit Sub
        End If
        ' เช็คว่ามีข้อมูลเสนอบอร์ด( คณะกรรมการหรือไม่ ) หรือไม่ 
        ' ถ้าเป็นเรื่องเข้าบอร์ดต้องมี process เสนอบอร์ด  หรือเป็นเรื่องจบ
        If ddlSendToBoard.Items(ddlSendToBoard.SelectedIndex).Value.ToString = "1" Then
            If tbID_OUT.Text = "" And (CheckProcess("B070", -1) = False And CheckProcess("C", -1, True) = False) Then
                createAlert(" ไม่สามารถออกเลขหนังสือได้ \n\n  กรุณาใส่ข้อมูล processสุดท้ายเป็น อยู่ระหว่างขั้นตอนพิจรณาเสนอบอร์ด  ")
                Exit Sub
            End If
            If DDLRequestApprove.SelectedValue = "" Or ddlComment.Items(ddlComment.SelectedIndex).Value = "" Then
                createAlert(" ไม่สามารถออกเลขหนังสือได้ \n\n  กรุณาใส่ข้อมูลข้อมูล ผู้ขออนุมัติ ,ความเห็นผู้เสนอ ")
                Exit Sub
            End If
            ' เช็คว่ามีข้อมูลเสนอบอร์ด( คณะกรรมการหรือไม่ ) หรือไม่ 
            ' ถ้าเป็นเรื่องอนุมัติต้องเมีเรื่องจบ  cancel reject หรือ อนุมัติ
        ElseIf ddlSendToBoard.Items(ddlSendToBoard.SelectedIndex).Value.ToString = "0" Then
            If tbID_OUT.Text = "" And (CheckProcess("C", -1, True) = False And CheckProcess("D", -1, True) = False And CheckProcess("E", -1, True) = False) Then
                createAlert(" ไม่สามารถออกเลขหนังสือได้ \n\n  กรุณาใส่ข้อมูล processสุดท้ายเป็น อนุมัติ,ไม่อนุมัต,หรือ คืนเรื่อง   ")
                Exit Sub
            End If
        End If

        Dim objAnnals As New Annals
        If tbID_OUT.Text = "" Then
            objAnnals.ANNALS_TYPE = 2
            ' objAnnals.DATE_IN_ANNALS = New Date(Year(DATE_IN_ANNALS_TextBox.Text), Month(DATE_IN_ANNALS_TextBox.Text), Day(DATE_IN_ANNALS_TextBox.Text))
            objAnnals.DATE_IN_ANNALS = DATE_IN_ANNALS_TextBox.Text
            objAnnals.REFERENCE = REFERENCETextBox.Text
            objAnnals.RECIVER = SENDERTextBox.Text
            objAnnals.SENDER = Session.Item(SessionKeyConst.EMP_NAME) & ":" & User.Identity.Name
            objAnnals.HEADER = "เรื่องเกี่ยวกับสินเชื่อ"
            Dim detail As String = Nothing

            objAnnals.DETAIL = ""

            Dim dal As New AnnalsDAL
            dal.insertAnnalsCreditOut(objAnnals, tbID.Text)
            tbID_OUT.Text = "2" & objAnnals.ANNALS_SEQ_NO & "/" & CInt(objAnnals.ANNALS_YEAR) + 543
            Dim log As New ClsLog
            log.InsertLog(6, Request.UserHostAddress, User.Identity.Name, tbID_OUT.Text)

        End If

        Dim s3 As String = Nothing
        s3 += "popup=window.open('annalsDetail.aspx"
        s3 += "?type=2"
        s3 += "&seq=" & tbID_OUT.Text.Substring(1, 5)
        s3 += "&year=" & CInt(tbID_OUT.Text.Substring(7, 4) - 543)
        s3 += "&formViewMode=edit"
        s3 += "','InsertPopup','toolbar=No,width=450,height=500,resizable=no,scrollbars=yes');popup.focus();"
        '  ImageButton2.Attributes.Add("onclick", s3 & "','InsertPopup','toolbar=No,width=450,height=500,resizable=no,scrollbars=yes');popup.focus();")
        Page.ClientScript.RegisterStartupScript(Me.GetType, "scriptpopup", s3, True)
        ' หลังจากออกเลขแล้วทำการ save ข้อมูลด้วย


    End Sub
#End Region

#Region "Panel_change"
    Protected Sub ddlSendToBoard_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles ddlSendToBoard.SelectedIndexChanged
        CheckChangePanelBoard()
    End Sub

    Sub CheckChangePanelBoard()
        Select Case ddlSendToBoard.Items(ddlSendToBoard.SelectedIndex).Value
            Case "1"
                PanelBoarResutl.Visible = True
                PanelCMResutl.Visible = False
            Case Else
                PanelBoarResutl.Visible = False
                PanelCMResutl.Visible = True

        End Select

    End Sub

#End Region

    Protected Sub RadioNoCovenant_CheckedChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles RadioNoCovenant.CheckedChanged
        ImgAddCovenant.Visible = False
        lblAddCovenant.Visible = False
    End Sub

    Protected Sub RadioCovenant_CheckedChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles RadioCovenant.CheckedChanged
        ImgAddCovenant.Visible = True
        lblAddCovenant.Visible = True
    End Sub

    Protected Sub RadioOldCovenant_CheckedChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles RadioOldCovenant.CheckedChanged
        ImgAddCovenant.Visible = False
        lblAddCovenant.Visible = False
    End Sub

    Protected Sub RadioFloodBOT_CheckedChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles RadioFloodBot.CheckedChanged
        LabelAddFloodBOT.Visible = True
        ImageAddFloodBOT.Visible = True
    End Sub
    Protected Sub RadioNoFlood_CheckedChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles RadioNoFlood.CheckedChanged
        LabelAddFloodBOT.Visible = False
        ImageAddFloodBOT.Visible = False
    End Sub
    Protected Sub SearchDropCIF(ByVal sender As Object, ByVal e As System.EventArgs)
        Dim ddl As DropDownList = DirectCast(sender, DropDownList)
        SearchCif(ddl.SelectedValue, "edit")
    End Sub

    'Protected Sub ButtonAddCIFCA_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles ButtonAddCIFCA.Click
    'If cifcaTextBox.Text <> String.Empty Then
    '    Dim CustomerObj As New Customer
    '    CustomerObj.CIF = cifcaTextBox.Text
    '    Dim CustomerDal As New CustomerDAL
    '    CustomerObj = CustomerDal.getCustomerByCIF(CustomerObj)
    '    If CustomerObj.CUS_FIRST <> String.Empty Then  '  if  cusfirst not empty
    '        For i = 0 To ListCIFCA.Items.Count - 1
    '            If ListCIFCA.Items(i).Value = CustomerObj.CIF Then
    '                Exit Sub
    '            End If
    '        Next
    '        Dim cifList As New ListItem
    '        cifList.Value = CustomerObj.CIF.ToString
    '        cifList.Text = CustomerObj.CIF.ToString & ":" & CustomerObj.CUS_FIRST & " " & CustomerObj.CUS_LAST
    '        ListCIFCA.Items.Add(cifList)
    '    End If
    'End If
    'lblListCIFCount.Text = "จำนวน CIF:" & ListCIFCA.Items.Count
    '  End Sub

    'Protected Sub ButtonDelCIFCA_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles ButtonDelCIFCA.Click



    '    If ListCIFCA.SelectedIndex >= 0 Then
    '        Dim ds1 As DataSet = Session("ds1")
    '        Dim ch As Boolean = True
    '        For i = 0 To ds1.Tables("acc").Rows.Count - 1
    '            If ListCIFCA.Items(ListCIFCA.SelectedIndex).Value = ds1.Tables("acc").Rows(i).Item("cif") Then
    '                ch = False
    '            End If
    '        Next
    '        If ch = True Then
    '            ListCIFCA.Items.RemoveAt(ListCIFCA.SelectedIndex)
    '            lblCIFinfo.Text = ""
    '        Else
    '            lblCIFinfo.Text = "กรุณาลบ CIF นี้ใน Credit Detail"
    '        End If


    '    End If
    '    lblListCIFCount.Text = "จำนวน CIF:" & ListCIFCA.Items.Count


    'End Sub

    Public Function getCategoryKey(ByVal EMP_ID As String, ByVal CATE_TYPE_KEY As Integer) As String
        ' เปลี่ยนใช้ Classify  โดยหาว่า emp นี้ใช้ category key อะไร
        'declare connection
        Dim conn As SqlConnection = Nothing
        'declare result
        Dim result As String

        Try
            conn = ConnectionUtil.getSqlConnectionFromWebConfig()
            'Dim sql As String = "SELECT " _
            ' & "Controlling_UsersInLevel.LEVEL_ID,Controlling_UsersInLevel.EMP_ID " _
            ' & "FROM Controlling_UsersInLevel " _
            ' & "WHERE Controlling_UsersInLevel.EMP_ID=@EMP_ID " _
            ' & "ORDER BY LEVEL_ID "

            Dim sql As String = "CLASSIFY.P_GET_CATE_KEY_BY_EMP"
            Dim sqlCmd As New SqlCommand(sql, conn)
            sqlCmd.CommandType = CommandType.StoredProcedure
            'sqlCmd.Prepare()
            sqlCmd.Parameters.AddWithValue("@EMP_ID", EMP_ID)
            sqlCmd.Parameters.AddWithValue("@CATE_TYPE_KEY", CATE_TYPE_KEY)

            Dim reader As SqlDataReader = sqlCmd.ExecuteReader()

            While reader.Read()
                result = CStr(reader("CATEGORY_KEY"))
            End While

            reader.Close()
            conn.Close()
        Catch ex As Exception
            Throw New Exception(ex.Message & " : " & ex.StackTrace)
        Finally
            If (conn.State = ConnectionState.Open) Then
                conn.Close()
            End If
            conn = Nothing
        End Try

        Return result

    End Function

    Public Function getRatingTypeDropDown() As DropDownList

        Dim conn As SqlConnection = Nothing
        'declare result
        Dim result As String
        Dim DropDownRating As New DropDownList
        Try
            conn = ConnectionUtil.getSqlConnectionFromWebConfig()
            Dim sql As String = "SELECT  *  FROM  CUSTOMER_SME_RATING_TYPE ORDER BY  PRIORITY"
            Dim sqlCmd As New SqlCommand(sql, conn)
            sqlCmd.CommandType = CommandType.Text
            Dim reader As SqlDataReader = sqlCmd.ExecuteReader()

            While reader.Read()
                Dim listItem As New ListItem
                listItem.Value = reader("RATING_TYPE_KEY")
                listItem.Text = CStr(reader("RATING_TYPE_DESC"))
                DropDownRating.Items.Add(listItem)
            End While
            reader.Close()
            conn.Close()
        Catch ex As Exception
            Throw New Exception(ex.Message & " : " & ex.StackTrace)
        Finally
            If (conn.State = ConnectionState.Open) Then
                conn.Close()
            End If
            conn = Nothing
        End Try

        Return DropDownRating
    End Function

    '#Region "flood"

    Function checkConcernFlood(ByVal CAID As String) As Boolean
        Dim concern As Integer
        Dim conn As SqlConnection = Nothing
        Try
            conn = ConnectionUtil.getSqlConnectionFromWebConfig()
            Dim Sql As String = "ANNALS_CREDIT_FLOOD_BOT_SELECT_COUNT"
            Dim sqlCmd As New SqlCommand(Sql, conn)
            sqlCmd.CommandType = CommandType.StoredProcedure
            sqlCmd.Prepare()
            sqlCmd.Parameters.AddWithValue("@ID", CAID)
            Dim reader As SqlDataReader = sqlCmd.ExecuteReader()
            If reader.HasRows Then
                While reader.Read
                    If CInt(reader.Item("DATA_COUNT")) > 0 Then
                        concern = True
                    Else
                        concern = False
                    End If
                End While
            Else
                concern = False
            End If
            Return concern
        Finally
            If (conn.State = ConnectionState.Open) Then
                conn.Close()
            End If
            conn = Nothing
        End Try
    End Function
    'Function updateNotConcernFlood(ByVal CAID As String) As Boolean
    '    Dim conn As SqlConnection = Nothing
    '    Try
    '        conn = ConnectionUtil.getSqlConnectionFromWebConfig()
    '        Dim Sql As String = "ANNALS_CREDIT_FLOOD_UPDATE_NOT_CONCERN"
    '        Dim sqlCmd As New SqlCommand(Sql, conn)
    '        sqlCmd.CommandType = CommandType.StoredProcedure
    '        sqlCmd.Prepare()
    '        sqlCmd.Parameters.AddWithValue("@ID", CAID)
    '        sqlCmd.Parameters.AddWithValue("@UPDATE_USER", User.Identity.Name)
    '        sqlCmd.ExecuteNonQuery()
    '        Return True
    '    Finally
    '        If (conn.State = ConnectionState.Open) Then
    '            conn.Close()
    '        End If
    '        conn = Nothing
    '    End Try
    'End Function
    '    Function insertNotConcernFlood(ByVal CAID As String) As Boolean
    '        Dim conn As SqlConnection = Nothing
    '        Try
    '            conn = ConnectionUtil.getSqlConnectionFromWebConfig()
    '            Dim Sql As String = "ANNALS_CREDIT_FLOOD_INSERT_NOT_CONCERN"
    '            Dim sqlCmd As New SqlCommand(Sql, conn)
    '            sqlCmd.CommandType = CommandType.StoredProcedure
    '            sqlCmd.Prepare()
    '            sqlCmd.Parameters.AddWithValue("@ID", CAID)
    '            sqlCmd.Parameters.AddWithValue("@UPDATE_USER", User.Identity.Name)
    '            sqlCmd.ExecuteNonQuery()
    '            Return True
    '        Finally
    '            If (conn.State = ConnectionState.Open) Then
    '                conn.Close()
    '            End If
    '            conn = Nothing
    '        End Try
    '    End Function
    '    Function checkConcernFloodRow(ByVal CAID As String) As Boolean
    '        Dim conn As SqlConnection = Nothing
    '        Try
    '            conn = ConnectionUtil.getSqlConnectionFromWebConfig()
    '            Dim Sql As String = "ANNALS_CREDIT_FLOOD_SELECT"
    '            Dim sqlCmd As New SqlCommand(Sql, conn)
    '            sqlCmd.CommandType = CommandType.StoredProcedure
    '            sqlCmd.Prepare()
    '            sqlCmd.Parameters.AddWithValue("@ID", CAID)
    '            Dim reader As SqlDataReader = sqlCmd.ExecuteReader()
    '            Return reader.HasRows
    '        Finally
    '            If (conn.State = ConnectionState.Open) Then
    '                conn.Close()
    '            End If
    '            conn = Nothing
    '        End Try
    '    End Function

    '#End Region


End Class
