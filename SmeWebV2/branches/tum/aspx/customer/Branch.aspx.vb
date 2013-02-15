Option Strict On
Option Explicit On

Partial Class aspx_customer_Branch
    Inherits System.Web.UI.Page

#Region "Custom Code"

    ''' <summary>
    ''' 
    ''' </summary>
    ''' <param name="returnIdSrc">Client ID ของค่าที่จะReturn</param>
    ''' <param name="returnDetailSrc">Client ID ของค่าที่จะReturn</param>
    ''' <returns></returns>
    ''' <remarks></remarks>
    Protected Function genReturnJScript(ByVal returnIdSrc As String, ByVal returnDetailSrc As String) As String
        Dim script As String = ""

        If Not IsNothing(returnId) Then
            script += "setPropertyValueById('" + returnId.Id + "','" + returnId.Parent + "','" + returnId.Prop + "',getPropertyValueById('" + returnIdSrc + "','this','innerText'));"
        End If

        If Not IsNothing(returnDetail) Then
            script += "setPropertyValueById('" + returnDetail.Id + "','" + returnDetail.Parent + "','" + returnDetail.Prop + "',getPropertyValueById('" + returnDetailSrc + "','this','innerText'));"
        End If

        script = encapsulateTryCatch(script, "genReturnJScript(returnIdSrc,returnDetailSrc)")

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

    Private className As String = "aspx_customer_Branch"
    Private returnId As DomDetail = Nothing
    Private returnDetail As DomDetail = Nothing

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Not IsNothing(Request.QueryString("returnIdTarget")) Then
            returnId = New DomDetail(Request.QueryString("returnIdTarget"), Request.QueryString("returnIdProp"))
        End If

        If Not IsNothing(Request.QueryString("returnDetailTarget")) Then
            returnDetail = New DomDetail(Request.QueryString("returnDetailTarget"), Request.QueryString("returnDetailProp"))
        End If
    End Sub

    Protected Sub KeywordsTextBox_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles KeywordsTextBox.Load
        'เวลามีการเปลี่ยนแปลง textbox ให้ไปอัพเดต hidden filed ที่ใช้ในการส่งค่าไปยัง datasource ให้มีเครื่องหมาย % ปิดหัวปิดท้าย เพื่อใช้คำสั่ง LIKE ใน SQL
        DirectCast(sender, TextBox).Attributes.Add("onchange", "setPropertyValueById('" + KeywordsField.ClientID + "','this','value','%' +getPropertyValue(this,'value')+ '%')")
    End Sub

    Protected Sub SelectBranchLinkBt_Load(ByVal sender As Object, ByVal e As System.EventArgs)
        Dim linkBt As LinkButton = DirectCast(sender, LinkButton)

        linkBt.OnClientClick = genReturnJScript(DirectCast(linkBt.Parent.FindControl("Id_Branch"), Label).ClientID, DirectCast(linkBt.Parent.FindControl("Branch_T"), Label).ClientID) + "window.close(); return false;"
    End Sub

End Class
