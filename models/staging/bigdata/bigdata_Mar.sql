with source as (
    {{ config(schema='_bigdata_L1') }}
    select * from {{ source('bigdata', 'MAR_2020') }}
),

trans_double as (
    select
        EVENT_TIME ,
        EVENT_TYPE ,
        PRODUCT_ID ,
        CATEGORY_ID ,
        CATEGORY_CODE ,
        BRAND ,
        CAST(PRICE AS float) AS PRICE ,
        USER_ID ,
        USER_SESSION 
    from source
)
select * from trans_double