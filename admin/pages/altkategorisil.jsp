<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="com.kbhyazilim.Business.SubCategoryManager,com.kbhyazilim.Entities.SubCategory,java.util.*" %>

<% 
 int katid = Integer.parseInt(request.getParameter("altkat_id"));
 SubCategory manager = new SubCategory(katid);
 SubCategoryManager cm = new SubCategoryManager();
 cm.delete(manager);
 response.sendRedirect("altkategoriler.jsp");
%>
