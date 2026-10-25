@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Projection for booking'
@Metadata.ignorePropagatedAnnotations: false
@VDM.viewType: #CONSUMPTION
define view entity ZI_PAN_BOOKING_PROCESSOR
  as projection on ZI_PAN_BOOKING
{
  key TravelId,
  key BookingId,
      BookingDate,
      CustomerId,
      CarrierId,
      ConnectionId,
      FlightDate,
      FlightPrice,
      CurrencyCode,
      BookingStatus,
      LastChangedAt,
      /* Associations */
      _BookingSupp : redirected to composition child ZI_PAN_BOOKSUPP_PROCESSOR,
      _bookStat,
      _carr,
      _conn,
      _cust,
      _travel : redirected to parent ZR_PAN_TRAVEL_PROCESSOR
}
