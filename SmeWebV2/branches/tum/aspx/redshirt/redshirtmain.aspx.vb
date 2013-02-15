Imports System.Web.Services
Imports System.Web

Partial Class aspx_redshirt_redshirtmain

    Inherits System.Web.UI.Page

    <System.Web.Script.Services.ScriptMethod()> _
      <System.Web.Services.WebMethod()> _
  Public Shared Function showRedShirtList() As String
        Dim obj As New redshirt
        Return obj.showData
    End Function
    <System.Web.Script.Services.ScriptMethod()> _
      <System.Web.Services.WebMethod()> _
  Public Shared Function showRedShirtListByEMP(ByVal EMP_ID As String) As String
        Dim obj As New redshirt
        Return obj.showDataByEMP(EMP_ID)
    End Function
    <System.Web.Script.Services.ScriptMethod()> _
  <System.Web.Services.WebMethod()> _
Public Shared Function showRedShirtListPaging(ByVal PageNumber As Integer, ByVal MaximumRows As Integer) As String
        Dim obj As New redshirt
        Return obj.showDataPaging(PageNumber, MaximumRows)
    End Function
    <System.Web.Script.Services.ScriptMethod()> _
     <System.Web.Services.WebMethod()> _
 Public Shared Function showTypeOfHelp() As String
        Dim obj As New redshirt
        Return obj.showTypeOfHelp

    End Function
    <System.Web.Script.Services.ScriptMethod()> _
     <System.Web.Services.WebMethod()> _
 Public Shared Function showTypeOfCustomer() As String
        Dim obj As New redshirt
        Return obj.showTypeOfCustomer
    End Function
    <System.Web.Script.Services.ScriptMethod()> _
     <System.Web.Services.WebMethod()> _
 Public Shared Function showTypeOfBusiness() As String
        Dim obj As New redshirt
        Return obj.showTypeOfBusiness
    End Function
    <System.Web.Script.Services.ScriptMethod()> _
     <System.Web.Services.WebMethod()> _
 Public Shared Function showTypeOfZone() As String
        Dim obj As New redshirt
        Return obj.showTypeOfZone
    End Function
    <System.Web.Script.Services.ScriptMethod()> _
         <System.Web.Services.WebMethod()> _
     Public Shared Function showEmployee() As String
        Dim obj As New redshirt
        Return obj.showEMP
    End Function
    <System.Web.Script.Services.ScriptMethod()> _
             <System.Web.Services.WebMethod()> _
         Public Shared Function showEmployeeName(ByVal EMP_ID As String) As String
        Dim obj As New redshirt
        Return obj.showEMPName(EMP_ID)
    End Function
    <System.Web.Script.Services.ScriptMethod()> _
         <System.Web.Services.WebMethod()> _
     Public Shared Function showLEVEL() As String
        Dim obj As New redshirt
        Return obj.showLEVEL
    End Function
    <System.Web.Script.Services.ScriptMethod()> _
     <System.Web.Services.WebMethod()> _
 Public Shared Function updateCustomer( _
        ByVal IDEN As Integer, _
        ByVal CIF As Integer, _
        ByVal LIMIT As String, _
        ByVal TYPE_OF_BUSINESS As Integer, _
        ByVal OTHER_BUSINESS As String, _
        ByVal TYPE_OF_ZONE As Integer, _
        ByVal LOCATION As String, _
        ByVal CONTRACT_DATE As String, _
        ByVal TYPE_OF_HELP As Integer, _
        ByVal APPROVE_DATE As String, _
        ByVal TYPE_OF_APPROVAL As Integer, _
        ByVal SINGNING_DATE As String, _
        ByVal CONDITION_DATE As String, _
        ByVal CUSTOMER_TYPE As String, _
        ByVal CM As String, _
        ByVal CM_HEAD As String, _
        ByVal CM_GROUP As String, _
        ByVal REMARK As String, _
        ByVal EMP_ID As String) As String

        ' ส่ง name มาแต่ไม่ได้บันทึก

        Dim obj As New redshirt
        Return obj.updateData(IDEN, CIF, LIMIT, _
                                    TYPE_OF_BUSINESS, OTHER_BUSINESS, _
                                   TYPE_OF_ZONE, LOCATION, _
                                  CONTRACT_DATE, TYPE_OF_HELP, _
                                APPROVE_DATE, TYPE_OF_APPROVAL, _
                                SINGNING_DATE, CONDITION_DATE, CUSTOMER_TYPE, _
                                CM, CM_HEAD, CM_GROUP, _
                                REMARK, EMP_ID)

    End Function
    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        ' code ส่วนนี้เอาไว้ทดสอบการ แสดงผลจาก obj
        ' โดยเอา  remark  obj และ rows ที่ต้องการแสดงออก

        'Dim obj As New redshirt
        'MsgBox(obj.showData)
        'MsgBox(obj.showTypeOfCustomer) '  แสดงข้อมูลจาก customer type
        'MsgBox(obj.showTypeOfHelp)  ' แสดงข้อมูลจาก type of help
        'MsgBox(obj.showData) ' แสดงข้อมูล redshirt
        'MsgBox(obj.showEMPName("249987"))
        'MsgBox(obj.showEMP)
        'MsgBox(obj.showCustomerName(18))

    End Sub

End Class
