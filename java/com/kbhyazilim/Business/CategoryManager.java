package com.kbhyazilim.Business;
import com.kbhyazilim.DataAccess.DbHelper;
import com.kbhyazilim.Entities.Category;
import java.sql.*;
import java.util.*;

public class CategoryManager extends DbHelper {
    DbHelper dbHelper = new DbHelper();
    Connection connection = dbHelper.baglan();
   
    public List<Category> select()
    {
        List<Category> liste=new ArrayList();
        try
        {
            sql="select * from kategoriler";
            ps=connection.prepareStatement(sql);
            rs=ps.executeQuery();
            while(rs.next())
            {
                Category category = new Category(rs.getInt("katID"),rs.getString("katAdi"));
                liste.add(category);
            }
        }catch(SQLException e)
        {
            e.printStackTrace();
        }
        return liste;
    }
    public void delete(Category c)
    {
        try
        {
            sql = "delete from kategoriler where katID=?";
            ps=connection.prepareStatement(sql);
            ps.setInt(1, c.getKat_id());
            ps.executeUpdate();
        }catch(SQLException e){
            e.printStackTrace();
        }
    }
    public void add(Category b)
    {
    try
    
    {
    sql="insert into kategoriler(katAdi) values(?)";
    ps=connection.prepareStatement(sql);
    ps.setString(1,b.getKat_adi());
    ps.executeUpdate();
    }catch(SQLException e)
    {
        e.printStackTrace();
    }
    
    }           
    public void update(Category c)
    {
        try{
            sql="update kategoriler set katAdi=? where katID=?";
            ps=connection.prepareStatement(sql);
            ps.setString(1, c.getKat_adi());
            ps.setInt(2,c.getKat_id());
            ps.executeUpdate();
        }catch(SQLException e){
            e.printStackTrace();
        }
    }
     public List<Category> toplam()
    {
        List<Category> toplam=new ArrayList();
        try
        {
            sql="select count(*) as toplam from kategoriler";
            ps=connection.prepareStatement(sql);
            rs=ps.executeQuery();
            while(rs.next())
            {
                Category urun = new Category(
                        rs.getInt("toplam")
                        
                );
                toplam.add(urun);
            }
        }catch(SQLException e)
        {
            e.printStackTrace();
        }
        return toplam;
    }
}
