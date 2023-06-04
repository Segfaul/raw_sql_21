SELECT p.product_id,CASE WHEN c.customer_id in (SELECT customers.customer_id FROM customers WHERE customers.customer_id IS NULL ) THEN 'не зарегестрированный пользователь'
ELSE 'Зарегестрированный пользователь'
END AS customer_type, COUNT(*)
FROM products p
JOIN sales s ON s.product_id=p.product_id
JOIN customers c ON c.customer_id=s.customer_id
GROUP BY p.product_id,c.customer_id
HAVING COUNT(*) >= ALL( SELECT COUNT(*)FROM products GROUP BY product_id)
ORDER BY COUNT(*) DESC  
LIMIT 3