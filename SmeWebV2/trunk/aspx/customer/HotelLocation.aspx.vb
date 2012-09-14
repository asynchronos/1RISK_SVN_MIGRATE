Imports System.Web.Services
Imports System.Web
Partial Class aspx_customer_HotelLocation
    Inherits System.Web.UI.Page
    <System.Web.Script.Services.ScriptMethod()> _
    <System.Web.Services.WebMethod()> _
    Public Shared Function showHotelLocation() As String
        Dim obj As New HotelLocation
        Return obj.showLocation
    End Function
    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        ' code ส่วนนี้เอาไว้ทดสอบการ แสดงผลจาก obj
        ' โดยเอา  remark  obj และ rows ที่ต้องการแสดงออก

        Dim obj As New HotelLocation
        MsgBox(obj.showLocation)
        'MsgBox(obj.showTypeOfCustomer) '  แสดงข้อมูลจาก customer type
        'MsgBox(obj.showTypeOfHelp)  ' แสดงข้อมูลจาก type of help
        'MsgBox(obj.showData) ' แสดงข้อมูล redshirt
        'MsgBox(obj.showEMPName("249987"))
        'MsgBox(obj.showEMP)
        'MsgBox(obj.showCustomerName(18))

    End Sub
End Class
