package Modelo;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import util.MySQLConexion;

public class Carrito {
    public static void agregarProductoAlCarrito(String nombre, String descripcion, double precio, int categoria, int proveedor, String imagen) {
        Connection cn = null;
        try {
            cn = MySQLConexion.getConexion();
            String sql = "INSERT INTO productos(Nombre, Descripcion, Precio, CategoriaID, ProveedorID, imagen) VALUES (?, ?, ?, ?, ?, ?)";
            PreparedStatement st = cn.prepareStatement(sql);
            st.setString(1, nombre);
            st.setString(2, descripcion);
            st.setDouble(3, precio);
            st.setInt(4, categoria);
            st.setInt(5, proveedor);
            st.setString(6, imagen);
            st.executeUpdate();
        } catch (SQLException ex) {
            ex.printStackTrace();
            // Aquí debes manejar la excepción de manera adecuada, por ejemplo, mostrando un mensaje de error.
        } finally {
            if (cn != null) {
                try {
                    cn.close();
                } catch (SQLException e) {
                    e.printStackTrace();
                }
            }
        }
    }
}
