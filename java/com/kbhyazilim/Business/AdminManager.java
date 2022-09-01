package com.kbhyazilim.Business;
import com.kbhyazilim.DataAccess.DbHelper;
import com.kbhyazilim.Entities.Admin;
import java.sql.*;
import java.util.*;

public class AdminManager extends DbHelper {
    DbHelper dbHelper = new DbHelper();
    Connection connection = dbHelper.baglan();
    
    public boolean giris(Admin admin)
    {
        boolean kontrol = false;
        try{
            sql = "select * from admin where kullaniciadi=? and sifre=?";
            ps=connection.prepareStatement(sql);
            ps.setString(1, admin.getKullaniciadi());
            ps.setString(2,admin.getSifre());
            
            rs=ps.executeQuery();
            while(rs.next())
            {
                kontrol = true;
            }
             return kontrol;
        }catch(SQLException e)
        {
            e.printStackTrace();
            return kontrol;
        }
       
    }
    
    public List<Admin> getById(Admin id)
    {
        List<Admin> liste = new ArrayList();
        try{
            sql = "select * from admin where kullaniciadi = ?";
            ps=connection.prepareStatement(sql);
            ps.setString(1, id.getKullaniciadi());
            rs=ps.executeQuery();
            while(rs.next()){
                Admin admin = new Admin(
                        rs.getInt("no"),
                        rs.getString("ad"),
                        rs.getString("soyad"),
                        rs.getString("kullaniciadi"),
                        rs.getString("sifre"),
                        rs.getString("email")
                );
                liste.add(admin);
            }
        }catch(SQLException e)
        {
            e.printStackTrace();
        }
        return liste;
    }
    
    public void add(Admin a)
    {
     try
    
    {
    sql="insert into admin(ad,soyad,kullaniciadi,sifre,email) values(?,?,?,?,?)";
    ps=connection.prepareStatement(sql);
    ps.setString(1,a.getAd());
    ps.setString(2,a.getSoyad());
    ps.setString(3,a.getKullaniciadi());
    ps.setString(4,a.getSifre());
    ps.setString(5,a.getEmail());
    ps.executeUpdate();
    }catch(SQLException e)
    {
        e.printStackTrace();
    }
    
       
        
    }
       
    public boolean reset(Admin admin)
    {
        boolean kontrol = false;
        try{
            sql = "update admin set sifre=? where kullaniciadi=?";
            ps=connection.prepareStatement(sql);
            ps.setString(1, admin.getSifre());
            ps.setString(2,admin.getKullaniciadi());
            int k = ps.executeUpdate();
            if(k>0)
            {
                 kontrol = true;
            }
           
        }catch(SQLException e)
        {
            e.printStackTrace();
            return kontrol;
        }
       return kontrol;
    }
        
}
