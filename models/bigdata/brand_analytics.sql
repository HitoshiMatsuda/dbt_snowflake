with
    total as (
        {{ config(schema="_bigdata_L2") }} select * from {{ ref("total_apr_mar") }}
    ),

    brand_table as (
        select * from total where brand = 'acer' or brand = 'apple' order by price
    )

select t1.user_id, t1.price, t1.brand, t2.brand_id, t2.country
from brand_table t1
left join {{ ref("maps_brand") }} t2 on t1.brand = t2.brand_name
order by country
