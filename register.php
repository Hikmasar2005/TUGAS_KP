<?php
if (isset($_POST["submit"])) {
    // Include koneksi ke database
    include("connection.php");

    // Ambil dan sanitasi input
    $nama_user = htmlentities(strip_tags(trim($_POST["nama_user"])));
    $username = htmlentities(strip_tags(trim($_POST["username"])));
    $password = htmlentities(strip_tags(trim($_POST["password_user"])));
    $role_user = htmlentities(strip_tags(trim($_POST["role_user"]))); // Misalnya: admin atau petugas

    // Validasi input
    if (empty($nama_user) || empty($username) || empty($password) || empty($role_user)) {
        echo "<script>alert('Semua kolom wajib diisi!');document.location.href='register.php';</script>";
        exit;
    }

    // Cek apakah username sudah terdaftar
    $username = mysqli_real_escape_string($link, $username);
    $query_check = "SELECT * FROM user WHERE username='$username'";
    $result_check = mysqli_query($link, $query_check);

    if (mysqli_num_rows($result_check) > 0) {
        echo "<script>alert('Username sudah terdaftar! Gunakan username lain.');document.location.href='register.php';</script>";
        exit;
    }

    // Hash password untuk keamanan
    $hashed_password = password_hash($password, PASSWORD_DEFAULT);

    // Simpan data ke database
    $query_insert = "INSERT INTO user (nama_user, username, password_user, role_user) VALUES ('$nama_user', '$username', '$hashed_password', '$role_user')";
    $result_insert = mysqli_query($link, $query_insert);

    if ($result_insert) {
        echo "<script>alert('Registrasi berhasil! Silakan login.');document.location.href='login.php';</script>";
    } else {
        echo "<script>alert('Registrasi gagal! Coba lagi.');document.location.href='register.php';</script>";
    }
}
?>

<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Register</title>
  <!-- Bootstrap CSS -->
  <link rel="stylesheet" href="bower_components/bootstrap/dist/css/bootstrap.min.css">
  <link rel="stylesheet" href="bower_components/font-awesome/css/font-awesome.min.css">
  <style>
    body {
      background-image: url('asset/img/bg2.jpeg');
      background-size: cover;
      background-position: center;
    }
    .register-box {
      margin: 50px auto;
      width: 400px;
      background: rgba(255, 255, 255, 0.9);
      padding: 20px;
      border-radius: 10px;
      box-shadow: 0px 4px 6px rgba(0, 0, 0, 0.2);
    }
    .register-title {
      margin-bottom: 20px;
      text-align: center;
      font-weight: bold;
    }
  </style>
</head>
<body>
  <div class="register-box">
    <h3 class="register-title">Register</h3>
    <form action="register.php" method="post" autocomplete="off">
      <div class="form-group">
        <label for="nama_user">Nama Lengkap:</label>
        <input type="text" class="form-control" id="nama_user" name="nama_user" placeholder="Masukkan Nama Lengkap" required>
      </div>
      <div class="form-group">
        <label for="username">Username:</label>
        <input type="text" class="form-control" id="username" name="username" placeholder="Masukkan Username" required autocomplete="off">
      </div>
      <div class="form-group">
        <label for="password_user">Password:</label>
        <input type="password" class="form-control" id="password_user" name="password_user" placeholder="Masukkan Password" required autocomplete="new-password">
      </div>
      <div class="form-group">
        <label for="role_user">Role:</label>
        <select class="form-control" id="role_user" name="role_user" required>
          <option value="" disabled selected>Pilih Role</option>
          <option value="admin">Admin</option>
          <option value="petugas">Petugas</option>
        </select>
      </div>
      <button type="submit" class="btn btn-primary btn-block" name="submit">Register</button>
    </form>
    <div class="text-center" style="margin-top: 10px;">
      <p>Sudah punya akun? <a href="login.php">Login</a></p>
    </div>
  </div>
  <!-- Bootstrap JS -->
  <script src="bower_components/jquery/dist/jquery.min.js"></script>
  <script src="bower_components/bootstrap/dist/js/bootstrap.min.js"></script>
</body>
</html>
