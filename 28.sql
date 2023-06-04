WITH 
table1 AS (
 SELECT  store_id, customer_id, count (sale_id) as count_saleid
 FROM  sales
 GROUP BY  store_id, customer_id)

SELECT fk2.store_id, stores.address, fk1.customer_id
FROM (SELECT  MAX(count_saleid) AS mx, table1.customer_id
FROM table1
GROUP BY table1.customer_id) AS fk1
JOIN table1 AS fk2
ON fk1.mx = fk2.count_saleid AND fk1.customer_id = fk2.customer_id
JOIN stores 
ON fk2.store_id = stores.store_id
ORDER BY fk1.customer_id, fk2.store_id