// NOTE: This file was generated by the ServiceGenerator.

// ----------------------------------------------------------------------------
// API:
//   Ad Exchange Buyer API II (adexchangebuyer2/v2beta1)
// Description:
//   Accesses the latest features for managing Ad Exchange accounts, Real-Time
//   Bidding configurations and auction metrics, and Marketplace programmatic
//   deals.
// Documentation:
//   https://developers.google.com/ad-exchange/buyer-rest/reference/rest/

#import "GTLRAdExchangeBuyerII.h"

// ----------------------------------------------------------------------------
// Authorization scope

NSString * const kGTLRAuthScopeAdExchangeBuyerIIAdexchangeBuyer = @"https://www.googleapis.com/auth/adexchange.buyer";

// ----------------------------------------------------------------------------
//   GTLRAdExchangeBuyerIIService
//

@implementation GTLRAdExchangeBuyerIIService

- (instancetype)init {
  self = [super init];
  if (self) {
    // From discovery.
    self.rootURLString = @"https://adexchangebuyer.googleapis.com/";
    self.batchPath = @"batch";
    self.prettyPrintQueryParameterNames = @[ @"prettyPrint", @"pp" ];
  }
  return self;
}

@end