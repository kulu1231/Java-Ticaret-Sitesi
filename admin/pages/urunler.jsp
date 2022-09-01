<%@include file="header.jsp" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="com.kbhyazilim.Business.ProductManager,com.kbhyazilim.Entities.Product,java.util.*" %>
<%@page import="com.kbhyazilim.Business.CategoryManager,com.kbhyazilim.Entities.Category,java.util.*" %>
<%@page import="com.kbhyazilim.Business.SubCategoryManager,com.kbhyazilim.Entities.SubCategory,java.util.*" %>
 <link href="vendor/datatables/dataTables.bootstrap4.min.css" rel="stylesheet">
 <%

if(session.getAttribute("admin") == null )
{
response.sendRedirect("giris.jsp");
}

    %>
 <!-- Begin Page Content -->
                <div class="container-fluid">

                    <!-- Page Heading -->
                    <h1 class="h3 mb-2 text-gray-800">Ürünler</h1>
                  

                    <!-- DataTales Example -->
                    <div class="card shadow mb-4">
                        <div class="card-header py-3">
                           
                        </div>
                        <div class="card-body">
                            <div class="table-responsive">
                                <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
                                    <thead>
                                        <tr>
                                            <th>Ürün ID</th>
                                            <th>Ürün Adı</th>
                                            <th>Ürün Fiyatı</th>
                                           
                                            <th>Ürün Rengi</th>
                                            <th>Kategori</th>
                                            <th>Alt Kategori</th>
                                            <th>Düzenle</th>
                                            <th>Sil</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <%
                                        ProductManager manager = new ProductManager();
                                        List<Product> liste = manager.select();
                                        CategoryManager managerkat = new CategoryManager();
                                        List<Category> listekat = managerkat.select();
                                        SubCategoryManager manageraltkat = new SubCategoryManager();
                                        List<SubCategory> listealtkat = manageraltkat.select();
                                        for(Product urun:liste)
                                        {
                                        
                                        %>
                                        <tr>
                                    <td><%=urun.getUrunID()%></td>
                                    <td><%=urun.getUrunAdi()%></td>
                                    <td><%=urun.getUrunFiyat()%></td>
                                   
                                    <td>
                                    <center>
                                    <i class="fas fa-square fa-2x" style="color: <%=urun.getUrunRenk()%>"></i>
                                    </center>
                                       </td>
                                    <td>
                                         <%
                                        for(Category k:listekat)
                                        {
                                        if(k.getKat_id() == urun.getKatNo())
                                        {
                                            
                                        %>
                                        <%=k.getKat_adi()%>
                                        <%
                                        }
                                        }
                                        %>
                                    </td>
                                    <td>
                                         <%
                                        for(SubCategory k:listealtkat)
                                        {
                                        if(k.getAltid() == urun.getAltNo())
                                        {
                                            
                                        %>
                                        <%=k.getAltadi()%>
                                        <%
                                        }
                                        }
                                        %>
                                    </td>
                                    <td>
                                        <a href="urunduzenle.jsp?urun_id=<%=urun.getUrunID()%>" class="btn btn-primary btn-icon-split">
                                        <span class="icon text-white-50">
                                            <i class="fas fa-pen"></i>
                                        </span>
                                        <span class="text">Düzenle</span>
                                    </a>
                                        </td>
                                    <td> 
                                        <a href="urunsil.jsp?urun_id=<%=urun.getUrunID()%>" class="btn btn-danger btn-icon-split">
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

