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
            table,th,tr{
                border: 1px solid black;
                border-collapse: separate;
                 border-spacing: 10;
                 border-radius: 15px;
                 
            }
            table{
               border-collapse: separate;
        border-spacing: 10;
        border: 1px solid black;
        border-radius: 15px;
        -moz-border-radius: 20px;
        padding: 2px;
        position: relative;
        top: 15px; left: 220px;
            }
            th,tr{
                padding: 15px;
                border: 0;
            }
        </style>
    </head>
    
    <%
            Cruds obj = new Cruds();
        
        %>
    <body >

        <table class="table-hover">
            <tr>
                <th><i class="fa-solid fa-list" style="color: #ffa53d;"> </i>   Categorias</th>
            </tr><!-- comment -->
            
            <%
                for (Categoria x: obj.listCategoria()){
            %>
            <tr>
                <td><a href="control?opc=5&id=<%=x.getIdCategoria()%>" target="contenido"> <%=x.getNombre()%></a></td>
            </tr>
            <%
                }
            %>
            
          
            
            
        </table>
        <!--    
        <table class="table-hover">

            <tr>
                <th><a href="pagAgregarProducto.jsp" > Añadir Productos </a>   </th>
            </tr><!-- comment 


        </table>
        -->    
        
    </body>
</html>
