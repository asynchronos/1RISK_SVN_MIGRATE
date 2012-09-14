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
    ''' ใช้ในกรณีทำ transaction ที่ Class อื่น
    ''' </summary>
    ''' <param name="viewer"></param>
    ''' <param name="sqlCmd"></param>
    ''' <remarks></remarks>
    Public Sub InsertAnnalsViewer(ByVal viewer As AnnalsViewer, ByVal sqlCmd As SqlCommand)
        dal.insertAnnalsViewer(viewer, sqlCmd)
    End Sub

    ''' <summary>
    ''' ใช้หลังจาก insert annlas ในกรณีทำ transaction ที่ Class อื่น
    ''' </summary>
    ''' <param name="type"></param>
    ''' <param name="seq"></param>
    ''' <param name="year"></param>
    ''' <param name="sender"></param>
    ''' <param name="reciver"></param>
    ''' <param name="sqlCmd"></param>
    ''' <remarks></remarks>
    Public Sub InsertAnnalsViewerAfterInsertAnnals(ByVal type As String, ByVal seq As String, ByVal year As String, ByVal sender As String, ByVal reciver As String, ByVal sqlCmd As SqlCommand)
        'sender = "ยุกต์:128678,กิตติวรรณ:094094,พิศญาพร:242545:67890"
        'reciver = "กิตติวรรณ:094094,test:12345:67890"

        'Merge sender&viewer
        Dim annalsViewList As List(Of AnnalsViewer) = Me.MergeViewerList(type, seq, year, sender, reciver)

        If annalsViewList.Count > 0 Then
            'ทำการเพิ่มข้อมูล emp id ที่วิวหนังสือได้ลง database
            For i As Integer = 0 To annalsViewList.Count - 1
                Me.InsertAnnalsViewer(annalsViewList(i), sqlCmd)
            Next
        End If

    End Sub

    ''' <summary>
    ''' ใช้หลังจาก update annals ในกรณีทำ transaction ที่ Class อื่น
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
        'sender = "ยุกต์:128678,กิตติวรรณ:094094,พิศญาพร:242545:67890"
        'reciver = "กิตติวรรณ:094094,test:12345:67890"

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
    ''' ใช้ในกรณีทำ transaction ที่ Class อื่น
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
    ''' เพิ่ม reciver ใน annals(ต่อ String) แล้ว Insert ใน annals viewer ด้วย
    ''' </summary>
    ''' <param name="viewer"></param>
    ''' <param name="reciverString">ต้องอยู่ใน format Name:EMP_ID เช่น ทดสอบ:00001</param>
    ''' <param name="sqlCmd"></param>
    ''' <remarks></remarks>
    Public Sub addAnnalsReciverAndViewer(ByVal viewer As AnnalsViewer, ByVal reciverString As String, ByVal sqlCmd As SqlCommand)
        dal.addAnnalsReciver(viewer, reciverString, sqlCmd)
        dal.insertAnnalsViewer(viewer, sqlCmd)
    End Sub
#End Region

    Public Function MergeViewerList(ByVal type As String, ByVal seq As String, ByVal year As String, ByVal sender As String, ByVal reciver As String) As List(Of AnnalsViewer)
        'sender = "ยุกต์:128678,กิตติวรรณ:094094,พิศญาพร:242545:67890"
        'reciver = "กิตติวรรณ:094094,test:12345:67890"

        Dim annalsViewList As New List(Of AnnalsViewer)
        Dim viewer As String() = Nothing
        'ทำการแยกแต่ละคนออกจากกัน (คนแต่ละคนจะถูกคั่นด้วย ,)
        viewer = sender.Split(",".ToCharArray, StringSplitOptions.RemoveEmptyEntries)

        For i As Integer = 0 To viewer.Length - 1
            'ทำการแยกชื่อกับ emp id ออกจากกัน (แยกด้วย :)
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
                'check sender,reciver ว่ามีค่าที่ซ้ำกันอยู่หรือไม่(นำค่า emp id ของ reciver มาเช็คกับค่า sender ที่เก็บแล้วใน list1)
                Dim listCount As Integer = 0
                While listCount < annalsViewList.Count
                    Dim annalsViewerCheck As AnnalsViewer = annalsViewList.Item(listCount)
                    If Not emp_id(empIdCount).Equals(annalsViewerCheck.EMP_ID) Then
                        'ถ้าไม่ซ้ำ ทำ while ต่อ(เช็ค emp id กับ sender ตัวต่อไป)
                        listCount += 1
                        Continue While
                    Else
                        'ถ้าซ้ำ ทำ For ต่อ(เช็ค emp id ของ viewer ตัวต่อไปทันที)
                        Continue For
                    End If
                End While

                'ถ้าทำ While(listCount < annalsViewList.Count) จบแสดงว่าไม่มีซ้ำจึงแอดเก็บลงลิส
                Dim annalsViewer As New AnnalsViewer(type, seq, year, emp_id(empIdCount))
                annalsViewList2.Add(annalsViewer)
                empIdCount += 1
            End While

        Next

        'รวม list 1 และ 2
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
                    'ไม่ insert EMP_ID นี้ ทำ for ต่อ 
                    Continue For
                End If
                list2Count += 1
            End While
            'EMP_ID ใน list ใหม่ไม่มีใน list เก่า 
            'เก็บลง result เพื่อนำไป Insert ลง Viewer
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
                    'ไม่ delete EMP_ID นี้ ทำ for ต่อ 
                    Continue For
                End If
                list1Count += 1
            End While
            'EMP_ID ใน list เก่าไม่มีใน list ใหม่ 
            'เก็บลง result เพื่อนำไป Delete ใน Viewer
            result.Add(originalAnnalsViewList(list2Count))
        Next

        Return result
    End Function
End Class
