select customer_id, name, surname
from customers
where substring(name from 1 for 1) = 'К' or substring(surname from 1 for 1) = 'К'
