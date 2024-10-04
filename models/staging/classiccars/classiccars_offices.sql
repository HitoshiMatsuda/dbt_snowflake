with source as (
    {{ config(schema='_classiccars_L1') }}
    select * from {{ source('classiccars', 'OFFICES') }}
),

renamed as (
    select
        OFFICECODE,
        CITY,
        PHONE,
        ADDRESSLINE1,
        ADDRESSLINE2,
        STATE,
        COUNTRY,
        POSTALCODE,
        TERRITORY
    from source
)
select * from renamed