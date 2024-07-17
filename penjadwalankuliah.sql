-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 04 Jun 2023 pada 18.25
-- Versi server: 10.4.6-MariaDB
-- Versi PHP: 7.4.23

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `penjadwalankuliah`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `dosen`
--

CREATE TABLE `dosen` (
  `kode_dosen` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL,
  `nama` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `nidn` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `program_studi` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `dosen`
--

INSERT INTO `dosen` (`kode_dosen`, `nama`, `nidn`, `program_studi`, `created_at`, `updated_at`) VALUES
('MKU001', 'dodi irwansyah', '541980111901201511', 'mata kuliah umum', NULL, NULL),
('TIF001', 'rizalul akram', '0016078702', 'teknik informatika', NULL, NULL),
('TIF002', 'novianda', '0028118701', 'teknik informatika', NULL, '2023-01-20 17:15:39'),
('TIF003', 'ahmad ihsan', '198506182019031010', 'teknik informatika', '2023-01-20 17:15:08', '2023-01-20 17:15:08'),
('TIF004', 'liza fitria', '0001019001', 'teknik informatika', NULL, NULL),
('TIF005', 'nurul fadillah', '0001108901', 'teknik informatika', NULL, NULL),
('TIF006', 'munawir', '0017018704', 'teknik informatika', NULL, NULL),
('TIF007', 'khairul muttaqin', '198811078702', 'teknik informatika', NULL, NULL);

-- --------------------------------------------------------

--
-- Struktur dari tabel `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `hari`
--

CREATE TABLE `hari` (
  `kode_hari` bigint(20) UNSIGNED NOT NULL,
  `nama_hari` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `hari`
--

INSERT INTO `hari` (`kode_hari`, `nama_hari`, `created_at`, `updated_at`) VALUES
(1, 'senin', NULL, NULL),
(2, 'selasa', '2021-12-27 17:59:27', '2021-12-27 17:59:27'),
(3, 'rabu', '2021-12-27 17:59:29', '2021-12-27 17:59:29'),
(4, 'kamis', '2021-12-28 06:08:29', '2021-12-28 06:08:29'),
(5, 'jum\'at', '2021-12-28 06:08:43', '2021-12-28 06:08:43');

-- --------------------------------------------------------

--
-- Struktur dari tabel `jadwal`
--

CREATE TABLE `jadwal` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `matkul` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `dosen` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `kelas` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `jumlah_sks` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `nama_ruang` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `hari` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `jam_masuk` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `jam_keluar` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `semester` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tahun_ajaran` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `jam`
--

CREATE TABLE `jam` (
  `kode_jam` bigint(20) UNSIGNED NOT NULL,
  `jam` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `jam`
--

INSERT INTO `jam` (`kode_jam`, `jam`, `created_at`, `updated_at`) VALUES
(1, '08:00', NULL, NULL),
(2, '08:50', NULL, NULL),
(3, '09:40', NULL, NULL),
(4, '10:30', NULL, NULL),
(5, '11:20', NULL, NULL),
(6, '14:00', NULL, NULL),
(7, '14:50', NULL, NULL),
(8, '15:40', NULL, NULL),
(9, '16:30', NULL, NULL);

-- --------------------------------------------------------

--
-- Struktur dari tabel `kelas`
--

CREATE TABLE `kelas` (
  `id_kelas` bigint(20) UNSIGNED NOT NULL,
  `kode_kelas` varchar(40) COLLATE utf8mb4_unicode_ci NOT NULL,
  `nama_matkul` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `nama_dosen` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `kelas` char(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `kapasitas_kelas` int(10) UNSIGNED NOT NULL,
  `tahun_ajaran` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `kelas`
--

INSERT INTO `kelas` (`id_kelas`, `kode_kelas`, `nama_matkul`, `nama_dosen`, `kelas`, `kapasitas_kelas`, `tahun_ajaran`, `created_at`, `updated_at`) VALUES
(1, 'MKU0001A', 'olahraga dan kebugaran jasmani', 'dodi irwansyah', 'A', 40, '2023/2024', NULL, NULL),
(2, 'MKU0001B', 'olahraga dan kebugaran jasmani', 'dodi irwansyah', 'B', 40, '2023/2024', NULL, NULL),
(5, 'TIF0002A', 'rekayasa perangkat lunak', 'ahmad ihsan', 'A', 40, '2023/2024', NULL, NULL),
(6, 'TIF0002B', 'rekayasa perangkat lunak', 'ahmad ihsan', 'B', 40, '2023/2024', NULL, NULL),
(7, 'TIF0003A', 'keamanan jaringan + praktikum', 'khairul muttaqin', 'A', 40, '2023/2024', NULL, NULL),
(8, 'TIF0003B', 'keamanan jaringan + praktikum', 'khairul muttaqin', 'B', 40, '2023/2024', NULL, NULL),
(9, 'TIF0004A', 'komputer grafik', 'liza fitria', 'A', 40, '2023/2024', '2023-02-07 21:31:56', '2023-02-07 21:31:56'),
(10, 'TIF0004B', 'komputer grafik', 'liza fitria', 'B', 40, '2023/2024', NULL, NULL),
(11, 'TIF0005A', 'jaringan komputer', 'nurul fadillah', 'A', 40, '2023/2024', NULL, NULL),
(12, 'TIF0005B', 'jaringan komputer', 'nurul fadillah', 'B', 40, '2023/2024', NULL, NULL),
(13, 'TIF0006A', 'big data', 'munawir', 'A', 40, '2023/2024', NULL, NULL),
(14, 'TIF0006B', 'big data', 'novianda', 'B', 40, '2023/2024', NULL, NULL),
(15, 'TIF0007A', 'sistem pendukung keputusan', 'rizalul akram', 'A', 40, '2023/2024', NULL, NULL),
(16, 'TIF0007B', 'sistem pendukung keputusan', 'rizalul akram', 'B', 40, '2023/2024', NULL, NULL),
(17, 'TIF0008A', 'desain dan analisis algoritma', 'liza fitria', 'A', 40, '2023/2024', NULL, NULL),
(18, 'TIF0008B', 'desain dan analisis algoritma', 'nurul fadillah', 'B', 40, '2023/2024', NULL, NULL),
(19, 'TIF0009A', 'pemrograman berorientasi objek', 'ahmad ihsan', 'A', 40, '2023/2024', NULL, NULL),
(20, 'TIF0009B', 'pemrograman berorientasi objek', 'liza fitria', 'B', 40, '2023/2024', NULL, NULL),
(21, 'TIF0010A', 'pemrograman web ii', 'khairul muttaqin', 'A', 40, '2023/2024', NULL, NULL),
(22, 'TIF0010B', 'pemrograman web ii', 'rizalul akram', 'B', 40, '2023/2024', NULL, NULL),
(23, 'TIF0011A', 'sistem terdistribusi', 'munawir', 'A', 40, '2023/2024', NULL, NULL),
(24, 'TIF0011B', 'sistem terdistribusi', 'khairul muttaqin', 'B', 40, '2023/2024', NULL, NULL),
(25, 'TIF0012A', 'sistem informasi', 'rizalul akram', 'A', 40, '2023/2024', NULL, NULL),
(26, 'TIF0012B', 'sistem informasi', 'khairul muttaqin', 'B', 40, '2023/2024', NULL, NULL),
(39, 'TIF0001B', 'pengantar aplikasi komputer', 'novianda', 'B', 40, '2023/2024', NULL, NULL),
(40, 'TIF0001A', 'pengantar aplikasi komputer', 'rizalul akram', 'A', 40, '2023/2024', NULL, NULL),
(44, 'TIF0001A', 'matematika diskrit', 'nurul fadillah', 'A', 40, '2024/2025', NULL, NULL),
(45, 'TIF0001B', 'matematika diskrit', 'liza fitria', 'B', 40, '2024/2025', NULL, NULL),
(46, 'TIF0002A', 'pemrograman web i', 'rizalul akram', 'A', 40, '2024/2025', NULL, NULL),
(47, 'TIF0002B', 'pemrograman web i', 'munawir', 'B', 40, '2024/2025', NULL, NULL);

-- --------------------------------------------------------

--
-- Struktur dari tabel `kuliah`
--

CREATE TABLE `kuliah` (
  `id_kuliah` bigint(20) UNSIGNED NOT NULL,
  `kode_kuliah` varchar(40) COLLATE utf8mb4_unicode_ci NOT NULL,
  `kode_matkul` varchar(40) COLLATE utf8mb4_unicode_ci NOT NULL,
  `kode_dosen` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL,
  `kode_kelas` varchar(40) COLLATE utf8mb4_unicode_ci NOT NULL,
  `kode_prodi` char(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `kode_semester` char(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tahun_ajaran` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `kuliah`
--

INSERT INTO `kuliah` (`id_kuliah`, `kode_kuliah`, `kode_matkul`, `kode_dosen`, `kode_kelas`, `kode_prodi`, `kode_semester`, `tahun_ajaran`, `created_at`, `updated_at`) VALUES
(1, '1', 'TIF0002', 'TIF003', 'TIF0002A', 'TIF', '1', '2023/2024', NULL, '2023-02-07 21:31:57'),
(2, '2', 'TIF0002', 'TIF003', 'TIF0002B', 'TIF', '1', '2023/2024', NULL, '2023-02-07 21:31:57'),
(3, '3', 'TIF0003', 'TIF007', 'TIF0003A', 'TIF', '1', '2023/2024', NULL, '2023-02-07 21:31:57'),
(4, '4', 'TIF0003', 'TIF007', 'TIF0003B', 'TIF', '1', '2023/2024', NULL, '2023-02-07 21:31:57'),
(5, '5', 'TIF0004', 'TIF002', 'TIF0004B', 'TIF', '2', '2023/2024', NULL, '2023-02-07 21:31:57'),
(8, '6', 'TIF0004', 'TIF004', 'TIF0004A', 'TIF', '2', '2023/2024', '2023-02-07 21:31:57', '2023-02-07 21:31:57'),
(9, '7', 'TIF0008', 'TIF004', 'TIF0008A', 'TIF', '2', '2023/2024', NULL, NULL),
(10, '8', 'TIF0008', 'TIF005', 'TIF0008B', 'TIF', '2', '2023/2024', NULL, NULL),
(11, '9', 'TIF0009', 'TIF003', 'TIF0009A', 'TIF', '2', '2023/2024', NULL, NULL),
(12, '10', 'TIF0009', 'TIF004', 'TIF0009B', 'TIF', '2', '2023/2024', NULL, NULL),
(13, '11', 'TIF0010', 'TIF007', 'TIF0010A', 'TIF', '2', '2023/2024', NULL, NULL),
(14, '12', 'TIF0010', 'TIF001', 'TIF0010B', 'TIF', '2', '2023/2024', NULL, NULL),
(15, '13', 'TIF0011', 'TIF006', 'TIF0011A', 'TIF', '2', '2023/2024', NULL, NULL),
(16, '14', 'TIF0011', 'TIF007', 'TIF0011B', 'TIF', '2', '2023/2024', NULL, NULL),
(17, '15', 'TIF0012', 'TIF001', 'TIF0012A', 'TIF', '2', '2023/2024', NULL, NULL),
(18, '16', 'TIF0012', 'TIF007', 'TIF0012B', 'TIF', '2', '2023/2024', NULL, NULL),
(19, '17', 'MKU0001', 'MKU001', 'MKU0001A', 'MKU', '2', '2023/2024', NULL, NULL),
(20, '18', 'MKU0001', 'MKU001', 'MKU0001B', 'MKU', '2', '2023/2024', NULL, NULL),
(21, '19', 'TIF0005', 'TIF005', 'TIF0005A', 'TIF', '1', '2023/2024', NULL, NULL),
(22, '20', 'TIF0005', 'TIF005', 'TIF0005B', 'TIF', '1', '2023/2024', NULL, NULL),
(23, '21', 'TIF0006', 'TIF006', 'TIF0006A', 'TIF', '1', '2023/2024', NULL, NULL),
(24, '22', 'TIF0006', 'TIF002', 'TIF0006B', 'TIF', '1', '2023/2024', NULL, NULL),
(25, '23', 'TIF0007', 'TIF001', 'TIF0007A', 'TIF', '1', '2023/2024', NULL, NULL),
(26, '24', 'TIF0007', 'TIF001', 'TIF0007B', 'TIF', '1', '2023/2024', NULL, NULL),
(36, '25', 'TIF0001', 'TIF002', 'TIF0001B', 'TIF', '2', '2023/2024', NULL, NULL),
(37, '26', 'TIF0001', 'TIF001', 'TIF0001A', 'TIF', '2', '2023/2024', NULL, NULL),
(41, '1', 'TIF0001', 'TIF005', 'TIF0001A', 'TIF', '2', '2024/2025', NULL, NULL),
(42, '2', 'TIF0001', 'TIF004', 'TIF0001B', 'TIF', '2', '2024/2025', NULL, NULL),
(43, '3', 'TIF0002', 'TIF001', 'TIF0002A', 'TIF', '1', '2024/2025', NULL, NULL),
(44, '4', 'TIF0002', 'TIF006', 'TIF0002B', 'TIF', '1', '2024/2025', NULL, NULL);

-- --------------------------------------------------------

--
-- Struktur dari tabel `matkul`
--

CREATE TABLE `matkul` (
  `id_matkul` bigint(20) UNSIGNED NOT NULL,
  `kode_matkul` varchar(40) COLLATE utf8mb4_unicode_ci NOT NULL,
  `nama_matkul` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `sks` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `kode_prodi` char(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `kode_semester` char(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `perkuliahan_semester` char(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tahun_ajaran` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `matkul`
--

INSERT INTO `matkul` (`id_matkul`, `kode_matkul`, `nama_matkul`, `sks`, `kode_prodi`, `kode_semester`, `perkuliahan_semester`, `tahun_ajaran`, `created_at`, `updated_at`) VALUES
(1, 'MKU0001', 'olahraga dan kebugaran jasmani', '2', 'MKU', '2', '4', '2023/2024', '2023-04-02 20:28:30', '2023-04-02 20:28:30'),
(2, 'TIF0001', 'pengantar aplikasi komputer', '3', 'TIF', '2', '4', '2023/2024', '2022-03-07 16:13:25', '2022-03-07 16:13:25'),
(3, 'TIF0002', 'rekayasa perangkat lunak', '3', 'TIF', '1', '3', '2023/2024', '2022-03-07 16:35:20', '2022-03-07 16:35:20'),
(4, 'TIF0003', 'keamanan jaringan + praktikum', '3', 'TIF', '1', '3', '2023/2024', '2022-03-07 16:35:49', '2022-03-07 16:35:49'),
(5, 'TIF0004', 'komputer grafik', '3', 'TIF', '2', '4', '2023/2024', '2022-03-07 16:36:18', '2022-03-07 16:36:18'),
(6, 'TIF0005', 'jaringan komputer', '3', 'TIF', '1', '3', '2023/2024', NULL, NULL),
(7, 'TIF0006', 'big data', '3', 'TIF', '1', '3', '2023/2024', '2022-03-07 16:37:53', '2022-03-07 16:37:53'),
(8, 'TIF0007', 'sistem pendukung keputusan', '3', 'TIF', '1', '3', '2023/2024', '2022-03-07 16:38:22', '2022-03-07 16:38:22'),
(9, 'TIF0008', 'desain dan analisis algoritma', '3', 'TIF', '2', '4', '2023/2024', '2023-03-31 08:24:21', '2023-03-31 08:24:21'),
(10, 'TIF0009', 'pemrograman berorientasi objek', '3', 'TIF', '2', '4', '2023/2024', '2023-03-31 08:25:03', '2023-03-31 08:25:03'),
(11, 'TIF0010', 'pemrograman web ii', '3', 'TIF', '2', '4', '2023/2024', '2023-03-31 08:25:53', '2023-03-31 08:25:53'),
(12, 'TIF0011', 'sistem terdistribusi', '2', 'TIF', '2', '4', '2023/2024', '2023-03-31 08:26:48', '2023-03-31 08:26:48'),
(13, 'TIF0012', 'sistem informasi', '2', 'TIF', '2', '4', '2023/2024', '2023-03-31 08:27:19', '2023-03-31 08:27:19'),
(14, 'TIF0001', 'matematika diskrit', '3', 'TIF', '2', '2', '2024/2025', '2023-05-31 23:40:23', '2023-06-02 01:27:11'),
(17, 'TIF0002', 'pemrograman web i', '3', 'TIF', '1', '1', '2024/2025', '2023-06-04 09:03:17', '2023-06-04 09:03:17');

-- --------------------------------------------------------

--
-- Struktur dari tabel `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(2, '2014_10_12_100000_create_password_resets_table', 1),
(3, '2019_08_19_000000_create_failed_jobs_table', 1),
(4, '2019_12_14_000001_create_personal_access_tokens_table', 1),
(23, '2021_09_17_023717_create_prodi_table', 1),
(24, '2021_09_18_020953_create_semester_table', 1),
(35, '2021_09_23_014035_create_hari_table', 1),
(37, '2021_09_23_014235_create_jam_table', 1),
(40, '2021_09_27_011150_create_waktu_table', 1),
(43, '2014_10_12_000000_create_users_table', 1),
(54, '2021_12_25_123735_create_request_waktu_table', 1),
(55, '2021_09_21_091451_create_ruang_table', 1),
(57, '2021_12_23_085311_create_request_ruang_table', 1),
(59, '2021_09_14_140239_create_dosen_table', 1),
(62, '2021_10_27_214907_create_jadwal_table', 1),
(63, '2023_02_12_020411_create_tahun_ajaran_table', 1),
(65, '2021_09_16_044312_create_matkul_table', 1),
(67, '2021_11_17_235257_create_request_kuliah_table', 1),
(68, '2021_09_18_034140_create_kelas_table', 2),
(69, '2021_09_26_024355_create_kuliah_table', 3);

-- --------------------------------------------------------

--
-- Struktur dari tabel `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `tokenable_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `abilities` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `prodi`
--

CREATE TABLE `prodi` (
  `id_prodi` bigint(20) UNSIGNED NOT NULL,
  `nama_prodi` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `kode_prodi` char(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `prodi`
--

INSERT INTO `prodi` (`id_prodi`, `nama_prodi`, `kode_prodi`, `created_at`, `updated_at`) VALUES
(1, 'teknik informatika', 'TIF', NULL, NULL),
(2, 'mata kuliah umum', 'MKU', '2023-04-03 03:26:32', '2023-04-03 03:26:32');

-- --------------------------------------------------------

--
-- Struktur dari tabel `request_kuliah`
--

CREATE TABLE `request_kuliah` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `request` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `manage` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `kode_manage` varchar(40) COLLATE utf8mb4_unicode_ci NOT NULL,
  `nama_manage` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `sks` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `kode_prodi` char(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `kode_semester` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `nama_prodi` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `nama_matkul` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `nama_dosen` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `kapasitas_kelas` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `request_ruang`
--

CREATE TABLE `request_ruang` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `request` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `kode_ruang` int(11) NOT NULL,
  `nama_ruang` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `nama_prodi` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `request_waktu`
--

CREATE TABLE `request_waktu` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `request` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `manage` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `kode_waktu` int(11) NOT NULL,
  `kode_hari` int(11) NOT NULL,
  `nama_hari` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `kode_jam` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `jam` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `ruang`
--

CREATE TABLE `ruang` (
  `kode_ruang` bigint(20) UNSIGNED NOT NULL,
  `nama_ruang` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `nama_prodi` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `ruang`
--

INSERT INTO `ruang` (`kode_ruang`, `nama_ruang`, `nama_prodi`, `created_at`, `updated_at`) VALUES
(1, 'aula', 'teknik informatika', NULL, NULL),
(2, 'motor bakar', 'teknik informatika', NULL, NULL),
(3, 'jka', 'teknik informatika', NULL, NULL),
(4, 'digital', 'teknik informatika', NULL, NULL);

-- --------------------------------------------------------

--
-- Struktur dari tabel `semester`
--

CREATE TABLE `semester` (
  `kode_semester` bigint(20) UNSIGNED NOT NULL,
  `nama_semester` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `semester`
--

INSERT INTO `semester` (`kode_semester`, `nama_semester`, `created_at`, `updated_at`) VALUES
(1, 'ganjil', NULL, NULL),
(2, 'genap', NULL, NULL);

-- --------------------------------------------------------

--
-- Struktur dari tabel `tahun_ajaran`
--

CREATE TABLE `tahun_ajaran` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `tahun_ajaran` varchar(40) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `tahun_ajaran`
--

INSERT INTO `tahun_ajaran` (`id`, `tahun_ajaran`, `created_at`, `updated_at`) VALUES
(1, '2023/2024', NULL, NULL),
(2, '2024/2025', NULL, NULL);

-- --------------------------------------------------------

--
-- Struktur dari tabel `users`
--

CREATE TABLE `users` (
  `id_user` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `username` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `image` varchar(128) COLLATE utf8mb4_unicode_ci NOT NULL,
  `role_id` int(10) UNSIGNED NOT NULL,
  `is_active` int(10) UNSIGNED NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `users`
--

INSERT INTO `users` (`id_user`, `name`, `username`, `email`, `image`, `role_id`, `is_active`, `email_verified_at`, `password`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'admin', 'admin', 'admin@gmail.com', 'default.jpg', 1, 1, NULL, '$2y$10$4AkWn5.Hhlps0GqSWcjpOuVdo2KHZ2XeITR7QktZqpMkvz5f9GdOe', NULL, '2021-11-17 18:26:49', NULL),
(2, 'operator informatika', 'operatorinformatika', 'operatorinformatika@gmail.com', 'default.jpg', 2, 1, NULL, '$2y$10$4AkWn5.Hhlps0GqSWcjpOuVdo2KHZ2XeITR7QktZqpMkvz5f9GdOe', NULL, '2021-12-29 03:48:39', NULL);

-- --------------------------------------------------------

--
-- Struktur dari tabel `waktu`
--

CREATE TABLE `waktu` (
  `kode_waktu` bigint(20) UNSIGNED NOT NULL,
  `kode_hari` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL,
  `kode_jam` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `waktu`
--

INSERT INTO `waktu` (`kode_waktu`, `kode_hari`, `kode_jam`, `created_at`, `updated_at`) VALUES
(1, '1', '1', NULL, '2021-12-28 06:06:52'),
(2, '1', '2', NULL, '2021-12-28 06:06:52'),
(3, '1', '3', NULL, '2021-12-28 06:06:52'),
(4, '1', '4', NULL, '2021-12-28 06:06:52'),
(5, '1', '5', NULL, '2021-12-28 06:06:52'),
(6, '1', '6', NULL, '2021-12-28 06:06:52'),
(7, '1', '7', NULL, '2021-12-28 06:06:52'),
(8, '1', '8', NULL, '2021-12-28 06:06:52'),
(9, '1', '9', NULL, NULL),
(10, '2', '1', NULL, NULL),
(11, '2', '2', NULL, NULL),
(12, '2', '3', NULL, NULL),
(13, '2', '4', NULL, NULL),
(14, '2', '5', NULL, NULL),
(15, '2', '6', NULL, NULL),
(16, '2', '7', NULL, NULL),
(17, '2', '8', NULL, NULL),
(18, '2', '9', NULL, NULL),
(19, '3', '1', NULL, NULL),
(20, '3', '2', NULL, NULL),
(21, '3', '3', NULL, NULL),
(22, '3', '4', NULL, NULL),
(23, '3', '5', NULL, NULL),
(24, '3', '6', NULL, NULL),
(25, '3', '7', NULL, NULL),
(26, '3', '8', NULL, NULL),
(27, '3', '9', NULL, NULL),
(28, '4', '1', NULL, NULL),
(29, '4', '2', NULL, NULL),
(30, '4', '3', NULL, NULL),
(31, '4', '4', NULL, NULL),
(32, '4', '5', NULL, NULL),
(33, '4', '6', NULL, NULL),
(34, '4', '7', NULL, NULL),
(35, '4', '8', NULL, NULL),
(36, '4', '9', NULL, NULL),
(37, '5', '1', NULL, NULL),
(38, '5', '2', NULL, NULL),
(39, '5', '3', NULL, NULL),
(40, '5', '4', NULL, NULL),
(41, '5', '5', NULL, NULL),
(42, '5', '6', NULL, NULL),
(43, '5', '7', NULL, NULL),
(44, '5', '8', NULL, NULL),
(45, '5', '9', NULL, NULL);

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `dosen`
--
ALTER TABLE `dosen`
  ADD PRIMARY KEY (`kode_dosen`);

--
-- Indeks untuk tabel `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indeks untuk tabel `hari`
--
ALTER TABLE `hari`
  ADD PRIMARY KEY (`kode_hari`);

--
-- Indeks untuk tabel `jadwal`
--
ALTER TABLE `jadwal`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `jam`
--
ALTER TABLE `jam`
  ADD PRIMARY KEY (`kode_jam`),
  ADD UNIQUE KEY `jam_jam_unique` (`jam`);

--
-- Indeks untuk tabel `kelas`
--
ALTER TABLE `kelas`
  ADD PRIMARY KEY (`id_kelas`);

--
-- Indeks untuk tabel `kuliah`
--
ALTER TABLE `kuliah`
  ADD PRIMARY KEY (`id_kuliah`);

--
-- Indeks untuk tabel `matkul`
--
ALTER TABLE `matkul`
  ADD PRIMARY KEY (`id_matkul`);

--
-- Indeks untuk tabel `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Indeks untuk tabel `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

--
-- Indeks untuk tabel `prodi`
--
ALTER TABLE `prodi`
  ADD PRIMARY KEY (`id_prodi`),
  ADD UNIQUE KEY `prodi_nama_prodi_unique` (`nama_prodi`),
  ADD UNIQUE KEY `prodi_kode_prodi_unique` (`kode_prodi`),
  ADD UNIQUE KEY `nama_prodi` (`nama_prodi`),
  ADD UNIQUE KEY `nama_prodi_2` (`nama_prodi`);

--
-- Indeks untuk tabel `request_kuliah`
--
ALTER TABLE `request_kuliah`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `request_ruang`
--
ALTER TABLE `request_ruang`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `request_waktu`
--
ALTER TABLE `request_waktu`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `ruang`
--
ALTER TABLE `ruang`
  ADD PRIMARY KEY (`kode_ruang`);

--
-- Indeks untuk tabel `semester`
--
ALTER TABLE `semester`
  ADD PRIMARY KEY (`kode_semester`),
  ADD UNIQUE KEY `semester_nama_semester_unique` (`nama_semester`);

--
-- Indeks untuk tabel `tahun_ajaran`
--
ALTER TABLE `tahun_ajaran`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id_user`);

--
-- Indeks untuk tabel `waktu`
--
ALTER TABLE `waktu`
  ADD PRIMARY KEY (`kode_waktu`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `hari`
--
ALTER TABLE `hari`
  MODIFY `kode_hari` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT untuk tabel `jadwal`
--
ALTER TABLE `jadwal`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=355;

--
-- AUTO_INCREMENT untuk tabel `jam`
--
ALTER TABLE `jam`
  MODIFY `kode_jam` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT untuk tabel `kelas`
--
ALTER TABLE `kelas`
  MODIFY `id_kelas` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=48;

--
-- AUTO_INCREMENT untuk tabel `kuliah`
--
ALTER TABLE `kuliah`
  MODIFY `id_kuliah` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=45;

--
-- AUTO_INCREMENT untuk tabel `matkul`
--
ALTER TABLE `matkul`
  MODIFY `id_matkul` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT untuk tabel `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=70;

--
-- AUTO_INCREMENT untuk tabel `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `prodi`
--
ALTER TABLE `prodi`
  MODIFY `id_prodi` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT untuk tabel `request_kuliah`
--
ALTER TABLE `request_kuliah`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT untuk tabel `request_ruang`
--
ALTER TABLE `request_ruang`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `request_waktu`
--
ALTER TABLE `request_waktu`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT untuk tabel `ruang`
--
ALTER TABLE `ruang`
  MODIFY `kode_ruang` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT untuk tabel `semester`
--
ALTER TABLE `semester`
  MODIFY `kode_semester` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT untuk tabel `tahun_ajaran`
--
ALTER TABLE `tahun_ajaran`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT untuk tabel `users`
--
ALTER TABLE `users`
  MODIFY `id_user` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT untuk tabel `waktu`
--
ALTER TABLE `waktu`
  MODIFY `kode_waktu` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=93;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
