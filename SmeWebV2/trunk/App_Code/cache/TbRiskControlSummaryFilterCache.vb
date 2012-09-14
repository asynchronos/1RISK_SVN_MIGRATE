Option Strict On
Option Explicit On

Imports System.Diagnostics
Imports System.Data.SqlClient
Imports System.Collections
Imports System.Data
Imports System.Collections.Generic
Imports Microsoft.VisualBasic

Public Class TbRiskControlSummaryFilterCache
    Implements DataCache

    Private cacheObj As Object

    Public Sub New()
        load()
    End Sub

    Public Function getArraylist() As ArrayList Implements DataCache.getArraylist
        Dim result As ArrayList = Nothing

        result = New ArrayList(DirectCast(getObject(), List(Of TbRiskControlSummaryFilter)))

        Return result
    End Function

    ''' <summary>
    ''' 
    ''' </summary>
    ''' <returns>List(Of TbRiskControlSummaryFilter)</returns>
    ''' <remarks></remarks>
    Public Function getObject() As Object Implements DataCache.getObject

        If IsNothing(cacheObj) Then
            load()
        End If

        Return New List(Of TbRiskControlSummaryFilter)(DirectCast(cacheObj, List(Of TbRiskControlSummaryFilter)))
    End Function

    Public Sub load() Implements DataCache.load
        Dim bo As New TbRiskControlSummaryFilterBO()

        cacheObj = bo.getAllTbRiskControlSummaryFilter()
    End Sub

End Class
