
Partial Class smes_financial_main
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        Dim strUsername As String = Session("EMP_ID")

        If strUsername = Nothing Or strUsername = "" Then
            strUsername = Request.QueryString("User")
        End If
        If strUsername = "" Then
            Response.Redirect("../mainpage.aspx")
        Else
            If Request.QueryString("User") <> "" Then
                spanUserName.InnerText = Request.QueryString("User")
                spanName.InnerText = Request.QueryString("Name")
            Else
                spanUserName.InnerText = Session("EMP_ID")
                spanName.InnerText = Session("EMP_NAME")
            End If
      
        End If

        If Request.QueryString("REF_ID") <> "" Then
            spanRefID.InnerText = Request.QueryString("REF_ID")
        End If

        If Request.QueryString("TEMPLATE_ID") <> "" Then
            spanTemplateID.InnerText = Request.QueryString("TEMPLATE_ID")
            If Request.QueryString("TEMPLATE_ID") = "1" Then
                spanTemplateName.InnerText = "SS Template"
            ElseIf Request.QueryString("TEMPLATE_ID") = "2" Then
                spanTemplateName.InnerText = "Flood Template"
            ElseIf Request.QueryString("TEMPLATE_ID") = "3" Then
                spanTemplateName.InnerText = "3X Template"
            End If

        End If


        ' ตรวจสอบว่ามีการส่ง query string smes_id มาหรือไม่ ถ้ามีแสดงว่าเป็นการ update ให้ส่ง smes_id ไปยัง frame main และ frame ที่เป็น menu ด้วย

        Dim SMES_ID As String = Request.QueryString("SMES_ID")
        Dim TEMPLATE_ID As String = Request.QueryString("TEMPLATE_ID")
        If SMES_ID <> "" Then ' ถ้ามี ข้อมูล customer แล้ว
            With Me.menuFrame
                .Attributes.Add("src", "financial_menu.aspx?TEMPLATE_ID=" & TEMPLATE_ID & "&SMES_ID=" & SMES_ID)
            End With
            With Me.mainFrame
                .Attributes.Add("src", "financial_information.aspx?TEMPLATE_ID=" & TEMPLATE_ID & "&SMES_ID=" & SMES_ID)
            End With
        Else
            With Me.menuFrame
                .Attributes.Add("src", "financial_menu.aspx?TEMPLATE_ID=" & TEMPLATE_ID & "")
            End With
            With Me.mainFrame
                .Attributes.Add("src", "financial_information.aspx?TEMPLATE_ID=" & TEMPLATE_ID & "")
            End With
        End If



    End Sub
End Class
