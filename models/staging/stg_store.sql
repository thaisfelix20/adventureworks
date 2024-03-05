with
    dados as (
        select *
        from {{ source('raw_adventureworks','store') }}
    )

select *
from dados