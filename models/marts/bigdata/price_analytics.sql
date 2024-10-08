with
    total as (
        {{ config(schema="_bigdata_L2") }} select * from {{ ref("total_apr_mar") }}
    ),

    label_table as (
        select
            brand,
            max(price) as max_price,
            min(price) as min_price,
            min(price) + ((max(price) - min(price)) / 4) as first_label,
            min(price) + ((max(price) - min(price)) / 2) as second_label,
            min(price) + (((max(price) - min(price)) / 4) * 3) as third_label
        from total
        group by brand
    )

select
    t1.user_id,
    t1.price,
    t1.brand,
    case
        when price < first_label
        then '低'
        when price < second_label
        then '中'
        when price < third_label
        then '高'
        when price > third_label
        then '最高'
        else '判定不可'
    end as label,
    t2.min_price,
    t2.max_price,
    t2.first_label,
    t2.second_label,
    t2.third_label
from total t1
left join label_table t2 on t1.brand = t2.brand
