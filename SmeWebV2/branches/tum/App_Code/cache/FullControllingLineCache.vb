Option Strict On
Option Explicit On

Imports System.Diagnostics
Imports System.Data.SqlClient
Imports System.Collections
Imports System.Data
Imports System.Collections.Generic
Imports Microsoft.VisualBasic

Public Class FullControllingLevelCache
    Implements DataCache

    Private cacheObj As Object

    Public Sub New()
        load()
    End Sub

    Public Function getArraylist() As ArrayList Implements DataCache.getArraylist
        Dim result As ArrayList = Nothing

        result = New ArrayList(DirectCast(getObject(), List(Of ControllingLevel)))

        Return result
    End Function

    ''' <summary>
    ''' 
    ''' </summary>
    ''' <returns>List(Of ControllingLevel)</returns>
    ''' <remarks></remarks>
    Public Function getObject() As Object Implements DataCache.getObject

        If IsNothing(cacheObj) Then
            load()
        End If

        Return New List(Of ControllingLevel)(DirectCast(cacheObj, List(Of ControllingLevel)))
    End Function

    Public Sub load() Implements DataCache.load
        Dim dal As New ControllingLevelDAL()

        'cacheObj = dal.getFullControllingLevel()
        cacheObj = dal.getClassifyTreeByKey(2673)
    End Sub


End Class
