CREATE TABLE "Employee" (
	"employee_id"	TEXT NOT NULL,
	"first_name"	TEXT NOT NULL,
	"last_name"	TEXT NOT NULL,
	"address"	TEXT NOT NULL,
	"salary"	NUMERIC NOT NULL,
	"phone_number"	TEXT,
	PRIMARY KEY("employee_id")
);

CREATE TABLE "Products" (
	"product_id"	TEXT NOT NULL,
	"product_name"	TEXT NOT NULL,
	"desrciption"	TEXT,
	"price"	NUMERIC NOT NULL,
	"category"	TEXT,
	PRIMARY KEY("product_id")
);

CREATE TABLE "customers" (
	"customer_id"	INTEGER NOT NULL,
	"customer_name"	TEXT NOT NULL,
	"phone_number"	TEXT,
	PRIMARY KEY("customer_id")
);

CREATE TABLE "product" (
	"product_id"	TEXT NOT NULL,
	"product_name"	TEXT NOT NULL,
	"price"	REAL NOT NULL,
	"stok"	INTEGER,
	PRIMARY KEY("product_id")
);

CREATE TABLE "orders" (
	"order_id"	INTEGER NOT NULL,
	"customer_id"	INTEGER NOT NULL,
	"order_date"	TEXT NOT NULL,
	"status"	TEXT,
	PRIMARY KEY("order_id"),
	FOREIGN KEY("customer_id") REFERENCES "customers"("customer_id")
);

CREATE TABLE "order_items" (
	"order_id"	INTEGER NOT NULL,
	"product_id"	TEXT NOT NULL,
	"quantity"	INTEGER NOT NULL,
	"unit_price"	NUMERIC,
	PRIMARY KEY("order_id","product_id"),
	FOREIGN KEY("order_id") REFERENCES "orders"("order_id"),
	FOREIGN KEY("product_id") REFERENCES "product"("product_id")
);


-- เพิ่มข้อมูล Employee
INSERT INTO Employee
(employee_id, first_name, last_name, address, salary, phone_number)
VALUES
('EMP001', 'สมชาย', 'ใจดี', 'กรุงเทพมหานคร', 25000.00, '0812345678'),
('EMP002', 'สมหญิง', 'ทองดี', 'กรุงเทพมหานคร', 28000.00, '0823456789'),
('EMP003', 'วิชัย', 'ใจกล้า', 'เชียงใหม่', 22000.00, '0834567890');


-- ข้อ 6
UPDATE Employee
SET salary = salary * 1.10
WHERE employee_id = 'EMP001';


-- ข้อ 7
DELETE FROM Products
WHERE price <= 0
   OR product_name IS NULL
   OR product_name = '';


-- ข้อ 8
SELECT product_id, product_name, price
FROM Products
WHERE category = 'Electronics'
  AND price > 500
ORDER BY price DESC;


-- ข้อ 9
SELECT AVG(salary) AS average_salary,
       COUNT(*) AS employee_count
FROM Employee;


-- ข้อ 10
SELECT *
FROM Employee
WHERE last_name LIKE 'ทอง%';


-- ข้อ 11
SELECT orders.order_id, customers.customer_name
FROM orders
INNER JOIN customers
ON orders.customer_id = customers.customer_id;


-- ข้อ 12
SELECT orders.order_id, Product.product_name, Product.price
FROM orders
INNER JOIN order_items
    ON orders.order_id = order_items.order_id
INNER JOIN Product
    ON order_items.product_id = Product.product_id;


-- ข้อ 13
SELECT customer_id, COUNT(*) AS order_count
FROM orders
GROUP BY customer_id
HAVING COUNT(*) >= 3;