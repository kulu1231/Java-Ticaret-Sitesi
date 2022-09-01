       
<%@page import="java.text.SimpleDateFormat"%>
<%@include file="header.jsp" %>
 <%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="com.kbhyazilim.DataAccess.DbHelper"%>
<%@page import="java.sql.*,java.util.Date"%>
 <%@page import ="com.kbhyazilim.Entities.Members,com.kbhyazilim.Business.MembersManager,java.util.*"%>

<% response.setCharacterEncoding("UTF-8");%>
 <%

if(session.getAttribute("admin") == null)
{
response.sendRedirect("giris.jsp");
}

    %>
    	<script>
	    $(document).ready(function(){
                $('#iller').change(function(){
                    var il = $(this).val();
                   
                    $.ajax({
		type: "POST",
		url: "ilcefiltrele.jsp",
		data:'il='+il,
		success: function(data){
		    
			$("#ilceadi").html(data);
		}
	});
                });
                
            });
	

	</script>
                <div class="container-fluid">

                   
                    <h1 class="h3 mb-4 text-gray-800">Üye Ekle</h1>
                    
                    <form method="post" class="user" action="">
                       
                        
                        
                       
   <div class="form-group">
       <input type="text" class="form-control" name="ad" placeholder="Adı" />
   </div>
    <div class="form-group">
       <input type="text" class="form-control" name="soyad" placeholder="Soyadı"/>
   </div>
    <div class="form-group">
       <input type="text" class="form-control" name="kuladi" placeholder="Kullanıcı Adı"/>
   </div>
   <div class="form-group">
       <input type="text" class="form-control" name="sifre" placeholder="Parola" />
   </div>                     
   <div class="form-group">
   
    <div class="form-group">
       <input type="text" class="form-control" name="mail" placeholder="Mail Adresi" />
   </div>   
       <div class="form-group">
       <select class="form-control" name="il" id="iller">
           <%
                                        MembersManager manager = new MembersManager();
                                        List<Members> liste = manager.iller();
                                        for(Members il:liste)
                                        {
                                        %>
                                        <option value="<%=il.getIlID()%>"><%=il.getSehirAdi()%></option>
                                        <%
                                        }
                                        %>
       </select>
       
   </div> 
    <div class="form-group">
       <select class="form-control" name="ilcead" id="ilceadi">
           <option>Önce Şehir Seçin...</option>
       </select>
   </div>   
       
       
       
       
       
       <input class="btn btn-primary" type="submit" value="Üye ekle" /> 
   </div>
                    </form>
   <%
                            String adi=request.getParameter("ad");
                            String soyadi=request.getParameter("soyad");
                            String kullaniciadi=request.getParameter("kuladi");
                            String sifre=request.getParameter("sifre");
                            String email=request.getParameter("mail");
                            String iller=request.getParameter("il");
                            String ilceadi=request.getParameter("ilcead");
                            Date tarih = new Date();
                            int onay = 0;
                             
                        if(adi !=null && soyadi !=null && kullaniciadi !=null && email !=null && sifre !=null && iller !=null && ilceadi !=null)
                         {
                            Members model = new Members (adi,soyadi,kullaniciadi,sifre,email,Integer.parseInt(ilceadi),Integer.parseInt(iller),String.valueOf(tarih.toLocaleString()),onay);
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
                </div>

<%@include file="footer.jsp" %>