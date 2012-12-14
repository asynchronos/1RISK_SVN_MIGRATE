Option Strict On
Option Explicit On

Imports System.Diagnostics
Imports System.Data.SqlClient
Imports System.Collections
Imports System.Data
Imports System.Collections.Generic
Imports Microsoft.VisualBasic

Public Class AllControllingUserCache
    Implements DataCache

    Private cacheObj As Object

    Public Sub New()
        load()
    End Sub

    Public Function getArraylist() As ArrayList Implements DataCache.getArraylist
        Dim result As ArrayList = Nothing

        result = New ArrayList(DirectCast(getObject(), List(Of ControllingUserFullDesc)))

        Return result
    End Function

    ''' <summary>
    ''' 
    ''' </summary>
    ''' <returns>List(Of ControllingUserFullDesc)</returns>
    ''' <remarks></remarks>
    Public Function getObject() As Object Implements DataCache.getObject

        If IsNothing(cacheObj) Then
            load()
        End If

        Return New List(Of ControllingUserFullDesc)(DirectCast(cacheObj, List(Of ControllingUserFullDesc)))
    End Function

    Public Sub load() Implements DataCache.load
        Dim dal As New ControllingLevelDAL()

        'cacheObj = dal.getAllControllingUser()
        cacheObj = dal.getAllUserByClassify()
    End Sub


End Class
