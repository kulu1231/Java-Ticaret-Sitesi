package com.kbhyazilim.Business;
import com.kbhyazilim.DataAccess.DbHelper;
import com.kbhyazilim.Entities.Members;
import java.sql.*;
import java.util.*;
public class MembersManager extends DbHelper {
    DbHelper db = new DbHelper();
    Connection conn = db.baglan();
    public boolean giris(Members uye)
    {
        boolean kontrol = false;
        try{
            sql = "select * from uyeler where kullaniciadi=? and sifre=? and uye_onay=1";
            ps=conn.prepareStatement(sql);
            ps.setString(1, uye.getKullaniciadi());
            ps.setString(2,uye.getSifre());
           
            
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
    
    public List<Members> select()
    {
        List<Members> liste = new ArrayList();
        
    try
    {
        sql = "select * from uyeler";
        ps=conn.prepareStatement(sql);
        rs = ps.executeQuery();
        while(rs.next())
        {
            Members uye = 
            new Members(
                    rs.getInt("no"),
                    rs.getString("ad"),
                    rs.getString("soyad"),
                    rs.getString("kullaniciadi"),
                    rs.getString("sifre"),
                    rs.getString("email"),
                    rs.getInt("ilceID"),
                    rs.getInt("sehirID"),
                    rs.getString("kayit_Tarihi"),
                    rs.getInt("uye_onay"));
            liste.add(uye);
        }
        
    }catch(SQLException e){
    e.printStackTrace();
}
    return liste;
    }
      public boolean add(Members b)       
    {
        boolean kontrol = false;
    try
    
    {
    sql="insert into uyeler(ad,soyad,kullaniciadi,sifre,email,ilceID,sehirID,kayit_Tarihi,uye_onay) values(?,?,?,?,?,?,?,?,?)";
    ps=conn.prepareStatement(sql);
    ps.setString(1,b.getAd());
    ps.setString(2,b.getSoyad());
    ps.setString(3,b.getKullaniciadi());
    ps.setString(4,b.getSifre());
    ps.setString(5,b.getEmail());
    ps.setInt(6,b.getIlceID());
    ps.setInt(7,b.getIlID());
    ps.setString(8,b.getTarih());
    ps.setInt(9,b.getOnay());
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
    
    
    public void delete(Members c)
    {
        try
        {
            sql = "delete from uyeler where no=?";
            ps=conn.prepareStatement(sql);
            ps.setInt(1, c.getNo());
            ps.executeUpdate();
        }catch(SQLException e){
            e.printStackTrace();
        }
    }
      public void update(Members c)
    {
        try{
            sql="update uyeler set ad=?,soyad=?,kullaniciadi=?,sifre=?,email=?,ilceID=?,sehirID=? where no=?" ;
            ps=conn.prepareStatement(sql);
            ps.setString(1, c.getAd());
            ps.setString(2, c.getSoyad());
            ps.setString(3, c.getKullaniciadi());
            ps.setString(4, c.getSifre());
            ps.setString(5, c.getEmail());
            ps.setInt(6, c.getIlceID());
            ps.setInt(7, c.getIlID());
            ps.setInt(8,c.getNo());
            ps.executeUpdate();
        }catch(SQLException e){
            e.printStackTrace();
        }
    }
       public List<Members> iller()
    {
        List<Members> liste = new ArrayList();
        
    try
    {
        sql = "select * from iller";
        ps=conn.prepareStatement(sql);
        rs = ps.executeQuery();
        while(rs.next())
        {
            Members uye = 
            new Members(
                    rs.getInt("sehirID"),
                    rs.getString("sehirAdi"));
                   
            liste.add(uye);
        }
        
    }catch(SQLException e){
    e.printStackTrace();
}
    return liste;
    }
      
       
       
       public List<Members> ilceler()
    {
        List<Members> liste = new ArrayList();
        
    try
    {
        sql = "select * from ilceler";
        ps=conn.prepareStatement(sql);
        rs = ps.executeQuery();
        while(rs.next())
        {
            Members uye = 
            new Members(
                    rs.getInt("ilceID"),
                    rs.getString("ilceAdi"),
                    rs.getInt("sehirID")
            
            );
                   
            liste.add(uye);
        }
        
    }catch(SQLException e){
    e.printStackTrace();
}
    return liste;
    }
        public List<Members> toplam()
    {
        List<Members> toplam=new ArrayList();
        try
        {
            sql="select count(*) as toplam from uyeler";
            ps=conn.prepareStatement(sql);
            rs=ps.executeQuery();
            while(rs.next())
            {
                Members urun = new Members(
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
         public void onayla(Members c)
    {
        try
        {
            sql = "update uyeler set uye_onay=1 where no=?";
            ps=conn.prepareStatement(sql);
            ps.setInt(1, c.getNo());
            ps.executeUpdate();
        }catch(SQLException e){
            e.printStackTrace();
        }
    }
          public List<Members> selectById(String kuladi)
    {
        List<Members> liste = new ArrayList();
        
    try
    {
        sql = "select * from uyeler where kullaniciadi=?";
        ps=conn.prepareStatement(sql);
        ps.setString(1, kuladi);
        rs = ps.executeQuery();
        while(rs.next())
        {
            Members uye = 
            new Members(
                    rs.getInt("no"),
                    rs.getString("ad"),
                    rs.getString("soyad"),
                    rs.getString("kullaniciadi"),
                    rs.getString("sifre"),
                    rs.getString("email"),
                    rs.getInt("ilceID"),
                    rs.getInt("sehirID"),
                    rs.getString("kayit_Tarihi"),
                    rs.getInt("uye_onay"));
            liste.add(uye);
        }
        
    }catch(SQLException e){
    e.printStackTrace();
}
    return liste;
    }
           public void sifredegistir(Members c)
    {
        try
        {
            sql = "update uyeler set sifre=? where kullaniciadi=?";
            ps=conn.prepareStatement(sql);
            ps.setString(1, c.getSifre());
            ps.setString(2, c.getKullaniciadi());
            ps.executeUpdate();
        }catch(SQLException e){
            e.printStackTrace();
        }
    }
            public void sifreunuttum(Members c)
    {
        try
        {
            sql = "update uyeler set sifre=? where email=?";
            ps=conn.prepareStatement(sql);
            ps.setString(1, c.getSifre());
            ps.setString(2, c.getKullaniciadi());
            ps.executeUpdate();
        }catch(SQLException e){
            e.printStackTrace();
        }
    }
}
