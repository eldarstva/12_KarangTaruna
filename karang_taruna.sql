-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Oct 13, 2026 at 02:25 PM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.0.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `karang_taruna`
--

-- --------------------------------------------------------

--
-- Table structure for table `absensi`
--

CREATE TABLE `absensi` (
  `id` int(11) NOT NULL,
  `kegiatan_id` int(11) NOT NULL,
  `anggota_id` int(11) NOT NULL,
  `status` enum('Hadir','Izin','Tidak Hadir') NOT NULL DEFAULT 'Hadir',
  `keterangan` varchar(255) DEFAULT NULL,
  `tanggal_input` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `absensi`
--

INSERT INTO `absensi` (`id`, `kegiatan_id`, `anggota_id`, `status`, `keterangan`, `tanggal_input`, `updated_at`) VALUES
(1, 2, 4, 'Hadir', '', '2026-10-10 07:38:44', '2026-10-10 07:47:06'),
(2, 2, 3, 'Tidak Hadir', '', '2026-10-10 07:38:44', '2026-10-10 07:47:06'),
(3, 2, 1, 'Izin', 'Sakit', '2026-10-10 07:38:44', '2026-10-10 07:47:06'),
(4, 2, 2, 'Hadir', '', '2026-10-10 07:38:44', '2026-10-10 07:47:06'),
(5, 3, 1, 'Hadir', '', '2026-10-13 12:15:44', '2026-10-13 12:15:44'),
(6, 3, 2, 'Hadir', '', '2026-10-13 12:15:44', '2026-10-13 12:15:44'),
(7, 3, 3, 'Hadir', '', '2026-10-13 12:15:44', '2026-10-13 12:15:44'),
(8, 3, 4, 'Hadir', '', '2026-10-13 12:15:44', '2026-10-13 12:15:44');

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

CREATE TABLE `admin` (
  `id` int(11) NOT NULL,
  `username` varchar(50) NOT NULL,
  `password` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `admin`
--

INSERT INTO `admin` (`id`, `username`, `password`) VALUES
(1, 'admin', '$2y$10$WatBxW5wGyQJFSjNXVZRjOP4dzHZgw.v7L4kE6gsDuCWU9UIxsrt2');

-- --------------------------------------------------------

--
-- Table structure for table `akun_anggota`
--

CREATE TABLE `akun_anggota` (
  `id` int(11) NOT NULL,
  `nama` varchar(100) NOT NULL,
  `username` varchar(50) NOT NULL,
  `password` varchar(255) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `akun_anggota`
--

INSERT INTO `akun_anggota` (`id`, `nama`, `username`, `password`, `created_at`) VALUES
(1, 'Anggota Karang Taruna', 'anggota1', '$2y$10$VQKbh593lrirRi5sTKHZ7eP79RqUuWxiW6exQIDH.iAkoibWiVlzu', '2026-10-05 11:32:27');

-- --------------------------------------------------------

--
-- Table structure for table `anggota`
--

CREATE TABLE `anggota` (
  `id` int(11) NOT NULL,
  `nama` varchar(100) NOT NULL,
  `jabatan` varchar(100) NOT NULL,
  `jenis_kelamin` varchar(20) NOT NULL,
  `alamat` text DEFAULT NULL,
  `no_hp` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `anggota`
--

INSERT INTO `anggota` (`id`, `nama`, `jabatan`, `jenis_kelamin`, `alamat`, `no_hp`) VALUES
(1, 'Elda ', 'Sekretaris', 'Perempuan', 'Cawas', '085712713494'),
(2, 'Mira', 'Sekretaris', 'Perempuan', 'Cawas', '085167456837'),
(3, 'Dirly', 'Anggota', 'Perempuan', 'Caas', '885727453675'),
(4, 'Bintang', 'Ketua', 'Laki-laki', 'Cawas', '085375093428');

-- --------------------------------------------------------

--
-- Table structure for table `galeri`
--

CREATE TABLE `galeri` (
  `id` int(11) NOT NULL,
  `judul` varchar(100) NOT NULL,
  `foto` varchar(255) NOT NULL,
  `keterangan` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `galeri`
--

INSERT INTO `galeri` (`id`, `judul`, `foto`, `keterangan`) VALUES
(1, 'Kerja Bakti', '1790596888_6aba57180c733.jpeg', 'Membersihkan Sampah yang ada di sekitar desa'),
(2, 'Rapat Rutin', '1791631958_6aca2256c53a7.jpeg', 'Membahas pembuatan sragam');

-- --------------------------------------------------------

--
-- Table structure for table `kegiatan`
--

CREATE TABLE `kegiatan` (
  `id` int(11) NOT NULL,
  `nama_kegiatan` varchar(100) NOT NULL,
  `tanggal` date NOT NULL,
  `lokasi` varchar(100) NOT NULL,
  `foto` varchar(255) DEFAULT '',
  `deskripsi` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `kegiatan`
--

INSERT INTO `kegiatan` (`id`, `nama_kegiatan`, `tanggal`, `lokasi`, `foto`, `deskripsi`) VALUES
(1, 'Gotong Royong', '2026-09-13', 'Desa Gombang', '', 'Membersihkan Sampah yanga ada di desa'),
(2, 'Gotong Royong', '2026-10-16', 'Desa Gombang', '', 'kerja bakti'),
(3, 'Rapat ', '2026-10-17', 'Pertigaan Rw 06 Gombang', '', 'kumpulan rutin');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `absensi`
--
ALTER TABLE `absensi`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `unik_absensi` (`kegiatan_id`,`anggota_id`);

--
-- Indexes for table `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`);

--
-- Indexes for table `akun_anggota`
--
ALTER TABLE `akun_anggota`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`);

--
-- Indexes for table `anggota`
--
ALTER TABLE `anggota`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `galeri`
--
ALTER TABLE `galeri`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `kegiatan`
--
ALTER TABLE `kegiatan`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `absensi`
--
ALTER TABLE `absensi`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `admin`
--
ALTER TABLE `admin`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `akun_anggota`
--
ALTER TABLE `akun_anggota`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `anggota`
--
ALTER TABLE `anggota`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `galeri`
--
ALTER TABLE `galeri`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `kegiatan`
--
ALTER TABLE `kegiatan`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
