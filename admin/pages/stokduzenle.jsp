<%@include file="header.jsp" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="com.kbhyazilim.DataAccess.DbHelper"%>
<%@page import="java.sql.*"%>
<%@page import ="com.kbhyazilim.Entities.Stok,com.kbhyazilim.Business.StokManager,java.util.*"%>
<%@page import ="com.kbhyazilim.Entities.Product,com.kbhyazilim.Business.ProductManager,java.util.*"%>

<%
if(session.getAttribute("admin") == null)
{
response.sendRedirect("giris.jsp");
}

    %>

                <div class="container-fluid">

                   
                    <h1 class="h3 mb-4 text-gray-800">Stok Düzenle</h1>
                    <%
request.setCharacterEncoding("utf-8");
int gelenid=Integer.parseInt(request.getParameter("stokID"));
StokManager db=new StokManager();
List<Stok> liste = db.select();

for(Stok c:liste)
{
    if(Integer.valueOf(c.getStokID()).equals(Integer.valueOf(gelenid)))
    {

%>
                    <form method="post" class="user" action="stokguncelle.jsp">
                       
                        
                        
             <div class="form-group">
       <input type="text" class="form-control" name="stokid" value="<%=c.getStokID()%>" readonly/>
   </div> 
      <div class="form-group">
                            <select class="form-control" name="urunid">
                                <%
                                ProductManager pm = new ProductManager();
                                List<Product> urun = pm.select();
                                %>
                               
                                    <%
                                   
                               
                                    for(Product urun2:urun)
                                    {
                                        if(c.getUrunID()== urun2.getUrunID())
                                        {
                                            %>
                                            <option value="<%=urun2.getUrunID()%>"><%=urun2.getUrunAdi()%></option>
                                            <%
                                         }
                                    }
                                   
                                    %>
                                    
                               
                                <%
                                ProductManager kat2 = new ProductManager();
                                List<Product> kategori2 = kat2.select();
                                for(Product kate:kategori2)
                                {
                                %>
                                <option value="<%=kate.getUrunID()%>"><%=kate.getUrunAdi()%></option>
                                <%}%>
                            </select>
                        </div> 
   <div class="form-group">
       <input type="number" class="form-control" name="adet" value="<%=c.getUrunAdet()%>" />
   </div>
    <div class="form-group">
        <select name="birim" class="form-control">
             <%
                                StokManager sm2 = new StokManager();
                                List<Stok> urun3 = sm2.select();
                                %>
                               
                                    <%
                                   
                               
                                    for(Stok urun2:urun3)
                                    {
                                        if(c.getStokID() == urun2.getStokID())
                                        {
                                        %>
                                        <option value="<%=urun2.getUrunBirim()%>"><%=urun2.getUrunBirim()%></option>
                                           <%
                                        }
                                    }
                                   
                                    %>
            <option value="Adet">Adet</option>
            <option value="Paket">Paket</option>
        </select>
   </div>   
        <div class="form-group">
        <select name="kdv" class="form-control">
              <%
                                StokManager sm3 = new StokManager();
                                List<Stok> urun4 = sm3.select();
                                %>
                               
                                    <%
                                   
                               
                                    for(Stok urun2:urun4)
                                    {
                                        if(c.getStokID() == urun2.getStokID())
                                        {
                                        %>
                                        <option value="<%=urun2.getUrunKDV()%>">%<%=urun2.getUrunKDV()%> KDV</option>
                                           <%
                                        }
                                    }
                                   
                                    %>
            <option value="1">%1 KDV</option>
            <option value="8">%8 KDV</option>
            <option value="18">%18 KDV</option>
        </select>
   </div>   
   <div class="form-group">
       <input class="btn btn-primary" type="submit" value="Stok Güncelle" /> 
   </div>
                    </form>
   
                </div>
<%

    }}%>
    <%
    
    %>
    
<%@include file="footer.jsp" %>



