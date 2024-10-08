{{
    config(
        materialized='incremental',
        unique_key='code'
    )
}}

with source as (

    select * from {{ ref('plants') }}

)

select * from source

{% if is_incremental() %}

  -- this filter will only be applied on an incremental run
  where update_date > (select max(update_date) from {{ this }})

{% endif %}