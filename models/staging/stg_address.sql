with
    dados as (
        select *
        from {{ source('raw_adventureworks','address') }}
    )

select *
from dados