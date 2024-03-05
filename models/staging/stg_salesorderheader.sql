with
    dados as (
        select *
        from {{ source('raw_adventureworks','salesorderheader') }}
    )

select *
from dados