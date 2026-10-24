@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Booking CDS first child'
@Metadata.ignorePropagatedAnnotations: true
@VDM.viewType: #COMPOSITE
define view entity ZI_PAN_BOOKING
  as select from /dmo/booking_m
  association of one to one /DMO/I_Customer          as _cust     on  $projection.CustomerId = _cust.CustomerID
  association of one to one /DMO/I_Carrier           as _carr     on  $projection.CarrierId = _carr.AirlineID
  association of one to one /DMO/I_Connection        as _conn     on  $projection.CarrierId    = _conn.AirlineID
                                                                  and $projection.ConnectionId = _conn.ConnectionID
  association of one to one /DMO/I_Booking_Status_VH as _bookStat on  $projection.BookingStatus = _bookStat.BookingStatus

  //Association to Parent
  association        to parent ZR_PAN_TRAVEL         as _travel   on  $projection.TravelId = _travel.TravelId
  composition[0..*] of ZI_PAN_BOOKSUPP as _BookingSupp
{
  key travel_id       as TravelId,
  key booking_id      as BookingId,
      booking_date    as BookingDate,
      customer_id     as CustomerId,
      carrier_id      as CarrierId,
      connection_id   as ConnectionId,
      flight_date     as FlightDate,
      @Semantics.amount.currencyCode: 'CurrencyCode'
      flight_price    as FlightPrice,
      currency_code   as CurrencyCode,
      booking_status  as BookingStatus,
      @Semantics.systemDateTime.lastChangedAt: true
      last_changed_at as LastChangedAt,

      //Expose Association
      _cust,
      _carr,
      _conn,
      _bookStat,
      _travel,
      _BookingSupp


}
