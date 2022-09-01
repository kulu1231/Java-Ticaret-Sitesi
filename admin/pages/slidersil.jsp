<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="com.kbhyazilim.Business.SliderManager,com.kbhyazilim.Entities.Slider,java.util.*" %>

<% 
 int sliderid = Integer.parseInt(request.getParameter("slider_id"));
 Slider manager = new Slider(sliderid);
 SliderManager cm = new SliderManager();
 cm.delete(manager);
 response.sendRedirect("resimekle.jsp");
%>
