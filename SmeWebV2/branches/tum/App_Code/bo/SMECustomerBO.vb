Option Explicit On
Option Strict On

Imports Microsoft.VisualBasic
Imports System.Data.SqlClient
Imports System.Collections.Generic
Imports System.Diagnostics

Public Class SMECustomerBO
    Private Shared className As String = "SMECustomerBO"

    Public Shared Sub removeCIFFromGroup(ByVal CIF As Integer)
        CustomerSmeDAL.updateNewGroupID(CIF)
    End Sub

    Public Shared Sub mergeCIFGroup(ByVal CIF1 As Integer, ByVal CIF2 As Integer, ByVal updateEmp As String)
        CustomerSmeDAL.updateGroupIdByCIF(CIF1, CIF2, updateEmp)
    End Sub

End Class
