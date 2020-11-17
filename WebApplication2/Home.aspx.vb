Imports WebApplication2.FuncionesComunes
Public Class Home
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

        If Session("stUser") IsNot Nothing Then
            'lblUsuario.Text = Session("stUser")
            cargarTablaUsuarios()
        Else
            Session("stUser") = Nothing
            Response.Redirect("Login.aspx")
        End If

    End Sub

    Protected Sub cargarTablaUsuarios()
        Try
            Dim ds As New DataSet
            Dim stQuery As String
            stQuery = "SELECT * FROM tblUsuarios"
            ds = GetSQLDataSet(stQuery)

            If ds.Tables(0).Rows.Count > 0 Then
                rpUsuarios.DataSource = ds
                rpUsuarios.DataBind()
            Else

            End If

        Catch ex As Exception

        End Try
    End Sub
End Class