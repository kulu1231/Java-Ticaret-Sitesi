<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import ="com.kbhyazilim.Entities.Product,com.kbhyazilim.Business.ProductManager,java.util.*"%>
  <%
   String urunid = request.getParameter("urun_id");
   String urunadi = request.getParameter("urunadi");
   String urunfiyat = request.getParameter("urunfiyat");
   String urunaciklama = request.getParameter("urunaciklama");
   String urunrenk = request.getParameter("urunrenk");
   String katid = request.getParameter("katid");
   String altkatid = request.getParameter("altkatid");
   
if(urunid!=null && urunadi!=null && urunfiyat!=null && urunaciklama!=null  && urunrenk!=null && katid!=null && altkatid!=null)
{
        Product model = new Product(Integer.valueOf(urunid),urunadi,Integer.valueOf(urunfiyat),urunaciklama,urunrenk,Integer.valueOf(katid),Integer.valueOf(altkatid));
        ProductManager guncelle = new ProductManager();
        guncelle.update(model);
        response.sendRedirect("urunler.jsp");
   }
   %>
