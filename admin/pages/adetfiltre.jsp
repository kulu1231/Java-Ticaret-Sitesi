<%@page import="com.kbhyazilim.DataAccess.DbHelper"%>
<%@page import="java.sql.*"%>
<%@page import ="com.kbhyazilim.Entities.Stok,com.kbhyazilim.Business.StokManager,java.util.*"%>

<% response.setCharacterEncoding("UTF-8");%>
<%!
public Connection baglan;
DbHelper dbHelper= new DbHelper();
%>

<%
String urun = request.getParameter("urunid");
StokManager sm = new StokManager();
List<Stok> liste = sm.selectById(Integer.valueOf(urun));
for(Stok stoks:liste)
{
    
    out.print("<input class='form-control' placeholder='1-"+stoks.getUrunAdet()+"' type='number' name='adet' min='1' max='"+stoks.getUrunAdet()+"'>");
   
}
%>