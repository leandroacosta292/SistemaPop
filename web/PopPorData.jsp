<%-- 
    Document   : Home
    Created on : 11/08/2017, 19:41:11
    Author     : Leandro Acosta <leandro.acosta292@hotmail.com>
--%>

<%@page import="Classes.EstatisticaPesquisa"%>
<%@page import="Classes.HomeStatus"%>
<%@page import="DAOs.DAOUsuario"%>
<%@page import="DAOs.DAOPop"%>
<%@page import="Classes.Pop"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
        <link href="bootstrap/css/home.css" rel="stylesheet">
        <title>JSP Page</title>
        <%@include file="Menu.jsp" %>
    </head>
    <body>
        <%            Usuario usuario = (Usuario) request.getAttribute("usuario");
            ArrayList<String> erros = (ArrayList<String>) request.getAttribute("erro");
            ArrayList<Pop> pops = new DAOPop().consultarTodos();

            if (usuario == null) {
                usuario = new Usuario(0, "", "", "", "", false, 1, "U");
            }

        %>

        <div class="container">
            <div class="row">
                <div role="main" class="col-md-9 col-md-push-3">    
                    <h2>Pops Por Data</h2>
                </div>
                <nav class="col-md-3 col-md-pull-9">
                    <h2>Parāmetros</h2>
                    <form action="/SistemaPop/Acao?tipo=relatorio&operacao=PopPorData" method="post" class="form-inline">
                        <label>Data Inicial:</label>
                        <br>
                        <input type="date" name="data1">
                        <br><br>
                        
                        <label>Data Final:</label>
                        <br>
                        <input type="date" name="data2">
                        <br>
                        <br>
                        <button type="submit" class="btn btn-lg">Gerar</button>
                    </form>
                </nav>
            </div>
        </div>
    </body>
</html>
