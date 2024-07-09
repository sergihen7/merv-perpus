-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Feb 14, 2023 at 07:26 AM
-- Server version: 8.0.30
-- PHP Version: 8.1.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `perpustakaan_db`
--

-- --------------------------------------------------------

--
-- Table structure for table `aplikasi`
--

CREATE TABLE `aplikasi` (
  `id` int NOT NULL,
  `nama_app` varchar(255) NOT NULL,
  `foto` text NOT NULL,
  `logo` text NOT NULL,
  `alamat_app` varchar(255) NOT NULL,
  `email_app` varchar(255) NOT NULL,
  `nomor_hp` varchar(255) NOT NULL,
  `copyright` varchar(255) NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `aplikasi`
--

INSERT INTO `aplikasi` (`id`, `nama_app`, `foto`, `logo`, `alamat_app`, `email_app`, `nomor_hp`, `copyright`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'Merv Perpus', 'book.jfif', 'logo.png', 'Condet, Bekasi', 'xxx@email.com', '999999999', 'Sergi', NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `buku`
--

CREATE TABLE `buku` (
  `id` int NOT NULL,
  `judul` varchar(255) NOT NULL,
  `sampul` text,
  `kategori` int NOT NULL,
  `penerbit` int NOT NULL,
  `pengarang` int NOT NULL,
  `rak` int NOT NULL,
  `tahun_terbit` year NOT NULL,
  `isbn` varchar(255) NOT NULL,
  `stock` int NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `buku`
--

INSERT INTO `buku` (`id`, `judul`, `sampul`, `kategori`, `penerbit`, `pengarang`, `rak`, `tahun_terbit`, `isbn`, `stock`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'Last Hope is Me', 'Default.png', 6, 3, 2, 1, 2022, '0990AHJVS23', 19, NULL, '2023-02-14 00:18:27', NULL),
(2, 'The Half Planet is Like a Cake', 'Default.png', 6, 1, 2, 1, 2024, '280934JAVH8', 662, NULL, '2023-02-13 19:42:44', NULL),
(3, 'Dead in Sleep', 'Default.png', 4, 1, 5, 1, 2024, '30847SWVIUYSV', 11, NULL, NULL, NULL),
(4, 'How Pyhsics Work?', 'Default.png', 3, 2, 1, 1, 2024, '9384ISYG785', 34, NULL, '2023-02-14 00:19:25', NULL),
(5, 'sefse', 'Default.jpg', 6, 3, 3, 2, 2022, 'sefsefs', 1213, '2023-02-13 21:41:37', '2023-02-13 21:41:37', NULL),
(6, 'Last Hope is Me', 'Default.jpg', 5, 1, 2, 1, 2024, '0990AHJVS23', 20, '2023-02-13 21:57:15', '2023-02-13 21:57:15', NULL),
(7, 'Last Hope is Me', 'Default.jpg', 5, 1, 2, 1, 2024, '0990AHJVS23', 20, '2023-02-13 21:59:24', '2023-02-13 21:59:24', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `kategori`
--

CREATE TABLE `kategori` (
  `id` int NOT NULL,
  `kategori` varchar(255) NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `kategori`
--

INSERT INTO `kategori` (`id`, `kategori`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'Umum 11', '2023-02-14 09:58:02', '2023-02-13 21:14:04', NULL),
(2, 'Sains', '2023-02-14 00:00:00', NULL, NULL),
(3, 'Sejarah', '2023-02-14 09:58:26', NULL, NULL),
(4, 'Horror', '2023-02-14 09:58:32', NULL, NULL),
(5, 'Action', '2023-02-14 00:00:00', NULL, NULL),
(6, 'Gore', '1900-01-16 00:00:00', NULL, NULL),
(7, 'tes', '2023-02-13 21:06:42', '2023-02-13 21:08:01', '2023-02-13 21:08:01'),
(8, 'tes', '2023-02-13 21:09:00', '2023-02-13 21:09:37', '2023-02-13 21:09:37');

-- --------------------------------------------------------

--
-- Table structure for table `kelas`
--

CREATE TABLE `kelas` (
  `id` int NOT NULL,
  `nama_kelas` varchar(255) NOT NULL,
  `wali_kelas` varchar(255) NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `kelas`
--

INSERT INTO `kelas` (`id`, `nama_kelas`, `wali_kelas`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'XII-RPL', 'Asep', NULL, NULL, NULL),
(2, 'XII-MM', 'Ucup', NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `pemberitahuan`
--

CREATE TABLE `pemberitahuan` (
  `id` int NOT NULL,
  `judul` varchar(255) NOT NULL,
  `isi` text NOT NULL,
  `level_akses` enum('0','1','2') NOT NULL,
  `status` enum('0','1') NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `pemberitahuan`
--

INSERT INTO `pemberitahuan` (`id`, `judul`, `isi`, `level_akses`, `status`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'Selamat datang di perpus kami', 'Semoga harimu menyenangkan yaaa', '0', '1', '2023-02-14 07:39:04', '2023-02-14 00:00:00', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `peminjaman`
--

CREATE TABLE `peminjaman` (
  `id` int NOT NULL,
  `buku_id` int NOT NULL,
  `user_id` int NOT NULL,
  `kondisi_sebelum` enum('0','1') DEFAULT NULL,
  `kondisi_sesudah` enum('0','1','2') CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `status` enum('0','1','2') CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `durasi` int NOT NULL,
  `batas_pinjam` datetime DEFAULT NULL,
  `tanggal_kembali` datetime DEFAULT NULL,
  `denda` int DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `peminjaman`
--

INSERT INTO `peminjaman` (`id`, `buku_id`, `user_id`, `kondisi_sebelum`, `kondisi_sesudah`, `status`, `durasi`, `batas_pinjam`, `tanggal_kembali`, `denda`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 1, 1, '1', '1', '2', 2, '2023-02-14 07:19:38', '2023-02-14 00:00:00', NULL, '2023-02-13 02:00:57', '2023-02-13 02:00:57', NULL),
(3, 1, 4, '1', '0', '2', 2, '2023-02-27 19:40:18', '2023-02-13 20:25:47', 20000, '2023-02-13 18:20:17', '2023-02-13 20:25:47', NULL),
(4, 2, 4, '0', '0', '2', 2, '2023-02-27 19:42:43', '2023-02-13 20:09:37', NULL, '2023-02-13 18:30:22', '2023-02-13 20:09:37', NULL),
(5, 2, 1, NULL, NULL, '0', 2, NULL, NULL, NULL, '2023-02-13 18:30:34', '2023-02-13 18:32:44', '2023-02-13 18:32:44'),
(6, 1, 4, '1', '2', '2', 2, '2023-02-27 19:46:32', '2023-02-13 20:30:07', 50000, '2023-02-13 19:46:11', '2023-02-13 20:30:07', NULL),
(7, 4, 1, '1', '0', '2', 2, '2023-02-27 20:17:23', '2023-02-14 00:19:24', 20000, '2023-02-13 20:17:23', '2023-02-14 00:19:24', NULL),
(8, 4, 1, '1', '0', '2', 2, '2023-02-27 20:18:16', '2023-02-13 20:30:22', 20000, '2023-02-13 20:18:16', '2023-02-13 20:30:22', NULL),
(9, 1, 1, NULL, NULL, '0', 2, NULL, NULL, NULL, '2023-02-14 00:15:23', '2023-02-14 00:15:27', '2023-02-14 00:15:27'),
(10, 1, 1, '1', NULL, '1', 2, '2023-02-28 00:18:27', NULL, NULL, '2023-02-14 00:16:15', '2023-02-14 00:18:27', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `penerbit`
--

CREATE TABLE `penerbit` (
  `id` int NOT NULL,
  `penerbit` varchar(255) NOT NULL,
  `kode_penerbit` varchar(255) NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `penerbit`
--

INSERT INTO `penerbit` (`id`, `penerbit`, `kode_penerbit`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'HR. HUARAX', 'KD_9812HA4', NULL, NULL, NULL),
(2, 'R.M.B Cooperative', 'KD_8072HJA2', NULL, NULL, NULL),
(3, 'Gramedia.id', 'KD_972AGJA412', NULL, NULL, NULL),
(4, 'UMBRELLA.CO', 'KD_68273LAOBN12', NULL, NULL, NULL),
(5, 'Birus', 'KD_893928GAJSH', NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `pengarang`
--

CREATE TABLE `pengarang` (
  `id` int NOT NULL,
  `pengarang` varchar(255) NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `pengarang`
--

INSERT INTO `pengarang` (`id`, `pengarang`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'Asep Kronos', NULL, NULL, NULL),
(2, 'Yud Haing Holi', NULL, NULL, NULL),
(3, 'Heilang Yu Shoin', NULL, NULL, NULL),
(4, 'Las trespretiawq', NULL, NULL, NULL),
(5, 'Los Prosi Ontroins Onzekr', NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `pesan`
--

CREATE TABLE `pesan` (
  `id` int NOT NULL,
  `dari_user_id` int NOT NULL,
  `untuk_user_id` int NOT NULL,
  `judul` varchar(255) NOT NULL,
  `isi` varchar(255) NOT NULL,
  `status` enum('0','1') NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `pesan`
--

INSERT INTO `pesan` (`id`, `dari_user_id`, `untuk_user_id`, `judul`, `isi`, `status`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 4, 1, 'halo halo', '<p>haloooo</p>', '1', '2023-02-13 01:53:45', '2023-02-13 01:54:00', NULL),
(2, 4, 1, 'serser', '<p>serser</p>', '1', '2023-02-13 01:54:59', '2023-02-13 01:55:39', NULL),
(3, 1, 4, '123', '<p>123</p>', '1', '2023-02-13 18:32:00', '2023-02-13 18:32:14', NULL),
(4, 4, 1, 'uyoooo', '<p>yooooo</p>', '1', '2023-02-13 18:32:21', '2023-02-13 18:32:30', NULL),
(5, 5, 4, '123', '<p>123</p>', '1', '2023-02-13 19:05:28', '2023-02-13 20:10:14', NULL),
(6, 1, 5, 'halo', '<p>halo</p>', '0', '2023-02-14 00:16:48', '2023-02-14 00:16:48', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `rak`
--

CREATE TABLE `rak` (
  `id` int NOT NULL,
  `rak` varchar(255) NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `rak`
--

INSERT INTO `rak` (`id`, `rak`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'A-001', NULL, NULL, NULL),
(2, 'A-002', NULL, NULL, NULL),
(3, 'A-003', NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `id` int NOT NULL,
  `username` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `fullname` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `nis` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `kelas` int DEFAULT NULL,
  `foto` text,
  `alamat` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `verif` enum('0','1') NOT NULL,
  `role` enum('anggota','admin') NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`id`, `username`, `password`, `email`, `fullname`, `nis`, `kelas`, `foto`, `alamat`, `verif`, `role`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'sergi', '$2y$10$YZu2m5yNc79m0WRwa2WVyOzoNeJgM0VFh0Ww97ZYJv96JARHNK1Ku', 'test@gmail.com', 'sergi sultan', '0104', 2, '1676355299_8096e552e9ddaa424d21.jpg', '', '1', 'anggota', '2023-02-12 21:59:25', '2023-02-14 00:14:59', NULL),
(4, 'sergihen', '$2y$10$pUHF/CmCy0UMfYEbjZ7KcuDHsx2wucNWbaqUsKSSAOHE2ZKHuibhW', 'sergihe@test.com', 'sergihen', NULL, NULL, 'Default.jpg', NULL, '1', 'anggota', '2023-02-13 01:53:11', '2023-02-13 01:53:11', NULL),
(5, 'Admin', '$2y$10$q4/UIJ/QKGzCqiNTGxoSFOMLrZ4lqS0IXMrf92yl8dgItSyyapyKG', 'Admin@email.com', 'Admin', NULL, NULL, 'Default.jpg', 'Jalan', '1', 'admin', '2023-02-13 18:33:23', '2023-02-13 19:05:03', NULL),

--
-- Indexes for dumped tables
--

--
-- Indexes for table `aplikasi`
--
ALTER TABLE `aplikasi`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `buku`
--
ALTER TABLE `buku`
  ADD PRIMARY KEY (`id`),
  ADD KEY `kategori` (`kategori`),
  ADD KEY `penerbit` (`penerbit`),
  ADD KEY `rak` (`rak`),
  ADD KEY `pengarang` (`pengarang`);

--
-- Indexes for table `kategori`
--
ALTER TABLE `kategori`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `kelas`
--
ALTER TABLE `kelas`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `pemberitahuan`
--
ALTER TABLE `pemberitahuan`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `peminjaman`
--
ALTER TABLE `peminjaman`
  ADD PRIMARY KEY (`id`),
  ADD KEY `buku_id` (`buku_id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `penerbit`
--
ALTER TABLE `penerbit`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `pengarang`
--
ALTER TABLE `pengarang`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `pesan`
--
ALTER TABLE `pesan`
  ADD PRIMARY KEY (`id`),
  ADD KEY `dari_user_id` (`dari_user_id`),
  ADD KEY `untuk_user_id` (`untuk_user_id`);

--
-- Indexes for table `rak`
--
ALTER TABLE `rak`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`),
  ADD UNIQUE KEY `email` (`email`),
  ADD KEY `kelas` (`kelas`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `aplikasi`
--
ALTER TABLE `aplikasi`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `buku`
--
ALTER TABLE `buku`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `kategori`
--
ALTER TABLE `kategori`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `kelas`
--
ALTER TABLE `kelas`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `pemberitahuan`
--
ALTER TABLE `pemberitahuan`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `peminjaman`
--
ALTER TABLE `peminjaman`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `penerbit`
--
ALTER TABLE `penerbit`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `pengarang`
--
ALTER TABLE `pengarang`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `pesan`
--
ALTER TABLE `pesan`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `rak`
--
ALTER TABLE `rak`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `buku`
--
ALTER TABLE `buku`
  ADD CONSTRAINT `buku_ibfk_1` FOREIGN KEY (`penerbit`) REFERENCES `penerbit` (`id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `buku_ibfk_2` FOREIGN KEY (`kategori`) REFERENCES `kategori` (`id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `buku_ibfk_3` FOREIGN KEY (`pengarang`) REFERENCES `pengarang` (`id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `buku_ibfk_4` FOREIGN KEY (`rak`) REFERENCES `rak` (`id`) ON UPDATE CASCADE;

--
-- Constraints for table `peminjaman`
--
ALTER TABLE `peminjaman`
  ADD CONSTRAINT `peminjaman_ibfk_1` FOREIGN KEY (`buku_id`) REFERENCES `buku` (`id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `peminjaman_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON UPDATE CASCADE;

--
-- Constraints for table `pesan`
--
ALTER TABLE `pesan`
  ADD CONSTRAINT `pesan_ibfk_1` FOREIGN KEY (`dari_user_id`) REFERENCES `user` (`id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `pesan_ibfk_2` FOREIGN KEY (`untuk_user_id`) REFERENCES `user` (`id`) ON UPDATE CASCADE;

--
-- Constraints for table `user`
--
ALTER TABLE `user`
  ADD CONSTRAINT `user_ibfk_1` FOREIGN KEY (`kelas`) REFERENCES `kelas` (`id`) ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
