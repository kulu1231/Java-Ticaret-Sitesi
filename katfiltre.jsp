<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import ="com.kbhyazilim.Entities.Product,com.kbhyazilim.Business.ProductManager,java.util.*"%>
<%@page import ="com.kbhyazilim.Entities.Category,com.kbhyazilim.Business.CategoryManager,java.util.*"%>
<%@page import ="com.kbhyazilim.Entities.Stok,com.kbhyazilim.Business.StokManager,java.util.*"%>

<%@include file="header.jsp" %>

    <!-- Page Header Start -->
    <div class="container-fluid bg-secondary mb-5">
        <div class="d-flex flex-column align-items-center justify-content-center" style="min-height: 100px">
            <h1 class="font-weight-semi-bold text-uppercase mb-3">Ürünler</h1>
            <div class="d-inline-flex">
                <p class="m-0"><a href="index.jsp">Anasayfa</a></p>
                <p class="m-0 px-2">-</p>
                <p class="m-0">Ürünler</p>
            </div>
        </div>
    </div>
    <!-- Page Header End -->
    
     <!-- Shop Start -->
    <div class="container-fluid pt-5 z-index-0">
        <div class="row px-xl-5">
            <!-- Shop Sidebar Start -->
            <div class="col-lg-3 col-md-12 z-index-0">
                <!-- Price Start -->
                <div class="border-bottom mb-4 pb-4 z-index-0">
                    <h5 class="font-weight-semi-bold mb-4">Kategoriler</h5>
                    <form method="get" action="katfiltre.jsp">
                        
                        <div class="custom-control custom-checkbox d-flex align-items-center justify-content-between mb-3">
                            <input type="checkbox" class="custom-control-input" value="1" id="ahsap" name="ahsap">
                            <label class="custom-control-label" for="ahsap">Ahşap Kapı</label>
                        </div>
                         <div class="custom-control custom-checkbox d-flex align-items-center justify-content-between mb-3">
                            <input type="checkbox" class="custom-control-input" value="2" id="celik" name="celik">
                            <label class="custom-control-label" for="celik">Çelik Kapı</label>
                        </div>
                         <div class="custom-control custom-checkbox d-flex align-items-center justify-content-between mb-3">
                            <input type="checkbox" class="custom-control-input" value="3" id="pvc" name="pvc">
                            <label class="custom-control-label" for="pvc">PVC Kapı</label>
                        </div>
                        <div class="custom-control custom-checkbox d-flex align-items-start justify-content-lg-start mb-3">
                            <input type="submit" value="Filtrele" class="btn btn-primary" >
                            
                        </div>
                       
                    </form>
                </div>
                <!-- Price End -->
                
          

              
            </div>
            <!-- Shop Sidebar End -->


            <!-- Shop Product Start -->
            <div class="col-lg-9 col-md-12">
                <div class="row pb-3">
                    
                    
                    <%
                        
                    String katid = request.getParameter("ahsap");
                    String katid2 = request.getParameter("celik");
                    String katid3 = request.getParameter("pvc");
                    if(katid==null)
                    {
                        katid="0";
                    }
                    if(katid2==null)
                    {
                        katid2="0";
                    }
                    if(katid3==null)
                    {
                        katid3="0";
                    }
                    List<String> katlar = new ArrayList<String>();
                    katlar.add(katid);
                    katlar.add(katid2);
                    katlar.add(katid3);
                   
                    ProductManager pm = new ProductManager();
                    List<Product> urun = pm.katgetir2(Integer.valueOf(katlar.get(0)),Integer.valueOf(katlar.get(1)),Integer.valueOf(katlar.get(2)));
                    StokManager sm = new StokManager();
                    List<Stok> stok = sm.select();
                    for(Product urunler:urun)
                    {
                        for(Stok s:stok)
                        {
                            if(s.getUrunID() == urunler.getUrunID())
                            {
                    %>
                    <div class="col-lg-4 col-md-6 col-sm-12 pb-1">
                        <div class="card product-item border-0 mb-4">
                            <div class="card-header product-img position-relative overflow-hidden bg-transparent border p-0">
                                <img class="img-fluid w-100" src="img/<%=urunler.getResim()%>" alt="">
                            </div>
                            <div class="card-body border-left border-right text-center p-0 pt-4 pb-3">
                                <h6 class="text-truncate mb-3"><%=urunler.getUrunAdi()%></h6>
                                <div class="d-flex justify-content-center">
                                    <h6><%=urunler.getUrunFiyat()%> &#8378;</h6>
                                   
                                </div>
                            </div>
                                    <div class="card-body border-left border-right text-center p-0 pt-1 pb-3">
                                        <h6 class="text-truncate mb-3">
                                            <%
                                            if(s.getUrunAdet() <= 10 && s.getUrunAdet()>0)
                                            {
                                            %>
                                            <font color="red"><strong>SON <%=s.getUrunAdet()%> ÜRÜN</strong></font>
                                            <%
                                                }
                                                else if(s.getUrunAdet() == 0)
                                                {
                                                    %>
                                                    <font color="red"><strong>TÜKENDİ</strong></font>
                                                    <%
                                                    }
                                                else
                                             {
                                            %>
                                            <font color="gray"><strong>STOK : <%=s.getUrunAdet()%></strong></font>

                                            <%
                                                }
                                            %>
                                        </h6>
                               
                            </div>
                                <%
                                if(s.getUrunAdet() > 0)
                                {
                                %>
                           <form method="post" action="sepetekle2.jsp?urun_id=<%=urunler.getUrunID()%>">
                            <div class="card-footer d-flex justify-content-between bg-light border">
                                <a href="urundetay.jsp?urun_id=<%=urunler.getUrunID()%>" class="btn btn-sm text-dark"><i class="fas fa-eye text-primary mr-1"></i>Detay</a>
                                <input style="width:70px" type="number"  name="adet" class="form-control bg-secondary text-center" value="1" min="1" max="<%=s.getUrunAdet()%>" />
                                <button class="btn btn-primary text-white"><i class="fa fa-shopping-cart mr-1"></i>Ekle</button>
                            </div>
                                </form>
                            <%
                                }
                                else
                                {
                            %>
                            <div class="card-footer d-flex justify-content-between bg-light border">
                                <a href="urundetay.jsp?urun_id=<%=urunler.getUrunID()%>" class="btn btn-sm text-dark"><i class="fas fa-eye text-primary mr-1"></i>Detay</a>
                                <button class="btn btn-danger text-white"><i class="fas fa-warning text-primary mr-1"></i>Tükendi</button>
                            </div>
                            <%
                                }
                            %>
                        </div>
                    </div>
                    <%}}}%>
                   
                   
                   
                    
                  
                   
                   
                 
                </div>
            </div>
            <!-- Shop Product End -->
        </div>
    </div>
    <!-- Shop End -->
<%@include file="footer.jsp" %>