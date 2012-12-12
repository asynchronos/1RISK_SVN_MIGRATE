Imports AjaxControlToolkit
Partial Class aspx_form_FormCreate
    Inherits System.Web.UI.Page


    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
    

        '  สร้าง dinamic  form  09/11/2010
        '  ใช้ในกรณีที่ต้องการกรอกข้อมูล แต่ไม่ต้องการเสียเวลาในการสร้าง form กรอกข้อมูล หรือ สร้าง table ใน database

        '  ไม่ใช้ store procedure  ใช้เป็น sql text เนื่องจากอยากให้ code รวมกันที่หน้านี้  สะดวกในการดู code
        Dim ConnString = ConfigurationManager.ConnectionStrings("BAY01ConnectionString").ToString
        Dim FormID As Integer = 0
        ' Dim DataID As Integer = 0
        Dim DataID As String
        Dim FormType As Integer = 0 ' ประเภทของ form  1 แก้ไขอย่างเดียว 2 บันทึกเพิ่มไม่มีข้อมูลเริ่ม 

        Dim SCM As New ScriptManager
        SCM.ID = "ScriptManager1"
        SCM.EnableScriptLocalization = "true"
        SCM.EnableScriptGlobalization = "true"
        SCM.EnablePageMethods = "true"
        form1.Controls.Add(SCM)

        ' สร้าง panel สำหรับค่า input

        Dim labelModal As New Label
        labelModal.ID = "modalLabel"
        labelModal.Text = ""
        form1.Controls.Add(labelModal)

        Dim pn1 As New Panel
        pn1.ID = "Panel1"
        pn1.BackColor = Drawing.Color.Beige
        form1.Controls.Add(pn1)


        Dim dse As New DropShadowExtender
        dse.ID = "dse"
        dse.TargetControlID = "Panel1"
        dse.Opacity = ".8"
        dse.Rounded = "true"
        dse.TrackPosition = "true"
        'form1.Controls.Add(dse)

        ' ***** แก้ด้วยยังใช้ไม่ได้
        'Dim modal As New ModalPopupExtender
        'modal.ID = "ModalPopupExtender"
        'modal.TargetControlID = "btnCancel"
        'modal.PopupControlID = "ModalPanel"
        'modal.OkControlID = "OkButton"
        'modal.BackgroundCssClass = "modalBackground"
        'modal.DropShadow = "true"
        'pn1.Controls.Add(modal)


        If Request("FormID") <> "" Then FormID = Request("FormID")
        If Request("DataID") <> "" Then DataID = Request("DataID")


        ' ดึงข้อมูลจากตาราง form  ดูว่าต้องแสดงข้อมูลจากเริ่มต้นหรือไม่

        Dim stringForm As String = " SELECT  *   FROM  FORM.TB_FORM"
        stringForm += " WHERE  FORM_ID= " & FormID

        Dim SqlForm As New SqlDataSource
        SqlForm.ConnectionString = ConnString
        SqlForm.SelectCommand = stringForm
        SqlForm.SelectCommandType = SqlDataSourceCommandType.Text
        Dim DvForm As New Data.DataView
        DvForm = CType(SqlForm.Select(DataSourceSelectArguments.Empty), Data.DataView)
        Dim DtForm As System.Data.DataTable = DvForm.Table


        If DtForm.Rows.Count >= 1 Then
            If Not IsDBNull(DtForm.Rows(0).Item("FORM_NAME")) Then
                pn1.Controls.Add(New LiteralControl("<h1>" & DtForm.Rows(0).Item("FORM_NAME") & "</h1>"))
            End If
            If Not IsDBNull(DtForm.Rows(0).Item("FORM_DESC")) Then
                pn1.Controls.Add(New LiteralControl("<h4>" & DtForm.Rows(0).Item("FORM_DESC") & "</h4>"))
            End If
            Dim strForm As String = ""
            ' ดูว่ามีชื่อตารางหรือชื่อ view มั้ย ถ้าไม่มีให้ไปดึงจาก TB_SQL
            If Not IsDBNull(DtForm.Rows(0).Item("TB_SQL")) Then
                strForm = DtForm.Rows(0).Item("TB_SQL")
            End If
            If Not IsDBNull(DtForm.Rows(0).Item("FORM_TYPE_ID")) Then
                FormType = DtForm.Rows(0).Item("FORM_TYPE_ID")
            End If

            ' นำ sqlquery ที่อยู่ใน db มา filter เอาแต่ข้อมูลที่ถูกเลือกเพื่อแสดงข้อมูล
            ' TB_NAME_KEY คือ ชื่อฟิวของตารางที่ใช้ในการ filter


            pn1.Controls.Add(New LiteralControl("<table width='100%' border=0>"))   '  สร้างตาราง

            If FormType = 1 Then  ' ถ้าเป็น form แก้ไข

                If strForm <> "" Then
                    ' สร้าง label ข้อมูลเพื่อแสดงว่าเป็นข้อมูลอะไร เช่น cif :15555  , name : พิชยา
                    Dim strExForm As String
                    strExForm = " SELECT * FROM ( " & strForm & ") AS E"
                    strExForm += " WHERE  " & DtForm.Rows(0).Item("TB_NAME_KEY") & "= '" & DataID & "'"
                    Dim SqlxForm As New SqlDataSource
                    SqlxForm.ConnectionString = ConnString
                    SqlxForm.SelectCommandType = SqlDataSourceCommandType.Text

                    SqlxForm.SelectCommand = strExForm
                    Dim DvxForm As New Data.DataView
                    If Not DvxForm Is Nothing Then
                        Try
                            DvxForm = CType(SqlxForm.Select(DataSourceSelectArguments.Empty), Data.DataView)
                            Dim DtSelectField As System.Data.DataTable = DvxForm.Table
                            'MsgBox(strExForm & ":" & DtSelectField.Rows.Count)

                            If DtSelectField.Rows.Count >= 1 Then
                                For r As Integer = 0 To DtSelectField.Rows.Count - 1
                                    For c As Integer = 0 To DtSelectField.Columns.Count - 1

                                        ' เช็คว่าเป็นจำนวนคู่เมื่อไรให้ปัดแถว
                                        If c Mod 2 = 0 Then
                                            pn1.Controls.Add(New LiteralControl("</tr><tr>"))   '  ถ้าเป็นเลขคู่ให้สร้างแถวใหม่
                                        End If
                                        Dim m = c Mod 2
                                        Dim LxF As New Label
                                        LxF.Text = DtSelectField.Columns(c).ColumnName
                                        LxF.Width = 250
                                        Dim LxFV As New Label

                                        LxFV.Text = DtSelectField.Rows(r).Item(c).ToString
                                        LxFV.ToolTip = DtSelectField.Rows(r).Item(c).GetType.ToString()
                                        If DtSelectField.Rows(r).Item(c).GetType.ToString = "System.Decimal" Then
                                            LxFV.Text = Format(DtSelectField.Rows(r).Item(c), "#,##0.00")
                                        End If
                                        pn1.Controls.Add(New LiteralControl("<td>"))
                                        pn1.Controls.Add(LxF)
                                        pn1.Controls.Add(LxFV)
                                        pn1.Controls.Add(New LiteralControl("</td>"))

                                    Next
                                Next

                            Else
                                Response.Write("Not found data : " & DtForm.Rows(0).Item("TB_NAME_KEY") & ":" & DataID.ToString)
                            End If
                        Catch ex As Exception
                            Response.Write("Please  check data  (TB_NAME,TB_KEY_NAME,TB_SQL :")
                            Response.Write(ex.Message)
                        End Try

                    End If
                End If
                SqlForm.Dispose()

            End If    '  strForm <> "" Then
        End If  '    If FormType = 1 Then  ' ถ้าเป็น form แก้ไข


        ' ดึงข้อมูลจากตาราง form_field  ว่ามี field ใดบ้าง
        Dim sqlField As String = " SELECT   *   FROM  FORM.TB_FORM_FIELD"
        sqlField += " WHERE  FORM_ID= " & FormID
        sqlField += " ORDER  BY  FIELD_GROUP"
        Dim SqlFormField As New SqlDataSource
        SqlFormField.ConnectionString = ConnString
        SqlFormField.SelectCommand = sqlField
        SqlFormField.SelectCommandType = SqlDataSourceCommandType.Text
        Dim dv As New Data.DataView
        dv = CType(SqlFormField.Select(DataSourceSelectArguments.Empty), Data.DataView)
        Dim dt As System.Data.DataTable = dv.Table

        'MsgBox(sqlF & ":" & dt.Rows.Count)



        If Page.IsPostBack Then
            ' case  add  data
            If Request.Form("btnSave") = "Add data" Then
                Try
                    Dim strInsert As String = ""

                    ' ถ้าเป็น form ประเภทที่ 2 คือ form ทีเป็นการบันทึกเพิ่มอย่างเดียว
                    ' จะมีการกำหนด dataid ให้โดยมีการดึงค่าจากฟิวแรกที่กรอก
                    If FormType = 2 Then

                        'DataID = CStr(Request.Form("F" & dt.Rows(0).Item("FIELD_ID")))
                        DataID = Math.Abs((Now.GetHashCode))
                    End If
                    For i = 0 To dt.Rows.Count - 1
                        ' กรณีที่เป็นฟิวส่งข้อมูล และไม่ใช่ฟิวแสดงผล (label)
                        If Not IsDBNull(dt.Rows(i).Item("FIELD_NAME")) And dt.Rows(i).Item("FIELD_TYPE") <> "Label" Then
                            strInsert += " INSERT INTO  FORM.TB_FORM_VALUE "
                            strInsert += "  VALUES (" + FormID.ToString + ","
                            strInsert += CStr(DataID) + ","
                            strInsert += CStr(dt.Rows(i).Item("FIELD_ID"))
                            If dt.Rows(i).Item("FIELD_TYPE") = "TimeStamp" Then
                                strInsert += ",getdate());"
                            Else
                                'MsgBox(dt.Rows(i).Item("FIELD_ID"))
                                strInsert += ",'" + CStr(Request.Form("F" & dt.Rows(i).Item("FIELD_ID"))).Replace("'", "''") + "');"  ' กรณีที่มี single quot ให้เติมอีก 1ตัว ให้สามารถใส่ใน sql statement ได้
                            End If
                        End If
                    Next

                    Dim InsertDatasource As New SqlDataSource
                    InsertDatasource.ConnectionString = ConnString
                    InsertDatasource.InsertCommand = strInsert
                    InsertDatasource.InsertCommandType = SqlDataSourceCommandType.Text
                    InsertDatasource.Insert()
                    labelModal.Text = "Insert  completed."
                Catch ex As Exception
                    labelModal.Text = ex.Message
                End Try
                '  modal.Show()
            End If

            ' case  update data
            If Request.Form("btnSave") = "Edit data" Then


                '============  ลบข้อมูลที่เคยบันทึกและทำการเพิ่มเข้าไปใหม่
                '==========สาเหตที่ไม่ไม่ใช้การ update เนื่องจากอาจมีการเพิ่มหรือลดฟิวที่ต้องกรอกทำให้หา id ในการ update ไม่ได้
                Try

                    Dim strDelete As String = ""
                    strDelete += " DELETE  FROM  FORM.TB_FORM_VALUE"
                    strDelete += " Where  Form_ID=" & FormID '  เงื่อนไขจาก form id
                    strDelete += " AND   Form_Data_ID=" & DataID  '  เงื่อนไขจาก data_id
                    Dim DeleteDatasource As New SqlDataSource
                    DeleteDatasource.ConnectionString = ConnString
                    DeleteDatasource.DeleteCommand = strDelete
                    DeleteDatasource.DeleteCommandType = SqlDataSourceCommandType.Text
                    DeleteDatasource.Delete()

                    Dim strInsert As String = ""
                    For i = 0 To dt.Rows.Count - 1
                        If Not IsDBNull(dt.Rows(i).Item("FIELD_NAME")) And dt.Rows(i).Item("FIELD_TYPE") <> "Label" Then
                            strInsert += " INSERT INTO FORM.TB_FORM_VALUE "
                            strInsert += "  VALUES (" + FormID.ToString + ","
                            strInsert += CStr(DataID) + ","
                            strInsert += CStr(dt.Rows(i).Item("FIELD_ID"))
                            If dt.Rows(i).Item("FIELD_TYPE") = "TimeStamp" Then
                                strInsert += ",getdate());"
                            Else
                                strInsert += ",'" + CStr(Request.Form("F" & dt.Rows(i).Item("FIELD_ID"))).Replace("'", "''") + "');"
                            End If

                        End If
                    Next

                    Dim InsertDatasource As New SqlDataSource
                    InsertDatasource.ConnectionString = ConnString
                    InsertDatasource.InsertCommand = strInsert
                    InsertDatasource.InsertCommandType = SqlDataSourceCommandType.Text
                    InsertDatasource.Insert()
                    labelModal.Text = "Update  completed."
                Catch ex As Exception
                    labelModal.Text = ex.Message
                End Try

                ' modal.Show()
            End If

        Else  ' page post back
            ' delete ไม่ใช่ post back เป็นการส่ง query มาตรง ๆ

            If Request.QueryString("DeleteData") = "true" Then

                Dim id As String = Request.QueryString("DataID")
                Dim strDelete As String = ""
                strDelete += " DELETE  FROM  FORM.TB_FORM_VALUE"
                strDelete += " Where  Form_ID=" & FormID '  เงื่อนไขจาก form id
                strDelete += " AND   Form_Data_ID=" & id  '  เงื่อนไขจาก data_id


                Dim DeleteDatasource As New SqlDataSource
                DeleteDatasource.ConnectionString = ConnString
                DeleteDatasource.DeleteCommand = strDelete
                DeleteDatasource.DeleteCommandType = SqlDataSourceCommandType.Text
                DeleteDatasource.Delete()

            End If



        End If

        ' ======= ค้นหาข้อมูลว่ากรอกไปหรือยัง  โดยดึงข้อมูลจากตารางที่ใช้เก็บค่าที่กรอก  TB_FORM_VALUE
        '=======  เชื่อมกับตาราง TB_FORM_FIELD  เพื่อดูว่าแต่ละฟิวนั้นใช้คอนโทรลอะไรกรอกมาเช่น TextBox , DropDown
        Dim mode As String = ""

        Dim sqlValue As String = " SELECT     V.FORM_VALUE_ID, V.FORM_ID, V.FORM_DATA_ID, V.FORM_FIELD_ID, V.FORM_FIELD_VALUE, F.FIELD_TYPE"
        sqlValue += " FROM   FORM.TB_FORM_VALUE AS V LEFT OUTER JOIN"
        sqlValue += " FORM.TB_FORM_FIELD AS F ON V.FORM_FIELD_ID = F.FIELD_ID"
        sqlValue += " WHERE  V.FORM_ID= " & FormID
        sqlValue += " AND  V.FORM_DATA_ID = '" & DataID & "'"

        Dim valueDataSource As New SqlDataSource
        valueDataSource.ConnectionString = ConnString
        valueDataSource.SelectCommand = sqlValue
        valueDataSource.SelectCommandType = SqlDataSourceCommandType.Text
        Dim valueDataview As New Data.DataView
        valueDataview = CType(valueDataSource.Select(DataSourceSelectArguments.Empty), Data.DataView)
        Dim dta As System.Data.DataTable = valueDataview.Table

        'MsgBox(sqlValue & ":" & dta.Rows.Count)
        If dta.Rows.Count >= 1 Then
            mode = "Edit data"  '  เจอข้อมูลกำหนด mode เป็น edit
        Else
            mode = "Add data"  '  เจอข้อมูลกำหนด mode เป็น edit
        End If




        '=============จบการค้นหาข้อมูลที่กรอกแล้ว
        '============= ส่วนนี้คือการสร้าง form จากข้อมูล field ในตาราง

        Dim FG As Integer = 0 '  เลข group  เป็นการแบ่งบรรทัดถ้าคนละกลุ่มจะทำการตัดบรรทัดให้
        For i = 0 To dt.Rows.Count - 1

            If Not IsDBNull(dt.Rows(i).Item("FIELD_GROUP")) Then
                If FG <> dt.Rows(i).Item("FIELD_GROUP") Then

                    pn1.Controls.Add(New LiteralControl("</td><tr><td>"))   '  เว้นบรรทัด  
                    FG = dt.Rows(i).Item("FIELD_GROUP")
                Else
                    pn1.Controls.Add(New LiteralControl("</td><td>"))   '  เว้นบรรทัด  
                End If
            End If

            ' ตรวจสอบว่าเป็น  admin เป็น true หรือไม่  ถ้าใช้ให้เปลี่ยน label เป็น button สามารถแก้ไขได้
            If Request("admin") = "true" Then


            End If


            Dim L As New Label()
            L.ID = "Label" & i
            Select Case dt.Rows(i).Item("FIELD_TYPE")
                Case "Line"  ' สร้างตัวค้่นกรณีเป็น line
                    pn1.Controls.Add(New LiteralControl("<hr>"))   '  เว้นบรรทัด  
                Case Else  ' ถ้าไม่ใช่เป็นคำปกติ

                    ' L.Text = dt.Rows(i).Item("FIELD_ID") & ":" & dt.Rows(i).Item("FIELD_TEXT")
                    L.Text = dt.Rows(i).Item("FIELD_TEXT")
                    L.ForeColor = Drawing.Color.DarkSlateBlue
                    L.Width = 250
                    L.Attributes.Add("style", "word-wrap:break-word;")
                    pn1.Controls.Add(L)
            End Select

            'pn1.Controls.Add(New LiteralControl("</div>"))   '  ปิด div
            'pn1.Controls.Add(New LiteralControl("<div id='div'" & i & ">"))   '  สร้าง div
            Select Case dt.Rows(i).Item("FIELD_TYPE")
                Case "TextBox"
                    Dim T As New TextBox
                    With dt.Rows(i)
                        T.ID = "F" & .Item("FIELD_ID")
                        If Not IsDBNull(.Item("FIELD_MAX_LENGTH")) Then
                            T.MaxLength = .Item("FIELD_MAX_LENGTH")
                        End If
                        If Not IsDBNull(.Item("FIELD_WIDTH")) Then
                            T.Width = CInt(.Item("FIELD_WIDTH"))
                        Else
                            T.Width = 150
                        End If
                    End With
                    pn1.Controls.Add(T)
                    ' ถ้าเป็น number ให้สร้าง maskedit กำหนดให้ textbox ใส่ได้เฉพาะ number
                    If Not IsDBNull(dt.Rows(i).Item("FIELD_DB_TYPE")) Then
                        If dt.Rows(i).Item("FIELD_DB_TYPE") = "Number" Then
                            Dim filterT As New FilteredTextBoxExtender
                            filterT.ID = "filterF" & dt.Rows(i).Item("FIELD_ID")
                            filterT.TargetControlID = T.ID
                            filterT.ValidChars = "0123456789,."
                            pn1.Controls.Add(filterT)
                        End If
                    End If

                Case "DropDownList"

                    '======== ถ้าเป็น dropdownlist จะต้องมีข้อมูลใน TB_FORM_FIELD_LIST เพื่อสร้างตัวเลือก โดยมี  Form_Field_Id ในการระบุว่าเป็นตัวเลือกของฟิวไหน
                    '==== ในกรณีที่ไม่มี TB_FORM_FIELD_LIST_ID จะต้องมี FORM_FIELD_LIST_VALUE  โดยใส่ในรูป aaa,bbb,cccc
                    '======== ต้องมีการระบุว่าใน field นั้น ดึง list จากไหน  ( FIELD_LIST_ID)


                    Dim T As New DropDownList
                    T.ID = "F" & dt.Rows(i).Item("FIELD_ID")

                    If dt.Rows(i).Item("FIELD_LIST_ID").ToString <> "" Then
                        ' get  field  from database
                        ' arrange by  group    
                        Dim FormFieldID = dt.Rows(i).Item("FIELD_LIST_ID")
                        Dim sql As String = "SELECT   *  FROM  FORM.TB_FORM_FIELD_LIST WHERE  FORM_FIELD_ID= " & FormFieldID
                        Dim SqlDataSourceD As New SqlDataSource
                        SqlDataSourceD.ConnectionString = ConnString
                        SqlDataSourceD.SelectCommand = sql
                        SqlDataSourceD.SelectCommandType = SqlDataSourceCommandType.Text
                        T.DataSource = SqlDataSourceD
                        T.DataValueField = "FIELD_LIST_VALUE"
                        T.DataTextField = "FIELD_LIST_TEXT"
                        T.DataBind()
                    Else
                        If dt.Rows(i).Item("FIELD_LIST_VALUE").ToString <> String.Empty Then
                            If dt.Rows(i).Item("FIELD_LIST_VALUE").ToString.IndexOf(",") > 0 Then
                                Dim FormFieldValue = dt.Rows(i).Item("FIELD_LIST_VALUE").ToString.Split(",")
                                For a = 0 To FormFieldValue.Length - 1
                                    Dim listT As New ListItem
                                    listT.Value = FormFieldValue(a)
                                    listT.Text = FormFieldValue(a)
                                    T.Items.Add(listT)
                                Next
                            End If
                        End If
                    End If

                    T.Items.Insert(0, New ListItem("...Please select...", ""))
                    T.Width = "200"
                    pn1.Controls.Add(T)

                Case "RadioButtonList"
                    Dim FormFieldID = dt.Rows(i).Item("FIELD_ID")
                    Dim T As New RadioButtonList
                    T.ID = "F" & FormFieldID
                    T.RepeatDirection = RepeatDirection.Horizontal
                    T.RepeatLayout = RepeatLayout.Flow
                    T.TextAlign = TextAlign.Right
                    ' get  field  from database
                    ' arrange by  group 
                    Dim sql As String = "SELECT   *  FROM  FORM.TB_FORM_FIELD_LIST WHERE  FORM_FIELD_ID= " & FormFieldID

                    Dim SqlDataSourceD As New SqlDataSource
                    SqlDataSourceD.ConnectionString = ConnString
                    SqlDataSourceD.SelectCommand = sql
                    SqlDataSourceD.SelectCommandType = SqlDataSourceCommandType.Text
                    T.DataSource = SqlDataSourceD
                    T.DataValueField = "FIELD_LIST_VALUE"
                    T.DataTextField = "FIELD_LIST_TEXT"
                    T.DataBind()

                    pn1.Controls.Add(T)

                Case "TextArea"
                    Dim T As New TextBox
                    With dt.Rows(i)
                        T.ID = "F" & .Item("FIELD_ID")
                        T.MaxLength = 255
                        T.TextMode = TextBoxMode.MultiLine
                        T.Rows = 5
                        T.Columns = 10
                        If Not IsDBNull(.Item("FIELD_MAX_LENGTH")) Then
                            T.MaxLength = .Item("FIELD_MAX_LENGTH")
                        End If
                        If Not IsDBNull(.Item("FIELD_WIDTH")) Then
                            T.Width = CInt(.Item("FIELD_WIDTH"))
                        Else
                            T.Width = 150
                        End If
                    End With
                    pn1.Controls.Add(T)

                Case "Calendar"
                    Dim T As New TextBox
                    With dt.Rows(i)
                        T.ID = "F" & .Item("FIELD_ID")
                        If Not IsDBNull(.Item("FIELD_MAX_LENGTH")) Then
                            T.MaxLength = .Item("FIELD_MAX_LENGTH")
                        End If
                        If Not IsDBNull(.Item("FIELD_WIDTH")) Then
                            T.Width = CInt(.Item("FIELD_WIDTH"))
                        Else
                            T.Width = 150
                        End If
                    End With
                    pn1.Controls.Add(T)

                    Dim ce As CalendarExtender = New CalendarExtender()
                    ce.ID = T.ID & "_CalendarExtender"
                    ce.TargetControlID = T.ID
                    'ce.Format = "D/M/Y"
                    'ce.EnableViewState = True
                    pn1.Controls.Add(ce)

                Case "TimeStamp"
                    Dim T As New Label
                    With dt.Rows(i)
                        T.ID = "F" & .Item("FIELD_ID")
                    End With
                    pn1.Controls.Add(T)

                Case "Label"

                    L.ForeColor = Drawing.Color.DarkSlateBlue
                    L.ForeColor = Drawing.Color.Blue
                    L.Font.Underline = True



            End Select


            Dim LF As New Label
            pn1.Controls.Add(New LiteralControl("&nbsp"))   ' สร้างช่องว่าง
            LF.Text = dt.Rows(i).Item("FIELD_TEXT_FOOT").ToString  ' แสดง label ต่อท้ายค่าที่ต้องกรอก
            LF.Width = 100
            pn1.Controls.Add(LF)
            'panel1.Controls.Add(New LiteralControl("</div>"))   '  ปิด div

            If Not IsDBNull(dt.Rows(i).Item("FIELD_REQUIRED")) Then
                If dt.Rows(i).Item("FIELD_REQUIRED") = "Yes" Then
                    ' สร้าง field  validate
                    Dim RQ As New RequiredFieldValidator
                    RQ.ID = "rqF" & dt.Rows(i).Item("FIELD_ID")
                    RQ.ControlToValidate = "F" & dt.Rows(i).Item("FIELD_ID")
                    RQ.ErrorMessage = "Please insert  " & dt.Rows(i).Item("FIELD_TEXT") & "."
                    RQ.Display = ValidatorDisplay.None
                    pn1.Controls.Add(RQ)

                    Dim RQO As New ValidatorCalloutExtender
                    RQO.ID = "rqo" & dt.Rows(i).Item("FIELD_ID")
                    RQO.TargetControlID = RQ.ID
                    RQO.HighlightCssClass = "highlight"
                    RQO.WarningIconImageUrl = "warning.gif"
                    RQO.CloseImageUrl = "close.gif"
                    pn1.Controls.Add(RQO)
                End If

            End If



        Next
        pn1.Controls.Add(New LiteralControl("</tr></table>"))


        Dim sRQ As New ValidationSummary
        sRQ.HeaderText = "ไม่สามารถบันทึกข้อมูล กรุณากรอกข้อมูลเหล่านี้ให้ครบถ้วน"
        sRQ.ShowMessageBox = True
        sRQ.ShowSummary = False
        pn1.Controls.Add(sRQ)

        pn1.Controls.Add(New LiteralControl("<P>"))   '  เว้นบรรทัด
        Dim btnSave As New Button()
        btnSave.ID = "btnSave"
        btnSave.Text = mode
        pn1.Controls.Add(btnSave)



        pn1.Controls.Add(New LiteralControl("&nbsp"))   ' เว้นช่องว่าง

        Dim btnCancel As New Button()
        btnCancel.ID = "btnCancel"
        btnCancel.Text = "Close"
        btnCancel.Attributes.Add("onclick", "window.close();window.opener.location.reload(true);")
        pn1.Controls.Add(btnCancel)

        If mode = "Edit data" Then

            pn1.Controls.Add(New LiteralControl("&nbsp"))   ' เว้นช่องว่าง

            Dim btnDelete As New Button()
            btnDelete.ID = "btnDelete"
            btnDelete.Text = "Delete data"
            btnDelete.BackColor = Drawing.Color.Red
            btnDelete.ForeColor = Drawing.Color.White
            btnDelete.Attributes.Add("onclick", "window.location.href = 'FormCreate.aspx?DeleteData=true&FormID=" & FormID & "&DataID=" & DataID & "'")
            pn1.Controls.Add(btnDelete)


        End If


        '==== หลังจากสร้าง control แล้วกำหนดค่าให้กับ control 
        If mode = "Edit data" Then

            For d As Integer = 0 To dta.Rows.Count - 1
                Select Case dta.Rows(d).Item("FIELD_TYPE")
                    Case "TextBox", "TextArea", "Calendar"
                        Dim TB As TextBox = Me.FindControl("F" & dta.Rows(d).Item("FORM_FIELD_ID"))
                        TB.Text = dta.Rows(d).Item("FORM_FIELD_VALUE")
                    Case "DropDownList"
                        Dim DL As DropDownList = Me.FindControl("F" & dta.Rows(d).Item("FORM_FIELD_ID"))
                        'MsgBox(dta.Rows(d).Item("FORM_FIELD_VALUE"))
                        'MsgBox(DL.Items.Count)
                        DL.SelectedIndex = DL.Items.IndexOf(DL.Items.FindByValue(dta.Rows(d).Item("FORM_FIELD_VALUE")))
                    Case "RadioButtonList"
                        Dim DL As RadioButtonList = Me.FindControl("F" & dta.Rows(d).Item("FORM_FIELD_ID"))
                        DL.SelectedIndex = DL.Items.IndexOf(DL.Items.FindByValue(dta.Rows(d).Item("FORM_FIELD_VALUE")))
                    Case "TimeStamp"
                        Dim LB As Label = Me.FindControl("F" & dta.Rows(d).Item("FORM_FIELD_ID"))
                        LB.Text = dta.Rows(d).Item("FORM_FIELD_VALUE")

                End Select
            Next




        End If

        If User.IsInRole(RoleIdConst.A_READ_ONLY) Then
            btnSave.Enabled = False
        End If
        SqlFormField.Dispose()

    End Sub
End Class
