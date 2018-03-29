// NOTE: This file was generated by the ServiceGenerator.

// ----------------------------------------------------------------------------
// API:
//   Prediction API (prediction/v1.6)
// Description:
//   Lets you access a cloud hosted machine learning service that makes it easy
//   to build smart apps
// Documentation:
//   https://developers.google.com/prediction/docs/developer-guide

#if GTLR_BUILT_AS_FRAMEWORK
  #import "GTLR/GTLRQuery.h"
#else
  #import "GTLRQuery.h"
#endif

#if GTLR_RUNTIME_VERSION != 3000
#error This file was generated by a different version of ServiceGenerator which is incompatible with this GTLR library source.
#endif

@class GTLRPrediction_Input;
@class GTLRPrediction_Insert;
@class GTLRPrediction_Update;

// Generated comments include content from the discovery document; avoid them
// causing warnings since clang's checks are some what arbitrary.
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wdocumentation"

NS_ASSUME_NONNULL_BEGIN

/**
 *  Parent class for other Prediction query classes.
 */
@interface GTLRPredictionQuery : GTLRQuery

/** Selector specifying which fields to include in a partial response. */
@property(nonatomic, copy, nullable) NSString *fields;

@end

/**
 *  Submit input and request an output against a hosted model.
 *
 *  Method: prediction.hostedmodels.predict
 *
 *  Authorization scope(s):
 *    @c kGTLRAuthScopePrediction
 *    @c kGTLRAuthScopePredictionCloudPlatform
 */
@interface GTLRPredictionQuery_HostedmodelsPredict : GTLRPredictionQuery
// Previous library name was
//   +[GTLQueryPrediction queryForHostedmodelsPredictWithObject:project:hostedModelName:]

/** The name of a hosted model. */
@property(nonatomic, copy, nullable) NSString *hostedModelName;

/** The project associated with the model. */
@property(nonatomic, copy, nullable) NSString *project;

/**
 *  Fetches a @c GTLRPrediction_Output.
 *
 *  Submit input and request an output against a hosted model.
 *
 *  @param object The @c GTLRPrediction_Input to include in the query.
 *  @param project The project associated with the model.
 *  @param hostedModelName The name of a hosted model.
 *
 *  @returns GTLRPredictionQuery_HostedmodelsPredict
 */
+ (instancetype)queryWithObject:(GTLRPrediction_Input *)object
                        project:(NSString *)project
                hostedModelName:(NSString *)hostedModelName;

@end

/**
 *  Get analysis of the model and the data the model was trained on.
 *
 *  Method: prediction.trainedmodels.analyze
 *
 *  Authorization scope(s):
 *    @c kGTLRAuthScopePrediction
 *    @c kGTLRAuthScopePredictionCloudPlatform
 */
@interface GTLRPredictionQuery_TrainedmodelsAnalyze : GTLRPredictionQuery
// Previous library name was
//   +[GTLQueryPrediction queryForTrainedmodelsAnalyzeWithproject:identifier:]

/**
 *  The unique name for the predictive model.
 *
 *  identifier property maps to 'id' in JSON (to avoid Objective C's 'id').
 */
@property(nonatomic, copy, nullable) NSString *identifier;

/** The project associated with the model. */
@property(nonatomic, copy, nullable) NSString *project;

/**
 *  Fetches a @c GTLRPrediction_Analyze.
 *
 *  Get analysis of the model and the data the model was trained on.
 *
 *  @param project The project associated with the model.
 *  @param identifier The unique name for the predictive model.
 *
 *  @returns GTLRPredictionQuery_TrainedmodelsAnalyze
 */
+ (instancetype)queryWithProject:(NSString *)project
                      identifier:(NSString *)identifier;

@end

/**
 *  Delete a trained model.
 *
 *  Method: prediction.trainedmodels.delete
 *
 *  Authorization scope(s):
 *    @c kGTLRAuthScopePrediction
 *    @c kGTLRAuthScopePredictionCloudPlatform
 */
@interface GTLRPredictionQuery_TrainedmodelsDelete : GTLRPredictionQuery
// Previous library name was
//   +[GTLQueryPrediction queryForTrainedmodelsDeleteWithproject:identifier:]

/**
 *  The unique name for the predictive model.
 *
 *  identifier property maps to 'id' in JSON (to avoid Objective C's 'id').
 */
@property(nonatomic, copy, nullable) NSString *identifier;

/** The project associated with the model. */
@property(nonatomic, copy, nullable) NSString *project;

/**
 *  Upon successful completion, the callback's object and error parameters will
 *  be nil. This query does not fetch an object.
 *
 *  Delete a trained model.
 *
 *  @param project The project associated with the model.
 *  @param identifier The unique name for the predictive model.
 *
 *  @returns GTLRPredictionQuery_TrainedmodelsDelete
 */
+ (instancetype)queryWithProject:(NSString *)project
                      identifier:(NSString *)identifier;

@end

/**
 *  Check training status of your model.
 *
 *  Method: prediction.trainedmodels.get
 *
 *  Authorization scope(s):
 *    @c kGTLRAuthScopePrediction
 *    @c kGTLRAuthScopePredictionCloudPlatform
 */
@interface GTLRPredictionQuery_TrainedmodelsGet : GTLRPredictionQuery
// Previous library name was
//   +[GTLQueryPrediction queryForTrainedmodelsGetWithproject:identifier:]

/**
 *  The unique name for the predictive model.
 *
 *  identifier property maps to 'id' in JSON (to avoid Objective C's 'id').
 */
@property(nonatomic, copy, nullable) NSString *identifier;

/** The project associated with the model. */
@property(nonatomic, copy, nullable) NSString *project;

/**
 *  Fetches a @c GTLRPrediction_Insert2.
 *
 *  Check training status of your model.
 *
 *  @param project The project associated with the model.
 *  @param identifier The unique name for the predictive model.
 *
 *  @returns GTLRPredictionQuery_TrainedmodelsGet
 */
+ (instancetype)queryWithProject:(NSString *)project
                      identifier:(NSString *)identifier;

@end

/**
 *  Train a Prediction API model.
 *
 *  Method: prediction.trainedmodels.insert
 *
 *  Authorization scope(s):
 *    @c kGTLRAuthScopePrediction
 *    @c kGTLRAuthScopePredictionCloudPlatform
 *    @c kGTLRAuthScopePredictionDevstorageFullControl
 *    @c kGTLRAuthScopePredictionDevstorageReadOnly
 *    @c kGTLRAuthScopePredictionDevstorageReadWrite
 */
@interface GTLRPredictionQuery_TrainedmodelsInsert : GTLRPredictionQuery
// Previous library name was
//   +[GTLQueryPrediction queryForTrainedmodelsInsertWithObject:project:]

/** The project associated with the model. */
@property(nonatomic, copy, nullable) NSString *project;

/**
 *  Fetches a @c GTLRPrediction_Insert2.
 *
 *  Train a Prediction API model.
 *
 *  @param object The @c GTLRPrediction_Insert to include in the query.
 *  @param project The project associated with the model.
 *
 *  @returns GTLRPredictionQuery_TrainedmodelsInsert
 */
+ (instancetype)queryWithObject:(GTLRPrediction_Insert *)object
                        project:(NSString *)project;

@end

/**
 *  List available models.
 *
 *  Method: prediction.trainedmodels.list
 *
 *  Authorization scope(s):
 *    @c kGTLRAuthScopePrediction
 *    @c kGTLRAuthScopePredictionCloudPlatform
 */
@interface GTLRPredictionQuery_TrainedmodelsList : GTLRPredictionQuery
// Previous library name was
//   +[GTLQueryPrediction queryForTrainedmodelsListWithproject:]

/** Maximum number of results to return. */
@property(nonatomic, assign) NSUInteger maxResults;

/** Pagination token. */
@property(nonatomic, copy, nullable) NSString *pageToken;

/** The project associated with the model. */
@property(nonatomic, copy, nullable) NSString *project;

/**
 *  Fetches a @c GTLRPrediction_List.
 *
 *  List available models.
 *
 *  @param project The project associated with the model.
 *
 *  @returns GTLRPredictionQuery_TrainedmodelsList
 *
 *  @note Automatic pagination will be done when @c shouldFetchNextPages is
 *        enabled. See @c shouldFetchNextPages on @c GTLRService for more
 *        information.
 */
+ (instancetype)queryWithProject:(NSString *)project;

@end

/**
 *  Submit model id and request a prediction.
 *
 *  Method: prediction.trainedmodels.predict
 *
 *  Authorization scope(s):
 *    @c kGTLRAuthScopePrediction
 *    @c kGTLRAuthScopePredictionCloudPlatform
 */
@interface GTLRPredictionQuery_TrainedmodelsPredict : GTLRPredictionQuery
// Previous library name was
//   +[GTLQueryPrediction queryForTrainedmodelsPredictWithObject:project:identifier:]

/**
 *  The unique name for the predictive model.
 *
 *  identifier property maps to 'id' in JSON (to avoid Objective C's 'id').
 */
@property(nonatomic, copy, nullable) NSString *identifier;

/** The project associated with the model. */
@property(nonatomic, copy, nullable) NSString *project;

/**
 *  Fetches a @c GTLRPrediction_Output.
 *
 *  Submit model id and request a prediction.
 *
 *  @param object The @c GTLRPrediction_Input to include in the query.
 *  @param project The project associated with the model.
 *  @param identifier The unique name for the predictive model.
 *
 *  @returns GTLRPredictionQuery_TrainedmodelsPredict
 */
+ (instancetype)queryWithObject:(GTLRPrediction_Input *)object
                        project:(NSString *)project
                     identifier:(NSString *)identifier;

@end

/**
 *  Add new data to a trained model.
 *
 *  Method: prediction.trainedmodels.update
 *
 *  Authorization scope(s):
 *    @c kGTLRAuthScopePrediction
 *    @c kGTLRAuthScopePredictionCloudPlatform
 */
@interface GTLRPredictionQuery_TrainedmodelsUpdate : GTLRPredictionQuery
// Previous library name was
//   +[GTLQueryPrediction queryForTrainedmodelsUpdateWithObject:project:identifier:]

/**
 *  The unique name for the predictive model.
 *
 *  identifier property maps to 'id' in JSON (to avoid Objective C's 'id').
 */
@property(nonatomic, copy, nullable) NSString *identifier;

/** The project associated with the model. */
@property(nonatomic, copy, nullable) NSString *project;

/**
 *  Fetches a @c GTLRPrediction_Insert2.
 *
 *  Add new data to a trained model.
 *
 *  @param object The @c GTLRPrediction_Update to include in the query.
 *  @param project The project associated with the model.
 *  @param identifier The unique name for the predictive model.
 *
 *  @returns GTLRPredictionQuery_TrainedmodelsUpdate
 */
+ (instancetype)queryWithObject:(GTLRPrediction_Update *)object
                        project:(NSString *)project
                     identifier:(NSString *)identifier;

@end

NS_ASSUME_NONNULL_END

#pragma clang diagnostic pop
