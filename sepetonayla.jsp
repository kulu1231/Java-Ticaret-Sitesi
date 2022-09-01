<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import ="com.kbhyazilim.DataAccess.DbHelper,java.util.List,java.sql.*,java.util.Date"%>
<%@page import ="com.kbhyazilim.Entities.ShoppingCart,com.kbhyazilim.Business.ShoppingCartManager,java.util.*"%>
<%@page import ="com.kbhyazilim.Entities.Order,com.kbhyazilim.Business.OrderManager,java.util.*"%>

<%

Integer id = (Integer)session.getAttribute("uyeid");

ShoppingCartManager sepetliste = new ShoppingCartManager();
List<ShoppingCart> liste = sepetliste.select(id);
for(ShoppingCart sepet:liste)
{
    Order model = new Order(sepet.getUyeID(),sepet.getUrunID(),sepet.getAdet(),0);
    OrderManager ekle = new OrderManager();
    ekle.add2(model);
}

ShoppingCartManager sil = new ShoppingCartManager();
sil.delete2(id);
response.sendRedirect("siparislerim.jsp");
%>