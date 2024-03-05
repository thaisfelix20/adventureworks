with
    dados as (
        select *
        from {{ source('raw_adventureworks','salesorderheadersalesreason') }}
    )

select *
from dados