/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Dao;

import java.sql.*;
import util.SQLConexion;
import Modelo.*;
import java.util.*;
import util.MySQLConexion;
/**
 *
 * @author frank
 */
public class Graf {
    public List<Gprecio> lisGprecio(){
        List<Gprecio> lis=new ArrayList();
        Connection cn=MySQLConexion.getConexion();
         String sql="{call sprod}";
         try{
             CallableStatement st=cn.prepareCall(sql);
           
           ResultSet rs=st.executeQuery();
           while(rs.next()){
               Gprecio p=new Gprecio();
               p.setNom_Prod(rs.getString(1));
               p.setPrecio(rs.getDouble(2));
               lis.add(p);
           }
         }catch(Exception ex){
             
         }
         return lis;
    }
}
