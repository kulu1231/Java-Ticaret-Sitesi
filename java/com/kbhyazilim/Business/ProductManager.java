package com.kbhyazilim.Business;
import com.kbhyazilim.DataAccess.DbHelper;
import com.kbhyazilim.Entities.Product;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;



public class ProductManager extends DbHelper {
    DbHelper dbHelper = new DbHelper();
    Connection connection = dbHelper.baglan();
    
     public void resimekle(Product b)
    {
    try
    
    {
    sql="insert into resimler(urun_id,urun_resim) values(?,?)";
    ps=connection.prepareStatement(sql);
    ps.setInt(1,b.getUrunID());
    ps.setString(2, b.getResim());
    ps.executeUpdate();
    }catch(SQLException e)
    {
        e.printStackTrace();
    }
    
    }  
     
       public List<Product> select()
    {
        List<Product> liste=new ArrayList();
        try
        {
            sql="select * from urunler";
            ps=connection.prepareStatement(sql);
            rs=ps.executeQuery();
            while(rs.next())
            {
                Product urun = new Product(
                        rs.getInt("UrunlerID"),
                        rs.getString("UrunlerAdi"),
                        rs.getInt("UrunFiyat"),
                        rs.getString("UrunAciklama"),
                        rs.getString("UrunRenk"),
                        rs.getInt("kat_id"),
                        rs.getInt("altkategoriID")
                );
                liste.add(urun);
            }
        }catch(SQLException e)
        {
            e.printStackTrace();
        }
        return liste;
    }
      public void add(Product ekle)
      {
          try{
              sql = "insert into urunler(UrunlerAdi,UrunFiyat,UrunAciklama,UrunRenk,kat_id,altkategoriID) values(?,?,?,?,?,?)";
              ps=connection.prepareStatement(sql);
              ps.setString(1, ekle.getUrunAdi());
              ps.setInt(2, ekle.getUrunFiyat());
              ps.setString(3, ekle.getUrunAciklama());
              ps.setString(4, ekle.getUrunRenk());
              ps.setInt(5, ekle.getKatNo());
              ps.setInt(6, ekle.getAltNo());
              ps.executeUpdate();
          }catch(SQLException e)
        {
            e.printStackTrace();
        }
      }
       public List<Product> toplam()
    {
        List<Product> toplam=new ArrayList();
        try
        {
            sql="select count(*) as toplam from urunler";
            ps=connection.prepareStatement(sql);
            rs=ps.executeQuery();
            while(rs.next())
            {
                Product urun = new Product(
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
        public void delete(Product c)
    {
        try
        {
            sql = "delete from urunler where UrunlerID=?";
            ps=connection.prepareStatement(sql);
            ps.setInt(1, c.getUrunID());
            ps.executeUpdate();
        }catch(SQLException e){
            e.printStackTrace();
        }
    }
         public void update(Product c)
    {
        try{
            sql="update urunler set UrunlerAdi=?,UrunFiyat=?,UrunAciklama=?,UrunRenk=?,kat_id=?,altkategoriID=? where UrunlerID=?";
            ps=connection.prepareStatement(sql);
            ps.setString(1, c.getUrunAdi());
            ps.setInt(2,c.getUrunFiyat());
            ps.setString(3, c.getUrunAciklama());
            ps.setString(4, c.getUrunRenk());
            ps.setInt(5, c.getKatNo());
            ps.setInt(6, c.getAltNo());
            ps.setInt(7, c.getUrunID());
            ps.executeUpdate();
        }catch(SQLException e){
            e.printStackTrace();
        }
    }
         public void resimguncelle(Product c)
    {
        try{
            sql="update resimler set resim_durum=?  where resimID=?";
            ps=connection.prepareStatement(sql);
            
            ps.setString(1,c.getResim_durum());
          
            ps.setInt(2, c.getResimID());
           
            ps.executeUpdate();
        }catch(SQLException e){
            e.printStackTrace();
        }
    }
          public List<Product> urunliste()
    {
        List<Product> liste=new ArrayList();
        try
        {
            sql="select * from urunler u INNER JOIN resimler r ON u.UrunlerID = r.urun_id group by r.urun_id";
            ps=connection.prepareStatement(sql);
            rs=ps.executeQuery();
            while(rs.next())
            {
                Product urun = new Product(
                        rs.getInt("UrunlerID"),
                        rs.getString("UrunlerAdi"),
                        rs.getInt("UrunFiyat"),
                        rs.getString("UrunAciklama"),
                        rs.getString("UrunRenk"),
                        rs.getInt("kat_id"),
                        rs.getInt("altkategoriID"),
                        rs.getString("urun_resim"),
                        rs.getString("resim_durum")
                );
                liste.add(urun);
            }
        }catch(SQLException e)
        {
            e.printStackTrace();
        }
        return liste;
    }
          
          public List<Product> urunlistedetay(int urunid)
    {
        List<Product> liste=new ArrayList();
        try
        {
            sql="select * from urunler u INNER JOIN resimler r ON u.UrunlerID = r.urun_id where u.UrunlerID=?";
            ps=connection.prepareStatement(sql);
            ps.setInt(1, urunid);
            rs=ps.executeQuery();
            rs.next();
                Product urun = new Product(
                        rs.getInt("UrunlerID"),
                        rs.getString("UrunlerAdi"),
                        rs.getInt("UrunFiyat"),
                        rs.getString("UrunAciklama"),
                        rs.getString("UrunRenk"),
                        rs.getInt("kat_id"),
                        rs.getInt("altkategoriID"),
                        rs.getString("urun_resim"),
                        rs.getString("resim_durum")
                );
                liste.add(urun);
            
        }catch(SQLException e)
        {
            e.printStackTrace();
        }
        return liste;
    }
          public List<Product> resimler()
    {
        List<Product> liste=new ArrayList();
        try
        {
            sql="select * from resimler r INNER JOIN urunler u ON r.urun_id = u.UrunlerID group by r.urun_id";
            ps=connection.prepareStatement(sql);
            rs=ps.executeQuery();
            while(rs.next())
            {
                Product urun = new Product(
                        rs.getInt("UrunlerID"),
                        rs.getString("UrunlerAdi"),
                        rs.getInt("UrunFiyat"),
                        rs.getString("UrunAciklama"),
                        rs.getString("UrunRenk"),
                        rs.getInt("kat_id"),
                        rs.getInt("altkategoriID"),
                        rs.getInt("resimID"),
                        rs.getString("urun_resim"),
                        rs.getString("resim_durum")
                );
                liste.add(urun);
            }
        }catch(SQLException e)
        {
            e.printStackTrace();
        }
        return liste;
    }
           public List<Product> urunarama(String urunadi)
    {
        List<Product> liste=new ArrayList();
        try
        {
            sql="select * from urunler u INNER JOIN resimler r ON u.UrunlerID = r.urun_id where u.UrunlerAdi LIKE ? group by r.urun_id";
            ps=connection.prepareStatement(sql);
            ps.setString(1, "%"+urunadi+"%");
            rs=ps.executeQuery();
            while(rs.next())
            {
                Product urun = new Product(
                        rs.getInt("UrunlerID"),
                        rs.getString("UrunlerAdi"),
                        rs.getInt("UrunFiyat"),
                        rs.getString("UrunAciklama"),
                        rs.getString("UrunRenk"),
                        rs.getInt("kat_id"),
                        rs.getInt("altkategoriID"),
                        rs.getString("urun_resim"),
                        rs.getString("resim_durum")
                );
                liste.add(urun);
            }
        }catch(SQLException e)
        {
            e.printStackTrace();
        }
        return liste;
}
           
            public List<Product> katgetir(int katid)
    {
        List<Product> liste=new ArrayList();
        try
        {
            sql="select * from urunler u INNER JOIN resimler r ON u.UrunlerID = r.urun_id where u.altkategoriID = ? group by r.urun_id";
            ps=connection.prepareStatement(sql);
            ps.setInt(1, katid);
            rs=ps.executeQuery();
            while(rs.next())
            {
                Product urun = new Product(
                        rs.getInt("UrunlerID"),
                        rs.getString("UrunlerAdi"),
                        rs.getInt("UrunFiyat"),
                        rs.getString("UrunAciklama"),
                        rs.getString("UrunRenk"),
                        rs.getInt("kat_id"),
                        rs.getInt("altkategoriID"),
                        rs.getString("urun_resim"),
                        rs.getString("resim_durum")
                );
                liste.add(urun);
            }
        }catch(SQLException e)
        {
            e.printStackTrace();
        }
        return liste;
}
            
            public List<Product> katgetir2(int katid,int katid2,int katid3)
    {
        List<Product> liste=new ArrayList();
        try
        {
            sql="select * from urunler u INNER JOIN resimler r ON u.UrunlerID = r.urun_id where u.kat_id = ? or u.kat_id=? or u.kat_id=? group by r.urun_id";
            ps=connection.prepareStatement(sql);
            ps.setInt(1, katid);
            ps.setInt(2, katid2);
            ps.setInt(3, katid3);
            rs=ps.executeQuery();
            while(rs.next())
            {
                Product urun = new Product(
                        rs.getInt("UrunlerID"),
                        rs.getString("UrunlerAdi"),
                        rs.getInt("UrunFiyat"),
                        rs.getString("UrunAciklama"),
                        rs.getString("UrunRenk"),
                        rs.getInt("kat_id"),
                        rs.getInt("altkategoriID"),
                        rs.getString("urun_resim"),
                        rs.getString("resim_durum")
                );
                liste.add(urun);
            }
        }catch(SQLException e)
        {
            e.printStackTrace();
        }
        return liste;
}
}
