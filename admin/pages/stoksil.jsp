<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="com.kbhyazilim.Business.StokManager,com.kbhyazilim.Entities.Stok,java.util.*" %>

<% 
 int stokid = Integer.parseInt(request.getParameter("stokID"));
 Stok manager = new Stok(stokid);
 StokManager cm = new StokManager();
 cm.delete(manager);
 response.sendRedirect("stoklar.jsp");
%>
