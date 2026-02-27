@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'ZQUALITYAPPROVAL_CUBE'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.usageType:{
    serviceQuality: #X,
    sizeCategory: #S,
    dataClass: #MIXED
}
define view entity ZQUALITYAPPROVAL_CUBE
  as select from ZQualityapproval_data as A
{
  key A.ProductionOrder,
  key A.SalesOrder,
  key A.SalesOrderItem,
      A.Product,
      A.ProductDescription,
      A.LotNo,
      A.Status as Status,
      A.OrderOperation,
      A.OperationText,
      A.Remark,
      A.PostingDate
}
