<%@include file="header.jsp" %>
 <%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="com.kbhyazilim.DataAccess.DbHelper"%>
<%@page import="java.sql.*"%>
 <%@page import ="com.kbhyazilim.Entities.SubCategory,com.kbhyazilim.Business.SubCategoryManager,java.util.*"%>
 <%@page import ="com.kbhyazilim.Entities.Category,com.kbhyazilim.Business.CategoryManager,java.util.*"%>

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

                   
                    <h1 class="h3 mb-4 text-gray-800">Alt Kategori Düzenle</h1>
                    <%
request.setCharacterEncoding("utf-8");
int gelenid=Integer.parseInt(request.getParameter("altkat_id"));
SubCategoryManager db=new SubCategoryManager();
List<SubCategory> liste = db.select();

for(SubCategory c:liste)
{
    if(Integer.valueOf(c.getAltid()).equals(Integer.valueOf(gelenid)))
    {

%>
                    <form method="post" class="user" action="altkategoriguncelle.jsp">
                       
                        
                        
             <div class="form-group">
       <input type="text" class="form-control" name="altkatid" value="<%=c.getAltid()%>" readonly/>
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
                                        if(c.getKat_id() == kate2.getKat_id())
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
                                for(Category kate:kategori2)
                                {
                                %>
                                <option value="<%=kate.getKat_id()%>"><%=kate.getKat_adi()%></option>
                                <%}%>
                            </select>
                        </div> 
   <div class="form-group">
       <input type="text" class="form-control" name="altkatadi" value="<%=c.getAltadi() %>" />
   </div>
   
   <div class="form-group">
       <input class="btn btn-primary" type="submit" value="Alt Kategori Güncelle" /> 
   </div>
                    </form>
   
                </div>
<%

    }}%>
    
    
<%@include file="footer.jsp" %>



