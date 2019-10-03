#import "Persistence.h"

@implementation Persistence

#pragma mark - Core Data stack

@synthesize persistentContainer = _persistentContainer;

- (NSPersistentContainer *)persistentContainer {
  @synchronized (self) {
    if (_persistentContainer == nil) {
      _persistentContainer = [[NSPersistentContainer alloc] initWithName:@"TAApiC"];
      
      [_persistentContainer loadPersistentStoresWithCompletionHandler:^(NSPersistentStoreDescription *storeDescription, NSError *error) {
        NSURL *persistentStoreURL = [[NSFileManager defaultManager] URLForDirectory:NSDocumentDirectory inDomain: NSUserDomainMask appropriateForURL:NULL create:true error:&error];
        storeDescription = [NSPersistentStoreDescription persistentStoreDescriptionWithURL:persistentStoreURL];
        storeDescription.type = NSSQLiteStoreType;
        storeDescription.shouldMigrateStoreAutomatically = true;
        storeDescription.shouldInferMappingModelAutomatically = false;
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
