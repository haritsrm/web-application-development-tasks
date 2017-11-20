-- phpMyAdmin SQL Dump
-- version 4.6.5.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: 15 Okt 2017 pada 21.26
-- Versi Server: 10.1.21-MariaDB
-- PHP Version: 7.1.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `basisdata`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `biodata`
--

CREATE TABLE `biodata` (
  `nim` varchar(255) NOT NULL,
  `nama` varchar(255) NOT NULL,
  `tglLahir` varchar(255) NOT NULL,
  `jk` varchar(255) NOT NULL,
  `alamat` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `biodata`
--

INSERT INTO `biodata` (`nim`, `nama`, `tglLahir`, `jk`, `alamat`) VALUES
('1157050066', 'Harits Rahman Mazayamusthafa', '1998-09-04', 'Laki-laki', 'Banten'),
('1157050121', 'Nurfi Agnia', '1997-01-29', 'Perempuan', 'Cirebon'),
('1157050127', 'Pirman Abdurrohman', '1994-10-15', 'Laki-laki', 'Sukabumi'),
('1157050200', 'Qiad Rahman Mazayaprana', '1999-10-12', 'Laki-laki', 'Banten'),
('1157050201', 'Qibthi Rahman Mazayasakuna', '2005-02-05', 'Perempuan', 'Banten');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `biodata`
--
ALTER TABLE `biodata`
  ADD PRIMARY KEY (`nim`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
