Imports System.Data
Imports System.Data.OracleClient
Partial Class aspx_report_ReportPassALSCOM
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Request.QueryString("cif") = "" Then
            ' แสดง link alscom และ table alscom
            tableALSCOM.Visible = False
        Else

            getALSdataFromWH(Request.QueryString("cif"))
            
        End If
    End Sub
    Sub getALSdataFromWH(ByVal cif As String)

        Dim con As OracleConnection = New OracleConnection(ConfigurationManager.ConnectionStrings("EDW_Connectionstring").ConnectionString)
        '        SELECT  TOP 1 CONVERT(int, CIF) AS CIF, APPNUMBER, APPSTATUSTEXT, DECISION_DATE, PENDING_CODE_1, PENDING_DESC_1, PENDING_CODE_2, 
        '                      PENDING_DESC_2, PENDING_CODE_3, PENDING_DESC_3, PENDING_CODE_4, PENDING_DESC_4, PENDING_CODE_5, PENDING_DESC_5, 
        '                      CANCEL_CODE_1, CANCEL_DESC_1, CANCEL_CODE_2, CANCEL_DESC_2, CANCEL_CODE_3, CANCEL_DESC_3, CANCEL_CODE_4, CANCEL_DESC_4, 
        '                      CANCEL_CODE_5, CANCEL_DESC_5, DECLINE_CODE_1, DECLINE_DESC_1, DECLINE_CODE_2, DECLINE_DESC_2, DECLINE_CODE_3, 
        '                      DECLINE_DESC_3, DECLINE_CODE_4, DECLINE_DESC_4, DECLINE_CODE_5, DECLINE_DESC_5
        'FROM  EDW..DWHADMIN.ALSCOM_APPLICATION AS ALSCOM_APPLICATION_1
        ' code ส่วนบนเป็นการดึงข้อมูลจาก view ที่สร้าง link server ไปยัง edw   
        ' ไม่ใช้เพราะดึงข้อมูลได้ช้ามาก  เฉพาะฟิว cif ดึงฟิวอื่นไม่ช้า
        Dim sqlSTring As String = "SELECT  C.FIRST_NAMe,C.LAST_NAME,C.APPNUMBER, T.APPSTATUSTEXT, T.DECISION_DATE" _
                        & ",T.PENDING_CODE_1,T.PENDING_DESC_1" _
                        & ",T.CANCEL_CODE_1,T.CANCEL_DESC_1" _
                        & ",T.DECLINE_CODE_1,T.DECLINE_DESC_1 " _
                        & " FROM   DWHADMIN.ALSCOM_APPLICATION  T" _
                        & " INNER JOIN  DWHADMIN.ALSCOM_APPLICANTS  C" _
                        & " ON  T.APPNUMBER=C.APPNUMBER " _
                        & " WHERE T.CIF =" & Right("00000000000000" & cif, 14)

        Dim command As OracleCommand = New OracleCommand(sqlSTring)
        command.Connection = con
        con.Open()
        'Dim reader As OracleDataReader = command.ExecuteReader()
        Dim list As New OracleDataAdapter(command)
        Dim ds As New DataSet
        list.Fill(ds)
        con.Close()

        Dim strStatusDesc As String = ""
        Dim strStatusCode As String = ""

        If ds.Tables(0).Rows.Count >= 1 Then
            With ds.Tables(0).Rows(0)
                Dim LabelALSCustomer As Label = tableALSCOM.Rows(0).FindControl("LabelALSCustomer")
                Dim LabelAPPNUMBER As Label = tableALSCOM.Rows(0).FindControl("LabelAPPNUMBER")
                Dim LabelAPPSTATUSTEXT As Label = tableALSCOM.Rows(0).FindControl("LabelAPPSTATUSTEXT")
                Dim LabelDECISION_DATE As Label = tableALSCOM.Rows(0).FindControl("LabelDECISION_DATE")

                LabelALSCustomer.Text = .Item("FIRST_NAMe") & " " & .Item("LAST_NAME")
                LabelAPPNUMBER.Text = .Item("APPNUMBER").ToString
                LabelAPPSTATUSTEXT.Text = .Item("APPSTATUSTEXT").ToString
                LabelDECISION_DATE.Text = .Item("DECISION_DATE").ToString

                If LabelAPPSTATUSTEXT.Text = "Declined" Then
                    If .Item("DECLINE_CODE_1").ToString <> "" Then
                        strStatusCode = .Item("DECLINE_CODE_1").ToString
                    End If
                ElseIf LabelAPPSTATUSTEXT.Text = "Canceled" Then
                    If .Item("CANCEL_CODE_1").ToString <> "" Then
                        strStatusCode = .Item("CANCEL_CODE_1").ToString
                    End If
                Else
                    If .Item("PENDING_CODE_1").ToString <> "" Then
                        'strStatusCode = .Item("PENDING_CODE_1").ToString
                        strStatusCode = "ไม่พบข้อมูล"
                    End If

                End If
                If LabelAPPSTATUSTEXT.Text = "Declined" Then
                    If .Item("DECLINE_DESC_1").ToString <> "" Then
                        strStatusDesc = .Item("DECLINE_DESC_1").ToString
                    End If
                ElseIf LabelAPPSTATUSTEXT.Text = "Canceled" Then
                    If .Item("CANCEL_DESC_1").ToString <> "" Then
                        strStatusDesc = .Item("CANCEL_DESC_1").ToString
                    End If
                Else
                    If .Item("PENDING_DESC_1").ToString <> "" Then
                        'strStatusDesc = .Item("PENDING_DESC_1").ToString
                        strStatusDesc = "ไม่พบข้อมูล"
                    End If
                End If


        Dim LabelStatusCode As Label = tableALSCOM.Rows(0).FindControl("LabelStatusCode")
        Dim LabelStatusDesc As Label = tableALSCOM.Rows(0).FindControl("LabelStatusDesc")
        LabelStatusCode.Text = strStatusCode
        LabelStatusDesc.Text = strStatusDesc
            End With
        End If


        If LabelALSCustomer.Text = "" Then LabelALSCustomer.Text = "ไม่พบข้อมูล"
        If LabelAPPNUMBER.Text = "" Then LabelAPPNUMBER.Text = "ไม่พบข้อมูล"
        If LabelAPPSTATUSTEXT.Text = "" Then LabelAPPSTATUSTEXT.Text = "ไม่พบข้อมูล"
        If LabelDECISION_DATE.Text = "" Then LabelDECISION_DATE.Text = "ไม่พบข้อมูล"
        If LabelStatusCode.Text = "" Then LabelStatusCode.Text = "ไม่พบข้อมูล"
        If LabelStatusDesc.Text = "" Then LabelStatusDesc.Text = "ไม่พบข้อมูล"


    End Sub
End Class
