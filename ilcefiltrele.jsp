<%@page import="com.kbhyazilim.DataAccess.DbHelper"%>
<%@page import="java.sql.*"%>
<% response.setCharacterEncoding("UTF-8");%>
<%!
public Connection baglan;
DbHelper dbHelper= new DbHelper();
%>

<%
String sehir = request.getParameter("il");
Class.forName("com.mysql.jdbc.Driver");
baglan = dbHelper.baglan();
Statement statement = baglan.createStatement();
ResultSet resultSet = statement.executeQuery("select * from ilceler where sehirID='"+sehir+"'");
while(resultSet.next())
{
    out.print("<option value='"+resultSet.getInt("ilceID")+"' >"+resultSet.getString("ilceAdi") +"</option>");
}
%>