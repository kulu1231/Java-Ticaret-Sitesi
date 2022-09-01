<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="com.kbhyazilim.Business.MembersManager,com.kbhyazilim.Entities.Members,java.util.*" %>

<% 
int uyeid = Integer.parseInt(request.getParameter("uye_id"));
 Members manager = new Members(uyeid);
 MembersManager cm = new MembersManager();
 cm.delete(manager);
 response.sendRedirect("uyeler.jsp");
%>
