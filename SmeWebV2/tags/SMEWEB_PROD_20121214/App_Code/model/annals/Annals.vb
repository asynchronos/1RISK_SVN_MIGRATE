Option Explicit On
Option Strict On

Imports Microsoft.VisualBasic
Imports System.Diagnostics

Public Class Annals

    Private Const CLSNAME As String = "Class Annals"

#Region "Member Variable"
    Private strANNALS_TYPE As String
    Private strANNALS_SEQ_NO As String
    Private strANNALS_YEAR As String
    Private strSENDER As String
    Private strRECIVER As String
    Private strREFERENCE As String
    Private strHEADER As String
    Private strDETAIL As String
    Private clsDATE_IN_ANNALS As Date
    Private clsANNALS_CREATE_DATE As Date
    Private clsANNALS_UPDATE_DATE As Date
    Private intDEPART_REFER As Integer
#End Region

#Region "Properties"

    Public Property ANNALS_TYPE() As String
        Get
            Return strANNALS_TYPE
        End Get
        Set(ByVal Value As String)
            strANNALS_TYPE = Value
        End Set
    End Property

    Public Property ANNALS_SEQ_NO() As String
        Get
            Return strANNALS_SEQ_NO
        End Get
        Set(ByVal Value As String)
            strANNALS_SEQ_NO = Value
        End Set
    End Property

    Public Property ANNALS_YEAR() As String
        Get
            Return strANNALS_YEAR
        End Get
        Set(ByVal Value As String)
            strANNALS_YEAR = Value
        End Set
    End Property

    Public Property SENDER() As String
        Get
            Return strSENDER
        End Get
        Set(ByVal Value As String)
            strSENDER = removeDuplicate(Value)
        End Set
    End Property

    Public Property RECIVER() As String
        Get
            Return strRECIVER
        End Get
        Set(ByVal Value As String)
            strRECIVER = removeDuplicate(Value)
        End Set
    End Property

    Public Property REFERENCE() As String
        Get
            Return strREFERENCE
        End Get
        Set(ByVal Value As String)
            strREFERENCE = Value
        End Set
    End Property

    Public Property HEADER() As String
        Get
            Return strHEADER
        End Get
        Set(ByVal Value As String)
            strHEADER = Value
        End Set
    End Property

    Public Property DETAIL() As String
        Get
            Return strDETAIL
        End Get
        Set(ByVal Value As String)
            strDETAIL = Value
        End Set
    End Property

    Public Property DATE_IN_ANNALS() As Date
        Get
            Return clsDATE_IN_ANNALS
        End Get
        Set(ByVal Value As Date)
            clsDATE_IN_ANNALS = Value
        End Set
    End Property

    Public Property ANNALS_CREATE_DATE() As Date
        Get
            Return clsANNALS_CREATE_DATE
        End Get
        Set(ByVal Value As Date)
            clsANNALS_CREATE_DATE = Value
        End Set
    End Property

    Public Property ANNALS_UPDATE_DATE() As Date
        Get
            Return clsANNALS_UPDATE_DATE
        End Get
        Set(ByVal Value As Date)
            clsANNALS_UPDATE_DATE = Value
        End Set
    End Property
    Public Property DEPART_REFER() As Integer
        Get
            Return intDEPART_REFER
        End Get
        Set(ByVal Value As Integer)
            intDEPART_REFER = Value
        End Set
    End Property
#End Region

    ''' <summary>
    ''' �ӡ�� remove ��ª��;�ѡ�ҹ������͡
    ''' </summary>
    ''' <param name="value">�ء��:128678,�Ե����ó:094094,��ȭҾ�:242545</param>
    ''' <returns>��ª��;�ѡ�ҹ��������</returns>
    ''' <remarks></remarks>
    Public Shared Function removeDuplicate(ByVal value As String) As String
        Dim result As String = ""

        If Not value.Equals(String.Empty) Then
            Dim resultList As New ArrayList()

            Dim userList As String() = value.Split(","c)

            resultList.Add(userList(0))
            For i As Integer = 1 To userList.Length - 1

                '�� j ����Ѻ��觤��� resultList
                Dim j As Integer = 0
                '��� j �ѧ�դ�ҹ��¡��Ң�Ҵ�ͧ resultList ���� while ���
                While j < resultList.Count
                    '��� string � resultList ��ҡѺ string � userList
                    If getEMPID(DirectCast(resultList(j), String)).Equals(getEMPID(userList(i))) Then
                        '�ʴ���ҫ�� ����͡�ҡ while
                        Exit While
                    End If
                    j += 1
                    '��ҷ� while ���� j ���դ����ҡѺ resultList.Count
                End While

                'MsgBox(resultList.Count.ToString + ":" + j.ToString)
                '����͡�ҡ while ����ǹ�ٻ while ����
                If j = resultList.Count Then
                    '�ʴ���������� resultList �ӡ�� add ŧ resultList
                    resultList.Add(userList(i))
                End If
            Next

            result = resultList(0).ToString()
            '�Ӥ�Ҩҡ resultList �ҵ���� string
            For i As Integer = 1 To resultList.Count - 1
                result += "," + resultList(i).ToString
            Next
        End If

        Return result
    End Function

    '��ȭҾ�:242545
    Private Shared Function getEMPID(ByVal userList As String) As String
        Dim result As String = userList

        Dim str As String() = userList.Split(":"c)

        If userList.IndexOf(":"c) > 0 Then
            result = userList.Split(":"c)(1)
        End If

        Return result
    End Function

#Region "Print"
    Public Sub Print()
        Debug.Print("")
        Debug.Print("ANNALS_TYPE : " & ANNALS_TYPE)
        Debug.Print("ANNALS_SEQ_NO : " & ANNALS_SEQ_NO)
        Debug.Print("ANNALS_YEAR : " & ANNALS_YEAR)
        Debug.Print("SENDER : " & SENDER)
        Debug.Print("RECIVER : " & RECIVER)
        Debug.Print("REFERENCE : " & REFERENCE)
        Debug.Print("HEADER : " & HEADER)
        Debug.Print("DETAIL : " & DETAIL)
        Debug.Print("DATE_IN_ANNALS : " & DATE_IN_ANNALS)
        Debug.Print("ANNALS_CREATE_DATE : " & ANNALS_CREATE_DATE)
        Debug.Print("ANNALS_UPDATE_DATE : " & ANNALS_UPDATE_DATE)
    End Sub

#End Region
End Class