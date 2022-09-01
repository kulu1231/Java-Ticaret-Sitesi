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

if(session.getAttribute("admin") == null )
{
response.sendRedirect("giris.jsp");
}

    %>

                <div class="container-fluid">

                   
                    <h1 class="h3 mb-4 text-gray-800">Kategori Ekle</h1>
                    
                    <form method="post" class="user" action="">
                       
                        
                        
                       
   <div class="form-group">
       <input type="text" class="form-control" name="katadi" />
   </div>
   
   <div class="form-group">
       <input class="btn btn-primary" type="submit" value="Kategori Ekle" /> 
   </div>
                    </form>
   
                </div>
<%
request.setCharacterEncoding("utf-8");
String katAdi=request.getParameter("katadi");
Category ekle=new Category(katAdi);
CategoryManager cm=new CategoryManager();
cm.add(ekle);
%>
<%@include file="footer.jsp" %>



