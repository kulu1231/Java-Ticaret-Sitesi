<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="com.kbhyazilim.DataAccess.DbHelper"%>
<%@page import="java.sql.*"%>
<%@page import ="com.kbhyazilim.Entities.ShoppingCart,com.kbhyazilim.Business.ShoppingCartManager,java.util.*"%>
<%@page import ="com.kbhyazilim.Entities.Stok,com.kbhyazilim.Business.StokManager,java.util.*"%>

<%!
                    DbHelper dbHelper = new DbHelper();
                    Connection connection = dbHelper.baglan();
                    PreparedStatement ps = null;
                    Statement s = null;
                    
                %>
<%
if(session.getAttribute("login")==null)
{
    response.sendRedirect("giris.jsp");
}
else
{
String urunid = request.getParameter("urun_id");
Integer uyeid = (Integer)session.getAttribute("uyeid");
String adet = request.getParameter("adet");

ShoppingCartManager scm = new ShoppingCartManager();
List<ShoppingCart> liste = scm.selectuye(Integer.valueOf(urunid),Integer.valueOf(uyeid));
 if(liste.isEmpty())
     {
      ShoppingCart model = new ShoppingCart(Integer.valueOf(urunid),uyeid,Integer.valueOf(adet));
      ShoppingCartManager ekle = new ShoppingCartManager();
      ekle.add(model);
      StokManager sm = new StokManager();
      sm.stok(Integer.valueOf(adet),Integer.valueOf(urunid));      
}
else{
    ShoppingCart model = new ShoppingCart(Integer.valueOf(urunid),uyeid,Integer.valueOf(adet));
      ShoppingCartManager guncelle = new ShoppingCartManager();
      guncelle.update(model);
      StokManager sm = new StokManager();
      sm.stok(Integer.valueOf(adet),Integer.valueOf(urunid));
}

 response.sendRedirect("sepetim.jsp");   
}

%>
