<%@page import ="com.kbhyazilim.Entities.Product,com.kbhyazilim.Business.ProductManager,java.util.*"%>
<%@page import ="com.kbhyazilim.Entities.Members,com.kbhyazilim.Business.MembersManager,java.util.*"%>
<%@page import ="com.kbhyazilim.Entities.ShoppingCart,com.kbhyazilim.Business.ShoppingCartManager,java.util.*"%>

            <script>
function islem(a,b,c) {
     $.ajax({   
            url: "sepetduzenle.jsp",
            type: "POST",
            data:{
              "adet":a,
              "sepetid":b,
              "urunid":c
            },
           
            //form bilgilerini veri parametrelerine dönüştürecek kod
           success: function(e)
           {
           
        
    }});
    
}
function islem2(a,b,c) {
     $.ajax({   
            url: "sepetduzenle2.jsp",
            type: "POST",
            data:{
              "adet":a,
              "sepetid":b,
              "urunid":c
            },
           
            //form bilgilerini veri parametrelerine dönüştürecek kod
           success: function(e)
           {
           
               
    }});
    
}
</script>
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
                        ShoppingCartManager manager = new ShoppingCartManager();
                        List<ShoppingCart> sepetliste = manager.select(uye);
                        ProductManager pmanager = new ProductManager();
                        List<Product> urunliste = pmanager.urunliste();
                        int toplam = 0;
                        if(!sepetliste.isEmpty())
                        {
                        %>
            <div class="col-lg-8 table-responsive mb-5">
               
                <table class="table table-bordered text-center mb-0">
                    <thead class="bg-secondary text-dark">
                        <tr>
                            <th>Ürün Resmi</th>
                            <th>Ürün Adı</th>
                            <th>Ürün Fiyat</th>
                            
                            <th>Miktar</th>
                            <th>Toplam</th>
                            <th>Sil</th>
                        </tr>
                    </thead>
                    <tbody class="align-middle">
                        <%
                        
                        for(ShoppingCart sepet:sepetliste)
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
                                <div class="input-group quantity mx-auto" style="width: 100px;">
                                    <div class="input-group-btn">
                                        <button class="btn btn-sm btn-primary btn-minus" onclick="islem2(<%=sepet.getAdet()%>,<%=sepet.getUyeID()%>,<%=sepet.getUrunID()%>)" >
                                        <i class="fa fa-minus"></i>
                                        </button>
                                    </div>
                                    <input type="text" class="form-control form-control-sm bg-secondary text-center" id="sepetadet" value="<%=sepet.getAdet()%>">
                                    <div class="input-group-btn">
                                        <button class="btn btn-sm btn-primary btn-plus" onclick="islem(<%=sepet.getAdet()%>,<%=sepet.getUyeID()%>,<%=sepet.getUrunID()%>)">
                                            <i class="fa fa-plus"></i>
                                        </button>
                                    </div>
                                </div>
                            </td>
                           <td class="align-middle">
                               <%
                                  
                                  out.print(sepet.getAdet() * urun.getUrunFiyat());
                              
                                        
                               %>
                               &#8378;
                           </td>
                            <td class="align-middle"><a href="sepetsil.jsp?urun_id=<%=sepet.getUrunID()%>&adet=<%=sepet.getAdet()%>" class="btn btn-sm btn-primary"><i class="fa fa-times"></i></a></td>
                        </tr>
                       
                        
                    
                       <%
                           }} } 
                       %>
                    </tbody>
                </table>
                     
            </div>

            <div class="col-lg-4">
                <form class="mb-5" action="">
                   
                </form>
                <div class="card border-secondary mb-5">
                    <div class="card-header bg-secondary border-0">
                        <h4 class="font-weight-semi-bold m-0">Sepet Özeti</h4>
                    </div>
                    <div class="card-body">
                        <div class="d-flex justify-content-between mb-3 pt-1">
                            <h6 class="font-weight-medium">Ara Toplam</h6>
                            <h6 class="font-weight-medium"><%=toplam%> &#8378;</h6>
                        </div>
                        
                    </div>
                    <div class="card-footer border-secondary bg-transparent">
                        <div class="d-flex justify-content-between mt-2">
                            <h5 class="font-weight-bold">Toplam</h5>
                            <h5 class="font-weight-bold"><%=toplam%> &#8378;</h5>
                        </div>
                        <a href="sepetonayla.jsp" class="btn btn-block btn-primary my-3 py-3">Sepeti Onayla</a>
                    </div>
                </div>
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
                             Henüz Ürün Eklemediniz.
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