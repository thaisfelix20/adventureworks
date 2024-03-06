with 
salesorderheaderdetail as (
	select * 
    from {{ ref('int_salesorderheaderdetail') }}
)
, GeneratingSK as (
    select
        md5(cast(salesorderid as string)) as Sk_salesorderheaderdetail
        , *
    from salesorderheaderdetail
)
select * 
from GeneratingSK    