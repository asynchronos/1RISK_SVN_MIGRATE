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
    Public Class EmployeeWCFService

        ' Add <WebGet()> attribute to use HTTP GET 
        <OperationContract()> _
        Public Sub DoWork()
            ' Add your operation implementation here
        End Sub

        ' Add more operations here and mark them with <OperationContract()>
        <OperationContract()> _
        Public Function GetCmByEmpId(ByVal empId As String) As wcf.result.CmByEmpIdWCFResutl
            Dim result As wcf.result.CmByEmpIdWCFResutl = Nothing
            Dim cmDetailResult As linq.CONTROLLING_LINE_FULL = Nothing

            Using employeeDB As New linq.EmployeeLinqDataContext()
                Dim query As IQueryable(Of webservice.linq.CONTROLLING_LINE_FULL) = From cm In employeeDB.CONTROLLING_LINE_FULLs Where cm.EMP_ID = empId
                If query.Count = 1 Then
                    cmDetailResult = query.Single
                End If
            End Using

            result = New wcf.result.CmByEmpIdWCFResutl("success", cmDetailResult)
            Return result
        End Function

        <OperationContract()> _
        Public Function GetCmFullNameByEmpId(ByVal empId As String) As wcf.result.WCFResutl
            Dim result As wcf.result.WCFResutl = Nothing

            Try
                Dim employeeResult As linq.CONTROLLING_LINE_FULL = GetCmByEmpId(empId).detail
                Dim employeeName As String = Nothing

                If Not IsNothing(employeeResult) Then
                    employeeName = IIf(IsNothing(employeeResult.TITLE_NAME), "", employeeResult.TITLE_NAME).ToString _
                                   + IIf(IsNothing(employeeResult.EMPNAME), "", employeeResult.EMPNAME).ToString _
                                   + " " _
                                   + IIf(IsNothing(employeeResult.EMPSURNAME), "", employeeResult.EMPSURNAME).ToString

                    result = New wcf.result.WCFResutl("success", employeeName)
                Else
                    result = New wcf.result.WCFResutl("success", "Can not find this CM")
                End If

            Catch ex As Exception
                result = New wcf.result.WCFResutl("failed", ex.Message)
            End Try

            Return result
        End Function

        <OperationContract()> _
        Public Function GetEmployeeByEmpId(ByVal empId As String) As wcf.result.EmployeeByEmpIdWCFResutl
            Dim result As wcf.result.EmployeeByEmpIdWCFResutl = Nothing
            Dim empDetailResult As linq.employee.Employee = Nothing

            Using employeeDB As New linq.EmployeeLinqDataContext()
                empDetailResult = employeeDB.getEmployeeByEmpId(empId).Single
            End Using

            result = New wcf.result.EmployeeByEmpIdWCFResutl("success", empDetailResult)
            Return result
        End Function

        <OperationContract()> _
        Public Function GetEmpFullNameByEmpId(ByVal empId As String) As wcf.result.WCFResutl
            Dim result As wcf.result.WCFResutl = Nothing

            Try
                Dim employeeResult As linq.employee.Employee = GetEmployeeByEmpId(empId).detail
                Dim employeeName As String = Nothing

                If Not IsNothing(employeeResult) Then
                    employeeName = IIf(IsNothing(employeeResult.TITLE_NAME), "", employeeResult.TITLE_NAME).ToString _
                                   + IIf(IsNothing(employeeResult.EMPNAME), "", employeeResult.EMPNAME).ToString _
                                   + " " _
                                   + IIf(IsNothing(employeeResult.EMPSURNAME), "", employeeResult.EMPSURNAME).ToString

                    result = New wcf.result.WCFResutl("success", employeeName)
                Else
                    result = New wcf.result.WCFResutl("success", "Can not find this employee")
                End If

            Catch ex As Exception
                result = New wcf.result.WCFResutl("failed", ex.Message)
            End Try

            Return result
        End Function

        <OperationContract()> _
        Public Function GetLastLoginXMinTotal(ByVal min As Integer) As wcf.result.WCFResutl
            Dim result As wcf.result.WCFResutl = Nothing

            Try
                result = New wcf.result.WCFResutl("success", ReportDAL.GetLastLoginXMinTotal(min).ToString())
            Catch ex As Exception
                result = New wcf.result.WCFResutl("failure", ex.Message)
            End Try

            Return result
        End Function
    End Class

End Namespace