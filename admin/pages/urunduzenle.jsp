<%@include file="header.jsp" %>
 <%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="com.kbhyazilim.DataAccess.DbHelper"%>
<%@page import="java.sql.*"%>
<%@page import ="com.kbhyazilim.Entities.Product,com.kbhyazilim.Business.ProductManager,java.util.*"%>
<%@page import ="com.kbhyazilim.Entities.Category,com.kbhyazilim.Business.CategoryManager,java.util.*"%>
 <%@page import ="com.kbhyazilim.Entities.SubCategory,com.kbhyazilim.Business.SubCategoryManager,java.util.*"%>


<% response.setCharacterEncoding("UTF-8");%>


 <%

if(session.getAttribute("admin") == null)
{
response.sendRedirect("giris.jsp");
}

    %>

                <div class="container-fluid">

                   
                    <h1 class="h3 mb-4 text-gray-800">Ürün Düzenle</h1>
                    <%
request.setCharacterEncoding("utf-8");
int gelenid=Integer.parseInt(request.getParameter("urun_id"));
ProductManager db=new ProductManager();
List<Product> liste = db.select();

for(Product c:liste)
{
    if(Integer.valueOf(c.getUrunID()).equals(Integer.valueOf(gelenid)))
    {

%>
                    <form method="post" class="user" action="urunguncelle.jsp?urun_id=<%=c.getUrunID()%>">
                       
                        
                        
             <div class="form-group">
       <input type="text" class="form-control" name="urunadi" value="<%=c.getUrunAdi()%>"/>
   </div>          
   <div class="form-group">
       <input type="text" class="form-control" name="urunfiyat" value="<%=c.getUrunFiyat()%>" />
   </div>
    <div class="form-group">
                          <textarea name="urunaciklama" style="height:400px" id="summernote">
                            <%=c.getUrunAciklama()%>
                        </textarea>
           </div>
    <div class="form-group">
       <input type="color" class="form-control" name="urunrenk" value="<%=c.getUrunRenk()%>"  />
   </div>
    <div class="form-group">
                            <select class="form-control" name="katid">
                                 <%
                                CategoryManager kat = new CategoryManager();
                                List<Category> kategori = kat.select();
                                %>
                               
                                    <%
                                   
                               
                                    for(Category kate2:kategori)
                                    {
                                        if(c.getKatNo() == kate2.getKat_id())
                                        {
                                            %>
                                            <option value="<%=kate2.getKat_id()%>"><%=kate2.getKat_adi()%></option>
                                            <%
                                         }
                                    }
                                   
                                    %>
                                    
                                <%
                                CategoryManager kat2 = new CategoryManager();
                                List<Category> kategori2 = kat2.select();
                                
                                %>
                                
                                <%
                                for(Category kate:kategori2)
                                {
                                %>
                                <option value="<%=kate.getKat_id()%>"><%=kate.getKat_adi()%></option>
                                <%}%>
                            </select>
                        </div>
                             <div class="form-group">
                            <select class="form-control" name="altkatid">
                                <%
                                SubCategoryManager altkat = new SubCategoryManager();
                                List<SubCategory> altkategori = altkat.select();
                                %>
                                 <%
                                   
                               
                                    for(SubCategory kate2:altkategori)
                                    {
                                        if(c.getAltNo() == kate2.getAltid())
                                        {
                                            %>
                                            <option value="<%=kate2.getAltid()%>"><%=kate2.getAltadi()%></option>
                                            <%
                                         }
                                    }
                                   
                                    %>
                                
                                
                                <%
                                for(SubCategory kate:altkategori)
                                {
                                    
                                %>
                                <option value="<%=kate.getAltid()%>"><%=kate.getAltadi()%></option>
                                <%}%>
                            </select>
                        </div>
   <div class="form-group">
       <input class="btn btn-primary" type="submit" value="Ürün Güncelle" /> 
   </div>
                    </form>
 
                </div>
<%

    }}%>
    
    
<%@include file="footer.jsp" %>



