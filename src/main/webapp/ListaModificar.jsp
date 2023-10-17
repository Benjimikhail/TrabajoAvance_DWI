

<%@page import="Dao.Cruds"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.*"%>
<%@page import="Modelo.Productos"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="../css/EncabezadoCSS.css" rel="stylesheet" type="text/css"/>
        <title></title>
        <style>
            h1{
                font-size: 20px;
                text-align: right;
                position: relative;
                top: 5px;
                
                
            }

            th,tr{
                border-collapse: separate;
                border-spacing: 10;
                border: 1px solid black;
                border-radius: 15px;
                -moz-border-radius: 20px;
                padding: 30px;
                text-align: left;
                font-weight: 100;


            }
            table {

                border-collapse: separate;
                border-spacing: 100px 40px;

            }
        </style>   
    </head>
    <body>
        <table class="table-hover" border="0" align="center" width="100" >
            <%
                Cruds obj= new Cruds();
                int salto=0;
                for(Productos p:obj.listado()){
                   %>
                   
                   <th><img src="img/<%=p.getImagen()%>" width="140" height="140"><p>
                       <hr>
                       
                       <%=p.getNombreP()%>
                       
                       <h1> S/<%=p.getPrecio()%></h1>
                     
                       
                       <a href="control?opc=3&id=<%=p.getProdID()%>" >Modificar</a>
                       &nbsp;
                       <a href="control?opc=2&id=<%=p.getProdID()%>" >Eliminar</a>
                       
                   </th>
                   <%
                       salto++;
                       if(salto==5){
                       %>
                       <tr>
                           <%
                               salto=0;
                       }
                }


                %>
        </table>
    </body>
</html>
