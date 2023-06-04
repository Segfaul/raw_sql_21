(SELECT pr.name, st.region, CASE WHEN pr.name in (SELECT products.name FROM products)
THEN 'самый популярный продукт для региона'
END AS popularity_type
FROM products pr
JOIN sales s ON s.product_id =pr.product_id
JOIN stores st ON st.store_id=s.store_id
GROUP BY pr.name,st.region
HAVING COUNT(*) >= ALL(
    SELECT COUNT(*)FROM products
    GROUP BY name 
    )
ORDER BY COUNT(*) DESC
LIMIT 1)

UNION ALL

(SELECT pr.name, st.region, CASE WHEN st.region in (SELECT stores.region FROM stores)
THEN 'самый популярный регион для продукта'
END AS popularity_type
FROM products pr
JOIN sales s ON s.product_id =pr.product_id
JOIN stores st ON st.store_id=s.store_id
GROUP BY pr.name,st.region
HAVING COUNT(*)  >= ALL(
    SELECT COUNT(*) FROM stores
    GROUP BY region 
    )
ORDER BY COUNT(*) DESC
LIMIT 1)