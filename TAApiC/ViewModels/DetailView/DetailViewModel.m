#import "DetailViewModel.h"

@implementation DetailViewModel

- (void) saveFlight:(NSDictionary *) dict {
  NSError *error;
  _persistence = [[Persistence alloc] init];
  NSPersistentContainer *container = [_persistence persistentContainer];
  NSManagedObjectContext *context = container.viewContext;
  
  NSManagedObject *object = [NSEntityDescription insertNewObjectForEntityForName:@"FlightSchedule" inManagedObjectContext:context];
  [object setValue:dict[@"Airline"] forKey:@"airline"];
  [object setValue:dict[@"ArrivalDest"] forKey:@"arrivalDest"];
  [object setValue:dict[@"ArrivalTime"] forKey:@"arrivalTime"];
  [object setValue:dict[@"DepartDest"] forKey:@"departDest"];
  [object setValue:dict[@"DepartTime"] forKey:@"departTime"];
  [object setValue:dict[@"Duration"] forKey:@"duration"];
  [object setValue:dict[@"FlightNumber"] forKey:@"flightNumber"];
  
  UINavigationController *navVC = (UINavigationController *) UIApplication.sharedApplication.keyWindow.rootViewController;
  if (error != nil) {
    _alertVC = [[AlertViewController alloc] initWithAlertTitle:@"Error, Not Saved!" message:[error localizedDescription]];
    [navVC pushViewController:_alertVC animated:true];
  } else {
    if ([self duplicateCheck:dict]) {
      [context reset];
      _alertVC = [[AlertViewController alloc] initWithAlertTitle:@"Error, Not Saved!" message:@"You try to save a saved flight"];
      [navVC pushViewController:_alertVC animated:true];
    } else {
      _alertVC = [[AlertViewController alloc] initWithAlertTitle:@"Success" message:@"Flight is saved successfully."];
      [navVC pushViewController:_alertVC animated:true];
      [context save:&error];
    }
  }
}

- (BOOL) duplicateCheck:(NSDictionary *) dict {
  BOOL check = false;
  NSFetchRequest *fetchRequest = [NSFetchRequest fetchRequestWithEntityName:@"FlightSchedule"];
  NSError *error;
  _persistence = [[Persistence alloc] init];
  NSPersistentContainer *container = [_persistence persistentContainer];
  NSManagedObjectContext *context = container.viewContext;
  
  NSArray<FlightSchedule *> *array = [context executeFetchRequest:fetchRequest error:&error];
  
  for (FlightSchedule *object in array) {
    if ([dict[@"DepartTime"] isEqualToString:object.departTime] && [dict[@"ArrivalTime"] isEqualToString:object.arrivalTime] && [dict[@"FlightNumber"] isEqualToString:object.flightNumber]) {
      check = true;
      break;
    }
    else {
      check = false;
    }
  }
  return check;
}

@end
