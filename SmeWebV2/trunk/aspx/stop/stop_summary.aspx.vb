Imports System.Web.Services
Imports System.Web
Imports System.Data
Partial Class aspx_stop_stop_summary
    Inherits System.Web.UI.Page

    <System.Web.Script.Services.ScriptMethod()> _
        <System.Web.Services.WebMethod()> _
    Public Shared Function findCIF(ByVal EMP_ID As String, ByVal CIF As Double) As String

        Dim SqlDataSource1 As New SqlDataSource
        SqlDataSource1.ConnectionString = ConfigurationManager.ConnectionStrings("STOPConnectionString").ToString
        SqlDataSource1.SelectParameters.Clear()
        SqlDataSource1.SelectParameters.Add("CIF", CIF)
        SqlDataSource1.SelectParameters.Add("EMP_ID", EMP_ID)
        SqlDataSource1.SelectCommand = "S51_SELECT_CIF_OF_SS_SM_ST"
        SqlDataSource1.SelectCommandType = SqlDataSourceCommandType.StoredProcedure
        Dim dv As New Data.DataView
        dv = CType(SqlDataSource1.Select(DataSourceSelectArguments.Empty), Data.DataView)
        Dim result As String = Nothing
        If Not dv Is Nothing Then
            result = result & "{"
            result = result & " 'count_ss': '" & CType(dv.Table.Rows(0)(0), Integer).ToString & "', "
            result = result & " 'count_sm': '" & CType(dv.Table.Rows(0)(1), Integer).ToString & "', "
            result = result & " 'count_st': '" & CType(dv.Table.Rows(0)(2), Integer).ToString & "'"
            result = result & "}"
        End If
        Return result

    End Function
    <System.Web.Script.Services.ScriptMethod()> _
        <System.Web.Services.WebMethod()> _
    Public Shared Function findSUM(ByVal EMP_ID As String) As String

        Dim strEmp_ID As String = EMP_ID
        Dim SqlDataSource1 As New SqlDataSource
        SqlDataSource1.ConnectionString = ConfigurationManager.ConnectionStrings("STOPConnectionString").ToString
        SqlDataSource1.SelectParameters.Clear()
        Dim parameter1 = New Parameter("EMP_ID", TypeCode.String, strEmp_ID)
        SqlDataSource1.SelectParameters.Add(parameter1)
        SqlDataSource1.SelectCommand = "S50_SELECT_SUMMARY_NUM_OF_SS_SM_ST"
        SqlDataSource1.SelectCommandType = SqlDataSourceCommandType.StoredProcedure
        Dim dv As New Data.DataView
        dv = CType(SqlDataSource1.Select(DataSourceSelectArguments.Empty), Data.DataView)
        Dim result As String = Nothing
        If Not dv Is Nothing Then
            result = result & "{"
            result = result & " 'count_ss': '" & CType(dv.Table.Rows(0)(0), Integer).ToString & "', "
            result = result & " 'count_sm': '" & CType(dv.Table.Rows(0)(1), Integer).ToString & "', "
            result = result & " 'count_st': '" & CType(dv.Table.Rows(0)(2), Integer).ToString & "', "
            ' result = result & " 'count_sme': '" & CType(dv.Table.Rows(0)(3), Integer).ToString & "', "
            result = result & " 'date_ss': '" & dv.Table.Rows(0)(3).ToString & "' "
            result = result & "}"
        End If
        Return result

    End Function
    'Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

    '    'Dim strEmp_ID As String = Session("EMP_ID")
    '    'If strEmp_ID = "" Then Response.Redirect(Page.ResolveUrl("~/aspx/account/LoginWithAD.aspx"))
    '    ' ''If User.IsInRole("0000000001") Or User.IsInRole("0000000002") Or User.IsInRole("0000000005") Then
    '    ' ''    strEmp_ID = "000001"
    '    ' ''End If
    '    ' ''If strEmp_ID = "" Then
    '    ' ''    strEmp_ID = "000001"
    '    ' ''End If
    '    'SqlDataSource1.SelectParameters.Clear()

    '    'Dim parameter1 = New Parameter("EMP_ID", TypeCode.String, strEmp_ID)
    '    'SqlDataSource1.SelectParameters.Add(parameter1)

    '    'SqlDataSource1.SelectCommand = "S50_SELECT_SUMMARY_NUM_OF_SS_SM_ST"
    '    'SqlDataSource1.SelectCommandType = SqlDataSourceCommandType.StoredProcedure

    '    'Dim dv As Data.DataView

    '    'dv = CType(SqlDataSource1.Select(DataSourceSelectArguments.Empty), Data.DataView)
    '    'hlss.Text += " (" + CType(dv.Table.Rows(0)(0), Integer).ToString + ")"
    '    'hlsm.Text += " (" + CType(dv.Table.Rows(0)(1), Integer).ToString + ")"
    '    'hlst.Text += " (" + CType(dv.Table.Rows(0)(2), Integer).ToString + ")"
    '    'lblSme.Text += "(" + CType(dv.Table.Rows(0)(3), Integer).ToString + ")"
    '    'lblupdate.Text = " Update " & dv.Table.Rows(0)(4).ToString

    'End Sub

End Class
