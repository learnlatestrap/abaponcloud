@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Second child entity - Booking Supplements'
@Metadata.ignorePropagatedAnnotations: true
define view entity ZI_PAN_BOOKSUPP
  as select from /dmo/booksuppl_m
  association        to parent ZI_PAN_BOOKING      as _booking    on  $projection.TravelId  = _booking.TravelId
                                                                  and $projection.BookingId = _booking.BookingId
  association of one to one ZR_PAN_TRAVEL          as _travel     on  $projection.TravelId = _travel.TravelId
  association of one to one /DMO/I_Supplement      as _supplement on  $projection.BookingSupplementId = _supplement.SupplementID
  association of one to many /DMO/I_SupplementText as _SupText    on  $projection.SupplementId = _SupText.SupplementID
{
  key /dmo/booksuppl_m.travel_id             as TravelId,
  key /dmo/booksuppl_m.booking_id            as BookingId,
  key /dmo/booksuppl_m.booking_supplement_id as BookingSupplementId,
      /dmo/booksuppl_m.supplement_id         as SupplementId,
      @Semantics.amount.currencyCode: 'CurrencyCode'
      /dmo/booksuppl_m.price                 as Price,
      /dmo/booksuppl_m.currency_code         as CurrencyCode,
      /dmo/booksuppl_m.last_changed_at       as LastChangedAt,

      // Make association public
      _booking,
      _travel,
      _supplement,
      _SupText
}
