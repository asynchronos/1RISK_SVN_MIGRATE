
Partial Class smes_financial_main_new
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

        ' ตรวจสอบว่ามีการส่ง query string smes_id มาหรือไม่ ถ้ามีแสดงว่าเป็นการ update ให้ส่ง smes_id ไปยัง frame main และ frame ที่เป็น menu ด้วย

        Dim SMES_ID As String = Request.QueryString("SMES_ID")
        If SMES_ID <> "" Then ' ถ้ามี ข้อมูล customer แล้ว
            With Me.menuFrame
                .Attributes.Add("src", "financial_menu.aspx?SMES_ID=" & SMES_ID)
            End With
            With Me.mainFrame
                .Attributes.Add("src", "financial_information.aspx?SMES_ID=" & SMES_ID)
            End With
        Else
            With Me.menuFrame
                .Attributes.Add("src", "financial_menu.aspx")
            End With
            With Me.mainFrame
                .Attributes.Add("src", "financial_information.aspx")
            End With
        End If

        ' รับค่า username จาก query string  กรณีที่เป็นการเปิดจากหน้าเว็บอื่น
        If Request.QueryString("User") <> "" Then
            spanUserName.InnerText = Request.QueryString("User")
            spanName.InnerText = Request.QueryString("Name")
        Else
            spanUserName.InnerText = Session("User")
            spanName.InnerText = Session("Name")

        End If


    End Sub
End Class
