@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Projection for supplements'
@Metadata.ignorePropagatedAnnotations: false
define view entity ZI_PAN_BOOKSUPP_PROCESSOR as projection on ZI_PAN_BOOKSUPP
{
    key TravelId,
    key BookingId,
    key BookingSupplementId,
    SupplementId,
    Price,
    CurrencyCode,
    LastChangedAt,
    /* Associations */
    _booking : redirected to parent ZI_PAN_BOOKING_PROCESSOR,
    _supplement,
    _SupText,
    _travel : redirected to ZR_PAN_TRAVEL_PROCESSOR
}
