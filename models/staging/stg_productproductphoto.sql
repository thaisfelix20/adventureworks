with
    dados as (
        select *
        from {{ source('raw_adventureworks','productproductphoto') }}
    )

select *
from dados