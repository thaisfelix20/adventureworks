with
    dados as (
        select *
        from {{ source('raw_adventureworks','creditcard') }}
    )

select *
from dados