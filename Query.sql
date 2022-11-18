CREATE DATABASE IF NOT EXISTS testing_system;


CREATE TABLE products (
    ID int NOT NULL AUTO_INCREMENT,
    product_name varchar(255) NOT NULL,
    price double,
    created_at datetime,
    PRIMARY KEY (ID)
);
INSERT INTO products (product_name,price,created_at) 
VALUES('Toyota Vios',520,'2022-06-11 13:23:44'),
('Toyota Cross',800,'2022-06-11 13:23:44'),
('Hyundai Accent',510,'2022-06-11 13:23:44'),
('Honda City',550,'2022-06-11 13:23:44'),
('Vinfast Fadil',360,'2022-06-11 13:23:44'),
('Mitsubishi Xpander',620,'2022-06-11 13:23:44'),
('Mazda CX-5',900,'2022-06-11 13:23:44'),
('Kia Seltos',700,'2022-06-11 13:23:44'),
('Kia K3',650,'2022-06-11 13:23:44'),
('Ford Ranger',1100,'2022-06-11 13:23:44'),
('Honda CRV',1100,'2022-06-11 13:23:44'),
('Hyundai i10',360,'2022-06-11 13:23:44'),
('Hyundai Santafe',360,'2022-06-11 13:23:44'),
('Kia Carnival',1800,'2022-06-11 13:23:44'),
('Hyundai Tucson',800,'2022-06-11 13:23:44');

Viết câu lệnh lấy ra các sản phẩm có giá tiền > 115 triệu
SELECT * FROM products WHERE price > 150;
Viết câu lệnh lấy ra các sản phẩm có chứa chữ 'k'
SELECT * FROM products WHERE product_name LIKE '%k%';
Viết câu lệnh lấy ra các sản phẩm có tên là dòng xe 'kia' (Vì xe ô tô có kia morning, Toyota vios) hoặc giá tiền < 200 triệu
SELECT * FROM products 
WHERE product_name LIKE "Kia%" OR price < 400;
Viết câu lệnh lấy ra các sản phẩm dùng toán tử IN với giá trị giá cả là 100 triệu, 130 triệu, 140 triệu, 150 triệu, 160 triệu, 170 triệu
SELECT * FROM products WHERE price IN (360,520,1100);
Viết câu lệnh lấy ra tất cả giá tiền trong bảng, nếu có nhiều giá tiền trùng lặp thì chỉ lấy 1 giá trị thôi
SELECT DISTINCT price FROM products 

 
