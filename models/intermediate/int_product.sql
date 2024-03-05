with 
product as (
    select
        name as name_product
        , productid
        , daystomanufacture
    from {{ ref('stg_product') }}
)
select *
from product