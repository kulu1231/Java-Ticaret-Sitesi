<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
session.setAttribute("login","false");
session.setAttribute("kuladi","");
session.invalidate();
response.sendRedirect("giris.jsp");

%>
