package com.kbhyazilim.Business;
import com.kbhyazilim.DataAccess.DbHelper;
import com.kbhyazilim.Entities.Comment;
import java.sql.*;
import java.util.*;

public class CommentManager extends DbHelper {
    DbHelper dbHelper = new DbHelper();
    Connection connection = dbHelper.baglan();
    
     public void add(Comment b)
    {
    try
    
    {
    sql="insert into yorumlar(Yorum_AdSoyad,Yorum_icerik,Yorum_tarih,Yorum_Onay,UrunID) values(?,?,?,?,?)";
    ps=connection.prepareStatement(sql);
    ps.setString(1, b.getYorumAdSoyad());
    ps.setString(2, b.getYorumIcerik());
    ps.setString(3, b.getYorumTarih());
    ps.setInt(4, b.getYorumOnay());
    ps.setInt(5, b.getUrunID());
    ps.executeUpdate();
    }catch(SQLException e)
    {
        e.printStackTrace();
    }
    
    }    
     public List<Comment> select(int urunid)
    {
        List<Comment> liste=new ArrayList();
        try
        {
            sql="select * from yorumlar where UrunID=? and Yorum_Onay=1";
            ps=connection.prepareStatement(sql);
            ps.setInt(1, urunid);
            rs=ps.executeQuery();
            while(rs.next())
            {
                Comment yorum = new Comment(
                        rs.getInt("YorumID"),
                        rs.getString("Yorum_AdSoyad"),
                        rs.getString("Yorum_icerik"),
                        rs.getString("Yorum_tarih"),
                        rs.getInt("Yorum_Onay"),
                        rs.getInt("UrunID")
                );
                liste.add(yorum);
            }
        }catch(SQLException e)
        {
            e.printStackTrace();
        }
        return liste;
    }
     
     
      public List<Comment> selectAll()
    {
        List<Comment> liste=new ArrayList();
        try
        {
            sql="select * from yorumlar";
            ps=connection.prepareStatement(sql);
            rs=ps.executeQuery();
            while(rs.next())
            {
                Comment yorum = new Comment(
                        rs.getInt("YorumID"),
                        rs.getString("Yorum_AdSoyad"),
                        rs.getString("Yorum_icerik"),
                        rs.getString("Yorum_tarih"),
                        rs.getInt("Yorum_Onay"),
                        rs.getInt("UrunID")
                );
                liste.add(yorum);
            }
        }catch(SQLException e)
        {
            e.printStackTrace();
        }
        return liste;
    }
      
      public List<Comment> toplam(int urunid)
    {
        List<Comment> liste=new ArrayList();
        try
        {
            sql="select count(*) as toplam from yorumlar where UrunID=? and Yorum_Onay=1";
            ps=connection.prepareStatement(sql);
            ps.setInt(1, urunid);
            rs=ps.executeQuery();
            while(rs.next())
            {
                Comment yorum = new Comment(
                        rs.getInt("toplam")
                        
                );
                liste.add(yorum);
            }
        }catch(SQLException e)
        {
            e.printStackTrace();
        }
        return liste;
    }
      public void delete(Comment c)
    {
        try{
            sql="delete from yorumlar where YorumID=?";
            ps=connection.prepareStatement(sql);
            
            ps.setInt(1,c.getYorumID());
            ps.executeUpdate();
        }catch(SQLException e){
            e.printStackTrace();
        }
    }
       public void update(Comment c)
    {
        try{
            sql="update yorumlar set Yorum_Onay=1 where YorumID=?";
            ps=connection.prepareStatement(sql);  
            ps.setInt(1,c.getYorumID());
            ps.executeUpdate();
        }catch(SQLException e){
            e.printStackTrace();
        }
    }
}
