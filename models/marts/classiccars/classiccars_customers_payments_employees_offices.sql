with
    customers_payments_employees_source as (
        {{ config(schema="_classiccars_L2") }}
        select *
        from {{ ref("classiccars_customers_payments_employees") }}
    ),

    offices_source as (
        {{ config(schema="_classiccars_L2") }}
        select *
        from {{ ref("classiccars_offices") }}
    ),

    agg_cus_pay_emp as (
        select officecode, sum(amount) as amount
        from
            (
                select offi.officecode as officecode, emp_amo.amount as amount
                from customers_payments_employees_source as emp_amo
                left join offices_source as offi on emp_amo.officecode = offi.officecode
            )
        group by officecode
        order by amount desc
    )

select *
from agg_cus_pay_emp
