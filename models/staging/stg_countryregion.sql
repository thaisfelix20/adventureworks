with
    dados as (
        select *
        from {{ source('raw_adventureworks','countryregion') }}
    )

select *
from dados