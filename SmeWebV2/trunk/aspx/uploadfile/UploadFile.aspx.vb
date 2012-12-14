Imports System.Collections.Generic
Imports System.Globalization
Partial Class _UploadFile
Inherits System.Web.UI.Page

    Public user_id As String
    Public annals_id As String
    Dim sql As String
    Dim isProduction As String = ConfigurationSettings.AppSettings("IsProduction")

Protected Sub alert(ByVal str As String)
	 Response.Write("<script language=""javascript"">alert(""" & Str & """)</script>")
End sub 
 Protected Sub BindDropDown
	Dim dalFILE_TYPE As New UploadFileTypeDAL
	Dim arrFILE_TYPE As New List(Of UploadFileType)
        arrFILE_TYPE = dalFILE_TYPE.getAllUploadFileType
        Session("arrFILE_TYPE") = arrFILE_TYPE
        'ddlFILE_TYPE.DataSource = arrFILE_TYPE
        'ddlFILE_TYPE.DataValueField = "ID"
        'ddlFILE_TYPE.DataTextField = "TYPE"
        'ddlFILE_TYPE.DataBind()

        ddlSearch.DataSource = arrFILE_TYPE
        ddlSearch.DataValueField = "ID"
        ddlSearch.DataTextField = "TYPE"
        ddlSearch.DataBind()

        Dim item As New ListItem
        item.Value = ""
        item.Text = "  แสดงทั้งหมด  "
        ddlSearch.Items.Insert(0, item)

End Sub
    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        user_id = User.Identity.Name
        annals_id = Request.QueryString("annals_id")
        If user_id = "" Then
            user_id = Request.QueryString("user_id")
            If user_id = "" Then
                Response.Write(" No user id")
                Exit Sub
            End If
        ElseIf annals_id = "" Then
            Response.Write(" No annals id")
            Exit Sub
        End If

        If Page.IsPostBack = False Then
            BindDropDown()
            Dim sql As String = "Select * from v_uploadfile where annals_id='" & annals_id & "' order by id"
            Session("sql") = sql
            ShowGridUploadFile()
            If HttpCookieUtil.hasRolesId(Context.Request.Cookies(FormsAuthentication.FormsCookieName), RoleIdConst.A_READ_ONLY) Then
                btnAddNew.Visible = False
            Else
                btnAddNew.Visible = True
            End If
            If Request.QueryString("readonly") = "true" Then
                btnAddNew.Visible = False
            End If

        End If

    End Sub
    Protected Sub btnAddNew_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnAddNew.Click
        PreAddFileDetail()
    End Sub
    Sub PreAddFileDetail()
        Dim str As String = ""
        Session("event") = "addfile"

        sql = "select top(1) '' as ID,"
        sql += " '' as USER_ID,"
        sql += "'' as REMARK ,"
        sql += "'' as COLL_ID ,"
        sql += "'' as ANNALS_ID,"
        sql += "'' as  PATH,"
        sql += "'' as CREATE_DATE,"
        sql += "'' as TYPE,"
        sql += "'' as FILE_TYPE, "
        sql += "'' as FILE_YEAR  from v_uploadfile"
        bindGridUploadFile(0, sql)
    End Sub
    Sub bindGridUploadFile(ByVal EditRow As Integer, ByVal SQL As String)
        '  หน้านี้ใช้กรณี ที่ เป็นการ add และ edit  ในการ add จะดึง table 'addtable'  ถ้าเป็นแก้ไขดึง  'acc'

        Dim dal As New VUploadfileDAL
        Dim arr As New List(Of VUploadfile)
        arr = dal.getAllVUploadfileBySQL(SQL)
        Session("GridUploadFile") = arr
        GridUploadFile.EditIndex = EditRow
        GridUploadFile.DataSource = arr

        ' GridUploadFile.Columns(3).Visible = False
        'GridUploadFile.Columns(4).Visible = False

        GridUploadFile.Columns(9).Visible = False
        'GridUploadFile.Columns(8).Visible = False

        'If EditRow < 0 Then
        '    GridUploadFile.Columns(9).Visible = True
        'Else
        '    GridUploadFile.Columns(9).Visible = False
        'End If
        GridUploadFile.DataBind()

        '' ===============หา control

        If EditRow >= 0 Then  ' === กรณีที่เป็นการแก้ไข rowindex  >=0
            Dim lblFileid As Label = GridUploadFile.Rows(EditRow).Cells(0).FindControl("lblFileid")
            Dim tbFileRemark As TextBox = GridUploadFile.Rows(EditRow).Cells(0).FindControl("tbFileRemark")
            Dim linkPath As HyperLink = GridUploadFile.Rows(EditRow).Cells(0).FindControl("linkPath")

            Dim tbFileAnnals_ID As TextBox = GridUploadFile.Rows(EditRow).Cells(0).FindControl("tbFileAnnals_ID")
            tbFileAnnals_ID.Enabled = False
            Dim tbFileUser_ID As TextBox = GridUploadFile.Rows(editrow ).Cells(0).FindControl("tbFileUser_ID")
            tbFileUser_ID.Enabled = False
            Dim tbFileCreate_date As TextBox = GridUploadFile.Rows(EditRow).Cells(0).FindControl("tbFileCreate_date")
            tbFileCreate_date.Enabled = False

            Dim BtnDelete As ImageButton = GridUploadFile.Rows(EditRow).Cells(0).FindControl("BtnDelete")
            BtnDelete.Attributes.Add("onclick", "return confirm_delete();")

            Dim BtnUpdate As ImageButton = GridUploadFile.Rows(EditRow).Cells(0).FindControl("BtnUpdate")
            BtnUpdate.Attributes.Add("onclick", "return confirm_update();")

            If LCase(Session("event")) = "addfile" Then
                tbFileAnnals_ID.Text = annals_id
                tbFileUser_ID.Text = user_id
            End If

            Dim ddlFileFILE_TYPE As DropDownList = GridUploadFile.Rows(EditRow).Cells(0).FindControl("ddlFileFILE_TYPE")
            ddlFileFILE_TYPE.DataSource = Session("arrFILE_TYPE")
            ddlFileFILE_TYPE.DataValueField = "ID"
            ddlFileFILE_TYPE.DataTextField = "TYPE"
            ddlFileFILE_TYPE.DataBind()
            If ddlSearch.SelectedIndex >= 0 Then
                ddlFileFILE_TYPE.SelectedIndex = ddlSearch.SelectedIndex - 1
            End If
            ''====== กำหนดค่าที่เลือกลงใน control และ dropdown  โดยดึงค่าจาก class

            ' Code check input error. 

            Dim obj As New VUploadfile ' Create object 
            obj.ID = CInt(lblFileid.Text)
            obj = dal.getVUploadfileByID(obj)


            For i As Integer = 0 To ddlFileFILE_TYPE.Items.Count - 1
                If ddlFileFILE_TYPE.Items(i).Value = obj.FILE_TYPE Then
                    ddlFileFILE_TYPE.SelectedIndex = i
                    Exit For
                End If
            Next

        End If
    End Sub
    Sub DeleteRow(ByVal id As Integer)
        Dim dal As New UploadFileDAL
        Dim obj As New UploadFile
        obj.ID = id
        dal.deleteUploadFile(obj)
        ShowGridUploadFile()
    End Sub

    Protected Sub GridUploadFile_DataBound(ByVal sender As Object, ByVal e As System.EventArgs) Handles GridUploadFile.DataBound
        Dim i As Integer
        For i = 0 To GridUploadFile.Rows.Count - 1
            Dim BtnEdit As Image = GridUploadFile.Rows(i).FindControl("BtnEdit")
            Dim lblFileUser_id As Label = GridUploadFile.Rows(i).FindControl("lblFileUser_id")
            Dim linkPath As HyperLink = GridUploadFile.Rows(i).FindControl("linkPath")

            If IsNothing(BtnEdit) = False And IsNothing(lblFileUser_id) = False Then

                If Trim(lblFileUser_id.Text) = Trim(User.Identity.Name) Or HttpCookieUtil.hasRolesId(Context.Request.Cookies(FormsAuthentication.FormsCookieName), RoleIdConst.R_ADMIN) Then
                    BtnEdit.Visible = True
                    If HttpCookieUtil.hasRolesId(Context.Request.Cookies(FormsAuthentication.FormsCookieName), RoleIdConst.A_READ_ONLY) Then
                        ' ถ้ามี Role readonly ให้ไม่โชปุ่ม update
                        BtnEdit.Visible = False
                        linkPath.ToolTip = "Read Only"
                    Else
                        BtnEdit.Visible = True
                    End If
                Else
                    BtnEdit.Visible = False
                    linkPath.ToolTip = "You don't  have permission to  update (" & User.Identity.Name & "," & lblFileUser_id.Text & ")"
                End If
            End If
        Next
    End Sub
    Protected Sub GridUploadFile_RowCancelingEdit(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewCancelEditEventArgs) Handles GridUploadFile.RowCancelingEdit
        sql = Session("sql")
        bindGridUploadFile(-1, sql)
    End Sub

    Protected Sub GridUploadFile_RowEditing(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewEditEventArgs) Handles GridUploadFile.RowEditing
        If Request.QueryString("readonly") = "true" Then
            Exit Sub
        End If
        sql = Session("sql")
        Session("event") = ""
        bindGridUploadFile(e.NewEditIndex, sql)
    End Sub
    Sub ShowGridUploadFile()
        sql = Session("sql")
        bindGridUploadFile(-1, sql)
    End Sub
    Protected Sub GridUploadFile_PageIndexChanging(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewPageEventArgs) Handles GridUploadFile.PageIndexChanging
        GridUploadFile.PageIndex = e.NewPageIndex
        GridUploadFile.DataSource = Session("GridUploadFile")
        GridUploadFile.DataBind()
    End Sub

    Protected Sub GridUploadFile_RowUpdating(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewUpdateEventArgs) Handles GridUploadFile.RowUpdating

        Dim BeginCreatedate As Date = Date.Now
        Dim lblFileid As Label = GridUploadFile.Rows(e.RowIndex).Cells(0).FindControl("lblFileid")
        Dim tbFileRemark As TextBox = GridUploadFile.Rows(e.RowIndex).Cells(0).FindControl("tbFileRemark")
        Dim linkPath As HyperLink = GridUploadFile.Rows(e.RowIndex).Cells(0).FindControl("linkPath")
        Dim ddlFileFILE_TYPE As DropDownList = GridUploadFile.Rows(e.RowIndex).Cells(0).FindControl("ddlFileFILE_TYPE")

        Dim upFile1 As FileUpload = GridUploadFile.Rows(e.RowIndex).Cells(0).FindControl("upFile1")
        Dim tbFileAnnals_ID As TextBox = GridUploadFile.Rows(e.RowIndex).Cells(0).FindControl("tbFileAnnals_ID")
        Dim tbFileUser_ID As TextBox = GridUploadFile.Rows(e.RowIndex).Cells(0).FindControl("tbFileUser_ID")
        Dim tbFileColl_id As TextBox = GridUploadFile.Rows(e.RowIndex).Cells(0).FindControl("tbFileColl_id")
        'Code check input error. 

        If LCase(Session("event")) = "addfile" Then
            If IsNothing(upFile1.FileName) = True Or upFile1.FileName = "" Then
                message.Text = "Add file error please select file to upload."
                Exit Sub
            End If
        End If

        ' ทำการเช็คว่ามี folder ที่ใช้ upload หรือยัง ถ้ายังไม่มี folder ทำการ create folder 
        ' ../../FileUpload/yyyy/xx/     '  yyyy= year  และ xx= filetype
        Dim FileYear As Integer = Date.Now.Year
        If FileYear > 2500 Then FileYear = FileYear - 543 '   triky ทำ year ให้เป็น คศ

        Dim DirInfo As System.IO.DirectoryInfo
        Dim savePath As String

        '     <add key="IsProduction" value="0"/> ต้องการบันทัดนี้ใน web config เพื่อดูว่าเป็น server production หรือไม่ 0 ไม่ใช่ 1 ใช่
        '  กรณีใช่จะเพิ่มตัวแปรปีเข้าไปด้วย

        If isProduction = "0" Then ' รันบน leader1   ไม่ต้องมีตัวแปร year
            DirInfo = New System.IO.DirectoryInfo(Server.MapPath("../../FileUpload"))
            savePath = Server.MapPath("../../FileUpload/" & ddlFileFILE_TYPE.Items(ddlFileFILE_TYPE.SelectedIndex).Value & "/")
        Else
            DirInfo = New System.IO.DirectoryInfo(Server.MapPath("../../FileUpload/" & FileYear))
            savePath = Server.MapPath("../../FileUpload/" & FileYear & "/" & ddlFileFILE_TYPE.Items(ddlFileFILE_TYPE.SelectedIndex).Value & "/")
        End If

        '*** Create Folder ***'
        If Not DirInfo.Exists Then
            If createFolderUpload() = False Then
                message.Text = "ไม่มี folder ในการ upload กรุณาติดต่อผู้ดูแลระบบ"
                Exit Sub
            End If
        End If

        ' Try
        Dim filename As String = Nothing
        Dim filetype As String = Nothing
        If IsNothing(upFile1.FileName) = False And upFile1.FileName <> "" Then

            'Dim f = Split(upFile1.FileName, ".")
            'filetype = "." & f(1)
            Dim intLastIndexDot As Integer = upFile1.FileName.LastIndexOf(".")
            filetype = upFile1.FileName.Substring(intLastIndexDot)
            ' Get the name of the file to upload.
            filename = tbFileAnnals_ID.Text
            ' Create the path and file name to check for duplicates.
            Dim pathToCheck As String = savePath + filename & "_1" & filetype

            ' Create a temporary file name to use for checking duplicates.
            Dim tempfileName As String = ""

            ' Check to see if a file already exists with the
            ' same name as the file to upload.        
            If (System.IO.File.Exists(pathToCheck)) Then
                Dim counter As Integer = 2
                While (System.IO.File.Exists(pathToCheck))
                    ' If a file with this name already exists,
                    ' prefix the filename with a number.
                    tempfileName = filename & "_" & counter.ToString()
                    pathToCheck = savePath + tempfileName & filetype
                    counter = counter + 1
                End While
                filename = tempfileName
                ' Notify the user that the file name was changed.
                message.Text = "A file with the same name already exists." + "<br>" + _
                                         "Your file was saved as " + filename
            Else
                Dim counter As Integer = 1
                tempfileName = filename & "_" & counter.ToString()
                pathToCheck = savePath + tempfileName & filetype

                filename = tempfileName
                ' Notify the user that the file was saved successfully.
                message.Text = "Your file was uploaded successfully."
            End If
            ' Append the name of the file to upload to the path.
            savePath += filename & filetype
            ' Call the SaveAs method to save the uploaded
            ' file to the specified directory.
            upFile1.SaveAs(savePath)
        End If

        Dim dal As New UploadFileDAL ' Create object dal
        Dim obj As New UploadFile ' Create object
        If lblFileid.Text = "" Then lblFileid.Text = 0 ' add
        obj.ID = CInt(lblFileid.Text)
        obj.USER_ID = tbFileUser_ID.Text
        obj.FILE_TYPE = CInt(ddlFileFILE_TYPE.Items(ddlFileFILE_TYPE.SelectedIndex).Value)
        obj.REMARK = tbFileRemark.Text
        obj.COLL_ID = tbFileColl_id.Text
        obj.ANNALS_ID = tbFileAnnals_ID.Text
        If filename = "" Then
            obj.PATH = linkPath.Text
        Else
            obj.PATH = filename & filetype
        End If

        obj.BeginCREATE_DATE = BeginCreatedate
        obj.CREATE_DATE = Date.Now

        'MsgBox(Session("event"))
        If LCase(Session("event")) = "addfile" Then
            dal.insertUploadFile(obj)
            message.Text = "Add file complete"
        Else
            dal.updateUploadFile(obj)
            message.Text = "Update  file complete"
        End If
        Session("event") = ""
        ShowGridUploadFile() ' Show grid data.
        ' Catch ex As Exception
        'message.Text = ex.Message
        'End Try
    End Sub

    Protected Sub GridUploadFile_RowDeleting(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewDeleteEventArgs) Handles GridUploadFile.RowDeleting
        Try
            Dim lblFileid As Label = GridUploadFile.Rows(e.RowIndex).Cells(0).FindControl("lblFileid")
            Dim dal As New UploadFileDAL
            dal.deleteUploadFile(CInt(lblFileid.Text))
            ShowGridUploadFile() ' Show grid data.
            message.Text = "Delete  file complete"
        Catch ex As Exception
            message.Text = ex.Message
        End Try
    End Sub

    Protected Sub ddlSearch_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles ddlSearch.SelectedIndexChanged
        If ddlSearch.Items(ddlSearch.SelectedIndex).Value = "" Then
            Dim sql As String = "Select * from v_uploadfile where annals_id='" & annals_id & "' order by id"
            Session("sql") = sql
            bindGridUploadFile(-1, sql)
        Else
            sql = "Select * from v_uploadfile where  file_type=" & ddlSearch.Items(ddlSearch.SelectedIndex).Value & " and annals_id='" & annals_id & "'"
            Session("sql") = sql
            bindGridUploadFile(-1, sql)
        End If


    End Sub

    Protected Function createFolderUpload() As Boolean
        Dim st As Boolean = True
        Try
            Dim Fyear As Integer = Date.Now.Year

            ' หาจำนวน Type เพื่อ สร้าง folder ตามจำนวน
            Dim dalFILE_TYPE As New UploadFileTypeDAL
            Dim arrFILE_TYPE As New List(Of UploadFileType)
            arrFILE_TYPE = dalFILE_TYPE.getAllUploadFileType

            Dim TypeID As Integer
            'MsgBox(arrFILE_TYPE.Count)
            For i = 0 To arrFILE_TYPE.Count - 1
                TypeID = arrFILE_TYPE(i).ID
                If isProduction = "0" Then
                    System.IO.Directory.CreateDirectory(MapPath("../../FileUpload/" & TypeID))
                Else
                    System.IO.Directory.CreateDirectory(MapPath("../../FileUpload/" & Fyear & "/" & TypeID))
                End If
            Next
        Catch ex As Exception
            st = False
        End Try
        Return st
    End Function

    Protected Sub GridUploadFile_RowDataBound(sender As Object, e As System.Web.UI.WebControls.GridViewRowEventArgs) Handles GridUploadFile.RowDataBound
        If e.Row.RowType = DataControlRowType.DataRow Then
            'Dim FileYear As Integer = Date.Now.Year
            'If FileYear > 2500 Then FileYear = FileYear - 543 '   triky ทำ year ให้เป็น คศ


            Dim linkPath As HyperLink = e.Row.FindControl("linkPath")
            Dim strPath As String = Convert.ToString(DataBinder.Eval(e.Row.DataItem, "Path"))
            Dim strFILE_TYPE As String = Convert.ToString(DataBinder.Eval(e.Row.DataItem, "FILE_TYPE"))
            Dim strYear As String = Convert.ToString(DataBinder.Eval(e.Row.DataItem, "FILE_YEAR"))


            If isProduction = "0" Then
                linkPath.NavigateUrl = "../../FileUpload/" & strFILE_TYPE & "/" & strPath
                linkPath.ToolTip = "../../FileUpload/" & strFILE_TYPE & "/" & strPath
            Else
                linkPath.NavigateUrl = "../../FileUpload/" & strYear & "/" & strFILE_TYPE & "/" & strPath
                linkPath.ToolTip = "../../FileUpload/" & strYear & "/" & strFILE_TYPE & "/" & strPath
            End If

        End If


    End Sub
End Class
