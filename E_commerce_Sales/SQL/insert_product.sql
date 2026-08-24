INSERT INTO categories (category_name)
VALUES
('Electronics'),
('Clothing'),
('Home & Kitchen'),
('Books'),
('Beauty'),
('Sports'),
('Grocery'),
('Accessories');

SELECT COUNT(*) AS total_categories
FROM categories;



INSERT INTO products
(product_name, category_id, price, cost_price, stock_quantity)
VALUES
('Wireless Headphones', 1, 2499.00, 1500.00, 120),
('Bluetooth Speaker', 1, 1999.00, 1100.00, 85),
('Smart Watch', 1, 2500.00, 1800.00, 70),
('USB-C Charger', 1, 899.00, 450.00, 200),
('Mechanical Keyboard', 1, 3499.00, 2100.00, 60),

('Men Cotton T-Shirt', 2, 799.00, 400.00, 150),
('Women Casual Top', 2, 999.00, 500.00, 130),
('Denim Jeans', 2, 1799.00, 1000.00, 90),
('Hoodie', 2, 1499.00, 800.00, 75),
('Formal Shirt', 2, 1299.00, 650.00, 110),

('Non-Stick Pan', 3, 1599.00, 900.00, 80),
('Coffee Maker', 3, 2999.00, 1800.00, 45),
('Water Bottle', 3, 699.00, 300.00, 200),
('Electric Kettle', 3, 1899.00, 1000.00, 65),
('Dinner Set', 3, 2499.00, 1400.00, 50),

('Python Programming Book', 4, 899.00, 450.00, 100),
('Data Science Handbook', 4, 1299.00, 700.00, 70),
('SQL for Beginners', 4, 799.00, 400.00, 120),
('Machine Learning Guide', 4, 1499.00, 800.00, 60),
('Business Analytics Book', 4, 1099.00, 600.00, 80),

('Face Wash', 5, 499.00, 220.00, 180),
('Moisturizer', 5, 699.00, 320.00, 150),
('Sunscreen', 5, 599.00, 280.00, 160),
('Shampoo', 5, 549.00, 250.00, 140),
('Perfume', 5, 1599.00, 800.00, 90),

('Running Shoes', 6, 2499.00, 1400.00, 80),
('Yoga Mat', 6, 899.00, 400.00, 120),
('Football', 6, 999.00, 500.00, 90),
('Cricket Bat', 6, 2999.00, 1700.00, 50),
('Gym Gloves', 6, 699.00, 300.00, 100),

('Basmati Rice 5kg', 7, 699.00, 500.00, 200),
('Cooking Oil 5L', 7, 799.00, 600.00, 180),
('Green Tea', 7, 399.00, 220.00, 150),
('Coffee Powder', 7, 499.00, 280.00, 130),
('Dry Fruits Pack', 7, 899.00, 600.00, 100),

('Leather Wallet', 8, 999.00, 500.00, 90),
('Backpack', 8, 1499.00, 800.00, 75),
('Sunglasses', 8, 799.00, 350.00, 120),
('Travel Bag', 8, 1999.00, 1100.00, 60),
('Laptop Sleeve', 8, 899.00, 400.00, 100);

SELECT COUNT(*) AS total_products
FROM products;




SELECT *
FROM products
ORDER BY product_id;


SELECT COUNT(*) FROM products;