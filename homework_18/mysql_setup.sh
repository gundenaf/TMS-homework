#!/bin/bash

echo "Install MariaDB"
sudo apt update
sudo apt install -y mariadb-server
echo "======================================"

echo "MariaDB quiet installation (yeap, it's unsafe, but it's homework)"
sudo mysql_secure_installation <<EOF
y
Super_DB_Password!@
Super_DB_Password!@
y
y
y
y
EOF
echo "======================================"

echo "Start MariaDB"
sudo systemctl start mariadb.service
echo "======================================"

echo "Create database and tables"
sudo mysql -u root -pSuper_DB_Password!@ <<EOF
CREATE DATABASE test_db;
GRANT ALL PRIVILEGES ON test_db.* TO 'root'@'localhost';
USE test_db;
CREATE TABLE Analyses (
  an_id INT AUTO_INCREMENT PRIMARY KEY,
  an_name VARCHAR(255) NOT NULL,
  an_cost DECIMAL(10, 2) NOT NULL,
  an_price DECIMAL(10, 2) NOT NULL,
  an_group VARCHAR(255) NOT NULL
);
CREATE TABLE Groups (
  gr_id INT AUTO_INCREMENT PRIMARY KEY,
  gr_name VARCHAR(255) NOT NULL,
  gr_temp VARCHAR(255) NOT NULL
);
CREATE TABLE Orders (
  ord_id INT AUTO_INCREMENT PRIMARY KEY,
  ord_datetime DATE NOT NULL,
  ord_an INT,
  FOREIGN KEY (ord_an) REFERENCES Analyses(an_id)
);
EOF
echo "======================================"

echo "Populating tables with data"
sudo mysql -u root -pSuper_DB_Password!@ <<EOF
USE test_db;
INSERT INTO Analyses (an_name, an_cost, an_price, an_group)
VALUES
  ('Analyses 1', 10.00, 20.00, 'Group 1'),
  ('Analyses 2', 15.00, 25.00, 'Group 1'),
  ('Analyses 3', 20.00, 30.00, 'Group 2'),
  ('Analyses 4', 25.00, 35.00, 'Group 3'),
  ('Analyses 5', 30.00, 40.00, 'Group 3');
INSERT INTO Groups (gr_name, gr_temp)
VALUES
  ('Group 1', 'Temperature 1'),
  ('Group 2', 'Temperature 2'),
  ('Group 3', 'Temperature 3');
INSERT INTO Orders (ord_datetime, ord_an)
VALUES
  ('2020-02-01', '5'),
  ('2020-02-02', '4'),
  ('2020-02-03', '3'),
  ('2020-02-04', '4'),
  ('2020-02-05', '3'),
  ('2020-02-06', '2'),
  ('2020-02-07', '1'),
  ('2020-02-08', '3'),
  ('2020-02-09', '3'),
  ('2020-02-10', '4'),
  ('2020-02-11', '2'),
  ('2020-02-12', '5'),
  ('2020-02-13', '3'),
  ('2020-02-14', '5');
EOF
echo "======================================"

echo "Querying analyses sold from February 5th, 2020 to February 12th, 2020"
sudo mysql -u root -pSuper_DB_Password!@ -e "USE test_db; \
SELECT an_name, an_price \
FROM Analyses \
WHERE an_id IN ( \
  SELECT ord_an \
  FROM Orders \
  WHERE ord_datetime >= '2020-02-05' AND ord_datetime <= DATE_ADD('2020-02-05', INTERVAL 7 DAY) \
);"
echo "======================================"

echo "Displaying all tables"
sudo mysql -u root -pSuper_DB_Password!@ -e "USE test_db; \
SHOW TABLES;"
echo "======================================"

echo "Displaying all from table Orders"
sudo mysql -u root -pSuper_DB_Password!@ -e "USE test_db; \
SELECT * FROM Orders;"
echo "======================================"

echo "Restart MariaDB"
sudo systemctl restart mariadb.service
echo "======================================"