Imports System.Data
Imports System.Data.SqlClient
Imports System.Globalization
Partial Class smes_financial_menu
    Inherits System.Web.UI.Page
    Function findStatus(ByVal SMES_ID As Integer) As Integer
        Dim status As Integer
        Dim conn As SqlConnection = Nothing
        'Try
        conn = ConnectionUtil.getSqlConnectionFromWebConfig()
        Dim Sql As String = "SME_S.P_SS_FINANCIAL_MAIN_SELECT_STATUS"
        Dim sqlCmd As New SqlCommand(Sql, conn)
        sqlCmd.CommandType = CommandType.StoredProcedure
        sqlCmd.Prepare()
        sqlCmd.Parameters.AddWithValue("@SMES_ID", SMES_ID)

        Dim reader As SqlDataReader = sqlCmd.ExecuteReader()

        ' ดูรายละเอียด status ใน ตาราง FINANCIAL_STATUS
        If reader.HasRows Then   ' ถ้ามี row แสดงว่ามีการเพิ่มแล้ว
            While reader.Read
                status = reader("SMES_STATUS")
            End While
        End If
        reader.Close()
        conn.Close()
        Return status
    End Function
    Function findTemplate(ByVal SMES_ID As Integer) As Integer
        Dim template As Integer
        Dim conn As SqlConnection = Nothing
        'Try
        conn = ConnectionUtil.getSqlConnectionFromWebConfig()
        Dim Sql As String = "SME_S.P_SS_FINANCIAL_MAIN_SELECT_TEMPLATE"
        Dim sqlCmd As New SqlCommand(Sql, conn)
        sqlCmd.CommandType = CommandType.StoredProcedure
        sqlCmd.Prepare()
        sqlCmd.Parameters.AddWithValue("@SMES_ID", SMES_ID)

        Dim reader As SqlDataReader = sqlCmd.ExecuteReader()

        ' ดูรายละเอียด status ใน ตาราง FINANCIAL_STATUS
        If reader.HasRows Then   ' ถ้ามี row แสดงว่ามีการเพิ่มแล้ว
            While reader.Read
                If IsDBNull(reader("TEMPLATE_ID")) = False Then
                    template = reader("TEMPLATE_ID")
                Else
                    template = 0
                End If

            End While

        End If

        reader.Close()
        conn.Close()
        Return template
    End Function

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load


        Dim SMES_ID = Request.QueryString("SMES_ID")
        Dim TEMPLATE_ID = findTemplate(SMES_ID)
        ' MsgBox("template_id=" & TEMPLATE_ID)
        ' MsgBox("smes_id=" & SMES_ID)

        If SMES_ID = "" Then  ' ถ้ายังไม่มีเลขให้ออกเลขก่อนที่ หน้า information
            aMain.Attributes.Add("onclick", "changeFrame('MAIN'," & TEMPLATE_ID & ",'');")
            aCKL.Visible = False
            aCKLCM.Visible = False
            aCIF.Visible = False
            aCK.Visible = False
            aRM.Visible = False
            aCM.Visible = False
            aCP.Visible = False
        Else
            ' ถ้ามีเลข smes_id

            Dim st = findStatus(SMES_ID)

            'MsgBox(TEMPLATE_ID)
            ' If TEMPLATE_ID = "" Then TEMPLATE_ID = findTemplate(SMES_ID)
        aCIF.Visible = False
        aCK.Visible = False
        aRM.Visible = False
        aCM.Visible = False
        aCP.Visible = False

            'MsgBox(st)

          
            Select Case st
                Case 1
                    aMain.Attributes.Add("onclick", "changeFrame('MAIN'," & TEMPLATE_ID & "," & SMES_ID & ");")
                    aCKL.Attributes.Add("onclick", "changeFrame('CKL'," & TEMPLATE_ID & "," & SMES_ID & ");")
                    aCKLCM.Attributes.Add("onclick", "changeFrame('CKLCM'," & TEMPLATE_ID & "," & SMES_ID & ");")
                    aCIF.Attributes.Add("onclick", "changeFrame('CIF'," & TEMPLATE_ID & "," & SMES_ID & ");")
                    aCIF.Visible = True


                Case 2

                    aMain.Attributes.Add("onclick", "changeFrame('MAIN'," & TEMPLATE_ID & "," & SMES_ID & ");")
                    aCKL.Attributes.Add("onclick", "changeFrame('CKL'," & TEMPLATE_ID & "," & SMES_ID & ");")
                    aCKLCM.Attributes.Add("onclick", "changeFrame('CKLCM'," & TEMPLATE_ID & "," & SMES_ID & ");")
                    aCIF.Attributes.Add("onclick", "changeFrame('CIF'," & TEMPLATE_ID & "," & SMES_ID & ");")
                    aCK.Attributes.Add("onclick", "changeFrame('CK'," & TEMPLATE_ID & "," & SMES_ID & ");")
                    aRM.Attributes.Add("onclick", "changeFrame('RM'," & TEMPLATE_ID & "," & SMES_ID & ");")
                    aCIF.Visible = True
                    aCK.Visible = True


                Case 3
                    aMain.Attributes.Add("onclick", "changeFrame('MAIN'," & TEMPLATE_ID & "," & SMES_ID & ");")
                    aCKL.Attributes.Add("onclick", "changeFrame('CKL'," & TEMPLATE_ID & "," & SMES_ID & ");")
                    aCKLCM.Attributes.Add("onclick", "changeFrame('CKLCM'," & TEMPLATE_ID & "," & SMES_ID & ");")
                    aCIF.Attributes.Add("onclick", "changeFrame('CIF'," & TEMPLATE_ID & "," & SMES_ID & ");")
                    aCK.Attributes.Add("onclick", "changeFrame('CK'," & TEMPLATE_ID & "," & SMES_ID & ");")

                    aCIF.Visible = True
                    aCK.Visible = True

                Case 4
                    aMain.Attributes.Add("onclick", "changeFrame('MAIN'," & TEMPLATE_ID & "," & SMES_ID & ");")
                    aCKL.Attributes.Add("onclick", "changeFrame('CKL'," & TEMPLATE_ID & "," & SMES_ID & ");")
                    aCKLCM.Attributes.Add("onclick", "changeFrame('CKLCM'," & TEMPLATE_ID & "," & SMES_ID & ");")
                    aCIF.Attributes.Add("onclick", "changeFrame('CIF'," & TEMPLATE_ID & "," & SMES_ID & ");")
                    aCK.Attributes.Add("onclick", "changeFrame('CK'," & TEMPLATE_ID & "," & SMES_ID & ");")
                    aRM.Attributes.Add("onclick", "changeFrame('RM'," & TEMPLATE_ID & "," & SMES_ID & ");")
                    aCIF.Visible = True
                    aCK.Visible = True
                    aRM.Visible = True
                Case 5

                    aMain.Attributes.Add("onclick", "changeFrame('MAIN'," & TEMPLATE_ID & "," & SMES_ID & ");")
                    aCKL.Attributes.Add("onclick", "changeFrame('CKL'," & TEMPLATE_ID & "," & SMES_ID & ");")
                    aCKLCM.Attributes.Add("onclick", "changeFrame('CKLCM'," & TEMPLATE_ID & "," & SMES_ID & ");")
                    aCIF.Attributes.Add("onclick", "changeFrame('CIF'," & TEMPLATE_ID & "," & SMES_ID & ");")
                    aCK.Attributes.Add("onclick", "changeFrame('CK'," & TEMPLATE_ID & "," & SMES_ID & ");")
                    aRM.Attributes.Add("onclick", "changeFrame('RM'," & TEMPLATE_ID & "," & SMES_ID & ");")
                    aCM.Attributes.Add("onclick", "changeFrame('CM'," & TEMPLATE_ID & "," & SMES_ID & ");")
                    aCIF.Visible = True
                    aCK.Visible = True
                    aRM.Visible = True
                    aCM.Visible = True

                Case 6, 7, 8

                    aMain.Attributes.Add("onclick", "changeFrame('MAIN'," & TEMPLATE_ID & "," & SMES_ID & ");")
                    aCKL.Attributes.Add("onclick", "changeFrame('CKL'," & TEMPLATE_ID & "," & SMES_ID & ");")
                    aCKLCM.Attributes.Add("onclick", "changeFrame('CKLCM'," & TEMPLATE_ID & "," & SMES_ID & ");")
                    aCIF.Attributes.Add("onclick", "changeFrame('CIF'," & TEMPLATE_ID & "," & SMES_ID & ");")
                    aCK.Attributes.Add("onclick", "changeFrame('CK'," & TEMPLATE_ID & "," & SMES_ID & ");")
                    aRM.Attributes.Add("onclick", "changeFrame('RM'," & TEMPLATE_ID & "," & SMES_ID & ");")
                    aCM.Attributes.Add("onclick", "changeFrame('CM'," & TEMPLATE_ID & "," & SMES_ID & ");")
                    aCP.Attributes.Add("onclick", "changeFrame('CP'," & TEMPLATE_ID & "," & SMES_ID & ");")
                    aCIF.Visible = True
                    aCK.Visible = True
                    aRM.Visible = True
                    aCM.Visible = True
                    aCP.Visible = True


            End Select

            If TEMPLATE_ID = 2 Or TEMPLATE_ID = 3 Or TEMPLATE_ID = 4 Then
                ' เป็น template flood ไม่มี checklist และ compare
                aCK.Visible = False
                aCKL.Visible = False
                aCKLCM.Visible = False
                aCP.Visible = False
            End If
            If TEMPLATE_ID = 1 Then
                aCKL.Visible = False
                aCKLCM.Visible = False
            End If

        End If



    End Sub
End Class
