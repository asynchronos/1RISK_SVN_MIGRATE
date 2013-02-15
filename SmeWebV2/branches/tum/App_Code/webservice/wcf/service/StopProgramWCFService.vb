Option Explicit On
Option Strict On

Imports System.ServiceModel
Imports System.ServiceModel.Activation
Imports System.ServiceModel.Web

Imports System.Linq
Imports System.Data.Linq

Namespace webservice.wcf.service
    <ServiceContract(Namespace:="SmeWeb")> _
    <AspNetCompatibilityRequirements(RequirementsMode:=AspNetCompatibilityRequirementsMode.Allowed)> _
    Public Class StopProgramWCFService

        ' Add <WebGet()> attribute to use HTTP GET 
        <OperationContract()> _
        Public Sub DoWork()
            ' Add your operation implementation here
        End Sub

        ' Add more operations here and mark them with <OperationContract()>
        <OperationContract()> _
        Public Function GetStopCustomerByCif(ByVal cif As Integer) As wcf.result.StopProgramWCFResutl
            Dim result As wcf.result.StopProgramWCFResutl = Nothing
            Dim detailResult As linq.stop.STOP_CUSTOMER = Nothing

            Using linqDB As New linq.stop.StopLinqDataContext()
                Dim query As IQueryable(Of webservice.linq.stop.STOP_CUSTOMER) = From table In linqDB.STOP_CUSTOMERs Where table.CIF = cif
                If query.Count = 1 Then
                    detailResult = query.Single
                End If
            End Using

            result = New wcf.result.StopProgramWCFResutl("success", detailResult)
            Return result
        End Function

        <OperationContract()> _
        Public Function IsValidInStop(ByVal cif As Integer) As wcf.result.WCFResutl
            Dim result As wcf.result.WCFResutl = Nothing

            Try
                Dim detailResult As linq.stop.STOP_CUSTOMER = GetStopCustomerByCif(cif).detail
                Dim isValid As String = Nothing

                If Not IsNothing(detailResult) Then
                    isValid = "true"
                Else
                    isValid = "false"
                End If
                result = New wcf.result.WCFResutl("success", isValid)
            Catch ex As Exception
                result = New wcf.result.WCFResutl("failed", ex.Message)
            End Try

            Return result
        End Function
    End Class
End Namespace

