package com.kbhyazilim.Business;
import com.kbhyazilim.DataAccess.DbHelper;
import com.kbhyazilim.Entities.ShoppingCart;

import java.sql.*;
import java.util.*;
public class ShoppingCartManager extends DbHelper {
    DbHelper dbHelper = new DbHelper();
    Connection connection = dbHelper.baglan();
     public void add(ShoppingCart b) throws SQLException
    {
    try
    
    {
    sql="insert into sepet(UrunID,UyeID,Adet) values(?,?,?)";
    ps=connection.prepareStatement(sql);
    ps.setInt(1, b.getUrunID());
    ps.setInt(2, b.getUyeID());
    ps.setInt(3, b.getAdet());
    ps.executeUpdate();
    }catch(Exception e)
    {
        e.printStackTrace();
       
    }
   finally{
        if(connection!=null)
            connection.close();
        if(ps!=null)
            ps.close();
        
    }
    }
     public void arttir(ShoppingCart c) throws SQLException
     {
         try{
             sql = "update sepet set adet=? where UrunID=? and UyeID=?";
             ps=connection.prepareStatement(sql);
             ps.setInt(1, c.getAdet());
             ps.setInt(2, c.getUrunID());
             ps.setInt(3, c.getUyeID());
             ps.executeUpdate();
         }catch(Exception e)
         {
             e.printStackTrace();
         }
         finally{
        if(connection!=null)
            connection.close();
        if(ps!=null)
            ps.close();
        
    }
     }
     
      public List<ShoppingCart> select(int uye) throws SQLException
    {
        List<ShoppingCart> liste=new ArrayList();
        try
        {
            sql="select * from sepet where UyeID=?";
            ps=connection.prepareStatement(sql);
            ps.setInt(1, uye);
            rs=ps.executeQuery();
            if(rs!=null)
            {
            while(rs.next())
            {
                ShoppingCart slider = new ShoppingCart(
                        rs.getInt("sepetID"),
                        rs.getInt("UrunID"),
                        rs.getInt("UyeID"),
                        rs.getInt("Adet")
                        
                        
                );
                liste.add(slider);
            }
            }
        }catch(SQLException e)
        {
            e.printStackTrace();
        }
         finally{
        if(connection!=null)
            connection.close();
        if(ps!=null)
            ps.close();
        if(rs!=null)
            rs.close();
    }
        return liste;
    }
      
       public List<ShoppingCart> selectuye(int urunid,int uyeid) throws SQLException
    {
        List<ShoppingCart> liste=new ArrayList();
        try
        {
            sql="select * from sepet where UrunID=? and UyeID=?";
            ps=connection.prepareStatement(sql);
            ps.setInt(1, urunid);
            ps.setInt(2, uyeid);
            rs=ps.executeQuery();
            if(rs.next())
            {
            
                ShoppingCart sepet = new ShoppingCart(
                        rs.getInt("sepetID"),
                        rs.getInt("UrunID"),
                        rs.getInt("UyeID"),
                        rs.getInt("Adet")
                        
                        
                );
                liste.add(sepet);
            }
            
        }catch(Exception e)
        {
            e.printStackTrace();
        }
        finally{
        if(connection!=null)
            connection.close();
        if(ps!=null)
            ps.close();
        if(rs!=null)
            rs.close();
    }
        return liste;
    }
       public void update(ShoppingCart c) throws SQLException
     {
         try{
             sql = "update sepet set adet=adet + ? where UrunID=? and UyeID=?";
             ps=connection.prepareStatement(sql);  
             ps.setInt(1, c.getAdet());
             ps.setInt(2, c.getUrunID());
             ps.setInt(3, c.getUyeID());
             ps.executeUpdate();
         }catch(Exception e)
         {
             e.printStackTrace();
         }
         finally{
        if(connection!=null)
            connection.close();
        if(ps!=null)
            ps.close();
        
    }
     }
       
       
       public void delete(ShoppingCart c) throws SQLException
    {
         try{
             sql = "delete from sepet where UrunID=? and UyeID=?";
             ps=connection.prepareStatement(sql);   
             ps.setInt(1, c.getUrunID());
             ps.setInt(2, c.getUyeID());
             ps.executeUpdate();
         }catch(Exception e)
         {
             e.printStackTrace();
         }
         finally{
        if(connection!=null)
            connection.close();
        if(ps!=null)
            ps.close();
       
    }
     }
       public void delete2(int uye) throws SQLException
    {
         try{
             sql = "delete from sepet where UyeID=?";
             ps=connection.prepareStatement(sql);   
             ps.setInt(1, uye);
             ps.executeUpdate();
         }catch(Exception e)
         {
             e.printStackTrace();
         }
         finally{
        if(connection!=null)
            connection.close();
        if(ps!=null)
            ps.close();
       
    }
     }
       public List<ShoppingCart> sepetsay(int uyeid) throws SQLException
    {
        List<ShoppingCart> liste=new ArrayList();
        try
        {
            sql="select count(UyeID) as toplam from sepet where UyeID=?";
            ps=connection.prepareStatement(sql);
         
            ps.setInt(1, uyeid);
            rs=ps.executeQuery();
            rs.next();
            
                ShoppingCart slider = new ShoppingCart(
                        rs.getInt("toplam")
                        
                        
                        
                );
                liste.add(slider);
            
        }catch(SQLException e)
        {
            e.printStackTrace();
        }
        finally{
        if(connection!=null)
            connection.close();
        if(ps!=null)
            ps.close();
        if(rs!=null)
            rs.close();
    }
        return liste;
    }
     
}
