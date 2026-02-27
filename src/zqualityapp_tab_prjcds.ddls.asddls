@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'ZQUALITYAPP_TAB_PRJCDS'
@Metadata.ignorePropagatedAnnotations: true
define root view entity ZQUALITYAPP_TAB_PRJCDS
  as projection on ZQUALITYAPP_TAB_CDS
{
  key Productionorder,
  key Orderoperation,
      Salesorder,
      Salesorderitem,
      Lotnumber,
      Material,
      Materialdes,
      Status, 
      Remark, 
      Postingdate,
      Creationdate,
      Creationtime,
      Creationuser
}
