<%@page import ="com.kbhyazilim.Entities.Product,com.kbhyazilim.Business.ProductManager,java.util.*"%>
<%@page import ="com.kbhyazilim.Entities.Members,com.kbhyazilim.Business.MembersManager,java.util.*"%>
<%@page import ="com.kbhyazilim.Entities.Order,com.kbhyazilim.Business.OrderManager,java.util.*"%>
<%@page import ="com.kbhyazilim.DataAccess.DbHelper,java.util.List,java.sql.*,java.util.Date"%>

           
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
  <!-- Cart Start -->
    <div class="container-fluid pt-5">
        <div class="row px-xl-5">
             <%
                        if(session.getAttribute("login")!="true")
                        {
                            response.sendRedirect("giris.jsp");
                        }
                        Integer uye = (Integer)session.getAttribute("uyeid");
                        OrderManager manager = new OrderManager();
                        List<Order> sepetliste = manager.selectuye(uye);
                        ProductManager pmanager = new ProductManager();
                        List<Product> urunliste = pmanager.urunliste();
                        int toplam = 0;
                        if(!sepetliste.isEmpty())
                        {
                        %>
            <div class="col-lg-12 table-responsive mb-5">
               
                <table class="table table-bordered text-center mb-0">
                    <thead class="bg-secondary text-dark">
                        <tr>
                            <th>Ürün Resmi</th>
                            <th>Ürün Adı</th>
                            <th>Ürün Fiyat</th>
                            
                            <th>Miktar</th>
                            <th>Toplam</th>
                            <th>Durum</th>
                        </tr>
                    </thead>
                    <tbody class="align-middle">
                        <%
                        
                        for(Order sepet:sepetliste)
                        {
                           
                            for(Product urun:urunliste)
                            {
                                if(sepet.getUrunID() == urun.getUrunID())
                                  {
                                    toplam += sepet.getAdet() * urun.getUrunFiyat();
                        %>
                        <tr>
                            <td class="align-middle"><img src="img/<%=urun.getResim()%>" width="50" height="50" alt="alt"/></td>
                            <td class="align-middle"><%=urun.getUrunAdi()%></td>
                            <td class="align-middle"><%=urun.getUrunFiyat()%> &#8378;</td>
                           
                          
                            <td class="align-middle">
                                
                                    <%=sepet.getAdet()%> Adet
                                   
                               
                            </td>
                           <td class="align-middle">
                               <%
                                  
                                  out.print(sepet.getAdet() * urun.getUrunFiyat());
                              
                                        
                               %>
                               &#8378;
                           </td>
                            <td class="align-middle">
                                <%!
                                DbHelper dbHelper = new DbHelper();
                                Connection baglan = dbHelper.baglan();
                                %>
                              <%
                                              if(sepet.getDurum()==0)
                                                 out.print("<button class='btn btn-warning'>Hazırlanıyor</button>");
                                              if(sepet.getDurum()==1)
                                                 out.print("<button class='btn btn-danger'>Kargoda</button>");
                                              if(sepet.getDurum()==2)
                                              {
                                              try{
                                              String sql = "delete from stok where UrunMiktar=0";
                                              PreparedStatement ps = baglan.prepareStatement(sql);
                                              ps.executeUpdate();
                              }catch(Exception e)
                              {
                              e.printStackTrace();
                              }
                               finally{
       
        baglan.close();
        }
                                               out.print("<button class='btn btn-success'>Teslim Edildi</button>");

                                                }
                                          %>
                            </td>
                        </tr>
                       
                        
                    
                       <%
                           }} } 
                       %>
                    </tbody>
                </table>
                     
            </div>

       
                        
                        <%
                           }
else
{
%>
 <div class="col-lg-12 table-responsive mb-5">
               
                <table class="table table-bordered text-center mb-0">
                    
                    <tbody class="align-middle">
                        <tr>
                            <td class="align-middle">
                             <i class="fas fa-shopping-cart fa-10x text-danger"></i>
                           </td>
                        </tr>
                       <tr>
                            <td style="font-size:36px" class="align-middle">
                             Henüz Siparişiniz Yok.
                           </td>
                        </tr>
                        
                    
                       
                    </tbody>
                </table>
      </div>
                        
<%
}
                       %>  
        </div>
    </div>
    <!-- Cart End -->