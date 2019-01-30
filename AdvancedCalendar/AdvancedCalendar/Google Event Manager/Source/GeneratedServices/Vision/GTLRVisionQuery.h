// NOTE: This file was generated by the ServiceGenerator.

// ----------------------------------------------------------------------------
// API:
//   Google Cloud Vision API (vision/v1)
// Description:
//   Integrates Google Vision features, including image labeling, face, logo,
//   and landmark detection, optical character recognition (OCR), and detection
//   of explicit content, into applications.
// Documentation:
//   https://cloud.google.com/vision/

#if GTLR_BUILT_AS_FRAMEWORK
  #import "GTLR/GTLRQuery.h"
#else
  #import "GTLRQuery.h"
#endif

#if GTLR_RUNTIME_VERSION != 3000
#error This file was generated by a different version of ServiceGenerator which is incompatible with this GTLR library source.
#endif

@class GTLRVision_BatchAnnotateImagesRequest;
@class GTLRVision_CancelOperationRequest;

// Generated comments include content from the discovery document; avoid them
// causing warnings since clang's checks are some what arbitrary.
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wdocumentation"

NS_ASSUME_NONNULL_BEGIN

/**
 *  Parent class for other Vision query classes.
 */
@interface GTLRVisionQuery : GTLRQuery

/** Selector specifying which fields to include in a partial response. */
@property(nonatomic, copy, nullable) NSString *fields;

@end

/**
 *  Run image detection and annotation for a batch of images.
 *
 *  Method: vision.images.annotate
 *
 *  Authorization scope(s):
 *    @c kGTLRAuthScopeVisionCloudPlatform
 *    @c kGTLRAuthScopeVisionCloudVision
 */
@interface GTLRVisionQuery_ImagesAnnotate : GTLRVisionQuery
// Previous library name was
//   +[GTLQueryVision queryForImagesAnnotateWithObject:]

/**
 *  Fetches a @c GTLRVision_BatchAnnotateImagesResponse.
 *
 *  Run image detection and annotation for a batch of images.
 *
 *  @param object The @c GTLRVision_BatchAnnotateImagesRequest to include in the
 *    query.
 *
 *  @returns GTLRVisionQuery_ImagesAnnotate
 */
+ (instancetype)queryWithObject:(GTLRVision_BatchAnnotateImagesRequest *)object;

@end

/**
 *  Starts asynchronous cancellation on a long-running operation. The server
 *  makes a best effort to cancel the operation, but success is not
 *  guaranteed. If the server doesn't support this method, it returns
 *  `google.rpc.Code.UNIMPLEMENTED`. Clients can use
 *  Operations.GetOperation or
 *  other methods to check whether the cancellation succeeded or whether the
 *  operation completed despite cancellation. On successful cancellation,
 *  the operation is not deleted; instead, it becomes an operation with
 *  an Operation.error value with a google.rpc.Status.code of 1,
 *  corresponding to `Code.CANCELLED`.
 *
 *  Method: vision.operations.cancel
 *
 *  Authorization scope(s):
 *    @c kGTLRAuthScopeVisionCloudPlatform
 *    @c kGTLRAuthScopeVisionCloudVision
 */
@interface GTLRVisionQuery_OperationsCancel : GTLRVisionQuery
// Previous library name was
//   +[GTLQueryVision queryForOperationsCancelWithObject:name:]

/** The name of the operation resource to be cancelled. */
@property(nonatomic, copy, nullable) NSString *name;

/**
 *  Fetches a @c GTLRVision_Empty.
 *
 *  Starts asynchronous cancellation on a long-running operation. The server
 *  makes a best effort to cancel the operation, but success is not
 *  guaranteed. If the server doesn't support this method, it returns
 *  `google.rpc.Code.UNIMPLEMENTED`. Clients can use
 *  Operations.GetOperation or
 *  other methods to check whether the cancellation succeeded or whether the
 *  operation completed despite cancellation. On successful cancellation,
 *  the operation is not deleted; instead, it becomes an operation with
 *  an Operation.error value with a google.rpc.Status.code of 1,
 *  corresponding to `Code.CANCELLED`.
 *
 *  @param object The @c GTLRVision_CancelOperationRequest to include in the
 *    query.
 *  @param name The name of the operation resource to be cancelled.
 *
 *  @returns GTLRVisionQuery_OperationsCancel
 */
+ (instancetype)queryWithObject:(GTLRVision_CancelOperationRequest *)object
                           name:(NSString *)name;

@end

/**
 *  Deletes a long-running operation. This method indicates that the client is
 *  no longer interested in the operation result. It does not cancel the
 *  operation. If the server doesn't support this method, it returns
 *  `google.rpc.Code.UNIMPLEMENTED`.
 *
 *  Method: vision.operations.delete
 *
 *  Authorization scope(s):
 *    @c kGTLRAuthScopeVisionCloudPlatform
 *    @c kGTLRAuthScopeVisionCloudVision
 */
@interface GTLRVisionQuery_OperationsDelete : GTLRVisionQuery
// Previous library name was
//   +[GTLQueryVision queryForOperationsDeleteWithname:]

/** The name of the operation resource to be deleted. */
@property(nonatomic, copy, nullable) NSString *name;

/**
 *  Fetches a @c GTLRVision_Empty.
 *
 *  Deletes a long-running operation. This method indicates that the client is
 *  no longer interested in the operation result. It does not cancel the
 *  operation. If the server doesn't support this method, it returns
 *  `google.rpc.Code.UNIMPLEMENTED`.
 *
 *  @param name The name of the operation resource to be deleted.
 *
 *  @returns GTLRVisionQuery_OperationsDelete
 */
+ (instancetype)queryWithName:(NSString *)name;

@end

/**
 *  Gets the latest state of a long-running operation. Clients can use this
 *  method to poll the operation result at intervals as recommended by the API
 *  service.
 *
 *  Method: vision.operations.get
 *
 *  Authorization scope(s):
 *    @c kGTLRAuthScopeVisionCloudPlatform
 *    @c kGTLRAuthScopeVisionCloudVision
 */
@interface GTLRVisionQuery_OperationsGet : GTLRVisionQuery
// Previous library name was
//   +[GTLQueryVision queryForOperationsGetWithname:]

/** The name of the operation resource. */
@property(nonatomic, copy, nullable) NSString *name;

/**
 *  Fetches a @c GTLRVision_Operation.
 *
 *  Gets the latest state of a long-running operation. Clients can use this
 *  method to poll the operation result at intervals as recommended by the API
 *  service.
 *
 *  @param name The name of the operation resource.
 *
 *  @returns GTLRVisionQuery_OperationsGet
 */
+ (instancetype)queryWithName:(NSString *)name;

@end

/**
 *  Lists operations that match the specified filter in the request. If the
 *  server doesn't support this method, it returns `UNIMPLEMENTED`.
 *  NOTE: the `name` binding allows API services to override the binding
 *  to use different resource name schemes, such as `users/ * /operations`. To
 *  override the binding, API services can add a binding such as
 *  `"/v1/{name=users/ *}/operations"` to their service configuration.
 *  For backwards compatibility, the default name includes the operations
 *  collection id, however overriding users must ensure the name binding
 *  is the parent resource, without the operations collection id.
 *
 *  Method: vision.operations.list
 *
 *  Authorization scope(s):
 *    @c kGTLRAuthScopeVisionCloudPlatform
 *    @c kGTLRAuthScopeVisionCloudVision
 */
@interface GTLRVisionQuery_OperationsList : GTLRVisionQuery
// Previous library name was
//   +[GTLQueryVision queryForOperationsListWithname:]

/** The standard list filter. */
@property(nonatomic, copy, nullable) NSString *filter;

/** The name of the operation's parent resource. */
@property(nonatomic, copy, nullable) NSString *name;

/** The standard list page size. */
@property(nonatomic, assign) NSInteger pageSize;

/** The standard list page token. */
@property(nonatomic, copy, nullable) NSString *pageToken;

/**
 *  Fetches a @c GTLRVision_ListOperationsResponse.
 *
 *  Lists operations that match the specified filter in the request. If the
 *  server doesn't support this method, it returns `UNIMPLEMENTED`.
 *  NOTE: the `name` binding allows API services to override the binding
 *  to use different resource name schemes, such as `users/ * /operations`. To
 *  override the binding, API services can add a binding such as
 *  `"/v1/{name=users/ *}/operations"` to their service configuration.
 *  For backwards compatibility, the default name includes the operations
 *  collection id, however overriding users must ensure the name binding
 *  is the parent resource, without the operations collection id.
 *
 *  @param name The name of the operation's parent resource.
 *
 *  @returns GTLRVisionQuery_OperationsList
 *
 *  @note Automatic pagination will be done when @c shouldFetchNextPages is
 *        enabled. See @c shouldFetchNextPages on @c GTLRService for more
 *        information.
 */
+ (instancetype)queryWithName:(NSString *)name;

@end

NS_ASSUME_NONNULL_END

#pragma clang diagnostic pop
