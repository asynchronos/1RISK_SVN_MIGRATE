Imports Microsoft.VisualBasic

Public Class ClsChangeType
    Function Bay_CStr(ByVal Mytext As Object) As String
        If IsDBNull(Mytext) Then
            Return ("")
        Else
            Return CStr(Mytext)
        End If
    End Function
    Function Bay_CInt(ByVal Mytext As Object) As String
        If IsDBNull(Mytext) Then
            Return (0)
        Else
            Return CInt(Mytext)
        End If
    End Function
    Function Bay_CDbl(ByVal Mytext As Object) As String
        If IsDBNull(Mytext) Then
            Return (0.0)
        Else
            Return CDbl(Mytext)
        End If
    End Function
    Function Bay_NULL() As String
        Return Nothing
    End Function
    Function ChgTrimtoNull(ByVal myText As String) As String
        If myText.Trim.ToString = "" Then
            Return ("Null")
        Else
            Return (myText)
        End If
    End Function

    ' * This function formats dates.  If the date is null, then an empty string is returned
    Public Function FormatDate(ByVal dt As Object) As String
        If Not IsDBNull(dt) Then
            Return CType(dt, Date).ToString("MMM dd, yyyy")
        Else
            Return String.Empty
        End If
    End Function
    Public Function FormatDateThai(ByVal dt As Object) As String
        If Not IsDBNull(dt) Then
            Return CType(dt, Date).ToString("dd MMM yyyy")
        Else
            Return String.Empty
        End If
    End Function

    Public Function FormatCurrency(ByVal DataItem As Object) As String
        If Not (IsDBNull(DataItem) Or DataItem.ToString = String.Empty) Then
            Return CType(DataItem, Double).ToString("c")
        Else
            Return "--"
        End If
    End Function

    Public Function FormatPercentage(ByVal DataItem As Object) As String
        If Not IsDBNull(DataItem) Then
            Dim strP As String = CType(DataItem, String)
            If Not strP = String.Empty Then
                Return CType(DataItem, Double).ToString("##0'%'")
            Else
                Return "--"
            End If
        Else
            Return "--"
        End If

    End Function
End Class
