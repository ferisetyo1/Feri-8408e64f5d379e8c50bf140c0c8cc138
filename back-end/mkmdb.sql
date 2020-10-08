-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 08 Okt 2020 pada 09.08
-- Versi server: 10.4.13-MariaDB
-- Versi PHP: 7.2.32

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `mkmdb`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `user`
--

CREATE TABLE `user` (
  `username` varchar(40) NOT NULL,
  `password` varchar(250) NOT NULL,
  `login_time` datetime NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `login_state` varchar(250) NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `user`
--

INSERT INTO `user` (`username`, `password`, `login_time`, `login_state`) VALUES
('admin', 'admin', '2020-10-08 10:40:53', 'admin'),
('feri', '$2y$10$ccWQuRkRokuTFDfAHAglvewrjbxrvOI5N1Xc2dKHJISWfTVO5SVSm', '2020-10-08 11:11:16', 'f8c80d2f1485270c6c7eb4ba68a4f39c'),
('tukijan', '$2y$10$aRsLEAMO6y8IiamnXCoGx.vtBzeLwGvgpiTc1j.w2CuSMk4lf8F6a', '2020-10-08 11:30:54', 'bf9a690308e6b88e9c0f42954d3f75fe'),
('tuni', '$2y$10$o5hq8SJLLcxi4uR5t2/j6ewZ4z5avPSHNuCMaph1jf0/U7mCGTfQG', '2020-10-08 11:12:41', 'c1ff4e8fab8733c6b80ec7d28c3fcc5a');

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`username`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
