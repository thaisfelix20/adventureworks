with 
creditcard as (
	select 
        cardtype
        , expyear
        , expmonth
        , cardnumber
        , creditcardid
    from {{ ref('stg_creditcard') }}
)
select *
from creditcard