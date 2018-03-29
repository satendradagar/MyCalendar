// NOTE: This file was generated by the ServiceGenerator.

// ----------------------------------------------------------------------------
// API:
//   Fitness (fitness/v1)
// Description:
//   Stores and accesses user data in the fitness store from apps on any
//   platform.
// Documentation:
//   https://developers.google.com/fit/rest/

#if GTLR_BUILT_AS_FRAMEWORK
  #import "GTLR/GTLRService.h"
#else
  #import "GTLRService.h"
#endif

#if GTLR_RUNTIME_VERSION != 3000
#error This file was generated by a different version of ServiceGenerator which is incompatible with this GTLR library source.
#endif

// Generated comments include content from the discovery document; avoid them
// causing warnings since clang's checks are some what arbitrary.
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wdocumentation"

NS_ASSUME_NONNULL_BEGIN

// ----------------------------------------------------------------------------
// Authorization scopes

/**
 *  Authorization scope: View your activity information in Google Fit
 *
 *  Value "https://www.googleapis.com/auth/fitness.activity.read"
 */
GTLR_EXTERN NSString * const kGTLRAuthScopeFitnessActivityRead;
/**
 *  Authorization scope: View and store your activity information in Google Fit
 *
 *  Value "https://www.googleapis.com/auth/fitness.activity.write"
 */
GTLR_EXTERN NSString * const kGTLRAuthScopeFitnessActivityWrite;
/**
 *  Authorization scope: View blood glucose data in Google Fit
 *
 *  Value "https://www.googleapis.com/auth/fitness.blood_glucose.read"
 */
GTLR_EXTERN NSString * const kGTLRAuthScopeFitnessBloodGlucoseRead;
/**
 *  Authorization scope: View and store blood glucose data in Google Fit
 *
 *  Value "https://www.googleapis.com/auth/fitness.blood_glucose.write"
 */
GTLR_EXTERN NSString * const kGTLRAuthScopeFitnessBloodGlucoseWrite;
/**
 *  Authorization scope: View blood pressure data in Google Fit
 *
 *  Value "https://www.googleapis.com/auth/fitness.blood_pressure.read"
 */
GTLR_EXTERN NSString * const kGTLRAuthScopeFitnessBloodPressureRead;
/**
 *  Authorization scope: View and store blood pressure data in Google Fit
 *
 *  Value "https://www.googleapis.com/auth/fitness.blood_pressure.write"
 */
GTLR_EXTERN NSString * const kGTLRAuthScopeFitnessBloodPressureWrite;
/**
 *  Authorization scope: View body sensor information in Google Fit
 *
 *  Value "https://www.googleapis.com/auth/fitness.body.read"
 */
GTLR_EXTERN NSString * const kGTLRAuthScopeFitnessBodyRead;
/**
 *  Authorization scope: View body temperature data in Google Fit
 *
 *  Value "https://www.googleapis.com/auth/fitness.body_temperature.read"
 */
GTLR_EXTERN NSString * const kGTLRAuthScopeFitnessBodyTemperatureRead;
/**
 *  Authorization scope: View and store body temperature data in Google Fit
 *
 *  Value "https://www.googleapis.com/auth/fitness.body_temperature.write"
 */
GTLR_EXTERN NSString * const kGTLRAuthScopeFitnessBodyTemperatureWrite;
/**
 *  Authorization scope: View and store body sensor data in Google Fit
 *
 *  Value "https://www.googleapis.com/auth/fitness.body.write"
 */
GTLR_EXTERN NSString * const kGTLRAuthScopeFitnessBodyWrite;
/**
 *  Authorization scope: View your stored location data in Google Fit
 *
 *  Value "https://www.googleapis.com/auth/fitness.location.read"
 */
GTLR_EXTERN NSString * const kGTLRAuthScopeFitnessLocationRead;
/**
 *  Authorization scope: View and store your location data in Google Fit
 *
 *  Value "https://www.googleapis.com/auth/fitness.location.write"
 */
GTLR_EXTERN NSString * const kGTLRAuthScopeFitnessLocationWrite;
/**
 *  Authorization scope: View nutrition information in Google Fit
 *
 *  Value "https://www.googleapis.com/auth/fitness.nutrition.read"
 */
GTLR_EXTERN NSString * const kGTLRAuthScopeFitnessNutritionRead;
/**
 *  Authorization scope: View and store nutrition information in Google Fit
 *
 *  Value "https://www.googleapis.com/auth/fitness.nutrition.write"
 */
GTLR_EXTERN NSString * const kGTLRAuthScopeFitnessNutritionWrite;
/**
 *  Authorization scope: View oxygen saturation data in Google Fit
 *
 *  Value "https://www.googleapis.com/auth/fitness.oxygen_saturation.read"
 */
GTLR_EXTERN NSString * const kGTLRAuthScopeFitnessOxygenSaturationRead;
/**
 *  Authorization scope: View and store oxygen saturation data in Google Fit
 *
 *  Value "https://www.googleapis.com/auth/fitness.oxygen_saturation.write"
 */
GTLR_EXTERN NSString * const kGTLRAuthScopeFitnessOxygenSaturationWrite;
/**
 *  Authorization scope: View reproductive health data in Google Fit
 *
 *  Value "https://www.googleapis.com/auth/fitness.reproductive_health.read"
 */
GTLR_EXTERN NSString * const kGTLRAuthScopeFitnessReproductiveHealthRead;
/**
 *  Authorization scope: View and store reproductive health data in Google Fit
 *
 *  Value "https://www.googleapis.com/auth/fitness.reproductive_health.write"
 */
GTLR_EXTERN NSString * const kGTLRAuthScopeFitnessReproductiveHealthWrite;

// ----------------------------------------------------------------------------
//   GTLRFitnessService
//

/**
 *  Service for executing Fitness queries.
 *
 *  Stores and accesses user data in the fitness store from apps on any
 *  platform.
 */
@interface GTLRFitnessService : GTLRService

// No new methods

// Clients should create a standard query with any of the class methods in
// GTLRFitnessQuery.h. The query can the be sent with GTLRService's execute
// methods,
//
//   - (GTLRServiceTicket *)executeQuery:(GTLRQuery *)query
//                     completionHandler:(void (^)(GTLRServiceTicket *ticket,
//                                                 id object, NSError *error))handler;
// or
//   - (GTLRServiceTicket *)executeQuery:(GTLRQuery *)query
//                              delegate:(id)delegate
//                     didFinishSelector:(SEL)finishedSelector;
//
// where finishedSelector has a signature of:
//
//   - (void)serviceTicket:(GTLRServiceTicket *)ticket
//      finishedWithObject:(id)object
//                   error:(NSError *)error;
//
// The object passed to the completion handler or delegate method
// is a subclass of GTLRObject, determined by the query method executed.

@end

NS_ASSUME_NONNULL_END

#pragma clang diagnostic pop
