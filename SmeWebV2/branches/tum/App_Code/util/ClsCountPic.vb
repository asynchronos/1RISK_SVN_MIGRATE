Imports Microsoft.VisualBasic
Imports System.IO
Imports System.Web.HttpServerUtility

Public Class ClsCountPic

    Function numPic(ByVal PathX As String, ByVal letterX As String, ByVal yexrX As String) As Integer
        '===========Function �Ѻ�ӹǹ�ٻ�Ҿ===========
        Dim FileArray() As String
        FileArray = Nothing
        '====== ���͡�����й����ʴ��˹�Ҩ� =====================
        Dim critiriaFile As String
        '=========== ���͡��Ҩ���� �ʴ���������� �ٻ�Ҿ ���� ��� Word
        critiriaFile = "*_" & letterX & "_" & yexrX + "*"

        FileArray = Directory.GetFiles(PathX, critiriaFile)
        Return UBound(FileArray) + 1
    End Function
  
End Class
