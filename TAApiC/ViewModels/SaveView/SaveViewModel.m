#import "SaveViewModel.h"

@implementation SaveViewModel

-(NSArray *) savedFlightFetch {
  NSFetchRequest *fetchRequest = [NSFetchRequest fetchRequestWithEntityName:@"FlightSchedule"];
  NSError *error;
  _persistence = [[Persistence alloc] init];
  NSPersistentContainer *container = [_persistence persistentContainer];
  NSManagedObjectContext *context = container.viewContext;
  
  NSArray<FlightSchedule *> *array = [context executeFetchRequest:fetchRequest error:&error];
  return array;
}

-(void) deleteFlight:(NSDictionary *) dict {
  NSError *error;
  _persistence = [[Persistence alloc] init];
  NSPersistentContainer *container = [_persistence persistentContainer];
  NSManagedObjectContext *context = container.viewContext;
  
  NSFetchRequest *fetchRequest = [NSFetchRequest fetchRequestWithEntityName:@"FlightSchedule"];
  NSPredicate *departTimeCheck = [NSPredicate predicateWithFormat:@"departTime ==[c] %@", dict[@"DepartTime"]];
  NSPredicate *arrivalTimeCheck = [NSPredicate predicateWithFormat:@"arrivalTime ==[c] %@", dict[@"ArrivalTime"]];
  NSPredicate *flightNumberCheck = [NSPredicate predicateWithFormat:@"flightNumber ==[c] %@", dict[@"FlightNumber"]];
  NSPredicate *predicate = [NSCompoundPredicate andPredicateWithSubpredicates:@[departTimeCheck, arrivalTimeCheck, flightNumberCheck]];
  fetchRequest.predicate = predicate;
  NSArray<NSManagedObject *> *flights = [context executeFetchRequest:fetchRequest error:&error];
  UINavigationController *navVC = (UINavigationController *) UIApplication.sharedApplication.keyWindow.rootViewController;
  if (error != nil) {
    _deleteVC = [[DeleteViewController alloc] initWithAlertTitle:@"Error!" message:error.localizedDescription];
    [navVC pushViewController:_deleteVC animated:true];
  } else {
    for (NSManagedObject *flight in flights) {
      [context deleteObject:flight];
      if (![context save:&error]) {
        _deleteVC = [[DeleteViewController alloc] initWithAlertTitle:@"Error!" message:error.localizedDescription];
        [navVC pushViewController:_deleteVC animated:true];
      } else {
        _deleteVC = [[DeleteViewController alloc] initWithAlertTitle:@"Success!" message:@"Flight has been deleted successfully!"];
        [navVC pushViewController:_deleteVC animated:true];
      }
    }
  }
}

@end
