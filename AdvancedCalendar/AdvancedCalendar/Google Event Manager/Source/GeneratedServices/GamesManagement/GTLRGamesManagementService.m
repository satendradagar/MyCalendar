// NOTE: This file was generated by the ServiceGenerator.

// ----------------------------------------------------------------------------
// API:
//   Google Play Game Services Management API (gamesManagement/v1management)
// Description:
//   The Management API for Google Play Game Services.
// Documentation:
//   https://developers.google.com/games/services

#import "GTLRGamesManagement.h"

// ----------------------------------------------------------------------------
// Authorization scopes

NSString * const kGTLRAuthScopeGamesManagementGames     = @"https://www.googleapis.com/auth/games";
NSString * const kGTLRAuthScopeGamesManagementPlusLogin = @"https://www.googleapis.com/auth/plus.login";

// ----------------------------------------------------------------------------
//   GTLRGamesManagementService
//

@implementation GTLRGamesManagementService

- (instancetype)init {
  self = [super init];
  if (self) {
    // From discovery.
    self.rootURLString = @"https://www.googleapis.com/";
    self.servicePath = @"games/v1management/";
    self.batchPath = @"batch/gamesManagement/v1management";
    self.prettyPrintQueryParameterNames = @[ @"prettyPrint" ];
  }
  return self;
}

+ (NSDictionary<NSString *, Class> *)kindStringToClassMap {
  return @{
    @"gamesManagement#achievementResetAllResponse" : [GTLRGamesManagement_AchievementResetAllResponse class],
    @"gamesManagement#achievementResetMultipleForAllRequest" : [GTLRGamesManagement_AchievementResetMultipleForAllRequest class],
    @"gamesManagement#achievementResetResponse" : [GTLRGamesManagement_AchievementResetResponse class],
    @"gamesManagement#eventsResetMultipleForAllRequest" : [GTLRGamesManagement_EventsResetMultipleForAllRequest class],
    @"gamesManagement#hiddenPlayer" : [GTLRGamesManagement_HiddenPlayer class],
    @"gamesManagement#hiddenPlayerList" : [GTLRGamesManagement_HiddenPlayerList class],
    @"gamesManagement#player" : [GTLRGamesManagement_Player class],
    @"gamesManagement#playerScoreResetAllResponse" : [GTLRGamesManagement_PlayerScoreResetAllResponse class],
    @"gamesManagement#playerScoreResetResponse" : [GTLRGamesManagement_PlayerScoreResetResponse class],
    @"gamesManagement#profileSettings" : [GTLRGamesManagement_ProfileSettings class],
    @"gamesManagement#questsResetMultipleForAllRequest" : [GTLRGamesManagement_QuestsResetMultipleForAllRequest class],
    @"gamesManagement#scoresResetMultipleForAllRequest" : [GTLRGamesManagement_ScoresResetMultipleForAllRequest class],
  };
}

@end