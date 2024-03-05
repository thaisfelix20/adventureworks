with
    dados as (
        select *
        from {{ source('raw_adventureworks','product') }}
    )

select *
from dados