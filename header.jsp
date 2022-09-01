<%@page import="com.kbhyazilim.Entities.ShoppingCart,com.kbhyazilim.Business.ShoppingCartManager"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import ="com.kbhyazilim.Entities.Slider,com.kbhyazilim.Business.SliderManager,java.util.*"%>
<%@page import ="com.kbhyazilim.Entities.Category,com.kbhyazilim.Business.CategoryManager,java.util.*"%>
<%@page import ="com.kbhyazilim.Entities.SubCategory,com.kbhyazilim.Business.SubCategoryManager,java.util.*"%>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="utf-8">
    <title>Kapı Dünyası</title>
    <meta content="width=device-width, initial-scale=1.0" name="viewport">
    <meta content="Free HTML Templates" name="keywords">
    <meta content="Free HTML Templates" name="description">
<script src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
    <!-- Favicon -->
    <link href="img/DW.png" rel="icon">
	<script src="https://kit.fontawesome.com/a09b300764.js" crossorigin="anonymous"></script>

    <!-- Google Web Fonts -->
    <link rel="preconnect" href="https://fonts.gstatic.com">
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@100;200;300;400;500;600;700;800;900&display=swap" rel="stylesheet"> 

<link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.10.0/css/all.min.css" rel="stylesheet" />
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
<link href="lib/owlcarousel/assets/owl.carousel.min.css" rel="stylesheet">

    <!-- Customized Bootstrap Stylesheet -->
    <link href="css/style.css" rel="stylesheet">
          <style>
           
.alert {
  padding: 20px;
  background-color: #f44336;
  color: white;
  opacity: 1;
  transition: opacity 0.6s;
  margin-bottom: 15px;
}

.alert.success {background-color: #04AA6D;}
.alert.info {background-color: #2196F3;}
.alert.warning {background-color: #ff9800;}

.closebtn {
  margin-left: 15px;
  color: white;
  font-weight: bold;
  float: right;
  font-size: 22px;
  line-height: 20px;
  cursor: pointer;
  transition: 0.3s;
}

.closebtn:hover {
  color: black;
}
        </style>
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
                <nav class="collapse position-absolute navbar navbar-vertical navbar-light align-items-start p-0 border border-top-0 border-bottom-0 bg-light" id="navbar-vertical" style="width: calc(100% - 30px); z-index: 999;">
                    <div class="navbar-nav w-100 overflow-hidden" style="height: 410px">
                        <%
                        CategoryManager cm = new CategoryManager();
                        List<Category> liste = cm.select();
                        for(Category cat:liste)
                        {
                        %>
                        <div class="nav-item dropdown z-index-3">
                            <a href="#" class="nav-link" data-toggle="dropdown"><%=cat.getKat_adi()%> <i class="fa fa-angle-down float-right mt-1"></i></a>
                            <div style="z-index:999" class="dropdown-menu position-absolute bg-secondary border-0 rounded-0 w-100 m-0 z-index-sticky">
                                <%
                        SubCategoryManager scm = new SubCategoryManager();
                        List<SubCategory> sliste = scm.select();
                        for(SubCategory cat2:sliste)
                        {
                        
                                if(cat2.getKat_id() == cat.getKat_id())
                                {
                        %>
                                
                                <a style="z-index:999" href="kategoriler.jsp?kat_id=<%=cat2.getAltid()%>" class="dropdown-item"><%=cat2.getAltadi()%></a>
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
                        <h1 class="m-0 display-5 font-weight-semi-bold"><span class="text-primary font-weight-bold border px-3 mr-1">E</span>Shopper</h1>
                    </a>
                    <button type="button" class="navbar-toggler" data-toggle="collapse" data-target="#navbarCollapse">
                        <span class="navbar-toggler-icon"></span>
                    </button>
                    <div class="collapse navbar-collapse justify-content-between" id="navbarCollapse">
                        <div class="navbar-nav mr-auto py-0">
                            <a href="index.jsp" class="nav-item nav-link">Anasayfa</a>
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
               
            </div>
        </div>
    </div>
    <!-- Navbar End -->



    


  


    
 