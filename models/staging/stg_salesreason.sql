with
    dados as (
        select *
        from {{ source('raw_adventureworks','salesreason') }}
    )

select *
from dados