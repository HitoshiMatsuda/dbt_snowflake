with
    source as (
        {{ config(schema="classiccars_L1") }}
        select *
        from {{ source("classiccars", "PAYMENTS") }}
    ),

    renamed as (select customernumber, checknumber, paymentdate, amount from source)
select *
from renamed
