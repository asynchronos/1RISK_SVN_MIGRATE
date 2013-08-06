Option Explicit On
Option Strict On

Namespace aspx.userControl
    Partial Class CustomerMenuControl
        Inherits System.Web.UI.UserControl

        Private _cif As String = String.Empty

        Private _menu1HasOnClientClick As Boolean = False
        Private _menu1Url As String = String.Empty
        Private _menu1Text As String = String.Empty
        Private _menu1_TargetIframe_myid As String = String.Empty
        Private _menu1Visible As Boolean = True

        Private _menu2HasOnClientClick As Boolean = False
        Private _menu2Url As String = String.Empty
        Private _menu2Text As String = String.Empty
        Private _menu2_TargetIframe_myid As String = String.Empty
        Private _menu2Visible As Boolean = True

        Private _menu3HasOnClientClick As Boolean = False
        Private _menu3Url As String = String.Empty
        Private _menu3Text As String = String.Empty
        Private _menu3_TargetIframe_myid As String = String.Empty
        Private _menu3Visible As Boolean = True

        Private _menu4HasOnClientClick As Boolean = False
        Private _menu4Url As String = String.Empty
        Private _menu4Text As String = String.Empty
        Private _menu4_TargetIframe_myid As String = String.Empty
        Private _menu4Visible As Boolean = True

        Private _menu5HasOnClientClick As Boolean = False
        Private _menu5Url As String = String.Empty
        Private _menu5Text As String = String.Empty
        Private _menu5_TargetIframe_myid As String = String.Empty
        Private _menu5Visible As Boolean = True

        Private _menu6HasOnClientClick As Boolean = False
        Private _menu6Url As String = String.Empty
        Private _menu6Text As String = String.Empty
        Private _menu6_TargetIframe_myid As String = String.Empty
        Private _menu6Visible As Boolean = True

        Private _menu7HasOnClientClick As Boolean = False
        Private _menu7Url As String = String.Empty
        Private _menu7Text As String = String.Empty
        Private _menu7_TargetIframe_myid As String = String.Empty
        Private _menu7Visible As Boolean = True

        Private _menu8HasOnClientClick As Boolean = False
        Private _menu8Url As String = String.Empty
        Private _menu8Text As String = String.Empty
        Private _menu8_TargetIframe_myid As String = String.Empty
        Private _menu8Visible As Boolean = True

#Region "Properties"

        ReadOnly Property TextBoxCif() As TextBox
            Get
                Return TextBox_Cif
            End Get
        End Property

        <ComponentModel.Browsable(True), ComponentModel.Category("Main"), ComponentModel.Description("CIF")> _
        Property CIF() As String
            Get
                Return TextBox_Cif.Text
            End Get
            Set(ByVal value As String)
                TextBox_Cif.Text = value
            End Set
        End Property

        <ComponentModel.Browsable(True), ComponentModel.Category("Main"), ComponentModel.Description("OnSearchClientClick")> _
        Property OnSearchClientClick() As String
            Get
                Return Butt_Search.OnClientClick
            End Get
            Set(ByVal value As String)
                Butt_Search.OnClientClick = value
            End Set
        End Property

        <ComponentModel.Browsable(True), ComponentModel.Category("Menu1"), ComponentModel.Description("Menu1OnClientClick")> _
        Property Menu1OnClientClick() As String
            Get
                Return LinkButt_Menu1.OnClientClick
            End Get
            Set(ByVal value As String)
                LinkButt_Menu1.OnClientClick = value
            End Set
        End Property

        <ComponentModel.Browsable(True), ComponentModel.Category("Menu1"), ComponentModel.Description("Menu1Url")> _
        Property Menu1Url() As String
            Get
                Return _menu1Url
            End Get
            Set(ByVal value As String)
                _menu1Url = value
            End Set
        End Property

        <ComponentModel.Browsable(True), ComponentModel.Category("Menu1"), ComponentModel.Description("Menu1Text")> _
        Property Menu1Text() As String
            Get
                Return _menu1Text
            End Get
            Set(ByVal value As String)
                _menu1Text = value
            End Set
        End Property

        <ComponentModel.Browsable(True), ComponentModel.Category("Menu1"), ComponentModel.Description("Menu1_TargetIframe_myid")> _
        Property Menu1_TargetIframe_myid() As String
            Get
                Return _menu1_TargetIframe_myid
            End Get
            Set(ByVal value As String)
                _menu1_TargetIframe_myid = value
            End Set
        End Property

        <ComponentModel.Browsable(True), ComponentModel.Category("Menu1"), ComponentModel.Description("Menu1Visible")> _
        Property Menu1Visible() As Boolean
            Get
                Return _menu1Visible
            End Get
            Set(ByVal value As Boolean)
                _menu1Visible = value
            End Set
        End Property

        <ComponentModel.Browsable(True), ComponentModel.Category("Menu2"), ComponentModel.Description("Menu2OnClientClick")> _
        Property Menu2OnClientClick() As String
            Get
                Return LinkButt_Menu2.OnClientClick
            End Get
            Set(ByVal value As String)
                LinkButt_Menu2.OnClientClick = value
            End Set
        End Property

        <ComponentModel.Browsable(True), ComponentModel.Category("Menu2"), ComponentModel.Description("Menu2Url")> _
        Property Menu2Url() As String
            Get
                Return _menu2Url
            End Get
            Set(ByVal value As String)
                _menu2Url = value
            End Set
        End Property

        <ComponentModel.Browsable(True), ComponentModel.Category("Menu2"), ComponentModel.Description("Menu2Text")> _
        Property Menu2Text() As String
            Get
                Return _menu2Text
            End Get
            Set(ByVal value As String)
                _menu2Text = value
            End Set
        End Property

        <ComponentModel.Browsable(True), ComponentModel.Category("Menu2"), ComponentModel.Description("Menu2_TargetIframe_myid")> _
        Property Menu2_TargetIframe_myid() As String
            Get
                Return _menu2_TargetIframe_myid
            End Get
            Set(ByVal value As String)
                _menu2_TargetIframe_myid = value
            End Set
        End Property

        <ComponentModel.Browsable(True), ComponentModel.Category("Menu2"), ComponentModel.Description("Menu2Visible")> _
        Property Menu2Visible() As Boolean
            Get
                Return _menu2Visible
            End Get
            Set(ByVal value As Boolean)
                _menu2Visible = value
            End Set
        End Property

        <ComponentModel.Browsable(True), ComponentModel.Category("Menu3"), ComponentModel.Description("Menu3OnClientClick")> _
        Property Menu3OnClientClick() As String
            Get
                Return LinkButt_Menu3.OnClientClick
            End Get
            Set(ByVal value As String)
                LinkButt_Menu3.OnClientClick = value
            End Set
        End Property

        <ComponentModel.Browsable(True), ComponentModel.Category("Menu3"), ComponentModel.Description("Menu3Url")> _
        Property Menu3Url() As String
            Get
                Return _menu3Url
            End Get
            Set(ByVal value As String)
                _menu3Url = value
            End Set
        End Property

        <ComponentModel.Browsable(True), ComponentModel.Category("Menu3"), ComponentModel.Description("Menu3Text")> _
        Property Menu3Text() As String
            Get
                Return _menu3Text
            End Get
            Set(ByVal value As String)
                _menu3Text = value
            End Set
        End Property

        <ComponentModel.Browsable(True), ComponentModel.Category("Menu3"), ComponentModel.Description("Menu3_TargetIframe_myid")> _
        Property Menu3_TargetIframe_myid() As String
            Get
                Return _menu3_TargetIframe_myid
            End Get
            Set(ByVal value As String)
                _menu3_TargetIframe_myid = value
            End Set
        End Property

        <ComponentModel.Browsable(True), ComponentModel.Category("Menu3"), ComponentModel.Description("Menu3Visible")> _
        Property Menu3Visible() As Boolean
            Get
                Return _menu3Visible
            End Get
            Set(ByVal value As Boolean)
                _menu3Visible = value
            End Set
        End Property

        <ComponentModel.Browsable(True), ComponentModel.Category("Menu4"), ComponentModel.Description("Menu4OnClientClick")> _
        Property Menu4OnClientClick() As String
            Get
                Return LinkButt_Menu4.OnClientClick
            End Get
            Set(ByVal value As String)
                LinkButt_Menu4.OnClientClick = value
            End Set
        End Property

        <ComponentModel.Browsable(True), ComponentModel.Category("Menu4"), ComponentModel.Description("Menu4Url")> _
        Property Menu4Url() As String
            Get
                Return _menu4Url
            End Get
            Set(ByVal value As String)
                _menu4Url = value
            End Set
        End Property

        <ComponentModel.Browsable(True), ComponentModel.Category("Menu4"), ComponentModel.Description("Menu4Text")> _
        Property Menu4Text() As String
            Get
                Return _menu4Text
            End Get
            Set(ByVal value As String)
                _menu4Text = value
            End Set
        End Property

        <ComponentModel.Browsable(True), ComponentModel.Category("Menu4"), ComponentModel.Description("Menu4_TargetIframe_myid")> _
        Property Menu4_TargetIframe_myid() As String
            Get
                Return _menu4_TargetIframe_myid
            End Get
            Set(ByVal value As String)
                _menu4_TargetIframe_myid = value
            End Set
        End Property

        <ComponentModel.Browsable(True), ComponentModel.Category("Menu4"), ComponentModel.Description("Menu4Visible")> _
        Property Menu4Visible() As Boolean
            Get
                Return _menu4Visible
            End Get
            Set(ByVal value As Boolean)
                _menu4Visible = value
            End Set
        End Property

        <ComponentModel.Browsable(True), ComponentModel.Category("Menu5"), ComponentModel.Description("Menu5OnClientClick")> _
        Property Menu5OnClientClick() As String
            Get
                Return LinkButt_Menu5.OnClientClick
            End Get
            Set(ByVal value As String)
                LinkButt_Menu5.OnClientClick = value
            End Set
        End Property

        <ComponentModel.Browsable(True), ComponentModel.Category("Menu5"), ComponentModel.Description("Menu5Url")> _
        Property Menu5Url() As String
            Get
                Return _menu5Url
            End Get
            Set(ByVal value As String)
                _menu5Url = value
            End Set
        End Property

        <ComponentModel.Browsable(True), ComponentModel.Category("Menu5"), ComponentModel.Description("Menu5Text")> _
        Property Menu5Text() As String
            Get
                Return _menu5Text
            End Get
            Set(ByVal value As String)
                _menu5Text = value
            End Set
        End Property

        <ComponentModel.Browsable(True), ComponentModel.Category("Menu5"), ComponentModel.Description("Menu5_TargetIframe_myid")> _
        Property Menu5_TargetIframe_myid() As String
            Get
                Return _menu5_TargetIframe_myid
            End Get
            Set(ByVal value As String)
                _menu5_TargetIframe_myid = value
            End Set
        End Property

        <ComponentModel.Browsable(True), ComponentModel.Category("Menu5"), ComponentModel.Description("Menu5Visible")> _
        Property Menu5Visible() As Boolean
            Get
                Return _menu5Visible
            End Get
            Set(ByVal value As Boolean)
                _menu5Visible = value
            End Set
        End Property

        <ComponentModel.Browsable(True), ComponentModel.Category("Menu6"), ComponentModel.Description("Menu6OnClientClick")> _
        Property Menu6OnClientClick() As String
            Get
                Return LinkButt_Menu6.OnClientClick
            End Get
            Set(ByVal value As String)
                LinkButt_Menu6.OnClientClick = value
            End Set
        End Property

        <ComponentModel.Browsable(True), ComponentModel.Category("Menu6"), ComponentModel.Description("Menu6Url")> _
        Property Menu6Url() As String
            Get
                Return _menu6Url
            End Get
            Set(ByVal value As String)
                _menu6Url = value
            End Set
        End Property

        <ComponentModel.Browsable(True), ComponentModel.Category("Menu6"), ComponentModel.Description("Menu6Text")> _
        Property Menu6Text() As String
            Get
                Return _menu6Text
            End Get
            Set(ByVal value As String)
                _menu6Text = value
            End Set
        End Property

        <ComponentModel.Browsable(True), ComponentModel.Category("Menu6"), ComponentModel.Description("Menu6_TargetIframe_myid")> _
        Property Menu6_TargetIframe_myid() As String
            Get
                Return _menu6_TargetIframe_myid
            End Get
            Set(ByVal value As String)
                _menu6_TargetIframe_myid = value
            End Set
        End Property

        <ComponentModel.Browsable(True), ComponentModel.Category("Menu6"), ComponentModel.Description("Menu6Visible")> _
        Property Menu6Visible() As Boolean
            Get
                Return _menu6Visible
            End Get
            Set(ByVal value As Boolean)
                _menu6Visible = value
            End Set
        End Property

        <ComponentModel.Browsable(True), ComponentModel.Category("Menu7"), ComponentModel.Description("Menu7OnClientClick")> _
        Property Menu7OnClientClick() As String
            Get
                Return LinkButt_Menu7.OnClientClick
            End Get
            Set(ByVal value As String)
                LinkButt_Menu7.OnClientClick = value
            End Set
        End Property

        <ComponentModel.Browsable(True), ComponentModel.Category("Menu7"), ComponentModel.Description("Menu7Url")> _
        Property Menu7Url() As String
            Get
                Return _menu7Url
            End Get
            Set(ByVal value As String)
                _menu7Url = value
            End Set
        End Property

        <ComponentModel.Browsable(True), ComponentModel.Category("Menu7"), ComponentModel.Description("Menu7Text")> _
        Property Menu7Text() As String
            Get
                Return _menu7Text
            End Get
            Set(ByVal value As String)
                _menu7Text = value
            End Set
        End Property

        <ComponentModel.Browsable(True), ComponentModel.Category("Menu7"), ComponentModel.Description("Menu7_TargetIframe_myid")> _
        Property Menu7_TargetIframe_myid() As String
            Get
                Return _menu7_TargetIframe_myid
            End Get
            Set(ByVal value As String)
                _menu7_TargetIframe_myid = value
            End Set
        End Property

        <ComponentModel.Browsable(True), ComponentModel.Category("Menu7"), ComponentModel.Description("Menu7Visible")> _
        Property Menu7Visible() As Boolean
            Get
                Return _menu7Visible
            End Get
            Set(ByVal value As Boolean)
                _menu7Visible = value
            End Set
        End Property

        <ComponentModel.Browsable(True), ComponentModel.Category("Menu8"), ComponentModel.Description("Menu8OnClientClick")> _
        Property Menu8OnClientClick() As String
            Get
                Return LinkButt_Menu8.OnClientClick
            End Get
            Set(ByVal value As String)
                LinkButt_Menu8.OnClientClick = value
            End Set
        End Property

        <ComponentModel.Browsable(True), ComponentModel.Category("Menu8"), ComponentModel.Description("Menu8Url")> _
        Property Menu8Url() As String
            Get
                Return _menu8Url
            End Get
            Set(ByVal value As String)
                _menu8Url = value
            End Set
        End Property

        <ComponentModel.Browsable(True), ComponentModel.Category("Menu8"), ComponentModel.Description("Menu8Text")> _
        Property Menu8Text() As String
            Get
                Return _menu8Text
            End Get
            Set(ByVal value As String)
                _menu8Text = value
            End Set
        End Property

        <ComponentModel.Browsable(True), ComponentModel.Category("Menu8"), ComponentModel.Description("Menu8_TargetIframe_myid")> _
        Property Menu8_TargetIframe_myid() As String
            Get
                Return _menu8_TargetIframe_myid
            End Get
            Set(ByVal value As String)
                _menu8_TargetIframe_myid = value
            End Set
        End Property

        <ComponentModel.Browsable(True), ComponentModel.Category("Menu8"), ComponentModel.Description("Menu8Visible")> _
        Property Menu8Visible() As Boolean
            Get
                Return _menu8Visible
            End Get
            Set(ByVal value As Boolean)
                _menu8Visible = value
            End Set
        End Property
#End Region

#Region "delegate"
        Public Delegate Sub SearchClickHandler(ByVal sender As Object, ByVal e As EventArgs)

        Public Event SearchClick As SearchClickHandler

        Protected Overridable Sub OnSearchClick(ByVal e As EventArgs)

            RaiseEvent SearchClick(Me, e)

        End Sub

        Private Sub Butt_Search_Click(ByVal sender As Object, ByVal e As System.EventArgs)
            OnSearchClick(e)
        End Sub


#End Region

#Region "Web Form Designer generated code"

        Protected Overloads Overrides Sub OnInit(ByVal e As EventArgs)

            InitializeComponent()

            MyBase.OnInit(e)

        End Sub

        Private Sub InitializeComponent()

            AddHandler Me.Butt_Search.Click, AddressOf Me.Butt_Search_Click
            AddHandler Me.Load, AddressOf Me.Page_Load

        End Sub

#End Region

        Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
            If Not Me.IsPostBack Then
                If Menu1OnClientClick.Trim.Length > 0 Then
                    _menu1HasOnClientClick = True
                End If
                If Menu2OnClientClick.Trim.Length > 0 Then
                    _menu2HasOnClientClick = True
                End If
                If Menu3OnClientClick.Trim.Length > 0 Then
                    _menu3HasOnClientClick = True
                End If
                If Menu4OnClientClick.Trim.Length > 0 Then
                    _menu4HasOnClientClick = True
                End If
                If Menu5OnClientClick.Trim.Length > 0 Then
                    _menu5HasOnClientClick = True
                End If
                If Menu6OnClientClick.Trim.Length > 0 Then
                    _menu6HasOnClientClick = True
                End If
                If Menu7OnClientClick.Trim.Length > 0 Then
                    _menu7HasOnClientClick = True
                End If
                If Menu8OnClientClick.Trim.Length > 0 Then
                    _menu7HasOnClientClick = True
                End If

                LinkButt_Menu1.Text = Menu1Text
                LinkButt_Menu2.Text = Menu2Text
                LinkButt_Menu3.Text = Menu3Text
                LinkButt_Menu4.Text = Menu4Text
                LinkButt_Menu5.Text = Menu5Text
                LinkButt_Menu6.Text = Menu6Text
                LinkButt_Menu7.Text = Menu7Text
                LinkButt_Menu8.Text = Menu8Text
            End If

            Dim iframeLoaderUrl As String = Page.ResolveUrl("~/IframeLoader.aspx?url=")

            If _menu1HasOnClientClick.Equals(False) Then
                Menu1OnClientClick = "changeIframeSrc('" + Menu1_TargetIframe_myid + "','" + iframeLoaderUrl + Page.ResolveUrl(Menu1Url) + "','cif=" + CIF + "');return false;"
            End If
            If _menu2HasOnClientClick.Equals(False) Then
                Menu2OnClientClick = "changeIframeSrc('" + Menu2_TargetIframe_myid + "','" + iframeLoaderUrl + Page.ResolveUrl(Menu2Url) + "','cif=" + CIF + "');return false;"
            End If
            If _menu3HasOnClientClick.Equals(False) Then
                Menu3OnClientClick = "changeIframeSrc('" + Menu3_TargetIframe_myid + "','" + iframeLoaderUrl + Page.ResolveUrl(Menu3Url) + "','cif=" + CIF + "');return false;"
            End If
            If _menu4HasOnClientClick.Equals(False) Then
                Menu4OnClientClick = "changeIframeSrc('" + Menu4_TargetIframe_myid + "','" + iframeLoaderUrl + Page.ResolveUrl(Menu4Url) + "','cif=" + CIF + "');return false;"
            End If
            If _menu5HasOnClientClick.Equals(False) Then
                Menu5OnClientClick = "changeIframeSrc('" + Menu5_TargetIframe_myid + "','" + iframeLoaderUrl + Page.ResolveUrl(Menu5Url) + "','cif=" + CIF + "');return false;"
            End If
            If _menu6HasOnClientClick.Equals(False) Then
                Menu6OnClientClick = "changeIframeSrc('" + Menu6_TargetIframe_myid + "','" + iframeLoaderUrl + Page.ResolveUrl(Menu6Url) + "','cif=" + CIF + "');return false;"
            End If
            If _menu7HasOnClientClick.Equals(False) Then
                Menu7OnClientClick = "changeIframeSrc('" + Menu7_TargetIframe_myid + "','" + iframeLoaderUrl + Page.ResolveUrl(Menu7Url) + "','cif=" + CIF + "');return false;"
            End If
            If _menu8HasOnClientClick.Equals(False) Then
                Menu8OnClientClick = "changeIframeSrc('" + Menu8_TargetIframe_myid + "','" + iframeLoaderUrl + Page.ResolveUrl(Menu8Url) + "','cif=" + CIF + "');return false;"
            End If

            'Visible Check
            LinkButt_Menu1.Visible = _menu1Visible
            LinkButt_Menu2.Visible = _menu2Visible
            LinkButt_Menu3.Visible = _menu3Visible
            LinkButt_Menu4.Visible = _menu4Visible
            LinkButt_Menu5.Visible = _menu5Visible
            LinkButt_Menu6.Visible = _menu6Visible
            LinkButt_Menu7.Visible = _menu7Visible
            LinkButt_Menu8.Visible = _menu8Visible
        End Sub
    End Class
End Namespace

