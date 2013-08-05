Imports System.ServiceModel
Imports System.ServiceModel.Activation
Imports System.ServiceModel.Web
Imports System.Data.SqlClient

Namespace webservice.wcf.service

    <ServiceContract(Namespace:="SmeWeb")> _
    <AspNetCompatibilityRequirements(RequirementsMode:=AspNetCompatibilityRequirementsMode.Allowed)> _
    Public Class CAWCFService

        ' Add <WebGet()> attribute to use HTTP GET 
        <OperationContract()> _
        Public Function getInProcessJob(ByVal empId As String) As wcf.result.WCFResutl
            Dim result As wcf.result.WCFResutl = Nothing

            Try
                Using conn As New SqlConnection(ConfigurationManager.ConnectionStrings("BAY01ConnectionString").ConnectionString)
                    Dim cmd As New SqlCommand("CA_REPORT.P_CA_IN_PROCESS_JOB", conn)
                    cmd.CommandType = System.Data.CommandType.StoredProcedure
                    cmd.CommandTimeout = 180
                    cmd.Parameters.AddWithValue("@EMP_ID", empId)

                    conn.Open()

                    Using reader As SqlDataReader = cmd.ExecuteReader()
                        While reader.Read()
                            result = New wcf.result.WCFResutl("success", reader("TotalProcessCA"))
                        End While
                    End Using
                End Using
            Catch ex As Exception
                result = New wcf.result.WCFResutl("failure", ex.Message)
            End Try

            Return result
        End Function

        <OperationContract()> _
        Public Function getInProcessGroup(ByVal empId As String) As wcf.result.WCFResutl
            Dim result As wcf.result.WCFResutl = Nothing

            Try
                Using conn As New SqlConnection(ConfigurationManager.ConnectionStrings("BAY01ConnectionString").ConnectionString)
                    Dim cmd As New SqlCommand("CA_REPORT.P_CA_IN_PROCESS_TOTAL_BY_LEVEL", conn)
                    cmd.CommandType = System.Data.CommandType.StoredProcedure
                    cmd.CommandTimeout = 180
                    cmd.Parameters.AddWithValue("@EMP_ID", empId)

                    conn.Open()

                    Using reader As SqlDataReader = cmd.ExecuteReader()
                        While reader.Read()
                            result = New wcf.result.WCFResutl("success", reader("TotalProcessCA"))
                        End While
                    End Using
                End Using
            Catch ex As Exception
                result = New wcf.result.WCFResutl("failure", ex.Message)
            End Try

            Return result
        End Function

        <OperationContract()> _
        Public Function IsCIFInWatchList(ByVal CAOldID As String) As wcf.result.WCFResutl
            Dim result As wcf.result.WCFResutl = Nothing

            Try
                Using conn As New SqlConnection(ConfigurationManager.ConnectionStrings("BAY01ConnectionString").ConnectionString)
                    Dim cmd As New SqlCommand("P_CHECK_CIF_WATCHLIST_BY_CA", conn)
                    cmd.CommandType = System.Data.CommandType.StoredProcedure
                    cmd.Parameters.AddWithValue("@CA_OLD_ID", CAOldID)

                    conn.Open()

                    Dim cifList As String = String.Empty
                    Dim cifListJson As String = String.Empty
                    Dim cifCount As Integer = 0

                    Using reader As SqlDataReader = cmd.ExecuteReader()
                        While reader.Read()
                            'json
                            cifListJson = cifListJson + ",{cif:" + reader("CIF").ToString() + "}"
                            cifList = cifList + "," + reader("CIF").ToString()
                            cifCount = cifCount + 1
                        End While
                    End Using

                    If cifCount > 0 Then
                        cifListJson = cifListJson.Substring(1)
                        cifList = cifList.Substring(1)
                    End If

                    If cifListJson.Length > 0 Then
                        cifListJson = "[" + cifListJson + "]"
                    Else
                        cifListJson = "null"
                    End If
                    result = New wcf.result.WCFResutl("success", "{count:" + cifCount.ToString() + ",item:" + cifListJson + "}")
                End Using
            Catch ex As Exception
                result = New wcf.result.WCFResutl("failure", ex.Message)
            End Try

            Return result
        End Function

        <OperationContract()> _
        Public Function IsCIFInWatchListByCIF(ByVal cif As Integer) As wcf.result.WCFResutl
            Dim result As wcf.result.WCFResutl = Nothing

            Try
                Using conn As New SqlConnection(ConfigurationManager.ConnectionStrings("BAY01ConnectionString").ConnectionString)
                    Dim cmd As New SqlCommand("P_CHECK_CIF_WATCHLIST_BY_CIF", conn)
                    cmd.CommandType = System.Data.CommandType.StoredProcedure
                    cmd.Parameters.AddWithValue("@CIF", cif)

                    conn.Open()

                    Dim cifOut As String = String.Empty

                    Using reader As SqlDataReader = cmd.ExecuteReader()
                        While reader.Read()
                            cifOut = reader("CIF").ToString()
                        End While
                    End Using

                    Dim check As Boolean = False
                    If cifOut.Length > 0 Then
                        check = True
                    End If

                    result = New wcf.result.WCFResutl("success", check.ToString())
                End Using
            Catch ex As Exception
                result = New wcf.result.WCFResutl("failure", ex.Message)
            End Try

            Return result
        End Function

        <OperationContract()> _
        Public Function CheckRatingUpdateDateOlder(ByVal CAOldID As String) As wcf.result.WCFResutl
            Dim result As wcf.result.WCFResutl = Nothing

            Try
                Using conn As New SqlConnection(ConfigurationManager.ConnectionStrings("BAY01ConnectionString").ConnectionString)
                    Dim cmd As New SqlCommand("P_CHECK_RATING_UPDATE_DATE_OLDER_BY_CA", conn)
                    cmd.CommandType = System.Data.CommandType.StoredProcedure
                    cmd.Parameters.AddWithValue("@CA_OLD_ID", CAOldID)

                    conn.Open()

                    Dim cifList As String = String.Empty
                    Dim cifListJson As String = String.Empty
                    Dim cifCount As Integer = 0

                    Using reader As SqlDataReader = cmd.ExecuteReader()
                        While reader.Read()
                            'json
                            cifListJson = cifListJson + ",{cif:" + reader("CIF").ToString() + "}"
                            cifList = cifList + "," + reader("CIF").ToString()
                            cifCount = cifCount + 1
                        End While
                    End Using

                    If cifCount > 0 Then
                        cifListJson = cifListJson.Substring(1)
                        cifList = cifList.Substring(1)
                    End If

                    If cifListJson.Length > 0 Then
                        cifListJson = "[" + cifListJson + "]"
                    Else
                        cifListJson = "null"
                    End If
                    result = New wcf.result.WCFResutl("success", "{count:" + cifCount.ToString() + ",item:" + cifListJson + "}")
                End Using
            Catch ex As Exception
                result = New wcf.result.WCFResutl("failure", ex.Message)
            End Try

            Return result
        End Function

        <OperationContract()> _
       Public Function CountCovenant(ByVal empId As String, ByVal issingle As String) As wcf.result.WCFResutl
            Dim result As wcf.result.WCFResutl = Nothing

            Try
                result = New wcf.result.WCFResutl("success", ReportDAL.CountCovenantReport(empId, issingle).ToString())
            Catch ex As Exception
                result = New wcf.result.WCFResutl("failure", ex.Message)
            End Try

            Return result
        End Function
    End Class

    
End Namespace
