Option Explicit On
Option Strict On

Imports Microsoft.VisualBasic
Imports System.Collections.Generic

Public Class TbRiskControlSummaryFilterBO
    Private Shared className As String = "TbRiskControlSummaryFilterBO"
    Private dal As New TbRiskControlSummaryFilterDAL()

    Public Function getTbRiskControlSummaryFilterByFilterID(ByVal objTbRiskControlSummaryFilter As TbRiskControlSummaryFilter) As TbRiskControlSummaryFilter
        Return dal.getTbRiskControlSummaryFilterByFilterID(objTbRiskControlSummaryFilter)
    End Function

    Public Function getTbRiskControlSummaryFilterByFilterID(ByVal FilterID As Integer) As TbRiskControlSummaryFilter
        Return dal.getTbRiskControlSummaryFilterByFilterID(FilterID)
    End Function

    Public Function getAllTbRiskControlSummaryFilter() As List(Of TbRiskControlSummaryFilter)
        Return dal.getAllTbRiskControlSummaryFilter()
    End Function

    Public Sub insertTbRiskControlSummaryFilter(ByVal objTbRiskControlSummaryFilter As TbRiskControlSummaryFilter)
        dal.insertTbRiskControlSummaryFilter(objTbRiskControlSummaryFilter)
    End Sub

    Public Sub updateTbRiskControlSummaryFilter(ByVal objTbRiskControlSummaryFilter As TbRiskControlSummaryFilter)
        dal.updateTbRiskControlSummaryFilter(objTbRiskControlSummaryFilter)
    End Sub

    Public Sub deleteTbRiskControlSummaryFilter(ByVal objTbRiskControlSummaryFilter As TbRiskControlSummaryFilter)
        dal.deleteTbRiskControlSummaryFilter(objTbRiskControlSummaryFilter)
    End Sub

    Public Sub deleteTbRiskControlSummaryFilter(ByVal FilterID As Integer)
        dal.deleteTbRiskControlSummaryFilter(FilterID)
    End Sub

End Class
