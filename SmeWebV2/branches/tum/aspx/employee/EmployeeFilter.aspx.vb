Option Explicit On
Option Strict On

Partial Class aspx_employee_EmployeeFilter
    Inherits aspx.MyPageClass

#Region "Custom Code"
    Protected Function genReturnJScript(ByVal cifId As String, ByVal nameId As String) As String
        Dim script As String = ""

        If Not IsNothing(returnId) Then
            script += "setPropertyValueById('" + returnId.Id + "','" + returnId.Parent + "','" + returnId.Prop + "',getPropertyValueById('" + cifId + "','this','innerText'));"
        End If

        If Not IsNothing(returnDetail) Then
            script += "setPropertyValueById('" + returnDetail.Id + "','" + returnDetail.Parent + "','" + returnDetail.Prop + "',getPropertyValueById('" + nameId + "','this','innerText'));"
        End If

        script = encapsulateTryCatch(script, "genReturnJScript(cif,name)")

        Return script
    End Function

    Protected Function encapsulateTryCatch(ByVal script As String, ByVal functionName As String) As String
        Dim result As String = script

        If script.Length > 0 Then
            result = "try{ " + script + " }catch(err){ alert('Function " + functionName + " error on " + className + " \n\n'+err.description) }"
        End If

        Return result
    End Function
#End Region

#Region "Sever Validate"
    Protected Sub ValidateFilter(ByVal source As Object, ByVal args As ServerValidateEventArgs)
        Dim result As Boolean = True

        'ถ้าเป็น EMP_ID ต้องเป็นตัวเลขเท่านั้น
        If DDL_Filter.SelectedIndex = 0 Then
            Try
                Dim num As Integer = Integer.Parse(args.Value)
            Catch ex As Exception
                result = False
            End Try
        End If

        args.IsValid = result
    End Sub
#End Region

    Private className As String = "aspx_employee_EmployeeFilter"
    Private returnId As DomDetail = Nothing
    Private returnDetail As DomDetail = Nothing

    Protected Sub Butt_Search_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles Butt_Search.Click
        ' Display whether the page passed validation.
        If Page.IsValid Then
            Select Case (DDL_Filter.SelectedIndex)
                Case 0  'empId
                    GV_Employee.DataSourceID = DS_Employee.ID
                    Exit Select
                Case 1  'name
                    GV_Employee.DataSourceID = DS_Employee2.ID
                    Exit Select
            End Select
        End If
    End Sub

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Not IsNothing(Request.QueryString("returnIdTarget")) Then
            returnId = New DomDetail(Request.QueryString("returnIdTarget"), Request.QueryString("returnIdProp"))
        End If

        If Not IsNothing(Request.QueryString("returnDetailTarget")) Then
            returnDetail = New DomDetail(Request.QueryString("returnDetailTarget"), Request.QueryString("returnDetailProp"))
        End If
    End Sub

    Protected Sub LinkButt_SelectEmpId_Load(ByVal sender As Object, ByVal e As System.EventArgs)
        Dim linkBt As LinkButton = DirectCast(sender, LinkButton)

        linkBt.OnClientClick = genReturnJScript(DirectCast(linkBt.Parent.FindControl("Label_EmpId"), Label).ClientID, DirectCast(linkBt.Parent.FindControl("Label_EmpName"), Label).ClientID) + " window.close();"
    End Sub

    Protected Sub DS_Employee2_Selecting(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.SqlDataSourceSelectingEventArgs) Handles DS_Employee2.Selecting
        e.Command.Parameters.Item("@NAME").Value = "%" + e.Command.Parameters.Item("@NAME").Value.ToString() + "%"
    End Sub
End Class
