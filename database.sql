-- database set up info
DROP DATABASE IF EXISTS codebus;
CREATE DATABASE codebus; 
USE codebus;

CREATE TABLE title(
    id int(15) NOT NULL AUTO_INCREMENT PRIMARY KEY,
    name varchar(255) NOT NULL, 
    INDEX (id)
);

INSERT INTO 
    title 
        (name)
    VALUES 
        ('Mr'),
        ('Ms'),
        ('Mrs');

CREATE TABLE avatar(
    id int(15) NOT NULL AUTO_INCREMENT PRIMARY KEY,
    location varchar(255) NOT NULL, 
    INDEX (id)
);

INSERT INTO 
    avatar 
        (location)
    VALUES 
        ('pictures/avatar1.jpg'),
        ('pictures/avatar2.jpg'),
        ('pictures/avatar3.jpg'),
        ('pictures/avatar4.jpg'),
        ('pictures/avatar5.jpg'),
        ('pictures/avatar6.jpg'),
        ('pictures/avatar7.jpg'),
        ('pictures/avatar8.jpg'),
        ('pictures/avatar9.jpg'),
        ('pictures/avatar10.jpg');

CREATE TABLE user(
    id int(15) NOT NULL AUTO_INCREMENT PRIMARY KEY,
    title_id int(15) NOT NULL,
    avatar_id int(15) NOT NULL,
    first_name varchar(255) NOT NULL, 
    last_name varchar(255) NOT NULL,
    email varchar(255) NOT NULL,
    tel varchar(255) NOT NULL,
    birth_year year NOT NULL,
    password varchar(255) NOT NULL, 
    FOREIGN KEY (title_id) REFERENCES title (id),
    FOREIGN KEY (avatar_id) REFERENCES avatar (id),
    INDEX (id, title_id, avatar_id)
);

INSERT INTO 
    user 
        (title_id, avatar_id, first_name, last_name, email, tel, birth_year, password)
    VALUES 
        (1, 1, 'admin', 'admin', 'admin@codebus.com', '+43 666 123 1234', 1972, '1234');

CREATE TABLE admin(
    id int(15) NOT NULL AUTO_INCREMENT PRIMARY KEY,
    user_id int(15) NOT NULL, 
    FOREIGN KEY (user_id) REFERENCES user (id),
    INDEX (id, user_id)
);

INSERT INTO 
    admin 
        (user_id)
    VALUES 
        (1);

CREATE TABLE device(
    id int(15) NOT NULL AUTO_INCREMENT PRIMARY KEY,
    name varchar(255) NOT NULL, 
    INDEX (id)
);

INSERT INTO 
    device 
        (name)
    VALUES 
        ('Mobile'),
        ('Tablet'),
        ('Desktop');

CREATE TABLE session(
    id int(15) NOT NULL AUTO_INCREMENT PRIMARY KEY,
    user_id int(15) NOT NULL, 
    reg_date date NOT NULL,
    country varchar(255) NOT NULL, 
    user_agent varchar(255) NOT NULL, 
    device_id int(15) NOT NULL,
    FOREIGN KEY (user_id) REFERENCES user (id),
    FOREIGN KEY (device_id) REFERENCES device (id),
    INDEX (id, user_id, device_id)
);

CREATE TABLE model(
    id int(15) NOT NULL AUTO_INCREMENT PRIMARY KEY,
    seats int(5) NOT NULL,
    rows int(5) NOT NULL, 
    columns int(5) NOT NULL, 
    INDEX (id)
);

INSERT INTO 
    model 
        (seats, rows, columns)
    VALUES 
        (56, 14, 4),
        (42, 14, 3),
        (12, 4, 3);

CREATE TABLE bus(
    id int(15) NOT NULL AUTO_INCREMENT PRIMARY KEY,
    model_id int(15) NOT NULL, 
    FOREIGN KEY (model_id) REFERENCES model (id),
    INDEX (id)
);

INSERT INTO 
    bus 
        (model_id)
    VALUES 
        (1),
        (1),
        (1),
        (2),
        (3);

CREATE TABLE discount(
    id int(15) NOT NULL AUTO_INCREMENT PRIMARY KEY,
    rate decimal(3,2) NOT NULL, 
    INDEX (id)
);

INSERT INTO 
    discount 
        (rate)
    VALUES 
        (0.00),
        (0.10),
        (0.20),
        (0.25);

CREATE TABLE seat(
    id int(15) NOT NULL AUTO_INCREMENT PRIMARY KEY,
    model_id int(15) NOT NULL,
    num int(15) NOT NULL,  
    row int(3) NOT NULL,
    col int(3) NOT NULL,
    discount_id int(15) NOT NULL, 
    FOREIGN KEY (model_id) REFERENCES model (id),
    FOREIGN KEY (discount_id) REFERENCES discount (id),
    INDEX (id, model_id, discount_id)
);

INSERT INTO 
    seat 
        (model_id, num, row, col, discount_id)
    VALUES 
        (1, 1, 1, 1, 3),
        (1, 2, 1, 2, 3),
        (1, 3, 1, 3, 3),
        (1, 4, 1, 4, 3),
        (1, 5, 2, 1, 3),
        (1, 6, 2, 2, 3),
        (1, 7, 2, 3, 3),
        (1, 8, 2, 4, 3),
        (1, 9, 3, 1, 3),
        (1, 10, 3, 2, 3),
        (1, 11, 3, 3, 3),
        (1, 12, 3, 4, 3),
        (1, 13, 4, 1, 3),
        (1, 14, 4, 2, 3),
        (1, 15, 4, 3, 3),
        (1, 16, 4, 4, 3),
        (1, 17, 5, 1, 3),
        (1, 18, 5, 2, 2),
        (1, 19, 5, 3, 2),
        (1, 20, 5, 4, 3),
        (1, 21, 6, 1, 2),
        (1, 22, 6, 2, 2),
        (1, 23, 6, 3, 2),
        (1, 24, 6, 4, 2),
        (1, 25, 7, 1, 2),
        (1, 26, 7, 2, 2),
        (1, 27, 7, 3, 2),
        (1, 28, 7, 4, 2),
        (1, 29, 8, 1, 2),
        (1, 30, 8, 2, 2),
        (1, 31, 8, 3, 2),
        (1, 32, 8, 4, 2),
        (1, 33, 9, 1, 2),
        (1, 34, 9, 2, 2),
        (1, 35, 9, 3, 2),
        (1, 36, 9, 4, 2),
        (1, 37, 10, 1, 1),
        (1, 38, 10, 2, 1),
        (1, 39, 10, 3, 1),
        (1, 40, 10, 4, 1),
        (1, 41, 11, 1, 1),
        (1, 42, 11, 2, 1),
        (1, 43, 11, 3, 1),
        (1, 44, 11, 4, 1),
        (1, 45, 12, 1, 1),
        (1, 46, 12, 2, 1),
        (1, 47, 12, 3, 1),
        (1, 48, 12, 4, 1),
        (1, 49, 13, 1, 1),
        (1, 50, 13, 2, 1),
        (1, 51, 13, 3, 1),
        (1, 52, 13, 4, 1),
        (1, 53, 14, 1, 1),
        (1, 54, 14, 2, 1),
        (1, 55, 14, 3, 1),
        (1, 56, 14, 4, 1),
        (2, 1, 1, 1, 3),
        (2, 2, 1, 2, 3),
        (2, 3, 1, 3, 3),
        (2, 4, 2, 1, 3),
        (2, 5, 2, 2, 3),
        (2, 6, 2, 3, 3),
        (2, 7, 3, 1, 3),
        (2, 8, 3, 2, 3),
        (2, 9, 3, 3, 3),
        (2, 10, 4, 1, 3),
        (2, 11, 4, 2, 3),
        (2, 12, 4, 3, 3),
        (2, 13, 5, 1, 3),
        (2, 14, 5, 2, 2),
        (2, 15, 5, 3, 3),
        (2, 16, 6, 1, 2),
        (2, 17, 6, 2, 2),
        (2, 18, 6, 3, 2),
        (2, 19, 7, 1, 2),
        (2, 20, 7, 2, 2),
        (2, 21, 7, 3, 2),
        (2, 22, 8, 1, 2),
        (2, 23, 8, 2, 2),
        (2, 24, 8, 3, 2),
        (2, 25, 9, 1, 2),
        (2, 26, 9, 2, 2),
        (2, 27, 9, 3, 2),
        (2, 28, 10, 1, 2),
        (2, 29, 10, 2, 1),
        (2, 30, 10, 3, 1),
        (2, 31, 11, 1, 1),
        (2, 32, 11, 2, 1),
        (2, 33, 11, 3, 1),
        (2, 34, 12, 1, 1),
        (2, 35, 12, 2, 1),
        (2, 36, 12, 3, 1),
        (2, 37, 13, 1, 1),
        (2, 38, 13, 2, 1),
        (2, 39, 13, 3, 1),
        (2, 40, 14, 1, 1),
        (2, 41, 14, 2, 1),
        (2, 42, 14, 3, 1),
        (3, 1, 1, 1, 3),
        (3, 2, 1, 2, 3),
        (3, 3, 1, 3, 3),
        (3, 4, 2, 1, 3),
        (3, 5, 2, 2, 2),
        (3, 6, 2, 3, 2),
        (3, 7, 3, 1, 2),
        (3, 8, 3, 2, 1),
        (3, 9, 3, 3, 2),
        (3, 10, 4, 1, 1),
        (3, 11, 4, 2, 1),
        (3, 12, 4, 3, 1);

CREATE TABLE route (
    id int(15) NOT NULL AUTO_INCREMENT PRIMARY KEY,
    destination varchar(255) NOT NULL,
    bus_id int(15) NOT NULL,
    min_seats int(15) NOT NULL,
    price decimal(10,2),
    FOREIGN KEY (bus_id) REFERENCES bus (id),
    INDEX (id, bus_id)
);

INSERT INTO 
    route 
        (destination, bus_id, min_seats, price)
    VALUES 
        ('Bratislava', 1, 10, 12.00),
        ('Frankfurt', 2, 10, 87.00),
        ('Paris', 3, 10, 114.00),
        ('Venice', 4, 10, 68.00),
        ('Salzburg', 5, 4, 46.00);

CREATE TABLE schedule (
    id int(15) NOT NULL AUTO_INCREMENT PRIMARY KEY,
    route_id int(15) NOT NULL,
    departure datetime NOT NULL,
    eta datetime NOT NULL,
    FOREIGN KEY (route_id) REFERENCES route (id),
    INDEX (id, route_id)
);

CREATE TABLE payment(
    id int(15) NOT NULL AUTO_INCREMENT PRIMARY KEY,
    user_id int(15) NOT NULL, 
    iban varchar(255) NOT NULL, 
    FOREIGN KEY (user_id) REFERENCES user (id),
    INDEX (id, user_id)
);

CREATE TABLE booking(
    id int(15) NOT NULL AUTO_INCREMENT PRIMARY KEY,
    stamp datetime NOT NULL,
    payment_id int(15) NOT NULL, 
    schedule_id int(15) NOT NULL, 
    FOREIGN KEY (payment_id) REFERENCES payment (id),
    FOREIGN KEY (schedule_id) REFERENCES schedule (id),
    INDEX (id, payment_id, schedule_id)
);

CREATE TABLE reservation(
    id int(15) NOT NULL AUTO_INCREMENT PRIMARY KEY,
    booking_id int(15) NOT NULL, 
    seat_id int(15) NOT NULL, 
    FOREIGN KEY (booking_id) REFERENCES booking (id),
    FOREIGN KEY (seat_id) REFERENCES seat (id),
    INDEX (id, booking_id, seat_id)
);


CREATE TABLE holiday(
    id int(15) NOT NULL AUTO_INCREMENT PRIMARY KEY,
    event date NOT NULL,
    INDEX (id)
);

INSERT INTO 
    holiday 
        (event)
    VALUES 
        (20170101),
        (20170106),
        (20170417),
        (20170501),
        (20170525),
        (20170605),
        (20170615),
        (20170815),
        (20171026),
        (20171101),
        (20171208),
        (20171225),
        (20171226),
        (20180101),
        (20180106),
        (20180402),
        (20180501),
        (20180510),
        (20180521),
        (20180531),
        (20180815),
        (20181026),
        (20181101),
        (20181208),
        (20181225),
        (20181226);
