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
    Public Class CustomerWCFService

        ' Add <WebGet()> attribute to use HTTP GET 
        <OperationContract()> _
        Public Sub DoWork()
            ' Add your operation implementation here
        End Sub

        ' Add more operations here and mark them with <OperationContract()>
        <OperationContract()> _
        Public Function GetCustomerByCif(ByVal cif As Integer) As wcf.result.CustomerByCifWCFResutl
            Dim result As wcf.result.CustomerByCifWCFResutl = Nothing
            Dim customerResult As linq.CUSTOMER = Nothing

            Using customerDB As New linq.CustomerLinqDataContext()
                Dim query As IQueryable(Of linq.CUSTOMER) = From customer In customerDB.CUSTOMERs Where customer.CIF = cif
                If query.Count = 1 Then
                    customerResult = query.Single
                End If
            End Using

            result = New wcf.result.CustomerByCifWCFResutl("success", customerResult)
            Return result
        End Function

        <OperationContract()> _
        Public Function GetCustomerFullNameByCif(ByVal cif As Integer) As wcf.result.WCFResutl
            Dim result As wcf.result.WCFResutl = Nothing

            Try
                Dim customerResult As linq.CUSTOMER = GetCustomerByCif(cif).detail
                Dim customerName As String = Nothing

                If Not IsNothing(customerResult) Then
                    customerName = IIf(IsNothing(customerResult.CUS_TITLE), "", customerResult.CUS_TITLE).ToString _
                           + IIf(IsNothing(customerResult.CUS_FIRST), "", customerResult.CUS_FIRST).ToString _
                           + " " _
                           + IIf(IsNothing(customerResult.CUS_LAST), "", customerResult.CUS_LAST).ToString

                    result = New wcf.result.WCFResutl("success", customerName)
                Else
                    result = New wcf.result.WCFResutl("success", "Can not find this customer")
                End If

            Catch ex As Exception
                result = New wcf.result.WCFResutl("failed", ex.Message + ":" + ex.StackTrace)
            End Try

            Return result
        End Function

        Private Function GetExporterByCif(ByVal cif As Integer) As linq.P_GET_EXPORTER_DETAIL_BY_CIFResult
            'Dim result As wcf.result.IWCFResult = Nothing
            Dim exporterResult As linq.P_GET_EXPORTER_DETAIL_BY_CIFResult = Nothing

            Using cusLinq As New linq.CustomerLinqDataContext()
                Dim cusInfoes As ISingleResult(Of linq.P_GET_EXPORTER_DETAIL_BY_CIFResult) = cusLinq.P_GET_EXPORTER_DETAIL_BY_CIF(cif)
                For Each cusInfo As linq.P_GET_EXPORTER_DETAIL_BY_CIFResult In cusInfoes
                    exporterResult = cusInfo
                Next
            End Using

            'result = New wcf.result.WCFResutl("success", exporterResult)
            Return exporterResult
        End Function

        <OperationContract()> _
        Public Function IsExporter(ByVal cif As Integer) As wcf.result.WCFResutl
            Dim result As wcf.result.WCFResutl = Nothing

            Try
                If IsNothing(GetExporterByCif(cif)) Then
                    result = New wcf.result.WCFResutl("success", "false")
                Else
                    result = New wcf.result.WCFResutl("success", "true")
                End If
            Catch ex As Exception
                result = New wcf.result.WCFResutl("failed", ex.Message + ":" + ex.StackTrace)
            End Try

            Return result
        End Function

        <OperationContract()> _
        Public Function CountRatingExpired(ByVal empId As String, ByVal issingle As String) As wcf.result.WCFResutl
            Dim result As wcf.result.WCFResutl = Nothing

            Try
                result = New wcf.result.WCFResutl("success", ReportDAL.CountRatingExpiredReport(empId, issingle).ToString())
            Catch ex As Exception
                result = New wcf.result.WCFResutl("failure", ex.Message)
            End Try

            Return result
        End Function
    End Class

End Namespace