<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import ="com.kbhyazilim.Entities.Product,com.kbhyazilim.Business.ProductManager"%>
<%@page import ="com.kbhyazilim.Entities.Comment,com.kbhyazilim.Business.CommentManager"%>
<%@page import ="com.kbhyazilim.Entities.Stok,com.kbhyazilim.Business.StokManager"%>

<%@page import ="com.kbhyazilim.DataAccess.DbHelper,java.util.List,java.sql.*,java.util.Date"%>

<%@include file="header.jsp" %>

   
    <!-- Page Header Start -->
    <div class="container-fluid bg-secondary mb-5">
        <div class="d-flex flex-column align-items-center justify-content-center" style="min-height: 100px">
            <h1 class="font-weight-semi-bold text-uppercase mb-3">Ürün Detay</h1>
            <div class="d-inline-flex">
                <p class="m-0"><a href="index.jsp">Anasayfa</a></p>
                <p class="m-0 px-2">-</p>
                <p class="m-0">Ürün Detay</p>
            </div>
        </div>
    </div>
    <!-- Page Header End -->


    <!-- Shop Detail Start -->
    <div class="container-fluid py-5">
        <div class="row px-xl-5">
            <div class="col-lg-5 pb-5">
                <div id="product-carousel" class="carousel slide" data-ride="carousel">
                    <div class="carousel-inner border">
                        <%
                    String urunid = request.getParameter("urun_id");
                    if(urunid!=null)
                    {
                    
                    %>
                    <%!
                    DbHelper dbHelper = new DbHelper();
                    Connection connection = dbHelper.baglan();
                %>
                <%
                try{
               String sql = "select * from urunler u INNER JOIN resimler r ON r.urun_id = u.UrunlerID where u.UrunlerID =  ?";

                PreparedStatement ps = connection.prepareStatement(sql);
                ps.setInt(1, Integer.valueOf(urunid));
                ResultSet rs = ps.executeQuery();
                while(rs.next())
                {
                %>
                <div class="carousel-item <%=rs.getString("resim_durum")%> ">
                    <img class="w-100 h-100" src="img/<%=rs.getString("urun_resim")%>" alt="Image">
                        </div>
                <%
                }
                    }catch(Exception e)
                    {
                    e.printStackTrace();
                    }
            finally{
        connection.close();
        }
                %>
                
                        
                        <%
                            }
                        %>
                    </div>
                    <a class="carousel-control-prev" href="#product-carousel" data-slide="prev">
                        <i class="fa fa-2x fa-angle-left text-dark"></i>
                    </a>
                    <a class="carousel-control-next" href="#product-carousel" data-slide="next">
                        <i class="fa fa-2x fa-angle-right text-dark"></i>
                    </a>
                </div>
            </div>

            <div class="col-lg-7 pb-5">
                <%
                   
                    if(urunid!=null)
                    {
                ProductManager pm = new ProductManager();
                StokManager sm = new StokManager();
                List<Stok> stokliste = sm.select();
                List<Product> liste2 = pm.urunlistedetay(Integer.valueOf(urunid));
                for(Product u2:liste2)
                {
                  for(Stok stok:stokliste)
                  {
                        if(stok.getUrunID() == u2.getUrunID())
                        {
                %>
                <h3 class="font-weight-semi-bold"><%=u2.getUrunAdi()%></h3>
             
                <h3 class="font-weight-semi-bold mb-4"><%=u2.getUrunFiyat()%> &#8378;</h3>
                 
                <p class="mb-4"><%=u2.getUrunAciklama()%></p>
                 <p>Stok Adedi: <%=stok.getUrunAdet()%> <%=stok.getUrunBirim()%></p>
               
                <form method="post" action="sepetekle2.jsp?urun_id=<%=u2.getUrunID()%>">
                  <%
                  if(stok.getUrunAdet()>0)
                  {
                  %>
                <div class="d-flex align-items-center mb-4 pt-2">
                    
                   <div class="input-group quantity mr-3" style="width: 130px;">
                       
                        <input type="number"  name="adet" class="form-control bg-secondary text-center" value="1" min="1" max="<%=stok.getUrunAdet()%>">
                       
                    </div>
                    <button class="btn btn-primary px-3"><i class="fa fa-shopping-cart mr-1"></i>Sepete Ekle</button>
               
                  </div>
                        <%
                            }
                            else
                            {
                        %>
                        <div class="d-flex align-items-center mb-4 pt-2">
                            
                            <font color="red"><strong>TÜKENDİ</strong></font>
                        </div>
                        <%
                            }
                        %>
                 </form>
            </div>
        </div>
        <div class="row px-xl-5">
            <div class="col">
                <div class="nav nav-tabs justify-content-center border-secondary mb-4">
                    <a class="nav-item nav-link active" data-toggle="tab" href="#tab-pane-1">Açıklama</a>
                    
                    <a class="nav-item nav-link" data-toggle="tab" href="#tab-pane-3">Yorumlar (                        
                         <%
                                                CommentManager toplam = new CommentManager();
                                                List<Comment> list = toplam.toplam(Integer.valueOf(urunid));
                                                for(Comment say:list)
                                                    out.print(say.getYorumID());
                                                %>
                        )</a>
                </div>
                <div class="tab-content">
                    <div class="tab-pane fade show active" id="tab-pane-1">
                        <h4 class="mb-3">Ürün Açıklaması</h4>
                        <p><%=u2.getUrunAciklama()%></p>
                       
                    </div>
                    <%}}}}%>
                    <div class="tab-pane fade" id="tab-pane-3">
                        <div class="row">
                            <div class="col-md-6">
                                <%
                                CommentManager yorumlar = new CommentManager();
                                List<Comment> listyorum = yorumlar.select(Integer.valueOf(urunid));
                                for(Comment yorum:listyorum)
                                {
                                %>
                                <div class="media mb-4">
                                    <img src="img/user.png" alt="Image" style="width: 45px;">
                                    <div class="media-body">
                                        <h6><%=yorum.getYorumAdSoyad()%><small> - <i><%=yorum.getYorumTarih()%></i></small></h6>
                                        
                                        <p><%=yorum.getYorumIcerik()%></p>
                                    </div>
                                </div>
                               <%
                                   }
                               %>
                            </div>
                            <div class="col-md-6">
                                <h4 class="mb-4">Yorum Bırak</h4>
                               
                                <form method="POST">
                                   
                                    <div class="form-group">
                                        <label for="name">Ad Soyad</label>
                                        <input type="text" class="form-control" id="name" name="adsoyad" required>
                                    </div>
                                    <div class="form-group">
                                        <label for="message">Mesaj</label>
                                        <textarea id="message" cols="30" rows="5" name="icerik" class="form-control" required></textarea>
                                    </div>
                                    <div class="form-group mb-0">
                                        <input type="submit" value="Gönder" class="btn btn-primary px-3">
                                    </div>
                                </form>
                                <%
                                String adsoyad = request.getParameter("adsoyad");
                                String mesaj = request.getParameter("icerik");
                                String urunidyorum = request.getParameter("urun_id");
                                int onay = 0;
                                Date tarih = new Date();
                                if(adsoyad!=null && mesaj!=null && urunidyorum!=null)
                                {
                                    Comment model = new Comment(adsoyad,mesaj,String.valueOf(tarih.toLocaleString()),onay,Integer.valueOf(urunidyorum));
                                    CommentManager ekle = new CommentManager();
                                    ekle.add(model);
                                }
                                %>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- Shop Detail End -->
<%@include file="footer.jsp" %>