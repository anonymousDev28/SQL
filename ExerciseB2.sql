-- CREATE TABLE nhan_vien(
-- 	id INT AUTO_INCREMENT PRIMARY KEY,
-- 	ten VARCHAR(50),
-- 	ngay_bat_dau DATE,
-- 	so_chiec INT
-- )
-- 
-- INSERT INTO nhan_vien(ten,ngay_bat_dau,so_chiec)
-- VALUES('Hoang','2007-01-24',250),
-- 		('Nam','2007-05-27',220),
-- 		('Viet','2007-05-06',170),
-- 		('Viet','2007-04-06',100),
-- 		('Huong','2007-04-06',220),
-- 		('Xuan','2007-06-06',300),
-- 		('Xuan','2007-02-06',350);

-- c1: 

-- SELECT CONCAT(id,': ',ten,', ',ngay_bat_dau) AS thong_tin
-- FROM nhan_vien
-- 
-- c2:

-- CREATE TABLE employee (
-- 	employee_id INT PRIMARY KEY,
-- 	employee_name VARCHAR(50),
-- 	salary INT 
-- )
-- 
-- INSERT INTO employee(employee_id,employee_name,salary)
-- VALUES 
-- (12,'Finch',15000),
-- (22,'Peter',25000),
-- (32,'Warner',5600),
-- (42,'Watson',90000);

-- UPDATE employee
-- SET salary = salary*2

-- c3:
-- CREATE TABLE sinh_vien (
-- 	first_name VARCHAR(50),
-- 	last_name VARCHAR(50),
-- 	birth_day DATE
-- )
-- 
-- INSERT INTO sinh_vien(first_name,last_name,birth_day)
-- VALUES 
-- ('Le Thi','Thu','1996-12-12'),
-- ('Vu Thi','Nga','1997-11-17'),
-- ('Nguyen Van','C','2000-12-17'),
-- ('Tran Dinh','Trong','1997-04-25'),
-- ('Bui ','Tien Dung','1997-02-28');
-- Viết câu lệnh lấy ra số ngày tính từ ngày sinh nhật đến ngày hôm nay
-- SELECT DATEDIFF(CURDATE(),birth_day)
-- FROM sinh_vien 