<%@page import="DAOs.DAOUsuario"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%@include file="Menu.jsp" %>
        <div class="container">
            <h1>Usu�rios</h1>

            <%                String notificacao = (String) request.getAttribute("notificacao");
                ArrayList<Usuario> logins = (ArrayList<Usuario>) request.getAttribute("consulta");

                Usuario usuarioLogado = (Usuario) session.getAttribute("usuarioLogado");

                if (logins == null) {
                    logins = new DAOUsuario().consultarTodos();
                }
                if (notificacao != null) {
            %>
            <div class="alert alert-success" role="alert"><a><%=notificacao%></a></div>
                    <%
                        }
                    %>

            <br>
            <%
                if (usuarioLogado.getPermissao().equalsIgnoreCase("A")) {
            %>

            <div class="table-responsive">
                <table class="table table-bordered table-condensed">
                    <tr>
                        <td>ID</td>
                        <td>Nome</td>
                        <td>Login</td>
                        <td>E-mail</td>
                        <td>Permiss�o</td>
                        <td>Alterar Permiss�o</td>
                        <td>Estado</td>
                    </tr>
                    <%
                        for (int i = 0; i < logins.size(); i++) {
                            Usuario usuario = (Usuario) logins.get(i);


                    %>

                    <tr>
                        <td><%= usuario.getIdUsuario()%> </td>
                        <td><%= usuario.getNome()%> </td>
                        <td><%= usuario.getLogin()%> </td>
                        <td><%= usuario.getEmail()%> </td>
                        <% if (usuario.getPermissao().equals("U")) {%>
                        <td><%= "Usu�rio"%> </td>  
                        <% } else if (usuario.getPermissao().equals("R")) {%>
                        <td><%= "Revisor"%> </td>   
                        <% } else {%>
                        <td><%= "Administrador"%> </td>        
                        <%}%>
                        <% if (usuario.getPermissao().equals("A")) {%>
                        <td><a OnClick="return confirm('Promover para Revisor?')" href="/SistemaPop/Acao?tipo=usuario&operacao=tRevisor&idusuario=<%= usuario.getIdUsuario()%>">Tornar Revisor</a> </td>
                        <% } else if (usuario.getPermissao().equals("R")) {%>
                        <td><a OnClick="return confirm('Promover para Administrador')" href="/SistemaPop/Acao?tipo=usuario&operacao=tAdm&idusuario=<%= usuario.getIdUsuario()%>">Tornar Administrador</a> </td>
                        <% } else {%>
                        <td><a OnClick="return confirm('Rebaixar para Usu�rio?')" href="/SistemaPop/Acao?tipo=usuario&operacao=tUser&idusuario=<%= usuario.getIdUsuario()%>">Tornar Usu�rio</a> </td>
                        <%}%>
                        <% if (usuario.isAtivo()) {%>
                        <td><a OnClick="return confirm('Deseja desativar?')" href="/SistemaPop/Acao?tipo=usuario&operacao=desativar&idusuario=<%= usuario.getIdUsuario()%>">Desativar</a> </td>
                        <% } else {%>
                        <td><a OnClick="return confirm('Deseja ativar?')" href="/SistemaPop/Acao?tipo=usuario&operacao=ativar&idusuario=<%= usuario.getIdUsuario()%>">Ativar</a> </td>
                        <% }%>
                        <%  }                        %>
                    </tr>
                </table>
                <%
                } else {
                %>
                <div>
                    <h2>Somente diposn�vel para administradores!</h2>
                </div>
                <%
                    }

                %>


                <a class="btn btn-default" href="Home.jsp">Voltar ao in�cio</a>
            </div>
        </div>
    </body>
</html>
