USE bike_data
GO

select * from bike_share_yr_0
union  -- in SQL use UNION for append data.it removes duplicates in data 
select * from bike_share_yr_1
select * from cost_table

;with cte AS (
select * from bike_share_yr_0
union  -- in SQL use UNION for append data.it removes duplicates in data 
select * from bike_share_yr_1)
select 
dteday,
season,
a.yr,
weekday,
hr,
rider_type,
riders,
price,
COGS,
riders * price as revenue,
riders * price - COGS as profit
from cte a
left join cost_table b
on a.yr = b.yr
