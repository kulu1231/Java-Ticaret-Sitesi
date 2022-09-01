<%@page import="com.kbhyazilim.DataAccess.DbHelper"%>
<%@page import="java.sql.*"%>
<% response.setCharacterEncoding("UTF-8");%>
<%!
public Connection baglan;
DbHelper dbHelper= new DbHelper();
%>

<%
String kategori = request.getParameter("kategori");
Class.forName("com.mysql.jdbc.Driver");
baglan = dbHelper.baglan();
Statement statement = baglan.createStatement();
ResultSet resultSet = statement.executeQuery("select * from altkategoriler where kat_id='"+kategori+"'");
while(resultSet.next())
{
    out.print("<option value='"+resultSet.getInt("altKATID")+"' >"+resultSet.getString("altKatAdi") +"</option>");
}
%>