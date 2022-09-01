<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import ="com.kbhyazilim.Entities.Stok,com.kbhyazilim.Business.StokManager,java.util.*"%>

<%
request.setCharacterEncoding("utf-8");
String stokid = request.getParameter("stokid");
String urun = request.getParameter("urunid");
String miktar = request.getParameter("adet");
String birim = request.getParameter("birim");
String kdv = request.getParameter("kdv");

Stok model = new Stok(Integer.valueOf(stokid),Integer.valueOf(urun),Integer.valueOf(miktar),birim,Integer.valueOf(kdv));
StokManager guncelle = new StokManager();
guncelle.update(model);
response.sendRedirect("stoklar.jsp");
 
%>