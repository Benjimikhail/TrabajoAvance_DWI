/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controlador;

import Dao.Cruds;
import Modelo.Productos;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


public class control extends HttpServlet {

    Cruds obj = new Cruds();
    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        int op = Integer.parseInt(request.getParameter("opc"));
        switch (op) {
            case 1:
                AnadirProducto(request, response);
                break;
            case 2:
                EliminarProducto(request, response);
                break;
            case 3:
                TraerProductoaModificar(request, response);
                break;
            case 4:
                EditarProducto(request, response);
                break;
            case 5:
                TraerProductosxCategoria(request, response);
                break;
            
            
        }
    }
    
    
    //Añadir Productos
    protected void AnadirProducto(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        
        String nombre = request.getParameter("nombre");
        String descripcion = request.getParameter("descripcion");
        double precio = Double.parseDouble(request.getParameter("precio"));
        int categoria = Integer.parseInt(request.getParameter("categoria"));
        int proveedor = Integer.parseInt(request.getParameter("proveedor"));
        String imagen = request.getParameter("imagen");
        
        Productos p = new Productos();
        p.setNombreP(nombre);
        p.setDescripP(descripcion);
        p.setPrecio(precio);
        p.setCateP(categoria);
        p.setProveP(proveedor);
        p.setImagen(imagen);
        
        
        
        obj.AñadirProducto(p);
        
        String pag = "/Categorias.jsp";
        request.getRequestDispatcher(pag).forward(request, response);
    }
    
    
    
    //Eliminar producto
    protected void EliminarProducto(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String id = request.getParameter("id");


        obj.EliminarProducto(id);
        
        String pag = "/ListaModificar.jsp";
        request.getRequestDispatcher(pag).forward(request, response);
    }
    
     protected void TraerProductoaModificar(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        
        int id = Integer.parseInt(request.getParameter("id"));
        
        request.setAttribute("ProductoMOD", obj.BuscarEditarProducto(id));
        
        
        String pag = "pagEditarProducto.jsp";
        request.getRequestDispatcher(pag).forward(request, response);
    }
     
    //Editar Producto
     protected void EditarProducto(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        int id = Integer.parseInt(request.getParameter("id"));
        String nombre = request.getParameter("nombre");
        String descripcion = request.getParameter("descripcion");
        double precio = Double.parseDouble(request.getParameter("precio"));
        int categoria = Integer.parseInt(request.getParameter("categoria"));
        int proveedor = Integer.parseInt(request.getParameter("proveedor"));
        String imagen = request.getParameter("imagen");
        
        Productos p = new Productos();
        p.setProdID(id);
        p.setNombreP(nombre);
        p.setDescripP(descripcion);
        p.setPrecio(precio);
        p.setCateP(categoria);
        p.setProveP(proveedor);
        p.setImagen(imagen);
        
        
        
        obj.EditarProducto(p);
        
        String pag = "ListaModificar.jsp";
        request.getRequestDispatcher(pag).forward(request, response);
    }
    
    //VistaCliente
     protected void TraerProductosxCategoria(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        
        String id = request.getParameter("id");
        
        request.setAttribute("ListProductxCategoria", obj.listProductoxCategoria(id));
        
        
        String pag = "/ListaProductoxCategoria.jsp";
        request.getRequestDispatcher(pag).forward(request, response);
    }
     
    

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
