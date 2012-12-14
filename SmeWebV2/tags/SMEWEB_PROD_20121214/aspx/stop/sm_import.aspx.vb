Option Explicit On
Option Strict On

Imports System.Data.OleDb
Imports System.Data
Imports System.Data.SqlClient
Imports System.Diagnostics
Imports System.Collections.Generic
Imports System.Globalization

Partial Class aspx_stop_sm_import
    Inherits System.Web.UI.Page


    Protected Sub ImportBtn_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles ImportBtn.Click
        'declare connection
        StatusLabel.Text = ""
        Dim conn As SqlConnection = Nothing
        Dim sqlCmd As New SqlCommand()
        Dim sql As String = Nothing

        conn = ConnectionUtil.getSqlConnectionFromWebConfig()
        sqlCmd.Connection = conn
        sqlCmd.Transaction = sqlCmd.Connection.BeginTransaction()

        Try


            For i = 0 To GridView1.Rows.Count - 1

                Dim chkBox As CheckBox = CType(GridView1.Rows(i).FindControl("RowCheckBox"), CheckBox)
                If chkBox.Checked = True Then  ' มีการเลือก checkbox 

                    With GridView1.Rows(i)
                        Dim cif As Integer
                        Dim cusSize As String
                        Dim dpd As Double
                        Dim prin As Double
                        Dim moveFrom As String

                        'Response.Write("totalcell=" & .Cells.Count)

                        If .Cells(1).Text <> "" Then
                            cif = CInt(.Cells(1).Text)
                        End If
                        If .Cells(2).Text <> "" Then
                            cusSize = .Cells(2).Text
                        End If
                        If .Cells(3).Text <> "" Then
                            If IsNumeric(.Cells(3).Text) = True Then
                                dpd = CDbl(.Cells(3).Text)
                            End If
                        End If
                        If .Cells(4).Text <> "" Then
                            If IsNumeric(.Cells(4).Text) = True Then
                                prin = CDbl(.Cells(4).Text)
                            End If
                        End If
                        If .Cells(5).Text <> "" Then
                            moveFrom = .Cells(5).Text
                        End If

                        'Response.Write(cif)
                        'Response.Write(cusSize)
                        'Response.Write(dpd)
                        'Response.Write(prin)
                        'Response.Write(moveFrom)

                        'Exit Sub

                        sqlCmd.Parameters.Clear()
                        sqlCmd.CommandText = "SM.P_SM_HISTORY_INSERT"
                        sqlCmd.CommandType = CommandType.StoredProcedure
                        sqlCmd.Parameters.AddWithValue("@CIF", cif)
                        sqlCmd.Parameters.AddWithValue("@CustomerSize", cusSize)
                        sqlCmd.Parameters.AddWithValue("@DPD", dpd)
                        sqlCmd.Parameters.AddWithValue("@Prin", prin)
                        sqlCmd.Parameters.AddWithValue("@MoveForm", moveFrom)
                        sqlCmd.ExecuteNonQuery()


                    End With
                End If
            Next
            sqlCmd.Transaction.Commit()
            StatusLabel.Text = "Insert data complete."
        Catch ex As Exception
            sqlCmd.Transaction.Rollback()
            StatusLabel.Text = "Error : Can not insert  data." & "<br>" & ex.Message

        Finally
            If (conn.State = ConnectionState.Open) Then
                conn.Close()
            End If
            conn = Nothing
        End Try





    End Sub
    Protected Sub UploadBtn_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles UploadBtn.Click


        Dim savePath As String = Server.MapPath("file/") & UpFile1.FileName
        'MsgBox(savePath)
        UpFile1.SaveAs(savePath)

        Dim DBConnection = New OleDbConnection( _
              "Provider=Microsoft.ACE.OLEDB.12.0;" & _
              "Data Source=" & savePath & ";" & _
              "Extended Properties=""Excel 8.0;HDR=Yes""")

        DBConnection.Open()
        Dim SQLString As String = "SELECT * FROM [Sheet1$]"
        Dim DBCommand = New OleDbCommand(SQLString, DBConnection)
        Dim DBReader As IDataReader = DBCommand.ExecuteReader()
        Dim table As New DataTable

        table.Load(DBReader)

        'Response.Write(table.Rows.Count)
        'For i = 0 To table.Rows.Count - 1

        '    Response.Write(table.Rows(i).Item(3).ToString & "<br>")
        'Next

        GridView1.DataSource = table
        GridView1.DataBind()

    End Sub
    Protected Sub GridView1_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles GridView1.SelectedIndexChanged

      
    End Sub

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

    End Sub
End Class
