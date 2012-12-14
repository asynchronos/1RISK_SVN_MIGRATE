Option Explicit On
Option Strict On

Imports Microsoft.VisualBasic
Imports System.Data
Imports System.Data.SqlClient
Imports System.Diagnostics
Imports System.Collections.Generic

Public Class TbdasofBO

    Private Shared className As String = "TbdasofBO"
    Private dal As New TbdasofDAL()

    Public Function getAllTbdasof() As Hashtable
        Dim hash As Hashtable = dal.getAllTbdasof()

        Dim rows As ArrayList = DirectCast(hash.Item("ROWS"), ArrayList)

        'นำค่าที่อยู่ใน List แต่ละ record มาเก็บไว้ใน hash โดยใช้ชื่อ Table เป็น key(ใช้ตัวพิมพ์ใหญ่ทั้งหมด)
        Dim obj As Tbdasof = Nothing
        For i As Integer = 0 To rows.Count - 1
            obj = DirectCast(rows(i), Tbdasof)
            hash.Add(obj.TB_TABLE.ToUpper, obj)
        Next

        Return hash
    End Function

End Class