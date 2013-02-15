Option Explicit On
Option Strict On

Imports System.Collections.Generic
Imports System.Data.SqlClient

Partial Class aspx_annals_annalsDetail
    Inherits System.Web.UI.Page

#Region "Custom Code"
    'regisConfirmScript("Delete", "�س��ͧ���ź������?")
    Private Sub regisConfirmScript(ByVal key As String, ByVal message As String)
        Dim script As String = "function confirm" & key & "(){" & vbCrLf _
                            & vbTab & "return confirm(""" & message & """);" & vbCrLf _
                            & "}" & vbCrLf
        Page.ClientScript.RegisterClientScriptBlock(Me.GetType, key, script, True)
    End Sub

#Region "Event"
    Protected Sub SENDERTextBox_Load(ByVal sender As Object, ByVal e As System.EventArgs)
        '��੾������ insert 
        If (AnnalsFormView.CurrentMode = FormViewMode.Insert) Then
            '�������ͤ� login �繼����
            DirectCast(sender, TextBox).Text = Session.Item(SessionKeyConst.EMP_NAME).ToString + ":" + Session.Item(SessionKeyConst.EMP_ID).ToString
        End If
    End Sub

    Protected Sub CopyButton_Load(ByVal sender As Object, ByVal e As System.EventArgs)
        Dim CopyButton As Button = DirectCast(sender, Button)
        Dim FULL_SEQ_NOLabel As Label = DirectCast(CopyButton.Parent.FindControl("FULL_SEQ_NOLabel"), Label)

        CopyButton.OnClientClick = "copy2Clipboard(""" + FULL_SEQ_NOLabel.ClientID + """);return false;"
    End Sub

    Protected Sub ReciverSearchImage_Load(ByVal sender As Object, ByVal e As System.EventArgs)
        If Not (AnnalsFormView.CurrentMode = FormViewMode.ReadOnly) Then
            Dim rsi As Image = DirectCast(AnnalsFormView.FindControl("ReciverSearchImage"), Image)
            Dim rsTextBox As TextBox = DirectCast(AnnalsFormView.FindControl("RECIVERTextBox"), TextBox)
            Dim typeDDL As DropDownList = DirectCast(AnnalsFormView.FindControl("ANNALS_TYPEDropDownList"), DropDownList)

            'controlId �դ����������ǡѺ return_target_id ��� �繪��� id �������˹�� popup �¹��ҡ�Ѻ�����
            '��Ѻ�ѹ�Ѻ SenderSearchImage_Load
            rsi.Attributes.Add("onclick", "var ddlDOM = ele(""" + typeDDL.ClientID + """);" _
                                        + "var typeStr = ddlDOM.options[ddlDOM.selectedIndex].text;" _
                                        + "if (""IN"" == typeStr){" _
                                            + " conLinePopup = window.open('" + Page.ResolveUrl("~/aspx/employee/controllingLine.aspx") + "?return_target_id=" + rsTextBox.ClientID + "&source_id=" + rsTextBox.ClientID + "','conLinePopup','toolbar=No,width=650,height=600,resizable=no,scrollbars=yes');" _
                                            + " conLinePopup.focus();" _
                                        + "}else if (""OUT"" == typeStr){" _
                                            + " conLinePopup = window.open('" + Page.ResolveUrl("~/aspx/appointment/searchRisk.aspx") + "?return_target_id=[""" + rsTextBox.ClientID + """]','conLinePopup','toolbar=No,width=650,height=500,resizable=no,scrollbars=yes');" _
                                            + " conLinePopup.focus();" _
                                        + "}else{" _
                                            + " alert(""��س����͡������˹ѧ��͡�͹"");" _
                                        + "}")
        End If
    End Sub

    Protected Sub SenderSearchImage_Load(ByVal sender As Object, ByVal e As System.EventArgs)
        If Not (AnnalsFormView.CurrentMode = FormViewMode.ReadOnly) Then
            Dim ssi As Image = DirectCast(AnnalsFormView.FindControl("SenderSearchImage"), Image)
            Dim ssTextBox As TextBox = DirectCast(AnnalsFormView.FindControl("SENDERTextBox"), TextBox)
            Dim typeDDL As DropDownList = DirectCast(AnnalsFormView.FindControl("ANNALS_TYPEDropDownList"), DropDownList)

            'controlId �դ����������ǡѺ return_target_id ��� �繪��� id �������˹�� popup �¹��ҡ�Ѻ�����
            '��Ѻ�ѹ�Ѻ ReciverSearchImage_Load
            ssi.Attributes.Add("onclick", "var ddlDOM = ele(""" + typeDDL.ClientID + """);" _
                                        + "var typeStr = ddlDOM.options[ddlDOM.selectedIndex].text;" _
                                        + "if (""IN"" == typeStr){" _
                                            + " conLinePopup = window.open('" + Page.ResolveUrl("~/aspx/appointment/searchRisk.aspx") + "?return_target_id=[""" + ssTextBox.ClientID + """]','conLinePopup','toolbar=No,width=650,height=500,resizable=no,scrollbars=yes');" _
                                            + " conLinePopup.focus();" _
                                        + "}else if (""OUT"" == typeStr){" _
                                            + " conLinePopup = window.open('" + Page.ResolveUrl("~/aspx/employee/controllingLine.aspx") + "?return_target_id=" + ssTextBox.ClientID + "&source_id=" + ssTextBox.ClientID + "','conLinePopup','toolbar=No,width=650,height=600,resizable=no,scrollbars=yes');" _
                                            + " conLinePopup.focus();" _
                                        + "}else{" _
                                            + " alert(""��س����͡������˹ѧ��͡�͹"");" _
                                        + "}")
        End If
    End Sub

    Protected Sub DepartSearchImage_Load(ByVal sender As Object, ByVal e As System.EventArgs)
        If Not (AnnalsFormView.CurrentMode = FormViewMode.ReadOnly) Then
            Dim DepartSearchImg As Image = DirectCast(AnnalsFormView.FindControl("DepartSearchImage"), Image)
            Dim DEPART_REFERTextBox As TextBox = DirectCast(AnnalsFormView.FindControl("DEPART_REFERTextBox"), TextBox)
            
            DepartSearchImg.Attributes.Add("onclick", " conLinePopup = window.open('" + Page.ResolveUrl("~/aspx/employee/Department.aspx") + "?return_target_id=" + DEPART_REFERTextBox.ClientID + "','conLinePopup','toolbar=No,width=650,height=550,resizable=no,scrollbars=yes');" _
                                                    + " conLinePopup.focus();")
        End If
    End Sub
#End Region

    ''' <summary>
    ''' ������Ѻ�֧��Ҩҡ��ͧ sender ��� reciver �´֧ emp_id �͡�����͹���ʹ� table annals_viewer
    ''' </summary>
    ''' <param name="type"></param>
    ''' <param name="seq"></param>
    ''' <param name="year"></param>
    ''' <param name="sender"></param>
    ''' <param name="reciver"></param>
    ''' <remarks></remarks>
    Private Sub InsertAnnalsViewer(ByVal type As String, ByVal seq As String, ByVal year As String, ByVal sender As String, ByVal reciver As String)
        'sender = "�ء��:128678,�Ե����ó:094094,��ȭҾ�:242545:67890"
        'reciver = "�Ե����ó:094094,test:12345:67890"

        Dim annalsViewList As New List(Of AnnalsViewer)
        Dim viewer As String() = Nothing
        '�ӡ���¡���Ф��͡�ҡ�ѹ
        viewer = sender.Split(",".ToCharArray, StringSplitOptions.RemoveEmptyEntries)

        For i As Integer = 0 To viewer.Length - 1
            '�ӡ���¡���͡Ѻ emp id �͡�ҡ�ѹ
            Dim emp_id As String() = viewer(i).Split(":".ToCharArray, StringSplitOptions.RemoveEmptyEntries)

            Dim j As Integer = 1
            While j < emp_id.Length
                Dim annalsViewer As New AnnalsViewer(type, seq, year, emp_id(j))
                annalsViewList.Add(annalsViewer)
                j += 1
            End While
        Next

        Dim annalsViewList2 As New List(Of AnnalsViewer)
        viewer = reciver.Split(",".ToCharArray, StringSplitOptions.RemoveEmptyEntries)

        For i As Integer = 0 To viewer.Length - 1
            'Dim emp_id As String = viewer(i).Substring(viewer(i).IndexOf(":") + 1)
            Dim emp_id As String() = viewer(i).Split(":".ToCharArray, StringSplitOptions.RemoveEmptyEntries)

            Dim empIdCount As Integer = 1
            While empIdCount < emp_id.Length
                'check sender,reciver ����դ�ҷ���ӡѹ�����������(�Ӥ�� emp id �ͧ reciver ���礡Ѻ��� sender ���������� list1)
                Dim listCount As Integer = 0
                While listCount < annalsViewList.Count
                    Dim annalsViewerCheck As AnnalsViewer = annalsViewList.Item(listCount)
                    If Not emp_id(empIdCount).Equals(annalsViewerCheck.EMP_ID) Then
                        '�������� �� while ���(�� emp id �Ѻ sender ��ǵ���)
                        listCount += 1
                        Continue While
                    Else
                        '��ҫ�� �� For ���(�� emp id �ͧ viewer ��ǵ��价ѹ��)
                        Continue For
                    End If
                End While

                '��ҷ� While(listCount < annalsViewList.Count) ���ʴ��������ի�Ө֧�ʹ��ŧ���
                Dim annalsViewer As New AnnalsViewer(type, seq, year, emp_id(empIdCount))
                annalsViewList2.Add(annalsViewer)
                empIdCount += 1
            End While

        Next

        '��� list 1 ��� 2
        annalsViewList.AddRange(annalsViewList2)

        '����բ��������ʨ֧�ӡ��ź���� insert
        If annalsViewList.Count > 0 Then
            Dim dal As New AnnalsViewerDAL()

            '�ӡ��ź������ viewer �ͧ˹ѧ��͹��� database �͡��������͹����
            dal.deleteAnnalsViewerByFullSeq(annalsViewList(0))

            '�ӡ������������ emp id ������˹ѧ�����ŧ database
            For i As Integer = 0 To annalsViewList.Count - 1
                dal.insertAnnalsViewer(annalsViewList(i))
            Next
        End If
        
    End Sub

#End Region '"Custom Code"

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        'reset error text
        ErrorLabel.Text = String.Empty

        If (Not IsNothing(Request.QueryString.Item("type"))) And (Not IsNothing(Request.QueryString.Item("seq"))) And (Not IsNothing(Request.QueryString.Item("year"))) Then
            '���� query string �� type seq year �ʴ���������� view
            AnnalsFormView.DefaultMode = FormViewMode.ReadOnly

            If Not IsNothing(Request.QueryString.Item("return_target_id")) Then
                '���� view ˹ѧ����͡ ����ͧ return ���
                Dim FULL_SEQ_NOLabel As Label = DirectCast(AnnalsFormView.FindControl("FULL_SEQ_NOLabel"), Label)

                Dim script As String = "window.onunload = function(){" _
                                        + "ele(getValueFromQueryString('return_target_id'),window.opener).value = ele('" + FULL_SEQ_NOLabel.ClientID + "').innerText;" _
                                        + "};"

                Page.ClientScript.RegisterClientScriptBlock(Me.GetType, "unloadScript", script, True)

                Dim CreateCreditBtn As Button = DirectCast(AnnalsFormView.FindControl("CreateCredit"), Button)
                CreateCreditBtn.Visible = False
            End If
        Else
            '���� insert
            If Not IsNothing(Request.QueryString.Item("return_target_id")) Then
                '���� insert ˹ѧ����͡ ����ͧ return ���
                Dim ddl As DropDownList = DirectCast(AnnalsFormView.FindControl("ANNALS_TYPEDropDownList"), DropDownList)
                ddl.SelectedIndex = 2
                ddl.Enabled = False
            End If
        End If

        'set mode �� edit ������� edit ��ѹ��
        If Not IsNothing(Request.QueryString.Item("formViewMode")) Then
            If Request.QueryString.Item("formViewMode").Equals("edit") Then
                AnnalsFormView.ChangeMode(FormViewMode.Edit)
            End If
        End If

    End Sub

    Protected Sub CloseBtn_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles CloseBtn.Load
        If Not IsNothing(Request.QueryString.Item("mode")) Then
            If Request.QueryString.Item("mode").Equals("divPopup") Then
                DirectCast(sender, Button).Visible = False
            End If
        End If
    End Sub

    Protected Sub HEADERTextBox_Load(ByVal sender As Object, ByVal e As System.EventArgs)
        Dim HEADERTextBox As TextBox = DirectCast(sender, TextBox)
        Dim subjectDDL As DropDownList = DirectCast(HEADERTextBox.Parent.FindControl("SubjectDropDownList"), DropDownList)

        If Not (subjectDDL.SelectedValue.Equals("����ͧ����")) Then
            HEADERTextBox.Text = subjectDDL.SelectedValue
        End If

        If subjectDDL.SelectedValue.Trim.Length < 1 Then
            HEADERTextBox.Style.Add("visibility", "visible")
        Else
            HEADERTextBox.Style.Add("visibility", "hidden")
        End If
    End Sub

    Protected Sub HEADERTextBox_DataBinding(ByVal sender As Object, ByVal e As System.EventArgs)
        Dim HEADERTextBox As TextBox = DirectCast(sender, TextBox)
        Dim subjectDDL As DropDownList = DirectCast(HEADERTextBox.Parent.FindControl("SubjectDropDownList"), DropDownList)

        For i As Integer = 0 To subjectDDL.Items.Count - 1
            If subjectDDL.Items(i).Value.Equals(HEADERTextBox.Text) Then
                subjectDDL.SelectedIndex = i
                HEADERTextBox.Style.Add("visibility", "hidden")
                Exit For
            Else
                subjectDDL.SelectedIndex = subjectDDL.Items.Count - 1
                HEADERTextBox.Style.Add("visibility", "visible")
            End If
        Next
    End Sub

    Protected Sub SubjectDropDownList_Load(ByVal sender As Object, ByVal e As System.EventArgs)
        Dim subjectDDL As DropDownList = DirectCast(sender, DropDownList)
        Dim HEADERTextBox As TextBox = DirectCast(subjectDDL.Parent.FindControl("HEADERTextBox"), TextBox)

        Dim onChangeScript As String = "mapDropdown2TextboxById('" + subjectDDL.ClientID + "','" + HEADERTextBox.ClientID + "','value');showHideTextBox('" + HEADERTextBox.ClientID + "');"

        subjectDDL.Attributes.Add("onchange", onChangeScript)
    End Sub

    Protected Sub AnnalsDS_Updating(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.SqlDataSourceCommandEventArgs) Handles AnnalsDS.Updating
        e.Command.Parameters("@SENDER").Value = Annals.removeDuplicate(e.Command.Parameters("@SENDER").Value.ToString)
        e.Command.Parameters("@RECIVER").Value = Annals.removeDuplicate(e.Command.Parameters("@RECIVER").Value.ToString)

        e.Command.Connection.Open()
        e.Command.Transaction = e.Command.Connection.BeginTransaction()
    End Sub

    Protected Sub AnnalsDS_Updated(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.SqlDataSourceStatusEventArgs) Handles AnnalsDS.Updated
        '<UpdateParameters>
        '    <asp:Parameter Name="SENDER" Type="String" />
        '    <asp:Parameter Name="RECIVER" Type="String" />
        '    <asp:Parameter Name="REFERENCE" Type="String" />
        '    <asp:Parameter Name="HEADER" Type="String" />
        '    <asp:Parameter Name="DETAIL" Type="String" />
        '    <asp:Parameter Name="DEPART_REFER" Type="String" />
        '    <asp:Parameter Name="DATE_IN_ANNALS" Type="DateTime" />
        '    <asp:Parameter Name="original_ANNALS_TYPE" Type="String" />
        '    <asp:Parameter Name="original_ANNALS_SEQ_NO" Type="String" />
        '    <asp:Parameter Name="original_ANNALS_YEAR" Type="String" />
        '    <asp:Parameter Name="original_SENDER" Type="String" />
        '    <asp:Parameter Name="original_RECIVER" Type="String" />
        '    <asp:Parameter Name="original_REFERENCE" Type="String" />
        '    <asp:Parameter Name="original_HEADER" Type="String" />
        '    <asp:Parameter Name="original_DETAIL" Type="String" />
        '    <asp:Parameter Name="original_DEPART_REFER" Type="String" />
        '    <asp:Parameter Name="original_DATE_IN_ANNALS" Type="String" />
        '</UpdateParameters>
        '�پ������������� sqlDatasource

        '��ѧ update annals ��ͧ insert annals viewer ����
        Try
            Dim bo As New AnnalsViewerBO()
            bo.InsertAnnalsViewerAfterUpdateAnnals(e.Command.Parameters(7).Value.ToString, e.Command.Parameters(8).Value.ToString, e.Command.Parameters(9).Value.ToString, e.Command.Parameters(10).Value.ToString, e.Command.Parameters(11).Value.ToString, e.Command.Parameters(0).Value.ToString, e.Command.Parameters(1).Value.ToString, DirectCast(e.Command, SqlCommand))
            e.Command.Transaction.Commit()
        Catch ex As Exception
            e.Command.Transaction.Rollback()
            ErrorLabel.Text = ex.Message + " : �������ö Update ��������<br/>��سҵԴ��� admin"
        End Try

    End Sub

    Protected Sub AnnalsDS_Inserting(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.SqlDataSourceCommandEventArgs) Handles AnnalsDS.Inserting
        e.Command.Parameters("@SENDER").Value = Annals.removeDuplicate(e.Command.Parameters("@SENDER").Value.ToString)
        e.Command.Parameters("@RECIVER").Value = Annals.removeDuplicate(e.Command.Parameters("@RECIVER").Value.ToString)

        e.Command.Connection.Open()
        e.Command.Transaction = e.Command.Connection.BeginTransaction()
        'e.Command.Connection.BeginTransaction()
    End Sub

    Protected Sub AnnalsDS_Inserted(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.SqlDataSourceStatusEventArgs) Handles AnnalsDS.Inserted
        '<InsertParameters>
        '    <asp:Parameter Name="ANNALS_TYPE" Type="String" />
        '    <asp:Parameter Name="SENDER" Type="String" />
        '    <asp:Parameter Name="RECIVER" Type="String" />
        '    <asp:Parameter Name="REFERENCE" Type="String" />
        '    <asp:Parameter Name="HEADER" Type="String" />
        '    <asp:Parameter Name="DETAIL" Type="String" />
        '    <asp:Parameter Name="DEPART_REFER" Type="String" />
        '    <asp:Parameter Name="DATE_IN_ANNALS" Type="DateTime" />
        '    <asp:Parameter Direction="InputOutput" Name="ANNALS_SEQ_NO_OUT" Type="String" Size="5"/>
        '    <asp:Parameter Direction="InputOutput" Name="ANNALS_YEAR_OUT" Type="String" Size="4"/>
        '</InsertParameters>
        '�پ������������� sqlDatasource
        'InsertAnnalsViewer(e.Command.Parameters(0).Value.ToString, e.Command.Parameters(8).Value.ToString, e.Command.Parameters(9).Value.ToString, e.Command.Parameters(1).Value.ToString, e.Command.Parameters(2).Value.ToString)

        'initial url ���� redirect
        Dim redirectUrl As String = "~/aspx/annals/annalsDetail.aspx?type=" + e.Command.Parameters(0).Value.ToString _
                            + "&seq=" + e.Command.Parameters(8).Value.ToString _
                            + "&year=" + e.Command.Parameters(9).Value.ToString

        If Not IsNothing(Request.QueryString.Item("return_target_id")) Then
            redirectUrl = redirectUrl + "&return_target_id=" + Request.QueryString.Item("return_target_id")
        End If

        '��ѧ insert ��ͧ insert annals viewer ����
        Try
            Dim bo As New AnnalsViewerBO()
            bo.InsertAnnalsViewerAfterInsertAnnals(e.Command.Parameters(0).Value.ToString, e.Command.Parameters(8).Value.ToString, e.Command.Parameters(9).Value.ToString, e.Command.Parameters(1).Value.ToString, e.Command.Parameters(2).Value.ToString, DirectCast(e.Command, SqlCommand))
            e.Command.Transaction.Commit()
        Catch ex As Exception
            e.Command.Transaction.Rollback()
            ErrorLabel.Text = ex.Message + " : �������ö Insert ��������<br/>��سҵԴ��� admin"
            redirectUrl = String.Empty
        End Try

        '�������Դ error �� redirectUrl ������� empty
        If Not redirectUrl.Equals(String.Empty) Then
            '����� empty ����ʴ����Ѿ������ŷ���� Insert
            Response.Redirect(redirectUrl)
        End If

    End Sub

    Protected Sub InsertButton_PreRender(ByVal sender As Object, ByVal e As System.EventArgs)
        If User.IsInRole(RoleIdConst.A_READ_ONLY) Then
            DirectCast(sender, WebControl).Enabled = False
        End If
    End Sub

    Protected Sub UpdateButton_PreRender(ByVal sender As Object, ByVal e As System.EventArgs)
        If User.IsInRole(RoleIdConst.A_READ_ONLY) Then
            DirectCast(sender, WebControl).Enabled = False
        End If
    End Sub

    Protected Sub EditButton_PreRender(ByVal sender As Object, ByVal e As System.EventArgs)
        If User.IsInRole(RoleIdConst.A_READ_ONLY) Then
            DirectCast(sender, WebControl).Enabled = False
        End If
    End Sub
End Class
