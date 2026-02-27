@EndUserText.label: 'Min Unconfirmed Operation per Production Order'
define view entity ZPROD_MIN_UNCONF
as select from I_ManufacturingOrderOperation as a
  left outer join I_MfgOrderConfirmation as conf
    on conf.ManufacturingOrder = a.ManufacturingOrder
   and conf.ManufacturingOrderOperation_2 = a.ManufacturingOrderOperation_2
   and conf.IsReversal <> 'X'
   and conf.IsReversed <> 'X'
{
  a.ManufacturingOrder,
  min( a.ManufacturingOrderOperation_2 ) as MinOperation
}
where conf.ManufacturingOrder is null   
group by a.ManufacturingOrder
