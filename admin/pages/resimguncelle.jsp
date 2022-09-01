<%@page import ="com.kbhyazilim.DataAccess.DbHelper,com.kbhyazilim.Business.ProductManager,java.util.*,java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    int gelen=Integer.parseInt(request.getParameter("resimid"));
    String durum = request.getParameter("durum");
    %>
    <%!
public Connection baglan;
DbHelper dbHelper= new DbHelper();
%>

<%

Class.forName("com.mysql.jdbc.Driver");
baglan = dbHelper.baglan();
PreparedStatement ps = baglan.prepareStatement("update resimler set resim_durum=?  where resimID=?");
ps.setString(1, durum);
ps.setInt(2, gelen);
ps.executeUpdate();
response.sendRedirect("resimler.jsp");
    %>
