select * from {{ source("bigdata", "APR_2020") }} where price < 0
