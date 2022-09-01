<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import ="com.kbhyazilim.Entities.ShoppingCart,com.kbhyazilim.Business.ShoppingCartManager,java.util.*"%>
<%@page import ="com.kbhyazilim.Entities.Stok,com.kbhyazilim.Business.StokManager,java.util.*"%>
<%
Integer adet = Integer.parseInt(request.getParameter("adet"));
Integer uyeid = Integer.parseInt(request.getParameter("sepetid"));
Integer urunid = Integer.parseInt(request.getParameter("urunid"));
StokManager sm2 = new StokManager();
List<Stok> liste = sm2.selectById(urunid);
for(Stok s:liste)
{
    if(s.getUrunAdet()>0)
    {  
    ShoppingCart model = new ShoppingCart(urunid,uyeid,adet+1);
    ShoppingCartManager guncelle = new ShoppingCartManager();
    guncelle.arttir(model);
    
    StokManager sm = new StokManager();
    sm.stokazalt(Integer.valueOf(urunid));
    }
}

response.sendRedirect("sepetim.jsp");
%>
