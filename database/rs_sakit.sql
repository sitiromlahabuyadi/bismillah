-- phpMyAdmin SQL Dump
-- version 4.7.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Feb 09, 2021 at 04:29 PM
-- Server version: 10.1.25-MariaDB
-- PHP Version: 5.6.31

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `rs_sakit`
--

-- --------------------------------------------------------

--
-- Table structure for table `jenis_berobat`
--

CREATE TABLE `jenis_berobat` (
  `id` int(11) NOT NULL,
  `jenis_pasien` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `jenis_berobat`
--

INSERT INTO `jenis_berobat` (`id`, `jenis_pasien`) VALUES
(1, 'Pasien Baru'),
(2, 'Pasien Rujukan'),
(4, 'Pasien Lama'),
(5, 'Pasien Berobat Jalan'),
(10, 'Tambahkan Jenis');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_dokter`
--

CREATE TABLE `tbl_dokter` (
  `id_dokter` int(11) NOT NULL,
  `nama_dokter` varchar(100) NOT NULL,
  `alamat` varchar(200) NOT NULL,
  `jenis_dokter` varchar(200) NOT NULL,
  `no_hp` varchar(20) NOT NULL,
  `foto` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_dokter`
--

INSERT INTO `tbl_dokter` (`id_dokter`, `nama_dokter`, `alamat`, `jenis_dokter`, `no_hp`, `foto`) VALUES
(10, 'Dr. Nama Dokter 1', 'Alamat Dokter 1 Masukan Disini', 'Spesialis', '087756650987', 'anisa8.jpg'),
(11, 'Dr. Nama Dokter 2', 'Alamat Dokter 2 Masukan Disini', 'Mata', '087767780897', '551622-calon-dokter-muda-ini-cantiknya-bikin-cowok-rela-pura-pura-sakit3.jpg'),
(12, 'Dr. Nama Dokter 3', 'Alamat Dokter 3 Masukan Disini', 'Gigi', '0877789997867', '551620-calon-dokter-muda-ini-cantiknya-bikin-cowok-rela-pura-pura-sakit4.jpg'),
(13, 'Dr. Nama Dokter 4', 'Alamat Dokter 4 Masukan Disini', 'Umum', '087767780800', '551634-calon-dokter-muda-ini-cantiknya-bikin-cowok-rela-pura-pura-sakit12.png'),
(17, 'Masukan Nama Dokter', 'Masukan Alamat Dokter', 'Umum', '098878878767', '551620-calon-dokter-muda-ini-cantiknya-bikin-cowok-rela-pura-pura-sakit7.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_jadwal`
--

CREATE TABLE `tbl_jadwal` (
  `id_jadwal` int(11) NOT NULL,
  `tanggal` date NOT NULL,
  `hari` varchar(20) NOT NULL,
  `detal` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_jadwal`
--

INSERT INTO `tbl_jadwal` (`id_jadwal`, `tanggal`, `hari`, `detal`) VALUES
(1, '2018-06-16', 'Senin', '2021-02-09 14:56:57'),
(2, '2018-06-19', 'Selasa', '2021-02-09 14:39:23'),
(3, '2018-06-20', 'Rabu', '2021-02-09 14:39:32'),
(4, '2018-06-21', 'Kamis', '2021-02-09 14:39:40'),
(5, '2018-06-22', 'Jumat', '2021-02-09 14:39:47'),
(6, '2018-06-23', 'Sabtu', '2021-02-09 14:39:53'),
(7, '2018-06-23', 'Minggu', '2021-02-09 14:40:00');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_pasien`
--

CREATE TABLE `tbl_pasien` (
  `id_pasien` int(11) NOT NULL,
  `id_jenis_pasien` int(11) NOT NULL,
  `no_pasien` varchar(200) NOT NULL,
  `nama_pasien` varchar(40) NOT NULL,
  `alamat` varchar(70) NOT NULL,
  `no_ktp` varchar(30) NOT NULL,
  `tanggal` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `keterangan` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_pasien`
--

INSERT INTO `tbl_pasien` (`id_pasien`, `id_jenis_pasien`, `no_pasien`, `nama_pasien`, `alamat`, `no_ktp`, `tanggal`, `keterangan`) VALUES
(7, 1, 'AR001', 'Pasien 1', 'Masukan alamat Pasien 1 Disini dengan selengkap lengkapnya', '36020901100003', '2021-02-09 15:07:04', 'Pasien ini akan melakukan pengecekan pada mata sebelah kanan'),
(8, 2, 'AR002', 'Pasien 2', 'Masukan alamat Pasien 1 Disini dengan selengkap lengkapnya', '36020901100001', '2021-02-09 15:07:46', 'Pasien Rujukan dari Klinik A untuk ke Dr. Umum'),
(9, 2, 'AR003', 'Pasien 3', 'Masukan alamat Pasien 1 Disini dengan selengkap lengkapnya\r\n', '36020901100002', '2021-02-09 15:08:30', 'Pasien lama untuk proses kontrol minggu pertama'),
(14, 2, 'AR004', 'Masukan Nama Pasien Disini', 'Masukan Alamat Pasien Disini', '123456789098765', '2021-02-09 15:25:09', 'Masukan Keterangan Pasien Disini');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_transaksi_jadwal`
--

CREATE TABLE `tbl_transaksi_jadwal` (
  `id_transaksi_jadwal` int(11) NOT NULL,
  `id_dokter` int(11) NOT NULL,
  `id_jadwal` int(11) NOT NULL,
  `keterangan` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_transaksi_jadwal`
--

INSERT INTO `tbl_transaksi_jadwal` (`id_transaksi_jadwal`, `id_dokter`, `id_jadwal`, `keterangan`) VALUES
(1, 1, 1, 'keterangan'),
(2, 2, 4, 'andi adanya dihari rabu DAN KAMIS'),
(3, 1, 3, 'adanya ari selasa'),
(4, 5, 2, 'dokter motivator'),
(5, 6, 2, 'adanya hari selasa'),
(6, 7, 1, 'contoh'),
(7, 8, 4, 'adanya hari kamis'),
(8, 1, 3, 'ada'),
(29, 10, 1, 'Dr. Yang Hebat'),
(30, 11, 2, 'Dr. Yang Disiplin'),
(32, 13, 4, 'Dr. Yang Sholehah'),
(33, 12, 4, 'Dr. Yang Cool'),
(34, 14, 6, 'Masukan Ketrangan Dokter Disini'),
(36, 16, 7, 'Masukan Keterangan Dokter'),
(37, 17, 7, 'Masukan Keterangan Dokter Disini');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_user`
--

CREATE TABLE `tbl_user` (
  `id` int(11) NOT NULL,
  `username` varchar(200) NOT NULL,
  `password` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_user`
--

INSERT INTO `tbl_user` (`id`, `username`, `password`) VALUES
(1, 'admin', 'admin');

-- --------------------------------------------------------

--
-- Stand-in structure for view `v_daftar`
-- (See below for the actual view)
--
CREATE TABLE `v_daftar` (
`no_ktp` varchar(30)
,`id_pasien` int(11)
,`no_pasien` varchar(200)
,`nama_pasien` varchar(40)
,`alamat` varchar(70)
,`keterangan` varchar(200)
,`tanggal` timestamp
,`jenis_pasien` varchar(20)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `v_jadwal`
-- (See below for the actual view)
--
CREATE TABLE `v_jadwal` (
`id_transaksi_jadwal` int(11)
,`nama_dokter` varchar(100)
,`jenis_dokter` varchar(200)
,`keterangan` varchar(200)
,`foto` text
,`hari` varchar(20)
);

-- --------------------------------------------------------

--
-- Structure for view `v_daftar`
--
DROP TABLE IF EXISTS `v_daftar`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `v_daftar`  AS  select `ts`.`no_ktp` AS `no_ktp`,`ts`.`id_pasien` AS `id_pasien`,`ts`.`no_pasien` AS `no_pasien`,`ts`.`nama_pasien` AS `nama_pasien`,`ts`.`alamat` AS `alamat`,`ts`.`keterangan` AS `keterangan`,`ts`.`tanggal` AS `tanggal`,`js`.`jenis_pasien` AS `jenis_pasien` from (`tbl_pasien` `ts` join `jenis_berobat` `js`) where (`ts`.`id_jenis_pasien` = `js`.`id`) ;

-- --------------------------------------------------------

--
-- Structure for view `v_jadwal`
--
DROP TABLE IF EXISTS `v_jadwal`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `v_jadwal`  AS  select `tj`.`id_transaksi_jadwal` AS `id_transaksi_jadwal`,`td`.`nama_dokter` AS `nama_dokter`,`td`.`jenis_dokter` AS `jenis_dokter`,`tj`.`keterangan` AS `keterangan`,`td`.`foto` AS `foto`,`tbj`.`hari` AS `hari` from ((`tbl_transaksi_jadwal` `tj` join `tbl_dokter` `td`) join `tbl_jadwal` `tbj`) where ((`tj`.`id_jadwal` = `tbj`.`id_jadwal`) and (`tj`.`id_dokter` = `td`.`id_dokter`)) ;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `jenis_berobat`
--
ALTER TABLE `jenis_berobat`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbl_dokter`
--
ALTER TABLE `tbl_dokter`
  ADD PRIMARY KEY (`id_dokter`);

--
-- Indexes for table `tbl_jadwal`
--
ALTER TABLE `tbl_jadwal`
  ADD PRIMARY KEY (`id_jadwal`);

--
-- Indexes for table `tbl_pasien`
--
ALTER TABLE `tbl_pasien`
  ADD PRIMARY KEY (`id_pasien`),
  ADD KEY `id_jenis_pasien` (`id_jenis_pasien`);

--
-- Indexes for table `tbl_transaksi_jadwal`
--
ALTER TABLE `tbl_transaksi_jadwal`
  ADD PRIMARY KEY (`id_transaksi_jadwal`),
  ADD KEY `id_dokter` (`id_dokter`),
  ADD KEY `id_jadwal` (`id_jadwal`);

--
-- Indexes for table `tbl_user`
--
ALTER TABLE `tbl_user`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `jenis_berobat`
--
ALTER TABLE `jenis_berobat`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;
--
-- AUTO_INCREMENT for table `tbl_dokter`
--
ALTER TABLE `tbl_dokter`
  MODIFY `id_dokter` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;
--
-- AUTO_INCREMENT for table `tbl_jadwal`
--
ALTER TABLE `tbl_jadwal`
  MODIFY `id_jadwal` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;
--
-- AUTO_INCREMENT for table `tbl_pasien`
--
ALTER TABLE `tbl_pasien`
  MODIFY `id_pasien` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;
--
-- AUTO_INCREMENT for table `tbl_transaksi_jadwal`
--
ALTER TABLE `tbl_transaksi_jadwal`
  MODIFY `id_transaksi_jadwal` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=38;
--
-- AUTO_INCREMENT for table `tbl_user`
--
ALTER TABLE `tbl_user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- Constraints for dumped tables
--

--
-- Constraints for table `tbl_pasien`
--
ALTER TABLE `tbl_pasien`
  ADD CONSTRAINT `tbl_pasien_ibfk_1` FOREIGN KEY (`id_jenis_pasien`) REFERENCES `jenis_berobat` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
