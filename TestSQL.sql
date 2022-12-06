
-- bai 1
CREATE TABLE IF NOT EXISTS orders(
	id INT AUTO_INCREMENT PRIMARY KEY ,
	quantity INT NOT NULL,
	price FLOAT NOT NULL,
	paid_date DATE NOT NULL,
	created_date DATE,
	update_date DATE
);

CREATE TABLE IF NOT EXISTS categories(
	id BIGINT AUTO_INCREMENT PRIMARY KEY,
	category_code VARCHAR(50) NOT NULL ,
	category_name VARCHAR(50) NOT NULL ,
	created_date DATE NOT NULL,
	update_date DATE NOT NULL
);

CREATE TABLE IF NOT EXISTS products (
	id BIGINT AUTO_INCREMENT PRIMARY KEY,
	product_code VARCHAR(50) NOT NULL,
	product_name VARCHAR(50) NOT NULL,
	image VARCHAR(50),
	DESCRIPTION VARCHAR(50),
	price FLOAT,
	quantity INT,
	country VARCHAR(50),
	is_new ENUM('NULL','NEW','NOT_NEW'),
	created_date DATE NOT NULL,
	updated_date DATE NOT NULL,
	CONSTRAINT chk_country 
	CHECK 
	((country NOT LIKE '% %') AND 
	 (country LIKE '%_%') AND 
	 (BINARY country = BINARY UPPER(country))),
	 category_id BIGINT,
	 FOREIGN KEY(category_id) REFERENCES categories(id)
);
CREATE TABLE order_products (
	order_id INT,
	product_id BIGINT,
	FOREIGN KEY(order_id) REFERENCES orders(id),
	FOREIGN KEY(product_id) REFERENCES products(id)
);

insert into categories (id, category_code, category_name, created_date, update_date) values (1, 'SSSZ', 'Roofing (Asphalt)', '2022-09-13', '2022-05-09');
insert into categories (id, category_code, category_name, created_date, update_date) values (2, 'FZGA', 'Temp Fencing, Decorative Fencing and Gates', '2022-05-03', '2021-12-10');
insert into categories (id, category_code, category_name, created_date, update_date) values (3, 'CYOO', 'RF Shielding', '2022-09-13', '2022-02-16');
insert into categories (id, category_code, category_name, created_date, update_date) values (4, 'SLTJ', 'Sitework & Site Utilities', '2022-03-07', '2021-12-24');
insert into categories (id, category_code, category_name, created_date, update_date) values (5, 'MYCB', 'Painting & Vinyl Wall Covering', '2021-12-20', '2022-05-12');
insert into categories (id, category_code, category_name, created_date, update_date) values (6, 'VHHX', 'Roofing (Asphalt)', '2022-04-27', '2021-12-12');
insert into categories (id, category_code, category_name, created_date, update_date) values (7, 'SVPM', 'Retaining Wall and Brick Pavers', '2022-03-24', '2022-05-27');
insert into categories (id, category_code, category_name, created_date, update_date) values (8, 'KBKF', 'Exterior Signage', '2022-06-01', '2022-09-09');
insert into categories (id, category_code, category_name, created_date, update_date) values (9, 'VOML', 'Plumbing & Medical Gas', '2022-06-23', '2022-05-23');
insert into categories (id, category_code, category_name, created_date, update_date) values (10, 'VNCG', 'Glass & Glazing', '2022-04-08', '2022-08-15');

insert into orders (id, quantity, price, paid_date, created_date, update_date) values (1, 96, 2005, '2022-06-05', '2022-08-19', '2022-11-02');
insert into orders (id, quantity, price, paid_date, created_date, update_date) values (2, 62, 1996, '2022-11-30', '2022-10-09', '2022-05-07');
insert into orders (id, quantity, price, paid_date, created_date, update_date) values (3, 26, 2002, '2022-11-12', '2022-02-22', '2022-04-28');
insert into orders (id, quantity, price, paid_date, created_date, update_date) values (4, 28, 2008, '2022-03-13', '2022-05-13', '2022-10-08');
insert into orders (id, quantity, price, paid_date, created_date, update_date) values (5, 808, 2003, '2022-12-01', '2022-11-12', '2022-04-25');
insert into orders (id, quantity, price, paid_date, created_date, update_date) values (6, 709, 2008, '2022-07-08', '2022-03-01', '2022-12-04');
insert into orders (id, quantity, price, paid_date, created_date, update_date) values (7, 3327, 1995, '2022-10-13', '2022-03-22', '2022-03-18');
insert into orders (id, quantity, price, paid_date, created_date, update_date) values (8, 30, 2004, '2022-04-27', '2022-05-09', '2022-02-05');
insert into orders (id, quantity, price, paid_date, created_date, update_date) values (9, 50, 2003, '2022-06-30', '2022-01-12', '2022-06-07');
insert into orders (id, quantity, price, paid_date, created_date, update_date) values (10, 266, 1999, '2022-03-02', '2022-04-02', '2022-08-10');

insert into products (id, product_code, product_name, image, description, price, quantity, country, is_new, created_date, updated_date) values (1, 'CA-BC', 'F150', 'Gabriola Island', 'Silva Bay Seaplane Base', '0', 1, NULL, 'NULL', '2022-08-20', '2022-03-17');
insert into products (id, product_code, product_name, image, description, price, quantity, country, is_new, created_date, updated_date) values (2, 'AU-QLD', 'Ram Van B250', null, 'Strathmore Airport', null, 2, 'YSMR', 'NEW', '2022-12-02', '2022-04-09');
insert into products (id, product_code, product_name, image, description, price, quantity, country, is_new, created_date, updated_date) values (3, 'AU-QLD', 'Corsica', 'Cloncurry', 'Cloncurry Airport', '616', 3, 'YCCY','NOT_NEW', '2022-02-04', '2022-09-17');
insert into products (id, product_code, product_name, image, description, price, quantity, country, is_new, created_date, updated_date) values (4, 'BR-RS', 'Caravan', 'Santo Ângelo', 'Santo Ângelo Airport', '1056', 4, 'SBNM', 'NOT_NEW', '2022-06-24', '2022-04-24');
insert into products (id, product_code, product_name, image, description, price, quantity, country, is_new, created_date, updated_date) values (5, 'PH-CAT', '929', 'Virac', 'Virac Airport', '121', 5, 'RPUV', 'NOT_NEW', '2022-01-08', '2022-09-03');
insert into products (id, product_code, product_name, image, description, price, quantity, country, is_new, created_date, updated_date) values (6, 'US-WI', 'F450', 'Ashland', 'John F Kennedy Memorial Airport', '827', 6, 'KASX', 'NEW', '2022-04-21', '2022-06-09');
insert into products (id, product_code, product_name, image, description, price, quantity, country, is_new, created_date, updated_date) values (7, 'BR-RS', 'Passat', 'Itaqui', 'Itaqui Airport', '230', 7, 'SSIQ', 'NEW', '2022-05-23', '2022-06-06');
insert into products (id, product_code, product_name, image, description, price, quantity, country, is_new, created_date, updated_date) values (8, 'CA-NT', 'Corolla', 'Sachs Harbour', 'Sachs HarbourAirport', '282', 8, 'CYSY', 'NEW', '2022-02-28', '2022-09-27');
insert into products (id, product_code, product_name, image, description, price, quantity, country, is_new, created_date, updated_date) values (9, 'GY-UT', 'Dakota Club', 'Lumid Pau', 'Lumid Pau Airport', '656', 14, 'SYLP', 'NOT_NEW', '2022-09-22', '2022-10-14');
insert into products (id, product_code, product_name, image, description, price, quantity, country, is_new, created_date, updated_date) values (10, 'AU-NSW', 'Forenza', null, 'Maitland Airport', '85', 10, 'YMND', 'NULL', '2022-01-07', '2022-10-02');

-- Hiển thị danh sách sản phẩm gồm: product_code, product_name, country, category_name
SELECT p.product_code,p.product_name,p.country,c.category_name
FROM products p 
JOIN categories c
	ON p.category_id = c.id
-- Tìm ra những sản phẩm có chứa kĩ tự ‘g’
SELECT p.*
FROM products p
WHERE p.product_name LIKE '%p%'
-- Tìm ra những sản phẩm có chứa kĩ tự ‘g’ và có số lượng lớn hơn 20
SELECT p.*
FROM products p
WHERE p.product_name LIKE '%p%'
AND p.quantity > 20 
-- Thống kê số lượng đơn hàng theo ngày
SELECT o.paid_date, SUM(o.quantity) 'số lượng sản phẩm trong ngày'
FROM orders o
GROUP BY o.paid_date;


-- bai 2
CREATE TABLE employee(
	id INT PRIMARY KEY AUTO_INCREMENT,
	NAME VARCHAR(50),
	salary INT,
	managerId INT
);

INSERT INTO employee(NAME,salary,managerId) 
VALUES('Joe',70000,3),
		('Henry',80000,4),
		('Sam',60000,null),
		('Max',90000,NULL);

select a.name 
from employee a join employee b 
on a.managerId = b.id 
where a.salary > b.salary;

-- bai 3
CREATE TABLE emails(
	id INT PRIMARY KEY AUTO_INCREMENT,
	email VARCHAR(50)
);
INSERT INTO emails(email) 
VALUES('a@b.com'),
		('c@d.com'),
		('a@b.com');

SELECT email
FROM emails
GROUP BY email
HAVING COUNT(email) > 1;

-- bai 4
CREATE TABLE customers(
	id INT PRIMARY KEY AUTO_INCREMENT,
	NAME VARCHAR(50)
);
CREATE TABLE orders_b4(
	id INT PRIMARY KEY AUTO_INCREMENT,
	customerId INT
);
INSERT INTO customers(NAME) 
VALUES('Joe'),
		('Henry'),
		('Sam'),
		('Max');
		
INSERT INTO orders_b4(customerId) 
VALUES(3),(1);

select NAME 
from Customers
where id NOT IN (select customerId from orders_b4)

