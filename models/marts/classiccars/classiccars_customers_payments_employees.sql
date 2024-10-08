with customers_payments_source as (
    {{ config(schema='classiccars_L2') }}
    select * from {{ ref('classiccars_customers_payments') }}
),

employees_source as (
    {{ config(schema='classiccars_L2') }}
    select * from {{ ref('classiccars_employees') }}
),


agg_cus_pay_emp as (
    SELECT
        employeenumber,
        officecode,
        SUM(amount) AS amount
    FROM (
        SELECT
            emp.employeenumber AS employeenumber,
            emp.officecode AS officecode,
            cus_pay.amount AS amount
        FROM
            customers_payments_source AS cus_pay
        LEFT JOIN
            employees_source AS emp
        ON
            cus_pay.employeenumber = emp.employeenumber )
    GROUP BY
        employeenumber,
        officecode
    ORDER BY
        amount
)

select * from agg_cus_pay_emp