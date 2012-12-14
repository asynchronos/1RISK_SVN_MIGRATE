Option Explicit On
Option Strict On

Imports Microsoft.VisualBasic
Imports System.Globalization

Public Class ConvertUtil

    ''' <summary>
    ''' StringValue = ข้อความ
    ''' NumbericValue = จำนวนเต็ม
    ''' DoubleValue = เลขทศนิยม
    ''' DateValue = วันที่
    ''' BooleanValue = ค่า boolean
    ''' TimeValue = เวลา
    ''' </summary>
    ''' <remarks></remarks>
    Public Enum ObjectValueEnum
        StringValue
        NumbericValue
        DoubleValue
        DateValue
        BooleanValue
        TimeValue
    End Enum

    ''' <summary>
    ''' Numeric = #,###0.00
    ''' NumericNoDecimal = จำนวนเต็ม
    ''' FullDate = 'วัน'dddd'ที่' d MMMM gg yyyy
    ''' LongDate = dd-MMMM-yyyy
    ''' ShortDate = dd-MMM-yy
    ''' </summary>
    ''' <remarks></remarks>
    Public Enum ObjectFormatEnum
        Numeric
        NumericNoDecimal
        FullDate
        LongDate
        ShortDate
    End Enum

    Public Enum DateWithCultureEnum
        FullDate
        LongDate
        ShortDate
    End Enum

    ''' <summary>
    ''' Funtion นี้ใช้สำหรับแปลงข้อมูลที่ได้รับจาก database หรือ Object ใดๆ ที่มีค่า Null
    ''' ให้เป็นค่า Default ของ Type ต่างๆตามที่เราต้องการ
    ''' ไม่เช่นนั้น หากเรานำค่า Null ไปใช้งานจะทำให้เกิด Error ได้
    ''' </summary>
    ''' <param name="Value">Object ที่ต้องการแปลง</param>
    ''' <param name="GetObject">Type ที่ต้องการ</param>
    ''' <returns>ค่า Default ของ Type นั้นๆ</returns>
    ''' <remarks>ค่า Default ของ GetObject คือ StringValue</remarks>
    Public Shared Function getObjectValue(ByVal Value As Object, Optional ByVal GetObject As ObjectValueEnum = ObjectValueEnum.StringValue) As Object
        Dim result As Object = String.Empty

        Select Case GetObject
            Case ObjectValueEnum.BooleanValue

                Try
                    result = CBool(Value)
                Catch ex As Exception
                    result = False
                End Try

            Case ObjectValueEnum.DateValue

                Try
                    result = CDate(Value)
                Catch ex As Exception
                    ' result = DateTime.Now
                    result = Nothing
                End Try

            Case ObjectValueEnum.NumbericValue

                Try
                    result = CInt(Value)
                Catch ex As Exception
                    result = 0
                End Try

            Case ObjectValueEnum.DoubleValue

                Try
                    result = CDbl(Value)
                Catch ex As Exception
                    result = 0
                End Try

            Case ObjectValueEnum.StringValue

                Try
                    result = CStr(Value)
                Catch ex As Exception
                    result = String.Empty
                End Try

            Case ObjectValueEnum.TimeValue

                Try
                    result = CDate(Value)
                Catch ex As Exception
                    result = DateTime.Now
                End Try

        End Select

        Return result
    End Function

    ''' <summary>
    ''' Function นี้ใช้สำหรับ set format ของ object ต่างๆ
    ''' เช่น Format ของวันที่แบบสั้น,ยาว
    ''' Format ของเวลา
    ''' หรือ Format ของเลขทศนิยม
    ''' </summary>
    ''' <param name="Target">Object ที่ต้องการ set format</param>
    ''' <param name="FormatType">รูปแบบของ Format</param>
    ''' <returns>Object ที่ถูกจัด format แล้ว</returns>
    Public Shared Function setObjectFormat(ByVal Target As Object, Optional ByVal FormatType As ObjectFormatEnum = ObjectFormatEnum.Numeric) As String
        Dim result As String = String.Empty

        Select Case FormatType
            Case ObjectFormatEnum.FullDate
                result = Format(getObjectValue(Target, ObjectValueEnum.DateValue), "'วัน'dddd'ที่' d MMMM gg yyyy")
            Case ObjectFormatEnum.LongDate
                result = Format(getObjectValue(Target, ObjectValueEnum.DateValue), "dd/MMMM/yyyy")
            Case ObjectFormatEnum.Numeric
                result = Format(getObjectValue(Target, ObjectValueEnum.DoubleValue), "#,###0.00")
            Case ObjectFormatEnum.NumericNoDecimal
                result = Format(getObjectValue(Target, ObjectValueEnum.DoubleValue), "#,###0")
            Case ObjectFormatEnum.ShortDate
                result = Format(getObjectValue(Target, ObjectValueEnum.DateValue), "dd/MMM/yy")
        End Select

        Return result
    End Function

    Public Shared Function getDateFormatWithCulture(ByVal dateIn As Date, ByVal cultureIn As CultureInfo, Optional ByVal FormatType As DateWithCultureEnum = DateWithCultureEnum.ShortDate) As String
        Dim result As String = Nothing
        Dim FormatStr As String = Nothing

        Select Case FormatType
            Case DateWithCultureEnum.FullDate
                If (cultureIn.Name.StartsWith("th")) Then
                    FormatStr = "'วัน'dddd'ที่' d MMMM gg yyyy"
                Else
                    FormatStr = "dddd d, MMMM gg yyyy"
                End If
            Case DateWithCultureEnum.LongDate
                FormatStr = "dd MMMM yyyy"
            Case DateWithCultureEnum.ShortDate
                FormatStr = "dd/MMM/yy"
        End Select

        If IsDate(dateIn) Then
            result = getDateFormatWithCulture(dateIn, cultureIn, FormatStr)
        Else
            result = "0"
        End If

        Return result
    End Function

    Public Shared Function getDateFormatWithCulture(ByVal dateIn As Date, ByVal cultureIn As CultureInfo, ByVal FormatType As String) As String
        Return dateIn.ToString(FormatType, cultureIn)
    End Function

    Public Shared Function getDateFormat(ByVal dateIn As Date, ByVal FormatType As String) As String
        Return getDateFormatWithCulture(dateIn, New System.Globalization.CultureInfo("en-US"), FormatType)
    End Function

    Public Shared Function chagneYearFormatToEng(ByVal yearIn As String) As String
        Dim result As String = Nothing
        result = (CType(yearIn, Integer) + 543).ToString
        Return result
    End Function

End Class
