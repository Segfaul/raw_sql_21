select distinct(concat(product_id, '-', store_id)) as "product_id - store_id"
from sales
where sale_date = '2020-02-14' and customer_id is not null