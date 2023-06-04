select product_id, count(sale_id) as count_sale
from sales
where customer_id = null
group by product_id
order by count(sale_id) desc
limit 1