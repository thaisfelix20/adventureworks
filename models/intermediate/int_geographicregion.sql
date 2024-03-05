with 
addr as (
	select 
        addressid
        , addressline1
        , addressline2
        , city
        , stateprovinceid
        , postalcode
    from {{ ref('stg_address') }}
)
, stateprovince as (
	select 
        stateprovinceid
        , stateprovincecode
        , countryregioncode
        , name as name_state
        , territoryid        
    from {{ ref('stg_stateprovince') }}
)
, countryregion as (
	select 
        countryregioncode
        , name as name_country
    from {{ ref('stg_countryregion') }}
),
juncao_tabelas as (
    select 
        ad.addressid
        , ad.addressline1
        , ad.addressline2
        , ad.city
        , ad.stateprovinceid
        , ad.postalcode   
        , stat.stateprovincecode
        , stat.countryregioncode
        , stat.name_state
        , stat.territoryid 
        , country.name_country   
    from addr ad
    left join stateprovince stat
        on ad.stateprovinceid = stat.stateprovinceid
    left join countryregion country
        on stat.countryregioncode = country.countryregioncode
)
select *
from juncao_tabelas