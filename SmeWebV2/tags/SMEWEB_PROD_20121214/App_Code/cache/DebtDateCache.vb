Option Strict On
Option Explicit On

Imports System.Diagnostics
Imports System.Data.SqlClient
Imports System.Collections
Imports System.Data
Imports System.Collections.Generic
Imports Microsoft.VisualBasic

Public Class DebtDateCache
    Implements DataCache

    Private cacheObj As Object

    Public Sub New()
        load()
    End Sub

    Public Function getArraylist() As ArrayList Implements DataCache.getArraylist
        Dim result As ArrayList = Nothing

        result = New ArrayList(DirectCast(getObject(), Hashtable))

        Return result
    End Function

    ''' <summary>
    ''' 
    ''' </summary>
    ''' <returns>Hashtable</returns>
    ''' <remarks></remarks>
    Public Function getObject() As Object Implements DataCache.getObject

        If IsNothing(cacheObj) Then
            load()
        End If

        Return New Hashtable(DirectCast(cacheObj, Hashtable))
    End Function

    Public Sub load() Implements DataCache.load
        Dim bo As New DebtdateBO()

        cacheObj = bo.getAllDebtdate()
    End Sub


End Class
