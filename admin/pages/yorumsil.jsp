<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="com.kbhyazilim.Business.CommentManager,com.kbhyazilim.Entities.Comment,java.util.*" %>

<% 
 int yorumid = Integer.parseInt(request.getParameter("yorum_id"));
 Comment manager = new Comment(yorumid);
 CommentManager cm = new CommentManager();
 cm.delete(manager);
 response.sendRedirect("yorumlar.jsp");
%>
