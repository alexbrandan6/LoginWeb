<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="Home.aspx.vb" Inherits="WebApplication2.Home" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>Home</title>

    <!-- Required meta tags -->
    <meta charset="utf-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no"/>

    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/css/bootstrap.min.css"/>
    <!-- Imports css login -->
    <link rel="stylesheet" href="css/header.css"/>
    <!-- Imports Dialog alert -->
    <link rel="stylesheet" href="css/really-simple-jquery-dialog.css"/>
    
</head>
<body>
    <form id="form1" runat="server">

        <div class="header">
            <a href="Home.aspx" class="logo">Login S.A</a>
            <div class="header-right">
                <a class="active" href="Home.aspx">Home</a>
                <a href="#" id="showConfirm">Salir</a>
            </div>
        </div>

        <div class="container">
            <div class="row justify-content-center">
                <div class="col-6 p-1">
                    <input id="filter" type="text" class="form-control" placeholder="Buscar..."/>
                </div>
            </div>
            <div class="row">
                <div class="col-12 p-1">
                    <table id="tblUsuarios" class="table table-hover" style="background-color: aliceblue;">
                        <thead>
                            <tr>
                                <th scope="col">Id</th>
                                <th scope="col">Nombre de Usuario</th>
                                <th scope="col">Contraseña</th>
                            </tr>
                        </thead>
                        <tbody class="searchable">
                            <asp:Repeater ID="rpUsuarios" runat="server">
                                <ItemTemplate>
                                    <tr>
                                        <td class="id">
                                            <asp:Label runat="server" Text='<%#Eval("Id")%>'></asp:Label>
                                        </td>
                                        <td class="usr">
                                            <asp:Label runat="server" Text='<%#Eval("NombreUsuario")%>'></asp:Label>
                                        </td>
                                        <td class="pass">
                                            <asp:Label runat="server" Text='<%#Eval("Pass")%>'></asp:Label>
                                        </td>
                                    </tr>
                                </ItemTemplate>
                            </asp:Repeater>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>

        <div class="modal fade" id="modalUsuario" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
            <div class="modal-dialog modal-dialog-centered modal-lg">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="exampleModalLabel">Usuario <asp:Label ID="lblIdUsuario" runat="server"></asp:Label></h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body">
                        <div class="container">
                            <div class="row">
                                <div class="col-lg-6 p-2">
                                    <asp:TextBox ID="txtNombreUsuario" runat="server" CssClass="form-control" ReadOnly="true"></asp:TextBox>
                                </div>
                                <div class="col-lg-6 p-2">
                                    <asp:TextBox ID="txtContra" runat="server" CssClass="form-control" ReadOnly="true"></asp:TextBox>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-dismiss="modal">Cerrar</button>
                    </div>
                </div>
            </div>
        </div>

        <button hidden="hidden" id="btnModal" type="button" data-toggle="modal" data-target="#modalUsuario">Launch modal</button>

        <div id="myConfirm"></div>
    </form>

    <!-- jQuery and Bootstrap Bundle (includes Popper) -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/js/bootstrap.bundle.min.js"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.10.1/jquery.min.js"></script>
    <script src="js/really-simple-jquery-dialog.js"></script>


</body>
</html>

<script>

    $(document).ready(function () {
        (function ($) {
            $('#filter').keyup(function () {
                var rex = new RegExp($(this).val(), 'i');
                $('.searchable tr').hide();
                $('.searchable tr').filter(function () {
                    return rex.test($(this).text());
                }).show();
            })
        }(jQuery));
    });

    $("#tblUsuarios tbody tr").click(function () {

        $(this).addClass('selected').siblings().removeClass('selected');

        var id = $('.id', this).html().trim();
        var usr = $('.usr', this).html().trim();
        var pass = $('.pass', this).html().trim();

        id = removeLabel(id, '<span>', '</span>', '');
        usr = removeLabel(usr, '<span>', '</span>', '');
        pass = removeLabel(pass, '<span>', '</span>', '');

        $('#lblIdUsuario').text(id);
        $('#txtNombreUsuario').val(usr);
        $('#txtContra').val(pass);

        $('#btnModal').click();
    });

    function removeLabel(control, label1, label2, replace) {
        control = control.replace(label1, replace);
        control = control.replace(label2, replace);
        return control;
    }

    $('#showConfirm').click(function (){
        $('#myConfirm').simpleConfirm({
            message: '¿Esta seguro de querer salir?',
            success: function () {
                window.location = 'Login.aspx';
            },
            cancel: function(){

            }
        })
    })

</script>
