with 
salesreason as (
    select
        salesreasonid
        , name as name_reason
        , reasontype
    from {{ ref('stg_salesreason') }}
)
, salesorderheadersalesreason as (
    select
        salesreasonid
        , salesorderid
    from {{ ref('stg_salesorderheadersalesreason') }}
)
, juncao as (
    select
        shs.salesreasonid
        , shs.salesorderid
        , s.name_reason
        , s.reasontype
    from salesorderheadersalesreason shs
    left join salesreason s
        on shs.salesreasonid = s.salesreasonid
)
select *
from juncao