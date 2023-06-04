(SELECT name FROM  products 
JOIN sales ON products.product_id =sales.product_id
WHERE sale_date::text like '____-02-23'
GROUP BY name
HAVING COUNT(*) >= ALL(SELECT COUNT(*) FROM products GROUP BY name)
LIMIT 1)
 
UNION ALL
 
(SELECT name FROM  products 
JOIN sales ON products.product_id =sales.product_id
WHERE sale_date::text like '____-03-08' GROUP BY name HAVING COUNT(*) >=ALL(SELECT COUNT(*) FROM products GROUP BY name) 
LIMIT 1)