Option Explicit On
Option Strict On

Imports Microsoft.VisualBasic
Imports System.Data
Imports System.Data.SqlClient
Imports System.Diagnostics
Imports System.Collections.Generic

Public Class DebtdateBO

    Private Shared className As String = "DebtdateBO"
    Private dal As New DebtdateDAL()

    Public Function getAllDebtdate() As Hashtable
        Dim hash As Hashtable = dal.getAllDebtdate()

        Dim rows As ArrayList = DirectCast(hash.Item("ROWS"), ArrayList)

        '�Ӥ�ҷ������� List ���� record �������� hash ������� Table �� key(���Ǿ�����˭������)
        Dim obj As Debtdate = Nothing
        For i As Integer = 0 To rows.Count - 1
            obj = DirectCast(rows(i), Debtdate)
            hash.Add(obj.Upd_TABLE.ToUpper, obj)
        Next

        Return hash
    End Function

End Class