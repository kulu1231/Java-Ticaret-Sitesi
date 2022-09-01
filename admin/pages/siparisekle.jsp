<%@include file="header.jsp" %>
 <%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="com.kbhyazilim.DataAccess.DbHelper"%>
<%@page import="java.sql.*"%>
<%@page import ="com.kbhyazilim.Entities.Order,com.kbhyazilim.Business.OrderManager,java.util.*"%>
<%@page import ="com.kbhyazilim.Entities.Product,com.kbhyazilim.Business.ProductManager,java.util.*"%>
<%@page import ="com.kbhyazilim.Entities.Members,com.kbhyazilim.Business.MembersManager,java.util.*"%>
<%@page import ="com.kbhyazilim.Entities.Stok,com.kbhyazilim.Business.StokManager,java.util.*"%>
<%!
public Connection baglan;
DbHelper dbHelper= new DbHelper();
%>
<% response.setCharacterEncoding("UTF-8");%>
 <script>
	    $(document).ready(function(){
                $('#urunler').change(function(){
                    var urun = $(this).val();
                   
                    $.ajax({
		type: "POST",
		url: "adetfiltre.jsp",
		data:'urunid='+urun,
		success: function(data){
                        $('#adet').empty();
			$('#adet').html(data);
		}
	});
                });
                
            });
	

	</script>

                <div class="container-fluid">

                   
                    <h1 class="h3 mb-4 text-gray-800">Sipariş Ekle</h1>
                    
                    <form method="post" class="user" action="">
                       
                        
                        
                      
   <div class="form-group">
        <select id="urunler" name="urun" class="form-control">
            <option>Ürün Seçiniz</option>
            <%
            ProductManager pm = new ProductManager();
            List<Product> liste = pm.select();
            StokManager sm = new StokManager();
            List<Stok> stoks = sm.select();
            for(Product urun:liste)
            {
                for(Stok stok:stoks)
                {
                    if(stok.getUrunID() == urun.getUrunID() && stok.getUrunAdet()>0)
                    {
            %>
            <option value="<%=urun.getUrunID()%>"><%=urun.getUrunAdi()%> - <%=urun.getUrunFiyat()%> &#8378;</option>
            <%
                }}}
            %>
        </select>
   </div>   
        <div class="form-group">
        <select name="uye" class="form-control">
            <%
            MembersManager uye = new MembersManager();
            List<Members> liste2 = uye.select();
            for(Members uyeler:liste2)
            {
            %>
            <option value="<%=uyeler.getNo()%>"><%=uyeler.getAd()%>&nbsp;<%=uyeler.getSoyad()%></option>
            <%
                }
            %>
        </select>
   </div>   
   <div class="form-group" id="adet">
       <input type="number" min="1" max="1" class="form-control" name="adet" placeholder="Adet"> 
        
   </div>
         
        
   <div class="form-group">
       <input class="btn btn-primary" type="submit" value="Sipariş Ekle" /> 
   </div>
                    </form>
  <%

String urun = request.getParameter("urun");
String musteri = request.getParameter("uye");
String adet = request.getParameter("adet");
String durum = "0";

if(urun!= null && musteri!=null && adet!=null && durum!=null)
{
    OrderManager ekle = new OrderManager();
    Order model = new Order(Integer.valueOf(musteri),Integer.valueOf(urun),Integer.valueOf(adet),Integer.valueOf(durum));
    boolean kontrol = ekle.add(model);
    if(!kontrol)
    {
        %>
         <br><div class="alert">
  <span class="closebtn" onclick="this.parentElement.style.display='none';">&times;</span> 
  <strong>Hata!</strong> Sipariş Eklenemedi.
</div>
        <%
    }
    else
    {
     try{
     String sql = "update stok set UrunMiktar=UrunMiktar-"+Integer.valueOf(adet)+" where UrunKod=?";
     baglan = dbHelper.baglan();
     PreparedStatement ps = baglan.prepareStatement(sql);
     ps.setInt(1, Integer.valueOf(urun));
     ps.executeUpdate();
}catch(Exception e)
{
e.printStackTrace();
}
%>   
<br><div class="alert success">
  <span class="closebtn" onclick="this.parentElement.style.display='none';">&times;</span> 
  <strong>Başarılı!</strong> Sipariş Eklendi.
</div>
  <%
      
      }
}
%>
                </div>
 
<%@include file="footer.jsp" %>



