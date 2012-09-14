Option Explicit On
Option Strict On

Imports Microsoft.VisualBasic

Namespace webservice.wcf.result

    <Runtime.Serialization.DataContract()> _
    Public Class CmByEmpIdWCFResutl
        Implements webservice.wcf.result.IWCFResult

        Private _status As String
        Private _detail As webservice.linq.CONTROLLING_LINE_FULL

        <Runtime.Serialization.DataMember(Order:=1)> _
        Property status() As String Implements IWCFResult.status
            Get
                Return Me._status
            End Get
            Set(ByVal value As String)
                Me._status = value
            End Set
        End Property

        <Runtime.Serialization.DataMember(Order:=2)> _
        Property detail() As webservice.linq.CONTROLLING_LINE_FULL
            Get
                Return Me._detail
            End Get
            Set(ByVal value As webservice.linq.CONTROLLING_LINE_FULL)
                Me._detail = value
            End Set
        End Property

        Public Sub New()
            MyBase.New()
        End Sub

        Public Sub New(ByVal statusValue As String, ByVal detailValue As webservice.linq.CONTROLLING_LINE_FULL)
            Me.New()
            Me.status = statusValue
            Me.detail = detailValue
        End Sub

    End Class

End Namespace