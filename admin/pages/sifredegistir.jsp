<%@page contentType="text/html" pageEncoding="UTF-8"%>
 <%@page import ="com.kbhyazilim.Entities.Admin,com.kbhyazilim.Business.AdminManager,java.util.*"%>
<!DOCTYPE html>
<html lang="en">

<head>

    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>Kapı Dünyası|Sifremi Unuttum</title>

    <!-- Custom fonts for this template-->
    <link href="vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
    <link
        href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
        rel="stylesheet">

    <!-- Custom styles for this template-->
    <link href="css/sb-admin-2.min.css" rel="stylesheet">
       <style>
           
.alert {
  padding: 20px;
  background-color: #f44336;
  color: white;
  opacity: 1;
  transition: opacity 0.6s;
  margin-bottom: 15px;
}

.alert.success {background-color: #04AA6D;}
.alert.info {background-color: #2196F3;}
.alert.warning {background-color: #ff9800;}

.closebtn {
  margin-left: 15px;
  color: white;
  font-weight: bold;
  float: right;
  font-size: 22px;
  line-height: 20px;
  cursor: pointer;
  transition: 0.3s;
}

.closebtn:hover {
  color: black;
}
        </style>
</head>

<body class="bg-gradient-primary">

    <div class="container">

        <!-- Outer Row -->
        <div class="row justify-content-center">

            <div class="col-xl-10 col-lg-12 col-md-9">

                <div class="card o-hidden border-0 shadow-lg my-5">
                    <div class="card-body p-0">
                        <!-- Nested Row within Card Body -->
                        <div class="row">
                            <div class="col-lg-6 d-none d-lg-block bg-password-image"></div>
                            <div class="col-lg-6">
                                <div class="p-5">
                                    <div class="text-center">
                                        <h1 class="h4 text-gray-900 mb-2">Şifrenizi mi unuttunuz?</h1>
                                                                            </div>
                                    <form method="POST" class="user">
                                        <div class="form-group">
                                            <input type="text" class="form-control form-control-user"
                                                id="exampleInputEmail" aria-describedby="emailHelp"
                                                placeholder="Kullanıcı Adı Giriniz" name="kuladi">
                                                
                                        </div>
                                         <div class="form-group">
                                            <input type="password" class="form-control form-control-user"
                                                id="exampleInputEmail" aria-describedby="emailHelp"
                                                placeholder="Şifre Giriniz" name="sifre" required>
                                                
                                        </div>
                                        <button type="submit" class="btn btn-primary btn-user btn-block">
                                            Şifreyi Resetle
                                        </button>
                                    </form>
                                    <%
                                        String kuladi = request.getParameter("kuladi");
                                         String sifre = request.getParameter("sifre");
                                         if (kuladi!=null&&sifre!=null)
                                         {
                                         Admin model = new Admin (kuladi, sifre);
                                         AdminManager guncelle =new AdminManager();
                                         boolean kontrol =  guncelle.reset(model);
                                        if(kontrol)
                                        {
                                        %>
                                         <br><div class="alert success">
  <span class="closebtn" onclick="this.parentElement.style.display='none';">&times;</span> 
  <strong>Başarılı!</strong> Şifreniz değişti.
</div>
                                        <%
                                        }
                                         else
                                        {
                                               %>
                                               <br><div class="alert">
  <span class="closebtn" onclick="this.parentElement.style.display='none';">&times;</span> 
  <strong>Hata!</strong> Kullanıcı Adını Kontrol Ediniz.
</div>
                                               <%
                                        }
                                         
                                    }
                                         
                                    %>
                                    <hr>
                                   <div class="text-center">
                                        <a class="small" href="kayit.jsp">Kayıt Ol</a>
                                    </div>
                                    <div class="text-center">
                                        <a class="small" href="giris.jsp">Hesabın var mı? Giriş Yap</a>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

            </div>

        </div>

    </div>

    <!-- Bootstrap core JavaScript-->
    <script src="vendor/jquery/jquery.min.js"></script>
    <script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

    <!-- Core plugin JavaScript-->
    <script src="vendor/jquery-easing/jquery.easing.min.js"></script>

    <!-- Custom scripts for all pages-->
    <script src="js/sb-admin-2.min.js"></script>

</body>

</html>
