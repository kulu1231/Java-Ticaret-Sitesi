<%@include file="header.jsp" %>
<%@page import="java.util.Base64"%>
 <%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="com.kbhyazilim.DataAccess.DbHelper"%>
<%@page import="java.sql.*"%>
<%@page import="com.kbhyazilim.FileUpload.*"%>
 <%@page import ="com.kbhyazilim.Entities.Slider,com.kbhyazilim.Business.SliderManager,java.util.*"%>
 <%@ page import = "java.io.*,java.util.*, javax.servlet.*" %>
<%@ page import = "javax.servlet.http.*" %>
<%@ page import = "org.apache.commons.fileupload.*" %>
<%@ page import = "org.apache.commons.fileupload.disk.*" %>
<%@ page import = "org.apache.commons.fileupload.servlet.*" %>
<%@ page import = "org.apache.commons.io.output.*" %>

<% response.setCharacterEncoding("UTF-8");%>



                <div class="container-fluid">

                   
                    <h1 class="h3 mb-4 text-gray-800">Resim Ekle</h1>
                    
                    <form method="post" class="user" action = "">
                       
                        
                        
                       
   <div class="form-group">
       <input type="file" class="form-control-file" name="resim" />
   </div>
   
   <div class="form-group">
       <input class="btn btn-primary" type="submit" value="Resim Ekle" /> 
   </div>
                    </form>
                     <div class="card shadow mb-4">
                        <div class="card-header py-3">
                           
                        </div>
                        <div class="card-body">
                            <div class="table-responsive">
                                <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
                                    <thead>
                                        <tr>
                                            <th>#</th>
                                            <th>Resim</th>
                                            <th>Durum</th>
                                            <th>Sil</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <%
                                        SliderManager manager = new SliderManager();
                                        List<Slider> liste = manager.select();
                                        for(Slider cat:liste)
                                        {
                                        %>
                                        <tr>
                                    <td><%=cat.getSlider_id()%></td>
                                    <td><img width="50" height="50" src="../../assets/img/<%=cat.getSlider_adi()%>"></td>
                                       <td><%=cat.getSlider_durum()%></td>
                                    <td> 
                                        <a href="slidersil.jsp?slider_id=<%=cat.getSlider_id()%>" class="btn btn-danger btn-icon-split">
                                        <span class="icon text-white-50">
                                            <i class="fas fa-trash"></i>
                                        </span>
                                        <span class="text">Sil</span>
                                    </a>
                                        </td>
                                       <%}%>
                                        </tr> 
                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div>
                </div>
<%
request.setCharacterEncoding("utf-8");
String resim=request.getParameter("resim");
Slider ekle=new Slider(resim);
SliderManager cm=new SliderManager();
cm.add(ekle);

%>
<%@include file="footer.jsp" %>



