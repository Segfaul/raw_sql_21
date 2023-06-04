(SELECT to_char(s.sale_date,'DD-MM') , pr.category, pr.name, COUNT(*) 
FROM products pr
JOIN sales s ON pr.product_id = s.product_id 
WHERE pr.category:: text  LIKE 'сосиски' AND pr.name :: text LIKE '%уп.' AND sale_date:: text LIKE '____-02-__'
GROUP BY s.sale_date,pr.category, pr.name)

UNION ALL

(SELECT to_char(s.sale_date,'DD-MM') , pr.category, pr.name, COUNT( s.sale_date) FROM products pr
JOIN sales s ON pr.product_id = s.product_id 
WHERE pr.category:: text  LIKE ' сосиски' AND pr.name :: text LIKE '%вес.'AND sale_date:: text LIKE '____-02-__'
GROUP BY s.sale_date,pr.category, pr.name)