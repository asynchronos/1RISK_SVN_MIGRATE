Option Explicit On
Option Strict On

Imports System.Linq
Imports System.Data.Linq

Imports System.Collections.Generic

Imports System.ServiceModel
Imports System.ServiceModel.Activation
Imports System.ServiceModel.Web

Imports webservice

Namespace webservice.wcf.service

    <ServiceContract(Namespace:="SmeWeb")> _
    <AspNetCompatibilityRequirements(RequirementsMode:=AspNetCompatibilityRequirementsMode.Allowed)> _
    Public Class BusinessTypeWCFService

        ' Add <WebGet()> attribute to use HTTP GET 
        <OperationContract()> _
        Public Sub DoWork()
            ' Add your operation implementation here
        End Sub

        ' Add more operations here and mark them with <OperationContract()>
        ''' <summary>
        ''' ยกเลิกไปใช้ business type ใหม่
        ''' </summary>
        ''' <param name="type3Id"></param>
        ''' <returns></returns>
        ''' <remarks></remarks>
        <OperationContract()> _
        Public Function GetBusinessTypeByType3Id(ByVal type3Id As Integer) As wcf.result.BusinessTypeByType3IdWCFResutl
            Dim result As wcf.result.BusinessTypeByType3IdWCFResutl = Nothing
            Dim busiTypeResult As linq.BUSI_TYPE3 = Nothing

            Using busiTypeDB As New linq.BusinessTypeLinqDataContext()
                Dim query As IQueryable(Of webservice.linq.BUSI_TYPE3) = From busiType In busiTypeDB.BUSI_TYPE3s Where busiType.TYPE3_ID = type3Id
                If query.Count = 1 Then
                    busiTypeResult = query.Single
                End If
            End Using

            result = New wcf.result.BusinessTypeByType3IdWCFResutl("success", busiTypeResult)
            Return result
        End Function

        ''' <summary>
        ''' ยกเลิกไปใช้ business type ใหม่
        ''' </summary>
        ''' <param name="type3Id"></param>
        ''' <returns></returns>
        ''' <remarks></remarks>
        <OperationContract()> _
        Public Function GetBusinessTypeDetailByType3Id(ByVal type3Id As Integer) As wcf.result.WCFResutl
            Dim result As wcf.result.WCFResutl = Nothing

            Try
                Dim busiTypeResult As linq.BUSI_TYPE3 = GetBusinessTypeByType3Id(type3Id).detail
                Dim businessTypeDetail As String = Nothing

                If Not IsNothing(busiTypeResult) Then
                    businessTypeDetail = IIf(IsNothing(busiTypeResult.TYPE3_DETAIL), "No description in thai", busiTypeResult.TYPE3_DETAIL).ToString

                    result = New wcf.result.WCFResutl("success", businessTypeDetail)
                Else
                    result = New wcf.result.WCFResutl("success", "Can not find this business type")
                End If

            Catch ex As Exception
                result = New wcf.result.WCFResutl("failed", ex.Message)
            End Try

            Return result
        End Function

        ' Add more operations here and mark them with <OperationContract()>
        <OperationContract()> _
        Public Function GetBusinessTypeByType4Id(ByVal type4Id As String) As wcf.result.BusinessTypeByType4IdWCFResutl
            Dim result As wcf.result.BusinessTypeByType4IdWCFResutl = Nothing
            Dim busiTypeResult As linq.BUSINESS_TYPE_4 = Nothing

            Using busiTypeDB As New linq.BusinessTypeLinqDataContext()
                Dim query As IQueryable(Of webservice.linq.BUSINESS_TYPE_4) = From busiType In busiTypeDB.BUSINESS_TYPE_4s Where busiType.TYPE4_ID = type4Id
                If query.Count = 1 Then
                    busiTypeResult = query.Single
                End If
            End Using

            result = New wcf.result.BusinessTypeByType4IdWCFResutl("success", busiTypeResult)
            Return result
        End Function

        <OperationContract()> _
        Public Function GetBusinessTypeDetailByType4Id(ByVal type4Id As String) As wcf.result.WCFResutl
            Dim result As wcf.result.WCFResutl = Nothing

            Try
                Dim busiTypeResult As linq.BUSINESS_TYPE_4 = GetBusinessTypeByType4Id(type4Id).detail
                Dim businessTypeDetail As String = Nothing

                If Not IsNothing(busiTypeResult) Then
                    businessTypeDetail = IIf(IsNothing(busiTypeResult.DESCRIPTION), "No description in thai", busiTypeResult.DESCRIPTION).ToString

                    result = New wcf.result.WCFResutl("success", businessTypeDetail)
                Else
                    result = New wcf.result.WCFResutl("success", "Can not find this business type")
                End If

            Catch ex As Exception
                result = New wcf.result.WCFResutl("failed", ex.Message)
            End Try

            Return result
        End Function
    End Class

End Namespace