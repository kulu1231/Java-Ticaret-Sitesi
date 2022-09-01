<%@include file="header.jsp" %>
 <%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="com.kbhyazilim.DataAccess.DbHelper"%>
<%@page import="java.sql.*"%>
 <%@page import ="com.kbhyazilim.Entities.Category,com.kbhyazilim.Business.CategoryManager,java.util.*"%>
<% response.setCharacterEncoding("UTF-8");%>
<%!
public Connection baglan;
DbHelper dbHelper= new DbHelper();
    %>
 <%

if(session.getAttribute("admin") == "")
{
response.sendRedirect("giris.jsp");
}

    %>

                <div class="container-fluid">

                   
                    <h1 class="h3 mb-4 text-gray-800">Kategori Düzenle</h1>
                    <%
request.setCharacterEncoding("utf-8");
int gelenid=Integer.parseInt(request.getParameter("kat_id"));
CategoryManager db=new CategoryManager();
List<Category> liste = db.select();

for(Category c:liste)
{
    if(Integer.valueOf(c.getKat_id()).equals(Integer.valueOf(gelenid)))
    {

%>
                    <form method="post" class="user" action="kategoriguncelle.jsp">
                       
                        
                        
             <div class="form-group">
       <input type="text" class="form-control" name="katid" value="<%=c.getKat_id()%>" readonly/>
   </div>          
   <div class="form-group">
       <input type="text" class="form-control" name="katadi" value="<%=c.getKat_adi() %>" />
   </div>
   
   <div class="form-group">
       <input class="btn btn-primary" type="submit" value="Kategori Güncelle" /> 
   </div>
                    </form>
   
                </div>
<%

    }}%>
    
    
<%@include file="footer.jsp" %>



