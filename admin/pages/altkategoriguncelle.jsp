<%@page import ="com.kbhyazilim.Entities.SubCategory,com.kbhyazilim.Business.SubCategoryManager,java.util.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    int gelen=Integer.parseInt(request.getParameter("altkatid"));
    String altkatadi = request.getParameter("altkatadi");
     int katid=Integer.parseInt(request.getParameter("katid"));
    SubCategory model = new SubCategory(gelen,altkatadi,katid);
    SubCategoryManager guncelle = new SubCategoryManager();
    guncelle.update(model);
    response.sendRedirect("altkategoriler.jsp");
    %>
