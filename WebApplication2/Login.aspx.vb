Imports WebApplication2.FuncionesComunes
Public Class Login
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Not IsPostBack Then
            Session("stUser") = Nothing
            alertMensaje.Attributes.Remove("class")
            lblMensaje.Text = ""
            alertMensaje.Visible = False
        End If
    End Sub

    Protected Sub btnEntrar_Click(sender As Object, e As EventArgs)

        If txtNombreUsuario.Text = "" Or txtContra.Text = "" Then
            alertMensaje.Attributes.Remove("class")
            alertMensaje.Attributes.Add("class", "alert alert-warning alert-dismissible fade show")
            lblMensaje.Text = "Complete los campos!"
            alertMensaje.Visible = True
        Else
            If fnLogin(txtNombreUsuario.Text.Trim(), txtContra.Text.Trim()) Then
                Response.Redirect("Home.aspx")
            Else
                alertMensaje.Attributes.Remove("class")
                alertMensaje.Attributes.Add("class", "alert alert-danger alert-dismissible fade show")
                lblMensaje.Text = "Credenciales invalidas!"
                alertMensaje.Visible = True
            End If
        End If

    End Sub

    Function fnLogin(ByVal stUser As String, ByVal stPass As String) As Boolean
        Try
            Dim ds As New DataSet
            Dim stQuery As String
            stQuery = "exec SP_Login_User '" & stUser & "','" & stPass & "'"
            ds = GetSQLDataSet(stQuery)


            If ds.Tables(0).Rows.Count > 0 Then
                Session("stUser") = ds.Tables(0).Rows(0).Item("NombreUsuario")
                Return True
            Else
                Return False
            End If

        Catch ex As Exception

            Return False
        End Try

    End Function

    Protected Sub btnGuardarUsuario_Click(sender As Object, e As EventArgs)
        If IsPostBack Then
            If txtNombreUsuarioNuevo.Text = "" Or txtContraNuevo.Text = "" Then
                alertMensaje.Attributes.Remove("class")
                alertMensaje.Attributes.Add("class", "alert alert-warning alert-dismissible fade show")
                lblMensaje.Text = "Complete los campos!"
                alertMensaje.Visible = True
            Else
                fnCreateUser(txtNombreUsuarioNuevo.Text.Trim(), txtContraNuevo.Text.Trim())
            End If
        End If
    End Sub

    Sub fnCreateUser(ByVal stUser As String, ByVal stPass As String)
        Try
            Dim ds As New DataSet
            Dim stQuery As String
            stQuery = "exec SP_Save_User '" & stUser & "','" & stPass & "'"
            ds = GetSQLDataSet(stQuery)


            If ds.Tables(0).Rows.Count > 0 Then

                Dim var = ds.Tables(0).Rows(0).Item("Msj")

                If var = "OK" Then
                    alertMensaje.Attributes.Remove("class")
                    alertMensaje.Attributes.Add("class", "alert alert-success alert-dismissible fade show")
                    lblMensaje.Text = "Usuario creado con exito!"
                    alertMensaje.Visible = True
                Else
                    alertMensaje.Attributes.Remove("class")
                    alertMensaje.Attributes.Add("class", "alert alert-danger alert-dismissible fade show")
                    lblMensaje.Text = "Usuario ya existente!"
                    alertMensaje.Visible = True
                End If
            Else

            End If

        Catch ex As Exception

        End Try

    End Sub
End Class