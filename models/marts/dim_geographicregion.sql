with 
geographicregion as (
	select * 
    from {{ ref('int_geographicregion') }}
)
, GeneratingSK as (
    select
        md5(cast(addressid as string)) as Sk_geographicregion
        , *
    from geographicregion
)
select * 
from GeneratingSK    