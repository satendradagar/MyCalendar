// NOTE: This file was generated by the ServiceGenerator.

// ----------------------------------------------------------------------------
// API:
//   Google Fonts Developer API (webfonts/v1)
// Description:
//   Accesses the metadata for all families served by Google Fonts, providing a
//   list of families currently available (including available styles and a list
//   of supported script subsets).
// Documentation:
//   https://developers.google.com/fonts/docs/developer_api

#import "GTLRWebfonts.h"

@implementation GTLRWebfontsService

- (instancetype)init {
  self = [super init];
  if (self) {
    // From discovery.
    self.rootURLString = @"https://www.googleapis.com/";
    self.servicePath = @"webfonts/v1/";
    self.batchPath = @"batch/webfonts/v1";
    self.prettyPrintQueryParameterNames = @[ @"prettyPrint" ];
  }
  return self;
}

+ (NSDictionary<NSString *, Class> *)kindStringToClassMap {
  return @{
    @"webfonts#webfont" : [GTLRWebfonts_Webfont class],
    @"webfonts#webfontList" : [GTLRWebfonts_WebfontList class],
  };
}

@end
