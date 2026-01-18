{{ config(materialized='table') }}
with dates as (
  select
    date_day
  from unnest(
    generate_date_array(
      date('2019-01-01'),
      current_date(),
      interval 1 day
    )
  ) as date_day
)

select
  date_day as date,
  extract(year from date_day) as year,
  extract(month from date_day) as month,
  format_date('%Y-%m', date_day) as year_month,
  extract(week from date_day) as week_of_year,
  extract(dayofweek from date_day) as day_of_week,
  format_date('%A', date_day) as day_name,
  case when extract(dayofweek from date_day) in (1,7) then true else false end as is_weekend
from dates
