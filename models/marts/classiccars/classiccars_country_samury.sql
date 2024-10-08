with
    trans_lang as (
        {{ config(schema="classiccarsL2") }} select * from {{ ref("trans_jp") }}
    ),

    source_mart as (
        {{ config(schema="classiccars_L2") }}
        select *
        from {{ ref("classiccars_customers_payments_employees_offices") }}
    ),

    join_table as (
        select t1.officecode, t1.amount, t1.country, t2.jp_name, t2.update_date
        from source_mart t1
        left join trans_lang t2 on t1.country = t2.eng_name
    )

select *
from join_table
