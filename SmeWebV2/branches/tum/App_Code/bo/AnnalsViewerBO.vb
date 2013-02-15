Option Explicit On
Option Strict On

Imports Microsoft.VisualBasic
Imports System.Data.SqlClient
Imports System.Collections.Generic
Imports System.Diagnostics

Public Class AnnalsViewerBO
    Private Shared className As String = "AnnalsViewerBO"
    Private dal As AnnalsViewerDAL = Nothing

    Public Sub New()
        MyBase.New()
        dal = New AnnalsViewerDAL()
    End Sub

#Region "Insert"

    Public Sub InsertAnnalsViewer(ByVal viewer As AnnalsViewer)
        dal.insertAnnalsViewer(viewer)
    End Sub

    ''' <summary>
    ''' ��㹡óշ� transaction ��� Class ���
    ''' </summary>
    ''' <param name="viewer"></param>
    ''' <param name="sqlCmd"></param>
    ''' <remarks></remarks>
    Public Sub InsertAnnalsViewer(ByVal viewer As AnnalsViewer, ByVal sqlCmd As SqlCommand)
        dal.insertAnnalsViewer(viewer, sqlCmd)
    End Sub

    ''' <summary>
    ''' ����ѧ�ҡ insert annlas 㹡óշ� transaction ��� Class ���
    ''' </summary>
    ''' <param name="type"></param>
    ''' <param name="seq"></param>
    ''' <param name="year"></param>
    ''' <param name="sender"></param>
    ''' <param name="reciver"></param>
    ''' <param name="sqlCmd"></param>
    ''' <remarks></remarks>
    Public Sub InsertAnnalsViewerAfterInsertAnnals(ByVal type As String, ByVal seq As String, ByVal year As String, ByVal sender As String, ByVal reciver As String, ByVal sqlCmd As SqlCommand)
        'sender = "�ء��:128678,�Ե����ó:094094,��ȭҾ�:242545:67890"
        'reciver = "�Ե����ó:094094,test:12345:67890"

        'Merge sender&viewer
        Dim annalsViewList As List(Of AnnalsViewer) = Me.MergeViewerList(type, seq, year, sender, reciver)

        If annalsViewList.Count > 0 Then
            '�ӡ������������ emp id ������˹ѧ�����ŧ database
            For i As Integer = 0 To annalsViewList.Count - 1
                Me.InsertAnnalsViewer(annalsViewList(i), sqlCmd)
            Next
        End If

    End Sub

    ''' <summary>
    ''' ����ѧ�ҡ update annals 㹡óշ� transaction ��� Class ���
    ''' </summary>
    ''' <param name="original_type"></param>
    ''' <param name="original_seq"></param>
    ''' <param name="original_year"></param>
    ''' <param name="original_sender"></param>
    ''' <param name="original_reciver"></param>
    ''' <param name="sender"></param>
    ''' <param name="reciver"></param>
    ''' <param name="sqlCmd"></param>
    ''' <remarks></remarks>
    Public Sub InsertAnnalsViewerAfterUpdateAnnals(ByVal original_type As String, ByVal original_seq As String, ByVal original_year As String, ByVal original_sender As String, ByVal original_reciver As String, ByVal sender As String, ByVal reciver As String, ByVal sqlCmd As SqlCommand)
        'sender = "�ء��:128678,�Ե����ó:094094,��ȭҾ�:242545:67890"
        'reciver = "�Ե����ó:094094,test:12345:67890"

        'Merge sender&viewer
        Dim annalsViewList As List(Of AnnalsViewer) = Me.MergeViewerList(original_type, original_seq, original_year, sender, reciver)
        Dim originalAnnalsViewList As List(Of AnnalsViewer) = Me.MergeViewerList(original_type, original_seq, original_year, original_sender, original_reciver)

        Dim insertList As List(Of AnnalsViewer) = Me.getInsertListFrom2List(annalsViewList, originalAnnalsViewList)

        For i As Integer = 0 To insertList.Count - 1
            Me.InsertAnnalsViewer(insertList(i), sqlCmd)
        Next

        Dim deleteList As List(Of AnnalsViewer) = Me.getDeleteListFrom2List(annalsViewList, originalAnnalsViewList)

        For i As Integer = 0 To deleteList.Count - 1
            Me.deleteAnnalsViewerWithEmpId(deleteList(i), sqlCmd)
        Next

    End Sub
#End Region

#Region "Delete"
    Public Sub deleteAnnalsViewerByFullSeq(ByVal viewer As AnnalsViewer)
        dal.deleteAnnalsViewerByFullSeq(viewer)
    End Sub

    ''' <summary>
    ''' ��㹡óշ� transaction ��� Class ���
    ''' </summary>
    ''' <param name="viewer"></param>
    ''' <param name="sqlCmd"></param>
    ''' <remarks></remarks>
    Public Sub deleteAnnalsViewerWithEmpId(ByVal viewer As AnnalsViewer, ByVal sqlCmd As SqlCommand)
        dal.deleteAnnalsViewerWithEmpId(viewer, sqlCmd)
    End Sub
#End Region

#Region "Update"
    Public Sub UpdateAnnalsViewer(ByVal viewer As AnnalsViewer)
        dal.updateAnnalsViewer(viewer)
    End Sub

    ''' <summary>
    ''' ���� reciver � annals(��� String) ���� Insert � annals viewer ����
    ''' </summary>
    ''' <param name="viewer"></param>
    ''' <param name="reciverString">��ͧ����� format Name:EMP_ID �� ���ͺ:00001</param>
    ''' <param name="sqlCmd"></param>
    ''' <remarks></remarks>
    Public Sub addAnnalsReciverAndViewer(ByVal viewer As AnnalsViewer, ByVal reciverString As String, ByVal sqlCmd As SqlCommand)
        dal.addAnnalsReciver(viewer, reciverString, sqlCmd)
        dal.insertAnnalsViewer(viewer, sqlCmd)
    End Sub
#End Region

    Public Function MergeViewerList(ByVal type As String, ByVal seq As String, ByVal year As String, ByVal sender As String, ByVal reciver As String) As List(Of AnnalsViewer)
        'sender = "�ء��:128678,�Ե����ó:094094,��ȭҾ�:242545:67890"
        'reciver = "�Ե����ó:094094,test:12345:67890"

        Dim annalsViewList As New List(Of AnnalsViewer)
        Dim viewer As String() = Nothing
        '�ӡ���¡���Ф��͡�ҡ�ѹ (�����Ф��ж١��蹴��� ,)
        viewer = sender.Split(",".ToCharArray, StringSplitOptions.RemoveEmptyEntries)

        For i As Integer = 0 To viewer.Length - 1
            '�ӡ���¡���͡Ѻ emp id �͡�ҡ�ѹ (�¡���� :)
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

        Return annalsViewList
    End Function

    Public Function getInsertListFrom2List(ByVal annalsViewList As List(Of AnnalsViewer), ByVal originalAnnalsViewList As List(Of AnnalsViewer)) As List(Of AnnalsViewer)
        Dim result As New List(Of AnnalsViewer)
        Dim list1Count As Integer = 0
        Dim list2Count As Integer = 0

        For list1Count = 0 To annalsViewList.Count - 1
            list2Count = 0
            While list2Count < originalAnnalsViewList.Count
                If annalsViewList(list1Count).EMP_ID.Equals(originalAnnalsViewList(list2Count).EMP_ID) Then
                    '��� insert EMP_ID ��� �� for ��� 
                    Continue For
                End If
                list2Count += 1
            End While
            'EMP_ID � list ���������� list ��� 
            '��ŧ result ���͹�� Insert ŧ Viewer
            annalsViewList(list1Count).Print()
            result.Add(annalsViewList(list1Count))
        Next

        Return result
    End Function

    Public Function getDeleteListFrom2List(ByVal annalsViewList As List(Of AnnalsViewer), ByVal originalAnnalsViewList As List(Of AnnalsViewer)) As List(Of AnnalsViewer)
        Dim result As New List(Of AnnalsViewer)
        Dim list1Count As Integer = 0
        Dim list2Count As Integer = 0

        For list2Count = 0 To originalAnnalsViewList.Count - 1
            list1Count = 0
            While list1Count < annalsViewList.Count
                If originalAnnalsViewList(list2Count).EMP_ID.Equals(annalsViewList(list1Count).EMP_ID) Then
                    '��� delete EMP_ID ��� �� for ��� 
                    Continue For
                End If
                list1Count += 1
            End While
            'EMP_ID � list ��������� list ���� 
            '��ŧ result ���͹�� Delete � Viewer
            result.Add(originalAnnalsViewList(list2Count))
        Next

        Return result
    End Function
End Class
