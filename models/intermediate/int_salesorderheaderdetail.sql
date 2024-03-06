with 
salesorderheader as (
    select
         salesorderid	
        , billtoaddressid
        , salespersonid
        , modifieddate
        , taxamt
        , shiptoaddressid
        , territoryid
        , CASE 
            WHEN status = 1 THEN 'In_process'
            WHEN status = 2 THEN 'Approved'
            WHEN status = 3 THEN 'Backordered' 
            WHEN status = 4 THEN 'Rejected' 
            WHEN status = 5 THEN 'Shipped'
            WHEN status = 6 THEN 'Cancelled' 
            ELSE 'no_status'
        end as order_status_name
        , orderdate
        , creditcardapprovalcode
        , subtotal
        , creditcardid
        , freight
        , totaldue
        , customerid
    from {{ ref('stg_salesorderheader') }}
)
, salesorderdetail as (
    select
        orderqty
        , salesorderid
        , salesorderdetailid
        , unitprice
        , productid
        , unitpricediscount
    from {{ ref('stg_salesorderdetail') }}
)
, juncao as (
    select 
        soh.salesorderid	
        , soh.billtoaddressid
        , soh.salespersonid
        , soh.modifieddate
        , soh.taxamt
        , soh.shiptoaddressid
        , soh.territoryid
        , soh.order_status_name
        , soh.orderdate
        , soh.creditcardapprovalcode
        , soh.subtotal
        , soh.creditcardid
        , soh.freight
        , soh.totaldue
        , soh.customerid
        , sod.orderqty
        , sod.salesorderdetailid
        , sod.unitprice
        , sod.productid
        , sod.unitpricediscount
    from salesorderheader soh
    left join salesorderdetail sod
        on soh.salesorderid = sod.salesorderid
)
select *
from juncao