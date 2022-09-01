<%@include file="header.jsp" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="com.kbhyazilim.Business.SubCategoryManager,com.kbhyazilim.Entities.SubCategory,java.util.*" %>
<%@page import="com.kbhyazilim.Business.CategoryManager,com.kbhyazilim.Entities.Category,java.util.*" %>
<link href="vendor/datatables/dataTables.bootstrap4.min.css" rel="stylesheet">
    <%

if(session.getAttribute("admin") == null)
{
response.sendRedirect("giris.jsp");
}

    %>
<!-- Begin Page Content -->
                <div class="container-fluid">

                    <!-- Page Heading -->
                    <h1 class="h3 mb-2 text-gray-800">Kategoriler</h1>
                  

                    <!-- DataTales Example -->
                    <div class="card shadow mb-4">
                        <div class="card-header py-3">
                           
                        </div>
                        <div class="card-body">
                            <div class="table-responsive">
                                <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
                                    <thead>
                                        <tr>
                                            <th>Alt Kategori ID</th>
                                            <th>Alt Kategori Adı</th>
                                            <th>Kategori Adı</th>
                                            <th>Düzenle</th>
                                            <th>Sil</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <%
                                        SubCategoryManager manager = new SubCategoryManager();
                                        List<SubCategory> liste = manager.select();
                                        CategoryManager manager2 = new CategoryManager();
                                        List<Category> liste2 = manager2.select();
                                        for(SubCategory cat:liste)
                                        {
                                        %>
                                        <tr>
                                    <td><%=cat.getAltid()%></td>
                                    <td><%=cat.getAltadi()%></td>
                                    <td>
                                        
                                        <%
                                        for(Category k:liste2)
                                        {
                                        if(k.getKat_id() == cat.getKat_id())
                                        {
                                            
                                        %>
                                        <%=k.getKat_adi()%>
                                        <%
                                        }
                                        }
                                        %>
                                        
                                    
                                    </td>
                                    <td>
                                        <a href="altkategoriduzenle.jsp?altkat_id=<%=cat.getAltid()%>" class="btn btn-primary btn-icon-split">
                                        <span class="icon text-white-50">
                                            <i class="fas fa-pen"></i>
                                        </span>
                                        <span class="text">Düzenle</span>
                                    </a>
                                        </td>
                                    <td> 
                                        <a href="altkategorisil.jsp?altkat_id=<%=cat.getAltid()%>" class="btn btn-danger btn-icon-split">
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