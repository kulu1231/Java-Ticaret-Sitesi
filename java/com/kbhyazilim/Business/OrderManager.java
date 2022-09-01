package com.kbhyazilim.Business;
import com.kbhyazilim.DataAccess.DbHelper;
import com.kbhyazilim.Entities.Order;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;
public class OrderManager extends DbHelper {
    DbHelper dbHelper = new DbHelper();
    Connection connection = dbHelper.baglan();
    
     public boolean add(Order ekle)
      {
          boolean kontrol = false;
          try{
              sql = "insert into siparis(MusteriID,UrunNo,Adet,siparis_durum) values(?,?,?,?)";
              ps=connection.prepareStatement(sql);             
              ps.setInt(1, ekle.getUyeID());
              ps.setInt(2, ekle.getUrunID());
              ps.setInt(3, ekle.getAdet());
              ps.setInt(4, ekle.getDurum());
              int k = ps.executeUpdate();
              if(k>0)
              {
                  kontrol = true;
              }
             
          }catch(SQLException e)
        {
            e.printStackTrace();
        }
          return kontrol;
      }
     
     public void add2(Order ekle)
      {
          
          try{
              sql = "insert into siparis(MusteriID,UrunNo,Adet,siparis_durum) values(?,?,?,?)";
              ps=connection.prepareStatement(sql);             
              ps.setInt(1, ekle.getUyeID());
              ps.setInt(2, ekle.getUrunID());
              ps.setInt(3, ekle.getAdet());
              ps.setInt(4, ekle.getDurum());
              ps.executeUpdate();
             
             
          }catch(SQLException e)
        {
            e.printStackTrace();
        }
         
      }
      public List<Order> select()
    {
        List<Order> liste=new ArrayList();
        try
        {
            sql="select * from siparis";
            ps=connection.prepareStatement(sql);
            rs=ps.executeQuery();
            while(rs.next())
            {
                Order order = new Order(
                        rs.getInt("Siparis_no"),
                        rs.getInt("MusteriID"),
                        rs.getInt("UrunNo"),
                        rs.getInt("Adet"),
                        rs.getInt("siparis_durum")
                       
                );
                liste.add(order);
            }
        }catch(SQLException e)
        {
            e.printStackTrace();
        }
        return liste;
    }
      public List<Order> selectuye(int uyeid)
    {
        List<Order> liste=new ArrayList();
        try
        {
            sql="select * from siparis where MusteriID=?";
            ps=connection.prepareStatement(sql);
            ps.setInt(1, uyeid);
            rs=ps.executeQuery();
            while(rs.next())
            {
                Order order = new Order(
                        rs.getInt("Siparis_no"),
                        rs.getInt("MusteriID"),
                        rs.getInt("UrunNo"),
                        rs.getInt("Adet"),
                        rs.getInt("siparis_durum")
                       
                );
                liste.add(order);
            }
        }catch(SQLException e)
        {
            e.printStackTrace();
        }
        return liste;
    }
       public void delete(Order c)
    {
        try
        {
            sql = "delete from siparis where Siparis_no=?";
            ps=connection.prepareStatement(sql);
            ps.setInt(1, c.getSiparisID());
            ps.executeUpdate();
        }catch(SQLException e){
            e.printStackTrace();
        }
    }
       
       public void arttir(Order c)
    {
        try
        {
            sql = "update siparis set siparis_durum=siparis_durum+1 where Siparis_no=?";
            ps=connection.prepareStatement(sql);
            ps.setInt(1, c.getSiparisID());
            ps.executeUpdate();
        }catch(SQLException e){
            e.printStackTrace();
        }
    }
}
