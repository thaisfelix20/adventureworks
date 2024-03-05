with
    dados as (
        select *
        from {{ source('raw_adventureworks','person') }}
    )

select *
from dados