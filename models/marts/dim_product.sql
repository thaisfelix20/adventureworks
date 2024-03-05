with 
products as (
	select * 
    from {{ ref('int_product') }}
)
, GeneratingSK as (
    select
        md5(cast(productid as string)) as Sk_products
        , *
    from products
)
select * 
from GeneratingSK    