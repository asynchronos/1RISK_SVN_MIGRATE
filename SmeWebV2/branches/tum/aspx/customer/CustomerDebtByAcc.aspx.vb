Option Explicit On
Option Strict On

Namespace aspx.customer
    Partial Class CustomerDebtByAcc
        Inherits aspx.MyPageClass

#Region "Custom Code"
        Protected dailyConnName As String = ConnectionUtil.getConnectionString(ConnectionUtil.ConnectionString.BAY01ConnectionString)
        Protected MonthlyConnName As String = ConnectionUtil.getConnectionString(ConnectionUtil.ConnectionString.BAY01ConnectionString)

        'ชื่อ Store Procedure
        Protected dailyByAccountStore As String = "SP_DailyByAccount"
        Protected dailyByAccountSelectedStore As String = "SP_DailyByAccountSelected"

        'ชื่อ Store Procedure
        Protected monthlyByAccountStore As String = "SP_MonthlyByAccount"
        Protected monthlyByAccountSelectedStore As String = "SP_MonthlyByAccountSelected"

        Protected Sub configDatasource(ByVal accType As String)
            Dim connString As String = Nothing
            Dim ByAccountStore As String = Nothing
            Dim ByAccountSelectedStore As String = Nothing

            If (accType.Equals("Daily")) Then
                connString = ConfigurationManager.ConnectionStrings(dailyConnName).ConnectionString
                ByAccountStore = dailyByAccountStore
                ByAccountSelectedStore = dailyByAccountSelectedStore
            ElseIf (accType.Equals("Monthly")) Then
                connString = ConfigurationManager.ConnectionStrings(MonthlyConnName).ConnectionString
                ByAccountStore = monthlyByAccountStore
                ByAccountSelectedStore = monthlyByAccountSelectedStore
            End If

            ByAccountDS.ConnectionString = connString
            ByAccountSelectedDS.ConnectionString = connString

            ByAccountDS.SelectCommand = ByAccountStore
            ByAccountSelectedDS.SelectCommand = ByAccountSelectedStore
        End Sub
#End Region

        Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
            configDatasource(getQueryString("type"))
        End Sub

        Protected Sub ByAccountGridView_PageIndexChanging(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewPageEventArgs) Handles ByAccountGridView.PageIndexChanging
            Dim GV As GridView = DirectCast(sender, GridView)

            GV.SelectedIndex = -1
            CONTNOHiddenField.Value = String.Empty
            SEQNOHiddenField.Value = String.Empty
            PRINCIPALHiddenField.Value = String.Empty
            ByAccountSelectedDS.DataBind()
        End Sub

        Protected Sub ByAccountGridView_SelectedIndexChanging(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewSelectEventArgs) Handles ByAccountGridView.SelectedIndexChanging
            Dim GV As GridView = DirectCast(sender, GridView)

            CONTNOHiddenField.Value = DirectCast(GV.Rows(e.NewSelectedIndex).Cells(1), DataControlFieldCell).Text
            SEQNOHiddenField.Value = DirectCast(GV.Rows(e.NewSelectedIndex).Cells(2), DataControlFieldCell).Text
            PRINCIPALHiddenField.Value = DirectCast(GV.Rows(e.NewSelectedIndex).Cells(4), DataControlFieldCell).Text
        End Sub
    End Class
End Namespace
