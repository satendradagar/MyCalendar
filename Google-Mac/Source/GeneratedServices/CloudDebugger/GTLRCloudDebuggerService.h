// NOTE: This file was generated by the ServiceGenerator.

// ----------------------------------------------------------------------------
// API:
//   Stackdriver Debugger API (clouddebugger/v2)
// Description:
//   Examines the call stack and variables of a running application without
//   stopping or slowing it down.
// Documentation:
//   http://cloud.google.com/debugger

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
 *  Authorization scope: Use Stackdriver Debugger
 *
 *  Value "https://www.googleapis.com/auth/cloud_debugger"
 */
GTLR_EXTERN NSString * const kGTLRAuthScopeCloudDebuggerCloudDebugger;
/**
 *  Authorization scope: View and manage your data across Google Cloud Platform
 *  services
 *
 *  Value "https://www.googleapis.com/auth/cloud-platform"
 */
GTLR_EXTERN NSString * const kGTLRAuthScopeCloudDebuggerCloudPlatform;

// ----------------------------------------------------------------------------
//   GTLRCloudDebuggerService
//

/**
 *  Service for executing Stackdriver Debugger API queries.
 *
 *  Examines the call stack and variables of a running application without
 *  stopping or slowing it down.
 */
@interface GTLRCloudDebuggerService : GTLRService

// No new methods

// Clients should create a standard query with any of the class methods in
// GTLRCloudDebuggerQuery.h. The query can the be sent with GTLRService's
// execute methods,
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
