with source as (
    {{ config(schema='_classiccars_L1') }}
    select * from {{ source('classiccars', 'CUSTOMERS') }}
),

renamed as (
    select
        CUSTOMERNUMBER,
        CUSTOMERNAME,
        CONTACTLASTNAME,
        CONTACTFIRSTNAME,
        PHONE,
        ADDRESSLINE1,
        ADDRESSLINE2,
        CITY,
        STATE,
        POSTALCODE,
        COUNTRY,
        SALESREPEMPLOYEENUMBER AS EMPLOYEENUMBER,
        CREDITLIMIT
    from source
)
select * from renamed