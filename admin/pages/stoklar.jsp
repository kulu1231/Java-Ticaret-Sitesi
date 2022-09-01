<%@include file="header.jsp" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="com.kbhyazilim.Business.StokManager,com.kbhyazilim.Entities.Stok,java.util.*" %>
<%@page import="com.kbhyazilim.Business.ProductManager,com.kbhyazilim.Entities.Product,java.util.*" %>
 <link href="vendor/datatables/dataTables.bootstrap4.min.css" rel="stylesheet">

 <!-- Begin Page Content -->
                <div class="container-fluid">

                    <!-- Page Heading -->
                    <h1 class="h3 mb-2 text-gray-800">Stok İşlemleri</h1>
                  

                    <!-- DataTales Example -->
                    <div class="card shadow mb-4">
                        <div class="card-header py-3">
                           
                        </div>
                        <div class="card-body">
                            <div class="table-responsive">
                                <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
                                    <thead>
                                        <tr>
                                            <th>Ürün Adı</th>
                                            <th>Ürün Miktar</th>
                                            <th>Stok Birim</th>
                                            <th>Ürün KDV</th>
                                            <th>Düzenle</th>
                                            <th>Sil</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <%
                                        StokManager manager = new StokManager();
                                        List<Stok> liste = manager.select();
                                          ProductManager manager2 = new ProductManager();
                                        List<Product> liste2 = manager2.select();
                                        for(Stok cat:liste)
                                        {
                                        %>
                                        <tr>
                                  
                                  <td>
                                      <%
                                        for(Product k:liste2)
                                        {
                                        if(k.getUrunID()== cat.getUrunID())
                                        {
                                            
                                        %>
                                        <%=k.getUrunAdi()%>
                                        <%
                                        }
                                        }
                                        %>
                                  </td>
                                      <td><%=cat.getUrunAdet()%></td>
                                      <td><%=cat.getUrunBirim()%></td>
                                      <td>%<%=cat.getUrunKDV()%> KDV</td>
                                      <td>
                                        <a href="stokduzenle.jsp?stokID=<%=cat.getStokID()%>" class="btn btn-primary btn-icon-split">
                                        <span class="icon text-white-50">
                                            <i class="fas fa-pen"></i>
                                        </span>
                                        <span class="text">Düzenle</span>
                                    </a>
                                        </td>
                                    <td> 
                                        <a href="stoksil.jsp?stokID=<%=cat.getStokID()%>" class="btn btn-danger btn-icon-split">
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

