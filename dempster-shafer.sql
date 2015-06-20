-- phpMyAdmin SQL Dump
-- version 3.4.5
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Jun 09, 2015 at 04:11 AM
-- Server version: 5.5.16
-- PHP Version: 5.3.8

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `dempster-shafer`
--

-- --------------------------------------------------------

--
-- Table structure for table `diagnosa`
--

CREATE TABLE IF NOT EXISTS `diagnosa` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nama` varchar(255) DEFAULT NULL,
  `jk` varchar(11) NOT NULL,
  `tgl_periksa` varchar(50) NOT NULL,
  `tgl_lahir` varchar(50) NOT NULL,
  `tekanan_darah` varchar(100) NOT NULL,
  `riwayat_fibrilasi_atrium` varchar(100) NOT NULL,
  `merokok` varchar(100) NOT NULL,
  `kolesterol` varchar(100) NOT NULL,
  `diabetes` varchar(100) NOT NULL,
  `aktivitas_fisik` varchar(100) NOT NULL,
  `diet` varchar(100) NOT NULL,
  `riwayat_keluarga` varchar(100) NOT NULL,
  `gejala` varchar(1000) NOT NULL,
  `kd_penyakit` varchar(100) NOT NULL,
  `id_user` int(10) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `id_hasil` (`gejala`(333)),
  KEY `kd_penyakit` (`kd_penyakit`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=241 ;

--
-- Dumping data for table `diagnosa`
--

INSERT INTO `diagnosa` (`id`, `nama`, `jk`, `tgl_periksa`, `tgl_lahir`, `tekanan_darah`, `riwayat_fibrilasi_atrium`, `merokok`, `kolesterol`, `diabetes`, `aktivitas_fisik`, `diet`, `riwayat_keluarga`, `gejala`, `kd_penyakit`, `id_user`) VALUES
(230, 'yaya', 'P', '2001', '1967', '180/200', 'Detak jantung tidak tahu', 'Perokok', '250', '100', 'Tidak pernah olahraga', '19.531250000000000000000000000', 'Tidak yakin emiliki riwayat keluarga stroke', '', 'P01', 14),
(231, 'yaya', 'P', '2015-06-08', '1991-12-12', '180/200', 'Detak jantung tidak tahu', 'Perokok', '250', '100', 'Tidak pernah olahraga', '19.531250000000000000000000000', 'Tidak yakin emiliki riwayat keluarga stroke', '', 'P01', 14),
(232, 'yaya', 'P', '2015-06-08', '1991-12-12', '180/200', 'Detak jantung tidak tahu', 'Perokok', '250', '100', 'Tidak pernah olahraga', '19.531250000000000000000000000', 'Tidak yakin emiliki riwayat keluarga stroke', '', 'P01', 14),
(240, 'as', '', '2015-06-08', 'as', '', 'Detak jantung tidak beraturan', 'Kadang merokok', '', '', '', '', '', '', 'P02,P03', 13),
(239, 'as', '', '2015-06-08', 'as', '', 'Detak jantung tidak beraturan', 'Kadang merokok', '', '', '', '', '', '', 'P02,P03', 13),
(238, 'as', '', '2015-06-08', 'as', '', 'Detak jantung tidak beraturan', 'Kadang merokok', '', '', '', '', '', '', 'P02,P03', 13);

-- --------------------------------------------------------

--
-- Table structure for table `gejala`
--

CREATE TABLE IF NOT EXISTS `gejala` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `kd_gejala` varchar(4) NOT NULL,
  `faktor_resiko` varchar(30) NOT NULL,
  `tingkat_faktor_resiko` varchar(100) NOT NULL,
  `range_bawah` varchar(10) NOT NULL,
  `range_atas` varchar(10) NOT NULL,
  PRIMARY KEY (`id`,`kd_gejala`),
  UNIQUE KEY `kd_gejala` (`kd_gejala`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=25 ;

--
-- Dumping data for table `gejala`
--

INSERT INTO `gejala` (`id`, `kd_gejala`, `faktor_resiko`, `tingkat_faktor_resiko`, `range_bawah`, `range_atas`) VALUES
(1, 'G1', 'Tekanan Darah', 'Tekanan darah > 140/90', '', ''),
(2, 'G2', 'Tekanan Darah', 'Tekanan darah antara 120/80-140/90 mmHg', '', ''),
(3, 'G3', 'Tekanan Darah', 'Tekanan darah < 120/80 mmHg', '', ''),
(4, 'G4', 'Riwayat Fibrilasi Atrium', 'Detak jantung tidak beraturan', '', ''),
(5, 'G5', 'Riwayat Fibrilasi Atrium', 'Detak jantung tidak tahu', '', ''),
(6, 'G6', 'Riwayat Fibrilasi Atrium', 'Detak jantung beraturan', '', ''),
(7, 'G7', 'Merokok', 'Perokok', '', ''),
(8, 'G8', 'Merokok', 'Kadang merokok', '', ''),
(9, 'G9', 'Merokok', 'Tidak merokok', '', ''),
(10, 'G10', 'Kolesterol', 'Kolesterol > 240', '240', '0'),
(11, 'G11', 'Kolesterol', 'Kolesterol 200-240', '200', '240'),
(12, 'G12', 'Kolesterol', 'Kolesterol <200', '0', '200'),
(13, 'G13', 'Diabetes', 'Diabetes dengan gula darah acak > 200', '200', '0'),
(14, 'G14', 'Diabetes', 'Diabetes dengan gula darah acak 160-200', '160', '200'),
(15, 'G15', 'Diabetes', 'Diabetes dengan gula darah acak < 160', '0', '160'),
(16, 'G16', 'Aktivitas Fisik', 'Tidak pernah olahraga', '', ''),
(17, 'G17', 'Aktivitas Fisik', 'Jarang olahraga', '', ''),
(18, 'G18', 'Aktivitas Fisik', 'Olahraga teratur', '', ''),
(19, 'G19', 'Diet', 'Diet dengan IMT > 30', '30', '0'),
(20, 'G20', 'Diet', 'Diet dengan IMT antara 25-30', '25', '30'),
(21, 'G21', 'Diet', 'Diet dengan IMT antara < 25', '0', '25'),
(22, 'G22', 'Riwayat Keluarga Stroke', 'Memiliki riwayat keluarga stroke', '', ''),
(23, 'G23', 'Riwayat Keluarga Stroke', 'Tidak yakin emiliki riwayat keluarga stroke', '', ''),
(24, 'G24', 'Riwayat Keluarga Stroke', 'Tidak memiliki riwayat keluarga stroke', '', '');

-- --------------------------------------------------------

--
-- Table structure for table `gejala_penyakit`
--

CREATE TABLE IF NOT EXISTS `gejala_penyakit` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `kd_penyakit` varchar(4) NOT NULL,
  `kd_gejala` varchar(4) NOT NULL,
  `nilai` double NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `kd_penyakit` (`kd_penyakit`,`kd_gejala`) USING BTREE,
  KEY `kd_gejala` (`kd_gejala`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=52 ;

--
-- Dumping data for table `gejala_penyakit`
--

INSERT INTO `gejala_penyakit` (`id`, `kd_penyakit`, `kd_gejala`, `nilai`) VALUES
(1, 'P01', 'G1', 0.9),
(2, 'P01', 'G4', 0.64),
(3, 'P01', 'G5', 0.22),
(4, 'P01', 'G7', 0.78),
(5, 'P01', 'G10', 0.74),
(6, 'P01', 'G13', 0.86),
(7, 'P01', 'G16', 0.7),
(8, 'P01', 'G17', 0.24),
(9, 'P01', 'G19', 0.68),
(10, 'P01', 'G22', 0.95),
(11, 'P01', 'G23', 0.32),
(12, 'P02', 'G1', 0.2),
(13, 'P02', 'G2', 0.86),
(14, 'P02', 'G3', 0.26),
(15, 'P02', 'G5', 0.73),
(16, 'P02', 'G6', 0.15),
(17, 'P02', 'G8', 0.75),
(18, 'P02', 'G10', 0.24),
(19, 'P02', 'G11', 0.68),
(20, 'P02', 'G12', 0.14),
(21, 'P02', 'G13', 0.32),
(22, 'P02', 'G14', 0.84),
(23, 'P02', 'G17', 0.62),
(24, 'P02', 'G19', 0.21),
(25, 'P02', 'G20', 0.6),
(26, 'P02', 'G23', 0.8),
(27, 'P03', 'G2', 0.35),
(28, 'P03', 'G3', 0.89),
(29, 'P03', 'G6', 0.62),
(30, 'P03', 'G8', 0.24),
(31, 'P03', 'G9', 0.76),
(32, 'P03', 'G11', 0.12),
(33, 'P03', 'G12', 0.76),
(34, 'P03', 'G14', 0.23),
(35, 'P03', 'G15', 0.86),
(36, 'P03', 'G18', 0.63),
(37, 'P03', 'G20', 0.24),
(38, 'P03', 'G21', 0.71),
(39, 'P03', 'G24', 0.82);

-- --------------------------------------------------------

--
-- Table structure for table `penentuan_td`
--

CREATE TABLE IF NOT EXISTS `penentuan_td` (
  `aturan_td` varchar(11) NOT NULL,
  `idgejala` varchar(10) NOT NULL,
  `jenis_td` varchar(50) NOT NULL,
  `range_bawah` int(11) NOT NULL,
  `range_atas` int(11) NOT NULL,
  PRIMARY KEY (`aturan_td`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `penentuan_td`
--

INSERT INTO `penentuan_td` (`aturan_td`, `idgejala`, `jenis_td`, `range_bawah`, `range_atas`) VALUES
('D1', 'G1', 'Diastolik >90', 90, 0),
('D2', 'G2', 'Diastolik 80-90', 80, 90),
('D3', 'G3', 'Diastolik <80', 0, 80),
('S1', 'G1', 'Sistolik >140', 140, 0),
('S2', 'G2', 'Sistolik 120-140', 120, 140),
('S3', 'G3', 'Sistolik <120', 0, 120);

-- --------------------------------------------------------

--
-- Table structure for table `penyakit`
--

CREATE TABLE IF NOT EXISTS `penyakit` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `kd_penyakit` varchar(4) NOT NULL,
  `resiko_stroke` varchar(100) NOT NULL,
  `deskripsi` text,
  PRIMARY KEY (`id`),
  UNIQUE KEY `kd_penyakit` (`kd_penyakit`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=10 ;

--
-- Dumping data for table `penyakit`
--

INSERT INTO `penyakit` (`id`, `kd_penyakit`, `resiko_stroke`, `deskripsi`) VALUES
(1, 'P01', 'Stroke Tinggi', 'Stroke tinggi sangat berbahaya bagi kesehatan dan dapat menyebabkan kematian'),
(2, 'P02', 'Stroke Sedang', 'Stroke sedang sangat perlu untuk diwaspadai'),
(3, 'P03', 'Stroke Rendah', 'Stroke rendah memiliki kemungkinan yang kecil namun dapat juga menjadi tinggi apabila tidak diwaspadai');

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE IF NOT EXISTS `user` (
  `id_user` int(11) NOT NULL AUTO_INCREMENT,
  `nama` varchar(100) NOT NULL,
  `jk` varchar(80) NOT NULL,
  `tgl_lahir` varchar(80) NOT NULL,
  `pekerjaan` varchar(80) NOT NULL,
  `username` varchar(80) NOT NULL,
  `password` varchar(80) NOT NULL,
  `hak_akses` varchar(80) NOT NULL,
  PRIMARY KEY (`id_user`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=16 ;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`id_user`, `nama`, `jk`, `tgl_lahir`, `pekerjaan`, `username`, `password`, `hak_akses`) VALUES
(12, 'deby', 'P', '2015-06-14', 'admin', 'deby', 'deby', 'admin'),
(13, 'putri', 'P', '2015-06-03', 'dokter', 'putri', 'putri', 'pakar'),
(14, 'indras', 'L', '2015-06-03', 'dokter umum', 'indras', 'indras', 'dokterumum');

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
