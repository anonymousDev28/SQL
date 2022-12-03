CREATE TABLE blog (
	id INT AUTO_INCREMENT PRIMARY KEY,
	title VARCHAR(50),
	content VARCHAR(50),
	create_at DATE
);
CREATE TABLE course(
	id INT AUTO_INCREMENT PRIMARY KEY,
	course_name VARCHAR(50),
	time_line VARCHAR(50),
	course_content VARCHAR(50),
	price DOUBLE,
	type_course VARCHAR(50),
	vote INT,
	user_id INT,
	open_schedule_id INT
-- 	FOREIGN KEY (user_id) REFERENCES tbUSER(id),
-- 	FOREIGN KEY (open_schedule_id) REFERENCES open_schedule(id)
);
CREATE TABLE tbROLE(
	id INT AUTO_INCREMENT PRIMARY KEY,
	role_name VARCHAR(50)
);
CREATE TABLE tbUSER(
	id INT AUTO_INCREMENT PRIMARY KEY,
	username VARCHAR(50),
	phone VARCHAR(50),
	email VARCHAR(50),
	role_id INT,
	course_id INT,
	FOREIGN KEY (course_id) REFERENCES course(id),
	FOREIGN KEY(role_id) REFERENCES tbROLE(id)
);
CREATE TABLE open_schedule(
	id INT AUTO_INCREMENT PRIMARY KEY,
	start_date DATE,
	address VARCHAR(50),
	study_day VARCHAR(50),
	study_time VARCHAR(50),
	course_id INT,
	FOREIGN KEY (course_id) REFERENCES course(id)
);
CREATE TABLE transaction_history(
	id INT AUTO_INCREMENT PRIMARY KEY,
	registration_date DATE,
	response_status BOOL,
	course_id INT,
	user_id INT,
	FOREIGN KEY (user_id) REFERENCES tbUSER(id),
	FOREIGN KEY(course_id) REFERENCES  course(id)
);
DROP TABLE transaction_history
CREATE TABLE account_banking(
	id INT AUTO_INCREMENT PRIMARY KEY,
	name_bank VARCHAR(50),
	account_num VARCHAR(50),
	user_id INT UNIQUE,
	FOREIGN KEY (user_id) REFERENCES tbUSER(id)
);
ALTER TABLE course DROP CONSTRAINT fk_user_id;
ALTER TABLE course ADD CONSTRAINT fk_user_id FOREIGN KEY (user_id) REFERENCES tbuser(id);
ALTER TABLE course ADD CONSTRAINT fk_open_schedule_id FOREIGN KEY (open_schedule_id) REFERENCES open_schedule(id);
-- DROP TABLE tbuser;
-- DROP TABLE course;

-- query 
-- Hiển thị Hồ sơ cá nhân của các user (id, name, phone, email, role, thông thẻ tin ngân hàng)
SELECT a.id,a.username,a.phone,a.email,b.name_bank,b.account_num
FROM tbuser a 
JOIN account_banking b 
	ON a.id = b.user_id
-- Tìm kiếm tất cả các học viên đăng ký học online
SELECT a.id,a.username,a.phone,a.email
FROM tbuser a 
JOIN course b 
	ON a.id = b.user_id 
WHERE b.type_course = 'online'
-- Hiển thị lịch khai giảng và thông tin các khóa học trong buổi khai giảng đó
SELECT a.start_date,a.address,a.study_day,a.study_time, b.course_name , b.price
FROM open_schedule a 
JOIN course b 
	ON a.course_id = b.id 
-- Hiển thị chi tiết lịch sử gd của các học viên: 
-- mã giao dịch(id), tên học viên(name_student), tên khóa học (name course), 
-- ngày đăng ký(registration_date), trạng thái(status)
SELECT a.id, b.username, c.course_name,a.registration_date,a.response_status
FROM transaction_history a 
JOIN tbuser b 
	ON a.user_id = b.id
JOIN course c
	ON a.course_id = c.id 
