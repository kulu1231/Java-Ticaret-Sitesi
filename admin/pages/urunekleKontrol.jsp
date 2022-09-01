<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="com.kbhyazilim.DataAccess.DbHelper"%>
  <%@page import ="com.kbhyazilim.Entities.Product,com.kbhyazilim.Business.ProductManager,java.util.*"%>
<%@page import="java.sql.*"%>

<%
    String urunadi = request.getParameter("urunadi");
    int fiyat = Integer.parseInt(request.getParameter("urunfiyat"));
    String aciklama = request.getParameter("urunaciklama");
    String renk = request.getParameter("urunrenk");
    int kategori = Integer.parseInt(request.getParameter("kategori"));
    int altkategori = Integer.parseInt(request.getParameter("altkategori"));
    Product model = new Product(urunadi,fiyat,aciklama,renk,kategori,altkategori);
    
    ProductManager ekle = new ProductManager();
    ekle.add(model);
    response.sendRedirect("urunekle.jsp");
    %>
   