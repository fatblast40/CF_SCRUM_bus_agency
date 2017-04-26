-- database set up info
DROP DATABASE IF EXISTS codebus;
CREATE DATABASE codebus; 
USE codebus;

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

CREATE TABLE admin(
    id int(15) NOT NULL AUTO_INCREMENT PRIMARY KEY,
    user_id int(15) NOT NULL, 
    FOREIGN KEY (user_id) REFERENCES user (id),
    INDEX (id, user_id)
);

CREATE TABLE device(
    id int(15) NOT NULL AUTO_INCREMENT PRIMARY KEY,
    name varchar(255) NOT NULL, 
    INDEX (id)
);


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


CREATE TABLE bus(
    id int(15) NOT NULL AUTO_INCREMENT PRIMARY KEY,
    model_id int(15) NOT NULL, 
    FOREIGN KEY (model_id) REFERENCES model (id),
    INDEX (id)
);


CREATE TABLE discount(
    id int(15) NOT NULL AUTO_INCREMENT PRIMARY KEY,
    rate decimal(3,2) NOT NULL, 
    INDEX (id)
);

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



CREATE TABLE route (
    id int(15) NOT NULL AUTO_INCREMENT PRIMARY KEY,
    destination varchar(255) NOT NULL,
    bus_id int(15) NOT NULL,
    min_seats int(15) NOT NULL,
    price decimal(10,2),
    FOREIGN KEY (bus_id) REFERENCES bus (id),
    INDEX (id, bus_id)
);



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
