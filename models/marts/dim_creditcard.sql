with 
creditcard as (
	select * 
    from {{ ref('int_creditcard') }}
)
, GeneratingSK as (
    select
        md5(cast(creditcardid as string)) as Sk_creditcard
        , *
    from creditcard
)
select * 
from GeneratingSK    