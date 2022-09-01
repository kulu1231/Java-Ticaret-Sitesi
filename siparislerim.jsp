<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import ="com.kbhyazilim.Entities.Product,com.kbhyazilim.Business.ProductManager,java.util.*"%>
<%@page import ="com.kbhyazilim.Entities.Members,com.kbhyazilim.Business.MembersManager,java.util.*"%>
<%@page import ="com.kbhyazilim.Entities.ShoppingCart,com.kbhyazilim.Business.ShoppingCartManager,java.util.*"%>

<%@include file="header.jsp" %>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
     <!-- Page Header Start -->
    <div class="container-fluid bg-secondary mb-5">
        <div class="d-flex flex-column align-items-center justify-content-center" style="min-height: 100px">
            <h1 class="font-weight-semi-bold text-uppercase mb-3">Siparişler</h1>
            <div class="d-inline-flex">
                <p class="m-0"><a href="index.jsp">Anasayfa</a></p>
                <p class="m-0 px-2">-</p>
                <p class="m-0">Siparişler</p>
            </div>
        </div>
    </div>
    <!-- Page Header End -->
    <div class="sepetg">
        
    </div>

  <script>
       
$(document).ready(function(){  
    
  
    // Jquery sayfa yüklediğinde çalışmaya başlayacak kod yapısı
    function veriCek()
    {
  $.ajax({   
            url: "siparisgoster.jsp",
            type: "POST",
           
            //form bilgilerini veri parametrelerine dönüştürecek kod
           success: function(e)
           {
           $('.sepetg').html(e);
        
    }});
    
    }
    setInterval(veriCek,350);

});

   
</script>
<%@include file="footer.jsp" %>