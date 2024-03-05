with 
customers as (
	select * 
    from {{ ref('int_customer') }}
)
, GeneratingSK as (
    select
        md5(cast(customerid as string)) as Sk_customers
        , *
    from customers
)
select * 
from GeneratingSK    