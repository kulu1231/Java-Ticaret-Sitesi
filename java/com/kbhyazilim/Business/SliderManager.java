
package com.kbhyazilim.Business;
import com.kbhyazilim.DataAccess.DbHelper;
import com.kbhyazilim.Entities.Category;
import com.kbhyazilim.Entities.Slider;
import com.kbhyazilim.Entities.Stok;
import java.sql.*;
import java.util.*;

public class SliderManager extends DbHelper {
    DbHelper dbHelper = new DbHelper();
    
    Connection connection = dbHelper.baglan();
    public List<Slider> select()
    {
        List<Slider> liste=new ArrayList();
        try
        {
            sql="select * from slider";
            ps=connection.prepareStatement(sql);
            rs=ps.executeQuery();
            while(rs.next())
            {
                Slider slider = new Slider(rs.getInt("slider_id"),rs.getString("slider_adi"),rs.getString("slider_durum"));
                liste.add(slider);
            }
        }catch(SQLException e)
        {
            e.printStackTrace();
        }
        return liste;
    }
     public void add(Slider b)
    {
    try
    
    {
    sql="insert into slider(slider_adi) values(?)";
    ps=connection.prepareStatement(sql);
    ps.setString(1,b.getSlider_adi());
    ps.executeUpdate();
    }catch(SQLException e)
    {
        e.printStackTrace();
    }
    
    }
      public void delete(Slider c)
    {
        try
        {
            sql = "delete from slider where slider_id=?";
            ps=connection.prepareStatement(sql);
            ps.setInt(1, c.getSlider_id());
            ps.executeUpdate();
        }catch(SQLException e){
            e.printStackTrace();
        }
    }
}
