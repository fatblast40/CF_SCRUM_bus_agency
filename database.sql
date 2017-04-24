-- database set up info
DROP DATABASE IF EXISTS codebus;
CREATE DATABASE codebus; 

CREATE TABLE title(
    id int(15) NOT NULL AUTO_INCREMENT PRIMARY KEY,
    name varchar(255) NOT NULL, 
    INDEX (id)
);

CREATE TABLE customer(
    id int(15) NOT NULL AUTO_INCREMENT PRIMARY KEY,
    title_id int(15) NOT NULL,
    first_name varchar(255) NOT NULL, 
    last_name varchar(255) NOT NULL,
    password varchar(255) NOT NULL, 
    FOREIGN KEY (title_id) REFERENCES title (id),
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

