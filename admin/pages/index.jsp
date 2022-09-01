<%@include file="header.jsp" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="com.kbhyazilim.Business.ProductManager,com.kbhyazilim.Entities.Product,java.util.*" %>
<%@page import="com.kbhyazilim.Business.CategoryManager,com.kbhyazilim.Entities.Category,java.util.*" %>
<%@page import="com.kbhyazilim.Business.SubCategoryManager,com.kbhyazilim.Entities.SubCategory,java.util.*" %>
<%@page import="com.kbhyazilim.Business.MembersManager,com.kbhyazilim.Entities.Members,java.util.*" %>
                <div class="container-fluid">

                   
                    <h1 class="h3 mb-4 text-gray-800">Anasayfa</h1>
                         <div class="row">

                        <!-- Earnings (Monthly) Card Example -->
                        <div class="col-xl-3 col-md-6 mb-4">
                            <div class="card border-left-primary shadow h-100 py-2">
                                <div class="card-body">
                                    <div class="row no-gutters align-items-center">
                                        <div class="col mr-2">
                                            <div class="text-xs font-weight-bold text-primary text-uppercase mb-1">
                                                Ürünler</div>
                                            <div class="h5 mb-0 font-weight-bold text-gray-800">
                                                <%
                                                ProductManager toplam = new ProductManager();
                                                List<Product> list = toplam.toplam();
                                                for(Product say:list)
                                                    out.print(say.getUrunID());
                                                %>
                                            
                                            </div>
                                        </div>
                                        <div class="col-auto">
                                            <i class="fas fa-shopping-bag fa-2x text-gray-300"></i>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <!-- Earnings (Monthly) Card Example -->
                        <div class="col-xl-3 col-md-6 mb-4">
                            <div class="card border-left-success shadow h-100 py-2">
                                <div class="card-body">
                                    <div class="row no-gutters align-items-center">
                                        <div class="col mr-2">
                                            <div class="text-xs font-weight-bold text-success text-uppercase mb-1">
                                                Kategoriler</div>
                                            <div class="h5 mb-0 font-weight-bold text-gray-800">
                                                 <%
                                                CategoryManager toplamkat = new CategoryManager();
                                                List<Category> listkat = toplamkat.toplam();
                                                for(Category say:listkat)
                                                    out.print(say.getKat_id());
                                                %>
                                                
                                            </div>
                                        </div>
                                        <div class="col-auto">
                                            <i class="fas fa-list fa-2x text-gray-300"></i>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
   <div class="col-xl-3 col-md-6 mb-4">
                            <div class="card border-left-success shadow h-100 py-2">
                                <div class="card-body">
                                    <div class="row no-gutters align-items-center">
                                        <div class="col mr-2">
                                            <div class="text-xs font-weight-bold text-success text-uppercase mb-1">
                                                Alt Kategoriler</div>
                                            <div class="h5 mb-0 font-weight-bold text-gray-800">
                                                 <%
                                                SubCategoryManager toplamaltkat = new SubCategoryManager();
                                                List<SubCategory> listaltkat = toplamaltkat.toplam();
                                                for(SubCategory say:listaltkat)
                                                    out.print(say.getAltid());
                                                %>
                                                
                                            </div>
                                        </div>
                                        <div class="col-auto">
                                            <i class="fas fa-list fa-2x text-gray-300"></i>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    

                        <!-- Pending Requests Card Example -->
                        <div class="col-xl-3 col-md-6 mb-4">
                            <div class="card border-left-warning shadow h-100 py-2">
                                <div class="card-body">
                                    <div class="row no-gutters align-items-center">
                                        <div class="col mr-2">
                                            <div class="text-xs font-weight-bold text-warning text-uppercase mb-1">
                                               Üyeler</div>
                                            <div class="h5 mb-0 font-weight-bold text-gray-800">
                                                 <%
                                                MembersManager toplamuser = new MembersManager();
                                                List<Members> listuser = toplamuser.toplam();
                                                for(Members say:listuser)
                                                    out.print(say.getNo());
                                                %>
                                                
                                            </div>
                                        </div>
                                        <div class="col-auto">
                                            <i class="fas fa-user fa-2x text-gray-300"></i>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>

                </div>

<%@include file="footer.jsp" %>
