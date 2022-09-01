<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import ="com.kbhyazilim.Entities.ShoppingCart,com.kbhyazilim.Business.ShoppingCartManager,java.util.*"%>
<%@page import ="com.kbhyazilim.Entities.Stok,com.kbhyazilim.Business.StokManager,java.util.*"%>
<%@page import="com.kbhyazilim.DataAccess.DbHelper"%>
<%@page import="java.sql.*"%>
<%!
                    DbHelper dbHelper = new DbHelper();
                    Connection connection = dbHelper.baglan();
                    PreparedStatement ps = null;
                %>
<%
Integer uyeid = (Integer)session.getAttribute("uyeid");
String urunid = request.getParameter("urun_id");
String adet = request.getParameter("adet");
ShoppingCart model = new ShoppingCart(Integer.valueOf(urunid),uyeid);
ShoppingCartManager sil = new ShoppingCartManager();
sil.delete(model);

StokManager stok = new StokManager();
stok.stok2(Integer.valueOf(adet), Integer.valueOf(urunid));
response.sendRedirect("sepetim.jsp");
%>
