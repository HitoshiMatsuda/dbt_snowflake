with
    source as (
        {{ config(schema="_classiccars_L1") }}
        select *
        from {{ source("classiccars", "PAYMENTS") }}
    ),

    renamed as (select customernumber, checknumber, paymentdate, amount from source)
select *
from renamed
