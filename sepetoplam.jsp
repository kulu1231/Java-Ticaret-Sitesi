<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import ="com.kbhyazilim.Entities.Product,com.kbhyazilim.Business.ProductManager,java.util.*"%>
<%@page import ="com.kbhyazilim.Entities.Members,com.kbhyazilim.Business.MembersManager,java.util.*"%>
<%@page import ="com.kbhyazilim.Entities.ShoppingCart,com.kbhyazilim.Business.ShoppingCartManager,java.util.*"%>
 <%
                        if(session.getAttribute("login")!="true")
                        {
                            response.sendRedirect("giris.jsp");
                        }
                        Integer uye = (Integer)session.getAttribute("uyeid");
                        ShoppingCartManager manager = new ShoppingCartManager();
                        List<ShoppingCart> sepetliste = manager.select(uye);
                        for(ShoppingCart sepet:sepetliste)
                        {
                        
                        
                        
                       
                        int toplam = 0;
                        

                        
                        
                           
                         
                                if(sepet.getUrunID() == urun.getUrunID())
                                  {
                                    
                        %>

                       
                          <%
                       out.print(sepet.getAdet() * urun.getUrunFiyat()); 
                       %>
                       &#8378;  
    
                    <%
                           }} }
                       %>    