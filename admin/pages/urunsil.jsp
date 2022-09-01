<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="com.kbhyazilim.Business.ProductManager,com.kbhyazilim.Entities.Product,java.util.*" %>

<% 
 int urunid = Integer.parseInt(request.getParameter("urun_id"));
 Product manager = new Product(urunid);
 ProductManager cm = new ProductManager();
 cm.delete(manager);
 response.sendRedirect("urunler.jsp");
%>
