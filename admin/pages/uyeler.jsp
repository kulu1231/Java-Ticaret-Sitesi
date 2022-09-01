<%@include file="header.jsp" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="com.kbhyazilim.Business.MembersManager,com.kbhyazilim.Entities.Members,java.util.*" %>
 <link href="vendor/datatables/dataTables.bootstrap4.min.css" rel="stylesheet">
 <!-- Begin Page Content -->
                <div class="container-fluid">

                    <!-- Page Heading -->
                    <h1 class="h3 mb-2 text-gray-800">Üyeler</h1>
                  

                    <!-- DataTales Example -->
                    <div class="card shadow mb-4">
                        <div class="card-header py-3">
                           
                        </div>
                        <div class="card-body">
                            <div class="table-responsive">
                                <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
                                    <thead>
                                        <tr>
                                            
                                            <th>Adı</th>
                                            <th>Soyadı</th>
                                            <th>Kullanıcı Adı</th>
                                            
                                            <th>Email</th>
                                            <th>İlçe</th>
                                            <th>Şehir</th>
                                           
                                            <th>Üye Onay</th>
                                            <th>Düzenle</th>
                                            <th>Sil</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <%
                                        MembersManager manager = new MembersManager();
                                        List<Members> liste = manager.select();
                                        for(Members cat:liste)
                                        {
                                        %>
                                        <tr>
                                    
                                    <td><%=cat.getAd()%></td>
                                    <td><%=cat.getSoyad()%></td>
                                    <td><%=cat.getKullaniciadi()%></td>
                                    
                                    <td><%=cat.getEmail()%></td>
                                    <td><%
                                        MembersManager manager3 = new MembersManager();
                                        List<Members> liste3 = manager3.ilceler();
                                       %>
                                     <%
                                        for(Members k:liste3)
                                        {
                                        if(k.getIlceID()== cat.getIlceID())
                                        {
                                            
                                        %>
                                        <%=k.getIlceAdi()%>
                                        <%
                                        }
                                        }
                                        %></td>
                                    <td> <%
                                        MembersManager manager2 = new MembersManager();
                                        List<Members> liste2 = manager2.iller();
                                       %>
                                     <%
                                        for(Members k:liste2)
                                        {
                                        if(k.getIlID()== cat.getIlID())
                                        {
                                            
                                        %>
                                        <%=k.getSehirAdi()%>
                                        <%
                                        }
                                        }
                                        %>
                                    </td>
                                   
                                    <td>
                                        <%
                                        if(cat.getOnay() == 0)
                                        {
                                        %>
                                         <a href='uyeonay.jsp?id=<%=cat.getNo()%>' class='btn btn-warning'>Onayla</a>
                                         <%
                                          }
                                        else
                                            out.print("<a class='btn btn-success'>Onaylandı</a>");
                                       %>
                                    </td>
                                        <td>
                                        <a href="uyeduzenle.jsp?uye_id=<%=cat.getNo()%>" class="btn btn-primary btn-icon-split">
                                        <span class="icon text-white-50">
                                            <i class="fas fa-pen"></i>
                                        </span>
                                        <span class="text">Düzenle</span>
                                    </a>
                                        </td>
                                    <td> 
                                        <a href="uyesil.jsp?uye_id=<%=cat.getNo()%>" class="btn btn-danger btn-icon-split">
                                        <span class="icon text-white-50">
                                            <i class="fas fa-trash"></i>
                                        </span>
                                        <span class="text">Sil</span>
                                    </a>
                                        </td>
                                       <%}%>
                                        </tr> 
                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div>

                </div>
                <!-- /.container-fluid -->


            <!-- End of Main Content -->
<%@include file="footer.jsp" %>
  <script src="vendor/datatables/jquery.dataTables.min.js"></script>
    <script src="vendor/datatables/dataTables.bootstrap4.min.js"></script>

    <!-- Page level custom scripts -->
    <script src="js/demo/datatables-demo.js"></script>


