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
            <h2 class="section-title px-5"><span class="px-2">Bilgileri Güncelle</span></h2>
        </div>
        <div class="row px-xl-5">
            <div class="col-lg-4 mb-5 "></div>
            <div class="col-lg-4 mb-5 ">
                
                <div class="contact-form col">
                    <div id="success"></div>
                    <%
request.setCharacterEncoding("utf-8");
int gelenid=(Integer)session.getAttribute("uyeid");
MembersManager db=new MembersManager();
List<Members> listegetir = db.select();

for(Members c:listegetir)
{
    if(Integer.valueOf(c.getNo()).equals(Integer.valueOf(gelenid)))
    {

%>
                    <form method="post" action="profilguncelle.jsp?uye_id=<%=c.getNo()%>">
                        <div class="control-group">
                            <input type="text" class="form-control" name="ad" id="name" value="<%=c.getAd()%>" placeholder="Adı"
                                required="required" data-validation-required-message="Boş Bırakılamaz!" />
                            <p class="help-block text-danger"></p>
                        </div>
                         <div class="control-group">
                            <input type="text" class="form-control" name="soyad" id="name" value="<%=c.getSoyad()%>" placeholder="Soyadı"
                                required="required" data-validation-required-message="Boş Bırakılamaz!" />
                            <p class="help-block text-danger"></p>
                        </div>
                         <div class="control-group">
                            <input type="text" class="form-control" id="name" name="kuladi" value="<%=c.getKullaniciadi()%>" placeholder="Kullanıcı Adı"
                                required="required" data-validation-required-message="Boş Bırakılamaz!" readonly/>
                            <p class="help-block text-danger"></p>
                        </div>
                        <div class="control-group">
                            <input type="password" class="form-control" id="parola" name="sifre" value="<%=c.getSifre()%>" placeholder="Şifre"
                                required="required" data-validation-required-message="Boş Bırakılamaz!" />
                            <p class="help-block text-danger"></p>
                        </div>
                         <div class="control-group">
                            <input type="email" class="form-control" id="parola" name="email" value="<%=c.getEmail()%>" placeholder="Email"
                                required="required" data-validation-required-message="Boş Bırakılamaz!" />
                            <p class="help-block text-danger"></p>
                        </div>
                         <div class="control-group">
                             <select class="form-control" name="il" id="il">
                                 <%
                                MembersManager uye = new MembersManager();
                                List<Members> uyelist = uye.iller();
                                %>
                                 <%
                                   
                               
                                    for(Members kate2:uyelist)
                                    {
                                        if(c.getIlID() == kate2.getIlID())
                                        {
                                            %>
                                            <option value="<%=kate2.getIlID()%>"><%=kate2.getSehirAdi()%></option>
                                            <%
                                         }
                                    }
                                   
                                    %>
                                
                                
                                <%
                                for(Members kate:uyelist)
                                {
                                    
                                %>
                                <option value="<%=kate.getIlID()%>"><%=kate.getSehirAdi()%></option>
                                <%}%>
                             </select>
                            <p class="help-block text-danger"></p>
                        </div>
                              <div class="control-group">
                             <select class="form-control" name="ilce" id="ilce">
                                 <%
                                MembersManager uye2 = new MembersManager();
                                List<Members> uyelist2 = uye2.ilceler();
                                %>
                                 <%
                                   
                               
                                    for(Members kate2:uyelist2)
                                    {
                                        if(c.getIlceID() == kate2.getIlceID())
                                        {
                                            %>
                                            <option value="<%=kate2.getIlceID()%>"><%=kate2.getIlceAdi()%></option>
                                            <%
                                         }
                                    }
                                   
                                    %>
                                
                                
                                <%
                                for(Members kate:uyelist2)
                                {
                                    
                                %>
                                <option value="<%=kate.getIlceID()%>"><%=kate.getIlceAdi()%></option>
                                <%}%>
                             </select>
                            <p class="help-block text-danger"></p>
                        </div>
                        <div>
                            <button class="btn btn-primary py-2 px-4" type="submit" id="sendMessageButton">
                               Bilgileri Güncelle</button>
                            <p class="help-block text-danger"></p>
                        </div>
                        
                        <div class="control-group">
                           <a class="btn btn-success" href="giris.jsp">Giriş Yap</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a class="btn btn-danger" href="sifremiunuttum.jsp">Şifremi Unuttum</a>
                        </div>
                    </form>
                           <%
                               }}
                           %>
                </div>
                
            </div>
         <div class="col-lg-4 mb-5 "></div>
        </div>
    </div>
    <!-- Contact End -->
<%@include file="footer.jsp" %>