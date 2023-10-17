
package Dao;
import java.sql.*;
import util.SQLConexion;
import Modelo.*;
import java.util.*;
import util.MySQLConexion;
public class Cruds {
    
    //Listado Vista Cliente
    public List<Productos> listado(){
        List<Productos> lis=new ArrayList();
        Connection cn=MySQLConexion.getConexion();
         String sql="select ProductoID,Nombre,Descripcion ,Precio, CategoriaID, ProveedorID, imagen from productos";
         try{
           PreparedStatement st=cn.prepareStatement(sql);
           ResultSet rs=st.executeQuery();
           while(rs.next()){
               Productos p=new Productos();
               p.setProdID(rs.getInt(1));
               p.setNombreP(rs.getString(2));
               p.setDescripP(rs.getString(3));
               p.setPrecio(rs.getDouble(4));
               p.setCateP(rs.getInt(5));
               p.setProveP(rs.getInt(6));
               p.setImagen(rs.getString(7));
               lis.add(p);
           }
         }catch(Exception ex){
             
         }
         return lis;
    }
    
    //Listado de Productos x Categoria
    public List<Productos> listProductoxCategoria(String categoria) {
    List<Productos> lis = new ArrayList();
    Connection cn = MySQLConexion.getConexion();
    String sql = "SELECT ProductoID, Nombre, Descripcion, Precio, CategoriaID, ProveedorID, imagen FROM productos WHERE CategoriaID = ?";
    

    try {
        PreparedStatement st = cn.prepareStatement(sql);
        st.setString(1, categoria);
        
        ResultSet rs = st.executeQuery();
        while (rs.next()) {
            Productos p = new Productos();
            p.setProdID(rs.getInt(1));
            p.setNombreP(rs.getString(2));
            p.setDescripP(rs.getString(3));
            p.setPrecio(rs.getDouble(4));
            p.setCateP(rs.getInt(5));
            p.setProveP(rs.getInt(6));
            p.setImagen(rs.getString(7));
            lis.add(p);
        }
    } catch (Exception ex) {
        // Manejar la excepción apropiadamente
    }
    return lis;
}

    
    //Listado de Categorias
    public List<Categoria> listCategoria(){
        List<Categoria> lis=new ArrayList();
        Connection cn=MySQLConexion.getConexion();
         String sql="SELECT CategoriaID, Nombre FROM categorias";
         try{
           PreparedStatement st=cn.prepareStatement(sql);
           ResultSet rs=st.executeQuery();
           while(rs.next()){
               Categoria c=new Categoria();
               c.setIdCategoria(rs.getInt(1));
               c.setNombre(rs.getString(2));
               lis.add(c);
           }
         }catch(Exception ex){
             
         }
         return lis;
    }
    
    //Listado de Proveedores
    public List<Proveedor> listProveedores(){
        List<Proveedor> lis=new ArrayList();
        Connection cn=MySQLConexion.getConexion();
         String sql="SELECT ProveedorID,Nombre FROM proveedores";
         try{
           PreparedStatement st=cn.prepareStatement(sql);
           ResultSet rs=st.executeQuery();
           while(rs.next()){
               Proveedor p=new Proveedor();
               p.setProveedorID(rs.getInt(1));
               p.setNombre(rs.getString(2));
               lis.add(p);
           }
         }catch(Exception ex){
             
         }
         return lis;
    }
    
    //Añadir Producto x Categoria
    public void AñadirProducto(Productos p){
      Connection cn=MySQLConexion.getConexion();
      try{
          String sql="insert into productos(Nombre, Descripcion, Precio, CategoriaID, ProveedorID, imagen) values(?,?,?,?,?,?) ";
     PreparedStatement st=cn.prepareStatement(sql);
      
      st.setString(1, p.getNombreP());
      st.setString(2, p.getDescripP());
      st.setDouble(3, p.getPrecio());
      st.setInt(4, p.getCateP());
      st.setInt(5, p.getProveP());
      st.setString(6, p.getImagen());
      
      st.executeUpdate();
      }catch(Exception ex){
          ex.printStackTrace();
      }  
    }
    
    
    //Eliminar Producto x Categoria
    public void EliminarProducto(String cod){
      Connection cn=MySQLConexion.getConexion();
      try{
          String sql="delete from productos  where ProductoID=?";
          System.out.println(sql);
     PreparedStatement st=cn.prepareStatement(sql);
      st.setString(1, cod);
      System.out.println(sql);
      st.executeUpdate();
      }catch(Exception ex){
          ex.printStackTrace();
      }  
    }
    
    //Editar Producto
    public void EditarProducto(Productos p){
      Connection cn=MySQLConexion.getConexion();
      try{
          String sql="update productos set Nombre=?,Descripcion=?, Precio=?, CategoriaID=?, ProveedorID=?, imagen=? "
                  + " where ProductoID=?";
     PreparedStatement st=cn.prepareStatement(sql);
      
      st.setString(1, p.getNombreP());
      st.setString(2, p.getDescripP());
      st.setDouble(3, p.getPrecio());
      st.setInt(4, p.getCateP());
      st.setInt(5, p.getProveP());
      st.setString(6, p.getImagen());
      
      st.setInt(7, p.getProdID());
      
      st.executeUpdate();
      }catch(Exception ex){
          ex.printStackTrace();
      }  
    }
    
    //Traer Producto a Editar
    public Productos BuscarEditarProducto(int cod){
         Productos p=null;
         
         Connection cn=MySQLConexion.getConexion();
         String sql="select ProductoID,Nombre,Descripcion,Precio,CategoriaID,ProveedorID,imagen from productos "
                 + " where ProductoID=?";
         try{
           PreparedStatement st=cn.prepareStatement(sql);
           st.setInt(1, cod);
           ResultSet rs=st.executeQuery();
           if(rs.next()){
               p = new Productos();
               p.setProdID(rs.getInt(1));
               p.setNombreP(rs.getString(2));
               p.setDescripP(rs.getString(3));
               p.setPrecio(rs.getDouble(4));
               p.setCateP(rs.getInt(5));
               p.setProveP(rs.getInt(6));
               p.setImagen(rs.getString(7));
           }
         }catch(Exception ex){
             ex.printStackTrace();
         }
         return p;
     }
    
    
    
}
