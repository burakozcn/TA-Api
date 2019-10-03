#import "MainViewModel.h"

@implementation MainViewModel

-(instancetype) initVM {
  CoreDataHelper *helper = [[CoreDataHelper alloc] init];
  [helper initStore];
  _searchArray = [[NSArray alloc] init];
  _network = [[NetworkManagement alloc] init];
  return self;
}

-(NSDictionary *)getDict:(NSString *) dept arrive:(NSString *) arrive deptTime:(NSString *) departTime arriveTime:(NSString *) arriveTime {
  
  NSString *dept3 = [dept substringToIndex:3];
  NSString *arrive3 = [arrive substringToIndex:3];
  
  NSDictionary *deptTime = @{ @"WindowAfter": @"P3D",
                              @"WindowBefore": @"P3D",
                              @"Date": departTime
  };
  NSDictionary *deptLoc = @{ @"LocationCode": dept3,
                             @"MultiAirportCityInd": @NO
  };
  NSDictionary *arriveLoc = @{ @"LocationCode": arrive3,
                               @"MultiAirportCityInd": @NO
  };
  NSDictionary *originDestInfo = @{@"DepartureDateTime": deptTime, @"OriginLocation": deptLoc, @"DestinationLocation": arriveLoc };
  NSDictionary *directAndNonStop = @{ @"DirectAndNonStopOnlyInd": @YES
  };
  NSDictionary *ota = @{@"OriginDestinationInformation": originDestInfo, @"AirlineCode": @"TK", @"FlightTypePref" : directAndNonStop };
  NSDictionary *reqHeader = @{ @"clientUsername": @"OPENAPI",
                               @"clientTransactionId": @"CLIENT_TEST_1",
                               @"channel": @"WEB",
                               @"languageCode": @"TR",
                               @"airlineCode": @"TK"
  };
  NSDictionary *dict = @{ @"requestHeader": reqHeader, @"OTA_AirScheduleRQ": ota, @"returnDate": arriveTime, @"scheduleType": @"W", @"tripType": @"R"
  };
  
  return dict;
}

- (NSArray  *)resolveDict: (NSDictionary *)dict isDept: (BOOL)isDept {
  NSMutableArray *nArray = [[NSMutableArray alloc] init];
  if (isDept) {
    nArray = dict[@"data"][@"timeTableOTAResponse"][@"extendedOTAAirScheduleRS"][0][@"OTA_AirScheduleRS"][@"OriginDestinationOptions"][@"OriginDestinationOption"];
  } else {
    nArray = dict[@"data"][@"timeTableOTAResponse"][@"extendedOTAAirScheduleRS"][1][@"OTA_AirScheduleRS"][@"OriginDestinationOptions"][@"OriginDestinationOption"];
  }
  return nArray;
}

- (NSArray *)airportList {
  NSError *error;
  NSMutableArray *airportNames = [NSMutableArray new];
  Persistence *persistence = [[Persistence alloc] init];
  NSFetchRequest *fetchRequest = [NSFetchRequest fetchRequestWithEntityName:@"Airports"];
  NSArray *airports = [[persistence.persistentContainer viewContext] executeFetchRequest:fetchRequest error:&error];
  for (Airports *airport in airports) {
    NSString *dest = airport.dest;
    NSString *plus = [dest stringByAppendingString:@" - "];
    NSString *fullName = [plus stringByAppendingString:airport.name];
    [airportNames insertObject:fullName atIndex:[airports indexOfObject:airport]];
  }
  return airportNames;
}

-(NSArray *)searchAirports:(NSString *)string {
  _searchArray = [[NSArray alloc] init];
  NSArray *airports = [self airportList];
  
  NSPredicate* predicate = [NSPredicate predicateWithFormat:@"SELF CONTAINS[cd] %@", string];
  _searchArray = [airports filteredArrayUsingPredicate:predicate];
  
  return _searchArray;
}

-(void) searchFlights:(NSString *) deptLoc arriveLoc:(NSString *) arriveLoc deptTime:(NSString *) deptTime arriveTime:(NSString *) arriveTime {
  NSDictionary *dict = [self getDict:deptLoc arrive:arriveLoc deptTime:deptTime arriveTime:arriveTime];
  [_network postResults:dict completion:^(NSDictionary *value){
    NSArray *deptFlights = [self resolveDict:value isDept:YES];
    NSArray *arriveFlights = [self resolveDict:value isDept:NO];
    if (deptFlights.count == 0 && arriveFlights.count == 0) {
      NSLog(@"Aglama ne olur");
      [self noFlights];
    } else {
      NSDictionary *dict =  @{ @"Outbund Trip" : deptFlights,
                           @"Inbound Trip" : arriveFlights };
      
      [self flights:dict];
    }
  }];
}

-(void)flights:(NSDictionary *) dict {
  _deptTable = [[DeptTableViewController alloc] initWithDict:dict];
  UIWindow *window = UIApplication.sharedApplication.keyWindow;
  UINavigationController *navVC = (UINavigationController *) window.rootViewController;
  [navVC pushViewController:_deptTable animated:YES];
}

-(void)noFlights {
  _noFlightVC = [[NoFlightViewController alloc] init];
  UIWindow *window = UIApplication.sharedApplication.keyWindow;
  UINavigationController *navVC = (UINavigationController *) window.rootViewController;
  [navVC pushViewController:_noFlightVC animated:YES];
}

-(void) savedSearchTable {
  _saveTableVC = [[SaveTableViewController alloc] init];
  UIWindow *window = UIApplication.sharedApplication.keyWindow;
  UINavigationController *navVC = (UINavigationController *) window.rootViewController;
  [navVC pushViewController:_saveTableVC animated:YES];
}

@end
