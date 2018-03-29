// NOTE: This file was generated by the ServiceGenerator.

// ----------------------------------------------------------------------------
// API:
//   Cloud Video Intelligence API (videointelligence/v1beta1)
// Description:
//   Cloud Video Intelligence API.
// Documentation:
//   https://cloud.google.com/video-intelligence/docs/

#if GTLR_BUILT_AS_FRAMEWORK
  #import "GTLR/GTLRQuery.h"
#else
  #import "GTLRQuery.h"
#endif

#if GTLR_RUNTIME_VERSION != 3000
#error This file was generated by a different version of ServiceGenerator which is incompatible with this GTLR library source.
#endif

@class GTLRCloudVideoIntelligence_GoogleCloudVideointelligenceV1beta1AnnotateVideoRequest;

// Generated comments include content from the discovery document; avoid them
// causing warnings since clang's checks are some what arbitrary.
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wdocumentation"

NS_ASSUME_NONNULL_BEGIN

/**
 *  Parent class for other Cloud Video Intelligence query classes.
 */
@interface GTLRCloudVideoIntelligenceQuery : GTLRQuery

/** Selector specifying which fields to include in a partial response. */
@property(nonatomic, copy, nullable) NSString *fields;

@end

/**
 *  Performs asynchronous video annotation. Progress and results can be
 *  retrieved through the `google.longrunning.Operations` interface.
 *  `Operation.metadata` contains `AnnotateVideoProgress` (progress).
 *  `Operation.response` contains `AnnotateVideoResponse` (results).
 *
 *  Method: videointelligence.videos.annotate
 *
 *  Authorization scope(s):
 *    @c kGTLRAuthScopeCloudVideoIntelligenceCloudPlatform
 */
@interface GTLRCloudVideoIntelligenceQuery_VideosAnnotate : GTLRCloudVideoIntelligenceQuery
// Previous library name was
//   +[GTLQueryCloudVideoIntelligence queryForVideosAnnotateWithObject:]

/**
 *  Fetches a @c GTLRCloudVideoIntelligence_GoogleLongrunningOperation.
 *
 *  Performs asynchronous video annotation. Progress and results can be
 *  retrieved through the `google.longrunning.Operations` interface.
 *  `Operation.metadata` contains `AnnotateVideoProgress` (progress).
 *  `Operation.response` contains `AnnotateVideoResponse` (results).
 *
 *  @param object The @c
 *    GTLRCloudVideoIntelligence_GoogleCloudVideointelligenceV1beta1AnnotateVideoRequest
 *    to include in the query.
 *
 *  @returns GTLRCloudVideoIntelligenceQuery_VideosAnnotate
 */
+ (instancetype)queryWithObject:(GTLRCloudVideoIntelligence_GoogleCloudVideointelligenceV1beta1AnnotateVideoRequest *)object;

@end

NS_ASSUME_NONNULL_END

#pragma clang diagnostic pop