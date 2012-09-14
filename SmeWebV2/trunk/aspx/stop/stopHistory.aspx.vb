Option Strict On
Option Explicit On

Namespace aspx.stop
    Partial Class StopHistory
        Inherits aspx.MyPageClass

        Private Const formViewId As String = "DetailFormView"

#Region "My Code"

#End Region

#Region "Move Back to Stop"
        ''' <summary>
        ''' ไม่ได้ใช้แล้ว การย้ายกลับไป STOP ไปทำที่หน้า Popup แทน
        ''' </summary>
        ''' <param name="sender"></param>
        ''' <param name="e"></param>
        ''' <remarks></remarks>
        Protected Sub move2StopButton_Click(ByVal sender As Object, ByVal e As System.EventArgs)
            'Stored ที่ใช้สำหรับส่งกลับไปยัง STOP CUSTOMER ถูกเก็บไว้ที่ Insert ของ History_DS
            'เพราะไม่น่าจะมีการ insert โดย manual ลง Table STOP_CUSTOMER_HISTORY
            Dim result As Integer = History_DS.Insert()
            HistoryGridView.DataBind()
            DetailFormView.DataBind()
        End Sub

        Protected Sub History_DS_Inserting(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.SqlDataSourceCommandEventArgs) Handles History_DS.Inserting
            e.Command.Parameters.Item("@CIF").Value = DetailFormView.SelectedValue
        End Sub
#End Region

#Region "ControllingTree"
        Protected Sub ControllingTree1_Init(ByVal sender As Object, ByVal e As System.EventArgs) Handles ControllingTree1.Init
            DirectCast(sender, ControllingTree).EMP_ID_ROOT = User.Identity.Name
        End Sub

        Protected Sub ControllingTree1_SelectedNodeChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles ControllingTree1.SelectedNodeChanged
            Dim treeLine As ControllingTree = DirectCast(sender, ControllingTree)
            Hidd_TreeSelectedEmpIds.Value = treeLine.SelectedEmpIds
            Hidd_TreeSelectedValue.Value = treeLine.SelectedValue
            Hidd_TreeSelectedValueType.Value = treeLine.SelectedValueType
        End Sub

        Protected Sub Page_PreRender(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.PreRender
            TreeSelectedLabel.Text = ControllingTree1.SelectedText
        End Sub
#End Region

#Region "Default Event"

        Protected Sub HistoryGridView_PageIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles HistoryGridView.PageIndexChanged
            'Cascading HistoryGridView to DetailFormView
            Dim gv As GridView = DirectCast(sender, GridView)
            gv.SelectedIndex = -1
            DetailFormView.DataSourceID = String.Empty
            'End 'Cascading HistoryGridView to DetailFormView
        End Sub

        Protected Sub HistoryGridView_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles HistoryGridView.SelectedIndexChanged
            'Cascading HistoryGridView to DetailFormView
            Dim gv As GridView = DirectCast(sender, GridView)
            DetailFormView.DataSourceID = History_DS.ID
            DetailFormView.PageIndex = (gv.PageIndex * gv.PageSize) + gv.SelectedRow.RowIndex
            'End 'Cascading HistoryGridView to DetailFormView
        End Sub

        Protected Sub SelectLinkButton_PreRender(ByVal sender As Object, ByVal e As System.EventArgs)
            Dim link As LinkButton = DirectCast(sender, LinkButton)
            Dim HIDLabelValue As Label = DirectCast(link.Parent.Parent.FindControl("HIDLabelValue"), Label)

            link.OnClientClick = "var historyDetail = window.open('" + Page.ResolveUrl("~/aspx/stop/stopHistoryDetail.aspx?hid=") + HIDLabelValue.Text + "'" _
                                + ",'historyDetail'" _
                                + ",'toolbar=No,width=800,height=610,resizable=yes,scrollbars=yes');" _
                                + "historyDetail.focus();"
            Dim a As HttpRequest = Me.Request
        End Sub
#End Region


    End Class
End Namespace
