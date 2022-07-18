select city, category, EXTRACT(YEAR FROM created_at) as year, EXTRACT(MONTH FROM created_at) as month, 
round(avg(price), 2) as average_monthly_price
from {{ source('core','italy_listings') }} rentals
where category is not NULL
group by city, category, year, month
order by year, month
