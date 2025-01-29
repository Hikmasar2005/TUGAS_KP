<?php 
require '../connection.php';

function hapus_notulen($id_notulen) {
    global $conn; // Asumsi $conn adalah koneksi database Anda
    $query = "DELETE FROM notulen WHERE id_notulen = ?";
    $stmt = $conn->prepare($query);
    $stmt->bind_param("i", $id_notulen);
    
    if ($stmt->execute()) {
        return 1; // Berhasil menghapus data
    } else {
        return 0; // Gagal menghapus data
    }
}

$id_notulen = $_GET["id_notulen"];

if (hapus_notulen($id_notulen) > 0) {
    echo "
        <script>
            alert('Data berhasil dihapus!');
            document.location.href = 'index.php?page=pertandingan';
        </script>
    ";
} else {
    echo "
        <script>
            alert('Data gagal dihapus!');
            document.location.href = 'index.php?page=pertandingan';
        </script>
    ";
}
?>
