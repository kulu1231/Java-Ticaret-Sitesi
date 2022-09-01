<%@page import ="com.kbhyazilim.Entities.Category,com.kbhyazilim.Business.CategoryManager,java.util.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    int gelen=Integer.parseInt(request.getParameter("katid"));
    String katadi = request.getParameter("katadi");
    Category model = new Category(gelen,katadi);
    CategoryManager guncelle = new CategoryManager();
    guncelle.update(model);
    response.sendRedirect("kategoriler.jsp");
    %>
