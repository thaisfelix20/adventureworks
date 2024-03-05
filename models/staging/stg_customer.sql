with
    dados_cliente as (
        select *
        from {{ source('raw_adventureworks','customer') }}
    )

select *
from dados_cliente