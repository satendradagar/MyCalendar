// NOTE: This file was generated by the ServiceGenerator.

// ----------------------------------------------------------------------------
// API:
//   YouTube Analytics API (youtubeAnalytics/v1)
// Description:
//   Retrieves your YouTube Analytics data.
// Documentation:
//   http://developers.google.com/youtube/analytics/

#if GTLR_BUILT_AS_FRAMEWORK
  #import "GTLR/GTLRObject.h"
#else
  #import "GTLRObject.h"
#endif

#if GTLR_RUNTIME_VERSION != 3000
#error This file was generated by a different version of ServiceGenerator which is incompatible with this GTLR library source.
#endif

@class GTLRYouTubeAnalytics_Group;
@class GTLRYouTubeAnalytics_Group_ContentDetails;
@class GTLRYouTubeAnalytics_Group_Snippet;
@class GTLRYouTubeAnalytics_GroupItem;
@class GTLRYouTubeAnalytics_GroupItem_Resource;
@class GTLRYouTubeAnalytics_ResultTable_ColumnHeaders_Item;

// Generated comments include content from the discovery document; avoid them
// causing warnings since clang's checks are some what arbitrary.
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wdocumentation"

NS_ASSUME_NONNULL_BEGIN

/**
 *  GTLRYouTubeAnalytics_Group
 */
@interface GTLRYouTubeAnalytics_Group : GTLRObject

@property(nonatomic, strong, nullable) GTLRYouTubeAnalytics_Group_ContentDetails *contentDetails;
@property(nonatomic, copy, nullable) NSString *ETag;

/**
 *  identifier
 *
 *  identifier property maps to 'id' in JSON (to avoid Objective C's 'id').
 */
@property(nonatomic, copy, nullable) NSString *identifier;

@property(nonatomic, copy, nullable) NSString *kind;
@property(nonatomic, strong, nullable) GTLRYouTubeAnalytics_Group_Snippet *snippet;

@end


/**
 *  GTLRYouTubeAnalytics_Group_ContentDetails
 */
@interface GTLRYouTubeAnalytics_Group_ContentDetails : GTLRObject

/**
 *  itemCount
 *
 *  Uses NSNumber of unsignedLongLongValue.
 */
@property(nonatomic, strong, nullable) NSNumber *itemCount;

@property(nonatomic, copy, nullable) NSString *itemType;

@end


/**
 *  GTLRYouTubeAnalytics_Group_Snippet
 */
@interface GTLRYouTubeAnalytics_Group_Snippet : GTLRObject

@property(nonatomic, strong, nullable) GTLRDateTime *publishedAt;
@property(nonatomic, copy, nullable) NSString *title;

@end


/**
 *  GTLRYouTubeAnalytics_GroupItem
 */
@interface GTLRYouTubeAnalytics_GroupItem : GTLRObject

@property(nonatomic, copy, nullable) NSString *ETag;
@property(nonatomic, copy, nullable) NSString *groupId;

/**
 *  identifier
 *
 *  identifier property maps to 'id' in JSON (to avoid Objective C's 'id').
 */
@property(nonatomic, copy, nullable) NSString *identifier;

@property(nonatomic, copy, nullable) NSString *kind;
@property(nonatomic, strong, nullable) GTLRYouTubeAnalytics_GroupItem_Resource *resource;

@end


/**
 *  GTLRYouTubeAnalytics_GroupItem_Resource
 */
@interface GTLRYouTubeAnalytics_GroupItem_Resource : GTLRObject

/**
 *  identifier
 *
 *  identifier property maps to 'id' in JSON (to avoid Objective C's 'id').
 */
@property(nonatomic, copy, nullable) NSString *identifier;

@property(nonatomic, copy, nullable) NSString *kind;

@end


/**
 *  A paginated list of grouList resources returned in response to a
 *  youtubeAnalytics.groupApi.list request.
 *
 *  @note This class supports NSFastEnumeration and indexed subscripting over
 *        its "items" property.
 */
@interface GTLRYouTubeAnalytics_GroupItemListResponse : GTLRCollectionObject

@property(nonatomic, copy, nullable) NSString *ETag;

/**
 *  items
 *
 *  @note This property is used to support NSFastEnumeration and indexed
 *        subscripting on this class.
 */
@property(nonatomic, strong, nullable) NSArray<GTLRYouTubeAnalytics_GroupItem *> *items;

@property(nonatomic, copy, nullable) NSString *kind;

@end


/**
 *  A paginated list of grouList resources returned in response to a
 *  youtubeAnalytics.groupApi.list request.
 *
 *  @note This class supports NSFastEnumeration and indexed subscripting over
 *        its "items" property. If returned as the result of a query, it should
 *        support automatic pagination (when @c shouldFetchNextPages is
 *        enabled).
 */
@interface GTLRYouTubeAnalytics_GroupListResponse : GTLRCollectionObject

@property(nonatomic, copy, nullable) NSString *ETag;

/**
 *  items
 *
 *  @note This property is used to support NSFastEnumeration and indexed
 *        subscripting on this class.
 */
@property(nonatomic, strong, nullable) NSArray<GTLRYouTubeAnalytics_Group *> *items;

@property(nonatomic, copy, nullable) NSString *kind;
@property(nonatomic, copy, nullable) NSString *nextPageToken;

@end


/**
 *  Contains a single result table. The table is returned as an array of rows
 *  that contain the values for the cells of the table. Depending on the metric
 *  or dimension, the cell can contain a string (video ID, country code) or a
 *  number (number of views or number of likes).
 */
@interface GTLRYouTubeAnalytics_ResultTable : GTLRObject

/**
 *  This value specifies information about the data returned in the rows fields.
 *  Each item in the columnHeaders list identifies a field returned in the rows
 *  value, which contains a list of comma-delimited data. The columnHeaders list
 *  will begin with the dimensions specified in the API request, which will be
 *  followed by the metrics specified in the API request. The order of both
 *  dimensions and metrics will match the ordering in the API request. For
 *  example, if the API request contains the parameters
 *  dimensions=ageGroup,gender&metrics=viewerPercentage, the API response will
 *  return columns in this order: ageGroup,gender,viewerPercentage.
 */
@property(nonatomic, strong, nullable) NSArray<GTLRYouTubeAnalytics_ResultTable_ColumnHeaders_Item *> *columnHeaders;

/**
 *  This value specifies the type of data included in the API response. For the
 *  query method, the kind property value will be youtubeAnalytics#resultTable.
 */
@property(nonatomic, copy, nullable) NSString *kind;

/**
 *  The list contains all rows of the result table. Each item in the list is an
 *  array that contains comma-delimited data corresponding to a single row of
 *  data. The order of the comma-delimited data fields will match the order of
 *  the columns listed in the columnHeaders field. If no data is available for
 *  the given query, the rows element will be omitted from the response. The
 *  response for a query with the day dimension will not contain rows for the
 *  most recent days.
 *
 *  Can be any valid JSON type.
 */
@property(nonatomic, strong, nullable) NSArray<NSArray *> *rows;

@end


/**
 *  GTLRYouTubeAnalytics_ResultTable_ColumnHeaders_Item
 */
@interface GTLRYouTubeAnalytics_ResultTable_ColumnHeaders_Item : GTLRObject

/** The type of the column (DIMENSION or METRIC). */
@property(nonatomic, copy, nullable) NSString *columnType;

/** The type of the data in the column (STRING, INTEGER, FLOAT, etc.). */
@property(nonatomic, copy, nullable) NSString *dataType;

/** The name of the dimension or metric. */
@property(nonatomic, copy, nullable) NSString *name;

@end

NS_ASSUME_NONNULL_END

#pragma clang diagnostic pop