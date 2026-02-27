@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'OrderStatus'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.usageType:{
    serviceQuality: #X,
    sizeCategory: #S,
    dataClass: #MIXED
}
define view entity ZOrderStatus
  as select from    I_ManufacturingOrderStatus as A
    left outer join I_ManufacturingOrderStatus as teco on  teco.ManufacturingOrder = A.ManufacturingOrder
                                                       and teco.StatusCode         = 'I0045'
                                                       and teco.StatusIsActive     = 'X'

{
  key A.ManufacturingOrder
}
where
      A.StatusCode            = 'I0002' // REL
  and A.StatusIsActive        = 'X'  and A.StatusIsInactive  <> 'X'
  and teco.ManufacturingOrder is null

group by
  A.ManufacturingOrder
