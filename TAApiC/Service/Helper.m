#import "Helper.h"

@implementation Helper

+(NSDictionary *)getDict {
  
  NSDictionary *deptTime = @{ @"WindowAfter": @"P3D",
                              @"WindowBefore": @"P3D",
                              @"Date": @"2019-09-05"
                              };
  NSDictionary *orgLoc = @{ @"LocationCode": @"IST",
                            @"MultiAirportCityInd": @YES
                            };
  NSDictionary *destLoc = @{ @"LocationCode": @"ESB",
                             @"MultiAirportCityInd": @NO
                             };
  NSDictionary *originDestInfo = @{@"DepartureDateTime": deptTime, @"OriginLocation": orgLoc, @"DestinationLocation": destLoc };
  NSDictionary *directAndNonStop = @{ @"DirectAndNonStopOnlyInd": @NO
                                      };
  NSDictionary *ota = @{@"OriginDestinationInformation": originDestInfo, @"AirlineCode": @"TK", @"FlightTypePref" : directAndNonStop };
  NSDictionary *reqHeader = @{ @"clientUsername": @"OPENAPI",
                               @"clientTransactionId": @"CLIENT_TEST_1",
                               @"channel": @"WEB",
                               @"languageCode": @"TR",
                               @"airlineCode": @"TK"
                               };
  NSDictionary *dict = @{ @"requestHeader": reqHeader, @"OTA_AirScheduleRQ": ota, @"returnDate": @"2019-09-09", @"scheduleType": @"W", @"tripType": @"R"
                          };
  
  return dict;
}

+(NSArray  *)resolveDict: (NSDictionary *)dict  {
  
  NSMutableArray *nArray = dict[@"data"][@"timeTableOTAResponse"][@"extendedOTAAirScheduleRS"][0][@"OTA_AirScheduleRS"][@"OriginDestinationOptions"][@"OriginDestinationOption"];
  
  return nArray;
}
  @end
