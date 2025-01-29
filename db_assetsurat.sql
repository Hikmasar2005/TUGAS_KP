-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 29 Jan 2025 pada 10.03
-- Versi server: 10.4.32-MariaDB
-- Versi PHP: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `db_assetsurat`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `disposisi`
--

CREATE TABLE `disposisi` (
  `id_disposisi` int(11) NOT NULL,
  `no_agenda` varchar(50) DEFAULT NULL,
  `nomor_surat` varchar(100) DEFAULT NULL,
  `perihal` text DEFAULT NULL,
  `tujuan_disposisi` varchar(100) DEFAULT NULL,
  `instruksi` text DEFAULT NULL,
  `tanggal_disposisi` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `draft_sk`
--

CREATE TABLE `draft_sk` (
  `id_draft_sk` int(11) NOT NULL,
  `nomor` varchar(50) NOT NULL,
  `tanggal_masuk` date NOT NULL,
  `tanggal_surat` date NOT NULL,
  `nomor_surat` varchar(50) NOT NULL,
  `instansi` varchar(255) NOT NULL,
  `perihal` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `ekspedisi_sk`
--

CREATE TABLE `ekspedisi_sk` (
  `id_ekspedisi_sk` int(11) NOT NULL,
  `nomor_surat_keluar` varchar(100) NOT NULL,
  `nomor_berita` varchar(100) NOT NULL,
  `dari` varchar(100) NOT NULL,
  `untuk` varchar(100) NOT NULL,
  `via` varchar(100) NOT NULL,
  `tanggal_surat_keluar` date NOT NULL,
  `jam_surat_keluar` time NOT NULL,
  `jumlah_lembar` int(11) NOT NULL,
  `jumlah_kirim` int(11) NOT NULL,
  `petugas` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `lembar_kontrol`
--

CREATE TABLE `lembar_kontrol` (
  `id` int(11) NOT NULL,
  `opd_biro` varchar(255) NOT NULL,
  `no_agenda_registrasi` varchar(50) NOT NULL,
  `tanggal_masuk_sk` date NOT NULL,
  `tentang` text NOT NULL,
  `syarat_surat_pengantar` tinyint(1) NOT NULL DEFAULT 0,
  `syarat_telaahan_staf` tinyint(1) NOT NULL DEFAULT 0,
  `syarat_nota_dinas` tinyint(1) NOT NULL DEFAULT 0,
  `syarat_konsep_persetujuan` tinyint(1) NOT NULL DEFAULT 0,
  `syarat_softcopy_hardcopy` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `riwayat_disposisi`
--

CREATE TABLE `riwayat_disposisi` (
  `id_disposisi` int(11) NOT NULL,
  `id_surat_masuk` int(11) NOT NULL,
  `tanggal` date NOT NULL,
  `tujuan_disposisi` varchar(255) NOT NULL,
  `instruksi` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `riwayat_surat`
--

CREATE TABLE `riwayat_surat` (
  `id_riwayat` int(11) NOT NULL,
  `id_surat_masuk` int(11) NOT NULL,
  `tanggal` date NOT NULL,
  `deskripsi` text NOT NULL,
  `status` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `sppd_luar_daerah`
--

CREATE TABLE `sppd_luar_daerah` (
  `id_sppd_luar_daerah` int(11) NOT NULL,
  `nomor` varchar(50) NOT NULL,
  `tanggal` date NOT NULL,
  `perihal` text NOT NULL,
  `nomor_sppd` varchar(50) NOT NULL,
  `nama_ditugaskan` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `spt_dalam_daerah`
--

CREATE TABLE `spt_dalam_daerah` (
  `id_spt_dalam_daerah` int(11) NOT NULL,
  `nomor` varchar(50) NOT NULL,
  `tanggal` date NOT NULL,
  `perihal` text NOT NULL,
  `nomor_spt` varchar(50) NOT NULL,
  `nama_ditugaskan` varchar(255) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `surat_detail`
--

CREATE TABLE `surat_detail` (
  `id_detail_surat` int(11) NOT NULL,
  `id_surat_masuk` int(11) NOT NULL,
  `no_agenda` varchar(50) NOT NULL,
  `nomor_surat` varchar(255) NOT NULL,
  `no_indeks_surat` varchar(100) DEFAULT NULL,
  `perihal` varchar(255) NOT NULL,
  `tanggal_surat` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `surat_keluar`
--

CREATE TABLE `surat_keluar` (
  `id_surat_keluar` int(11) NOT NULL,
  `no_agenda` int(11) NOT NULL,
  `no_indeks` varchar(50) NOT NULL,
  `nomor_surat_keluar` varchar(50) NOT NULL,
  `tanggal_surat_keluar` date NOT NULL,
  `perihal` text NOT NULL,
  `tujuan` text NOT NULL,
  `tembusan` text DEFAULT NULL,
  `petugas` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `surat_masuk`
--

CREATE TABLE `surat_masuk` (
  `id_surat_masuk` int(11) NOT NULL,
  `no_agenda` varchar(50) NOT NULL,
  `nomor_surat` varchar(255) NOT NULL,
  `tanggal_surat` date NOT NULL,
  `asal_surat` varchar(255) NOT NULL,
  `perihal` varchar(255) NOT NULL,
  `status` enum('Belum Dibaca','Disposisi','Selesai') DEFAULT 'Belum Dibaca',
  `file_surat` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `surat_masuk`
--

INSERT INTO `surat_masuk` (`id_surat_masuk`, `no_agenda`, `nomor_surat`, `tanggal_surat`, `asal_surat`, `perihal`, `status`, `file_surat`) VALUES
(2, '02', '34/87/827/09/2025', '2025-01-28', 'dinas pariwisata', 'pembangunan wisata baru yang akan di lakukan di kos saya hahahhah  begitu mi hahah', 'Belum Dibaca', 'E1E122014_HIKMA.pdf'),
(4, '02', 'hah/hdh/76/2025', '2025-01-28', 'dinas ketenaga kerjaan ', 'ahhaha akam akakm amsaka mamahd djhaahdh ', 'Belum Dibaca', '1738025887_E1E122014_HIKMA.pdf');

-- --------------------------------------------------------

--
-- Struktur dari tabel `user`
--

CREATE TABLE `user` (
  `id_user` int(11) NOT NULL,
  `nama_user` varchar(255) NOT NULL,
  `username` varchar(255) NOT NULL,
  `password_user` varchar(255) NOT NULL,
  `role_user` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data untuk tabel `user`
--

INSERT INTO `user` (`id_user`, `nama_user`, `username`, `password_user`, `role_user`) VALUES
(1, 'Admin Sandi', 'Admin', 'admin', 'admin'),
(2, 'Aldi', 'Aldi', '123', 'petugas'),
(6, 'Hikma', 'hikmaaaa36@gmail.com', '$2y$10$L.JqYKS0Ww8EBNAgUeFswuIAB5sdF0Pzu5IpfLDWyNJ8FWOOqbbKW', 'admin');

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `disposisi`
--
ALTER TABLE `disposisi`
  ADD PRIMARY KEY (`id_disposisi`);

--
-- Indeks untuk tabel `draft_sk`
--
ALTER TABLE `draft_sk`
  ADD PRIMARY KEY (`id_draft_sk`);

--
-- Indeks untuk tabel `ekspedisi_sk`
--
ALTER TABLE `ekspedisi_sk`
  ADD PRIMARY KEY (`id_ekspedisi_sk`);

--
-- Indeks untuk tabel `lembar_kontrol`
--
ALTER TABLE `lembar_kontrol`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `riwayat_disposisi`
--
ALTER TABLE `riwayat_disposisi`
  ADD PRIMARY KEY (`id_disposisi`),
  ADD KEY `id_surat_masuk` (`id_surat_masuk`);

--
-- Indeks untuk tabel `riwayat_surat`
--
ALTER TABLE `riwayat_surat`
  ADD PRIMARY KEY (`id_riwayat`),
  ADD KEY `id_surat_masuk` (`id_surat_masuk`);

--
-- Indeks untuk tabel `sppd_luar_daerah`
--
ALTER TABLE `sppd_luar_daerah`
  ADD PRIMARY KEY (`id_sppd_luar_daerah`);

--
-- Indeks untuk tabel `spt_dalam_daerah`
--
ALTER TABLE `spt_dalam_daerah`
  ADD PRIMARY KEY (`id_spt_dalam_daerah`);

--
-- Indeks untuk tabel `surat_detail`
--
ALTER TABLE `surat_detail`
  ADD PRIMARY KEY (`id_detail_surat`),
  ADD KEY `id_surat_masuk` (`id_surat_masuk`);

--
-- Indeks untuk tabel `surat_keluar`
--
ALTER TABLE `surat_keluar`
  ADD PRIMARY KEY (`id_surat_keluar`);

--
-- Indeks untuk tabel `surat_masuk`
--
ALTER TABLE `surat_masuk`
  ADD PRIMARY KEY (`id_surat_masuk`);

--
-- Indeks untuk tabel `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id_user`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `disposisi`
--
ALTER TABLE `disposisi`
  MODIFY `id_disposisi` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `draft_sk`
--
ALTER TABLE `draft_sk`
  MODIFY `id_draft_sk` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `ekspedisi_sk`
--
ALTER TABLE `ekspedisi_sk`
  MODIFY `id_ekspedisi_sk` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT untuk tabel `lembar_kontrol`
--
ALTER TABLE `lembar_kontrol`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `riwayat_disposisi`
--
ALTER TABLE `riwayat_disposisi`
  MODIFY `id_disposisi` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `riwayat_surat`
--
ALTER TABLE `riwayat_surat`
  MODIFY `id_riwayat` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `sppd_luar_daerah`
--
ALTER TABLE `sppd_luar_daerah`
  MODIFY `id_sppd_luar_daerah` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `spt_dalam_daerah`
--
ALTER TABLE `spt_dalam_daerah`
  MODIFY `id_spt_dalam_daerah` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `surat_detail`
--
ALTER TABLE `surat_detail`
  MODIFY `id_detail_surat` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `surat_keluar`
--
ALTER TABLE `surat_keluar`
  MODIFY `id_surat_keluar` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `surat_masuk`
--
ALTER TABLE `surat_masuk`
  MODIFY `id_surat_masuk` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT untuk tabel `user`
--
ALTER TABLE `user`
  MODIFY `id_user` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- Ketidakleluasaan untuk tabel pelimpahan (Dumped Tables)
--

--
-- Ketidakleluasaan untuk tabel `riwayat_disposisi`
--
ALTER TABLE `riwayat_disposisi`
  ADD CONSTRAINT `riwayat_disposisi_ibfk_1` FOREIGN KEY (`id_surat_masuk`) REFERENCES `surat_masuk` (`id_surat_masuk`);

--
-- Ketidakleluasaan untuk tabel `riwayat_surat`
--
ALTER TABLE `riwayat_surat`
  ADD CONSTRAINT `riwayat_surat_ibfk_1` FOREIGN KEY (`id_surat_masuk`) REFERENCES `surat_masuk` (`id_surat_masuk`);

--
-- Ketidakleluasaan untuk tabel `surat_detail`
--
ALTER TABLE `surat_detail`
  ADD CONSTRAINT `surat_detail_ibfk_1` FOREIGN KEY (`id_surat_masuk`) REFERENCES `surat_masuk` (`id_surat_masuk`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
