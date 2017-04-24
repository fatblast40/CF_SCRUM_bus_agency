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
    device 
        (location)
    VALUES 
        ('picture/avatar1.jpg'),
        ('picture/avatar2.jpg'),
        ('picture/avatar3.jpg'),
        ('picture/avatar4.jpg'),
        ('picture/avatar5.jpg'),
        ('picture/avatar6.jpg'),
        ('picture/avatar7.jpg'),
        ('picture/avatar8.jpg'),
        ('picture/avatar9.jpg'),
        ('picture/avatar10.jpg');

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
    data varchar(255) NOT NULL, 
    device_id int(15) NOT NULL,
    FOREIGN KEY (customer_id) REFERENCES customer (id),
    FOREIGN KEY (device_id) REFERENCES device (id),
    INDEX (id, device_id)
);

