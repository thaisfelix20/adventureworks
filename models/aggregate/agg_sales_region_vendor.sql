with 
region as (
	select 
        name_country 
        , addressid
        , city
        , name_state
    from {{ ref('dim_geographicregion') }}
)
, fact_sales as (
	select * 
    from {{ ref('fact_salesorderheaderdetail') }}
)
, person as (
	select  
        (firstname || ' ' || middlename || ' ' || lastname) as full_name_vendor
        , businessentityid
        , persontype
    from {{ ref('stg_person') }}
)
, completed as (
    select 
        fact.salesorderid
        , fact.billtoaddressid
        , fact.salespersonid as personid
        , fact.modifieddate
        , fact.taxamt
        , fact.shiptoaddressid
        , fact.territoryid
        , fact.order_status_name
        , fact.orderdate
        , fact.creditcardapprovalcode
        , fact.subtotal
        , fact.creditcardid
        , fact.freight
        , fact.totaldue
        , fact.customerid
        , fact.orderqty
        , fact.salesorderdetailid
        , fact.unitprice
        , fact.productid
        , fact.unitpricediscount
        , p.full_name_vendor as vendedor
        , p.persontype
        , r.name_country 
        , r.addressid
        , r.city as city
        , r.name_state
    from fact_sales as fact
    left join person p
        on fact.salespersonid = p.businessentityid
    left join region r
        on fact.billtoaddressid = r.addressid
)
, aggreg as (
    select 
        sum(unitprice) as Valor_total_negociado
        , sum(orderqty) as Quantidade_comprada 
        , avg(unitprice) as Ticket_medio
        , city
        , vendedor
        , personid
    from completed
    group by city, vendedor, personid
)
select * 
from aggreg
--valor venda(faturamento) 
--quantidade vendida de produtos
--quantidade de pedidos
-- agrupar: vendedor(ID) e cidade

--Codestyle


