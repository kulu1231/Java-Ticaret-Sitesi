<%@include file="header.jsp" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="com.kbhyazilim.Business.CommentManager,com.kbhyazilim.Entities.Comment,java.util.*" %>
<%@page import="com.kbhyazilim.Business.ProductManager,com.kbhyazilim.Entities.Product,java.util.*" %>
 <link href="vendor/datatables/dataTables.bootstrap4.min.css" rel="stylesheet">

 <!-- Begin Page Content -->
                <div class="container-fluid">

                    <!-- Page Heading -->
                    <h1 class="h3 mb-2 text-gray-800">Gelen Yorumlar</h1>
                  

                    <!-- DataTales Example -->
                    <div class="card shadow mb-4">
                        <div class="card-header py-3">
                           
                        </div>
                        <div class="card-body">
                            <div class="table-responsive">
                                <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
                                    <thead>
                                        <tr>
                                           
                                            <th>Ad Soyad</th>
                                            <th>Mesaj</th>
                                            <th>Tarih</th>
                                            <th>Ürün</th>
                                            <th>Onay</th>
                                            <th></th>
                                            <th>Sil</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <%
                                        CommentManager manager = new CommentManager();
                                        List<Comment> liste = manager.selectAll();
                                        ProductManager manager2 = new ProductManager();
                                        List<Product> liste2 = manager2.select();
                                        for(Comment yorum:liste)
                                        {
                                         for(Product urun:liste2)
                                        {
                                         
                                          if(yorum.getUrunID() == urun.getUrunID())
                                          {
                                          
                                        %>
                                        <tr>
                                    
                                  <td>
                                     <%=yorum.getYorumAdSoyad()%>
                                  </td>
                                      <td><%=yorum.getYorumIcerik()%></td>
                                      <td><%=yorum.getYorumTarih()%></td>
                                       <td>
                                         
                                          <%=urun.getUrunAdi()%>
                                         
                                      </td>
                                      <td>
                                          <%
                                          if(yorum.getYorumOnay()==1)
                                          {
                                          %>
                                          <button class="btn btn-success">Onaylandı</button>
                                          <%
                                          }else
                                            {
                                          %>
                                           <button class="btn btn-danger">Onay Bekliyor</button>
                                           <%}%>
                                      </td>
                                     <td>
                                          <%
                                          if(yorum.getYorumOnay()==0)
                                          {
                                          %>
                                          <a href="yorumonayla.jsp?yorum_id=<%=yorum.getYorumID()%>" class="btn btn-primary">Onayla</a>
                                          <%
                                          }%>
                                      </td>
                                    <td> 
                                        <a href="yorumsil.jsp?yorum_id=<%=yorum.getYorumID()%>" class="btn btn-danger btn-icon-split">
                                        <span class="icon text-white-50">
                                            <i class="fas fa-trash"></i>
                                        </span>
                                        <span class="text">Sil</span>
                                    </a>
                                        </td>
                                       <%}}}%>
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

