<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import ="com.kbhyazilim.Entities.Slider,com.kbhyazilim.Business.SliderManager,java.util.*"%>
<%@page import ="com.kbhyazilim.Entities.Category,com.kbhyazilim.Business.CategoryManager,java.util.*"%>
<%@page import ="com.kbhyazilim.Entities.SubCategory,com.kbhyazilim.Business.SubCategoryManager,java.util.*"%>
<%@page import="com.kbhyazilim.Entities.ShoppingCart,com.kbhyazilim.Business.ShoppingCartManager"%>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="utf-8">
    <title>Kapı Dünyası</title>
    <meta content="width=device-width, initial-scale=1.0" name="viewport">
    <meta content="Free HTML Templates" name="keywords">
    <meta content="Free HTML Templates" name="description">

    <!-- Favicon -->
    <link href="img/favicon.ico" rel="icon">

    <!-- Google Web Fonts -->
    <link rel="preconnect" href="https://fonts.gstatic.com">
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@100;200;300;400;500;600;700;800;900&display=swap" rel="stylesheet"> 

    <!-- Font Awesome -->
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.10.0/css/all.min.css" rel="stylesheet">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
    <!-- Libraries Stylesheet --><script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
    <link href="lib/owlcarousel/assets/owl.carousel.min.css" rel="stylesheet">

    <!-- Customized Bootstrap Stylesheet -->
    <link href="css/style.css" rel="stylesheet">
</head>

<body>
    <!-- Topbar Start -->
    <div class="container-fluid">
        <div class="row bg-secondary py-2 px-xl-5">
            <div class="col-lg-6 d-none d-lg-block">
                
            </div>
            <div class="col-lg-6 text-center text-lg-right">
                <div class="d-inline-flex align-items-center">
                    <a class="text-dark px-2" href="">
                        <i class="fab fa-facebook-f"></i>
                    </a>
                    <a class="text-dark px-2" href="">
                        <i class="fab fa-twitter"></i>
                    </a>
                    <a class="text-dark px-2" href="">
                        <i class="fab fa-linkedin-in"></i>
                    </a>
                    <a class="text-dark px-2" href="">
                        <i class="fab fa-instagram"></i>
                    </a>
                    <a class="text-dark pl-2" href="">
                        <i class="fab fa-youtube"></i>
                    </a>
                </div>
            </div>
        </div>
        <div class="row align-items-center py-3 px-xl-5">
            <div class="col-lg-3 d-none d-lg-block">
                <a href="index.jsp" class="text-decoration-none">
                    <h1 class="m-0 display-5 font-weight-semi-bold"><span class="text-black font-weight-bold px-3 mr-1"> <img style="max-width:100%;height:auto" src="img/logoslogan.png" alt="Image"></span></h1>
                </a>
            </div>
            <div class="col-lg-6 col-6 text-left">
                 <form method="post" action="arama.jsp">
                    <div class="input-group">
                        <input type="text" class="form-control" name="urunadi" placeholder="Ürün Arama">
                        <div class="input-group-append">
                            <button class="input-group-text bg-transparent text-primary">
                                <i class="fa fa-search"></i>
                            </button>
                        </div>
                    </div>
                </form>
            </div>
            <div class="col-lg-3 col-6 text-right">
               
                <a href="sepetim.jsp" class="btn border">
                    <i class="fas fa-shopping-cart text-primary"></i>
                    <span class="badge" style="color:black">
                        <%
                             
                            if(session.getAttribute("login")=="true")
                            {
                            %>
                            <%
                        Integer uye = (Integer)session.getAttribute("uyeid");
                        
                        ShoppingCartManager say = new ShoppingCartManager();
                        List<ShoppingCart> sepetcount = say.sepetsay(Integer.valueOf(uye));
                        for(ShoppingCart sepet:sepetcount)
                        {
                        %>
                        <%=sepet.getUyeID()%>
                        <%
                        }
                        }
                        
                        %>
                    
                    </span>
                </a>
            </div>
        </div>
    </div>
    <!-- Topbar End -->


    <!-- Navbar Start -->
    <div class="container-fluid mb-5">
        <div class="row border-top px-xl-5">
            <div class="col-lg-3 d-none d-lg-block">
                <a class="btn shadow-none d-flex align-items-center justify-content-between bg-primary text-white w-100" data-toggle="collapse" href="#navbar-vertical" style="height: 65px; margin-top: -1px; padding: 0 30px;">
                    <h6 class="m-0">Kategoriler</h6>
                    <i class="fa fa-angle-down text-dark"></i>
                </a>
                <nav class="collapse show navbar navbar-vertical navbar-light align-items-start p-0 border border-top-0 border-bottom-0" id="navbar-vertical">
                    <div class="navbar-nav w-100 overflow-hidden" style="height: 410px">
                        <%
                        CategoryManager cm = new CategoryManager();
                        List<Category> kliste = cm.select();
                        for(Category cat:kliste)
                        {
                        %>
                        <div class="nav-item dropdown">
                            <a href="#" class="nav-link" data-toggle="dropdown"><%=cat.getKat_adi()%> <i class="fa fa-angle-down float-right mt-1"></i></a>
                            <div class="dropdown-menu position-absolute bg-secondary border-0 rounded-0 w-100 m-0">
                                <%
                        SubCategoryManager scm = new SubCategoryManager();
                        List<SubCategory> sliste = scm.select();
                        for(SubCategory cat2:sliste)
                        {
                        
                                if(cat2.getKat_id() == cat.getKat_id())
                                {
                        %>
                                
                                <a href="kategoriler.jsp?kat_id=<%=cat2.getAltid()%>" class="dropdown-item"><%=cat2.getAltadi()%></a>
                                 <%}}%>
                            </div>
                        </div>
                        <%}%>
                    </div>
                </nav>
            </div>
            <div class="col-lg-9">
                <nav class="navbar navbar-expand-lg bg-light navbar-light py-3 py-lg-0 px-0">
                    <a href="" class="text-decoration-none d-block d-lg-none">
                    <h1 class="m-0 display-5 font-weight-semi-bold"><span class="text-black font-weight-bold px-3 mr-1"> <img width="300" height="200" class="img-fluid" src="img/logoslogan.png" alt="Image"></span></h1>
                    </a>
                    <button type="button" class="navbar-toggler" data-toggle="collapse" data-target="#navbarCollapse">
                        <span class="navbar-toggler-icon"></span>
                    </button>
                    <div class="collapse navbar-collapse justify-content-between" id="navbarCollapse">
                        <div class="navbar-nav mr-auto py-0">
                            <a href="index.jsp" class="nav-item nav-link active">Anasayfa</a>
                            <a href="urunler.jsp" class="nav-item nav-link">Ürünler</a>
                           
                        </div>
                        <div class="navbar-nav ml-auto py-0">
                           <%
                            if(session.getAttribute("login")!="true")
                            {
                            %>
                            <a href="giris.jsp" class="nav-item nav-link">Giriş Yap</a>
                            <a href="kayit.jsp" class="nav-item nav-link">Kayıt Ol</a>
                            <%
                             }
                             else
                            {
                            %>
                           <div class="btn-group dropstart">
  <button type="button" class="btn btn-secondary dropdown-toggle" data-bs-toggle="dropdown" aria-expanded="false">
      <%=session.getAttribute("adsoyad")%>
  </button>
  <ul class="dropdown-menu">
    <li><a class="dropdown-item" href="profilim.jsp">Profilim</a></li>
        <li><a class="dropdown-item" href="siparislerim.jsp">Siparişlerim</a></li>

    <li><a class="dropdown-item" href="sifredegistir.jsp">Şifremi Değiştir</a></li>
    <li><hr class="dropdown-divider"></li>
    <li><a class="dropdown-item" href="cikis.jsp">Çıkış Yap</a></li>
    
  </ul>
</div>
                            <%}%>
                        </div>
                    </div>
                </nav>
                <div id="header-carousel" class="carousel slide" data-ride="carousel">
                    <div class="carousel-inner">
                         <%
                                        SliderManager manager2 = new SliderManager();
                                        List<Slider> liste2 = manager2.select();
                                        for(Slider resim2:liste2)
                                        {
                                        %>
                        <div class="carousel-item <%=resim2.getSlider_durum()%>" style="height: 410px;">
                            <img class="img-fluid" src="img/<%=resim2.getSlider_adi()%>" alt="Image">
                            <div class="carousel-caption d-flex flex-column align-items-center justify-content-center">
                                <div class="p-3" style="max-width: 700px;">
                               </div>
                            </div>
                        </div>
                        <%}%>
                        
                    </div>
                    <a class="carousel-control-prev" href="#header-carousel" data-slide="prev">
                        <div class="btn btn-dark" style="width: 45px; height: 45px;">
                            <span class="carousel-control-prev-icon mb-n2"></span>
                        </div>
                    </a>
                    <a class="carousel-control-next" href="#header-carousel" data-slide="next">
                        <div class="btn btn-dark" style="width: 45px; height: 45px;">
                            <span class="carousel-control-next-icon mb-n2"></span>
                        </div>
                    </a>
                </div>
            </div>
        </div>
    </div>
    <!-- Navbar End -->



    


  


    
 

<!-- Footer Start -->
    <div class="container-fluid bg-secondary text-dark mt-5 pt-5">
        <div class="row px-xl-5 pt-5">
            <div class="col-lg-4 col-md-12 mb-5 pr-3 pr-xl-5">
                <a href="" class="text-decoration-none">
                    <h1 class="m-0 display-5 font-weight-semi-bold"><span class="text-black font-weight-bold border px-3 mr-1"> <img style="max-width:100%;height:auto" src="img/logoslogan.png" alt="Image"></span></h1>
                </a>
                
                <p class="mb-2"><i class="fa fa-map-marker-alt text-primary mr-3"></i>Serin Yol Kampüsü, İskenderun Yolu 13.Km Derince Mevkii, 31001 Antakya/Hatay</p>
                <p class="mb-2"><i class="fa fa-envelope text-primary mr-3"></i>3kbhyazilim@gmail.com</p>
                <p class="mb-0"><i class="fa fa-phone-alt text-primary mr-3"></i>+90 123 456 78 90</p>
            </div>
            <div class="col-lg-8 col-md-12">
                <div class="row">
                    <div class="col-md-4 mb-5">
                        
                        <div class="d-flex flex-column justify-content-start">
                          <iframe src="https://www.google.com/maps/embed?pb=!1m14!1m8!1m3!1d12860.701944560285!2d36.1981702!3d36.3080511!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x0%3A0x9916d07bba8d24a4!2sAntakya%20Meslek%20Y%C3%BCksekokulu!5e0!3m2!1str!2str!4v1653908988259!5m2!1str!2str" width="800" height="250" style="border:0;" allowfullscreen="" loading="lazy" referrerpolicy="no-referrer-when-downgrade"></iframe>
                        </div>
            </div>
                    </div>
        </div>
        <div class="row border-top border-light mx-xl-5 py-4">
            <div class="col-md-6 px-xl-0">
                <p class="mb-md-0 text-center text-md-left text-dark">
                    &copy; <a class="text-dark font-weight-semi-bold" href="index.jsp">DoorWord</a>. Tüm Hakları Saklıdır.
                    
                </p>
            </div>
            <div class="col-md-6 px-xl-0 text-center text-md-right">
                <img style="max-width:100%;height:auto" src="img/payments.png" alt="">
            </div>
        </div>
    </div>
    <!-- Footer End -->


    <!-- Back to Top -->
    <a href="#" class="btn btn-primary back-to-top"><i class="fa fa-angle-double-up"></i></a>


    <!-- JavaScript Libraries -->
    <script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.bundle.min.js"></script>
    <script src="lib/easing/easing.min.js"></script>
    <script src="lib/owlcarousel/owl.carousel.min.js"></script>

    <!-- Contact Javascript File -->
    <script src="mail/jqBootstrapValidation.min.js"></script>
    <script src="mail/contact.js"></script>

    <!-- Template Javascript -->
    <script src="js/main.js"></script>
</body>


</html>
