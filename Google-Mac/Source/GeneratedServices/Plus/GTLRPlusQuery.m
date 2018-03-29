// NOTE: This file was generated by the ServiceGenerator.

// ----------------------------------------------------------------------------
// API:
//   Google+ API (plus/v1)
// Description:
//   Builds on top of the Google+ platform.
// Documentation:
//   https://developers.google.com/+/api/

#import "GTLRPlusQuery.h"

#import "GTLRPlusObjects.h"

// ----------------------------------------------------------------------------
// Constants

// collection
NSString * const kGTLRPlusCollectionConnected = @"connected";
NSString * const kGTLRPlusCollectionPlusoners = @"plusoners";
NSString * const kGTLRPlusCollectionPublic    = @"public";
NSString * const kGTLRPlusCollectionResharers = @"resharers";
NSString * const kGTLRPlusCollectionVisible   = @"visible";

// orderBy
NSString * const kGTLRPlusOrderByAlphabetical = @"alphabetical";
NSString * const kGTLRPlusOrderByBest         = @"best";
NSString * const kGTLRPlusOrderByRecent       = @"recent";

// sortOrder
NSString * const kGTLRPlusSortOrderAscending  = @"ascending";
NSString * const kGTLRPlusSortOrderDescending = @"descending";

// ----------------------------------------------------------------------------
// Query Classes
//

@implementation GTLRPlusQuery

@dynamic fields;

@end

@implementation GTLRPlusQuery_ActivitiesGet

@dynamic activityId;

+ (instancetype)queryWithActivityId:(NSString *)activityId {
  NSArray *pathParams = @[ @"activityId" ];
  NSString *pathURITemplate = @"activities/{activityId}";
  GTLRPlusQuery_ActivitiesGet *query =
    [[self alloc] initWithPathURITemplate:pathURITemplate
                               HTTPMethod:nil
                       pathParameterNames:pathParams];
  query.activityId = activityId;
  query.expectedObjectClass = [GTLRPlus_Activity class];
  query.loggingName = @"plus.activities.get";
  return query;
}

@end

@implementation GTLRPlusQuery_ActivitiesList

@dynamic collection, maxResults, pageToken, userId;

+ (instancetype)queryWithUserId:(NSString *)userId
                     collection:(NSString *)collection {
  NSArray *pathParams = @[
    @"collection", @"userId"
  ];
  NSString *pathURITemplate = @"people/{userId}/activities/{collection}";
  GTLRPlusQuery_ActivitiesList *query =
    [[self alloc] initWithPathURITemplate:pathURITemplate
                               HTTPMethod:nil
                       pathParameterNames:pathParams];
  query.userId = userId;
  query.collection = collection;
  query.expectedObjectClass = [GTLRPlus_ActivityFeed class];
  query.loggingName = @"plus.activities.list";
  return query;
}

@end

@implementation GTLRPlusQuery_ActivitiesSearch

@dynamic language, maxResults, orderBy, pageToken, query;

+ (instancetype)queryWithQuery:(NSString *)query_param {
  NSString *pathURITemplate = @"activities";
  GTLRPlusQuery_ActivitiesSearch *query =
    [[self alloc] initWithPathURITemplate:pathURITemplate
                               HTTPMethod:nil
                       pathParameterNames:nil];
  query.query = query_param;
  query.expectedObjectClass = [GTLRPlus_ActivityFeed class];
  query.loggingName = @"plus.activities.search";
  return query;
}

@end

@implementation GTLRPlusQuery_CommentsGet

@dynamic commentId;

+ (instancetype)queryWithCommentId:(NSString *)commentId {
  NSArray *pathParams = @[ @"commentId" ];
  NSString *pathURITemplate = @"comments/{commentId}";
  GTLRPlusQuery_CommentsGet *query =
    [[self alloc] initWithPathURITemplate:pathURITemplate
                               HTTPMethod:nil
                       pathParameterNames:pathParams];
  query.commentId = commentId;
  query.expectedObjectClass = [GTLRPlus_Comment class];
  query.loggingName = @"plus.comments.get";
  return query;
}

@end

@implementation GTLRPlusQuery_CommentsList

@dynamic activityId, maxResults, pageToken, sortOrder;

+ (instancetype)queryWithActivityId:(NSString *)activityId {
  NSArray *pathParams = @[ @"activityId" ];
  NSString *pathURITemplate = @"activities/{activityId}/comments";
  GTLRPlusQuery_CommentsList *query =
    [[self alloc] initWithPathURITemplate:pathURITemplate
                               HTTPMethod:nil
                       pathParameterNames:pathParams];
  query.activityId = activityId;
  query.expectedObjectClass = [GTLRPlus_CommentFeed class];
  query.loggingName = @"plus.comments.list";
  return query;
}

@end

@implementation GTLRPlusQuery_PeopleGet

@dynamic userId;

+ (instancetype)queryWithUserId:(NSString *)userId {
  NSArray *pathParams = @[ @"userId" ];
  NSString *pathURITemplate = @"people/{userId}";
  GTLRPlusQuery_PeopleGet *query =
    [[self alloc] initWithPathURITemplate:pathURITemplate
                               HTTPMethod:nil
                       pathParameterNames:pathParams];
  query.userId = userId;
  query.expectedObjectClass = [GTLRPlus_Person class];
  query.loggingName = @"plus.people.get";
  return query;
}

@end

@implementation GTLRPlusQuery_PeopleList

@dynamic collection, maxResults, orderBy, pageToken, userId;

+ (instancetype)queryWithUserId:(NSString *)userId
                     collection:(NSString *)collection {
  NSArray *pathParams = @[
    @"collection", @"userId"
  ];
  NSString *pathURITemplate = @"people/{userId}/people/{collection}";
  GTLRPlusQuery_PeopleList *query =
    [[self alloc] initWithPathURITemplate:pathURITemplate
                               HTTPMethod:nil
                       pathParameterNames:pathParams];
  query.userId = userId;
  query.collection = collection;
  query.expectedObjectClass = [GTLRPlus_PeopleFeed class];
  query.loggingName = @"plus.people.list";
  return query;
}

@end

@implementation GTLRPlusQuery_PeopleListByActivity

@dynamic activityId, collection, maxResults, pageToken;

+ (instancetype)queryWithActivityId:(NSString *)activityId
                         collection:(NSString *)collection {
  NSArray *pathParams = @[
    @"activityId", @"collection"
  ];
  NSString *pathURITemplate = @"activities/{activityId}/people/{collection}";
  GTLRPlusQuery_PeopleListByActivity *query =
    [[self alloc] initWithPathURITemplate:pathURITemplate
                               HTTPMethod:nil
                       pathParameterNames:pathParams];
  query.activityId = activityId;
  query.collection = collection;
  query.expectedObjectClass = [GTLRPlus_PeopleFeed class];
  query.loggingName = @"plus.people.listByActivity";
  return query;
}

@end

@implementation GTLRPlusQuery_PeopleSearch

@dynamic language, maxResults, pageToken, query;

+ (instancetype)queryWithQuery:(NSString *)query_param {
  NSString *pathURITemplate = @"people";
  GTLRPlusQuery_PeopleSearch *query =
    [[self alloc] initWithPathURITemplate:pathURITemplate
                               HTTPMethod:nil
                       pathParameterNames:nil];
  query.query = query_param;
  query.expectedObjectClass = [GTLRPlus_PeopleFeed class];
  query.loggingName = @"plus.people.search";
  return query;
}

@end
