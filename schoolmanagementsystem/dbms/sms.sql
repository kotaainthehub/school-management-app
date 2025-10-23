-- ==========================================
-- School Management System Database Seeder
-- ==========================================

-- Drop and recreate the database
DROP DATABASE IF EXISTS smschooldb;
CREATE DATABASE smschooldb;
USE smschooldb;

-- -------------------------------
-- Student Registration Table
-- -------------------------------
CREATE TABLE stureg (
  student_id INT AUTO_INCREMENT PRIMARY KEY,
  name VARCHAR(255) NOT NULL,
  fname VARCHAR(255) NOT NULL,
  phone VARCHAR(20) NOT NULL,
  fatherphone VARCHAR(20) NOT NULL,
  class VARCHAR(50) NOT NULL,
  roll VARCHAR(50) UNIQUE NOT NULL,
  address VARCHAR(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- -------------------------------
-- Teacher Table
-- -------------------------------
CREATE TABLE addteacher (
  teacher_id INT AUTO_INCREMENT PRIMARY KEY,
  name VARCHAR(255) NOT NULL,
  spec VARCHAR(255) NOT NULL,
  subject VARCHAR(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- -------------------------------
-- Fee Submission Table
-- -------------------------------
CREATE TABLE feesubmit (
  fee_id INT AUTO_INCREMENT PRIMARY KEY,
  student_id INT NOT NULL,
  monthname VARCHAR(255) NOT NULL,
  annual INT NOT NULL,
  monthly INT NOT NULL,
  sport INT NOT NULL,
  library INT NOT NULL,
  status VARCHAR(255) NOT NULL,
  FOREIGN KEY (student_id) REFERENCES stureg(student_id)
    ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- -------------------------------
-- Report Card Table
-- -------------------------------
CREATE TABLE reportcard (
  report_id INT AUTO_INCREMENT PRIMARY KEY,
  student_id INT NOT NULL,
  phy INT NOT NULL,
  chem INT NOT NULL,
  math INT NOT NULL,
  grade VARCHAR(50) NOT NULL,
  FOREIGN KEY (student_id) REFERENCES stureg(student_id)
    ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- -------------------------------
-- User Login Table
-- -------------------------------
CREATE TABLE user_login (
  id INT AUTO_INCREMENT PRIMARY KEY,
  username VARCHAR(200) NOT NULL,
  password VARCHAR(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- -------------------------------
-- Insert login data
-- -------------------------------
INSERT INTO user_login (username, password)
VALUES ('admin', 'admin');

-- -------------------------------
-- Insert sample students
-- -------------------------------
INSERT INTO stureg (name, fname, phone, fatherphone, class, roll, address)
VALUES
('Scalett Brown', 'Brown Sr', '0711234567', '0719876543', '10', '256', 'London'),
('Bilal', 'Ahmad', '0721112222', '0729998888', '10', '1024', 'Colombo'),
('Jimmy', 'Dean', '0712223333', '0714445555', '9', '1069', 'Kandy'),
('Tayyab', 'Rehman', '0717778888', '0719990000', '8', '20658', 'Galle'),
('John', 'Cena', '0701234567', '0709876543', '10', '99', 'Jaffna'),
('Ilal', 'Karim', '0771234567', '0779876543', '8', '1036', 'Matara'),
('Silver', 'Surfer', '0761234567', '0769876543', '5', '88', 'Negombo');

-- -------------------------------
-- Insert teachers
-- -------------------------------
INSERT INTO addteacher (name, spec, subject)
VALUES
('Mr. Smith', 'Mathematics', 'Math'),
('Mrs. Taylor', 'Science', 'Chemistry'),
('Mr. Brown', 'Physics', 'Physics');

-- -------------------------------
-- Insert fees
-- -------------------------------
INSERT INTO feesubmit (student_id, monthname, annual, monthly, sport, library, status)
VALUES
(1, 'April', 5000, 3000, 5000, 5000, 'paid'),
(1, 'April', 5000, 300, 5000, 5000, 'unpaid'),
(2, 'December', 500, 4500, 5000, 5000, 'unpaid'),
(3, 'December', 5000, 1000, 6000, 6000, 'paid'),
(4, 'Dec', 5000, 3000, 5000, 5000, 'paid');

-- -------------------------------
-- Insert report cards
-- -------------------------------
INSERT INTO reportcard (student_id, phy, chem, math, grade)
VALUES
(1, 55, 72, 98, 'A'),
(2, 99, 98, 99, 'A+'),
(3, 40, 22, 39, 'Fail'),
(4, 70, 70, 70, 'A'),
(5, 80, 100, 90, 'A+'),
(6, 89, 75, 85, 'A+'),
(7, 66, 22, 55, 'D');

COMMIT;
