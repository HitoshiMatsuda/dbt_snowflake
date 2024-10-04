with
    apr as ({{ config(schema="_bigdata_L2") }} select * from {{ ref("bigdata_APR") }}),

    mar as ({{ config(schema="_bigdata_L2") }} select * from {{ ref("bigdata_Mar") }}),

    union_tables as (
        select *
        from apr
        union
        select *
        from mar
    )

select *
from union_tables
