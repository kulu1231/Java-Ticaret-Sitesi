<%@include file="header.jsp" %>
 <%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="com.kbhyazilim.DataAccess.DbHelper"%>
<%@page import="java.sql.*"%>
<%@page import ="com.kbhyazilim.Entities.Members,com.kbhyazilim.Business.MembersManager,java.util.*"%>
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

                   
                    <h1 class="h3 mb-4 text-gray-800">Üye Düzenle</h1>
                    <%
request.setCharacterEncoding("utf-8");
int gelenid=Integer.parseInt(request.getParameter("uye_id"));
MembersManager db=new MembersManager();
List<Members> liste = db.select();

for(Members c:liste)
{
    if(Integer.valueOf(c.getNo()).equals(Integer.valueOf(gelenid)))
    {

%>
                    <form method="post" class="user" action="uyeguncelle.jsp?uye_id=<%=c.getNo()%>">
                       
                        
                        
             <div class="form-group">
       <input type="text" class="form-control" name="ad" value="<%=c.getAd()%>"/>
   </div>          
   <div class="form-group">
       <input type="text" class="form-control" name="soyad" value="<%=c.getSoyad()%>" />
   </div>
    <div class="form-group">
       <input type="text" class="form-control" name="kuladi" value="<%=c.getKullaniciadi()%>" />
   </div>
    <div class="form-group">
       <input type="password" class="form-control" name="sifre" value="<%=c.getSifre()%>" />
   </div>
    <div class="form-group">
       <input type="email" class="form-control" name="email" value="<%=c.getEmail()%>" />
   </div>
   
  
                             <div class="form-group">
                            <select class="form-control" name="il">
                                <%
                                MembersManager uye = new MembersManager();
                                List<Members> uyelist = uye.iller();
                                %>
                                 <%
                                   
                               
                                    for(Members kate2:uyelist)
                                    {
                                        if(c.getIlID() == kate2.getIlID())
                                        {
                                            %>
                                            <option value="<%=kate2.getIlID()%>"><%=kate2.getSehirAdi()%></option>
                                            <%
                                         }
                                    }
                                   
                                    %>
                                
                                
                                <%
                                for(Members kate:uyelist)
                                {
                                    
                                %>
                                <option value="<%=kate.getIlID()%>"><%=kate.getSehirAdi()%></option>
                                <%}%>
                            </select>
                        </div>
                            
                            
                             <div class="form-group">
                            <select class="form-control" name="ilce">
                                <%
                                MembersManager uye2 = new MembersManager();
                                List<Members> uyelist2 = uye2.ilceler();
                                %>
                                 <%
                                   
                               
                                    for(Members kate2:uyelist2)
                                    {
                                        if(c.getIlceID() == kate2.getIlceID())
                                        {
                                            %>
                                            <option value="<%=kate2.getIlceID()%>"><%=kate2.getIlceAdi()%></option>
                                            <%
                                         }
                                    }
                                   
                                    %>
                                
                                
                                <%
                                for(Members kate:uyelist2)
                                {
                                    
                                %>
                                <option value="<%=kate.getIlceID()%>"><%=kate.getIlceAdi()%></option>
                                <%}%>
                            </select>
                        </div>
   <div class="form-group">
       <input class="btn btn-primary" type="submit" value="Üye Güncelle" /> 
   </div>
                    </form>
 
                </div>
<%

    }}%>
    
    
<%@include file="footer.jsp" %>



