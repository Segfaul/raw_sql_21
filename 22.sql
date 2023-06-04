select surname, count(surname) as n
from customers
group by surname
