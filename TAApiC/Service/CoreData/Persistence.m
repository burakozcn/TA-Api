#import "Persistence.h"

@implementation Persistence

#pragma mark - Core Data stack

@synthesize persistentContainer = _persistentContainer;

- (NSPersistentContainer *)persistentContainer {
  // The persistent container for the application. This implementation creates and returns a container, having loaded the store for the application to it.
  @synchronized (self) {
    if (_persistentContainer == nil) {
      _persistentContainer = [[NSPersistentContainer alloc] initWithName:@"TAApiC"];
      [_persistentContainer loadPersistentStoresWithCompletionHandler:^(NSPersistentStoreDescription *storeDescription, NSError *error) {
        if (error != nil) {

          NSLog(@"Unresolved error %@, %@", error, error.userInfo);
          abort();
        }
      }];
    }
  }
  
  return _persistentContainer;
}

#pragma mark - Core Data Saving support

- (void)saveContext {
  NSManagedObjectContext *context = self.persistentContainer.viewContext;
  NSError *error = nil;
  if ([context hasChanges] && ![context save:&error]) {
    NSLog(@"Unresolved error %@, %@", error, error.userInfo);
    abort();
  }
}


@end
