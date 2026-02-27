@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Quality approval  data'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.usageType:{
    serviceQuality: #X,
    sizeCategory: #S,
    dataClass: #MIXED
}
define view entity ZQualityapproval_data
  as select from    I_ManufacturingOrder          as a
    inner join      ZOrderStatus                  as ost on ost.ManufacturingOrder = a.ManufacturingOrder
    left outer join I_ProductDescription_2        as mat on  mat.Product  = a.Product
                                                         and mat.Language = 'E'
    left outer join I_ManufacturingOrderOperation as op  on op.ManufacturingOrder = a.ManufacturingOrder
    left outer join zqualityapp_tab               as tab on  tab.productionorder = a.ManufacturingOrder
                                                         and tab.orderoperation  = op.ManufacturingOrderOperation_2
                                                         
                                                         
  // left outer join ZPROD_MIN_UNCONF     as un   on ( un.ManufacturingOrder  = op.ManufacturingOrder  and un.MinOperation  = op.ManufacturingOrderOperation_2   )                                                   
                                                         

{
  key a.ManufacturingOrder             as ProductionOrder,
  key a.SalesOrder,
  key a.SalesOrderItem,
      a.Product                        as Product,
      mat.ProductDescription,
      a.Batch                          as LotNo,

      op.ManufacturingOrderOperation_2 as OrderOperation,
      op.MfgOrderOperationText         as OperationText,
      tab.status                       as tab_status,
      case when tab.status is null
      then 'Pending' else
      tab.status end                   as Status,
      tab.remark                       as Remark,
      tab.postingdate                       as PostingDate



}
where
      a.IsMarkedForDeletion      <> 'X'
  //  and a.MfgOrderActualCompletionDate is initial
  and op.OperationControlProfile =  'QM01'  and ost.ManufacturingOrder is not null  //and un.MinOperation  is not null
