<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import ="com.kbhyazilim.Entities.Members,com.kbhyazilim.Business.MembersManager,java.util.*"%>
  <%
   String uyeid = request.getParameter("uye_id");
   String ad = request.getParameter("ad");
   String soyad = request.getParameter("soyad");
   String kuladi = request.getParameter("kuladi");
   String sifre = request.getParameter("sifre");
   String email = request.getParameter("email");
   String il = request.getParameter("il");
   String ilce = request.getParameter("ilce");
   
if(uyeid!=null && ad!=null && soyad!=null && kuladi!=null  && sifre!=null && il!=null && ilce!=null && email!=null)
{
        Members model = new Members(Integer.valueOf(uyeid),ad,soyad,kuladi,sifre,email,Integer.valueOf(il),Integer.valueOf(ilce));
        MembersManager guncelle = new MembersManager();
        guncelle.update(model);
        response.sendRedirect("profilim.jsp");
   }
   %>
