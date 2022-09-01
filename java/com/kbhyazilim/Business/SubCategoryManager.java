package com.kbhyazilim.Business;
import com.kbhyazilim.DataAccess.DbHelper;
import com.kbhyazilim.Entities.SubCategory;
import java.sql.*;
import java.util.*;

public class SubCategoryManager extends DbHelper {
    DbHelper dbHelper = new DbHelper();
    
    Connection connection = dbHelper.baglan();
   
    public List<SubCategory> select()
    {
        List<SubCategory> liste=new ArrayList();
        try
        {
            sql="select * from altkategoriler"; 
            ps=connection.prepareStatement(sql);
            rs=ps.executeQuery();
            while(rs.next())
            {
                SubCategory category = new SubCategory(rs.getInt("altKATID"),rs.getString("altKatAdi"),rs.getInt("kat_id"));
                liste.add(category);
            }
        }catch(SQLException e)
        {
            e.printStackTrace();
        }
        return liste;
    }
    public void delete(SubCategory c)
    {
        try
        {
            sql = "delete from altkategoriler where altKATID=?";
            ps=connection.prepareStatement(sql);
            ps.setInt(1, c.getAltid());
            ps.executeUpdate();
        }catch(SQLException e){
            e.printStackTrace();
        }
    }
    public void add(SubCategory b)
    {
    try
    
    {
    sql="insert into altkategoriler(altKatAdi,kat_id) values(?,?)";
    ps=connection.prepareStatement(sql);
    ps.setString(1,b.getAltadi());
    ps.setInt(2, b.getKat_id());
    ps.executeUpdate();
    }catch(SQLException e)
    {
        e.printStackTrace();
    }
    
    }           
    public void update(SubCategory c)
    {
        try{
            sql="update altkategoriler set altKatAdi=?,kat_id=? where altKATID=?";
            ps=connection.prepareStatement(sql);
            ps.setString(1, c.getAltadi());
            ps.setInt(2,c.getKat_id());
            ps.setInt(3, c.getAltid());
            ps.executeUpdate();
        }catch(SQLException e){
            e.printStackTrace();
        }
    }
     public List<SubCategory> toplam()
    {
        List<SubCategory> toplam=new ArrayList();
        try
        {
            sql="select count(*) as toplam from altkategoriler";
            ps=connection.prepareStatement(sql);
            rs=ps.executeQuery();
            while(rs.next())
            {
                SubCategory urun = new SubCategory(
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
