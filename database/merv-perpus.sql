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

-- Dumping structure for table merv_perpus_v1.aplikasi
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

-- Dumping data for table merv_perpus_v1.aplikasi: ~1 rows (approximately)
REPLACE INTO `aplikasi` (`id`, `nama_app`, `foto`, `logo`, `alamat_app`, `email_app`, `nomor_hp`, `copyright`, `created_at`, `updated_at`, `deleted_at`) VALUES
	(1, 'Merv Perpus', 'book.jfif', '1720668323_c332e5ea96b85d95d52d.jpg', 'Bekasi', 'ddd@merv-perpus.xyz', '123456789', 'sergihen7', NULL, '2024-07-10 22:25:23', NULL);

-- Dumping structure for table merv_perpus_v1.buku
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
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table merv_perpus_v1.buku: ~6 rows (approximately)
REPLACE INTO `buku` (`id`, `judul`, `sampul`, `kategori`, `penerbit`, `pengarang`, `rak`, `tahun_terbit`, `isbn`, `stock`, `created_at`, `updated_at`, `deleted_at`) VALUES
	(1, 'Last Hope is Me', 'Default.png', 6, 3, 2, 1, '2022', '0990AHJVS23', 19, NULL, '2023-02-14 00:18:27', NULL),
	(2, 'The Half Planet is Like a Cake', 'Default.png', 6, 1, 2, 1, '2024', '280934JAVH8', 662, NULL, '2023-02-13 19:42:44', NULL),
	(3, 'Dead in Sleep', 'Default.png', 4, 1, 5, 1, '2024', '30847SWVIUYSV', 11, NULL, NULL, NULL),
	(4, 'How Pyhsics Work?', 'Default.png', 3, 2, 1, 1, '2024', '9384ISYG785', 34, NULL, '2023-02-14 00:19:25', NULL),
	(5, 'sefse', 'Default.jpg', 6, 3, 3, 2, '2022', 'sefsefs', 1213, '2023-02-13 21:41:37', '2023-02-13 21:41:37', NULL),
	(6, 'Last Hope is Me', 'Default.jpg', 5, 1, 2, 1, '2024', '0990AHJVS23', 20, '2023-02-13 21:57:15', '2023-02-13 21:57:15', NULL);

-- Dumping structure for table merv_perpus_v1.kategori
CREATE TABLE IF NOT EXISTS `kategori` (
  `id` int NOT NULL AUTO_INCREMENT,
  `kategori` varchar(255) NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table merv_perpus_v1.kategori: ~7 rows (approximately)
REPLACE INTO `kategori` (`id`, `kategori`, `created_at`, `updated_at`, `deleted_at`) VALUES
	(1, 'Umum 11', '2023-02-14 09:58:02', '2023-02-13 21:14:04', NULL),
	(2, 'Sains', '2023-02-14 00:00:00', NULL, NULL),
	(3, 'Sejarah', '2023-02-14 09:58:26', NULL, NULL),
	(4, 'Horror', '2023-02-14 09:58:32', NULL, NULL),
	(5, 'Action', '2023-02-14 00:00:00', NULL, NULL),
	(6, 'Gore', '1900-01-16 00:00:00', NULL, NULL),
	(7, 'tes', '2023-02-13 21:06:42', '2023-02-13 21:08:01', '2023-02-13 21:08:01');

-- Dumping structure for table merv_perpus_v1.pemberitahuan
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

-- Dumping data for table merv_perpus_v1.pemberitahuan: ~1 rows (approximately)
REPLACE INTO `pemberitahuan` (`id`, `judul`, `isi`, `level_akses`, `status`, `created_at`, `updated_at`, `deleted_at`) VALUES
	(1, 'Selamat datang di perpus kami', 'Semoga harimu menyenangkan yaaa', '0', '1', '2023-02-14 07:39:04', '2023-02-14 00:00:00', NULL);

-- Dumping structure for table merv_perpus_v1.peminjaman
CREATE TABLE IF NOT EXISTS `peminjaman` (
  `id` int NOT NULL AUTO_INCREMENT,
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
  `deleted_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `buku_id` (`buku_id`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `peminjaman_ibfk_1` FOREIGN KEY (`buku_id`) REFERENCES `buku` (`id`) ON UPDATE CASCADE,
  CONSTRAINT `peminjaman_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table merv_perpus_v1.peminjaman: ~10 rows (approximately)
REPLACE INTO `peminjaman` (`id`, `buku_id`, `user_id`, `kondisi_sebelum`, `kondisi_sesudah`, `status`, `durasi`, `batas_pinjam`, `tanggal_kembali`, `denda`, `created_at`, `updated_at`, `deleted_at`) VALUES
	(1, 1, 1, '1', '1', '2', 2, '2023-02-14 07:19:38', '2023-02-14 00:00:00', NULL, '2023-02-13 02:00:57', '2023-02-13 02:00:57', NULL),
	(3, 1, 4, '1', '0', '2', 2, '2023-02-27 19:40:18', '2023-02-13 20:25:47', 20000, '2023-02-13 18:20:17', '2023-02-13 20:25:47', NULL),
	(4, 2, 4, '0', '0', '2', 2, '2023-02-27 19:42:43', '2023-02-13 20:09:37', NULL, '2023-02-13 18:30:22', '2023-02-13 20:09:37', NULL),
	(5, 2, 1, NULL, NULL, '0', 2, NULL, NULL, NULL, '2023-02-13 18:30:34', '2023-02-13 18:32:44', '2023-02-13 18:32:44'),
	(6, 1, 4, '1', '2', '2', 2, '2023-02-27 19:46:32', '2023-02-13 20:30:07', 50000, '2023-02-13 19:46:11', '2023-02-13 20:30:07', NULL),
	(7, 4, 1, '1', '0', '2', 2, '2023-02-27 20:17:23', '2023-02-14 00:19:24', 20000, '2023-02-13 20:17:23', '2023-02-14 00:19:24', NULL),
	(8, 4, 1, '1', '0', '2', 2, '2023-02-27 20:18:16', '2023-02-13 20:30:22', 20000, '2023-02-13 20:18:16', '2023-02-13 20:30:22', NULL),
	(9, 1, 1, NULL, NULL, '0', 2, NULL, NULL, NULL, '2023-02-14 00:15:23', '2023-02-14 00:15:27', '2023-02-14 00:15:27'),
	(10, 1, 1, '1', NULL, '1', 2, '2023-02-28 00:18:27', NULL, NULL, '2023-02-14 00:16:15', '2023-02-14 00:18:27', NULL),
	(11, 1, 5, NULL, NULL, '0', 3, NULL, NULL, NULL, '2024-07-09 01:51:33', '2024-07-09 01:51:33', NULL);

-- Dumping structure for table merv_perpus_v1.penerbit
CREATE TABLE IF NOT EXISTS `penerbit` (
  `id` int NOT NULL AUTO_INCREMENT,
  `penerbit` varchar(255) NOT NULL,
  `kode_penerbit` varchar(255) NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table merv_perpus_v1.penerbit: ~5 rows (approximately)
REPLACE INTO `penerbit` (`id`, `penerbit`, `kode_penerbit`, `created_at`, `updated_at`, `deleted_at`) VALUES
	(1, 'HR. HUARAX', 'KD_9812HA4', NULL, NULL, NULL),
	(2, 'R.M.B Cooperative', 'KD_8072HJA2', NULL, NULL, NULL),
	(3, 'Gramedia.id', 'KD_972AGJA412', NULL, NULL, NULL),
	(4, 'UMBRELLA.CO', 'KD_68273LAOBN12', NULL, NULL, NULL),
	(5, 'Birus', 'KD_893928GAJSH', NULL, NULL, NULL);

-- Dumping structure for table merv_perpus_v1.pengarang
CREATE TABLE IF NOT EXISTS `pengarang` (
  `id` int NOT NULL AUTO_INCREMENT,
  `pengarang` varchar(255) NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table merv_perpus_v1.pengarang: ~5 rows (approximately)
REPLACE INTO `pengarang` (`id`, `pengarang`, `created_at`, `updated_at`, `deleted_at`) VALUES
	(1, 'Asep Kronos', NULL, NULL, NULL),
	(2, 'Yud Haing Holi', NULL, NULL, NULL),
	(3, 'Heilang Yu Shoin', NULL, NULL, NULL),
	(4, 'Las trespretiawq', NULL, NULL, NULL),
	(5, 'Los Prosi Ontroins Onzekr', NULL, NULL, NULL);

-- Dumping structure for table merv_perpus_v1.pesan
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
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table merv_perpus_v1.pesan: ~0 rows (approximately)
REPLACE INTO `pesan` (`id`, `dari_user_id`, `untuk_user_id`, `judul`, `isi`, `status`, `created_at`, `updated_at`, `deleted_at`) VALUES
	(9, 5, 4, 'Testimoni', '<p>Ini Pesan Testimoni</p>', '1', '2024-07-10 22:34:19', '2024-07-10 22:34:41', NULL),
	(10, 4, 5, '', '<p>Halo, Perkenalan</p><p>Saya Manusia <b><u><i style="background-color: rgb(0, 255, 255);">Biasa</i></u></b></p><ul><li>List 1</li><li>List 2</li></ul>', '1', '2024-07-10 22:37:13', '2024-07-10 22:37:33', NULL);

-- Dumping structure for table merv_perpus_v1.rak
CREATE TABLE IF NOT EXISTS `rak` (
  `id` int NOT NULL AUTO_INCREMENT,
  `rak` varchar(255) NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table merv_perpus_v1.rak: ~3 rows (approximately)
REPLACE INTO `rak` (`id`, `rak`, `created_at`, `updated_at`, `deleted_at`) VALUES
	(1, 'A-001', NULL, NULL, NULL),
	(2, 'A-002', NULL, NULL, NULL),
	(3, 'A-003', NULL, NULL, NULL);

-- Dumping structure for table merv_perpus_v1.user
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
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table merv_perpus_v1.user: ~3 rows (approximately)
REPLACE INTO `user` (`id`, `username`, `password`, `email`, `fullname`, `foto`, `alamat`, `verif`, `role`, `created_at`, `updated_at`, `deleted_at`) VALUES
	(1, 'sergi', '$2y$10$YZu2m5yNc79m0WRwa2WVyOzoNeJgM0VFh0Ww97ZYJv96JARHNK1Ku', 'test@gmail.com', 'sergi sultan', '1676355299_8096e552e9ddaa424d21.jpg', '', '1', 'anggota', '2023-02-12 21:59:25', '2023-02-14 00:14:59', NULL),
	(4, 'sergihen', '$2y$10$qe1FWJB5YmsPxHI7plWeMeGTGS7Cv78SjARo3Mi2MUxmr4c1reQsu', 'sergihen@test.com', 'sergihen', '1720506385_5021351ca1ccf86d24a1.jpg', '', '1', 'anggota', '2023-02-13 01:53:11', '2024-07-09 03:25:23', NULL),
	(5, 'admin', '$2y$10$KrhVPGcCB1aEba94nzrAseF8w.S9DAx89DddlHhdAhS7AERFga/xC', 'Admin@email.com', 'Administration', 'Default.jpg', 'Jalan', '1', 'admin', '2023-02-13 18:33:23', '2024-07-09 05:05:03', NULL);

/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
