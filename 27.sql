SELECT products.name
FRom products
JOIN sales ON products.product_id=sales.product_id
JOIN customers ON customers.customer_id=sales.customer_id
WHERE customers.name IS NULL OR customers.surname IS NULL
GROUP BY products.name 
HAVING COUNT(*) >=ALL(SELECT COUNT(*) FROM products GROUP BY products.name)