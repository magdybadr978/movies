-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Apr 14, 2023 at 11:15 AM
-- Server version: 10.4.22-MariaDB
-- PHP Version: 8.1.2

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `movies`
--

-- --------------------------------------------------------

--
-- Table structure for table `thecamp_cinema`
--

CREATE TABLE `thecamp_cinema` (
  `id` int(11) NOT NULL,
  `movie_name` varchar(50) NOT NULL,
  `movie_length` int(200) NOT NULL,
  `movie_director` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `thecamp_cinema`
--

INSERT INTO `thecamp_cinema` (`id`, `movie_name`, `movie_length`, `movie_director`) VALUES
(2, 'magdy', 12, 'magdy'),
(3, 'magdy', 12, 'magdy');

-- --------------------------------------------------------

--
-- Table structure for table `thecamp_movies_ratings`
--

CREATE TABLE `thecamp_movies_ratings` (
  `id` int(11) NOT NULL,
  `movie_id` int(11) NOT NULL,
  `movie_review` varchar(255) NOT NULL,
  `date` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `thecamp_movies_ratings`
--

INSERT INTO `thecamp_movies_ratings` (`id`, `movie_id`, `movie_review`, `date`) VALUES
(1, 2, 'good', '2023-04-14 08:53:18'),
(3, 2, 'good', '2023-04-14 09:04:26'),
(4, 2, 'good', '2023-04-14 09:08:17');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `thecamp_cinema`
--
ALTER TABLE `thecamp_cinema`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `thecamp_movies_ratings`
--
ALTER TABLE `thecamp_movies_ratings`
  ADD PRIMARY KEY (`id`),
  ADD KEY `const_relation` (`movie_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `thecamp_cinema`
--
ALTER TABLE `thecamp_cinema`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `thecamp_movies_ratings`
--
ALTER TABLE `thecamp_movies_ratings`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `thecamp_movies_ratings`
--
ALTER TABLE `thecamp_movies_ratings`
  ADD CONSTRAINT `const_relation` FOREIGN KEY (`movie_id`) REFERENCES `thecamp_cinema` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
