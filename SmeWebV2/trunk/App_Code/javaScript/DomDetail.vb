Option Strict On
Option Explicit On

Imports Microsoft.VisualBasic

Public Class DomDetail
    Private _id As String
    Private _parent As String = "window.opener"
    Private _property As String = "innerHTML"

    ''' <summary>
    ''' map กับ returnIdTarget
    ''' </summary>
    ''' <value></value>
    ''' <returns></returns>
    ''' <remarks></remarks>
    Property Id() As String
        Get
            Return _id
        End Get
        Set(ByVal value As String)
            _id = value
        End Set
    End Property

    ''' <summary>
    ''' map กับ returnIdParent
    ''' </summary>
    ''' <value></value>
    ''' <returns></returns>
    ''' <remarks></remarks>
    Property Parent() As String
        Get
            Return _parent
        End Get
        Set(ByVal value As String)
            _parent = value
        End Set
    End Property

    Property Prop() As String
        Get
            Return _property
        End Get
        Set(ByVal value As String)
            _property = value
        End Set
    End Property

    Public Sub New()
        MyBase.New()
    End Sub

    Public Sub New(ByVal id As String)
        Me.New(id, "innerHTML")
    End Sub

    Public Sub New(ByVal id As String, ByVal prop As String)
        Me.New(id, "window.opener", prop)
    End Sub

    Public Sub New(ByVal id As String, ByVal parent As String, ByVal prop As String)
        MyBase.New()

        Me.Id = id
        Me.Parent = parent
        Me.Prop = prop
    End Sub

End Class
