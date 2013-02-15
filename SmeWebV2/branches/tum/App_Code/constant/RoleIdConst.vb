Option Explicit On
Option Strict On

Imports Microsoft.VisualBasic

Public Class RoleIdConst

    ''' <summary>
    ''' Role Admin "0000000001"
    ''' </summary>
    ''' <value></value>
    ''' <returns></returns>
    ''' <remarks></remarks>
    Shared ReadOnly Property R_ADMIN() As String
        Get
            Return "0000000001"
        End Get
    End Property

    ''' <summary>
    ''' Role CM USER "0000000004"
    ''' </summary>
    ''' <value></value>
    ''' <returns></returns>
    ''' <remarks></remarks>
    Shared ReadOnly Property R_CM_USER() As String
        Get
            Return "0000000004"
        End Get
    End Property

    ''' <summary>
    ''' Role RM USER "0000000005"
    ''' </summary>
    ''' <value></value>
    ''' <returns></returns>
    ''' <remarks></remarks>
    Shared ReadOnly Property R_RM_USER() As String
        Get
            Return "0000000005"
        End Get
    End Property

    ''' <summary>
    ''' Action Read Only "0000000003"
    ''' </summary>
    ''' <value></value>
    ''' <returns></returns>
    ''' <remarks></remarks>
    Shared ReadOnly Property A_READ_ONLY() As String
        Get
            Return "0000000003"
        End Get
    End Property

    ''' <summary>
    ''' Action SEE ALL CA,ANNALS "0000000002"
    ''' </summary>
    ''' <value></value>
    ''' <returns></returns>
    ''' <remarks></remarks>
    Shared ReadOnly Property A_SEE_ALL() As String
        Get
            Return "0000000002"
        End Get
    End Property

    ''' <summary>
    ''' Action Audit See Only Attach File "0000000006"
    ''' </summary>
    ''' <value></value>
    ''' <returns></returns>
    ''' <remarks></remarks>
    Shared ReadOnly Property AUDIT_ATTACH() As String
        Get
            Return "0000000006"
        End Get
    End Property
    ''' <summary>
    ''' Action for Admin  can edit  annals "0000000007" 
    ''' </summary>
    ''' <value></value>
    ''' <returns></returns>
    ''' <remarks></remarks>
    Shared ReadOnly Property A_ADMIN() As String
        Get
            Return "0000000007"
        End Get
    End Property

End Class
