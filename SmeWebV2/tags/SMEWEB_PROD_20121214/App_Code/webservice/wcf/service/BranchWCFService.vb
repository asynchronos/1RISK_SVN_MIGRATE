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
    Public Class BranchWCFService

        ' Add <WebGet()> attribute to use HTTP GET 
        <OperationContract()> _
        Public Sub DoWork()
            ' Add your operation implementation here
        End Sub

        ' Add more operations here and mark them with <OperationContract()>
        <OperationContract()> _
        Public Function GetBranchById(ByVal id As Integer) As wcf.result.BranchByIdWCFResutl
            Dim result As wcf.result.BranchByIdWCFResutl = Nothing
            Dim branchResult As linq.Id_Branch = Nothing

            Using branchDB As New linq.BranchLinqDataContext()
                Dim query As IQueryable(Of webservice.linq.Id_Branch) = From branch In branchDB.Id_Branches Where branch.Id_Branch = id
                If query.Count = 1 Then
                    branchResult = query.Single
                End If
            End Using

            result = New webservice.wcf.result.BranchByIdWCFResutl("success", branchResult)
            Return result
        End Function

        <OperationContract()> _
        Public Function GetBranchNameById(ByVal id As Integer) As wcf.result.WCFResutl
            Dim result As wcf.result.WCFResutl = Nothing

            Try
                Dim branchResult As linq.Id_Branch = GetBranchById(id).detail
                Dim branchName As String = Nothing

                If Not IsNothing(branchResult) Then
                    branchName = IIf(IsNothing(branchResult.Branch_T), "No description in thai", branchResult.Branch_T).ToString

                    result = New wcf.result.WCFResutl("success", branchName)
                Else
                    result = New wcf.result.WCFResutl("success", "Can not find this branch")
                End If

            Catch ex As Exception
                result = New wcf.result.WCFResutl("failed", ex.Message)
            End Try

            Return result
        End Function

    End Class

End Namespace