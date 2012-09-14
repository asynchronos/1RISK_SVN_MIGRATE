Option Explicit On
Option Strict On

Imports Microsoft.VisualBasic
Imports System.Collections.Generic
Imports System.Diagnostics

Public Class RiskControllingBO
    Private Shared className As String = "RiskControllingBO"
    Private dal As New RiskControllingDAL()

    Public Function getCustomerInControllingSummary(ByVal EMP_IDs As String, _
                        ByVal filter1 As String, ByVal filter2 As String, ByVal filter3 As String, ByVal filter4 As String, _
                        ByVal order1 As String, ByVal order2 As String, ByVal order3 As String, ByVal order4 As String) As List(Of RiskCotrollingSummary)

        Dim result As List(Of RiskCotrollingSummary) = Nothing
        Dim filter As TbRiskControlSummaryFilter = Nothing

        Dim selectColumn As String = ""
        Dim groupBy As String = ""
        Dim orderBy As String = ""

        'must use cache
        Dim filterList As ArrayList = MyCacheFactory.getCache(MyCacheFactory.cacheKeyEnum.TbRiskControlSummaryFilter).getArraylist()

        Dim filterListCheck(filterList.Count - 1) As Boolean '1.TDR, 2.CLASS

        'เช็คว่า filter 1 คืออะไร
        For i As Integer = 0 To filterList.Count - 1
            If (i = 0) Then
                Continue For
            End If

            filter = DirectCast(filterList.Item(i), TbRiskControlSummaryFilter)

            If (filter1.Equals(filter.PropertyInClass)) Then

                'ถ้าฟิลเตอร์นี้เคย add ไปแล้วไม่ต้อง add ใน sql อีก
                If (filterListCheck(i) = True) Then
                    Exit For
                End If

                selectColumn += prepareSelectColumn(filter)

                groupBy += prepareGroupBy(filter)

                orderBy += prepareOrderBy(filter, order1)

                filterListCheck(i) = True

                Exit For
            End If
        Next

        'เช็คว่า filter 2 คืออะไร
        For i As Integer = 0 To filterList.Count - 1
            If (i = 0) Then
                Continue For
            End If

            filter = DirectCast(filterList.Item(i), TbRiskControlSummaryFilter)

            If (filter2.Equals(filter.PropertyInClass)) Then

                'ถ้าฟิลเตอร์นี้เคย add ไปแล้วไม่ต้อง add ใน sql อีก
                If (filterListCheck(i) = True) Then
                    Exit For
                End If

                selectColumn += prepareSelectColumn(filter)

                groupBy += prepareGroupBy(filter)

                orderBy += prepareOrderBy(filter, order2)

                filterListCheck(i) = True

                Exit For
            End If
        Next

        'เช็คว่า filter 3 คืออะไร
        For i As Integer = 0 To filterList.Count - 1
            If (i = 0) Then
                Continue For
            End If

            filter = DirectCast(filterList.Item(i), TbRiskControlSummaryFilter)

            If (filter3.Equals(filter.PropertyInClass)) Then

                'ถ้าฟิลเตอร์นี้เคย add ไปแล้วไม่ต้อง add ใน sql อีก
                If (filterListCheck(i) = True) Then
                    Exit For
                End If

                selectColumn += prepareSelectColumn(filter)

                groupBy += prepareGroupBy(filter)

                orderBy += prepareOrderBy(filter, order3)

                filterListCheck(i) = True

                Exit For
            End If
        Next

        'เช็คว่า filter 4 คืออะไร
        For i As Integer = 0 To filterList.Count - 1
            If (i = 0) Then
                Continue For
            End If

            filter = DirectCast(filterList.Item(i), TbRiskControlSummaryFilter)

            If (filter4.Equals(filter.PropertyInClass)) Then

                'ถ้าฟิลเตอร์นี้เคย add ไปแล้วไม่ต้อง add ใน sql อีก
                If (filterListCheck(i) = True) Then
                    Exit For
                End If

                selectColumn += prepareSelectColumn(filter)

                groupBy += prepareGroupBy(filter)

                orderBy += prepareOrderBy(filter, order4)

                filterListCheck(i) = True

                Exit For
            End If
        Next

        'เช็คดูว่าคอลัมน์ใดยังไม่ได้ถูกใส่ไว้ใน sql 
        For i As Integer = 1 To filterListCheck.Length - 1
            If filterListCheck(i) = False Then
                filter = DirectCast(filterList.Item(i), TbRiskControlSummaryFilter)

                selectColumn += " NULL AS " + filter.FilterColumn + ", "

            End If
        Next

        If Not (groupBy.Trim.Equals("")) Then
            groupBy = " GROUP BY " + groupBy.Substring(1)
        End If

        If Not (orderBy.Trim.Equals("")) Then
            orderBy = " ORDER BY " + orderBy.Substring(1)
        End If

        'result = dal.getCustomerInControllingSummary(EMP_IDs, currentPage, pageSize, selectColumn, groupBy, orderBy)
        result = dal.getCustomerInControllingSummary(EMP_IDs, selectColumn, groupBy, orderBy)

        Return result
    End Function

    Public Function getCustomerInControlling(ByVal EMP_ID As String, ByVal currentPage As Integer, _
                        ByVal pageSize As Integer, ByVal condition As String) As Hashtable

        Dim result As Hashtable = Nothing

        If IsNothing(condition) Then
            condition = ""
        Else
            condition = "WHERE " + condition
        End If

        result = dal.getCustomerInControlling(EMP_ID, currentPage, pageSize, condition)

        Return result
    End Function

    Private Function prepareSelectColumn(ByVal filter As TbRiskControlSummaryFilter) As String
        Return " " + filter.FilterTable + "." + filter.FilterColumn + " AS " + filter.FilterColumn + ", "
    End Function

    Private Function prepareGroupBy(ByVal filter As TbRiskControlSummaryFilter) As String
        Return "," + filter.FilterTable + "." + filter.FilterColumn + " "
    End Function

    Private Function prepareOrderBy(ByVal filter As TbRiskControlSummaryFilter, ByVal order As String) As String
        Return "," + filter.FilterColumn + " " + order + " "
    End Function

    Private Function prepareSubOrderBy(ByVal filter As TbRiskControlSummaryFilter, ByVal order As String) As String
        Return "," + filter.FilterTable + "." + filter.FilterColumn + " " + reverseOrder(order) + " "
    End Function

    Private Function reverseOrder(ByVal order As String) As String
        Dim result As String = "DESC"

        If (order.Equals("DESC")) Then
            result = "ASC"
        End If

        Return result
    End Function
End Class
