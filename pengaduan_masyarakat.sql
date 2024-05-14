-- phpMyAdmin SQL Dump
-- version 4.9.0.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: May 10, 2022 at 02:45 PM
-- Server version: 10.3.16-MariaDB
-- PHP Version: 7.2.20

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `pengaduan_masyarakat`
--

-- --------------------------------------------------------

--
-- Table structure for table `masyarakat`
--

CREATE TABLE `masyarakat` (
  `nik` varchar(16) NOT NULL,
  `nama` varchar(35) NOT NULL,
  `username` varchar(25) NOT NULL,
  `password` varchar(255) NOT NULL,
  `telp` varchar(13) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `masyarakat`
--

INSERT INTO `masyarakat` (`nik`, `nama`, `username`, `password`, `telp`) VALUES
('1376012310010005', 'Widya Titah Pertiwi', 'masyarakat', 'd9a8c6c010a37fdc9850fe6d8c064880', '085364287180'),
('1376012310010009', 'Irma Mustafidah', 'masyarakat', 'd9a8c6c010a37fdc9850fe6d8c064880', '085364287230'),
('1376012310010008', 'Rizal Aditya Mahendra', 'masyarakat', 'd9a8c6c010a37fdc9850fe6d8c064880', '08936428650'),
('1376012310010007', 'Ahmad Faza', 'masyarakat', 'd9a8c6c010a37fdc9850fe6d8c064880', '08139875430'), 
('1376012310010006', 'Ramdhan Bachtiar Ibrahim', 'masyarakat', 'd9a8c6c010a37fdc9850fe6d8c064880', '08836428087');

-- -------------------------------------------------------- 


--
-- Table structure for table `pengaduan`
--

CREATE TABLE `pengaduan` (
  `id_pengaduan` int(5) NOT NULL,
  `tgl_pengaduan` varchar(20) NOT NULL,
  `nik` varchar(16) NOT NULL,
  `isi_laporan` text NOT NULL,
  `status` enum('proses','selesai') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `pengaduan`
--

INSERT INTO `pengaduan` (`id_pengaduan`, `tgl_pengaduan`, `nik`, `isi_laporan`, `status`) VALUES
(1, '2022-02-13', '1376012310010005', 'terdapat beberapa pelayanan di desa yang tidak sesuai dengan kode etik kerja', 'selesai'),
(2, '2022-03-15', '1376012310010009', 'beberapa fasilitas kesehatan yang ada di desa banyak yang tidak terawat', 'selesai'),
(3, '2022-03-25', '1376012310010008', 'terdapat banyak kasus korupsi di kota Sukadana', 'proses'),
(4, '2022-04-02', '1376012310010007', 'banyak terjadi kasus kejahatan di Jogjakarta', 'proses'), 
(5, '2022-04-15', '1376012310010006', 'banyak jalanan yang rusak di kota Sukabumi', 'proses');

-- --------------------------------------------------------

--
-- Table structure for table `petugas`
--

CREATE TABLE `petugas` (
  `id_petugas` int(5) NOT NULL,
  `nama_petugas` varchar(30) NOT NULL,
  `username` varchar(30) NOT NULL,
  `password` varchar(255) NOT NULL,
  `telp_petugas` varchar(13) NOT NULL,
  `level` enum('admin','petugas') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `petugas`
--

INSERT INTO `petugas` (`id_petugas`, `nama_petugas`, `username`, `password`, `telp_petugas`, `level`) VALUES
(1, 'Widya Titah Pertiwi', 'admin', '21232f297a57a5a743894a0e4a801fc3', '081215951492', 'admin'),
(2, 'Aqil Rahman', 'petugas', 'afb91ef692fd08c445e8cb1bab2ccf9c', '081215951897', 'petugas');

-- --------------------------------------------------------

--
-- Table structure for table `tanggapan`
--

CREATE TABLE `tanggapan` (
  `id_tanggapan` int(5) NOT NULL,
  `id_pengaduan` int(5) NOT NULL,
  `tgl_tanggapan` varchar(20) NOT NULL,
  `tanggapan` text NOT NULL,
  `id_petugas` int(5) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tanggapan`
--

INSERT INTO `tanggapan` (`id_tanggapan`, `id_pengaduan`, `tgl_tanggapan`, `tanggapan`, `id_petugas`) VALUES
(1, 1, '2022-02-13', 'baik nanti desa akan melakukan pengkajian mengenai pelayanan masyarakat', 2),
(2, 2, '2022-03-15', 'baik nanti desa akan melakukan perbaikan dan renovasi ulang', 2);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `masyarakat`
--
ALTER TABLE `masyarakat`
  ADD PRIMARY KEY (`nik`);

--
-- Indexes for table `pengaduan`
--
ALTER TABLE `pengaduan`
  ADD PRIMARY KEY (`id_pengaduan`);

--
-- Indexes for table `petugas`
--
ALTER TABLE `petugas`
  ADD PRIMARY KEY (`id_petugas`);

--
-- Indexes for table `tanggapan`
--
ALTER TABLE `tanggapan`
  ADD PRIMARY KEY (`id_tanggapan`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `pengaduan`
--
ALTER TABLE `pengaduan`
  MODIFY `id_pengaduan` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `petugas`
--
ALTER TABLE `petugas`
  MODIFY `id_petugas` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `tanggapan`
--
ALTER TABLE `tanggapan`
  MODIFY `id_tanggapan` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
