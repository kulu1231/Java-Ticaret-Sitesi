package com.kbhyazilim.Business;
import com.kbhyazilim.DataAccess.DbHelper;
import com.kbhyazilim.Entities.Stok;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;
public class StokManager extends DbHelper {
     DbHelper dbHelper = new DbHelper();
    Connection connection = dbHelper.baglan();
    
     public boolean stokekle(Stok b) throws SQLException
    {
        boolean eklenme = false;
    try
    
    {
    sql="insert into stok(UrunKod,UrunMiktar,StokBirim,UrunKDV) values(?,?,?,?)";
    ps=connection.prepareStatement(sql);
    ps.setInt(1,b.getUrunID());
    ps.setInt(2, b.getUrunAdet());
    ps.setString(3, b.getUrunBirim());
    ps.setInt(4, b.getUrunKDV());
    ps.executeUpdate();
    eklenme = true;
    }catch(SQLException e)
    {
        e.printStackTrace();
        
    }
   finally{
        if(connection!=null)
            connection.close();
        if(ps!=null)
            ps.close();
       
    }
    return eklenme;
    }  
     
     public List<Stok> select() throws SQLException
    {
        List<Stok> liste=new ArrayList();
        try
        {
            sql="select * from stok";
            ps=connection.prepareStatement(sql);
            rs=ps.executeQuery();
            while(rs.next())
            {
                Stok stok = new Stok(
                        rs.getInt("StokID"),
                        rs.getInt("UrunKod"),
                        rs.getInt("UrunMiktar"),
                        rs.getString("StokBirim"),
                        rs.getInt("UrunKDV")
                       
                );
                liste.add(stok);
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
       public void delete(Stok c) throws SQLException
    {
        try
        {
            sql = "delete from stok where stokID=?";
            ps=connection.prepareStatement(sql);
            ps.setInt(1, c.getStokID());
            ps.executeUpdate();
        }catch(SQLException e){
            e.printStackTrace();
        }
        finally{
        if(connection!=null)
            connection.close();
        if(ps!=null)
            ps.close();
      
    }
    }
       public void stok(int adet,int urunid) throws SQLException
    {
        try
        {
            sql = "update stok set UrunMiktar=UrunMiktar - ? where UrunKod=?";
            ps=connection.prepareStatement(sql);
            ps.setInt(1, adet);
            ps.setInt(2, urunid);
            ps.executeUpdate();
        }catch(SQLException e){
            e.printStackTrace();
        }
        finally{
        if(connection!=null)
            connection.close();
        if(ps!=null)
            ps.close();
       
    }
    }
       
       public void stok2(int adet,int urunid) throws SQLException
    {
        try
        {
            sql = "update stok set UrunMiktar=UrunMiktar + ? where UrunKod=?";
            ps=connection.prepareStatement(sql);
            ps.setInt(1, adet);
            ps.setInt(2, urunid);
            ps.executeUpdate();
        }catch(SQLException e){
            e.printStackTrace();
        }
        finally{
        if(connection!=null)
            connection.close();
        if(ps!=null)
            ps.close();
       
    }
    }
    public List<Stok> selectById(int urunid) throws SQLException
    {
        List<Stok> liste=new ArrayList();
        try
        {
            sql="select * from stok where UrunKod=?";
            ps=connection.prepareStatement(sql);
            ps.setInt(1, urunid);
            rs=ps.executeQuery();
            while(rs.next())
            {
                Stok stok = new Stok(
                        rs.getInt("StokID"),
                        rs.getInt("UrunKod"),
                        rs.getInt("UrunMiktar"),
                        rs.getString("StokBirim"),
                        rs.getInt("UrunKDV")
                       
                );
                liste.add(stok);
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
     public void stokazalt(int urunid) throws SQLException
    {
        try
        {
            sql = "update stok set UrunMiktar=UrunMiktar-1 where UrunKod=?";
            ps=connection.prepareStatement(sql);
            ps.setInt(1, urunid);
            ps.executeUpdate();
        }catch(SQLException e){
            e.printStackTrace();
        }
       finally{
        if(connection!=null)
            connection.close();
        if(ps!=null)
            ps.close();
       
    }
    }
    public void stokarttir(int urunid) throws SQLException
    {
        try
        {
            sql = "update stok set UrunMiktar=UrunMiktar+1 where UrunKod=?";
            ps=connection.prepareStatement(sql);
            ps.setInt(1, urunid);
            ps.executeUpdate();
        }catch(SQLException e){
            e.printStackTrace();
        }
        finally{
        if(connection!=null)
            connection.close();
        if(ps!=null)
            ps.close();
       
    }
    }
    public void update(Stok stok) throws SQLException
    {
        try
        {
            sql = "update stok set UrunKod=?,UrunMiktar=?,StokBirim=?,UrunKDV=? where StokID=?";
            ps=connection.prepareStatement(sql);
            ps.setInt(1, stok.getUrunID());
            ps.setInt(2, stok.getUrunAdet());
            ps.setString(3, stok.getUrunBirim());
            ps.setInt(4, stok.getUrunKDV());
            ps.setInt(5, stok.getStokID());
            ps.executeUpdate();
        }catch(SQLException e){
            e.printStackTrace();
        }
       finally{
        if(connection!=null)
            connection.close();
        if(ps!=null)
            ps.close();
       
    }
    }
}
