-- phpMyAdmin SQL Dump
-- version 4.9.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jul 14, 2021 at 01:03 PM
-- Server version: 10.4.11-MariaDB
-- PHP Version: 7.3.13

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `efarming`
--

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `id` int(11) NOT NULL,
  `type` text NOT NULL,
  `product_name` text NOT NULL,
  `price` text NOT NULL,
  `qty` text NOT NULL,
  `user_name` text NOT NULL,
  `phone` text NOT NULL,
  `address` text NOT NULL,
  `district` text NOT NULL,
  `date_n_time` timestamp NOT NULL DEFAULT current_timestamp(),
  `status` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`id`, `type`, `product_name`, `price`, `qty`, `user_name`, `phone`, `address`, `district`, `date_n_time`, `status`) VALUES
(7, 'CROP', 'har sabji1', '09', '90', 'hari ram gupta', '8080808080', 'Anaj mandi', 'Ghaziabad', '2021-02-23 14:18:40', 'SOLD'),
(10, 'PESTICIDE', 'Anti Fungus', '12', '1', 'Gopal Kumar', '5050505050', 'Meerut Road ', 'Ghaziabad', '2021-02-24 04:34:10', ''),
(11, 'PESTICIDE', 'Rat Killer', '100', '10', 'Gopal Kumar', '5050505050', 'Meerut Road ', 'Ghaziabad', '2021-02-24 04:38:19', ''),
(12, 'SEED', 'Sun Flower Seed', '100', '1000', 'Gopal Kumar', '5050505050', 'Meerut Road ', 'Ghaziabad', '2021-02-24 04:42:59', ''),
(13, 'CROP', 'Crop 1 SunFlower', '100', '10Kg', 'Farmer1', '1111', 'Ghaziabad address 111', 'Ghaziabad', '2021-02-25 06:27:46', ''),
(14, 'CROP', 'Crop 1 Wheet', '2000', '100Kg', 'Farmer1', '1111', 'Ghaziabad address 111', 'Ghaziabad', '2021-02-25 06:28:23', ''),
(15, 'FERTILIZER', 'Fertilizer 2', '200', '1Ltr', 'Seller2', '2222', 'Ghaziabad address 2', 'Ghaziabad', '2021-02-25 06:29:26', ''),
(16, 'PESTICIDE', 'Rat killer 2', '40', '2', 'Seller2', '2222', 'Ghaziabad address 2', 'Ghaziabad', '2021-02-25 06:29:43', ''),
(17, 'SEED', 'Rice Seed2', '300', '500/Kg', 'Seller2', '2222', 'Ghaziabad address 2', 'Ghaziabad', '2021-02-25 06:30:06', '');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `type` text NOT NULL,
  `name` text NOT NULL,
  `phone` text NOT NULL,
  `pass` text NOT NULL,
  `district` text NOT NULL,
  `address` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `type`, `name`, `phone`, `pass`, `district`, `address`) VALUES
(7, 'ADMIN', 'ADMIN', '12345', '12345', '', ''),
(8, 'FARMER', 'Farmer1', '1111', 'pass', 'Ghaziabad', 'Ghaziabad address 111'),
(9, 'SELLER', 'Seller2', '2222', 'pass', 'Ghaziabad', 'Ghaziabad address 2'),
(10, 'CROP_BUYER', 'Buyer 3', '3333', 'pass', 'Ghaziabad', 'Ghaziabad address 3');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
