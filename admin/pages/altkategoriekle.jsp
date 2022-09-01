<%@include file="header.jsp" %>
 <%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="com.kbhyazilim.DataAccess.DbHelper"%>
<%@page import="java.sql.*"%>
 <%@page import ="com.kbhyazilim.Entities.Category,com.kbhyazilim.Business.CategoryManager,java.util.*"%>
 <%@page import ="com.kbhyazilim.Entities.SubCategory,com.kbhyazilim.Business.SubCategoryManager,java.util.*"%>

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

                   
                    <h1 class="h3 mb-4 text-gray-800">Alt Kategori Ekle</h1>
                    
                    <form method="post" class="user" action="">
                       
                        
                        
                        <div class="form-group">
                            <select class="form-control" name="katid">
                                <%
                                CategoryManager kat = new CategoryManager();
                                List<Category> kategori = kat.select();
                                for(Category kate:kategori)
                                {
                                %>
                                <option value="<%=kate.getKat_id()%>"><%=kate.getKat_adi()%></option>
                                <%}%>
                            </select>
                        </div>               
   <div class="form-group">
       <input type="text" class="form-control" name="altkatadi" />
   </div>
   
   <div class="form-group">
       <input class="btn btn-primary" type="submit" value="Alt Kategori Ekle" /> 
   </div>
                    </form>
   
                </div>
<%
request.setCharacterEncoding("utf-8");
String altkatAd=request.getParameter("altkatadi");
String katid=request.getParameter("katid");
if(altkatAd!=null && katid!=null)
{
SubCategory ekle=new SubCategory(altkatAd,Integer.valueOf(katid));
SubCategoryManager cm=new SubCategoryManager();
cm.add(ekle);
}
%>
<%@include file="footer.jsp" %>



