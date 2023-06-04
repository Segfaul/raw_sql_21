select product_id, avg(price) as avg_price 
from prices
where extract(year from start_date) = 2020 and extract(year from end_date) = 2020
group by product_id
order by product_id