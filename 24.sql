select prices.product_id, max(price), min(price)
from prices
join products on products.product_id = prices.product_id
group by prices.product_id, products.name
order by products.name
