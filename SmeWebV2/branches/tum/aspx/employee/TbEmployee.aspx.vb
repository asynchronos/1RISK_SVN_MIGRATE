Imports System.Collections.Generic
Imports System.Globalization
Partial Class _TbEmployee
    Inherits System.Web.UI.Page
    Protected cul As New CultureInfo("th-TH") ' ปี ไทย  
    'Protected cul As New CultureInfo("en-US") ' ปี eng 
    Protected Sub alert(ByVal str As String)
        Response.Write("<script language=""javascript"">alert(""" & Str & """)</script>")
    End Sub
    Protected Sub BindDropDown()
        Dim dalTITLE_CODE As New TbTitleDAL
        Dim arrTITLE_CODE As New List(Of TbTitle)
        arrTITLE_CODE = dalTITLE_CODE.getAllTbTitle
        ddlTITLE_CODE.DataSource = arrTITLE_CODE
        ddlTITLE_CODE.DataValueField = "TITLE_CODE"
        ddlTITLE_CODE.DataTextField = "TITLE_NAME"
        ddlTITLE_CODE.DataBind()


    End Sub
    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Page.IsPostBack = False Then
            'ShowGridTbEmployee()
            PreSearch()
            BindDropDown()
            SearchEmp()
            ' BtnDelete.Attributes.Add("onclick", "return confirm('Do you want to delete this data?');")
        End If
    End Sub
    Sub SearchEmp()
        ' Code check input error. 
        Dim dal As New TbEmployeeDAL ' Create object dal
        Dim obj As New TbEmployee ' Create object 

        obj.EMP_ID = User.Identity.Name
        obj = dal.getTbEmployeeByEMP_ID(obj)
        tbEMP_ID.Text = obj.EMP_ID
        ddlTITLE_CODE.SelectedIndex = 0
        For i As Integer = 0 To ddlTITLE_CODE.Items.Count - 1
            If ddlTITLE_CODE.Items(i).Value = obj.TITLE_CODE Then
                ddlTITLE_CODE.SelectedIndex = i
                Exit For
            End If
        Next
        tbEMPNAME.Text = obj.EMPNAME
        tbEMPSURNAME.Text = obj.EMPSURNAME
        tbEMPNAME_E.Text = obj.EMPNAME_E
        tbEMPSURNAME_E.Text = obj.EMPSURNAME_E
        tbEMAIL.Text = obj.EMAIL
   

        tbUSERNAME.Text = obj.USERNAME
        tbPASSWD.Text = obj.PASSWD

        PreUpdate()
    End Sub


    Sub PreUpdate()

        btnUpdate.Visible = True

        ' PanelGridTbEmployee.visible = False
        'PanelTbEmployee.Visible = True
    End Sub
    Sub PreSearch()

        btnUpdate.Visible = True

        ' PanelGridTbEmployee.visible = True
        ' PanelTbEmployee.visible = False
    End Sub
    Protected Sub btnUpdate_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnUpdate.Click
        'Code check input error. 
        Dim ErrString As String = CheckErrINput()
        If ErrString <> "" Then
            alert(ErrString)
            Exit Sub
        End If
        Dim dal As New TbEmployeeDAL ' Create object dal
        Dim obj As New TbEmployee ' Create object 
        obj.EMP_ID = tbEMP_ID.text
        obj.TITLE_CODE = ddlTITLE_CODE.SelectedValue
        obj.EMPNAME = tbEMPNAME.text
        obj.EMPSURNAME = tbEMPSURNAME.text
        obj.EMPNAME_E = tbEMPNAME_E.text
        obj.EMPSURNAME_E = tbEMPSURNAME_E.text
        obj.EMAIL = tbEMAIL.text
        obj.IDCARD = ""
        obj.TAX_NO = ""
        obj.ACCNO = ""
        obj.ADDRESS = ""
        obj.SOI = ""
        obj.ROAD = ""
        obj.LOCALITY = ""
        obj.DISTRINCT = ""
        obj.PROV_CODE = ""
        obj.ZIPCODE = ""
        obj.TEL_HOME = ""
        obj.TEL_MOBILE = ""
        obj.TEL_INDOOR = ""
        obj.DATEOFBIRTH = DateTime.Now


        obj.DATEOFSTART = DateTime.Now
        obj.USERNAME = tbUSERNAME.Text
        obj.PASSWD = tbPASSWD.text
        obj.POSITION_CODE = ""

        dal.updateTbEmployee(obj)
        'ShowGridTbEmployee()
        PreSearch()
        alert(" Update complete ")
        SearchEmp()
    End Sub

    Sub ClearText()
        tbEMP_ID.Text = ""
        ddlTITLE_CODE.SelectedIndex = -1
      
        tbEMPNAME.Text = ""
        tbEMPSURNAME.Text = ""
        tbEMPNAME_E.Text = ""
        tbEMPSURNAME_E.Text = ""
        tbEMAIL.Text = ""

        tbUSERNAME.Text = ""
        tbPASSWD.Text = ""
   

    End Sub
    Protected Sub btnCancel_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnCancel.Click
        PreSearch()
    End Sub
    Function CheckErrINput() As String
        Dim str As String = ""
        If tbEMP_ID.Text = "" Then
            str += "Please input Employee ID.  \n"
        End If
       
        If tbEMPNAME.Text = "" Then
            str += "Please input Name.  \n"
        End If
        If tbEMPSURNAME.Text = "" Then
            str += "Please input Surname.  \n"
        End If
        'If tbEMPNAME_E.Text = "" Then
        '    str += "Please input Name(Eng).  \n"
        'End If
        'If tbEMPSURNAME_E.Text = "" Then
        '    str += "Please input Surname(Eng).  \n"
        'End If
        'If tbEMAIL.Text = "" Then
        '    str += "Please input Email.  \n"
        'End If
        'If tbIDCARD.Text = "" Then
        '    str += "Please input Id Card.  \n"
        'End If
        'If tbTAX_NO.Text = "" Then
        '    str += "Please input Tax Number.  \n"
        'End If
        'If tbACCNO.Text = "" Then
        '    str += "Please input Account Number.  \n"
        'End If
        'If tbADDRESS.Text = "" Then
        '    str += "Please input Address.  \n"
        'End If
        'If tbSOI.Text = "" Then
        '    str += "Please input Soi.  \n"
        'End If
        'If tbROAD.Text = "" Then
        '    str += "Please input Road.  \n"
        'End If
        'If tbLOCALITY.Text = "" Then
        '    str += "Please input LOCALITY.  \n"
        'End If
        'If tbDISTRINCT.Text = "" Then
        '    str += "Please input District.  \n"
        'End If
        'If tbZIPCODE.Text = "" Then
        '    str += "Please input Zipcode.  \n"
        'End If
        'If tbTEL_HOME.Text = "" Then
        '    str += "Please input Tel Home.  \n"
        'End If
        'If tbTEL_MOBILE.Text = "" Then
        '    str += "Please input Mobile.  \n"
        'End If
        'If tbTEL_INDOOR.Text = "" Then
        '    str += "Please input Tel Indoor.  \n"
        'End If

        'If DirectCast(Application.Item(ApplicationKeyConst.App_Culture), CultureInfo).Name.StartsWith("en") Then   ' ตรวจสอบ culture
        '    If IsDate(ddlMonthDATEOFBIRTH.SelectedValue & "/" & ddlDayDATEOFBIRTH.SelectedValue & "/" & ddlYearDATEOFBIRTH.SelectedValue) = False Then
        '        str += "Please input Date of  Birth with correct date. \n "
        '    End If
        'Else
        '    If IsDate(ddlDayDATEOFBIRTH.SelectedValue & "/" & ddlMonthDATEOFBIRTH.SelectedValue & "/" & ddlYearDATEOFBIRTH.SelectedValue) = False Then
        '        str += "Please input Date of  Birth with correct date. \n "
        '    End If
        'End If
        ''If FileUpload.Value = "" Then
        ''    str += "Please input Image.  \n"
        ''End If

        'If DirectCast(Application.Item(ApplicationKeyConst.App_Culture), CultureInfo).Name.StartsWith("en") Then   ' ตรวจสอบ culture
        '    If IsDate(ddlMonthDATEOFSTART.SelectedValue & "/" & ddlDayDATEOFSTART.SelectedValue & "/" & ddlYearDATEOFSTART.SelectedValue) = False Then
        '        str += "Please input Date of Start with correct date. \n "
        '    End If
        'Else
        '    If IsDate(ddlDayDATEOFSTART.SelectedValue & "/" & ddlMonthDATEOFSTART.SelectedValue & "/" & ddlYearDATEOFSTART.SelectedValue) = False Then
        '        str += "Please input Date of Start with correct date. \n "
        '    End If
        'End If
        'If tbUSERNAME.Text = "" Then
        '    str += "Please input Username.  \n"
        'End If
        If tbPASSWD.Text = "" Then
            str += "Please input Password.  \n"
        End If
     
    
        If str <> "" Then
            str = " Can not save data. \n " & str
        End If
        Return str
    End Function

End Class