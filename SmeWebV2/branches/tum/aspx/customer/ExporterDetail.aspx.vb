Option Strict On
Option Explicit On

Imports webservice.linq
Imports System.Data.Linq

Namespace aspx.customer
    Partial Class ExporterDetail
        Inherits aspx.MyPageClass

        Protected Sub ExporterFormView_DataBound(ByVal sender As Object, ByVal e As System.EventArgs) Handles ExporterFormView.DataBound
            'ถ้าไม่มีข้อมูลหรือเป็น Empty data template ให้เปลี่ยน mode เป็น insert
            If DirectCast(sender, FormView).DataItemCount < 1 And DirectCast(sender, FormView).CurrentMode = FormViewMode.ReadOnly Then
                DirectCast(sender, FormView).ChangeMode(FormViewMode.Insert)
            End If
        End Sub

        Protected Sub ExporterFormView_PreRender(ByVal sender As Object, ByVal e As System.EventArgs) Handles ExporterFormView.PreRender
            If DirectCast(sender, FormView).CurrentMode = FormViewMode.Insert Then

                Dim cif As Integer
                Try
                    cif = CInt(getQueryString("cif"))
                Catch ex As Exception
                    cif = 0
                End Try

                If cif <> 0 Then
                    DirectCast(DirectCast(sender, FormView).FindControl("CIF_TextBox"), TextBox).Text = cif.ToString()

                    Using cusLinq As New CustomerLinqDataContext()
                        Dim cusInfoes As ISingleResult(Of P_GET_EXPORTER_PRE_DETAIL_BY_CIFResult) = cusLinq.P_GET_EXPORTER_PRE_DETAIL_BY_CIF(cif)
                        For Each cusInfo As P_GET_EXPORTER_PRE_DETAIL_BY_CIFResult In cusInfoes
                            DirectCast(DirectCast(sender, FormView).FindControl("Name_TextBox"), TextBox).Text = cusInfo.Name
                            DirectCast(DirectCast(sender, FormView).FindControl("Business_TextBox"), TextBox).Text = cusInfo.BUSINESS_1
                            DirectCast(DirectCast(sender, FormView).FindControl("TotalOS_TextBox"), TextBox).Text = cusInfo.Total_OS.Value.ToString("#,##0.00")
                            DirectCast(DirectCast(sender, FormView).FindControl("OS_ASOF_Label"), Label).Text = cusInfo.OS_AsOf.Value.ToString("dd/MM/yy")
                        Next
                    End Using
                End If
            End If
        End Sub

        Protected Sub Exporter_SqlDS_Inserting(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.SqlDataSourceCommandEventArgs) Handles Exporter_SqlDS.Inserting
            If Not IsNothing(User.Identity.Name) And (User.Identity.Name.Length > 0) Then
                e.Command.Parameters.Item("@UPDATE_BY").Value = User.Identity.Name
                e.Command.Parameters.Item("@UPDATE_DATE").Value = DateTime.Now
            End If
        End Sub

        Protected Sub Exporter_SqlDS_Updating(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.SqlDataSourceCommandEventArgs) Handles Exporter_SqlDS.Updating
            If Not IsNothing(User.Identity.Name) And (User.Identity.Name.Length > 0) Then
                e.Command.Parameters.Item("@UPDATE_BY").Value = User.Identity.Name
                e.Command.Parameters.Item("@UPDATE_DATE").Value = DateTime.Now
            End If
        End Sub
    End Class
End Namespace