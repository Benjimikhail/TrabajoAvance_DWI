<%@page import="Dao.Cruds"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.*"%>
<%@page import="Modelo.Productos"%>
<!DOCTYPE html>
<html>
<head>
    <!-- Resto de tus etiquetas head -->
</head>
<body>
    <table class="table-hover" border="0" align="center" width="100">
        <%
            List<Productos> productos = (List<Productos>) request.getAttribute("ListProductxCategoria");
            if (productos != null) {
                for (Productos p : productos) {
        %>
        <tr>
            <td>
                <img src="img/<%= p.getImagen() %>" width="140" height="140">
            </td>
            <td>
                <%= p.getNombreP() %>
            </td>
            <td>
                S/<%= p.getPrecio() %>
            </td>
            <td>
                <!-- Agrega cualquier otra información que desees mostrar -->
            </td>
        </tr>
        <%
                }
            }
        %>
    </table>
</body>
</html>
