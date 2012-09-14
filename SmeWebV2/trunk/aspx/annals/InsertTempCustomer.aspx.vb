Imports System.Data.SqlClient
Partial Class aspx_annals_InsertTempCustomer
    Inherits System.Web.UI.Page

    Protected Sub BtnAdd_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles BtnAdd.Click
        SaveTempCust()
    End Sub
    Private Sub SaveTempCust()

        If TbCIF.Text = "" Then
            Alert(" Please insert cif. ")
            Exit Sub
        ElseIf TbName.Text = "" Then
            Alert(" Plase insert name. ")
            Exit Sub
        End If
        Dim dal As New CustomerDAL
        Dim obj As New Customer
        If Session("eventcust") = "add" Then
            obj = dal.getCustomerByCIF(TbCIF.Text)
            If obj.CUS_FIRST <> "" Then
                Alert(" Duplicate Customer " & TbCIF.Text)
                Exit Sub
            End If
        End If
        obj.CIF = TbCIF.Text
        obj.CUS_FIRST = TbName.Text
        obj.CUS_TITLE = TbTitle.Text
        obj.CUS_LAST = TbLastName.Text
        If Session("eventcust") = "add" Then
            dal.insertCustomerTemp(obj)
        Else
            dal.updateCustomer(obj)
        End If
        cleardata()
        Alert(Session("eventcust") & " complete.")
        Session("eventcust") = "add"
    End Sub
    Protected Sub Alert(ByVal str As String)

        ' Response.Write("<script language=""javascript"">alert(""" & str & """)</script>")
        str = "alert(""" & str & """);"
        Page.ClientScript.RegisterStartupScript(Me.GetType(), "messagebox", str, True)

    End Sub
    Private Sub cleardata()
        TbCIF.Text = ""
        TbName.Text = ""
        TbTitle.Text = ""
        TbLastName.Text = ""
        BtnAdd.Text = "Add (เพิ่มข้อมูล)"
        lblmsg.Text = ""
    End Sub

    Protected Sub Button1_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles Button1.Click
        If IsNumeric(TbCIF.Text) = False Or TbCIF.Text = "" Then
            lblmsg.Text = "Please insert cif."
            Exit Sub
        End If
        Dim dal As New CustomerDAL
        Dim obj As New Customer
        obj.CIF = TbCIF.Text
        obj = dal.getCustomerTempByCIF(obj)
        If obj.CUS_FIRST <> "" Then
            Session("eventcust") = "update"
            TbName.Text = obj.CUS_FIRST
            TbTitle.Text = obj.CUS_TITLE
            TbLastName.Text = obj.CUS_LAST
            BtnAdd.Text = "Edit (แก้ไขข้อมูล)"
        Else

            Session("eventcust") = "add"
            cleardata()
            lblmsg.Text = "Don 't have customer data."
            Exit Sub
        End If
    End Sub

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Not Page.IsPostBack Then
            cleardata()
            Session("eventcust") = "add"
        Else
            If IsNothing(Session("eventcust")) = True Then
                Response.Write("<script type='text/javascript'>window.close();</script>")
            End If
        End If
    End Sub

    Protected Sub btnCancel_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnCancel.Click
        cleardata()
    End Sub
End Class
