Option Strict On
Option Explicit On

Imports Microsoft.VisualBasic

Public Class MyCacheFactory

    Public Shared ReadOnly cacheCount As Integer = 5

    Public Enum cacheKeyEnum
        TbRiskControlSummaryFilter
        DebtDate
        Tbdasof
        FullControllingLevelCache
        AllControllingUser
    End Enum

    Private Shared myCache(cacheCount - 1) As DataCache

    Public Shared Function getCache(ByVal key As MyCacheFactory.cacheKeyEnum) As DataCache

        Select Case key
            Case cacheKeyEnum.TbRiskControlSummaryFilter
                If IsNothing(myCache(key)) Then
                    myCache(key) = New TbRiskControlSummaryFilterCache()
                End If
                Exit Select
            Case cacheKeyEnum.DebtDate
                If IsNothing(myCache(key)) Then
                    myCache(key) = New DebtDateCache()
                End If
                Exit Select
            Case cacheKeyEnum.Tbdasof
                If IsNothing(myCache(key)) Then
                    myCache(key) = New TbdasofCache()
                End If
                Exit Select
            Case cacheKeyEnum.FullControllingLevelCache
                If IsNothing(myCache(key)) Then
                    myCache(key) = New FullControllingLevelCache()
                End If
                Exit Select
            Case cacheKeyEnum.AllControllingUser
                If IsNothing(myCache(key)) Then
                    myCache(key) = New AllControllingUserCache()
                End If
                Exit Select
            Case Else
                Exit Select
        End Select

        Return myCache(key)
    End Function

    Public Shared Sub refreshAllCache()
        For i As Integer = 0 To cacheCount - 1
            refreshCache(i)
        Next
    End Sub

    Public Shared Sub refreshCache(ByVal key As MyCacheFactory.cacheKeyEnum)
        refreshCache(CType(key, Integer))
    End Sub

    Public Shared Sub refreshCache(ByVal index As Integer)
        If Not IsNothing(myCache(index)) Then
            SyncLock myCache(index)
                myCache(index).load()
            End SyncLock
        End If
    End Sub

    
End Class
