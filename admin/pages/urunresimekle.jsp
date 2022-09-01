<%@include file="header.jsp" %>
 <%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="com.kbhyazilim.DataAccess.DbHelper"%>
<%@page import="java.sql.*"%>
 <%@page import ="com.kbhyazilim.Entities.Slider,com.kbhyazilim.Business.SliderManager,java.util.*"%>
  <%@page import ="com.kbhyazilim.Entities.Product,com.kbhyazilim.Business.ProductManager,java.util.*"%>
<% response.setCharacterEncoding("UTF-8");%>

 <%

if(session.getAttribute("admin") == null)
{
response.sendRedirect("giris.jsp");
}

    %>

                <div class="container-fluid">

                   
                    <h1 class="h3 mb-4 text-gray-800">Resim Ekle</h1>
                    
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
       <input type="file" class="form-control-file" name="resim" />
   </div>
   
   <div class="form-group">
       <input class="btn btn-primary" type="submit" value="Resim Ekle" /> 
   </div>
                    </form>
   
                </div>
<%
request.setCharacterEncoding("utf-8");
String resim=request.getParameter("resim");
String urunid = request.getParameter("urun");
if(resim != null && urunid != null)
{
Product ekle=new Product(Integer.valueOf(urunid),resim);
ProductManager cm=new ProductManager();
cm.resimekle(ekle);
}
%>
<%@include file="footer.jsp" %>



