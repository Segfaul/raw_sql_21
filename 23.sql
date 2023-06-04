SELECT  product_id, start_date, end_date
FROM prices
WHERE start_date IN (SELECT start_date
FROM prices 
WHERE end_date - start_date = 6)
GROUP BY product_id, start_date, end_date
ORDER BY product_id asc