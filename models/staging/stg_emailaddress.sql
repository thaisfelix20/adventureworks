with
    dados as (
        select *
        from {{ source('raw_adventureworks','emailaddress') }}
    )

select *
from dados