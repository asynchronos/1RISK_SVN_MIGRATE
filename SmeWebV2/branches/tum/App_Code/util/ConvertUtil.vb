Option Explicit On
Option Strict On

Imports Microsoft.VisualBasic
Imports System.Globalization

Public Class ConvertUtil

    ''' <summary>
    ''' StringValue = ��ͤ���
    ''' NumbericValue = �ӹǹ���
    ''' DoubleValue = �Ţ�ȹ���
    ''' DateValue = �ѹ���
    ''' BooleanValue = ��� boolean
    ''' TimeValue = ����
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
    ''' NumericNoDecimal = �ӹǹ���
    ''' FullDate = '�ѹ'dddd'���' d MMMM gg yyyy
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
    ''' Funtion ���������Ѻ�ŧ�����ŷ�����Ѻ�ҡ database ���� Object �� ����դ�� Null
    ''' ����繤�� Default �ͧ Type ��ҧ��������ҵ�ͧ���
    ''' ����蹹�� �ҡ��ҹӤ�� Null ���ҹ�з�����Դ Error ��
    ''' </summary>
    ''' <param name="Value">Object ����ͧ����ŧ</param>
    ''' <param name="GetObject">Type ����ͧ���</param>
    ''' <returns>��� Default �ͧ Type ����</returns>
    ''' <remarks>��� Default �ͧ GetObject ��� StringValue</remarks>
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
    ''' Function ���������Ѻ set format �ͧ object ��ҧ�
    ''' �� Format �ͧ�ѹ���Ẻ���,���
    ''' Format �ͧ����
    ''' ���� Format �ͧ�Ţ�ȹ���
    ''' </summary>
    ''' <param name="Target">Object ����ͧ��� set format</param>
    ''' <param name="FormatType">�ٻẺ�ͧ Format</param>
    ''' <returns>Object ���١�Ѵ format ����</returns>
    Public Shared Function setObjectFormat(ByVal Target As Object, Optional ByVal FormatType As ObjectFormatEnum = ObjectFormatEnum.Numeric) As String
        Dim result As String = String.Empty

        Select Case FormatType
            Case ObjectFormatEnum.FullDate
                result = Format(getObjectValue(Target, ObjectValueEnum.DateValue), "'�ѹ'dddd'���' d MMMM gg yyyy")
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
                    FormatStr = "'�ѹ'dddd'���' d MMMM gg yyyy"
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
