CREATE DATABASE IF NOT EXISTS testing_system;

-- DROP TABLE products;
CREATE TABLE products (
    ID int NOT NULL AUTO_INCREMENT,
    product_name varchar(255) NOT NULL,
    price double,
    branch VARCHAR(50),
    created_at datetime,
    PRIMARY KEY (ID)
);
INSERT INTO products (product_name,price,branch,created_at) 
VALUES('Toyota Vios',520,'chi nhánh Trần Duy Hưng','2022-06-11 13:23:44'),
('Toyota Cross',800,'chi nhánh Gia Lâm','2022-06-11 13:23:44'),
('Hyundai Accent',510,'chi nhánh Trần Duy Hưng','2022-06-11 13:23:44'),
('Honda City',550,'chi nhánh Hai Bà Trưng','2022-06-11 13:23:44'),
('Vinfast Fadil',360,'','2022-06-11 13:23:44'),
('Mitsubishi Xpander',620,'chi nhánh Trần Duy Hưng','2022-06-11 13:23:44'),
('Mazda CX-5',900,'chi nhánh Lý Thường Kiệt','2022-06-11 13:23:44'),
('Kia Seltos',700,'chi nhánh Gia Lâm','2022-06-11 13:23:44'),
('Kia K3',650,'chi nhánh Gia Lâm','2022-06-11 13:23:44'),
('Ford Ranger',1100,'chi nhánh Lý Thường Kiệt','2022-06-11 13:23:44'),
('Honda CRV',1100,'chi nhánh Hai Bà Trưng','2022-06-11 13:23:44'),
('Hyundai i10',360,'chi nhánh Gia Lâm','2022-06-11 13:23:44'),
('Hyundai Santafe',360,'chi nhánh Gia Lâm','2022-06-11 13:23:44'),
('Kia Carnival',1800,'chi nhánh Hai Bà Trưng','2022-06-11 13:23:44'),
('Hyundai Tucson',800,'','2022-06-11 13:23:44');

Viết câu lệnh lấy ra các sản phẩm có giá tiền > 115 triệu
SELECT * FROM products 
WHERE price > 150;
Viết câu lệnh lấy ra các sản phẩm có chứa chữ 'k'
SELECT * FROM products 
WHERE product_name LIKE '%k%';
Viết câu lệnh lấy ra các sản phẩm có tên là dòng xe 'kia' (Vì xe ô tô có kia morning, Toyota vios) hoặc giá tiền < 200 triệu
SELECT * FROM products 
WHERE product_name LIKE "Kia%" OR price < 400;
Viết câu lệnh lấy ra các sản phẩm dùng toán tử IN với giá trị giá cả là 100 triệu, 130 triệu, 140 triệu, 150 triệu, 160 triệu, 170 triệu
SELECT * FROM products 
WHERE price IN (360,520,1100);
Viết câu lệnh lấy ra tất cả giá tiền trong bảng, nếu có nhiều giá tiền trùng lặp thì chỉ lấy 1 giá trị thôi
SELECT DISTINCT price FROM products 
Viết câu lệnh lấy ra sản phẩm ở chi nhánh Lý Thường Kiệt hoặc Hai Bà Trưng
SELECT * FROM products 
WHERE branch LIKE '%Lý Thường Kiệt%' OR branch LIKE '%Hai Bà Trưng%';
Viết câu lệnh lấy ra sản phẩm ở chi nhánh Lý Thường Kiệt hoặc Hai Bà Trưng mà giá dưới 1 tỷ
SELECT * FROM products 
WHERE (branch LIKE '%Lý Thường Kiệt%' OR branch LIKE '%Hai Bà Trưng%') AND price < 1000;