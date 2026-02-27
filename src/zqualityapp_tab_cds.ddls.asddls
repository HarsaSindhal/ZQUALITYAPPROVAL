@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'ZQUALITYAPP_TAB_CDS'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.usageType:{
    serviceQuality: #X,
    sizeCategory: #S,
    dataClass: #MIXED
}
define root view entity ZQUALITYAPP_TAB_CDS
  as select from zqualityapp_tab
{
  key productionorder as ProductionOrder,
  key orderoperation  as OrderOperation,
      salesorder      as SalesOrder,
      salesorderitem  as SalesOrderItem,
      lotnumber       as Lotnumber,
      material        as Material,
      materialdes     as Materialdes,
      status          as Status,
      statuscode      as StatusCode,
      remark          as Remark,
      postingdate     as PostingDate,
      creationdate    as Creationdate,
      creationtime    as Creationtime,
      creationuser    as Creationuser
}
