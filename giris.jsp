<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import ="com.kbhyazilim.Entities.Members,com.kbhyazilim.Business.MembersManager,java.util.*"%>

<%@include file="header.jsp" %>

   
    
    <!-- Contact Start -->
    <div class="container-fluid pt-5">
        <div class="text-center mb-4">
            <h2 class="section-title px-5"><span class="px-2">Giriş Yap</span></h2>
        </div>
        <div class="row px-xl-5">
            <div class="col-lg-4 mb-5 "></div>
            <div class="col-lg-4 mb-5 ">
                
                <div class="contact-form col">
                    <div id="success"></div>
                    <form method="post" action="">
                        <%
                        String kuladi = request.getParameter("kuladi");
                        String sifre = request.getParameter("sifre");
                        String hatirla = request.getParameter("hatirla");
                        if(hatirla!=null)
    {
        Cookie usernameCookie = new Cookie("girisu",kuladi);
        Cookie passwordCookie = new Cookie("girisp",sifre);
        usernameCookie.setMaxAge(3600*7*24);
        passwordCookie.setMaxAge(3600*7*24);
        response.addCookie(usernameCookie);
        response.addCookie(passwordCookie);
        
    }
                        
                        if(kuladi!=null && sifre!=null)
                        {
                            MembersManager mm = new MembersManager();
                            Members giris = new Members(kuladi,sifre);
                            boolean kontrol = mm.giris(giris);
                            if(kontrol)
                            {
                           session.setAttribute("login", "true");
                           session.setAttribute("kuladi", kuladi);
                           
                           MembersManager uyegetir = new MembersManager();
                           List<Members> uyeliste = uyegetir.selectById(kuladi);
                           for(Members uyedizi:uyeliste)
                           {
                             session.setAttribute("adsoyad", uyedizi.getAd() + " " + uyedizi.getSoyad());
                             session.setAttribute("uyeid",uyedizi.getNo());
                           }
                           response.sendRedirect("index.jsp");
                            
                        }
                        else
                        {

                        %>
                         <br><div class="alert">
  <span class="closebtn" onclick="this.parentElement.style.display='none';">&times;</span> 
  <strong>Hata!</strong> Hatalı Giriş veya Üyelik Aktif Değil.
</div>
                        <%
                        }
                        }
                        %>
                        <%
                       Cookie[] cookies = request.getCookies();
   String username="",password="";
   if(cookies!=null)
   {
       for(int i=0;i<cookies.length;i++)
       {
           if(cookies[i].getName().equals("girisu"))
               username=cookies[i].getValue();
           else if(cookies[i].getName().equals("girisp"))
               password=cookies[i].getValue();
       }
   }
                        
                        %>
                        <div class="control-group">
                            <input type="text" class="form-control" id="name" name="kuladi" placeholder="Kullanıcı Adı"
                                required="required" data-validation-required-message="Boş Bırakılamaz!" value="<%=username%>" />
                            <p class="help-block text-danger"></p>
                        </div>
                        <div class="control-group">
                            <input type="password" class="form-control" id="parola" name="sifre" placeholder="Şifre"
                                required="required" data-validation-required-message="Boş Bırakılamaz!" value="<%=password%>" />
                            <p class="help-block text-danger"></p>
                            <input type="hidden" name="cerez" value="<%=username%>" />
                        </div>
                        <div class="control-group">
                            <input type="checkbox" class="form-check-inline" name="hatirla" />Beni Hatırla
                            <p class="help-block text-danger"></p>
                        </div>
                       
                        <div>
                            <button class="btn btn-primary py-2 px-4" type="submit" id="sendMessageButton">
                               Giriş Yap</button>
                            <p class="help-block text-danger"></p>
                        </div>
                        
                        <div class="control-group">
                           <a class="btn btn-success" href="kayit.jsp">Kayıt Ol</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a class="btn btn-danger" href="sifremiunuttum.jsp">Şifremi Unuttum</a>
                        </div>
                    </form>
                </div>
                
            </div>
         <div class="col-lg-4 mb-5 "></div>
        </div>
    </div>
    <!-- Contact End -->
<%@include file="footer.jsp" %>