--
-- Dumping data for table `title`
--

INSERT INTO 
    title 
        (id, name)
    VALUES 
        (1, 'Mr.'),
        (2, 'Ms.'),
        (3, 'Mrs.');

--
-- Dumping data for table `avatar`
--

INSERT INTO 
	`avatar` (`id`, `location`)
VALUES
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


--
-- Dumping data for table `device`
--

INSERT INTO `device` (`id`, `name`) VALUES
(1, 'Mobile'),
(2, 'Tablet'),
(3, 'Desktop');

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
-- Dumping data for table `payment`
--

INSERT INTO `payment` (`id`, `user_id`, `iban`) VALUES
(1, 1, '123456789');




