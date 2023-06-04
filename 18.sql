select sale_date, count(sale_id) as number_of_sales
from sales
group by sale_date
having count(sale_id) > 186000