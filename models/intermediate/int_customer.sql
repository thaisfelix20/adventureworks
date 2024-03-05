with 
person as (
	select 
        businessentityid 
        , persontype
        , (firstname || ' ' || middlename || ' ' || lastname) as full_name
        , emailpromotion 
    from {{ ref('stg_person') }}
)
, customer as (
	select 
        customerid 
        , personid 
        , storeid 
        , territoryid         
    from {{ ref('stg_customer') }}
)
, email as (
	select 
        businessentityid 
        , emailaddressid 
        , emailaddress 
    from {{ ref('stg_emailaddress') }}
)
, store as (
	select 
        salespersonid 
        , name as name_store
        , businessentityid
    from {{ ref('stg_store') }}
)
, juncao_tables as (
    select 
        p.businessentityid 
        , p.persontype
        , p.full_name
        , p.emailpromotion
        , c.customerid 
        , c.personid 
        , c.storeid 
        , c.territoryid  
        , e.emailaddress
        , s.name_store
        , s.salespersonid     
    from person p
    left join email e
        on p.businessentityid = e.businessentityid
    right join customer c
        on p.businessentityid = c.personid
    left join store s
        on c.storeid = s.businessentityid
)

select *
from juncao_tables