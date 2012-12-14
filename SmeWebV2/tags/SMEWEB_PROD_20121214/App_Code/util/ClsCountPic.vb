Imports Microsoft.VisualBasic
Imports System.IO
Imports System.Web.HttpServerUtility

Public Class ClsCountPic

    Function numPic(ByVal PathX As String, ByVal letterX As String, ByVal yexrX As String) As Integer
        '===========Function นับจำนวนรูปภาพ===========
        Dim FileArray() As String
        FileArray = Nothing
        '====== เลือกไฟล์ที่จะนำมาแสดงในหน้าจอ =====================
        Dim critiriaFile As String
        '=========== เลือกว่าจะให้ แสดงข้อมูลไฟล์ รูปภาพ หรือ ไฟล์ Word
        critiriaFile = "*_" & letterX & "_" & yexrX + "*"

        FileArray = Directory.GetFiles(PathX, critiriaFile)
        Return UBound(FileArray) + 1
    End Function
  
End Class
