<%@include file="header.jsp" %>
 <%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="com.kbhyazilim.DataAccess.DbHelper"%>
<%@page import="java.sql.*"%>
 <%@page import ="com.kbhyazilim.Entities.Product,com.kbhyazilim.Business.ProductManager,java.util.*"%>
<% response.setCharacterEncoding("UTF-8");%>



                <div class="container-fluid">

                   
                    <h1 class="h3 mb-4 text-gray-800">Resim Düzenle</h1>
                    <%
request.setCharacterEncoding("utf-8");
int gelenid=Integer.parseInt(request.getParameter("id"));
ProductManager db=new ProductManager();
List<Product> liste = db.resimler();

for(Product c:liste)
{
    if(Integer.valueOf(c.getResimID()).equals(Integer.valueOf(gelenid)))
    {

%>
                    <form method="post" class="user" action="resimguncelle.jsp">
                       
                        
                        
             <div class="form-group">
       <input type="text" class="form-control" name="resimid" value="<%=c.getResimID()%>" readonly/>
   </div>          
   <div class="form-group">
       <input type="text" class="form-control" name="urunadi" value="<%=c.getUrunAdi() %>" readonly/>
   </div>
   <div class="form-group">
       <img  src="../../img/<%=c.getResim() %>" width="100" height="100" alt="Resim" />
   </div>
    <div class="form-group">
       <input type="text" class="form-control" name="durum" value="<%=c.getResim_durum()%>" />
   </div>
   <div class="form-group">
       <input class="btn btn-primary" type="submit" value="Resim Durum Güncelle" /> 
   </div>
                    </form>
   
                </div>
<%

    }}%>
    
    
<%@include file="footer.jsp" %>



