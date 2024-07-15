-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Server version:               8.0.30 - MySQL Community Server - GPL
-- Server OS:                    Win64
-- HeidiSQL Version:             12.1.0.6537
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

-- Dumping structure for table merv_perpus.aplikasi
CREATE TABLE IF NOT EXISTS `aplikasi` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nama_app` varchar(255) NOT NULL,
  `foto` text NOT NULL,
  `logo` text NOT NULL,
  `alamat_app` varchar(255) NOT NULL,
  `email_app` varchar(255) NOT NULL,
  `nomor_hp` varchar(255) NOT NULL,
  `copyright` varchar(255) NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table merv_perpus.aplikasi: ~0 rows (approximately)
REPLACE INTO `aplikasi` (`id`, `nama_app`, `foto`, `logo`, `alamat_app`, `email_app`, `nomor_hp`, `copyright`, `created_at`, `updated_at`, `deleted_at`) VALUES
	(1, 'Merv Perpus', 'book.jfif', '1720668323_c332e5ea96b85d95d52d.jpg', 'Bekasi', 'ddd@merv-perpus.xyz', '123456789', 'sergihen7', NULL, '2024-07-13 23:30:35', NULL);

-- Dumping structure for table merv_perpus.buku
CREATE TABLE IF NOT EXISTS `buku` (
  `id` int NOT NULL AUTO_INCREMENT,
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
  `deleted_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `kategori` (`kategori`),
  KEY `penerbit` (`penerbit`),
  KEY `rak` (`rak`),
  KEY `pengarang` (`pengarang`),
  CONSTRAINT `buku_ibfk_1` FOREIGN KEY (`penerbit`) REFERENCES `penerbit` (`id`) ON UPDATE CASCADE,
  CONSTRAINT `buku_ibfk_2` FOREIGN KEY (`kategori`) REFERENCES `kategori` (`id`) ON UPDATE CASCADE,
  CONSTRAINT `buku_ibfk_3` FOREIGN KEY (`pengarang`) REFERENCES `pengarang` (`id`) ON UPDATE CASCADE,
  CONSTRAINT `buku_ibfk_4` FOREIGN KEY (`rak`) REFERENCES `rak` (`id`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table merv_perpus.buku: ~5 rows (approximately)
REPLACE INTO `buku` (`id`, `judul`, `sampul`, `kategori`, `penerbit`, `pengarang`, `rak`, `tahun_terbit`, `isbn`, `stock`, `created_at`, `updated_at`, `deleted_at`) VALUES
	(1, 'Last Hope is Me', 'Default.png', 6, 3, 2, 1, '2022', '0990AHJVS23', 19, NULL, '2024-07-13 13:35:36', NULL),
	(2, 'The Half Planet is Like a Cake', 'Default.png', 6, 1, 2, 1, '2024', '280934JAVH8', 662, NULL, '2023-02-13 19:42:44', NULL),
	(3, 'Dead in Sleep', 'Default.png', 4, 1, 5, 1, '2024', '30847SWVIUYSV', 10, NULL, '2024-07-13 09:11:31', NULL),
	(4, 'How Pyhsics Work?', 'Default.png', 3, 2, 1, 1, '2024', '9384ISYG785', 34, NULL, '2023-02-14 00:19:25', NULL),
	(6, 'Last Hope is Me', 'Default.png', 5, 1, 2, 1, '2024', '0990AHJVS23', 20, '2023-02-13 21:57:15', '2024-07-13 10:09:38', NULL);

-- Dumping structure for table merv_perpus.kategori
CREATE TABLE IF NOT EXISTS `kategori` (
  `id` int NOT NULL AUTO_INCREMENT,
  `kategori` varchar(255) NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table merv_perpus.kategori: ~6 rows (approximately)
REPLACE INTO `kategori` (`id`, `kategori`, `created_at`, `updated_at`, `deleted_at`) VALUES
	(1, 'Umum 11', '2023-02-14 09:58:02', '2024-07-13 13:02:07', NULL),
	(2, 'Sains', '2023-02-14 00:00:00', NULL, NULL),
	(3, 'Sejarah', '2023-02-14 09:58:26', NULL, NULL),
	(4, 'Horror', '2023-02-14 09:58:32', NULL, NULL),
	(5, 'Action', '2023-02-14 00:00:00', NULL, NULL),
	(6, 'Gore', '1900-01-16 00:00:00', NULL, NULL);

-- Dumping structure for table merv_perpus.pemberitahuan
CREATE TABLE IF NOT EXISTS `pemberitahuan` (
  `id` int NOT NULL AUTO_INCREMENT,
  `judul` varchar(255) NOT NULL,
  `isi` text NOT NULL,
  `level_akses` enum('0','1','2') CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '0: Semua, 1: Admin, 2: Member',
  `status` enum('0','1') CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '0: Tidak Aktif, 1: Aktif',
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table merv_perpus.pemberitahuan: ~0 rows (approximately)
REPLACE INTO `pemberitahuan` (`id`, `judul`, `isi`, `level_akses`, `status`, `created_at`, `updated_at`, `deleted_at`) VALUES
	(1, 'Selamat datang di perpus kami', 'Semoga harimu menyenangkan yaaa', '0', '1', '2023-02-14 07:39:04', '2023-02-14 00:00:00', NULL);

-- Dumping structure for table merv_perpus.peminjaman
CREATE TABLE IF NOT EXISTS `peminjaman` (
  `id` int NOT NULL AUTO_INCREMENT,
  `buku_id` int NOT NULL,
  `user_id` int NOT NULL,
  `kondisi_sebelum` enum('0','1') CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '0: "Rusak"; 1: "Baik"',
  `kondisi_sesudah` enum('0','1','2') CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '0: "Rusak"; 1: "Baik"; 2: "Hilang"',
  `status` enum('0','1','2') CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '0: "Perminitaan"; 1: "Dipinjam"; 2: "Dikembalikan"',
  `durasi` int NOT NULL,
  `batas_pinjam` datetime DEFAULT NULL,
  `tanggal_kembali` datetime DEFAULT NULL,
  `denda` int DEFAULT NULL,
  `denda_status` enum('0','1') DEFAULT NULL COMMENT '0: "belum Lunas"; 1: "Lunas"',
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `buku_id` (`buku_id`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `peminjaman_ibfk_1` FOREIGN KEY (`buku_id`) REFERENCES `buku` (`id`) ON UPDATE CASCADE,
  CONSTRAINT `peminjaman_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table merv_perpus.peminjaman: ~16 rows (approximately)
REPLACE INTO `peminjaman` (`id`, `buku_id`, `user_id`, `kondisi_sebelum`, `kondisi_sesudah`, `status`, `durasi`, `batas_pinjam`, `tanggal_kembali`, `denda`, `denda_status`, `created_at`, `updated_at`, `deleted_at`) VALUES
	(1, 1, 1, '1', '1', '2', 2, '2023-02-14 07:19:38', '2023-02-14 00:00:00', NULL, NULL, '2023-02-13 02:00:57', '2023-02-13 02:00:57', NULL),
	(3, 1, 4, '1', '0', '2', 2, '2023-02-27 19:40:18', '2023-02-13 20:25:47', 20000, '0', '2023-02-13 18:20:17', '2023-02-13 20:25:47', NULL),
	(4, 2, 4, '0', '0', '2', 2, '2023-02-27 19:42:43', '2023-02-13 20:09:37', NULL, NULL, '2023-02-13 18:30:22', '2023-02-13 20:09:37', NULL),
	(5, 2, 1, NULL, NULL, '0', 2, NULL, NULL, NULL, NULL, '2023-02-13 18:30:34', '2023-02-13 18:32:44', '2023-02-13 18:32:44'),
	(6, 1, 4, '1', '2', '2', 2, '2023-02-27 19:46:32', '2023-02-13 20:30:07', 50000, '1', '2023-02-13 19:46:11', '2023-02-13 20:30:07', NULL),
	(7, 4, 1, '1', '0', '2', 2, '2023-02-27 20:17:23', '2023-02-14 00:19:24', 20000, '0', '2023-02-13 20:17:23', '2023-02-14 00:19:24', NULL),
	(8, 4, 1, '1', '0', '2', 2, '2023-02-27 20:18:16', '2023-02-13 20:30:22', 20000, '0', '2023-02-13 20:18:16', '2023-02-13 20:30:22', NULL),
	(9, 1, 1, NULL, NULL, '0', 2, NULL, NULL, NULL, NULL, '2023-02-14 00:15:23', '2023-02-14 00:15:27', '2023-02-14 00:15:27'),
	(10, 1, 1, '1', '2', '2', 2, '2023-02-28 00:18:27', '2024-07-13 13:35:36', 58000, '0', '2023-02-14 00:16:15', '2024-07-13 13:35:36', NULL),
	(11, 1, 5, NULL, NULL, '0', 3, NULL, NULL, NULL, NULL, '2024-07-09 01:51:33', '2024-07-09 01:51:33', NULL),
	(13, 2, 4, NULL, NULL, '0', 2, NULL, NULL, NULL, NULL, '2024-07-12 10:31:56', '2024-07-12 14:40:33', '2024-07-12 14:40:33'),
	(14, 1, 4, '1', '0', '2', 1, '2024-07-20 03:13:12', '2024-07-13 03:13:21', 20000, '1', '2024-07-12 14:41:34', '2024-07-13 13:34:58', NULL),
	(15, 1, 4, '1', NULL, '1', 1, '2024-07-20 08:05:27', NULL, NULL, NULL, '2024-07-13 07:55:39', '2024-07-13 08:05:27', NULL),
	(16, 1, 4, NULL, NULL, '0', 3, NULL, NULL, NULL, NULL, '2024-07-13 08:50:20', '2024-07-13 23:35:17', '2024-07-13 23:35:17'),
	(17, 2, 4, NULL, NULL, '0', 3, NULL, NULL, NULL, NULL, '2024-07-13 08:50:26', '2024-07-13 23:35:19', '2024-07-13 23:35:19'),
	(18, 3, 4, '1', NULL, '1', 3, '2024-08-03 09:11:31', NULL, NULL, NULL, '2024-07-13 08:50:42', '2024-07-13 09:11:31', NULL);

-- Dumping structure for table merv_perpus.penerbit
CREATE TABLE IF NOT EXISTS `penerbit` (
  `id` int NOT NULL AUTO_INCREMENT,
  `penerbit` varchar(255) NOT NULL,
  `kode_penerbit` varchar(255) NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table merv_perpus.penerbit: ~5 rows (approximately)
REPLACE INTO `penerbit` (`id`, `penerbit`, `kode_penerbit`, `created_at`, `updated_at`, `deleted_at`) VALUES
	(1, 'HR. HUARAX', 'KD_9812HA4', NULL, NULL, NULL),
	(2, 'R.M.B Cooperative', 'KD_8072HJA2', NULL, NULL, NULL),
	(3, 'Gramedia.id', 'KD_972AGJA412', NULL, NULL, NULL),
	(4, 'UMBRELLA.CO', 'KD_68273LAOBN12', NULL, NULL, NULL),
	(5, 'Birus', 'KD_893928GAJSH', NULL, NULL, NULL);

-- Dumping structure for table merv_perpus.pengarang
CREATE TABLE IF NOT EXISTS `pengarang` (
  `id` int NOT NULL AUTO_INCREMENT,
  `pengarang` varchar(255) NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table merv_perpus.pengarang: ~5 rows (approximately)
REPLACE INTO `pengarang` (`id`, `pengarang`, `created_at`, `updated_at`, `deleted_at`) VALUES
	(1, 'Asep Kronos', NULL, NULL, NULL),
	(2, 'Yud Haing Holi', NULL, NULL, NULL),
	(3, 'Heilang Yu Shoin', NULL, NULL, NULL),
	(4, 'Las trespretiawq', NULL, NULL, NULL),
	(5, 'Los Prosi Ontroins Onzekr', NULL, NULL, NULL);

-- Dumping structure for table merv_perpus.pesan
CREATE TABLE IF NOT EXISTS `pesan` (
  `id` int NOT NULL AUTO_INCREMENT,
  `dari_user_id` int NOT NULL,
  `untuk_user_id` int NOT NULL,
  `judul` varchar(255) NOT NULL,
  `isi` varchar(255) NOT NULL,
  `status` enum('0','1') NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `dari_user_id` (`dari_user_id`),
  KEY `untuk_user_id` (`untuk_user_id`),
  CONSTRAINT `pesan_ibfk_1` FOREIGN KEY (`dari_user_id`) REFERENCES `user` (`id`) ON UPDATE CASCADE,
  CONSTRAINT `pesan_ibfk_2` FOREIGN KEY (`untuk_user_id`) REFERENCES `user` (`id`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table merv_perpus.pesan: ~0 rows (approximately)
REPLACE INTO `pesan` (`id`, `dari_user_id`, `untuk_user_id`, `judul`, `isi`, `status`, `created_at`, `updated_at`, `deleted_at`) VALUES
	(9, 5, 4, 'Testimoni', '<p>Ini Pesan Testimoni</p>', '1', '2024-07-10 22:34:19', '2024-07-10 22:34:41', NULL),
	(10, 4, 5, '', '<p>Halo, Perkenalan</p><p>Saya Manusia <b><u><i style="background-color: rgb(0, 255, 255);">Biasa</i></u></b></p><ul><li>List 1</li><li>List 2</li></ul>', '1', '2024-07-10 22:37:13', '2024-07-10 22:37:33', NULL),
	(11, 4, 5, '', '<p>semua buku sudah saya kembalikan</p>', '1', '2024-07-13 07:54:30', '2024-07-13 07:55:31', NULL);

-- Dumping structure for table merv_perpus.rak
CREATE TABLE IF NOT EXISTS `rak` (
  `id` int NOT NULL AUTO_INCREMENT,
  `rak` varchar(255) NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table merv_perpus.rak: ~0 rows (approximately)
REPLACE INTO `rak` (`id`, `rak`, `created_at`, `updated_at`, `deleted_at`) VALUES
	(1, 'A-001', NULL, NULL, NULL),
	(2, 'A-002', NULL, NULL, NULL),
	(3, 'A-003', NULL, NULL, NULL),
	(4, 'Rak-12', '2024-07-13 11:17:45', '2024-07-13 13:36:41', '2024-07-13 13:36:41');

-- Dumping structure for table merv_perpus.user
CREATE TABLE IF NOT EXISTS `user` (
  `id` int NOT NULL AUTO_INCREMENT,
  `username` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `fullname` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `foto` text,
  `alamat` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `verif` enum('0','1') NOT NULL,
  `role` enum('anggota','admin') NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`),
  UNIQUE KEY `email` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table merv_perpus.user: ~5 rows (approximately)
REPLACE INTO `user` (`id`, `username`, `password`, `email`, `fullname`, `foto`, `alamat`, `verif`, `role`, `created_at`, `updated_at`, `deleted_at`) VALUES
	(1, 'sergi', '$2y$10$YZu2m5yNc79m0WRwa2WVyOzoNeJgM0VFh0Ww97ZYJv96JARHNK1Ku', 'test@gmail.com', 'sergi sultan', 'Default.jpg', '', '1', 'anggota', '2023-02-12 21:59:25', '2023-02-14 00:14:59', NULL),
	(4, 'sergihen', '$2y$10$qe1FWJB5YmsPxHI7plWeMeGTGS7Cv78SjARo3Mi2MUxmr4c1reQsu', 'sergihen@test.com', 'sergihen', '1720506385_5021351ca1ccf86d24a1.jpg', '', '1', 'anggota', '2023-02-13 01:53:11', '2024-07-09 03:25:23', NULL),
	(5, 'admin', '$2y$10$xaCw15/gPtPDCUFgInK3i.YzSCYSTrb46gJeC6fnkyA6fEWFPVdlG', 'Admin@email.com', 'Administration', 'Default.jpg', 'Jalan', '1', 'admin', '2023-02-13 18:33:23', '2024-07-13 23:19:39', NULL),
	(26, 'nathanmarsh', '$2y$10$1Fjwu1V1laSXfimqS01xvuflqcWhtg5uYS6aOrYWFpIdBzlajM/FS', 'nmmrshll@tester.com', 'Nathan M', 'Default.jpg', NULL, '1', 'anggota', '2024-07-13 09:17:42', '2024-07-13 09:17:42', NULL),
	(27, 'admin2', '$2y$10$2HqcKATFUIRiju3aDp.VOOWqSYC7IxrCZ9CwOgdY7UUcm3E61pQ4i', 'admin2@email.com', 'admin2', 'Default.jpg', NULL, '1', 'admin', '2024-07-13 23:40:57', '2024-07-13 23:40:57', NULL);

/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
