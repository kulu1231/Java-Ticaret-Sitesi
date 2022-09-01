<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import ="com.kbhyazilim.Entities.ShoppingCart,com.kbhyazilim.Business.ShoppingCartManager,java.util.*"%>
<%@page import ="com.kbhyazilim.Entities.Stok,com.kbhyazilim.Business.StokManager,java.util.*"%>

<%
Integer adet = Integer.parseInt(request.getParameter("adet"));
Integer uyeid = Integer.parseInt(request.getParameter("sepetid"));
Integer urunid = Integer.parseInt(request.getParameter("urunid"));

Integer adet2 = adet-1;
if(adet2==0)
{
Integer uyeid2 = Integer.parseInt(request.getParameter("sepetid"));
Integer urunid2 = Integer.parseInt(request.getParameter("urunid"));
ShoppingCart model = new ShoppingCart(urunid2,uyeid2);
ShoppingCartManager sil = new ShoppingCartManager();
sil.delete(model);
StokManager sm = new StokManager();
sm.stokarttir(Integer.valueOf(urunid));
}
else
{
ShoppingCart model = new ShoppingCart(urunid,uyeid,adet-1);
ShoppingCartManager guncelle = new ShoppingCartManager();
guncelle.arttir(model);
StokManager sm = new StokManager();
sm.stokarttir(Integer.valueOf(urunid));
}
response.sendRedirect("sepetim.jsp");

%>
