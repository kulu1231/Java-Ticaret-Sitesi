<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="com.kbhyazilim.Business.OrderManager,com.kbhyazilim.Entities.Order,java.util.*" %>

<% 
 int siparis = Integer.parseInt(request.getParameter("id"));
 Order manager = new Order(siparis);
 OrderManager cm = new OrderManager();
 cm.arttir(manager);
 response.sendRedirect("siparisler.jsp");
%>
