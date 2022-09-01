<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="com.kbhyazilim.Business.MembersManager,com.kbhyazilim.Entities.Members,java.util.*" %>

<% 
 int uye = Integer.parseInt(request.getParameter("id"));
 Members manager = new Members(uye);
 MembersManager cm = new MembersManager();
 cm.onayla(manager);
 response.sendRedirect("uyeler.jsp");
%>
