Option Explicit On
Option Strict On

Imports Microsoft.VisualBasic

Public Class SessionKeyConst

    ''' <summary>
    ''' session key สำหรับเก็บ EMP_ID
    ''' </summary>
    ''' <remarks></remarks>
    Public Shared ReadOnly EMP_ID As String = "EMP_ID"
    ''' <summary>
    ''' session key สำหรับเก็บ EMP_NAME
    ''' </summary>
    ''' <remarks></remarks>
    Public Shared ReadOnly EMP_NAME As String = "EMP_NAME"
    ''' <summary>
    ''' Not Use --- session key สำหรับเก็บ Class TbEmployee
    ''' </summary>
    ''' <remarks></remarks>
    Public Shared ReadOnly EMPLOYEE As String = "EMPLOYEE"
    ''' <summary>
    ''' Not Use --- session key สำหรับเก็บ Class USER_DETAIL
    ''' </summary>
    ''' <remarks></remarks>
    Public Shared ReadOnly USER_DETAIL As String = "USER_DETAIL"
    ''' <summary>
    ''' session key สำหรับเก็บ CIF
    ''' </summary>
    ''' <remarks></remarks>
    Public Shared ReadOnly CIF As String = "CIF"
    ''' <summary>
    ''' session key สำหรับเก็บ CUS_NAME
    ''' </summary>
    ''' <remarks></remarks>
    Public Shared ReadOnly CUS_NAME As String = "CUS_NAME"
    

End Class
