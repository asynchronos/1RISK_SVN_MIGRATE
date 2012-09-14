Option Explicit On
Option Strict On

Imports System.Diagnostics
Imports System.Data.SqlClient
Imports System.Collections.Generic
Imports System.Data
Imports Microsoft.VisualBasic

Namespace aspx.portfolio
    Partial Class Summary
        Inherits aspx.MyPageClass

#Region "Custom Code"
        Protected sumCountCIF As Integer
        Protected sumPrincipal As Double
        Protected sumAccru As Double
        Protected sumSusp As Double
        Protected pageSize As Integer = 10

        Private Sub initSum()
            sumCountCIF = 0
            sumPrincipal = 0
            sumAccru = 0
            sumSusp = 0
        End Sub

        Private Sub loadFilter()

            Dim obj As ArrayList = MyCacheFactory.getCache(MyCacheFactory.cacheKeyEnum.TbRiskControlSummaryFilter).getArraylist()

            fillFilterDD(FilterColumnDD1, obj)
            fillFilterDD(FilterColumnDD2, obj)
            fillFilterDD(FilterColumnDD3, obj)
            fillFilterDD(FilterColumnDD4, obj)

            fillOrderDD(OrderColumnDD1)
            fillOrderDD(OrderColumnDD2)
            fillOrderDD(OrderColumnDD3)
            fillOrderDD(OrderColumnDD4)
        End Sub

        Private Sub fillFilterDD(ByVal filterColumnDD As DropDownList, ByVal obj As ArrayList)
            Dim filter As TbRiskControlSummaryFilter = Nothing

            For i As Integer = 0 To obj.Count - 1
                filter = DirectCast(obj.Item(i), TbRiskControlSummaryFilter)
                filterColumnDD.Items.Insert(i, filter.FilterDesc)
                filterColumnDD.Items(i).Value = filter.PropertyInClass
            Next
        End Sub

        Private Sub fillOrderDD(ByVal orderColumnDD As DropDownList)
            orderColumnDD.Items.Insert(0, "จากน้อยไปมาก")
            orderColumnDD.Items(0).Value = "ASC"

            orderColumnDD.Items.Insert(1, "จากมากไปน้อย")
            orderColumnDD.Items(1).Value = "DESC"
        End Sub

        'กรณีที่ ProperInClass กับ FilterColumn เป็นคนละชื่อกันต้องสร้างตัวเช็คเพื่อ mapping(ดูที่ database)
        Private Function checkClassDebt(ByVal columnName As String) As String

            If (columnName.Equals("ClassDebt")) Then
                columnName = "Class"
            End If

            Return columnName
        End Function

#End Region

        Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

            'init ทุกครั้งที่โหลด เพื่อ reset ค่า sum
            initSum()

            If Not Me.IsPostBack Then
                loadFilter()
                FilterColumnDD1.SelectedIndex = 1

                'MsgBox(User.Identity.Name)
                'Dim employee As New TbEmployee()
                'employee.EMP_ID = "001073"
                'Session.Add(SessionKeyConst.EMPLOYEE, employee)
            End If

        End Sub

        Protected Sub SummaryBt_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles SummaryBt.Click
            SummaryGridView.DataBind()
            'Dim notSelectDropdown As Boolean = True

            'Dim parentControl As Control = DirectCast(sender, Button).Parent

            'Dim ddl As DropDownList = Nothing

            ''เช็ค 4 dropdown
            'For i As Integer = 1 To 4
            '    ddl = DirectCast(parentControl.FindControl("FilterColumnDD" + i.ToString), DropDownList)
            '    If ddl.SelectedIndex <> 0 Then
            '        notSelectDropdown = False
            '        Exit For
            '    End If
            'Next

            'If notSelectDropdown = False Then
            '    'displaySummary()
            'End If

        End Sub

        Protected Sub SummaryGridView_RowDataBound(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewRowEventArgs) Handles SummaryGridView.RowDataBound
            If e.Row.RowType = DataControlRowType.DataRow Then
                'ทำการ sum ค่าต่างๆเก็บไว้
                sumCountCIF += CType(DirectCast(e.Row.Cells(4).FindControl("CountCIF"), Label).Text, Integer)
                sumPrincipal += CType(DirectCast(e.Row.Cells(5).FindControl("Principal"), Label).Text, Double)
                sumAccru += CType(DirectCast(e.Row.Cells(6).FindControl("Accru"), Label).Text, Double)
                sumSusp += CType(DirectCast(e.Row.Cells(7).FindControl("Susp"), Label).Text, Double)

                'สร้าง DetailLink
                Dim condition As String = ""
                Dim navigateUrl As String = "./RiskControlling.aspx?empid=" + HttpUtility.UrlEncode(ControllingTree1.SelectedEmpIds)

                If Not (FilterColumnDD1.SelectedValue.Equals("NoValue")) Then
                    condition += " AND " + checkClassDebt(FilterColumnDD1.SelectedValue) + " = '" + DirectCast(e.Row.Cells(0).FindControl("FilterLabel1"), Label).Text + "'"
                End If

                If Not (FilterColumnDD2.SelectedValue.Equals("NoValue")) Then
                    condition += " AND " + checkClassDebt(FilterColumnDD2.SelectedValue) + " = '" + DirectCast(e.Row.Cells(1).FindControl("FilterLabel2"), Label).Text + "'"
                End If

                If Not (FilterColumnDD3.SelectedValue.Equals("NoValue")) Then
                    condition += " AND " + checkClassDebt(FilterColumnDD3.SelectedValue) + " = '" + DirectCast(e.Row.Cells(2).FindControl("FilterLabel3"), Label).Text + "'"
                End If

                If Not (FilterColumnDD4.SelectedValue.Equals("NoValue")) Then
                    condition += " AND " + checkClassDebt(FilterColumnDD4.SelectedValue) + " = '" + DirectCast(e.Row.Cells(3).FindControl("FilterLabel4"), Label).Text + "'"
                End If

                If Not (condition.Trim.Equals("")) Then
                    'ตัด and ของ condition แรกออก
                    condition = condition.Substring(condition.IndexOf(" AND ") + 5)

                    navigateUrl += "&condition=" + HttpUtility.UrlEncode(condition)
                End If

                'นำค่า url ที่ได้ไปใส่ไว้ที่ปุ่ม
                DirectCast(e.Row.Cells(8).FindControl("DetailImageButton"), ImageButton).PostBackUrl = navigateUrl
            End If
        End Sub

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
            Hidd_TreeSelectedEmpIds.Value = ControllingTree1.SelectedEmpIds
            Hidd_TreeSelectedValue.Value = ControllingTree1.SelectedValue
            Hidd_TreeSelectedValueType.Value = ControllingTree1.SelectedValueType
        End Sub
    End Class
End Namespace

