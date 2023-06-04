select date_part('month', sale_date) as sale_month, count(sale_id) as count_sale
from sales
where date_part('year', sale_date) = '2020'
group by date_part('month', sale_date)