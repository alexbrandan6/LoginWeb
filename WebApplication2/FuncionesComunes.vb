Imports System.Data.SqlClient
Public Class FuncionesComunes
    Public Shared Function GetSQLDataSet(ByVal stQuery1 As String) As Data.DataSet
        Dim ds As New Data.DataSet
        Try
            Using cnn As New SqlConnection(ConfigurationManager.ConnectionStrings("DB_Login").ConnectionString.ToString)
                cnn.Open()
                Dim da As New SqlDataAdapter
                Dim cmd As New SqlCommand(stQuery1, cnn)
                da.SelectCommand = cmd
                da.Fill(ds)
            End Using

            Return ds
        Catch ex As Exception

        End Try
    End Function

End Class
