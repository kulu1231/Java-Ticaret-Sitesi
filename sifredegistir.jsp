<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import ="com.kbhyazilim.Entities.Members,com.kbhyazilim.Business.MembersManager,java.util.*"%>

<%@include file="header.jsp" %>

   
    
    <!-- Contact Start -->
    <div class="container-fluid pt-5">
        <div class="text-center mb-4">
            <h2 class="section-title px-5"><span class="px-2">Şifre Değiştir</span></h2>
        </div>
        <div class="row px-xl-5">
            <div class="col-lg-4 mb-5 "></div>
            <div class="col-lg-4 mb-5 ">
                
                <div class="contact-form col">
                    <div id="success"></div>
                    <form method="post" action="">
                       <% 
 String uye = request.getParameter("kuladi");
 String sifre = request.getParameter("sifre");
 if(uye!=null && sifre!=null)
 {
 Members manager = new Members(uye,sifre);
 MembersManager cm2 = new MembersManager();
 cm2.sifredegistir(manager);
 
 %>
 <br><div class="alert success">
  <span class="closebtn" onclick="this.parentElement.style.display='none';">&times;</span> 
  <strong>Başarılı!</strong> Şifre Değiştirildi.
</div>
 <%
 }

%>

                        <div class="control-group">
                            <input type="text" class="form-control" id="name" name="kuladi" value="<%=session.getAttribute("kuladi")%>" placeholder="Kullanıcı Adı"
                                required="required" data-validation-required-message="Boş Bırakılamaz!" readonly/>
                            <p class="help-block text-danger"></p>
                        </div>
                        <div class="control-group">
                            <input type="password" class="form-control" id="parola" name="sifre" placeholder="Yeni Şifre"
                                required="required" data-validation-required-message="Boş Bırakılamaz!" />
                            <p class="help-block text-danger"></p>
                        </div>
                        
                       
                        <div>
                            <button class="btn btn-primary py-2 px-4" type="submit" id="sendMessageButton">
                               Şifreni Değiştir</button>
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