--
-- Dumping data for table `bus`
--

INSERT INTO `bus` (`id`, `model_id`) VALUES
(1, 1),
(2, 1),
(3, 1),
(4, 2),
(5, 3);


--
-- Dumping data for table `model`
--

INSERT INTO `model` (`id`, `seats`, `rows`, `columns`) VALUES
(1, 56, 14, 4),
(2, 42, 14, 3),
(3, 12, 4, 3);


--
-- Dumping data for table `route`
--

INSERT INTO 
    route 
        (id, destination, bus_id, min_seats, price)
    VALUES 
        (1, 'Vienna-Bratislava', 1, 10, 12.00),
        (2, 'Bratislava-Vienna', 1, 10, 12.00),
        (3, 'Vienna-Frankfurt', 2, 10, 87.00),
        (4, 'Frankfurt-Vienna', 2, 10, 87.00),
        (5, 'Vienna-Paris', 3, 10, 114.00),
        (6, 'Paris-Vienna', 3, 10, 114.00),
        (7, 'Vienna-Venice', 4, 10, 68.00),
        (8, 'Venice-Vienna', 4, 10, 68.00),
        (9, 'Vienna-Salzburg', 5, 4, 46.00),
        (10, 'Salzburg-Vienna', 5, 4, 46.00);

--
-- Dumping data for table `schedule`
--


INSERT INTO 
    schedule 
        (id, route_id, departure, eta)
    VALUES 
        (1, 1, '2017-04-01 10:00:00 AM', '2017-04-01 11:00:00 AM'),
        (2, 1, '2017-05-01 10:00:00 AM', '2017-05-01 11:00:00 AM'),
        (3, 1, '2017-06-01 10:00:00 AM', '2017-06-01 11:00:00 AM'),

        (4, 2, '2017-04-01 12:00:00 PM', '2017-04-01 01:00:00 PM'),
        (5, 2, '2017-05-01 12:00:00 PM', '2017-05-01 01:00:00 PM'),
        (6, 2, '2017-06-01 12:00:00 PM', '2017-06-01 01:00:00 PM'),

        (7, 3, '2017-04-01 10:00:00 AM', '2017-04-01 07:00:00 PM'),
        (8, 3, '2017-05-01 10:00:00 AM', '2017-05-01 07:00:00 PM'),
        (9, 3, '2017-06-01 10:00:00 AM', '2017-06-01 07:00:00 PM'),

        (10, 4, '2017-04-01 08:00:00 PM', '2017-04-01 05:00:00 AM'),
        (11, 4, '2017-05-01 08:00:00 PM', '2017-05-01 05:00:00 AM'),
        (12, 4, '2017-06-01 08:00:00 PM', '2017-06-01 05:00:00 AM'),

        (13, 5, '2017-04-01 10:00:00 AM', '2017-04-02 04:00:00 AM'),
        (14, 5, '2017-05-01 10:00:00 AM', '2017-05-02 04:00:00 AM'),
        (15, 5, '2017-06-01 10:00:00 AM', '2017-06-02 04:00:00 AM'),

        (16, 6, '2017-04-02 05:00:00 AM', '2017-04-02 11:00:00 PM'),
        (17, 6, '2017-05-02 05:00:00 AM', '2017-05-02 11:00:00 PM'),
        (18, 6, '2017-06-02 05:00:00 AM', '2017-06-02 11:00:00 PM'),

        (19, 7, '2017-04-01 10:00:00 AM', '2017-04-01 06:00:00 PM'),
        (20, 7, '2017-05-01 10:00:00 AM', '2017-05-01 06:00:00 PM'),
        (21, 7, '2017-06-01 10:00:00 AM', '2017-06-01 06:00:00 PM'),

        (22, 8, '2017-04-01 07:00:00 PM', '2017-04-02 03:00:00 AM'),
        (23, 8, '2017-05-01 07:00:00 PM', '2017-05-02 03:00:00 AM'),
        (24, 8, '2017-06-01 07:00:00 PM', '2017-06-02 03:00:00 AM'),

        (25, 9, '2017-04-01 10:00:00 AM', '2017-04-01 12:00:00 PM'),
        (26, 9, '2017-05-01 10:00:00 AM', '2017-05-01 12:00:00 PM'),
        (27, 9, '2017-06-01 10:00:00 AM', '2017-06-01 12:00:00 PM'),

        (28, 10, '2017-04-01 01:00:00 PM', '2017-04-01 03:00:00 PM'),
        (29, 10, '2017-05-01 01:00:00 PM', '2017-05-01 03:00:00 PM'),
        (30, 10, '2017-06-01 01:00:00 PM', '2017-06-01 03:00:00 PM');



--
-- Dumping data for table `discount`
--

INSERT INTO `discount` (`id`, `rate`)
    VALUES
(1, '0.00'),
(2, '0.10'),
(3, '0.20'),
(4, '0.25');


--
-- Dumping data for table `reservation`
--


INSERT INTO 
    reservation 
        (`id`, `booking_id`, `seat_id`)
    VALUES 
        (1, 1, 1),
        (2, 1, 2),
        (3, 1, 3),
        (4, 2, 1);

--
-- Dumping data for table `booking`
--


INSERT INTO 
    booking 
        (`id`, `route_id`, `departure`, `eta`)
    VALUES 
        (1, 1, '2017-04-01 10:00:00 AM', '2017-04-01 11:00:00 AM'),


