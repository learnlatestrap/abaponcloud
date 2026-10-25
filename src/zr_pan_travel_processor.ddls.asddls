@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Projection for root travel entity'
@Metadata.ignorePropagatedAnnotations: false
@VDM.viewType: #CONSUMPTION
@Metadata.allowExtensions: true
define root view entity ZR_PAN_TRAVEL_PROCESSOR
  as projection on ZR_PAN_TRAVEL
{
  key TravelId,
      AgencyId,
      AgencyName,
      CustomerId,
      CustomerName,
      BeginDate,
      EndDate,
      BookingFee,
      TotalPrice,
      CurrencyCode,
      Description,
      OverallStatus,
      OverallStatusText,
      Minion,
      CreatedBy,
      CreatedAt,
      LastChangedBy,
      LastChangedAt,     
      
      /* Associations */
      _agency,
      _booking : redirected to composition child ZI_PAN_BOOKING_PROCESSOR,
      _currency,
      _customer,
      _overallStatus
}
