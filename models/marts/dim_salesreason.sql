with 
salesreason as (
	select * 
    from {{ ref('int_salesreason') }}
)
, GeneratingSK as (
    select
        md5(concat(cast(salesreasonid as string), cast(salesorderid as string))) as Sk_salesreason
        , *
    from salesreason
)
select * 
from GeneratingSK    