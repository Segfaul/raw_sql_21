select count(distinct sale_date) as count_sales_186000
from (
    select sale_date, count(sale_id) as number_of_sales
    from sales
    group by sale_date
    having count(sale_id) > 186000
) as most_sales_by_date