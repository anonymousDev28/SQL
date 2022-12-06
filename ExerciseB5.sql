CREATE TABLE categories(
	id INT AUTO_INCREMENT PRIMARY KEY,
	category_code VARCHAR(50) NOT NULL ,
	category_name VARCHAR(50) NOT NULL ,
	created_datecustomers DATE NOT NULL,
	updated_date DATE NOT NULL
);

CREATE TABLE suppliers(
	id INT AUTO_INCREMENT PRIMARY KEY,
	supplier_code VARCHAR(50) NOT NULL ,
	supplier_name VARCHAR(50) NOT NULL ,
	image VARCHAR(50),
	created_date DATE NOT NULL,
	updated_date DATE NOT NULL
);

CREATE TABLE products(
	id INT AUTO_INCREMENT PRIMARY KEY,
	product_code VARCHAR(50) NOT NULL ,
	product_name VARCHAR(50) NOT NULL ,
	image VARCHAR(50),
	DESCRIPTION VARCHAR(50),
	standard_cost FLOAT,
	quantity INT,
	from_country VARCHAR(50),
	product_unit ENUM('cái','bộ','quyển','kg'),
	is_new ENUM('NULL','NEW','NOT_NEW'),
	created_date DATE NOT NULL,
	updated_date DATE NOT NULL,
	CONSTRAINT chk_country 
	CHECK 
	((from_country NOT LIKE '% %') AND 
	 (from_country LIKE '%_%') AND 
	 (BINARY from_country = BINARY UPPER(from_country))),
	category_id INT,
	supplier_id INT,
	FOREIGN KEY(category_id) REFERENCES categories(id),
	FOREIGN KEY(supplier_id) REFERENCES suppliers(id)
); 
CREATE TABLE product_discounts(
	id INT AUTO_INCREMENT PRIMARY KEY,
	discount_name VARCHAR(50) NOT NULL ,
	discount_amout VARCHAR(50) NOT NULL ,
	start_date DATE NOT NULL,
	end_date DATE NOT NULL,
	product_id INT,
	FOREIGN KEY(product_id) REFERENCES products(id)
);
CREATE TABLE product_reviews(
	id INT AUTO_INCREMENT PRIMARY KEY ,
	rating INT NOT NULL ,
	comment VARCHAR(50) NOT NULL ,
	created_date DATE NOT NULL,
	updated_date DATE NOT NULL,
	CONSTRAINT chk_rating CHECK(rating >=1 AND rating <=5)
);
CREATE TABLE customers(
	id INT AUTO_INCREMENT PRIMARY KEY ,
	username VARCHAR(50) NOT NULL ,
	password VARCHAR(50) NOT NULL ,
	first_name VARCHAR(50) NOT NULL ,
	last_name VARCHAR(50) NOT NULL ,
	gender ENUM('NULL','MALE','FEMALE'),
	email VARCHAR(50) NOT NULL ,
	birthday DATE NOT NULL,
	avartar VARCHAR(50) NOT NULL,
	address VARCHAR(50) NOT NULL,
	STATUS VARCHAR(50) NOT NULL,
	created_date DATE NOT NULL ,
	updated_date DATE NOT NULL ,
	review_id INT,
	FOREIGN KEY(review_id) REFERENCES product_reviews(id)
);
CREATE TABLE orders(
	id INT AUTO_INCREMENT PRIMARY KEY ,
	quantity INT NOT NULL,
	price FLOAT NOT NULL,
	paid_date DATE NOT NULL,
	customer_id INT,
	product_id INT,
	FOREIGN KEY (customer_id) REFERENCES customers(id),
	FOREIGN KEY (product_id) REFERENCES products(id)
);

-- 1. Tìm số hóa đơn đã mua tất cả các sản phẩm do Singapore sản xuất.
SELECT COUNT(*) 
FROM orders a
JOIN products b
	ON  a.product_id = b.id 
WHERE b.from_country = 'Singapore'
-- 2. Có bao nhiêu hóa đơn không phải của khách hàng đăng ký thành viên mua?
SELECT COUNT(*) 'hóa đơn không phải của khách hàng đăng ký'
FROM orders a
JOIN products b
	ON  a.product_id = b.id
WHERE a.customer_id is NULL
-- 3. Có bao nhiêu sản phẩm khác nhau được bán ra trong năm 2006
SELECT COUNT(DISTINCT product_id)
FROM orders a
WHERE YEAR(a.paid_date) = 2006
-- 4. Cho biết trị giá hóa đơn cao nhất, thấp nhất là bao nhiêu ?
SELECT MAX(price) 'trị giá hóa đơn cao nhất'
FROM orders

SELECT MIN(price) 'trị giá hóa đơn thấp nhất'
FROM orders
-- 5. Trị giá trung bình của tất cả các hóa đơn được bán ra trong năm 2006 là bao nhiêu?
SELECT AVG(price) 'Trị giá trung bình của tất cả các hóa đơn được bán ra trong năm 2006'
FROM orders a
WHERE year(a.paid_date) = 2006
-- 6. Tính doanh thu bán hàng trong năm 2006.
SELECT SUM(price) 'doanh thu bán hàng trong năm 2006'
FROM orders a
WHERE year(a.paid_date) = 2006
-- 7. Tìm số hóa đơn có trị giá cao nhất trong năm 2006.
SELECT MAX(price) 'hóa đơn có trị giá cao nhất trong năm 2006'
FROM orders a
WHERE year(a.paid_date) = 2006
-- 8. Tìm họ tên khách hàng đã mua hóa đơn có trị giá cao nhất trong năm 2006.
SELECT CONCAT(first_name,last_name) as 'họ tên khách hàng có hóa đơn có trị giá cao nhất trong năm 2006'
FROM orders a 
JOIN customers b 
	ON a.customer_id = b.id
WHERE year(a.paid_date) = 2006 
AND a.price = (SELECT MAX(c.price) FROM orders c)
-- 9. In ra danh sách các sản phẩm (MASP, TENSP) có giá bán bằng 1 trong 3 mức giá cao nhất.
SELECT *
FROM products a JOIN 
(
	SELECT DISTINCT (standard_cost) AS standard_cost
	FROM products
	ORDER BY standard_cost DESC
	LIMIT 3
) AS b
WHERE a.standard_cost = b.standard_cost;

-- 10. In ra danh sách các sản phẩm (MASP, TENSP) do “Thai Lan” sản xuất có giá bằng 1 trong 3 mức giá cao nhất (của tất cả các sản phẩm).
SELECT *
FROM products a JOIN 
(
	SELECT DISTINCT (standard_cost) AS standard_cost
	FROM products
	ORDER BY standard_cost DESC
	LIMIT 3
) AS b
WHERE a.standard_cost = b.standard_cost AND a.from_country = 'THAI_LAND';

-- 11. In ra danh sách các sản phẩm (MASP, TENSP) do “Trung Quoc” sản xuất có giá bằng 1 trong 3 mức giá cao nhất (của sản phẩm do “Trung Quoc” sản xuất)
SELECT *
FROM products a JOIN 
(
	SELECT DISTINCT (standard_cost) AS standard_cost
	FROM products
	ORDER BY standard_cost DESC
	LIMIT 3
) AS b
WHERE a.standard_cost = b.standard_cost AND a.from_country = 'CHINA';

-- 12. In ra danh sách 3 khách hàng có doanh số cao nhất (sắp xếp theo kiểu xếp hạng).
SELECT *
FROM customers JOIN 
(
-- lấy ra id top 3 khách hàng
	SELECT a.customer_id
	FROM orders a
	WHERE a.customer_id IS NOT NULL 
	GROUP BY customer_id
	ORDER BY SUM(a.quantity * a.price) DESC
	LIMIT 3
) AS b
WHERE customers.id = b.customer_id
-- 13. Tính tổng số sản phẩm của từng nước sản xuất.
SELECT p.from_country 'Xuất xứ', SUM(p.quantity) 'Số sản phẩm'
FROM products p
GROUP BY p.from_country
-- 14. Với từng nước sản xuất, tìm giá bán cao nhất, thấp nhất, trung bình của các sản phẩm.
SELECT p.from_country 'Xuất xứ', 
	MAX(p.standard_cost) 'Giá cao nhất',
	MIN(p.standard_cost) 'Giá thấp nhất',
	AVG(p.standard_cost) 'Giá trung bình'
FROM products p
GROUP BY p.from_country
-- 15.Tính doanh thu bán hàng mỗi ngày.
SELECT p.paid_date 'Ngày',SUM(p.quantity * p.price) 'Doanh Thu' 
FROM orders p 
GROUP BY p.paid_date
-- 16.Tính tổng số lượng của từng sản phẩm bán ra trong tháng 10/2006
SELECT p.product_id,SUM(p.quantity * p.price) 'Doanh thu tháng 10/2006' 
FROM orders p
WHERE p.paid_date LIKE '2006-10-%'
GROUP BY p.product_id
-- 18. Tìm khách hàng (MAKH, HOTEN) có số lần mua hàng nhiều nhất.
SELECT a.id 'Mã khách hàng',CONCAT(a.first_name,a.last_name) 'Họ tên' 
FROM customers a JOIN 
(
	SELECT b.customer_id
	FROM orders b
	WHERE b.customer_id IS NOT NULL 
	GROUP BY b.customer_id
	ORDER BY COUNT(*) DESC
	LIMIT 1
) AS c
ON a.id = c.customer_id
-- 19. Tháng mấy trong năm 2006, doanh số bán hàng cao nhất ?
SELECT MONTH(o.paid_date) 'Tháng',SUM(o.price * o.quantity) 'doanh số'
FROM orders o
WHERE YEAR(o.paid_date) = 2006
GROUP BY MONTH(o.paid_date)
ORDER BY SUM(o.price * o.quantity) DESC
LIMIT 1
-- 20. Tìm sản phẩm (MASP, TENSP) có tổng số lượng bán ra thấp nhất trong năm 2006.
thống kê số lượng bán ra của từng sản phẩm trong năm 2006 \
SELECT p.product_code 'MÃ SẢN PHẨM',p.product_name 'TÊN SẢN PHẢM'
FROM products p JOIN 
(
	SELECT o.product_id
	FROM orders o
	GROUP BY o.product_id
	ORDER BY SUM(o.quantity)
	LIMIT 1
) AS c 
ON p.id = c.product_id
-- 21. Mỗi nước sản xuất, tìm sản phẩm (MASP,TENSP) có giá bán cao nhất.
SELECT p.from_country 'XUẤT XỨ',p.product_code 'MÃ SẢN PHẨM',p.product_name 'TÊN SẢN PHẢM',p.standard_cost
FROM products p,products p2
WHERE p.standard_cost > p2.standard_cost
GROUP BY p.from_country 

