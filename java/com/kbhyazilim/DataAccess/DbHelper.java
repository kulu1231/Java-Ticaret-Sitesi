package com.kbhyazilim.DataAccess;

import java.sql.*;

public class DbHelper {
 public PreparedStatement ps=null;
 public ResultSet rs=null;
 public String sql=null;
 
 public Connection baglan()
 {
  Connection kapidunyasi=null;
  try
  {
      Class.forName("com.mysql.jdbc.Driver");
   
   kapidunyasi=DriverManager.getConnection("jdbc:mysql://localhost/kapidunyasi","root","12345678");
  }   
  catch(Exception e)
  {
   e.printStackTrace();
  } 
 
  return kapidunyasi;
 }   
}
