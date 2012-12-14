Imports Microsoft.VisualBasic

Public Class ClsDateFunctionsUtil

    Public Shared Function MediumDate(ByVal str As Date) As String
        Try
            Dim aDay, aMonth, aYear As String
            aDay = Day(str).ToString
            aMonth = MonthName(Month(str), True)
            aYear = Year(str).ToString
            MediumDate = aDay & "-" & aMonth & "-" & aYear
            Return MediumDate
        Catch ex As Exception
            ' MsgBox(ex.Message, 48, AppName)
            Return Nothing
        End Try

    End Function  'MediumDate

    Public Shared Function ShortDate(ByVal str As Date) As String
        Try
            ShortDate = Day(str) & "/" & Month(str) & "/" & Year(str)
            Return ShortDate
        Catch ex As Exception
            ' MsgBox(ex.Message, 48, AppName)
            Return Nothing
        End Try
    End Function  'ShortDate

    Public Shared Function ShortDate_thai(ByVal str As Date) As String
        Dim aDay, aMonth, aYear As String
        Try
            aDay = Day(str).ToString
            aMonth = Month(str).ToString
            aYear = Year(str).ToString
            Select Case CType(aMonth, Integer)
                Case 1
                    aMonth = "�.�."
                Case 2
                    aMonth = "�.�."
                Case 3
                    aMonth = "��.�."
                Case 4
                    aMonth = "��.�."
                Case 5
                    aMonth = "�.�."
                Case 6
                    aMonth = "��.�."
                Case 7
                    aMonth = "�.�."
                Case 8
                    aMonth = "�.�."
                Case 9
                    aMonth = "�.�."
                Case 10
                    aMonth = "�.�."
                Case 11
                    aMonth = "�.�."
                Case 12
                    aMonth = "�.�."
                Case Else
                    aMonth = ""
            End Select
            If Mid(aYear, 2, 1) = "0" Then aYear = (CInt(aYear) + 543).ToString
            ShortDate_thai = aDay & " " & aMonth & " " & aYear
            Return ShortDate_thai
        Catch ex As Exception
            ' MsgBox(ex.Message, 48, AppName)
            Return Nothing
        End Try
    End Function  'ShortDate

    Public Shared Function LongDate_thai(ByVal str As Date) As String
        Dim aDay, aMonth, aYear As String
        Try
            aDay = Day(str).ToString
            aMonth = Month(str).ToString
            aYear = Year(str).ToString
            Select Case CType(aMonth, Integer)
                Case 1
                    aMonth = "���Ҥ�"
                Case 2
                    aMonth = "����Ҿѹ��"
                Case 3
                    aMonth = "�չҤ�"
                Case 4
                    aMonth = "����¹"
                Case 5
                    aMonth = "����Ҥ�"
                Case 6
                    aMonth = "�Զع�¹"
                Case 7
                    aMonth = "�á�Ҥ�"
                Case 8
                    aMonth = "�ԧ�Ҥ�"
                Case 9
                    aMonth = "�ѹ��¹"
                Case 10
                    aMonth = "���Ҥ�"
                Case 11
                    aMonth = "��Ȩԡ�¹"
                Case 12
                    aMonth = "�ѹ�Ҥ�"
                Case Else
                    aMonth = ""
            End Select
            If Mid(aYear, 2, 1) = "0" Then aYear = (CInt(aYear) + 543).ToString
            LongDate_thai = aDay & " " & aMonth & " " & aYear
            Return LongDate_thai
        Catch ex As Exception
            ' MsgBox(ex.Message, 48, AppName)
            Return Nothing
        End Try
    End Function  'ShortDate

    Public Shared Function LongMonth_thai(ByVal str As String) As String
        Dim aMonth As String
        'aMonth = Month(str)
        Select Case CType(str, Integer)
            Case 1
                aMonth = "���Ҥ�"
            Case 2
                aMonth = "����Ҿѹ��"
            Case 3
                aMonth = "�չҤ�"
            Case 4
                aMonth = "����¹"
            Case 5
                aMonth = "����Ҥ�"
            Case 6
                aMonth = "�Զع�¹"
            Case 7
                aMonth = "�á�Ҥ�"
            Case 8
                aMonth = "�ԧ�Ҥ�"
            Case 9
                aMonth = "�ѹ��¹"
            Case 10
                aMonth = "���Ҥ�"
            Case 11
                aMonth = "��Ȩԡ�¹"
            Case 12
                aMonth = "�ѹ�Ҥ�"
            Case Else
                aMonth = ""
        End Select

        LongMonth_thai = aMonth
        Return LongMonth_thai

    End Function  'ShortDate

    Public Shared Function ShortMonth_thai(ByVal str As String) As String
        Dim aMonth As String

        'aMonth = Month(str)

        Select Case CType(str, Integer)
            Case 1
                aMonth = "�.�."
            Case 2
                aMonth = "�.�."
            Case 3
                aMonth = "��.�."
            Case 4
                aMonth = "��.�."
            Case 5
                aMonth = "�.�."
            Case 6
                aMonth = "��.�."
            Case 7
                aMonth = "�.�."
            Case 8
                aMonth = "�.�."
            Case 9
                aMonth = "�.�."
            Case 10
                aMonth = "�.�."
            Case 11
                aMonth = "�.�."
            Case 12
                aMonth = "�.�."
            Case Else
                aMonth = ""
        End Select

        ShortMonth_thai = aMonth
        Return ShortMonth_thai
    End Function  'ShortDate

    Public Shared Function LongYear_thai(ByVal str As String) As String
        Dim aYear As String
        aYear = str
        If Mid(aYear, 2, 1) = "0" Then aYear = (CInt(aYear) + 543).ToString

        LongYear_thai = aYear
        Return LongYear_thai

    End Function  'ShortDate

    Public Shared Function LongYear(ByVal str As String) As String
        Dim aYear As String
        aYear = str
        If Mid(aYear, 2, 1) = "5" Then aYear = (CInt(aYear) - 543).ToString

        LongYear = aYear
        Return LongYear

    End Function  'ShortDate

    Public Shared Function DBDATE(ByVal str As String, ByVal strMM As String, ByVal strYY As String, ByVal strFlag As String) As String
        Dim strSpilt() As String
        Try
            strSpilt = Split(str, "/")
            Dim C_MM As String = strSpilt(0)
            Dim C_DD As String = strSpilt(1)
            Dim C_YY As String = strSpilt(2)
            Select Case UCase(strMM)
                Case "SHORTMONTH_THAI"
                    C_MM = ShortMonth_thai(C_MM)
                Case "LONGMONTH_THAI"
                    C_MM = LongMonth_thai(C_MM)
            End Select
            If Mid(C_YY, 1, 1) <> "9" Then
                If Mid(C_YY, 2, 1) = "5" Then C_YY = C_YY Else C_YY = (CInt(C_YY) + 543).ToString
            End If
            Select Case UCase(strYY)
                Case "SHORTYEAR_THAI"
                    C_YY = Mid(C_YY, 3, 2)
            End Select
            Return C_DD & strFlag & C_MM & strFlag & C_YY
        Catch ex As Exception
            ' MsgBox(ex.Message, 48, AppName)
            Return Nothing
        End Try
    End Function
End Class
