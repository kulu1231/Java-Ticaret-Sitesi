 <%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="com.kbhyazilim.DataAccess.DbHelper"%>
<%@page import="java.sql.*"%>
<%@ page import="java.io.*"%>
<%!
public Connection baglan;
DbHelper dbHelper= new DbHelper();
    %>
<%
 
        
    
    
        
  try
   {
     request.setCharacterEncoding("utf-8");
    int urun = Integer.parseInt(request.getParameter("urun"));
    String resim = request.getParameter("resim");
       Class.forName("com.mysql.jdbc.Driver");
       baglan = dbHelper.baglan();
       PreparedStatement ekle = baglan.prepareStatement("insert into resimler(urun_id,urun_resim) values(?,?)");
       ekle.setInt(1,urun);
        ekle.setString(2,resim);
       ekle.executeUpdate();
       ekle.close();
       baglan.close();
       response.sendRedirect("resimekle.jsp");

   }catch(SQLException e)
   {
        e.printStackTrace();
      
   }

%>