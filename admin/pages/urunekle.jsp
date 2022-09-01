<%@include file="header.jsp" %>
 <%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="com.kbhyazilim.DataAccess.DbHelper"%>

<%@page import="java.sql.*"%>
<%@ page import="java.io.*" %>


<% response.setCharacterEncoding("UTF-8");%>
<%!
public Connection baglan;
DbHelper dbHelper= new DbHelper();
    %>
 <%

if(session.getAttribute("admin") == null)
{
response.sendRedirect("giris.jsp");
}

    %>

                <div class="container-fluid">

                   
                    <h1 class="h3 mb-4 text-gray-800">Ürün Ekle</h1>
                    
                    <form method="post" class="user" action="urunekleKontrol.jsp">
                        <div class="form-group">
                            <input type="text" class="form-control" name="urunadi" placeholder="Ürün Adı" />
                        </div>
                        <div class="form-group">
                            <input type="number" class="form-control" name="urunfiyat" placeholder="Ürün Fiyatı" min="0" />
                        </div>
                         <div class="form-group">
                          <textarea name="urunaciklama" style="height:400px" id="summernote">
                            Ürün Açıklama
                        </textarea>
                        </div>
                         <div class="form-group">
                            <input type="color" class="form-control" name="urunrenk" placeholder="Ürün Rengi" />
                        </div>
                        <div class="form-group">
                            <select class="form-control" id="kategori" name="kategori">
                                <option>Kategori Seçiniz.</option>
      <%

   
   try
   {
       Class.forName("com.mysql.jdbc.Driver");
       baglan = dbHelper.baglan();
       Statement statement = baglan.createStatement();
       ResultSet resultSet = statement.executeQuery("Select * from kategoriler");
       while(resultSet.next())
       {
           out.print("<option value='"+resultSet.getInt("katID")+"'>"+resultSet.getString("KatAdi")+"</option>");
           
       }
   }catch(SQLException e)
   {
       e.printStackTrace();
   }
  finally{
       baglan.close();
       
   }
   %>
                                
                            </select>
    
                        </div>
                        <div class="form-group">
                            <!-- Contact Form Begin -->
	<script>
	    $(document).ready(function(){
                $('#kategori').change(function(){
                    var kat = $(this).val();
                   
                    $.ajax({
		type: "POST",
		url: "altkategorifiltre.jsp",
		data:'kategori='+kat,
		success: function(data){
		    
			$("#altkategori").html(data);
		}
	});
                });
                
            });
	

	</script>
                            <div class="form-group">
                            <select class="form-control" id="altkategori" name="altkategori">
                                <option>Önce Kategori Seçin...</option>
                                
                            </select>
    
                        </div>
                           
   
   <div class="form-group">
       <input class="btn btn-primary" type="submit" value="Ekle" /> 
   </div>
                    </form>
   
                </div>



<%@include file="footer.jsp" %>



