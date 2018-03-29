// NOTE: This file was generated by the ServiceGenerator.

// ----------------------------------------------------------------------------
// API:
//   Stackdriver Monitoring API (monitoring/v3)
// Description:
//   Manages your Stackdriver Monitoring data and configurations. Most projects
//   must be associated with a Stackdriver account, with a few exceptions as
//   noted on the individual method pages.
// Documentation:
//   https://cloud.google.com/monitoring/api/

#import "GTLRMonitoringObjects.h"

// ----------------------------------------------------------------------------
// Constants

// GTLRMonitoring_Aggregation.crossSeriesReducer
NSString * const kGTLRMonitoring_Aggregation_CrossSeriesReducer_ReduceCount = @"REDUCE_COUNT";
NSString * const kGTLRMonitoring_Aggregation_CrossSeriesReducer_ReduceCountFalse = @"REDUCE_COUNT_FALSE";
NSString * const kGTLRMonitoring_Aggregation_CrossSeriesReducer_ReduceCountTrue = @"REDUCE_COUNT_TRUE";
NSString * const kGTLRMonitoring_Aggregation_CrossSeriesReducer_ReduceFractionTrue = @"REDUCE_FRACTION_TRUE";
NSString * const kGTLRMonitoring_Aggregation_CrossSeriesReducer_ReduceMax = @"REDUCE_MAX";
NSString * const kGTLRMonitoring_Aggregation_CrossSeriesReducer_ReduceMean = @"REDUCE_MEAN";
NSString * const kGTLRMonitoring_Aggregation_CrossSeriesReducer_ReduceMin = @"REDUCE_MIN";
NSString * const kGTLRMonitoring_Aggregation_CrossSeriesReducer_ReduceNone = @"REDUCE_NONE";
NSString * const kGTLRMonitoring_Aggregation_CrossSeriesReducer_ReducePercentile05 = @"REDUCE_PERCENTILE_05";
NSString * const kGTLRMonitoring_Aggregation_CrossSeriesReducer_ReducePercentile50 = @"REDUCE_PERCENTILE_50";
NSString * const kGTLRMonitoring_Aggregation_CrossSeriesReducer_ReducePercentile95 = @"REDUCE_PERCENTILE_95";
NSString * const kGTLRMonitoring_Aggregation_CrossSeriesReducer_ReducePercentile99 = @"REDUCE_PERCENTILE_99";
NSString * const kGTLRMonitoring_Aggregation_CrossSeriesReducer_ReduceStddev = @"REDUCE_STDDEV";
NSString * const kGTLRMonitoring_Aggregation_CrossSeriesReducer_ReduceSum = @"REDUCE_SUM";

// GTLRMonitoring_Aggregation.perSeriesAligner
NSString * const kGTLRMonitoring_Aggregation_PerSeriesAligner_AlignCount = @"ALIGN_COUNT";
NSString * const kGTLRMonitoring_Aggregation_PerSeriesAligner_AlignCountFalse = @"ALIGN_COUNT_FALSE";
NSString * const kGTLRMonitoring_Aggregation_PerSeriesAligner_AlignCountTrue = @"ALIGN_COUNT_TRUE";
NSString * const kGTLRMonitoring_Aggregation_PerSeriesAligner_AlignDelta = @"ALIGN_DELTA";
NSString * const kGTLRMonitoring_Aggregation_PerSeriesAligner_AlignFractionTrue = @"ALIGN_FRACTION_TRUE";
NSString * const kGTLRMonitoring_Aggregation_PerSeriesAligner_AlignInterpolate = @"ALIGN_INTERPOLATE";
NSString * const kGTLRMonitoring_Aggregation_PerSeriesAligner_AlignMax = @"ALIGN_MAX";
NSString * const kGTLRMonitoring_Aggregation_PerSeriesAligner_AlignMean = @"ALIGN_MEAN";
NSString * const kGTLRMonitoring_Aggregation_PerSeriesAligner_AlignMin = @"ALIGN_MIN";
NSString * const kGTLRMonitoring_Aggregation_PerSeriesAligner_AlignNextOlder = @"ALIGN_NEXT_OLDER";
NSString * const kGTLRMonitoring_Aggregation_PerSeriesAligner_AlignNone = @"ALIGN_NONE";
NSString * const kGTLRMonitoring_Aggregation_PerSeriesAligner_AlignPercentChange = @"ALIGN_PERCENT_CHANGE";
NSString * const kGTLRMonitoring_Aggregation_PerSeriesAligner_AlignPercentile05 = @"ALIGN_PERCENTILE_05";
NSString * const kGTLRMonitoring_Aggregation_PerSeriesAligner_AlignPercentile50 = @"ALIGN_PERCENTILE_50";
NSString * const kGTLRMonitoring_Aggregation_PerSeriesAligner_AlignPercentile95 = @"ALIGN_PERCENTILE_95";
NSString * const kGTLRMonitoring_Aggregation_PerSeriesAligner_AlignPercentile99 = @"ALIGN_PERCENTILE_99";
NSString * const kGTLRMonitoring_Aggregation_PerSeriesAligner_AlignRate = @"ALIGN_RATE";
NSString * const kGTLRMonitoring_Aggregation_PerSeriesAligner_AlignStddev = @"ALIGN_STDDEV";
NSString * const kGTLRMonitoring_Aggregation_PerSeriesAligner_AlignSum = @"ALIGN_SUM";

// GTLRMonitoring_AlertPolicy.combiner
NSString * const kGTLRMonitoring_AlertPolicy_Combiner_And      = @"AND";
NSString * const kGTLRMonitoring_AlertPolicy_Combiner_AndWithMatchingResource = @"AND_WITH_MATCHING_RESOURCE";
NSString * const kGTLRMonitoring_AlertPolicy_Combiner_CombineUnspecified = @"COMBINE_UNSPECIFIED";
NSString * const kGTLRMonitoring_AlertPolicy_Combiner_Or       = @"OR";

// GTLRMonitoring_CollectdValue.dataSourceType
NSString * const kGTLRMonitoring_CollectdValue_DataSourceType_Absolute = @"ABSOLUTE";
NSString * const kGTLRMonitoring_CollectdValue_DataSourceType_Counter = @"COUNTER";
NSString * const kGTLRMonitoring_CollectdValue_DataSourceType_Derive = @"DERIVE";
NSString * const kGTLRMonitoring_CollectdValue_DataSourceType_Gauge = @"GAUGE";
NSString * const kGTLRMonitoring_CollectdValue_DataSourceType_UnspecifiedDataSourceType = @"UNSPECIFIED_DATA_SOURCE_TYPE";

// GTLRMonitoring_Field.cardinality
NSString * const kGTLRMonitoring_Field_Cardinality_CardinalityOptional = @"CARDINALITY_OPTIONAL";
NSString * const kGTLRMonitoring_Field_Cardinality_CardinalityRepeated = @"CARDINALITY_REPEATED";
NSString * const kGTLRMonitoring_Field_Cardinality_CardinalityRequired = @"CARDINALITY_REQUIRED";
NSString * const kGTLRMonitoring_Field_Cardinality_CardinalityUnknown = @"CARDINALITY_UNKNOWN";

// GTLRMonitoring_Field.kind
NSString * const kGTLRMonitoring_Field_Kind_TypeBool     = @"TYPE_BOOL";
NSString * const kGTLRMonitoring_Field_Kind_TypeBytes    = @"TYPE_BYTES";
NSString * const kGTLRMonitoring_Field_Kind_TypeDouble   = @"TYPE_DOUBLE";
NSString * const kGTLRMonitoring_Field_Kind_TypeEnum     = @"TYPE_ENUM";
NSString * const kGTLRMonitoring_Field_Kind_TypeFixed32  = @"TYPE_FIXED32";
NSString * const kGTLRMonitoring_Field_Kind_TypeFixed64  = @"TYPE_FIXED64";
NSString * const kGTLRMonitoring_Field_Kind_TypeFloat    = @"TYPE_FLOAT";
NSString * const kGTLRMonitoring_Field_Kind_TypeGroup    = @"TYPE_GROUP";
NSString * const kGTLRMonitoring_Field_Kind_TypeInt32    = @"TYPE_INT32";
NSString * const kGTLRMonitoring_Field_Kind_TypeInt64    = @"TYPE_INT64";
NSString * const kGTLRMonitoring_Field_Kind_TypeMessage  = @"TYPE_MESSAGE";
NSString * const kGTLRMonitoring_Field_Kind_TypeSfixed32 = @"TYPE_SFIXED32";
NSString * const kGTLRMonitoring_Field_Kind_TypeSfixed64 = @"TYPE_SFIXED64";
NSString * const kGTLRMonitoring_Field_Kind_TypeSint32   = @"TYPE_SINT32";
NSString * const kGTLRMonitoring_Field_Kind_TypeSint64   = @"TYPE_SINT64";
NSString * const kGTLRMonitoring_Field_Kind_TypeString   = @"TYPE_STRING";
NSString * const kGTLRMonitoring_Field_Kind_TypeUint32   = @"TYPE_UINT32";
NSString * const kGTLRMonitoring_Field_Kind_TypeUint64   = @"TYPE_UINT64";
NSString * const kGTLRMonitoring_Field_Kind_TypeUnknown  = @"TYPE_UNKNOWN";

// GTLRMonitoring_LabelDescriptor.valueType
NSString * const kGTLRMonitoring_LabelDescriptor_ValueType_Bool = @"BOOL";
NSString * const kGTLRMonitoring_LabelDescriptor_ValueType_Int64 = @"INT64";
NSString * const kGTLRMonitoring_LabelDescriptor_ValueType_String = @"STRING";

// GTLRMonitoring_MetricDescriptor.metricKind
NSString * const kGTLRMonitoring_MetricDescriptor_MetricKind_Cumulative = @"CUMULATIVE";
NSString * const kGTLRMonitoring_MetricDescriptor_MetricKind_Delta = @"DELTA";
NSString * const kGTLRMonitoring_MetricDescriptor_MetricKind_Gauge = @"GAUGE";
NSString * const kGTLRMonitoring_MetricDescriptor_MetricKind_MetricKindUnspecified = @"METRIC_KIND_UNSPECIFIED";

// GTLRMonitoring_MetricDescriptor.valueType
NSString * const kGTLRMonitoring_MetricDescriptor_ValueType_Bool = @"BOOL";
NSString * const kGTLRMonitoring_MetricDescriptor_ValueType_Distribution = @"DISTRIBUTION";
NSString * const kGTLRMonitoring_MetricDescriptor_ValueType_Double = @"DOUBLE";
NSString * const kGTLRMonitoring_MetricDescriptor_ValueType_Int64 = @"INT64";
NSString * const kGTLRMonitoring_MetricDescriptor_ValueType_Money = @"MONEY";
NSString * const kGTLRMonitoring_MetricDescriptor_ValueType_String = @"STRING";
NSString * const kGTLRMonitoring_MetricDescriptor_ValueType_ValueTypeUnspecified = @"VALUE_TYPE_UNSPECIFIED";

// GTLRMonitoring_MetricThreshold.comparison
NSString * const kGTLRMonitoring_MetricThreshold_Comparison_ComparisonEq = @"COMPARISON_EQ";
NSString * const kGTLRMonitoring_MetricThreshold_Comparison_ComparisonGe = @"COMPARISON_GE";
NSString * const kGTLRMonitoring_MetricThreshold_Comparison_ComparisonGt = @"COMPARISON_GT";
NSString * const kGTLRMonitoring_MetricThreshold_Comparison_ComparisonLe = @"COMPARISON_LE";
NSString * const kGTLRMonitoring_MetricThreshold_Comparison_ComparisonLt = @"COMPARISON_LT";
NSString * const kGTLRMonitoring_MetricThreshold_Comparison_ComparisonNe = @"COMPARISON_NE";
NSString * const kGTLRMonitoring_MetricThreshold_Comparison_ComparisonUnspecified = @"COMPARISON_UNSPECIFIED";

// GTLRMonitoring_NotificationChannel.verificationStatus
NSString * const kGTLRMonitoring_NotificationChannel_VerificationStatus_Unverified = @"UNVERIFIED";
NSString * const kGTLRMonitoring_NotificationChannel_VerificationStatus_VerificationStatusUnspecified = @"VERIFICATION_STATUS_UNSPECIFIED";
NSString * const kGTLRMonitoring_NotificationChannel_VerificationStatus_Verified = @"VERIFIED";

// GTLRMonitoring_NotificationChannelDescriptor.supportedTiers
NSString * const kGTLRMonitoring_NotificationChannelDescriptor_SupportedTiers_ServiceTierBasic = @"SERVICE_TIER_BASIC";
NSString * const kGTLRMonitoring_NotificationChannelDescriptor_SupportedTiers_ServiceTierPremium = @"SERVICE_TIER_PREMIUM";
NSString * const kGTLRMonitoring_NotificationChannelDescriptor_SupportedTiers_ServiceTierUnspecified = @"SERVICE_TIER_UNSPECIFIED";

// GTLRMonitoring_ResourceGroup.resourceType
NSString * const kGTLRMonitoring_ResourceGroup_ResourceType_AwsElbLoadBalancer = @"AWS_ELB_LOAD_BALANCER";
NSString * const kGTLRMonitoring_ResourceGroup_ResourceType_Instance = @"INSTANCE";
NSString * const kGTLRMonitoring_ResourceGroup_ResourceType_ResourceTypeUnspecified = @"RESOURCE_TYPE_UNSPECIFIED";

// GTLRMonitoring_TimeSeries.metricKind
NSString * const kGTLRMonitoring_TimeSeries_MetricKind_Cumulative = @"CUMULATIVE";
NSString * const kGTLRMonitoring_TimeSeries_MetricKind_Delta   = @"DELTA";
NSString * const kGTLRMonitoring_TimeSeries_MetricKind_Gauge   = @"GAUGE";
NSString * const kGTLRMonitoring_TimeSeries_MetricKind_MetricKindUnspecified = @"METRIC_KIND_UNSPECIFIED";

// GTLRMonitoring_TimeSeries.valueType
NSString * const kGTLRMonitoring_TimeSeries_ValueType_Bool     = @"BOOL";
NSString * const kGTLRMonitoring_TimeSeries_ValueType_Distribution = @"DISTRIBUTION";
NSString * const kGTLRMonitoring_TimeSeries_ValueType_Double   = @"DOUBLE";
NSString * const kGTLRMonitoring_TimeSeries_ValueType_Int64    = @"INT64";
NSString * const kGTLRMonitoring_TimeSeries_ValueType_Money    = @"MONEY";
NSString * const kGTLRMonitoring_TimeSeries_ValueType_String   = @"STRING";
NSString * const kGTLRMonitoring_TimeSeries_ValueType_ValueTypeUnspecified = @"VALUE_TYPE_UNSPECIFIED";

// GTLRMonitoring_Type.syntax
NSString * const kGTLRMonitoring_Type_Syntax_SyntaxProto2 = @"SYNTAX_PROTO2";
NSString * const kGTLRMonitoring_Type_Syntax_SyntaxProto3 = @"SYNTAX_PROTO3";

// GTLRMonitoring_UptimeCheckConfig.selectedRegions
NSString * const kGTLRMonitoring_UptimeCheckConfig_SelectedRegions_AsiaPacific = @"ASIA_PACIFIC";
NSString * const kGTLRMonitoring_UptimeCheckConfig_SelectedRegions_Europe = @"EUROPE";
NSString * const kGTLRMonitoring_UptimeCheckConfig_SelectedRegions_RegionUnspecified = @"REGION_UNSPECIFIED";
NSString * const kGTLRMonitoring_UptimeCheckConfig_SelectedRegions_SouthAmerica = @"SOUTH_AMERICA";
NSString * const kGTLRMonitoring_UptimeCheckConfig_SelectedRegions_Usa = @"USA";

// GTLRMonitoring_UptimeCheckIp.region
NSString * const kGTLRMonitoring_UptimeCheckIp_Region_AsiaPacific = @"ASIA_PACIFIC";
NSString * const kGTLRMonitoring_UptimeCheckIp_Region_Europe   = @"EUROPE";
NSString * const kGTLRMonitoring_UptimeCheckIp_Region_RegionUnspecified = @"REGION_UNSPECIFIED";
NSString * const kGTLRMonitoring_UptimeCheckIp_Region_SouthAmerica = @"SOUTH_AMERICA";
NSString * const kGTLRMonitoring_UptimeCheckIp_Region_Usa      = @"USA";

// ----------------------------------------------------------------------------
//
//   GTLRMonitoring_Aggregation
//

@implementation GTLRMonitoring_Aggregation
@dynamic alignmentPeriod, crossSeriesReducer, groupByFields, perSeriesAligner;

+ (NSDictionary<NSString *, Class> *)arrayPropertyToClassMap {
  NSDictionary<NSString *, Class> *map = @{
    @"groupByFields" : [NSString class]
  };
  return map;
}

@end


// ----------------------------------------------------------------------------
//
//   GTLRMonitoring_AlertPolicy
//

@implementation GTLRMonitoring_AlertPolicy
@dynamic combiner, conditions, creationRecord, displayName, documentation,
         enabled, mutationRecord, name, notificationChannels, userLabels;

+ (NSDictionary<NSString *, Class> *)arrayPropertyToClassMap {
  NSDictionary<NSString *, Class> *map = @{
    @"conditions" : [GTLRMonitoring_Condition class],
    @"notificationChannels" : [NSString class]
  };
  return map;
}

@end


// ----------------------------------------------------------------------------
//
//   GTLRMonitoring_AlertPolicy_UserLabels
//

@implementation GTLRMonitoring_AlertPolicy_UserLabels

+ (Class)classForAdditionalProperties {
  return [NSString class];
}

@end


// ----------------------------------------------------------------------------
//
//   GTLRMonitoring_BasicAuthentication
//

@implementation GTLRMonitoring_BasicAuthentication
@dynamic password, username;
@end


// ----------------------------------------------------------------------------
//
//   GTLRMonitoring_BucketOptions
//

@implementation GTLRMonitoring_BucketOptions
@dynamic explicitBuckets, exponentialBuckets, linearBuckets;
@end


// ----------------------------------------------------------------------------
//
//   GTLRMonitoring_CollectdPayload
//

@implementation GTLRMonitoring_CollectdPayload
@dynamic endTime, metadata, plugin, pluginInstance, startTime, type,
         typeInstance, values;

+ (NSDictionary<NSString *, Class> *)arrayPropertyToClassMap {
  NSDictionary<NSString *, Class> *map = @{
    @"values" : [GTLRMonitoring_CollectdValue class]
  };
  return map;
}

@end


// ----------------------------------------------------------------------------
//
//   GTLRMonitoring_CollectdPayload_Metadata
//

@implementation GTLRMonitoring_CollectdPayload_Metadata

+ (Class)classForAdditionalProperties {
  return [GTLRMonitoring_TypedValue class];
}

@end


// ----------------------------------------------------------------------------
//
//   GTLRMonitoring_CollectdPayloadError
//

@implementation GTLRMonitoring_CollectdPayloadError
@dynamic error, index, valueErrors;

+ (NSDictionary<NSString *, Class> *)arrayPropertyToClassMap {
  NSDictionary<NSString *, Class> *map = @{
    @"valueErrors" : [GTLRMonitoring_CollectdValueError class]
  };
  return map;
}

@end


// ----------------------------------------------------------------------------
//
//   GTLRMonitoring_CollectdValue
//

@implementation GTLRMonitoring_CollectdValue
@dynamic dataSourceName, dataSourceType, value;
@end


// ----------------------------------------------------------------------------
//
//   GTLRMonitoring_CollectdValueError
//

@implementation GTLRMonitoring_CollectdValueError
@dynamic error, index;
@end


// ----------------------------------------------------------------------------
//
//   GTLRMonitoring_Condition
//

@implementation GTLRMonitoring_Condition
@dynamic conditionAbsent, conditionThreshold, displayName, name;
@end


// ----------------------------------------------------------------------------
//
//   GTLRMonitoring_ContentMatcher
//

@implementation GTLRMonitoring_ContentMatcher
@dynamic content;
@end


// ----------------------------------------------------------------------------
//
//   GTLRMonitoring_CreateCollectdTimeSeriesRequest
//

@implementation GTLRMonitoring_CreateCollectdTimeSeriesRequest
@dynamic collectdPayloads, collectdVersion, resource;

+ (NSDictionary<NSString *, Class> *)arrayPropertyToClassMap {
  NSDictionary<NSString *, Class> *map = @{
    @"collectdPayloads" : [GTLRMonitoring_CollectdPayload class]
  };
  return map;
}

@end


// ----------------------------------------------------------------------------
//
//   GTLRMonitoring_CreateCollectdTimeSeriesResponse
//

@implementation GTLRMonitoring_CreateCollectdTimeSeriesResponse
@dynamic payloadErrors;

+ (NSDictionary<NSString *, Class> *)arrayPropertyToClassMap {
  NSDictionary<NSString *, Class> *map = @{
    @"payloadErrors" : [GTLRMonitoring_CollectdPayloadError class]
  };
  return map;
}

@end


// ----------------------------------------------------------------------------
//
//   GTLRMonitoring_CreateTimeSeriesRequest
//

@implementation GTLRMonitoring_CreateTimeSeriesRequest
@dynamic timeSeries;

+ (NSDictionary<NSString *, Class> *)arrayPropertyToClassMap {
  NSDictionary<NSString *, Class> *map = @{
    @"timeSeries" : [GTLRMonitoring_TimeSeries class]
  };
  return map;
}

@end


// ----------------------------------------------------------------------------
//
//   GTLRMonitoring_Distribution
//

@implementation GTLRMonitoring_Distribution
@dynamic bucketCounts, bucketOptions, count, mean, range, sumOfSquaredDeviation;

+ (NSDictionary<NSString *, Class> *)arrayPropertyToClassMap {
  NSDictionary<NSString *, Class> *map = @{
    @"bucketCounts" : [NSNumber class]
  };
  return map;
}

@end


// ----------------------------------------------------------------------------
//
//   GTLRMonitoring_Documentation
//

@implementation GTLRMonitoring_Documentation
@dynamic content, mimeType;
@end


// ----------------------------------------------------------------------------
//
//   GTLRMonitoring_Empty
//

@implementation GTLRMonitoring_Empty
@end


// ----------------------------------------------------------------------------
//
//   GTLRMonitoring_Explicit
//

@implementation GTLRMonitoring_Explicit
@dynamic bounds;

+ (NSDictionary<NSString *, Class> *)arrayPropertyToClassMap {
  NSDictionary<NSString *, Class> *map = @{
    @"bounds" : [NSNumber class]
  };
  return map;
}

@end


// ----------------------------------------------------------------------------
//
//   GTLRMonitoring_Exponential
//

@implementation GTLRMonitoring_Exponential
@dynamic growthFactor, numFiniteBuckets, scale;
@end


// ----------------------------------------------------------------------------
//
//   GTLRMonitoring_Field
//

@implementation GTLRMonitoring_Field
@dynamic cardinality, defaultValue, jsonName, kind, name, number, oneofIndex,
         options, packed, typeUrl;

+ (NSDictionary<NSString *, Class> *)arrayPropertyToClassMap {
  NSDictionary<NSString *, Class> *map = @{
    @"options" : [GTLRMonitoring_Option class]
  };
  return map;
}

+ (BOOL)isKindValidForClassRegistry {
  // This class has a "kind" property that doesn't appear to be usable to
  // determine what type of object was encoded in the JSON.
  return NO;
}

@end


// ----------------------------------------------------------------------------
//
//   GTLRMonitoring_GetNotificationChannelVerificationCodeRequest
//

@implementation GTLRMonitoring_GetNotificationChannelVerificationCodeRequest
@dynamic expireTime;
@end


// ----------------------------------------------------------------------------
//
//   GTLRMonitoring_GetNotificationChannelVerificationCodeResponse
//

@implementation GTLRMonitoring_GetNotificationChannelVerificationCodeResponse
@dynamic code, expireTime;
@end


// ----------------------------------------------------------------------------
//
//   GTLRMonitoring_Group
//

@implementation GTLRMonitoring_Group
@dynamic displayName, filter, isCluster, name, parentName;
@end


// ----------------------------------------------------------------------------
//
//   GTLRMonitoring_HttpCheck
//

@implementation GTLRMonitoring_HttpCheck
@dynamic authInfo, headers, maskHeaders, path, port, useSsl;
@end


// ----------------------------------------------------------------------------
//
//   GTLRMonitoring_HttpCheck_Headers
//

@implementation GTLRMonitoring_HttpCheck_Headers

+ (Class)classForAdditionalProperties {
  return [NSString class];
}

@end


// ----------------------------------------------------------------------------
//
//   GTLRMonitoring_InternalChecker
//

@implementation GTLRMonitoring_InternalChecker
@dynamic checkerId, displayName, gcpZone, network, projectId;
@end


// ----------------------------------------------------------------------------
//
//   GTLRMonitoring_LabelDescriptor
//

@implementation GTLRMonitoring_LabelDescriptor
@dynamic descriptionProperty, key, valueType;

+ (NSDictionary<NSString *, NSString *> *)propertyToJSONKeyMap {
  return @{ @"descriptionProperty" : @"description" };
}

@end


// ----------------------------------------------------------------------------
//
//   GTLRMonitoring_Linear
//

@implementation GTLRMonitoring_Linear
@dynamic numFiniteBuckets, offset, width;
@end


// ----------------------------------------------------------------------------
//
//   GTLRMonitoring_ListAlertPoliciesResponse
//

@implementation GTLRMonitoring_ListAlertPoliciesResponse
@dynamic alertPolicies, nextPageToken;

+ (NSDictionary<NSString *, Class> *)arrayPropertyToClassMap {
  NSDictionary<NSString *, Class> *map = @{
    @"alertPolicies" : [GTLRMonitoring_AlertPolicy class]
  };
  return map;
}

+ (NSString *)collectionItemsKey {
  return @"alertPolicies";
}

@end


// ----------------------------------------------------------------------------
//
//   GTLRMonitoring_ListGroupMembersResponse
//

@implementation GTLRMonitoring_ListGroupMembersResponse
@dynamic members, nextPageToken, totalSize;

+ (NSDictionary<NSString *, Class> *)arrayPropertyToClassMap {
  NSDictionary<NSString *, Class> *map = @{
    @"members" : [GTLRMonitoring_MonitoredResource class]
  };
  return map;
}

+ (NSString *)collectionItemsKey {
  return @"members";
}

@end


// ----------------------------------------------------------------------------
//
//   GTLRMonitoring_ListGroupsResponse
//

@implementation GTLRMonitoring_ListGroupsResponse
@dynamic group, nextPageToken;

+ (NSDictionary<NSString *, Class> *)arrayPropertyToClassMap {
  NSDictionary<NSString *, Class> *map = @{
    @"group" : [GTLRMonitoring_Group class]
  };
  return map;
}

+ (NSString *)collectionItemsKey {
  return @"group";
}

@end


// ----------------------------------------------------------------------------
//
//   GTLRMonitoring_ListMetricDescriptorsResponse
//

@implementation GTLRMonitoring_ListMetricDescriptorsResponse
@dynamic metricDescriptors, nextPageToken;

+ (NSDictionary<NSString *, Class> *)arrayPropertyToClassMap {
  NSDictionary<NSString *, Class> *map = @{
    @"metricDescriptors" : [GTLRMonitoring_MetricDescriptor class]
  };
  return map;
}

+ (NSString *)collectionItemsKey {
  return @"metricDescriptors";
}

@end


// ----------------------------------------------------------------------------
//
//   GTLRMonitoring_ListMonitoredResourceDescriptorsResponse
//

@implementation GTLRMonitoring_ListMonitoredResourceDescriptorsResponse
@dynamic nextPageToken, resourceDescriptors;

+ (NSDictionary<NSString *, Class> *)arrayPropertyToClassMap {
  NSDictionary<NSString *, Class> *map = @{
    @"resourceDescriptors" : [GTLRMonitoring_MonitoredResourceDescriptor class]
  };
  return map;
}

+ (NSString *)collectionItemsKey {
  return @"resourceDescriptors";
}

@end


// ----------------------------------------------------------------------------
//
//   GTLRMonitoring_ListNotificationChannelDescriptorsResponse
//

@implementation GTLRMonitoring_ListNotificationChannelDescriptorsResponse
@dynamic channelDescriptors, nextPageToken;

+ (NSDictionary<NSString *, Class> *)arrayPropertyToClassMap {
  NSDictionary<NSString *, Class> *map = @{
    @"channelDescriptors" : [GTLRMonitoring_NotificationChannelDescriptor class]
  };
  return map;
}

+ (NSString *)collectionItemsKey {
  return @"channelDescriptors";
}

@end


// ----------------------------------------------------------------------------
//
//   GTLRMonitoring_ListNotificationChannelsResponse
//

@implementation GTLRMonitoring_ListNotificationChannelsResponse
@dynamic nextPageToken, notificationChannels;

+ (NSDictionary<NSString *, Class> *)arrayPropertyToClassMap {
  NSDictionary<NSString *, Class> *map = @{
    @"notificationChannels" : [GTLRMonitoring_NotificationChannel class]
  };
  return map;
}

+ (NSString *)collectionItemsKey {
  return @"notificationChannels";
}

@end


// ----------------------------------------------------------------------------
//
//   GTLRMonitoring_ListTimeSeriesResponse
//

@implementation GTLRMonitoring_ListTimeSeriesResponse
@dynamic nextPageToken, timeSeries;

+ (NSDictionary<NSString *, Class> *)arrayPropertyToClassMap {
  NSDictionary<NSString *, Class> *map = @{
    @"timeSeries" : [GTLRMonitoring_TimeSeries class]
  };
  return map;
}

+ (NSString *)collectionItemsKey {
  return @"timeSeries";
}

@end


// ----------------------------------------------------------------------------
//
//   GTLRMonitoring_ListUptimeCheckConfigsResponse
//

@implementation GTLRMonitoring_ListUptimeCheckConfigsResponse
@dynamic nextPageToken, totalSize, uptimeCheckConfigs;

+ (NSDictionary<NSString *, Class> *)arrayPropertyToClassMap {
  NSDictionary<NSString *, Class> *map = @{
    @"uptimeCheckConfigs" : [GTLRMonitoring_UptimeCheckConfig class]
  };
  return map;
}

+ (NSString *)collectionItemsKey {
  return @"uptimeCheckConfigs";
}

@end


// ----------------------------------------------------------------------------
//
//   GTLRMonitoring_ListUptimeCheckIpsResponse
//

@implementation GTLRMonitoring_ListUptimeCheckIpsResponse
@dynamic nextPageToken, uptimeCheckIps;

+ (NSDictionary<NSString *, Class> *)arrayPropertyToClassMap {
  NSDictionary<NSString *, Class> *map = @{
    @"uptimeCheckIps" : [GTLRMonitoring_UptimeCheckIp class]
  };
  return map;
}

+ (NSString *)collectionItemsKey {
  return @"uptimeCheckIps";
}

@end


// ----------------------------------------------------------------------------
//
//   GTLRMonitoring_Metric
//

@implementation GTLRMonitoring_Metric
@dynamic labels, type;
@end


// ----------------------------------------------------------------------------
//
//   GTLRMonitoring_Metric_Labels
//

@implementation GTLRMonitoring_Metric_Labels

+ (Class)classForAdditionalProperties {
  return [NSString class];
}

@end


// ----------------------------------------------------------------------------
//
//   GTLRMonitoring_MetricAbsence
//

@implementation GTLRMonitoring_MetricAbsence
@dynamic aggregations, duration, filter, trigger;

+ (NSDictionary<NSString *, Class> *)arrayPropertyToClassMap {
  NSDictionary<NSString *, Class> *map = @{
    @"aggregations" : [GTLRMonitoring_Aggregation class]
  };
  return map;
}

@end


// ----------------------------------------------------------------------------
//
//   GTLRMonitoring_MetricDescriptor
//

@implementation GTLRMonitoring_MetricDescriptor
@dynamic descriptionProperty, displayName, labels, metricKind, name, type, unit,
         valueType;

+ (NSDictionary<NSString *, NSString *> *)propertyToJSONKeyMap {
  return @{ @"descriptionProperty" : @"description" };
}

+ (NSDictionary<NSString *, Class> *)arrayPropertyToClassMap {
  NSDictionary<NSString *, Class> *map = @{
    @"labels" : [GTLRMonitoring_LabelDescriptor class]
  };
  return map;
}

@end


// ----------------------------------------------------------------------------
//
//   GTLRMonitoring_MetricThreshold
//

@implementation GTLRMonitoring_MetricThreshold
@dynamic aggregations, comparison, denominatorAggregations, denominatorFilter,
         duration, filter, thresholdValue, trigger;

+ (NSDictionary<NSString *, Class> *)arrayPropertyToClassMap {
  NSDictionary<NSString *, Class> *map = @{
    @"aggregations" : [GTLRMonitoring_Aggregation class],
    @"denominatorAggregations" : [GTLRMonitoring_Aggregation class]
  };
  return map;
}

@end


// ----------------------------------------------------------------------------
//
//   GTLRMonitoring_MonitoredResource
//

@implementation GTLRMonitoring_MonitoredResource
@dynamic labels, type;
@end


// ----------------------------------------------------------------------------
//
//   GTLRMonitoring_MonitoredResource_Labels
//

@implementation GTLRMonitoring_MonitoredResource_Labels

+ (Class)classForAdditionalProperties {
  return [NSString class];
}

@end


// ----------------------------------------------------------------------------
//
//   GTLRMonitoring_MonitoredResourceDescriptor
//

@implementation GTLRMonitoring_MonitoredResourceDescriptor
@dynamic descriptionProperty, displayName, labels, name, type;

+ (NSDictionary<NSString *, NSString *> *)propertyToJSONKeyMap {
  return @{ @"descriptionProperty" : @"description" };
}

+ (NSDictionary<NSString *, Class> *)arrayPropertyToClassMap {
  NSDictionary<NSString *, Class> *map = @{
    @"labels" : [GTLRMonitoring_LabelDescriptor class]
  };
  return map;
}

@end


// ----------------------------------------------------------------------------
//
//   GTLRMonitoring_MonitoredResourceMetadata
//

@implementation GTLRMonitoring_MonitoredResourceMetadata
@dynamic systemLabels, userLabels;
@end


// ----------------------------------------------------------------------------
//
//   GTLRMonitoring_MonitoredResourceMetadata_SystemLabels
//

@implementation GTLRMonitoring_MonitoredResourceMetadata_SystemLabels

+ (Class)classForAdditionalProperties {
  return [NSObject class];
}

@end


// ----------------------------------------------------------------------------
//
//   GTLRMonitoring_MonitoredResourceMetadata_UserLabels
//

@implementation GTLRMonitoring_MonitoredResourceMetadata_UserLabels

+ (Class)classForAdditionalProperties {
  return [NSString class];
}

@end


// ----------------------------------------------------------------------------
//
//   GTLRMonitoring_MutationRecord
//

@implementation GTLRMonitoring_MutationRecord
@dynamic mutatedBy, mutateTime;
@end


// ----------------------------------------------------------------------------
//
//   GTLRMonitoring_NotificationChannel
//

@implementation GTLRMonitoring_NotificationChannel
@dynamic descriptionProperty, displayName, enabled, labels, name, type,
         userLabels, verificationStatus;

+ (NSDictionary<NSString *, NSString *> *)propertyToJSONKeyMap {
  return @{ @"descriptionProperty" : @"description" };
}

@end


// ----------------------------------------------------------------------------
//
//   GTLRMonitoring_NotificationChannel_Labels
//

@implementation GTLRMonitoring_NotificationChannel_Labels

+ (Class)classForAdditionalProperties {
  return [NSString class];
}

@end


// ----------------------------------------------------------------------------
//
//   GTLRMonitoring_NotificationChannel_UserLabels
//

@implementation GTLRMonitoring_NotificationChannel_UserLabels

+ (Class)classForAdditionalProperties {
  return [NSString class];
}

@end


// ----------------------------------------------------------------------------
//
//   GTLRMonitoring_NotificationChannelDescriptor
//

@implementation GTLRMonitoring_NotificationChannelDescriptor
@dynamic descriptionProperty, displayName, labels, name, supportedTiers, type;

+ (NSDictionary<NSString *, NSString *> *)propertyToJSONKeyMap {
  return @{ @"descriptionProperty" : @"description" };
}

+ (NSDictionary<NSString *, Class> *)arrayPropertyToClassMap {
  NSDictionary<NSString *, Class> *map = @{
    @"labels" : [GTLRMonitoring_LabelDescriptor class],
    @"supportedTiers" : [NSString class]
  };
  return map;
}

@end


// ----------------------------------------------------------------------------
//
//   GTLRMonitoring_Option
//

@implementation GTLRMonitoring_Option
@dynamic name, value;
@end


// ----------------------------------------------------------------------------
//
//   GTLRMonitoring_Option_Value
//

@implementation GTLRMonitoring_Option_Value

+ (Class)classForAdditionalProperties {
  return [NSObject class];
}

@end


// ----------------------------------------------------------------------------
//
//   GTLRMonitoring_Point
//

@implementation GTLRMonitoring_Point
@dynamic interval, value;
@end


// ----------------------------------------------------------------------------
//
//   GTLRMonitoring_Range
//

@implementation GTLRMonitoring_Range
@dynamic max, min;
@end


// ----------------------------------------------------------------------------
//
//   GTLRMonitoring_ResourceGroup
//

@implementation GTLRMonitoring_ResourceGroup
@dynamic groupId, resourceType;
@end


// ----------------------------------------------------------------------------
//
//   GTLRMonitoring_SendNotificationChannelVerificationCodeRequest
//

@implementation GTLRMonitoring_SendNotificationChannelVerificationCodeRequest
@end


// ----------------------------------------------------------------------------
//
//   GTLRMonitoring_SourceContext
//

@implementation GTLRMonitoring_SourceContext
@dynamic fileName;
@end


// ----------------------------------------------------------------------------
//
//   GTLRMonitoring_Status
//

@implementation GTLRMonitoring_Status
@dynamic code, details, message;

+ (NSDictionary<NSString *, Class> *)arrayPropertyToClassMap {
  NSDictionary<NSString *, Class> *map = @{
    @"details" : [GTLRMonitoring_Status_Details_Item class]
  };
  return map;
}

@end


// ----------------------------------------------------------------------------
//
//   GTLRMonitoring_Status_Details_Item
//

@implementation GTLRMonitoring_Status_Details_Item

+ (Class)classForAdditionalProperties {
  return [NSObject class];
}

@end


// ----------------------------------------------------------------------------
//
//   GTLRMonitoring_TcpCheck
//

@implementation GTLRMonitoring_TcpCheck
@dynamic port;
@end


// ----------------------------------------------------------------------------
//
//   GTLRMonitoring_TimeInterval
//

@implementation GTLRMonitoring_TimeInterval
@dynamic endTime, startTime;
@end


// ----------------------------------------------------------------------------
//
//   GTLRMonitoring_TimeSeries
//

@implementation GTLRMonitoring_TimeSeries
@dynamic metadata, metric, metricKind, points, resource, valueType;

+ (NSDictionary<NSString *, Class> *)arrayPropertyToClassMap {
  NSDictionary<NSString *, Class> *map = @{
    @"points" : [GTLRMonitoring_Point class]
  };
  return map;
}

@end


// ----------------------------------------------------------------------------
//
//   GTLRMonitoring_Trigger
//

@implementation GTLRMonitoring_Trigger
@dynamic count, percent;
@end


// ----------------------------------------------------------------------------
//
//   GTLRMonitoring_Type
//

@implementation GTLRMonitoring_Type
@dynamic fields, name, oneofs, options, sourceContext, syntax;

+ (NSDictionary<NSString *, Class> *)arrayPropertyToClassMap {
  NSDictionary<NSString *, Class> *map = @{
    @"fields" : [GTLRMonitoring_Field class],
    @"oneofs" : [NSString class],
    @"options" : [GTLRMonitoring_Option class]
  };
  return map;
}

@end


// ----------------------------------------------------------------------------
//
//   GTLRMonitoring_TypedValue
//

@implementation GTLRMonitoring_TypedValue
@dynamic boolValue, distributionValue, doubleValue, int64Value, stringValue;
@end


// ----------------------------------------------------------------------------
//
//   GTLRMonitoring_UptimeCheckConfig
//

@implementation GTLRMonitoring_UptimeCheckConfig
@dynamic contentMatchers, displayName, httpCheck, internalCheckers, isInternal,
         monitoredResource, name, period, resourceGroup, selectedRegions,
         tcpCheck, timeout;

+ (NSDictionary<NSString *, Class> *)arrayPropertyToClassMap {
  NSDictionary<NSString *, Class> *map = @{
    @"contentMatchers" : [GTLRMonitoring_ContentMatcher class],
    @"internalCheckers" : [GTLRMonitoring_InternalChecker class],
    @"selectedRegions" : [NSString class]
  };
  return map;
}

@end


// ----------------------------------------------------------------------------
//
//   GTLRMonitoring_UptimeCheckIp
//

@implementation GTLRMonitoring_UptimeCheckIp
@dynamic ipAddress, location, region;
@end


// ----------------------------------------------------------------------------
//
//   GTLRMonitoring_VerifyNotificationChannelRequest
//

@implementation GTLRMonitoring_VerifyNotificationChannelRequest
@dynamic code;
@end