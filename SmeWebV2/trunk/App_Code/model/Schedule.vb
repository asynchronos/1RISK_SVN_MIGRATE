Public Class Schedule

	Private Const CLSNAME As String = "Class Schedule"

	Private intID As Integer
	Private clsSDate As Date
    Private strEmployee As String
    Private strTimeBegin As String
    Private StrTimeEnd As String
	Private strPersonName As String
	Private strPersonDep As String
	Private strPersonTel As String
	Private strRisk As String
	Private strRiskName As String
	Private strRiskTeam As String
	Private strRiskTel As String
	Private strObjective As String
	Private strCif As String
	Private strCifName As String
	Private strID_Branch As String
	Private strDepbranch As String
	Private strLocation As String
	Private intDays As Integer
	Private intRest As Integer
	Private bolOffice_chk As Boolean
	Private bolHome_chk As Boolean
	Private bolShop_chk As Boolean
	Private bolFac_chk As Boolean
	Private bolCol_chk As Boolean
	Private strOther_chk As String
	Private strAttach_File As String
	Private clsTranDate As Date
	Private strUserName As String
	Private strIP As String

	Public Property ID As Integer
	Get
		Return intID
	End Get
	Set (ByVal Value As Integer)
		intID = Value
	End Set
	End Property

	Public Property SDate As Date
	Get
		Return clsSDate
	End Get
	Set (ByVal Value As Date)
		clsSDate = Value
	End Set
	End Property

    Public Property Employee() As String
        Get
            Return strEmployee
        End Get
        Set(ByVal Value As String)
            strEmployee = Value
        End Set
    End Property
    Public Property TimeBegin() As String
        Get
            Return strTimeBegin
        End Get
        Set(ByVal Value As String)
            strTimeBegin = Value
        End Set
    End Property
    Public Property TimeEnd() As String
        Get
            Return strTimeEnd
        End Get
        Set(ByVal Value As String)
            strTimeEnd = Value
        End Set
    End Property

	Public Property PersonName As String
	Get
		Return strPersonName
	End Get
	Set (ByVal Value As String)
		strPersonName = Value
	End Set
	End Property

	Public Property PersonDep As String
	Get
		Return strPersonDep
	End Get
	Set (ByVal Value As String)
		strPersonDep = Value
	End Set
	End Property

	Public Property PersonTel As String
	Get
		Return strPersonTel
	End Get
	Set (ByVal Value As String)
		strPersonTel = Value
	End Set
	End Property

	Public Property Risk As String
	Get
		Return strRisk
	End Get
	Set (ByVal Value As String)
		strRisk = Value
	End Set
	End Property

	Public Property RiskName As String
	Get
		Return strRiskName
	End Get
	Set (ByVal Value As String)
		strRiskName = Value
	End Set
	End Property

	Public Property RiskTeam As String
	Get
		Return strRiskTeam
	End Get
	Set (ByVal Value As String)
		strRiskTeam = Value
	End Set
	End Property

	Public Property RiskTel As String
	Get
		Return strRiskTel
	End Get
	Set (ByVal Value As String)
		strRiskTel = Value
	End Set
	End Property

	Public Property Objective As String
	Get
		Return strObjective
	End Get
	Set (ByVal Value As String)
		strObjective = Value
	End Set
	End Property

	Public Property Cif As String
	Get
		Return strCif
	End Get
	Set (ByVal Value As String)
		strCif = Value
	End Set
	End Property

	Public Property CifName As String
	Get
		Return strCifName
	End Get
	Set (ByVal Value As String)
		strCifName = Value
	End Set
	End Property

	Public Property ID_Branch As String
	Get
		Return strID_Branch
	End Get
	Set (ByVal Value As String)
		strID_Branch = Value
	End Set
	End Property

	Public Property Depbranch As String
	Get
		Return strDepbranch
	End Get
	Set (ByVal Value As String)
		strDepbranch = Value
	End Set
	End Property

	Public Property Location As String
	Get
		Return strLocation
	End Get
	Set (ByVal Value As String)
		strLocation = Value
	End Set
	End Property

	Public Property Days As Integer
	Get
		Return intDays
	End Get
	Set (ByVal Value As Integer)
		intDays = Value
	End Set
	End Property

	Public Property Rest As Integer
	Get
		Return intRest
	End Get
	Set (ByVal Value As Integer)
		intRest = Value
	End Set
	End Property

	Public Property Office_chk As Boolean
	Get
		Return bolOffice_chk
	End Get
	Set (ByVal Value As Boolean)
		bolOffice_chk = Value
	End Set
	End Property

	Public Property Home_chk As Boolean
	Get
		Return bolHome_chk
	End Get
	Set (ByVal Value As Boolean)
		bolHome_chk = Value
	End Set
	End Property

	Public Property Shop_chk As Boolean
	Get
		Return bolShop_chk
	End Get
	Set (ByVal Value As Boolean)
		bolShop_chk = Value
	End Set
	End Property

	Public Property Fac_chk As Boolean
	Get
		Return bolFac_chk
	End Get
	Set (ByVal Value As Boolean)
		bolFac_chk = Value
	End Set
	End Property

	Public Property Col_chk As Boolean
	Get
		Return bolCol_chk
	End Get
	Set (ByVal Value As Boolean)
		bolCol_chk = Value
	End Set
	End Property

	Public Property Other_chk As String
	Get
		Return strOther_chk
	End Get
	Set (ByVal Value As String)
		strOther_chk = Value
	End Set
	End Property

	Public Property Attach_File As String
	Get
		Return strAttach_File
	End Get
	Set (ByVal Value As String)
		strAttach_File = Value
	End Set
	End Property

	Public Property TranDate As Date
	Get
		Return clsTranDate
	End Get
	Set (ByVal Value As Date)
		clsTranDate = Value
	End Set
	End Property

	Public Property UserName As String
	Get
		Return strUserName
	End Get
	Set (ByVal Value As String)
		strUserName = Value
	End Set
	End Property

	Public Property IP As String
	Get
		Return strIP
	End Get
	Set (ByVal Value As String)
		strIP = Value
	End Set
	End Property


End Class
