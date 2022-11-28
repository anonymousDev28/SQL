CREATE TABLE nha_cung_cap(
	ma_nha_cung_cap INT AUTO_INCREMENT PRIMARY KEY,
	ten_nha_cung_cap VARCHAR(50),
	dia_chi VARCHAR(50),
	phone VARCHAR(50)
);

CREATE TABLE thuoc(
	ma_thuoc INT AUTO_INCREMENT PRIMARY KEY,
	ten_thuoc VARCHAR(50),
	don_vi_tinh VARCHAR(50),
	so_luong INT
);

CREATE TABLE nhan_vien(
	ma_nhan_vien INT AUTO_INCREMENT PRIMARY KEY ,
	ten_nhan_vien VARCHAR(50),
	chuc_vu VARCHAR(50),
	score INT,
	salary FLOAT
);


Tìm tất cả các nhà cung cấp có địa chỉ ở HN
SELECT * FROM nha_cung_cap WHERE dia_chi = 'Ha Noi';
Đếm số lượng loại thuốc có của cửa hàng
SELECT COUNT(*) AS 'Số Loại Thuốc' FROM thuoc;
trung bình điểm chuyên cần của nhân viên 
SELECT AVG(score) AS 'Điểm chuyên cần trung bình' FROM nhan_vien 
tiền lương phải trả cho tất cả nhân viên trong tháng
SELECT SUM(salary) AS 'Tổng lương' FROM nhan_vien