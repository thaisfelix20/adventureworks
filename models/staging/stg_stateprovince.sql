with
    dados as (
        select *
        from {{ source('raw_adventureworks','stateprovince') }}
    )

select *
from dados