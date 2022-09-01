<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import ="com.kbhyazilim.Entities.Product,com.kbhyazilim.Business.ProductManager,java.util.*"%>
 <%@page import ="com.kbhyazilim.Entities.Members,com.kbhyazilim.Business.MembersManager,java.util.*"%>

<%@include file="header.jsp" %>

   <script>
	    $(document).ready(function(){
                $('#il').change(function(){
                    var il = $(this).val();
                   
                    $.ajax({
		type: "POST",
		url: "ilcefiltrele.jsp",
		data:'il='+il,
		success: function(data){
		    
			$("#ilce").html(data);
		}
	});
                });
                
            });
	

	</script>
    
    <!-- Contact Start -->
    <div class="container-fluid pt-5">
        <div class="text-center mb-4">
            <h2 class="section-title px-5"><span class="px-2">Kayıt Ol</span></h2>
        </div>
        <div class="row px-xl-5">
            <div class="col-lg-4 mb-5 "></div>
            <div class="col-lg-4 mb-5 ">
                
                <div class="contact-form col">
                    <div id="success"></div>
                    <form method="post" action="">
                           <%
                            String adi=request.getParameter("ad");
                            String soyadi=request.getParameter("soyad");
                            String kullaniciadi=request.getParameter("kuladi");
                            String sifre=request.getParameter("sifre");
                            String email=request.getParameter("email");
                            String il=request.getParameter("il");
                            String ilce=request.getParameter("ilce");
                            Date tarih = new Date();
                            int onay = 0;
                             
                        if(adi !=null && soyadi !=null && kullaniciadi !=null && email !=null && sifre !=null && il !=null && ilce !=null)
                         {
                            Members model = new Members (adi,soyadi,kullaniciadi,sifre,email,Integer.parseInt(ilce),Integer.parseInt(il),String.valueOf(tarih.toLocaleString()),onay);
                            MembersManager ekle = new MembersManager();
                            boolean kontrol = ekle.add(model);
                            
                          if(!kontrol)
    {
        %>
         <br><div class="alert">
  <span class="closebtn" onclick="this.parentElement.style.display='none';">&times;</span> 
  <strong>Hata!</strong> Kullanıcı Adı Kullanılıyor.
</div>
        <%
    }
    else
    {
%>   
<br><div class="alert success">
  <span class="closebtn" onclick="this.parentElement.style.display='none';">&times;</span> 
  <strong>Başarılı!</strong> Kayıt Eklendi.
</div>
  <%
      }
}
%>
                        <div class="control-group">
                            <input type="text" class="form-control" name="ad" id="name" placeholder="Adı"
                                required="required" data-validation-required-message="Boş Bırakılamaz!" />
                            <p class="help-block text-danger"></p>
                        </div>
                         <div class="control-group">
                            <input type="text" class="form-control" name="soyad" id="name" placeholder="Soyadı"
                                required="required" data-validation-required-message="Boş Bırakılamaz!" />
                            <p class="help-block text-danger"></p>
                        </div>
                         <div class="control-group">
                            <input type="text" class="form-control" id="name" name="kuladi" placeholder="Kullanıcı Adı"
                                required="required" data-validation-required-message="Boş Bırakılamaz!" />
                            <p class="help-block text-danger"></p>
                        </div>
                        <div class="control-group">
                            <input type="password" class="form-control" id="parola" name="sifre" placeholder="Şifre"
                                required="required" data-validation-required-message="Boş Bırakılamaz!" />
                            <p class="help-block text-danger"></p>
                        </div>
                         <div class="control-group">
                            <input type="email" class="form-control" id="parola" name="email" placeholder="Email"
                                required="required" data-validation-required-message="Boş Bırakılamaz!" />
                            <p class="help-block text-danger"></p>
                        </div>
                         <div class="control-group">
                             <select class="form-control" name="il" id="il">
                                 <option>Şehir Seçiniz...</option>
                                  <%
                                        MembersManager manager = new MembersManager();
                                        List<Members> iller = manager.iller();
                                        for(Members ill:iller)
                                        {
                                        %>
                                        <option value="<%=ill.getIlID()%>"><%=ill.getSehirAdi()%></option>
                                        <%
                                        }
                                        %>
                             </select>
                            <p class="help-block text-danger"></p>
                        </div>
                              <div class="control-group">
                             <select class="form-control" name="ilce" id="ilce">
                                <option>Önce Şehir Seçin...</option>
                             </select>
                            <p class="help-block text-danger"></p>
                        </div>
                        <div>
                            <button class="btn btn-primary py-2 px-4" type="submit" id="sendMessageButton">
                               Kayıt Ol</button>
                            <p class="help-block text-danger"></p>
                        </div>
                        
                        <div class="control-group">
                           <a class="btn btn-success" href="giris.jsp">Giriş Yap</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a class="btn btn-danger" href="sifremiunuttum.jsp">Şifremi Unuttum</a>
                        </div>
                    </form>
                           
                </div>
                
            </div>
         <div class="col-lg-4 mb-5 "></div>
        </div>
    </div>
    <!-- Contact End -->
<%@include file="footer.jsp" %>