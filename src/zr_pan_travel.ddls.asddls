@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Root CDS Entity'
@Metadata.ignorePropagatedAnnotations: true
@VDM.viewType: #COMPOSITE
define root view entity ZR_PAN_TRAVEL
  as select from /dmo/travel_m
  association of one to one /DMO/I_Agency            as _agency        on $projection.AgencyId = _agency.AgencyID
  association of one to one /DMO/I_Customer          as _customer      on $projection.CustomerId = _customer.CustomerID
  association of one to one I_Currency               as _currency      on $projection.CurrencyCode = _currency.Currency
  association of one to one /DMO/I_Overall_Status_VH as _overallStatus on $projection.OverallStatus = _overallStatus.OverallStatus
  composition [0..*] of ZI_PAN_BOOKING               as _booking //No bookings or multiple bookings
{
      @ObjectModel.text.element: [ 'Description' ]
  key travel_id                                                        as TravelId,
      @ObjectModel.text.element: [ 'AgencyName' ]
      agency_id                                                        as AgencyId,
      _agency.Name                                                     as AgencyName,
      @ObjectModel.text.element: [ 'CustomerName' ]
      customer_id                                                      as CustomerId,
      concat (concat ( _customer.FirstName, ' ' ), _customer.LastName) as CustomerName,
      begin_date                                                       as BeginDate,
      end_date                                                         as EndDate,
      @Semantics.amount.currencyCode: 'CurrencyCode'
      booking_fee                                                      as BookingFee,
      @Semantics.amount.currencyCode: 'CurrencyCode'
      total_price                                                      as TotalPrice,
      currency_code                                                    as CurrencyCode,
      description                                                      as Description,
      @ObjectModel.text.element: [ 'OverallStatusText' ]
      overall_status                                                   as OverallStatus,
      _overallStatus._Text[Language = $session.system_language].Text   as OverallStatusText,
      @Semantics.user.createdBy: true
      created_by                                                       as CreatedBy,
      @Semantics.systemDateTime.createdAt: true
      created_at                                                       as CreatedAt,
      @Semantics.user.lastChangedBy: true
      last_changed_by                                                  as LastChangedBy,
      @Semantics.systemDateTime.lastChangedAt: true
      // Last changed at will be treated as an ETAG
      last_changed_at                                                  as LastChangedAt,
      case overall_status
       when 'O' then '2'
       when 'A' then '3'
       when 'X' then '1'
       else '1'
      end                                                              as Minion,

      //Exposed Associations
      _agency,
      _customer,
      _currency,
      _overallStatus,
      _booking

}
