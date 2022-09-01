
<%@include file="header.jsp" %>
 <%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="com.kbhyazilim.DataAccess.DbHelper"%>
<%@page import="java.sql.*"%>
<%@page import ="com.kbhyazilim.Entities.Stok,com.kbhyazilim.Business.StokManager,java.util.*"%>
  <%@page import ="com.kbhyazilim.Entities.Product,com.kbhyazilim.Business.ProductManager,java.util.*"%>
<% response.setCharacterEncoding("UTF-8");%>


                <div class="container-fluid">

                   
                    <h1 class="h3 mb-4 text-gray-800">Stok Ekle</h1>
                    
                    <form method="post" class="user" action="">
                       
                        
                        
                       
   <div class="form-group">
        <select name="urun" class="form-control">
            <%
            ProductManager pm = new ProductManager();
            List<Product> liste = pm.select();
            for(Product urun:liste)
            {
            %>
            <option value="<%=urun.getUrunID()%>"><%=urun.getUrunAdi()%></option>
            <%
                }
            %>
        </select>
   </div>   
   <div class="form-group">
       <input class="form-control" type="number" name="miktar" placeholder="Ürün Miktarı" /> 
   </div>
         <div class="form-group">
        <select name="birim" class="form-control">
            
            <option value="Adet">Adet</option>
            <option value="Paket">Paket</option>
        </select>
   </div>   
        <div class="form-group">
        <select name="kdv" class="form-control">
            
            <option value="1">%1 KDV</option>
            <option value="8">%8 KDV</option>
            <option value="18">%18 KDV</option>
        </select>
   </div>   
   <div class="form-group">
       <input class="btn btn-primary" type="submit" value="Stok Ekle" /> 
   </div>
                    </form>
   <%
request.setCharacterEncoding("utf-8");
String urun = request.getParameter("urun");
String miktar = request.getParameter("miktar");
String birim = request.getParameter("birim");
String kdv = request.getParameter("kdv");

if(urun!= null && miktar!=null && birim!=null && kdv!=null)
{
    StokManager ekle = new StokManager();
    Stok model = new Stok(Integer.valueOf(urun),Integer.valueOf(miktar),birim,Integer.valueOf(kdv));
    boolean kontrol = ekle.stokekle(model);
    if(!kontrol)
    {
        %>
         <br><div class="alert">
  <span class="closebtn" onclick="this.parentElement.style.display='none';">&times;</span> 
  <strong>Hata!</strong> Bu Üründe Stok Var.
</div>
        <%
    }
    else
    {
%>   
<br><div class="alert success">
  <span class="closebtn" onclick="this.parentElement.style.display='none';">&times;</span> 
  <strong>Başarılı!</strong> Stok Eklendi.
</div>
  <%
      }
}
%>
                </div>

<%@include file="footer.jsp" %>



