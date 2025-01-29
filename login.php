<?php
if (isset($_POST["submit"])) {
    // Ambil dan sanitasi input
    $username = htmlentities(strip_tags(trim($_POST["username"])));
    $password = htmlentities(strip_tags(trim($_POST["password_user"])));

    // Koneksi ke database
    include("connection.php");

    // Hindari SQL injection
    $username = mysqli_real_escape_string($link, $username);

    // Query untuk mencari username
    $query = "SELECT * FROM user WHERE username='$username'";
    $result = mysqli_query($link, $query);

    if (mysqli_num_rows($result) > 0) {
        $data = mysqli_fetch_assoc($result);

        // Verifikasi password
        if (password_verify($password, $data['password_user'])) {
            session_start();
            $_SESSION['username'] = $data['username'];
            $_SESSION['role_user'] = $data['role_user'];

            if ($data['role_user'] == 'admin') {
                echo "<script>alert('Selamat Datang, Admin.');document.location.href='index.php?page=home&aksi';</script>";
            } elseif ($data['role_user'] == 'petugas') {
                echo "<script>alert('Selamat Datang, User.');document.location.href='index_user.php?page=home&aksi';</script>";
            }
        } else {
            echo "<script>alert('Password salah!');document.location.href='login.php';</script>";
        }
    } else {
        echo "<script>alert('Username tidak ditemukan!');document.location.href='login.php';</script>";
    }
}
?>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<title>Login</title>
<meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">
<link rel="stylesheet" href="bower_components/bootstrap/dist/css/bootstrap.min.css">
<link rel="stylesheet" href="bower_components/font-awesome/css/font-awesome.min.css">
<link rel="stylesheet" href="bower_components/Ionicons/css/ionicons.min.css">
<link rel="stylesheet" href="dist/css/AdminLTE.min.css">
<link rel="stylesheet" href="asset/plugins/iCheck/square/blue.css">
<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,600,700,300italic,400italic,600italic">
<style>
  body {
    background-image: url('asset/img/bg2.jpeg');
    background-size: cover;
    background-position: center;
  }
  .login-box {
    margin: 50px auto;
  }
  .login-box-body {
    border-radius: 10px;
    background: rgba(255, 255, 255, 0.9);
    padding: 20px;
    box-shadow: 0px 4px 6px rgba(0, 0, 0, 0.2);
  }
  .login-logo img {
    width: 150px;
  }
  .btn {
    border-radius: 5px;
  }
</style>
</head>
<body class="hold-transition login-page">
<div class="login-box">
  <div class="login-logo">
    <img src="asset/img/logo3.png" alt="Logo">
  </div>
  <div class="login-box-body">
    <p class="login-box-msg">Silakan Login</p>
    <form action="login.php" method="post" autocomplete="off">
      <div class="form-group has-feedback">
        <input type="text" class="form-control" placeholder="Masukkan Username" name="username" required autocomplete="off">
        <span class="glyphicon glyphicon-user form-control-feedback"></span>
      </div>
      <div class="form-group has-feedback">
        <input type="password" class="form-control" placeholder="Masukkan Password" name="password_user" required autocomplete="new-password">
        <span class="glyphicon glyphicon-lock form-control-feedback"></span>
      </div>
      <div class="row">
        <div class="col-xs-12">
          <button type="submit" class="btn btn-primary btn-block" name="submit">Log In</button>
        </div>
      </div>
    </form>
    <div class="text-center" style="margin-top: 15px;">
      <p>Belum punya akun?</p>
      <a href="register.php" class="btn btn-default">Daftar</a>
    </div>
  </div>
</div>
<script src="bower_components/jquery/dist/jquery.min.js"></script>
<script src="bower_components/bootstrap/dist/js/bootstrap.min.js"></script>
<script src="plugins/iCheck/icheck.min.js"></script>
<script>
  $(function () {
    $('input').iCheck({
      checkboxClass: 'icheckbox_square-blue',
      radioClass: 'iradio_square-blue',
      increaseArea: '20%'
    });
  });
</script>
</body>
</html>
