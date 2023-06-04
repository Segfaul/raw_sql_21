select prices.product_id, max(price), min(price)
from prices
join products on products.product_id = prices.product_id
join sales on sales.product_id = prices.product_id
where sales.store_id < 10
group by prices.product_id, products.name
order by products.name