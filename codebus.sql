-- phpMyAdmin SQL Dump
-- version 4.6.5.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Apr 25, 2017 at 12:05 PM
-- Server version: 10.1.21-MariaDB
-- PHP Version: 7.1.1

DROP DATABASE IF EXISTS codebus;
CREATE DATABASE codebus; 
USE codebus;

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `codebus`
--

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

CREATE TABLE `admin` (
  `id` int(15) NOT NULL,
  `user_id` int(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `avatar`
--

CREATE TABLE `avatar` (
  `id` int(15) NOT NULL,
  `location` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `booking`
--

CREATE TABLE `booking` (
  `id` int(15) NOT NULL,
  `stamp` datetime NOT NULL,
  `payment_id` int(15) NOT NULL,
  `schedule_id` int(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `bus`
--

CREATE TABLE `bus` (
  `id` int(15) NOT NULL,
  `model_id` int(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `bus`
--

INSERT INTO `bus` (`id`, `model_id`) VALUES
(1, 1),
(2, 1),
(3, 1),
(4, 2),
(5, 3);

-- --------------------------------------------------------

--
-- Table structure for table `device`
--

CREATE TABLE `device` (
  `id` int(15) NOT NULL,
  `name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `device`
--

INSERT INTO `device` (`id`, `name`) VALUES
(1, 'Mobile'),
(2, 'Tablet'),
(3, 'Desktop');

-- --------------------------------------------------------

--
-- Table structure for table `discount`
--

CREATE TABLE `discount` (
  `id` int(15) NOT NULL,
  `rate` decimal(3,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `discount`
--

INSERT INTO `discount` (`id`, `rate`) VALUES
(1, '0.00'),
(2, '0.10'),
(3, '0.20'),
(4, '0.25');

-- --------------------------------------------------------

--
-- Table structure for table `holiday`
--

CREATE TABLE `holiday` (
  `id` int(15) NOT NULL,
  `event` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `holiday`
--

INSERT INTO `holiday` (`id`, `event`) VALUES
(1, '2017-01-01'),
(2, '2017-01-06'),
(3, '2017-04-17'),
(4, '2017-05-01'),
(5, '2017-05-25'),
(6, '2017-06-05'),
(7, '2017-06-15'),
(8, '2017-08-15'),
(9, '2017-10-26'),
(10, '2017-11-01'),
(11, '2017-12-08'),
(12, '2017-12-25'),
(13, '2017-12-26'),
(14, '2018-01-01'),
(15, '2018-01-06'),
(16, '2018-04-02'),
(17, '2018-05-01'),
(18, '2018-05-10'),
(19, '2018-05-21'),
(20, '2018-05-31'),
(21, '2018-08-15'),
(22, '2018-10-26'),
(23, '2018-11-01'),
(24, '2018-12-08'),
(25, '2018-12-25'),
(26, '2018-12-26');

-- --------------------------------------------------------

--
-- Table structure for table `model`
--

CREATE TABLE `model` (
  `id` int(15) NOT NULL,
  `seats` int(5) NOT NULL,
  `rows` int(5) NOT NULL,
  `columns` int(5) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `model`
--

INSERT INTO `model` (`id`, `seats`, `rows`, `columns`) VALUES
(1, 56, 14, 4),
(2, 42, 14, 3),
(3, 12, 4, 3);

-- --------------------------------------------------------

--
-- Table structure for table `payment`
--

CREATE TABLE `payment` (
  `id` int(15) NOT NULL,
  `user_id` int(15) NOT NULL,
  `iban` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `payment`
--

INSERT INTO `payment` (`id`, `user_id`, `iban`) VALUES
(1, 1, '123456789');

-- --------------------------------------------------------

--
-- Table structure for table `reservation`
--

CREATE TABLE `reservation` (
  `id` int(15) NOT NULL,
  `booking_id` int(15) NOT NULL,
  `seat_id` int(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `route`
--

CREATE TABLE `route` (
  `id` int(15) NOT NULL,
  `destination` varchar(255) NOT NULL,
  `bus_id` int(15) NOT NULL,
  `min_seats` int(15) NOT NULL,
  `price` decimal(10,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `route`
--

INSERT INTO `route` (`id`, `destination`, `bus_id`, `min_seats`, `price`) VALUES
(1, 'Bratislava', 1, 10, '12.00'),
(2, 'Frankfurt', 2, 10, '87.00'),
(3, 'Paris', 3, 10, '114.00'),
(4, 'Venice', 4, 10, '68.00'),
(5, 'Salzburg', 5, 4, '46.00');

-- --------------------------------------------------------

--
-- Table structure for table `schedule`
--

CREATE TABLE `schedule` (
  `id` int(15) NOT NULL,
  `route_id` int(15) NOT NULL,
  `departure` datetime NOT NULL,
  `eta` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `seat`
--

CREATE TABLE `seat` (
  `id` int(15) NOT NULL,
  `model_id` int(15) NOT NULL,
  `num` int(15) NOT NULL,
  `row` int(3) NOT NULL,
  `col` int(3) NOT NULL,
  `discount_id` int(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `seat`
--

INSERT INTO `seat` (`id`, `model_id`, `num`, `row`, `col`, `discount_id`) VALUES
(1, 1, 1, 1, 1, 3),
(2, 1, 2, 1, 2, 3),
(3, 1, 3, 1, 3, 3),
(4, 1, 4, 1, 4, 3),
(5, 1, 5, 2, 1, 3),
(6, 1, 6, 2, 2, 3),
(7, 1, 7, 2, 3, 3),
(8, 1, 8, 2, 4, 3),
(9, 1, 9, 3, 1, 3),
(10, 1, 10, 3, 2, 3),
(11, 1, 11, 3, 3, 3),
(12, 1, 12, 3, 4, 3),
(13, 1, 13, 4, 1, 3),
(14, 1, 14, 4, 2, 3),
(15, 1, 15, 4, 3, 3),
(16, 1, 16, 4, 4, 3),
(17, 1, 17, 5, 1, 3),
(18, 1, 18, 5, 2, 2),
(19, 1, 19, 5, 3, 2),
(20, 1, 20, 5, 4, 3),
(21, 1, 21, 6, 1, 2),
(22, 1, 22, 6, 2, 2),
(23, 1, 23, 6, 3, 2),
(24, 1, 24, 6, 4, 2),
(25, 1, 25, 7, 1, 2),
(26, 1, 26, 7, 2, 2),
(27, 1, 27, 7, 3, 2),
(28, 1, 28, 7, 4, 2),
(29, 1, 29, 8, 1, 2),
(30, 1, 30, 8, 2, 2),
(31, 1, 31, 8, 3, 2),
(32, 1, 32, 8, 4, 2),
(33, 1, 33, 9, 1, 2),
(34, 1, 34, 9, 2, 2),
(35, 1, 35, 9, 3, 2),
(36, 1, 36, 9, 4, 2),
(37, 1, 37, 10, 1, 1),
(38, 1, 38, 10, 2, 1),
(39, 1, 39, 10, 3, 1),
(40, 1, 40, 10, 4, 1),
(41, 1, 41, 11, 1, 1),
(42, 1, 42, 11, 2, 1),
(43, 1, 43, 11, 3, 1),
(44, 1, 44, 11, 4, 1),
(45, 1, 45, 12, 1, 1),
(46, 1, 46, 12, 2, 1),
(47, 1, 47, 12, 3, 1),
(48, 1, 48, 12, 4, 1),
(49, 1, 49, 13, 1, 1),
(50, 1, 50, 13, 2, 1),
(51, 1, 51, 13, 3, 1),
(52, 1, 52, 13, 4, 1),
(53, 1, 53, 14, 1, 1),
(54, 1, 54, 14, 2, 1),
(55, 1, 55, 14, 3, 1),
(56, 1, 56, 14, 4, 1),
(57, 2, 1, 1, 1, 3),
(58, 2, 2, 1, 2, 3),
(59, 2, 3, 1, 3, 3),
(60, 2, 4, 2, 1, 3),
(61, 2, 5, 2, 2, 3),
(62, 2, 6, 2, 3, 3),
(63, 2, 7, 3, 1, 3),
(64, 2, 8, 3, 2, 3),
(65, 2, 9, 3, 3, 3),
(66, 2, 10, 4, 1, 3),
(67, 2, 11, 4, 2, 3),
(68, 2, 12, 4, 3, 3),
(69, 2, 13, 5, 1, 3),
(70, 2, 14, 5, 2, 2),
(71, 2, 15, 5, 3, 3),
(72, 2, 16, 6, 1, 2),
(73, 2, 17, 6, 2, 2),
(74, 2, 18, 6, 3, 2),
(75, 2, 19, 7, 1, 2),
(76, 2, 20, 7, 2, 2),
(77, 2, 21, 7, 3, 2),
(78, 2, 22, 8, 1, 2),
(79, 2, 23, 8, 2, 2),
(80, 2, 24, 8, 3, 2),
(81, 2, 25, 9, 1, 2),
(82, 2, 26, 9, 2, 2),
(83, 2, 27, 9, 3, 2),
(84, 2, 28, 10, 1, 2),
(85, 2, 29, 10, 2, 1),
(86, 2, 30, 10, 3, 1),
(87, 2, 31, 11, 1, 1),
(88, 2, 32, 11, 2, 1),
(89, 2, 33, 11, 3, 1),
(90, 2, 34, 12, 1, 1),
(91, 2, 35, 12, 2, 1),
(92, 2, 36, 12, 3, 1),
(93, 2, 37, 13, 1, 1),
(94, 2, 38, 13, 2, 1),
(95, 2, 39, 13, 3, 1),
(96, 2, 40, 14, 1, 1),
(97, 2, 41, 14, 2, 1),
(98, 2, 42, 14, 3, 1),
(99, 3, 1, 1, 1, 3),
(100, 3, 2, 1, 2, 3),
(101, 3, 3, 1, 3, 3),
(102, 3, 4, 2, 1, 3),
(103, 3, 5, 2, 2, 2),
(104, 3, 6, 2, 3, 2),
(105, 3, 7, 3, 1, 2),
(106, 3, 8, 3, 2, 1),
(107, 3, 9, 3, 3, 2),
(108, 3, 10, 4, 1, 1),
(109, 3, 11, 4, 2, 1),
(110, 3, 12, 4, 3, 1);

-- --------------------------------------------------------

--
-- Table structure for table `session`
--

CREATE TABLE `session` (
  `id` int(15) NOT NULL,
  `user_id` int(15) NOT NULL,
  `reg_date` date NOT NULL,
  `country` varchar(255) NOT NULL,
  `user_agent` varchar(255) NOT NULL,
  `device_id` int(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `title`
--

CREATE TABLE `title` (
  `id` int(15) NOT NULL,
  `name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `title`
--

INSERT INTO `title` (`id`, `name`) VALUES
(1, 'Mr.'),
(2, 'Ms.'),
(3, 'Mrs.');

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `id` int(15) NOT NULL,
  `title_id` int(15) NOT NULL,
  `avatar_id` int(15) NOT NULL,
  `first_name` varchar(255) NOT NULL,
  `last_name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `tel` varchar(255) NOT NULL,
  `birth_year` year(4) NOT NULL,
  `password` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`id`, `title_id`, `avatar_id`, `first_name`, `last_name`, `email`, `tel`, `birth_year`, `password`) VALUES
(1, 1, 1, 'Admin', 'Surname', 'admin@CodeBus.com', '+43 660 123 1234', 1972, '8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92');

--
-- Dumping data for table `admin`
--

INSERT INTO `admin` (`id`, `user_id`) VALUES
(1, 1);


--
-- Dumping data for table `avatar`
--

INSERT INTO `avatar` (`id`, `location`) VALUES
(1, 'pictures/avatar1.jpg'),
(2, 'pictures/avatar2.jpg'),
(3, 'pictures/avatar3.jpg'),
(4, 'pictures/avatar4.jpg'),
(5, 'pictures/avatar5.jpg'),
(6, 'pictures/avatar6.jpg'),
(7, 'pictures/avatar7.jpg'),
(8, 'pictures/avatar8.jpg'),
(9, 'pictures/avatar9.jpg'),
(10, 'pictures/avatar10.jpg');

-- --------------------------------------------------------

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `id` (`id`,`user_id`);

--
-- Indexes for table `avatar`
--
ALTER TABLE `avatar`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id` (`id`);

--
-- Indexes for table `booking`
--
ALTER TABLE `booking`
  ADD PRIMARY KEY (`id`),
  ADD KEY `payment_id` (`payment_id`),
  ADD KEY `schedule_id` (`schedule_id`),
  ADD KEY `id` (`id`,`payment_id`,`schedule_id`);

--
-- Indexes for table `bus`
--
ALTER TABLE `bus`
  ADD PRIMARY KEY (`id`),
  ADD KEY `model_id` (`model_id`),
  ADD KEY `id` (`id`);

--
-- Indexes for table `device`
--
ALTER TABLE `device`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id` (`id`);

--
-- Indexes for table `discount`
--
ALTER TABLE `discount`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id` (`id`);

--
-- Indexes for table `holiday`
--
ALTER TABLE `holiday`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id` (`id`);

--
-- Indexes for table `model`
--
ALTER TABLE `model`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id` (`id`);

--
-- Indexes for table `payment`
--
ALTER TABLE `payment`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `id` (`id`,`user_id`);

--
-- Indexes for table `reservation`
--
ALTER TABLE `reservation`
  ADD PRIMARY KEY (`id`),
  ADD KEY `booking_id` (`booking_id`),
  ADD KEY `seat_id` (`seat_id`),
  ADD KEY `id` (`id`,`booking_id`,`seat_id`);

--
-- Indexes for table `route`
--
ALTER TABLE `route`
  ADD PRIMARY KEY (`id`),
  ADD KEY `bus_id` (`bus_id`),
  ADD KEY `id` (`id`,`bus_id`);

--
-- Indexes for table `schedule`
--
ALTER TABLE `schedule`
  ADD PRIMARY KEY (`id`),
  ADD KEY `route_id` (`route_id`),
  ADD KEY `id` (`id`,`route_id`);

--
-- Indexes for table `seat`
--
ALTER TABLE `seat`
  ADD PRIMARY KEY (`id`),
  ADD KEY `model_id` (`model_id`),
  ADD KEY `discount_id` (`discount_id`),
  ADD KEY `id` (`id`,`model_id`,`discount_id`);

--
-- Indexes for table `session`
--
ALTER TABLE `session`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `device_id` (`device_id`),
  ADD KEY `id` (`id`,`user_id`,`device_id`);

--
-- Indexes for table `title`
--
ALTER TABLE `title`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id` (`id`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`),
  ADD KEY `title_id` (`title_id`),
  ADD KEY `avatar_id` (`avatar_id`),
  ADD KEY `id` (`id`,`title_id`,`avatar_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admin`
--
ALTER TABLE `admin`
  MODIFY `id` int(15) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `avatar`
--
ALTER TABLE `avatar`
  MODIFY `id` int(15) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;
--
-- AUTO_INCREMENT for table `booking`
--
ALTER TABLE `booking`
  MODIFY `id` int(15) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `bus`
--
ALTER TABLE `bus`
  MODIFY `id` int(15) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT for table `device`
--
ALTER TABLE `device`
  MODIFY `id` int(15) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `discount`
--
ALTER TABLE `discount`
  MODIFY `id` int(15) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT for table `holiday`
--
ALTER TABLE `holiday`
  MODIFY `id` int(15) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;
--
-- AUTO_INCREMENT for table `model`
--
ALTER TABLE `model`
  MODIFY `id` int(15) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `payment`
--
ALTER TABLE `payment`
  MODIFY `id` int(15) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `reservation`
--
ALTER TABLE `reservation`
  MODIFY `id` int(15) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `route`
--
ALTER TABLE `route`
  MODIFY `id` int(15) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT for table `schedule`
--
ALTER TABLE `schedule`
  MODIFY `id` int(15) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `seat`
--
ALTER TABLE `seat`
  MODIFY `id` int(15) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=111;
--
-- AUTO_INCREMENT for table `session`
--
ALTER TABLE `session`
  MODIFY `id` int(15) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `title`
--
ALTER TABLE `title`
  MODIFY `id` int(15) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `id` int(15) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- Constraints for dumped tables
--

--
-- Constraints for table `admin`
--
ALTER TABLE `admin`
  ADD CONSTRAINT `admin_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`);

--
-- Constraints for table `booking`
--
ALTER TABLE `booking`
  ADD CONSTRAINT `booking_ibfk_1` FOREIGN KEY (`payment_id`) REFERENCES `payment` (`id`),
  ADD CONSTRAINT `booking_ibfk_2` FOREIGN KEY (`schedule_id`) REFERENCES `schedule` (`id`);

--
-- Constraints for table `bus`
--
ALTER TABLE `bus`
  ADD CONSTRAINT `bus_ibfk_1` FOREIGN KEY (`model_id`) REFERENCES `model` (`id`);

--
-- Constraints for table `payment`
--
ALTER TABLE `payment`
  ADD CONSTRAINT `payment_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`);

--
-- Constraints for table `reservation`
--
ALTER TABLE `reservation`
  ADD CONSTRAINT `reservation_ibfk_1` FOREIGN KEY (`booking_id`) REFERENCES `booking` (`id`),
  ADD CONSTRAINT `reservation_ibfk_2` FOREIGN KEY (`seat_id`) REFERENCES `seat` (`id`);

--
-- Constraints for table `route`
--
ALTER TABLE `route`
  ADD CONSTRAINT `route_ibfk_1` FOREIGN KEY (`bus_id`) REFERENCES `bus` (`id`);

--
-- Constraints for table `schedule`
--
ALTER TABLE `schedule`
  ADD CONSTRAINT `schedule_ibfk_1` FOREIGN KEY (`route_id`) REFERENCES `route` (`id`);

--
-- Constraints for table `seat`
--
ALTER TABLE `seat`
  ADD CONSTRAINT `seat_ibfk_1` FOREIGN KEY (`model_id`) REFERENCES `model` (`id`),
  ADD CONSTRAINT `seat_ibfk_2` FOREIGN KEY (`discount_id`) REFERENCES `discount` (`id`);

--
-- Constraints for table `session`
--
ALTER TABLE `session`
  ADD CONSTRAINT `session_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`),
  ADD CONSTRAINT `session_ibfk_2` FOREIGN KEY (`device_id`) REFERENCES `device` (`id`);

--
-- Constraints for table `user`
--
ALTER TABLE `user`
  ADD CONSTRAINT `user_ibfk_1` FOREIGN KEY (`title_id`) REFERENCES `title` (`id`),
  ADD CONSTRAINT `user_ibfk_2` FOREIGN KEY (`avatar_id`) REFERENCES `avatar` (`id`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
