Option Explicit On
Option Strict On

Partial Class Controls_ExportControl_ExportControl
    Inherits System.Web.UI.UserControl

    Private Const excelContentType As String = "application/vnd.xls; charset=utf-8"
    Private Const wordContentType As String = "application/vnd.word; charset=utf-8"
    Private Const excelExt As String = ".xls"
    Private Const wordExt As String = ".doc"

    Private _filename As String = String.Empty
    Private _controlName As String = String.Empty
    Private _exportDatasourceID As String = String.Empty
    Private _autoGenerateColumns As Boolean = True
    Private _exportMode As ExportModes = ExportModes.Both
    Private _exportFieldList As String = String.Empty

    Public Enum ExportModes
        Excel
        Word
        Both
    End Enum

#Region "Properties"
    <ComponentModel.Browsable(True), ComponentModel.Category("Option"), ComponentModel.Description("Default Filename")> _
    Property Filename() As String
        Get
            Return _filename
        End Get
        Set(ByVal value As String)
            _filename = value
        End Set
    End Property

    <ComponentModel.Browsable(True), ComponentModel.Category("Option"), ComponentModel.Description("Export Mode"), ComponentModel.DefaultValue("Both")> _
    Property ExportMode() As ExportModes
        Get
            Return _exportMode
        End Get
        Set(ByVal value As ExportModes)
            _exportMode = value
        End Set
    End Property

    <ComponentModel.Browsable(True), ComponentModel.Category("Option"), ComponentModel.Description("AutoGenerateColumns"), ComponentModel.DefaultValue(True)> _
    Property AutoGenerateColumns() As Boolean
        Get
            Return _autoGenerateColumns
        End Get
        Set(ByVal value As Boolean)
            _autoGenerateColumns = value
        End Set
    End Property

    <ComponentModel.Browsable(True), ComponentModel.Category("Data"), ComponentModel.Description("Control ID")> _
    Property ControlName() As String
        Get
            Return _controlName
        End Get
        Set(ByVal value As String)
            _controlName = value
        End Set
    End Property

    <ComponentModel.Browsable(True), ComponentModel.Category("Data"), ComponentModel.Description("EXPORT Datasource ID")> _
    Property ExportDatasourceID() As String
        Get
            Return _exportDatasourceID
        End Get
        Set(ByVal value As String)
            _exportDatasourceID = value
        End Set
    End Property

    <ComponentModel.Browsable(True), ComponentModel.Category("Appearance"), ComponentModel.Description("buttonText"), ComponentModel.DefaultValue("Export")> _
    Property ButtonText() As String
        Get
            Return ExportButton.Text
        End Get
        Set(ByVal value As String)
            ExportButton.Text = value
        End Set
    End Property

    Property ExportFieldList() As String
        Get
            Return _exportFieldList
        End Get
        Set(ByVal value As String)
            _exportFieldList = value
        End Set
    End Property

#End Region

#Region "My Method"

    Protected Sub PrepareControlForExport(ByVal cont As Control)
        Dim l As New Literal
        Dim name As String = String.Empty

        For i As Integer = 0 To cont.Controls.Count - 1

            Dim iButt As IButtonControl = Nothing
            Dim listCon As ListControl = Nothing
            Dim iCheckBox As ICheckBoxControl = Nothing

            'Try
            iButt = TryCast(cont.Controls(i), IButtonControl)
            'Catch ex As InvalidCastException
            'Try
            listCon = TryCast(cont.Controls(i), ListControl)
            'Catch ex2 As InvalidCastException
            'Try
            iCheckBox = TryCast(cont.Controls(i), ICheckBoxControl)
            'Catch ex3 As InvalidCastException
            ' can't cast to anything in list
            ' use oiginal type of that control
            'End Try
            'End Try
            'End Try

            If Not IsNothing(iButt) Then
                l.Text = iButt.Text
                cont.Controls.RemoveAt(i)
                cont.Controls.AddAt(i, l)

                Dim linkButt As LinkButton = Nothing

                If l.Text.Equals("Select") Then
                    cont.Controls(i).Visible = False
                End If

            ElseIf Not IsNothing(listCon) Then
                l.Text = listCon.SelectedItem.Text
                cont.Controls.RemoveAt(i)
                cont.Controls.AddAt(i, l)
            ElseIf Not IsNothing(iCheckBox) Then
                l.Text = If(iCheckBox.Checked, "True", "False")
                cont.Controls.RemoveAt(i)
                cont.Controls.AddAt(i, l)
            End If

            'If cont.Controls(i).GetType Is GetType(IButtonControl) Then
            '    l.Text = TryCast(cont.Controls(i), IButtonControl).Text
            '    cont.Controls.Remove(cont.Controls(i))
            '    cont.Controls.AddAt(i, l)
            '    cont.Controls(i).Visible = False
            'ElseIf cont.Controls(i).[GetType]() Is GetType(DropDownList) Then
            '    l.Text = TryCast(cont.Controls(i), DropDownList).SelectedItem.Text
            '    cont.Controls.Remove(cont.Controls(i))
            '    cont.Controls.AddAt(i, l)
            'ElseIf cont.Controls(i).[GetType]() Is GetType(CheckBox) Then
            '    l.Text = If(TryCast(cont.Controls(i), CheckBox).Checked, "True", "False")
            '    cont.Controls.Remove(cont.Controls(i))
            '    cont.Controls.AddAt(i, l)
            'End If

            If cont.Controls(i).HasControls() Then
                PrepareControlForExport(cont.Controls(i))
            End If
        Next
    End Sub

    Protected Sub ExportData(ByVal _contentType As String, ByVal filename As String)
        Response.ClearContent()
        Response.ClearHeaders()
        Response.AppendHeader("content-disposition", "attachment;filename=" + filename)
        Response.Cache.SetCacheability(HttpCacheability.NoCache)
        Response.ContentType = _contentType
        Response.ContentEncoding = System.Text.Encoding.UTF8

        Dim sw As New IO.StringWriter()
        Dim htw As New HtmlTextWriter(sw)
        Dim frm As New HtmlForm()

        Dim cont As GridView = Nothing

        Try
            cont = DirectCast(Me.Parent.FindControl(controlName), GridView)
        Catch ex As Exception
            Throw New Exception(ex.Message & " : " & ex.StackTrace)
        End Try

        Dim DataSourceIDTemp As String = cont.DataSourceID
        'ถ้า exportDatasourceID ไม่เป็นค่าว่าง
        If Not exportDatasourceID.Equals(String.Empty) Then
            cont.DataSourceID = exportDatasourceID
        End If

        If AutoGenerateColumns.Equals(True) Then
            cont.Columns.Clear()
        End If
        cont.AutoGenerateColumns = AutoGenerateColumns

        'เก็บค่า allowPaging ของ control ไว้
        Dim pagingTemp As Boolean = cont.AllowPaging
        'เปลี่ยน paging เป็น false
        cont.AllowPaging = False
        'bind ใหม่
        cont.DataBind()

        PrepareControlForExport(cont)

        frm.Attributes("runat") = "server"
        frm.Controls.Add(cont)
        frm.Page = Me.Page.Page

        frm.RenderControl(htw)
        Response.Write(sw.ToString())
        Response.End()

        'เปลี่ยนค่า paging กลับเหมือนเดิม
        cont.AllowPaging = pagingTemp
        'เปลี่ยนค่า DatasourceID กลับเหมือนเดิม
        cont.DataSourceID = DataSourceIDTemp
    End Sub

#End Region

    Protected Sub ExportButton_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles ExportButton.Click
        Dim contentType As String = Nothing
        Dim extension As String = Nothing

        Select Case ExportMode
            Case ExportModes.Both
                Select Case RadioButtonList1.SelectedIndex
                    Case 0
                        'Exporting datagrid to Excel
                        contentType = excelContentType
                        extension = excelExt
                    Case 1
                        'Exporting datagrid to Word
                        contentType = wordContentType
                        extension = wordExt
                    Case Else
                        'Exporting datagrid to Excel
                        contentType = excelContentType
                        extension = excelExt
                End Select
            Case ExportModes.Word
                'Exporting datagrid to Word
                contentType = wordContentType
                extension = wordExt
            Case Else
                'Exporting datagrid to Excel
                contentType = excelContentType
                extension = excelExt
        End Select

        ExportData(contentType, Filename + extension)
    End Sub

    Protected Sub Page_Init(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Init
        If Filename.Equals(String.Empty) Then
            Filename = "FileName"
        End If
    End Sub

    Protected Sub RadioButtonList1_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles RadioButtonList1.Load

        'Dim attri As AttributeCollection = DirectCast(sender, RadioButtonList).Items.FindByText("Word").Attributes

        Select Case ExportMode
            Case ExportModes.Both
                'do nothing
            Case Else
                DirectCast(sender, RadioButtonList).Visible = False
        End Select

    End Sub
End Class
