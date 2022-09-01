<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import ="com.kbhyazilim.Entities.ShoppingCart,com.kbhyazilim.Business.ShoppingCartManager,java.util.*"%>
<%@page import ="com.kbhyazilim.Entities.Stok,com.kbhyazilim.Business.StokManager,java.util.*"%>

<%
if(session.getAttribute("login")==null)
{
    response.sendRedirect("giris.jsp");
}
else
{
String urunid = request.getParameter("urun_id");
Integer uyeid = (Integer)session.getAttribute("uyeid");
int adet = 1;

ShoppingCartManager scm = new ShoppingCartManager();
List<ShoppingCart> liste = scm.selectuye(Integer.valueOf(urunid),Integer.valueOf(uyeid));
 if(liste.isEmpty())
     {
        ShoppingCart model = new ShoppingCart(Integer.valueOf(urunid),uyeid,adet);
        ShoppingCartManager ekle = new ShoppingCartManager();
        ekle.add(model);
        StokManager sm = new StokManager();
        sm.stokazalt(Integer.valueOf(urunid));
        response.sendRedirect("sepetim.jsp");
    }
    else
    {
for(ShoppingCart sepet:liste)
{
     if(sepet.getAdet()>=1)
     {
        ShoppingCart model = new ShoppingCart(sepet.getSepetID(),sepet.getUrunID(),sepet.getUyeID(),sepet.getAdet());
        ShoppingCartManager guncelle = new ShoppingCartManager();
        guncelle.update(model);
        StokManager sm = new StokManager();
        sm.stokazalt(Integer.valueOf(urunid));
        response.sendRedirect("sepetim.jsp");
        
        
     }
    
     
       
}
       
    
}
}
%>
