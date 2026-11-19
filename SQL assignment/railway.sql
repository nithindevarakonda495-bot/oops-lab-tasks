-- 1. Create Database
CREATE DATABASE railway_db;
USE railway_db;

-- 2. Create Tables - Nee photo prakaram
CREATE TABLE trains (
    train_id INT PRIMARY KEY AUTO_INCREMENT,
    train_name VARCHAR(50),
    source VARCHAR(50),
    destination VARCHAR(50)
);

CREATE TABLE bookings (
    booking_id INT PRIMARY KEY AUTO_INCREMENT,
    train_id INT,
    passenger_name VARCHAR(50),
    fare DECIMAL(10,2),
    status VARCHAR(20),
    FOREIGN KEY (train_id) REFERENCES trains(train_id)
);

-- Trains
INSERT INTO trains (train_name, source, destination) VALUES
('Express1', 'Chennai', 'Madurai'),
('Express2', 'Coimbatore', 'Salem'),
('Express3', 'Madurai', 'Chennai'),
('Vaigai Express', 'Chennai', 'Madurai'),
('Pandian Express', 'Chennai', 'Madurai'),
('Rockfort Express', 'Chennai', 'Trichy'),
('Nellai Express', 'Chennai', 'Tirunelveli'),
('Cheran Express', 'Coimbatore', 'Chennai'),
('Kovai Express', 'Chennai', 'Coimbatore'),
('Anantapuri Express', 'Chennai', 'Trivandrum');

-- bookings
INSERT INTO bookings (train_id, passenger_name, fare, status) VALUES
(1, 'Janani', 500, 'Confirmed'),
(1, 'Arun', 500, 'Waiting'),
(2, 'Priya', 300, 'Confirmed'),
(3, 'Karthik', 450, 'Cancelled'),
(2, 'Meena', 300, 'Confirmed'),
(4, 'Ramesh', 650, 'Confirmed'),
(5, 'Divya', 700, 'Confirmed'),
(6, 'Sneha', 250, 'Waiting'),
(7, 'Vijay', 800, 'Confirmed'),
(8, 'Anitha', 550, 'Confirmed');

-- Checking purpose
SELECT * FROM trains;
SELECT * FROM bookings;

-- 41. Retrieve all bookings with fare greater than 400.
SELECT * FROM bookings WHERE fare > 400;

-- 42. Find bookings where status is not 'Confirmed'.
SELECT * FROM bookings WHERE status != 'Confirmed';

-- 43. Display trains starting from Chennai.
SELECT * FROM trains WHERE source = 'Chennai';

-- 44. Retrieve bookings with fare between 300 and 500.
SELECT * FROM bookings WHERE fare BETWEEN 300 AND 500;

-- 45. Find passengers whose names start with 'A'.
SELECT * FROM bookings WHERE passenger_name LIKE 'A%';

-- 46. Retrieve train names along with passenger names.
SELECT t.train_name, b.passenger_name
FROM trains t
JOIN bookings b ON t.train_id = b.train_id;

-- 47. Count number of bookings for each train.
SELECT train_id, COUNT(*) AS booking_count
FROM bookings
GROUP BY train_id;

-- 48. Display train names and total fare collected for each train.
SELECT t.train_name, SUM(b.fare) AS total_fare
FROM trains t
JOIN bookings b ON t.train_id = b.train_id
GROUP BY t.train_name;

-- 49. Find bookings with fare equal to the highest fare.
SELECT * FROM bookings
WHERE fare = (SELECT MAX(fare) FROM bookings);

-- 50. Retrieve trains that have more than one booking.
SELECT * FROM trains
WHERE train_id IN (
  SELECT train_id FROM bookings
  GROUP BY train_id
  HAVING COUNT(*) > 1
);