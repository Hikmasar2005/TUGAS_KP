<?php
session_start();
if (!isset($_SESSION['username'])) {
    header("Location: login.php");
    exit();
}
?>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Manajemen Surat</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">
    <style>
        body {
            margin: 0;
            font-family: Arial, sans-serif;
            background-color: #f4f4f9;
        }

        .sidebar {
            height: 100vh;
            width: 250px;
            background-color: #2c3e50;
            color: #ecf0f1;
            position: fixed;
            display: flex;
            flex-direction: column;
        }

        .sidebar-header {
            font-size: 1.5rem;
            text-align: center;
            padding: 20px 0;
            background-color: #34495e;
            font-weight: bold;
        }

        .menu {
            flex: 1;
            list-style: none;
            padding: 0;
            margin: 0;
        }

        .menu li {
            padding: 15px 20px;
            display: flex;
            align-items: center;
            cursor: pointer;
            transition: background 0.3s ease;
        }

        .menu li:hover,
        .menu li.active {
            background-color: #1abc9c;
        }

        .menu li i {
            margin-right: 15px;
        }

        .menu li span {
            flex: 1;
        }

        .menu li .submenu {
            display: none;
            flex-direction: column;
            padding-left: 20px;
        }

        .menu li.active .submenu {
            display: flex;
        }

        .footer {
            padding: 10px;
            background-color: #34495e;
            text-align: center;
            font-size: 0.9rem;
        }

        .content {
            margin-left: 250px;
            padding: 20px;
        }

        iframe {
            width: 100%;
            height: calc(100vh - 40px);
            border: none;
        }
    </style>
</head>

<body>

    <div class="sidebar">
        <div class="sidebar-header">SIAP-BRO!</div>
        <ul class="menu">
            <li onclick="loadPage('pages/home.php')" class="active">
                <i class="fas fa-tachometer-alt"></i><span>Dashboard</span>
            </li>
            <li onclick="loadPage('pages/surat_masuk.php')">
                <i class="fas fa-envelope"></i><span>Surat Masuk</span>
            </li>
            <li onclick="loadPage('pages/surat_keluar.php')">
                <i class="fas fa-paper-plane"></i><span>Surat Keluar</span>
            </li>
            <li onclick="loadPage('pages/draft_sk.php')">
                <i class="fas fa-file"></i><span>Draft SK</span>
            </li>
            <li onclick="loadPage('pages/sppd_luar_daerah.php')">
                <i class="fas fa-plane-departure"></i><span>SPPD</span>
            </li>
            <li onclick="loadPage('pages/spt_dalam_daerah.php')">
                <i class="fas fa-map-marker-alt"></i><span>SPT</span>
            </li>
            <li onclick="loadPage('pages/arsip.php')">
                <i class="fas fa-archive"></i><span>Arsip</span>
            </li>
            <li onclick="loadPage('pages/user.php')">
                <i class="fas fa-user"></i><span>User</span>
            </li>
            <li onclick="loadPage('pages/pengaturan.php')">
                <i class="fas fa-cog"></i><span>Pengaturan</span>
            </li>
        </ul>
        <div class="footer">Sistem Surat &copy; 2025</div>
    </div>

    <div class="content">
        <iframe id="content-frame" src=""></iframe>
    </div>
    <script>
    function loadPage(page) {
        const iframe = document.getElementById('content-frame');
        iframe.src = page;

        // Highlight menu item
        const menuItems = document.querySelectorAll('.menu li');
        menuItems.forEach(item => item.classList.remove('active'));
        event.currentTarget.classList.add('active');
    }
</script>

</body>

</html>.