<%--
    Document: pagAñadirProducto
    Created on: 10 oct. 2023, 09:06:32
    Author: LAB-USR-AQ265-A0906
--%>

<%@page import="Dao.Cruds"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="Modelo.*, java.util.*" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Añadir Producto</title>
    </head>
    
    <%
            Cruds obj = new Cruds();
        
        %>
    <body>
        <h1>Añadir Producto</h1>
        
        <a href="#" onclick="history.back()">Retroceder</a>
        
        <form action="control" name="fr">
            <input type="hidden" name="opc" value="1">
            
            <table border="1" cellpadding="15" cellspacing="15" >
                <tr>
                    <td>Nombre del Producto</td>
                    <td><input type="text" name="nombre"></td>
                </tr>
                <tr>
                    <td>Descripción</td>
                    <td><textarea name="descripcion"></textarea></td>
                </tr>
                <tr>
                    <td>Precio</td>
                    <td><input type="text" name="precio"></td>
                </tr>
                <tr>
                    <td>Categoría</td>
                    <td>
                        <select name="categoria">
                            <% for (Categoria x: obj.listCategoria()) { %>
                                <option value="<%= x.getIdCategoria() %>"><%= x.getNombre() %></option>
                            <% } %>
                        </select>
                    </td>
                </tr>
                <tr>
                    <td>Proveedor</td>
                    <td>
                        <select name="proveedor">
                            <% for (Proveedor p: obj.listProveedores()) { %>
                                <option value="<%= p.getProveedorID() %>"><%= p.getNombre() %></option>
                            <% } %>
                        </select>
                    </td>
                </tr>
                <tr>
                    <td>Imagen</td>
                    <td><input type="file" name="imagen"></td>
                </tr>
                <tr>
                    <td>
                        <input type="submit">
                    </td>
                </tr>
            </table>
        </form>
    </body>
</html>
