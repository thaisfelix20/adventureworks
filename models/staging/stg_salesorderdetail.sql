with
    dados as (
        select *
        from {{ source('raw_adventureworks','salesorderdetail') }}
    )

select *
from dados