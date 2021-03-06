Imports System.Collections.Generic
Imports System.Globalization
Partial Class _TbEmployee
    Inherits System.Web.UI.Page
    Protected cul As New CultureInfo("th-TH") ' ?? ???  
    'Protected cul As New CultureInfo("en-US") ' ?? eng 
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

        Dim dalPROV_CODE As New TbProvinceDAL
        Dim arrPROV_CODE As New List(Of TbProvince)
        arrPROV_CODE = dalPROV_CODE.getAllTbProvince
        ddlPROV_CODE.DataSource = arrPROV_CODE
        ddlPROV_CODE.DataValueField = "PROV_CODE"
        ddlPROV_CODE.DataTextField = "PROV_NAME"
        ddlPROV_CODE.DataBind()

        Dim dalPOSITION_CODE As New TbPositionDAL
        Dim arrPOSITION_CODE As New List(Of TbPosition)
        arrPOSITION_CODE = dalPOSITION_CODE.getAllTbPosition
        ddlPOSITION_CODE.DataSource = arrPOSITION_CODE
        ddlPOSITION_CODE.DataValueField = "POSITION_CODE"
        ddlPOSITION_CODE.DataTextField = "POSITON"
        ddlPOSITION_CODE.DataBind()

        For d As Integer = 1 To 31
            Dim item As New ListItem
            item.Value = d
            item.Text = d
            ddlDayDATEOFBIRTH.Items.Add(item)
        Next
        For m As Integer = 1 To 12
            Dim item As New ListItem
            item.Value = m
            item.Text = MonthName(m)
            ddlMonthDATEOFBIRTH.Items.Add(item)
        Next
        For y As Integer = cul.Calendar.GetYear(Date.Now) - 100 To cul.Calendar.GetYear(Date.Now) + 1
            Dim item As New ListItem
            item.Value = y
            item.Text = y
            ddlYearDATEOFBIRTH.Items.Add(item)
        Next
        For d As Integer = 1 To 31
            Dim item As New ListItem
            item.Value = d
            item.Text = d
            ddlDayDATEOFSTART.Items.Add(item)
        Next
        For m As Integer = 1 To 12
            Dim item As New ListItem
            item.Value = m
            item.Text = MonthName(m)
            ddlMonthDATEOFSTART.Items.Add(item)
        Next
        For y As Integer = cul.Calendar.GetYear(Date.Now) - 100 To cul.Calendar.GetYear(Date.Now) + 1
            Dim item As New ListItem
            item.Value = y
            item.Text = y
            ddlYearDATEOFSTART.Items.Add(item)
        Next
      
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
        tbIDCARD.Text = obj.IDCARD
        tbTAX_NO.Text = obj.TAX_NO
        tbACCNO.Text = obj.ACCNO
        tbADDRESS.Text = obj.ADDRESS
        tbSOI.Text = obj.SOI
        tbROAD.Text = obj.ROAD
        tbLOCALITY.Text = obj.LOCALITY
        tbDISTRINCT.Text = obj.DISTRINCT
        ddlPROV_CODE.SelectedIndex = 0
        For i As Integer = 0 To ddlPROV_CODE.Items.Count - 1
            If ddlPROV_CODE.Items(i).Value = obj.PROV_CODE Then
                ddlPROV_CODE.SelectedIndex = i
                Exit For
            End If
        Next
        tbZIPCODE.Text = obj.ZIPCODE
        tbTEL_HOME.Text = obj.TEL_HOME
        tbTEL_MOBILE.Text = obj.TEL_MOBILE
        tbTEL_INDOOR.Text = obj.TEL_INDOOR
        ddlDayDATEOFBIRTH.SelectedIndex = 0
        ddlMonthDATEOFBIRTH.SelectedIndex = 0
        ddlYearDATEOFBIRTH.SelectedIndex = 0
        If IsDate(obj.DATEOFBIRTH) = True Then
            For i As Integer = 0 To ddlDayDATEOFBIRTH.Items.Count - 1
                If ddlDayDATEOFBIRTH.Items(i).Value = obj.DATEOFBIRTH.Day Then
                    ddlDayDATEOFBIRTH.SelectedIndex = i
                    Exit For
                End If
            Next
            For i As Integer = 0 To ddlMonthDATEOFBIRTH.Items.Count - 1
                If ddlMonthDATEOFBIRTH.Items(i).Value = obj.DATEOFBIRTH.Month Then
                    ddlMonthDATEOFBIRTH.SelectedIndex = i
                    Exit For
                End If
            Next
            For i As Integer = 0 To ddlYearDATEOFBIRTH.Items.Count - 1
                If ddlYearDATEOFBIRTH.Items(i).Value = cul.Calendar.GetYear(obj.DATEOFBIRTH) Then
                    ddlYearDATEOFBIRTH.SelectedIndex = i
                    Exit For
                End If
            Next
        End If
        If System.IO.File.Exists(Server.MapPath("picture" & "/" & obj.IMAGENAME)) Then
            Image.ImageUrl = "picture/" & obj.IMAGENAME
        Else
            Image.ImageUrl = "picture/" & "No_Pic.gif"
        End If
        ddlDayDATEOFSTART.SelectedIndex = 0
        ddlMonthDATEOFSTART.SelectedIndex = 0
        ddlYearDATEOFSTART.SelectedIndex = 0
        If IsDate(obj.DATEOFSTART) = True Then
            For i As Integer = 0 To ddlDayDATEOFSTART.Items.Count - 1
                If ddlDayDATEOFSTART.Items(i).Value = obj.DATEOFSTART.Day Then
                    ddlDayDATEOFSTART.SelectedIndex = i
                    Exit For
                End If
            Next
            For i As Integer = 0 To ddlMonthDATEOFSTART.Items.Count - 1
                If ddlMonthDATEOFSTART.Items(i).Value = obj.DATEOFSTART.Month Then
                    ddlMonthDATEOFSTART.SelectedIndex = i
                    Exit For
                End If
            Next
            For i As Integer = 0 To ddlYearDATEOFSTART.Items.Count - 1
                If ddlYearDATEOFSTART.Items(i).Value = cul.Calendar.GetYear(obj.DATEOFSTART) Then
                    ddlYearDATEOFSTART.SelectedIndex = i
                    Exit For
                End If
            Next
        End If

        tbUSERNAME.Text = obj.USERNAME
        tbPASSWD.Text = obj.PASSWD

        ddlPOSITION_CODE.SelectedIndex = 0
        For i As Integer = 0 To ddlPOSITION_CODE.Items.Count - 1
            If ddlPOSITION_CODE.Items(i).Value = obj.POSITION_CODE Then
                ddlPOSITION_CODE.SelectedIndex = i
                Exit For
            End If
        Next

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
        obj.IDCARD = tbIDCARD.text
        obj.TAX_NO = tbTAX_NO.text
        obj.ACCNO = tbACCNO.text
        obj.ADDRESS = tbADDRESS.text
        obj.SOI = tbSOI.text
        obj.ROAD = tbROAD.text
        obj.LOCALITY = tbLOCALITY.text
        obj.DISTRINCT = tbDISTRINCT.text
        obj.PROV_CODE = ddlPROV_CODE.SelectedValue
        obj.ZIPCODE = tbZIPCODE.text
        obj.TEL_HOME = tbTEL_HOME.text
        obj.TEL_MOBILE = tbTEL_MOBILE.text
        obj.TEL_INDOOR = tbTEL_INDOOR.text
        obj.DATEOFBIRTH = New Date(ddlYearDATEOFBIRTH.SelectedValue, ddlMonthDATEOFBIRTH.SelectedValue, ddlDayDATEOFBIRTH.SelectedValue, 0, 0, 0, cul.Calendar)

        If Not FileUpload.PostedFile Is Nothing And FileUpload.PostedFile.ContentLength > 0 Then
            Dim fn As String = System.IO.Path.GetFileName(FileUpload.PostedFile.FileName)
            Dim SaveLocation As String = Server.MapPath("picture") & "\" & fn
            Try
                FileUpload.PostedFile.SaveAs(SaveLocation)
                'Response.Write("The file has been uploaded.")
                obj.IMAGENAME = fn
            Catch Exc As Exception
                'Response.Write("Error: " & Exc.Message)
                obj.IMAGENAME = System.IO.Path.GetFileName(Image.ImageUrl)
            End Try
        Else
            obj.IMAGENAME = System.IO.Path.GetFileName(Image.ImageUrl)
        End If

        obj.DATEOFSTART = New Date(ddlYearDATEOFSTART.SelectedValue, ddlMonthDATEOFSTART.SelectedValue, ddlDayDATEOFSTART.SelectedValue, 0, 0, 0, cul.Calendar)
        obj.USERNAME = tbUSERNAME.Text
        obj.PASSWD = tbPASSWD.text
        obj.POSITION_CODE = ddlPOSITION_CODE.SelectedValue

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
        tbIDCARD.Text = ""
        tbTAX_NO.Text = ""
        tbACCNO.Text = ""
        tbADDRESS.Text = ""
        tbSOI.Text = ""
        tbROAD.Text = ""
        tbLOCALITY.Text = ""
        tbDISTRINCT.Text = ""
        ddlPROV_CODE.SelectedIndex = -1
        tbZIPCODE.Text = ""
        tbTEL_HOME.Text = ""
        tbTEL_MOBILE.Text = ""
        tbTEL_INDOOR.Text = ""
        ddlDayDATEOFBIRTH.SelectedIndex = -1
        ddlMonthDATEOFBIRTH.SelectedIndex = -1
        ddlYearDATEOFBIRTH.SelectedIndex = -1
        FileUpload.Value = ""
        ddlDayDATEOFSTART.SelectedIndex = -1
        ddlMonthDATEOFSTART.SelectedIndex = -1
        ddlYearDATEOFSTART.SelectedIndex = -1
   
        tbUSERNAME.Text = ""
        tbPASSWD.Text = ""
   
    
        ddlPOSITION_CODE.SelectedIndex = -1
    
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

        'If DirectCast(Application.Item(ApplicationKeyConst.App_Culture), CultureInfo).Name.StartsWith("en") Then   ' ??Ǩ?ͺ culture
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

        'If DirectCast(Application.Item(ApplicationKeyConst.App_Culture), CultureInfo).Name.StartsWith("en") Then   ' ??Ǩ?ͺ culture
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