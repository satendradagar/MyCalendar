// NOTE: This file was generated by the ServiceGenerator.

// ----------------------------------------------------------------------------
// API:
//   TaskQueue API (taskqueue/v1beta2)
// Description:
//   Accesses a Google App Engine Pull Task Queue over REST.
// Documentation:
//   https://developers.google.com/appengine/docs/python/taskqueue/rest

#import "GTLRTaskqueueObjects.h"

// ----------------------------------------------------------------------------
//
//   GTLRTaskqueue_Task
//

@implementation GTLRTaskqueue_Task
@dynamic enqueueTimestamp, identifier, kind, leaseTimestamp, payloadBase64,
         queueName, retryCount, tag;

+ (NSDictionary<NSString *, NSString *> *)propertyToJSONKeyMap {
  NSDictionary<NSString *, NSString *> *map = @{
    @"identifier" : @"id",
    @"retryCount" : @"retry_count"
  };
  return map;
}

@end


// ----------------------------------------------------------------------------
//
//   GTLRTaskqueue_TaskQueue
//

@implementation GTLRTaskqueue_TaskQueue
@dynamic acl, identifier, kind, maxLeases, stats;

+ (NSDictionary<NSString *, NSString *> *)propertyToJSONKeyMap {
  return @{ @"identifier" : @"id" };
}

@end


// ----------------------------------------------------------------------------
//
//   GTLRTaskqueue_TaskQueue_Acl
//

@implementation GTLRTaskqueue_TaskQueue_Acl
@dynamic adminEmails, consumerEmails, producerEmails;

+ (NSDictionary<NSString *, Class> *)arrayPropertyToClassMap {
  NSDictionary<NSString *, Class> *map = @{
    @"adminEmails" : [NSString class],
    @"consumerEmails" : [NSString class],
    @"producerEmails" : [NSString class]
  };
  return map;
}

@end


// ----------------------------------------------------------------------------
//
//   GTLRTaskqueue_TaskQueue_Stats
//

@implementation GTLRTaskqueue_TaskQueue_Stats
@dynamic leasedLastHour, leasedLastMinute, oldestTask, totalTasks;
@end


// ----------------------------------------------------------------------------
//
//   GTLRTaskqueue_Tasks
//

@implementation GTLRTaskqueue_Tasks
@dynamic items, kind;

+ (NSDictionary<NSString *, Class> *)arrayPropertyToClassMap {
  NSDictionary<NSString *, Class> *map = @{
    @"items" : [GTLRTaskqueue_Task class]
  };
  return map;
}

@end


// ----------------------------------------------------------------------------
//
//   GTLRTaskqueue_Tasks2
//

@implementation GTLRTaskqueue_Tasks2
@dynamic items, kind;

+ (NSDictionary<NSString *, Class> *)arrayPropertyToClassMap {
  NSDictionary<NSString *, Class> *map = @{
    @"items" : [GTLRTaskqueue_Task class]
  };
  return map;
}

@end
