<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import ="com.kbhyazilim.Entities.Members,com.kbhyazilim.Business.MembersManager,java.util.*"%>
<%@page import ="com.kbhyazilim.DataAccess.DbHelper,java.util.List,java.sql.*,java.util.Date"%>

<%@include file="header.jsp" %>
<%!
                    DbHelper dbHelper = new DbHelper();
                    Connection connection = dbHelper.baglan();
                %>
   
    
    <!-- Contact Start -->
    <div class="container-fluid pt-5">
        <div class="text-center mb-4">
            <h2 class="section-title px-5"><span class="px-2">Şifremi Unuttum</span></h2>
        </div>
        <div class="row px-xl-5">
            <div class="col-lg-4 mb-5 "></div>
            <div class="col-lg-4 mb-5 ">

                <div class="contact-form col">
                    <div id="success"></div>
                    <form method="post" action="">
                                        <%
Random random = new Random();
int sayi = random.nextInt(999);
%>
<% 
 String kod = request.getParameter("kod");
 String kod2 = request.getParameter("kodg");
 String sifre = request.getParameter("sifre");
 String email = request.getParameter("mail");
 if(kod!=null && kod2!=null)
 {
 if(Integer.valueOf(kod2).equals(Integer.valueOf(kod)))
  
 {
%>
<%
try
{
String sql = "update uyeler set sifre=? where email=?";
PreparedStatement ps = connection.prepareStatement(sql);
ps.setString(1, sifre);
ps.setString(2, email);
ps.executeUpdate();
}catch(Exception e)
{
e.printStackTrace();
}
 finally{
        connection.close();
        }

%>
 
 <br><div class="alert success">
  <span class="closebtn" onclick="this.parentElement.style.display='none';">&times;</span> 
  <strong>Başarılı!</strong> Şifre Değiştirildi.
</div>
 <%
 }
else
{

%>
<br><div class="alert">
  <span class="closebtn" onclick="this.parentElement.style.display='none';">&times;</span> 
  <strong>Hata!</strong> Güvenlik kodunu tekrar deneyin.
</div>
<%
    }
}
%>

                       <div class="control-group">
                            <input type="text" class="form-control" id="name" name="kodg" value="<%=sayi%>" 
                                required="required" data-validation-required-message="Boş Bırakılamaz!" readonly/>
                            <p class="help-block text-danger"></p>
                        </div>
                                <div class="control-group">
                            <input type="text" class="form-control" id="name" name="kod"
                                required="required" data-validation-required-message="Boş Bırakılamaz!" placeholder="Güvenlik Kodunu Giriniz"/>
                            <p class="help-block text-danger"></p>
                        </div>
                                 <div class="control-group">
                            <input type="email" class="form-control" id="parola" name="mail" placeholder="E-Posta Adresi"
                                required="required" data-validation-required-message="Boş Bırakılamaz!" />
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
                           <a class="btn btn-success" href="kayit.jsp">Kayıt Ol</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a class="btn btn-danger" href="giris.jsp">Giriş Yap</a>
                        </div>
                    </form>
                </div>
                
            </div>
         <div class="col-lg-4 mb-5 "></div>
        </div>
    </div>
    <!-- Contact End -->
<%@include file="footer.jsp" %>