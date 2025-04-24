SELECT product_id,product_name 
FROM fashion_products
LIMIT 10;

#Products from Adidas that cost more than 50:
SELECT * FROM fashion_products
WHERE brand = 'Adidas' AND price > 50;

#Select top 10 products with highest price:
SELECT * FROM fashion_products
ORDER BY price DESC
LIMIT 10;

#average price per brand:
SELECT brand, AVG(price) AS avg_price
FROM fashion_products
GROUP BY brand;

#subquery:
SELECT * 
FROM fashion_products
WHERE price = (
  SELECT MAX(price) FROM fashion_products
);

#create another table for joins:
CREATE TABLE users (
  user_id INT PRIMARY KEY,
  name VARCHAR(100),
  email VARCHAR(100)
);
INSERT INTO users (user_id, name, email) VALUES
(1, 'Alice Johnson', 'alice.johnson@example.com'),
(2, 'Bob Smith', 'bob.smith@example.com'),
(3, 'Catherine Lee', 'catherine.lee@example.com'),
(4, 'David Kim', 'david.kim@example.com'),
(5, 'Emily Davis', 'emily.davis@example.com');

#inner join
SELECT u.name, fp.product_name, fp.brand
FROM users u
INNER JOIN fashion_products fp ON u.user_id = fp.user_id;

#left join
SELECT u.name, fp.product_name
FROM users u
LEFT JOIN fashion_products fp ON u.user_id = fp.user_id;

#right join
SELECT u.name, fp.product_name
FROM users u
RIGHT JOIN fashion_products fp ON u.user_id = fp.user_id;

#aggregate functions: sum
SELECT category, SUM(price) AS total_revenue
FROM fashion_products
GROUP BY category;
SELECT product_name, AVG(price) AS avg_price, AVG(rating) AS avg_rating
FROM fashion_products
GROUP BY product_name;

#view for high rated product:
CREATE VIEW high_rated_products AS
SELECT * FROM fashion_products
WHERE rating > 4.0;

#indexes:
CREATE INDEX idx_brand ON fashion_products(`Brand`); #for brand filtering
CREATE INDEX idx_price ON fashion_products(`Price`); #for price filtering
CREATE INDEX idx_category ON fashion_products(`Category`); #for category filtering
CREATE INDEX idx_category_size ON fashion_products(`Category`, `Size`); #for both size and category


