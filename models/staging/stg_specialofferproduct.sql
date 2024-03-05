with
    dados as (
        select *
        from {{ source('raw_adventureworks','specialofferproduct') }}
    )

select *
from dados