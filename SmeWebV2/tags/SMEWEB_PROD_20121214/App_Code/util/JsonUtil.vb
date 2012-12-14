Option Explicit On
Option Strict On

Imports Microsoft.VisualBasic
Imports System.Runtime.Serialization.Json

Public Class JsonUtil
    Public Shared Function serialize2JSON(ByVal obj As Object) As String
        Dim result As String = Nothing

        Dim _serializer As New DataContractJsonSerializer(obj.GetType)
        Dim _memoryStream As New System.IO.MemoryStream
        Dim _writer As System.Xml.XmlDictionaryWriter = JsonReaderWriterFactory.CreateJsonWriter(_memoryStream)

        _serializer.WriteObject(_memoryStream, obj)
        _writer.Flush()

        result = Encoding.UTF8.GetString(_memoryStream.GetBuffer)

        Return result
    End Function
End Class
