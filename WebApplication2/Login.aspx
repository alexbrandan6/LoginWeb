<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="Login.aspx.vb" Inherits="WebApplication2.Login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>Login</title>
    
    <meta charset="utf-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no"/>

    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/css/bootstrap.min.css" integrity="sha384-TX8t27EcRE3e/ihU7zmQxVncDAy5uIKz4rEkgIXeMed4M0jlfIDPvg6uqKI2xXr2" crossorigin="anonymous"/>

    <!-- Imports css login -->
    <link rel="stylesheet" href="css/login.css"/>
</head>

<body>
    <form id="form1" runat="server">
        <div class="login-box">
            <div class="container">
                <div class="row">
                    <div class="col-12 d-flex justify-content-center">
                        <img class="usr" src="img/login/loginAvatar.png" alt="" />
                    </div>
                </div>

                <div class="row">
                    <div class="col-6 p-2">
                        <asp:TextBox ID="txtNombreUsuario" runat="server" CssClass="form-control" placeholder="Nombre de Usuario"></asp:TextBox>
                    </div>
                    <div class="col-6 p-2">
                        <asp:TextBox ID="txtContra" runat="server" CssClass="form-control" placeholder="Contraseña" TextMode="Password"></asp:TextBox>
                    </div>
                </div>

                <div class="row">
                    <div class="col-12 p-2  d-flex justify-content-center">
                        <asp:Button ID="btnEntrar" runat="server" CssClass="btn btn-primary" Text="Entrar" OnClick="btnEntrar_Click" />
                    </div>
                </div>

                <div class="row">
                    <div class="col-12 p-2  d-flex justify-content-center">
                        <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#modalUsuario">Crear Usuario</button>
                    </div>
                </div>

                <div class="row">
                    <div class="col-lg-12 p-2">
                        <div id="alertMensaje" role="alert" runat="server">
                            <strong>Atención!</strong> <asp:Label ID="lblMensaje" runat="server"></asp:Label>
                              <button type="button" class="close" data-dismiss="alert" aria-label="Close">
                                  <span aria-hidden="true">&times;</span>
                              </button>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <div class="modal fade" id="modalUsuario" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
            <div class="modal-dialog modal-dialog-centered modal-lg">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="exampleModalLabel">Crear Usuario</h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body">
                        <div class="container">
                            <div class="row">
                                <div class="col-lg-6 p-2">
                                    <asp:TextBox ID="txtNombreUsuarioNuevo" runat="server" CssClass="form-control" placeholder="Nombre de Usuario"></asp:TextBox>
                                </div>
                                <div class="col-lg-6 p-2">
                                    <asp:TextBox ID="txtContraNuevo" runat="server" CssClass="form-control" placeholder="Contraseña" TextMode="Password"></asp:TextBox>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-dismiss="modal">Cerrar</button>
                        <asp:Button ID="btnGuardarUsuario" runat="server" CssClass="btn btn-primary" Text="Guardar" OnClick="btnGuardarUsuario_Click"/>
                    </div>
                </div>
            </div>
        </div>
    </form>

    <!-- jQuery and Bootstrap Bundle (includes Popper) -->
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ho+j7jyWK8fNQe+A12Hb8AhRq26LrZ/JpcUGGOn+Y7RsweNrtN/tE3MoK7ZeZDyx" crossorigin="anonymous"></script>
</body>
</html>
