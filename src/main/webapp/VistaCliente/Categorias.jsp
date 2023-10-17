<%--
    Document   : Categorias
    Created on : 25 set. 2023, 21:47:45
    Author     : frank
--%>

<%@page import="Dao.Cruds"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="Modelo.Categoria"%>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>JSP Page</title>

    <link href="css/adminlte.min.css" rel="stylesheet" type="text/css"/>
    <script src="https://kit.fontawesome.com/90d5a69799.js" crossorigin="anonymous"></script>
    <style>
        table, th, tr {
            border: 1px solid black;
            border-spacing: 10px; /* Ajusta el espacio entre las celdas */
        }
        table {
            border-collapse: separate;
            border: none;
            padding: 2px;
            position: relative;
            top: 15px;
            left: 0; /* Cambia el valor de "left" a 0 para pegar la tabla al extremo izquierdo */
            border-radius: 15px; /* Agrega un borde redondeado */
        }
        th, tr {
            padding: 15px;
            border: 0;
        }
    </style>
</head>

<%
    Cruds obj = new Cruds();
%>

<body>
    <table class="table-hover">
        <tr>
            <th><i class="fa-solid fa-list" style="color: #ffa53d;"> </i>   Categorias</th>
        </tr>

        <%
            for (Categoria x: obj.listCategoria()){
        %>
        <tr>
            <td> <a href="control?opc=5&id=<%=x.getIdCategoria()%>" > <%=x.getNombre()%></a></td>
        </tr>
        <%
            }
        %>
    </table>
</body>
</html>
