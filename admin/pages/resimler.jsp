<%@include file="header.jsp" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="com.kbhyazilim.Business.OrderManager,com.kbhyazilim.Entities.Order,java.util.*" %>
<%@page import="com.kbhyazilim.Business.ProductManager,com.kbhyazilim.Entities.Product,java.util.*" %>
<%@page import="com.kbhyazilim.Business.MembersManager,com.kbhyazilim.Entities.Members,java.util.*" %>

 <link href="vendor/datatables/dataTables.bootstrap4.min.css" rel="stylesheet">

 <!-- Begin Page Content -->
                <div class="container-fluid">

                    <!-- Page Heading -->
                    <h1 class="h3 mb-2 text-gray-800">Resimler</h1>
                  

                    <!-- DataTales Example -->
                    <div class="card shadow mb-4">
                        <div class="card-header py-3">
                           
                        </div>
                        <div class="card-body">
                            <div class="table-responsive">
                                <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
                                    <thead>
                                        <tr>
                                            <th>Resim ID</th>
                                            
                                            <th>Ürün Adı</th>
                                            <th>Ürün Resmi</th>
                                            <th>Durum</th>
                                            
                                            
                                            
                                            <th>Sil</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                       <%
                                       ProductManager pm = new ProductManager();
                                       List<Product> liste = pm.resimler();
                                       for(Product urun:liste)
                                       {
                                       %>
                                        <tr>
                                            <td><%=urun.getResimID()%></td>
                                            <td><%=urun.getUrunAdi()%></td>
                                            <td><center><img width="100" height="100" src="../../img/<%=urun.getResim()%>" /></center></td>
                                            <td><%=urun.getResim_durum()%></td>
                                        <td> 
                                        <a href="resimduzenle.jsp?id=<%=urun.getResimID()%>" class="btn btn-primary btn-icon-split">
                                        <span class="icon text-white-50">
                                            <i class="fas fa-edit"></i>
                                        </span>
                                        <span class="text">Düzenle</span>
                                    </a>
                                        </td>
                                      
                                        </tr> 
                                        <%
                                            }
                                        %>
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

