WITH tmp as (
    SELECT pr.product_id,CASE WHEN c.customer_id in (SELECT customers.customer_id FROM customers WHERE customers.customer_id IS NULL ) THEN 'не зарегестрированный пользователь'
    ELSE 'Зарегестрированный пользователь '
    END AS customer_type, COUNT(*) as cnt
    FROM products pr
    JOIN sales s ON s.product_id=pr.product_id
    JOIN customers c ON c.customer_id=s.customer_id 
    GROUP BY pr.product_id,c.customer_id
)

SELECT tmp.product_id,tmp.customer_type, tmp.cnt
FROM tmp
GROUP BY tmp.product_id,tmp.customer_type, tmp.cnt
HAVING tmp.cnt >= ALL( SELECT COUNT(*)FROM products GROUP BY product_id)
ORDER BY tmp.cnt DESC  
LIMIT 3