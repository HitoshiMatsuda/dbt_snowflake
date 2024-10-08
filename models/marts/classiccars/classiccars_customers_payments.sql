with customers_source as (
    {{ config(schema='classiccarsL2') }}
    select * from {{ ref('classiccars_customers') }}
),

payments_source as (
    {{ config(schema='classiccars_L2') }}
    select * from {{ ref('classiccars_payments') }}
),


agg_cus_pay as (
    SELECT
        customernumber,
        customername,
        SUM(amount) AS amount,
        CAST(employeenumber AS integer) AS employeenumber
    FROM (
        SELECT
            cus.CUSTOMERNUMBER AS CUSTOMERNUMBER,
            cus.CUSTOMERNAME AS CUSTOMERNAME,
            pay.AMOUNT AS AMOUNT,
            cus.EMPLOYEENUMBER AS EMPLOYEENUMBER
        FROM
            customers_source AS cus
        LEFT JOIN
            payments_source AS pay
        ON
            cus.CUSTOMERNUMBER = pay.CUSTOMERNUMBER )
    GROUP BY
        customernumber,
        customername,
        employeenumber
    ORDER BY
        amount
)

select * from agg_cus_pay