-- database set up info
DROP DATABASE IF EXISTS codebus;
CREATE DATABASE codebus; 

CREATE TABLE title(
    id int(15) NOT NULL AUTO_INCREMENT PRIMARY KEY,
    name varchar(255) NOT NULL, 
    INDEX (id)
);

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

CREATE TABLE customer(
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
    INDEX (id, title_id)
);

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
    customer_id int(15) NOT NULL, 
    reg_date date NOT NULL,
    country varchar(255) NOT NULL, 
    user_agent varchar(255) NOT NULL, 
    device_id int(15) NOT NULL,
    FOREIGN KEY (customer_id) REFERENCES customer (id),
    FOREIGN KEY (device_id) REFERENCES device (id),
    INDEX (id, device_id)
);

CREATE TABLE model(
    id int(15) NOT NULL AUTO_INCREMENT PRIMARY KEY,
    seats int(5) NOT NULL, 
    INDEX (id)
);

INSERT INTO 
    model 
        (seats)
    VALUES 
        (56),
        (42),
        (12);

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

CREATE TABLE route (
    id int(15) NOT NULL AUTO_INCREMENT PRIMARY KEY,
    destination int(15) NOT NULL, 
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
