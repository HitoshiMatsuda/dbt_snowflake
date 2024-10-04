{{
    config(
        materialized='incremental',
        unique_key='brand_id'
    )
}}

with source as (

    select * from {{ ref('maps_brand') }}

)

select * from source

{% if is_incremental() %}

  -- this filter will only be applied on an incremental run
  where update_date > (select max(update_date) from {{ this }})

{% endif %}