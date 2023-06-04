select customer_id
from sales
where sale_date >= '2020-02-1' and sale_date <= '2020-02-29' and customer_id is not null
order by customer_id