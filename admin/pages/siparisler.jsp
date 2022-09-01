<%@include file="header.jsp" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="com.kbhyazilim.Business.OrderManager,com.kbhyazilim.Entities.Order,java.util.*" %>
<%@page import="com.kbhyazilim.Business.ProductManager,com.kbhyazilim.Entities.Product,java.util.*" %>
<%@page import="com.kbhyazilim.Business.MembersManager,com.kbhyazilim.Entities.Members,java.util.*" %>

 <link href="vendor/datatables/dataTables.bootstrap4.min.css" rel="stylesheet">

 <!-- Begin Page Content -->
                <div class="container-fluid">

                    <!-- Page Heading -->
                    <h1 class="h3 mb-2 text-gray-800">Sipariş İşlemleri</h1>
                  

                    <!-- DataTales Example -->
                    <div class="card shadow mb-4">
                        <div class="card-header py-3">
                           
                        </div>
                        <div class="card-body">
                            <div class="table-responsive">
                                <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
                                    <thead>
                                        <tr>
                                            <th>Sipariş Durum</th>
                                            <th>Ad Soyad</th>
                                            <th>Ürün Adı</th>
                                            <th>Adet</th>
                                            
                                            
                                            <th></th>
                                            <th>Sil</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <%
                                        OrderManager manager = new OrderManager();
                                        List<Order> liste = manager.select();
                                        ProductManager manager2 = new ProductManager();
                                        List<Product> liste2 = manager2.select();
                                        MembersManager manager3 = new MembersManager();
                                        List<Members> liste3 = manager3.select();
                                        for(Order cat:liste)
                                        {
                                        %>
                                        <tr>
                                            <td>
                                          <%
                                              if(cat.getDurum()==0)
                                                 out.print("<button class='btn btn-warning'>Hazırlanıyor</button>");
                                              if(cat.getDurum()==1)
                                                 out.print("<button class='btn btn-danger'>Kargoda</button>");
                                              if(cat.getDurum()==2)
                                                 out.print("<button class='btn btn-success'>Teslim Edildi</button>");
                                          %>
                                      
                                      </td>
                                    <td>
                                        
                                         <%
                                        for(Members k:liste3)
                                        {
                                        if(k.getNo()== cat.getUyeID())
                                        {
                                            
                                        %>
                                        <% out.print(k.getAd()+" "+k.getSoyad()); %>
                                        <%
                                        }
                                        }
                                        %>
                                    </td>
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
                                      <td><%=cat.getAdet()%> Adet</td>
                                     
                                      
                                    <td> 
                                        <%
                                              if(cat.getDurum()==0)
                                              {
                                              %>
                                       
                                                 <a href="siparis.jsp?id=<%=cat.getSiparisID()%>" class='btn btn-danger'>Kargoya Ver</a>
                                           <%}
                                          %>
                                          
                                          <%
                                              if(cat.getDurum()==1)
                                              {
                                              %>
                                       
                                                 <a href="siparis.jsp?id=<%=cat.getSiparisID()%>" class='btn btn-success'>Teslim Et</a>
                                           <%}
                                          %>
                                          
                                          <%
                                              if(cat.getDurum()==2)
                                              {
                                              %>
                                       
                                                 <a class='btn btn-success'>Tamamlandı</a>
                                           <%}
                                          %>
                                        </td>
                                        <td> 
                                        <a href="siparissil.jsp?siparis_id=<%=cat.getSiparisID()%>" class="btn btn-danger btn-icon-split">
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

