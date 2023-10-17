<%-- 
    Document   : pagEditarProducto
    Created on : 10 oct. 2023, 09:06:32
    Author     : LAB-USR-AQ265-A0906
--%>

<%@page import="Dao.Cruds"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="Modelo.*, java.util.*" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Editar Producto</title>
    </head>
    <body>
        <%
            Cruds obj = new Cruds();
            Productos p = (Productos)request.getAttribute("ProductoMOD");
        %>
        
        <h1>Editar Producto</h1>
        
        <a href="#" onclick="history.back()">Retroceder</a>
        
        <form action="../control" name="fr">
            <input type="hidden" name="opc" value="4">
            <input type="hidden" name="id" value="<%= p.getProdID() %>">
            
            <table border="1" cellpadding="15" cellspacing="15">
                <tr>
                    <td>Nombre del Producto</td>
                    <td><input type="text" name="nombre" value="<%= p.getNombreP() %>"></td>
                </tr>
                <tr>
                    <td>Descripción</td>
                    <td><textarea name="descripcion"><%= p.getDescripP() %></textarea></td>
                </tr>
                <tr>
                    <td>Precio</td>
                    <td><input type="text" name="precio" value="<%= p.getPrecio() %>"></td>
                </tr>
                <tr>
                    <td>Categoría</td>
                    <td>
                        <select name="categoria">
                            <% for (Categoria x: obj.listCategoria()) { %>
                                <option value="<%= x.getIdCategoria() %>" 
                                    <% if (x.getIdCategoria() == p.getCateP()) { %>
                                        selected
                                    <% } %>
                                ><%= x.getNombre() %></option>
                            <% } %>
                        </select>
                    </td>
                </tr>
                <tr>
                    <td>Proveedor</td>
                    <td>
                        <select name="proveedor">
                            <% for (Proveedor x: obj.listProveedores()) { %>
                                <option value="<%= x.getProveedorID() %>" 
                                    <% if (x.getProveedorID() == p.getProveP()) { %>
                                        selected
                                    <% } %>
                                ><%= x.getNombre() %></option>
                            <% } %>
                        </select>
                    </td>
                </tr>
                <tr>
                    <td>Imagen</td>
                    <td><input type="text" name="imagen" value="<%= p.getImagen() %>"></td>
                </tr>
                <tr>
                    <td>
                        <input type="submit" value="Guardar Cambios">
                    </td>
                </tr>
            </table>
        </form>
    </body>
</html>
