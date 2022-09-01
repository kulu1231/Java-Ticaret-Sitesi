<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="com.kbhyazilim.Business.CategoryManager,com.kbhyazilim.Entities.Category,java.util.*" %>

<% 
 int katid = Integer.parseInt(request.getParameter("kat_id"));
 Category manager = new Category(katid);
 CategoryManager cm = new CategoryManager();
 cm.delete(manager);
 response.sendRedirect("kategoriler.jsp");
%>
